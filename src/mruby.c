#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mruby.h"
#include "mruby/array.h"
#include "mruby/compile.h"
#include "mruby/dump.h"
#include "mruby/variable.h"
#include "mruby/compile.h"
#include "mruby/value.h"
#include "mruby/string.h"

#ifdef MRB_DISABLE_STDIO
static void
p(mrb_state *mrb, mrb_value obj)
{
  mrb_value val = mrb_inspect(mrb, obj);

  fwrite(RSTRING_PTR(val), RSTRING_LEN(val), 1, stdout);
  putc('\n', stdout);
}
#else
#define p(mrb,obj) mrb_p(mrb,obj)
#endif

struct _args {
  FILE *rfp;
  char* cmdline;
  mrb_bool fname        : 1;
  mrb_bool mrbfile      : 1;
  mrb_bool check_syntax : 1;
  mrb_bool verbose      : 1;
  int argc;
  char** argv;
};

static void
usage(const char *name)
{
  static const char *const usage_msg[] = {
  "switches:",
  "-b           load and execute RiteBinary (mrb) file",
  "-c           check syntax only",
  "-e 'command' one line of script",
  "-v           print version number, then run in verbose mode",
  "--verbose    run in verbose mode",
  "--version    print the version",
  "--copyright  print the copyright",
  NULL
  };
  const char *const *p = usage_msg;

  printf("Usage: %s [switches] programfile\n", name);
  while (*p)
    printf("  %s\n", *p++);
}

static int
parse_args(mrb_state *mrb, int argc, char **argv, struct _args *args)
{
  char **origargv = argv;
  static const struct _args args_zero = { 0 };

  *args = args_zero;

  for (argc--,argv++; argc > 0; argc--,argv++) {
    char *item;
    if (argv[0][0] != '-') break;

    if (strlen(*argv) <= 1) {
      argc--; argv++;
      args->rfp = stdin;
      break;
    }

    item = argv[0] + 1;
    switch (*item++) {
    case 'b':
      args->mrbfile = TRUE;
      break;
    case 'c':
      args->check_syntax = TRUE;
      break;
    case 'e':
      if (item[0]) {
        goto append_cmdline;
      }
      else if (argc > 1) {
        argc--; argv++;
        item = argv[0];
append_cmdline:
        if (!args->cmdline) {
          size_t buflen;
          char *buf;

          buflen = strlen(item) + 1;
          buf = (char *)mrb_malloc(mrb, buflen);
          memcpy(buf, item, buflen);
          args->cmdline = buf;
        }
        else {
          size_t cmdlinelen;
          size_t itemlen;

          cmdlinelen = strlen(args->cmdline);
          itemlen = strlen(item);
          args->cmdline =
            (char *)mrb_realloc(mrb, args->cmdline, cmdlinelen + itemlen + 2);
          args->cmdline[cmdlinelen] = '\n';
          memcpy(args->cmdline + cmdlinelen + 1, item, itemlen + 1);
        }
      }
      else {
        printf("%s: No code specified for -e\n", *origargv);
        return EXIT_SUCCESS;
      }
      break;
    case 'v':
      if (!args->verbose) mrb_show_version(mrb);
      args->verbose = TRUE;
      break;
    case '-':
      if (strcmp((*argv) + 2, "version") == 0) {
        mrb_show_version(mrb);
      }
      else if (strcmp((*argv) + 2, "verbose") == 0) {
        args->verbose = TRUE;
        break;
      }
      else if (strcmp((*argv) + 2, "copyright") == 0) {
        mrb_show_copyright(mrb);
      }
    default:
      return EXIT_FAILURE;
    }
  }

  if (args->rfp == NULL && args->cmdline == NULL) {
    if (*argv == NULL) args->rfp = stdin;
    else {
      args->rfp = fopen(argv[0], args->mrbfile ? "rb" : "r");
      if (args->rfp == NULL) {
        printf("%s: Cannot open program file. (%s)\n", *origargv, *argv);
        return EXIT_FAILURE;
      }
      args->fname = TRUE;
      args->cmdline = argv[0];
      argc--; argv++;
    }
  }
  args->argv = (char **)mrb_realloc(mrb, args->argv, sizeof(char*) * (argc + 1));
  memcpy(args->argv, argv, (argc+1) * sizeof(char*));
  args->argc = argc;

  return EXIT_SUCCESS;
}

