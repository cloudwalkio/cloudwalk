def gem_config(conf)
  if conf.cc.search_header_path 'readline/readline.h'
    conf.cc.defines << "ENABLE_READLINE"
    if conf.cc.search_header_path 'termcap.h'
      if MRUBY_BUILD_HOST_IS_CYGWIN || MRUBY_BUILD_HOST_IS_OPENBSD
        if conf.cc.search_header_path 'termcap.h'
          if MRUBY_BUILD_HOST_IS_CYGWIN then
            conf.linker.libraries << 'ncurses'
          else
            conf.linker.libraries << 'termcap'
          end
        end
      end
    end
    if RUBY_PLATFORM.include?('netbsd')
      conf.linker.libraries << 'edit'
    else
      conf.linker.libraries << 'readline'
      if conf.cc.search_header_path 'curses.h'
        conf.linker.libraries << 'ncurses'
      end
    end
  elsif conf.cc.search_header_path 'linenoise.h'
    conf.cc.defines << "ENABLE_LINENOISE"
  end

  conf.gem :core => "mruby-error"
  conf.gem :mgem => 'mruby-errno'
  conf.gem :core => "mruby-sprintf"
  conf.gem :mgem => 'mruby-mtest', :checksum_hash => "40db4f644a9ab2820683d0395ae1cf5e0c232faf"
  conf.gem :core => "mruby-print"
  conf.gem :core => "mruby-math"
  conf.gem :core => "mruby-time"
  conf.gem :core => "mruby-struct"
  conf.gem :core => "mruby-enum-ext"
  conf.gem :core => "mruby-string-ext"
  conf.gem :core => "mruby-numeric-ext"
  conf.gem :core => "mruby-array-ext"
  conf.gem :core => "mruby-hash-ext"
  conf.gem :core => "mruby-range-ext"
  conf.gem :core => "mruby-proc-ext"
  conf.gem :core => "mruby-symbol-ext"
  conf.gem :core => "mruby-random"
  conf.gem :core => "mruby-object-ext"
  conf.gem :core => "mruby-objectspace"
  conf.gem :core => "mruby-fiber"
  conf.gem :core => "mruby-enumerator"
  conf.gem :core => "mruby-enum-lazy"
  conf.gem :core => "mruby-toplevel-ext"
  conf.gem :core => "mruby-kernel-ext"
  conf.gem :core => "mruby-eval"
  conf.gem :core => "mruby-exit"

  conf.gem :github => "scalone/mruby-hs-regexp"
  conf.gem :mgem => "mruby-io"
  conf.gem :mgem => "mruby-dir"
  conf.gem :mgem => "mruby-tempfile", :checksum_hash => "e2f56882fab5249f5203dc8259ac2504a3221ee4"
  conf.gem :github => "iij/mruby-require"
  conf.gem :github => "cloudwalkio/mruby-socket", :branch => "no-force"
  conf.gem :github => "iij/mruby-pack", :checksum_hash => "88a7fedea413568a1ff0410e109ff55a03b63a5f"
  conf.gem :mgem => "mruby-polarssl", :checksum_hash => "f8ffa0f619125c49195baeebc4760e5bc300ff2c"
  #conf.gem :github => "scalone/mruby-qrcode", :branch => "inverted"
  conf.gem :mgem => "mruby-miniz"
  conf.gem :mgem => "mruby-sleep"
  conf.gem :mgem => "mruby-json"
  conf.gem :github => "scalone/mruby-context"
  conf.gem :mgem => "mruby-ripemd"
  conf.gem :mgem => "mruby-hmac"
  # conf.gem :mgem => "mruby-sha2"
  conf.gem :github => "keizo042/mruby-sha2"
  conf.gem :github => "scalone/mruby-sha1"
  # conf.gem :mgem => "mruby-base58"
  conf.gem :github => "scalone/mruby-base58"
  conf.gem :mgem => "mruby-http"

  # be sure to include this gem (the cli app)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :clang

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  conf.enable_bintest
  conf.enable_debug
  conf.enable_test

  conf.gem :core => "mruby-print"

  #gem_config(conf)
end

MRuby::Build.new('x86_64-pc-linux-gnu') do |conf|
  toolchain :gcc

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  gem_config(conf)
end

MRuby::CrossBuild.new('i686-pc-linux-gnu') do |conf|
  toolchain :gcc

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  [conf.cc, conf.cxx, conf.linker].each do |cc|
    cc.flags << "-m32"
  end

  gem_config(conf)
end

MRuby::CrossBuild.new('x86_64-apple-darwin14') do |conf|
  toolchain :clang

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  [conf.cc, conf.linker].each do |cc|
    cc.command = 'x86_64-apple-darwin14-clang'
  end
  conf.cxx.command      = 'x86_64-apple-darwin14-clang++'
  conf.archiver.command = 'x86_64-apple-darwin14-ar'

  conf.build_target     = 'x86_64-pc-linux-gnu'
  conf.host_target      = 'x86_64-apple-darwin14'

  gem_config(conf)
end

MRuby::CrossBuild.new('i386-apple-darwin14') do |conf|
  toolchain :clang

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  [conf.cc, conf.linker].each do |cc|
    cc.command = 'i386-apple-darwin14-clang'
  end
  conf.cxx.command      = 'i386-apple-darwin14-clang++'
  conf.archiver.command = 'i386-apple-darwin14-ar'

  conf.build_target     = 'i386-pc-linux-gnu'
  conf.host_target      = 'i386-apple-darwin14'

  gem_config(conf)
end

MRuby::CrossBuild.new('x86_64-w64-mingw32') do |conf|
  toolchain :gcc

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  [conf.cc, conf.linker].each do |cc|
    cc.command = 'x86_64-w64-mingw32-gcc'
  end
  conf.cxx.command      = 'x86_64-w64-mingw32-cpp'
  conf.archiver.command = 'x86_64-w64-mingw32-gcc-ar'
  conf.exts.executable  = ".exe"

  conf.build_target     = 'x86_64-pc-linux-gnu'
  conf.host_target      = 'x86_64-w64-mingw32'

  gem_config(conf)
end

MRuby::CrossBuild.new('i686-w64-mingw32') do |conf|
  toolchain :gcc

  cc.defines = %w(MRB_STACK_EXTEND_DOUBLING ENABLE_DEBUG)

  [conf.cc, conf.linker].each do |cc|
    cc.command = 'i686-w64-mingw32-gcc'
  end
  conf.cxx.command      = 'i686-w64-mingw32-cpp'
  conf.archiver.command = 'i686-w64-mingw32-gcc-ar'
  conf.exts.executable  = ".exe"

  conf.build_target     = 'i686-pc-linux-gnu'
  conf.host_target      = 'i686-w64-mingw32'

  gem_config(conf)
end