static void
cleanup(mrb_state *mrb, struct _args *args)
{
  if (args->rfp && args->rfp != stdin)
    fclose(args->rfp);
  if (!args->fname)
    mrb_free(mrb, args->cmdline);
  mrb_free(mrb, args->argv);
  mrb_close(mrb);
}

mrb_value
mrb_mruby_cli_mruby(mrb_state *mrb, mrb_value klass)
{
  int n = -1;
  int i;
  char *argv[255];
  struct _args args;
  mrb_value ARGV;
  mrbc_context *c;
  mrb_value v, array, element;
  mrb_sym zero_sym;
  mrb_int argc;
  mrb_state *mrb2 = mrb_open();

  mrb_get_args(mrb, "io", &argc, &array);

  for (i = 0; i < argc; i++) {
    element = mrb_ary_shift(mrb, array);
    argv[i] = RSTRING_PTR(element);
  }

  if (mrb2 == NULL) {
    fputs("Invalid mrb_state, exiting mruby\n", stderr);
    return mrb_fixnum_value(EXIT_FAILURE);
  }

  n = parse_args(mrb2, argc, argv, &args);
  if (n == EXIT_FAILURE || (args.cmdline == NULL && args.rfp == NULL)) {
    cleanup(mrb2, &args);
    usage(argv[0]);
    return mrb_fixnum_value(n);
  }
  else {
    int ai = mrb_gc_arena_save(mrb2);
    ARGV = mrb_ary_new_capa(mrb2, args.argc);
    for (i = 0; i < args.argc; i++) {
      char* utf8 = mrb_utf8_from_locale(args.argv[i], -1);
      if (utf8) {
        mrb_ary_push(mrb2, ARGV, mrb_str_new_cstr(mrb, utf8));
        mrb_utf8_free(utf8);
      }
    }
    mrb_define_global_const(mrb2, "ARGV", ARGV);

    c = mrbc_context_new(mrb2);
    if (args.verbose)
      c->dump_result = TRUE;
    if (args.check_syntax)
      c->no_exec = TRUE;

    /* Set $0 */
    zero_sym = mrb_intern_lit(mrb2, "$0");
    if (args.rfp) {
      const char *cmdline;
      cmdline = args.cmdline ? args.cmdline : "-";
      mrbc_filename(mrb2, c, cmdline);
      mrb_gv_set(mrb2, zero_sym, mrb_str_new_cstr(mrb2, cmdline));
    }
    else {
      mrbc_filename(mrb2, c, "-e");
      mrb_gv_set(mrb2, zero_sym, mrb_str_new_lit(mrb2, "-e"));
    }

    /* Load program */
    if (args.mrbfile) {
      v = mrb_load_irep_file_cxt(mrb2, args.rfp, c);
    }
    else if (args.rfp) {
      v = mrb_load_file_cxt(mrb2, args.rfp, c);
    }
    else {
      char* utf8 = mrb_utf8_from_locale(args.cmdline, -1);
      if (!utf8) abort();
      v = mrb_load_string_cxt(mrb2, utf8, c);
      mrb_utf8_free(utf8);
    }

    mrb_gc_arena_restore(mrb2, ai);
    mrbc_context_free(mrb2, c);
    if (mrb2->exc) {
      if (mrb_undef_p(v)) {
        mrb_p(mrb2, mrb_obj_value(mrb2->exc));
      }
      else {
        mrb_print_error(mrb2);
      }
      n = -1;
    }
    else if (args.check_syntax) {
      printf("Syntax OK\n");
    }
  }
  cleanup(mrb2, &args);

  return n == 0 ? mrb_fixnum_value(EXIT_SUCCESS) : mrb_fixnum_value(EXIT_FAILURE);
}
