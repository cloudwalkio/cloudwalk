# Cloudwalk CLI

### 2.0.0 - 2020-07-21

- Update mruby version to 2.1.0;
- Remove windows support.

### 1.14.3 - 2019-05-02

- Move host to manager.cloudwalk.io and avoid certification problems.

### 1.14.2 - 2019-05-02

- Update ruby compilation version to 2.4;
- Update main (3.11.0);
- Set host name at SSL connections and fix manager connection after certificate update.

### 1.14.1 - 2019-03-12

- Adopt mruby-miniz from trunk;
- Adopt mruby-polarssl 2.1.2.

### 1.14.0 - 2018-12-28

- Update mruby-miniz
    - Support parameters on deflate operation.

### 1.13.0 - 2018-12-20

- Update main (2.6.0)
    - Update posxml_parser (2.10.0)
        - During translation lowercase first letter function.

### 1.12.0 - 2018-12-14

- Update main (2.4.0)
    - Refactoring PAX S920 key map inverting ALPHA by FUNC;
    - Update cloudwalk (1.11.4);
    - Update da_funk (2.2.0)
        - Support pausing communication on Network::scan;
- Update main (2.5.0)
    - Update posxml_parser (2.9.0)
        - Fix network.cloudwalkhandshake variable type declaration;
        - Fix integer type check at posxml compilation, support camelcase declarations;
        - Update test xsd from PosxmlParser version;
        - Fix instruction not found check to instruction with parameters;
        - Support to system.getlog instruction compilation.

### 1.11.4 - 2018-11-28

- Fix message attribute at custom posxml xsd.

### 1.11.3 - 2018-11-28

- Fix exception error rescue adding mruby errors;
- Update main (2.0.0)
    - Add ThreadScheduler interface to handle threads on communication and status bar operation;
    - Support Thread scheduling on boot;
    - Stop/start communication threads between network reconfiguration;
    - Add link/unlink image to payment channel status;
    - Fix communication thread printing;
    - Update da_funk (2.0.0)
        - Support check specific listener type;
        - Adopt ThreadScheduler and stop all thread at boot end;
        - Remove status bar check from engine loop;
        - Add Support to change link/unlink payment channel image;
        - Fix IO_INPUT_NUMBERS string change at IO.get_format.
- Update main (2.1.0)
    - Remove backlight control in thread;
    - Remove notification handler on communication thread;
    - Update status bar updating period from 400 to 1000ms;
    - Adopt custom notification handle at main thread;
    - Fix ThreadScheduler command cache always returning the vale to key value structure;
    - Fix fallback communication in thread communication;
    - At ThreadChannel handler loop only communicate if string is given;
    - Change strategy to thread spawn at thread scheduler to avoid missing loaded libs as da_funk execute create eval string in other scope.
- Update main (2.1.1)
    - Increased timeout on getc;
- Update main (2.1.2)
    - Check if threads were created to stop them at ThreadScheduler;
    - ThreadScheduler only start status bar if applicable;
    - Support payment channel connect between threads;
    - Remove countdown menu from payment channel handler because this handler is being handle in thread;
    - Refactoring main execution parser;
- Update main (2.1.3)
    - Update da_funk (2.0.1)
        - Add support to create and close PaymentChannel from CommunicationChannel;
    - Update funky-emv (0.20.0)
        - Added FunkyEmv Ui to display remove card message;
- Update main (2.1.4)
    - Update posxml_parser (2.8.4)
        - Return PaymentChannel status when read cw_payment_channel.dat.
- Update main (2.2.0)
    - Review key_main events to link2500 terminals.
    - Update posxml_parser (2.8.5);
        - Fresh cache variable in ruby execution;
    - Update da_funk (2.0.2);
        - Fix system update removing file existence validation because it could be a not valid path;
    - Update da_funk (2.0.3);
        - Fix I18n print and translate to check line and column;
    - Update da_funk (2.0.4);
        - Do not print last if not in communication thread;
        - Replace sleep by getc at ParamsDat download functions;
    - Update funky-emv (0.20.1);
        - Refactoring EmvSharedLibrary to check tag 4F after 9F06 at go on chip process to return AID;
- Update main (2.3.0)
    - Support ThreadScheduler.pause at communication thread to not execute any event handler during other threads connection attempts;
    - Move ThreadScheduler to mruby-context;
    - Check if communication thread is sleeping before checking any communication object;
    - Remove DaFunk::PaymentChannel.client definition at call and move to mruby-context;
    - Support to ThreadPubSub subscription performing system reload on communication update event;
    - Update da_funk (2.1.0);
        - Support to thread pausing during Network.attach;
        - Ensure clear on PaymentChannel::close!;
    - Update posxml_parser (2.8.6);
        - Fix parseticket xsd;
        - Improve VariableTypeError message to highlight type;

### 1.11.2 - 2018-09-18

- Fix exception error rescue adding mruby errors.

### 1.11.1 - 2018-09-13

- Add checksum hash to mruby-mtest and mruby-tempfile build.

### 1.11.0 - 2018-09-13

- Update main (1.84.0)
    - Update posxml_parser (2.8.3)
        - Fix input_integer timeout.
    - Update cloudwalk_handshake (0.13.2)
        - Return nil if handshake ssl error at CloudwalkHandshake.
- Update main (1.83.0)
    - Implement communication test at admin menu.
    - Refactoring media configuration to support device reboot and communication test after configuration.
    - Adopt da_funk confirm helper at wizard.
    - Refactoring language form at wizard to support exit.
    - Update da_funk (1.13.1).
        - Fix ScreenFlow navigation when comparing confirmation.
    - Update posxml_parser (2.8.0).
        - Support float variable compilation.
        - Add file line number to compilation error.
    - Update cloudwalk_handshake (0.13.1).
        - Add rescue ssl exception on socket operation.
        - Add rescue tcp exception on socket operation.
        - Check if socket is created at handshake and ssl handshake.
- Update main (1.82.0)
    - Implement Notification to reboot system.
    - Reboot system after remote update.
    - Refactoring wizard and application menu check adding application update at the end of wizard and moving crc check from first ENTER press to boot, speeding up key press on idle.
    - Support update interval feature, if not configured the default is 7 days interval.
    - Add admin_communication main entry option.
    - Update posxml_parser (2.7.0).
        - Support to execute ruby application in posxml_execute.
    - Update cloudwalk_handshake (0.13.0)
        - Implement UTC mode from params.dat to generate TOTP.
    - Update da_funk (1.13.0)
        - Add DaFunk::ParamsDat::parameters_load copy of ready?.
        - ScrenFlow.confirm returns boolean.
        - Support schedule events in file if using hours parameters.
- Update main (1.81.0)
    - Update posxml_parser (2.6.1)
        - Support image at card_get_variable.
- Update main (1.80.0)
    - Add debug flag as false to compilation config.
    - Implement new update strategy that supports multiple files.
    - Update cloudwalk (1.10.0)
    - Update da_funk (1.12.0)
        - Do not raise exception when bitmap to be display doesn’t exists.
        - Implement Device::Priter.print_barcode.
    - Update funky-emv (0.17.2)
        - Add sleep before call pin methods to avoid problems on display and memory location of PAX EMV Kernel.
    - Update posxml_parser (2.6.0)
        - Enable FileDbCache and fix delete process.
        - Fresh any file db cache on every execute.
        - Bugfix card_read to works when EMV not enabled.
        - Do not trow exception the try to read a variable that doesn’t exists on mruby side.
        - Interface_display_bitmap returns the resulted value.
        - Bugfix input_money to works even if message is empty.
        - Implement print_barcode.

### 1.10.0 - 2018-07-31

- Update main (1.79.0)
    - Update posxml_parser (2.5.0)
        -  Support network_start instruction.

### 1.9.1 - 2018-05-02

- Recover files of a security fix.
- Update main (1.73.0).

### 1.9.0 - 2018-03-02

- Update main (1.66.0).

### 1.8.0 - 2018-03-01

- Update main (1.65.0).

### 1.7.0 - 2018-03-01

- Fix path to single translation.
- Implement debug flag to ruby single build.
- Remove package before create single package.
- Update PosxmlEn xsd wait instruction params order.
- Update main (1.64.0).

### 1.6.1 - 2018-02-15

- Fix typo on translation rake task.

### 1.6.0 - 2018-02-15

- Implement helper xml2rb to add _xml.rb suffix.
- Update main (1.62.0).
- Implement posxml rake task cloudwalk:translate to translate .xml to .rb file.
- Implement ruby rake task:
    - single_build - compile each single .rb to .mrb.
    - single_package - Create a package of all .mrb files.

### 1.5.0 - 2018-01-29

- Bug fix CloudwalkHttp::delete url and url treatment.
- Implement Manager::Application.find.
- Implement Manager::RubyApplication.find.
- Implement Manager::RubyApplication.delete.
- Implement delete argument for app switch.

### 1.4.3 - 2018-01-18

- Return timeout key at Kernel.getc.

### 1.4.2 - 2018-01-17

- Update mruby-pack checksum commit point.
- Temporarily fix to Kernel.getc.
- Fix mruby-pack GitHub configuration.

### 1.4.1 - 2018-01-15

- Replace mgem/mruby-require for GitHub iij/mruby-require.
- Replace ::Device for ::DaFunk.
- Update main (1.53.0).

### 1.4.0 - 2018-01-15

- Move back to MRuby 1.3.0.

### 1.3.0 - 2018-01-13

- Check TCPSocket class from Object instead of Module at CloduwalkHttp class.
- Replace $stdout.getc by gets on company selection.
- Fix company selection return the selected company.
- Adopt sclaone/mruby-require branch set-target-class.
- Adopt mruby hash 623436276e9650ce60c64bc24bfd430aab8a4193 (1.3+).

### 1.2.1 - 2018-01-12

- Replace current mruby-socket repo for cloudwalkio/mruby-socket that fix a MRuby instruction parse problem. This fix open sockets system error.
- Get mruby-require from mgem.

### 1.2.0 - 2018-01-12

- Remove whitespace at package.rb.
- Add all gems to host compilation.
- Add translation (xml to ruby via posxml_parser) option on compilation switch with the flag -txml.
- Update main (1.51.0)

### 1.1.0 - 2018-01-10

- Apply mrbc and mruby from MRuby 1.3.0 and create a new runtime for both execution.

### 1.0.0 - 2018-01-10

- Fix da_funk file creation, the code had problem during zip creation causing an infinite loop.
- Review mgems and move to MRuby 1.3.0.
- Update README adding #Setup chapter.
- Add all compose command.
- Update main (1.48.0).

### 0.9.0 - 2017-09-14

- Add license to README.
- Add message after success signup.
- Add README to mruby app generation.
- Add README to POSXML app generation.

### 0.8.0 - 2017-09-12

- Fix DeployException.
- Add libreadline and mingw tools to improve cloudwalk console.
- Fix binary selection.
- Add readline include to compilation.
- Refactoring app command to support only 2 arguments list and new.
- Implement sign-up command.
- Implement release (list, promote and new) command.
- Update help with new commands (app and release).
- Start a new runtime at cloudwalk console and avoid exception stop interruption.
- Update main (1.28.0).

### 0.7.1 - 2017-08-29

- Fix ruby Cwfile.json and Rakefile creation.

### 0.7.0 - 2017-08-29

- Divide implementation between ruby and posxml.
- Fix Config.host manager exception.
- Remove commented code at cw_file_json.
- Add Posxml module.
- Implement ManagerHelper.
- Mode xml to posxml method to helper.
- First RubyApplication class implementation.
- Support to create lock for Ruby and Posxml applications.
- Fix cwfile expected format on lock generation for ruby runtime.
- Refactoring cw_file_json to support mruby.
- Add all new file to load on cloudwalk.rb.
- Add Manager::RubyApplication.
- Check if cwfile is set to check runtime on CwFileJson.
- Add Posxml module in RakeTask call at Posxml Makefile creation.
- Add support to create Ruby application.
- Support Cwfile.json at Ruby application creation.
- Refactoring lock generation adding exceptions.
- Refactoring deploy processing fixing Posxml and Ruby details.
- Fix cloudwalk:build and cloudwalk:package tasks.
- Update main (1.22.0)
    - Move cloudwalk.rb to cloudwalk_setup.rb.
    - Add cloudwalk gem.
    - Update da_funk (0.14.0)
        - Add task to pack application.
        - Fix cloudwlak run call at rake task.

### 0.6.0 - 2017-08-14

- Temporarily fix on i18n.json moving, for some reason during the copy of i18n.json file on docker vm it comes with a number of \x00 at the end.
- Fix CliPlatform return.
- Implement pretty printer at CwFile.json.lock
- Update main (1.17.0)
    - Update da_funk (0.12.0)
        - CommandLinePlatform.connected? return 0.

### 0.5.2 - 2017-08-08

- Fix success deploy message.

### 0.5.1 - 2017-08-08

- Fix compilation displays moments.

### 0.5.0 - 2017-08-08

- Add instructions is20022.new, iso20022.add and iso20022.build to Posxml XSD.
- Create dir if compiling only one file to fix #3.
- Add deploying message, close #2.
- Display the size of compiled posxml.
- Fix helper to upgrade-version.
- Update main (1.15.0)
    - Adopt print_last for PaymentChannel displays.
    - Check if Device is connected on PaymentChannel life check.
    - Refactoring primary_communication label return on PaymentChannel.
    - Bug fix set media_primary on media configuration.
    - Check if is main connection is running to validate fallback at ConnectionManagement.
    - Additional check to ConnectionManagement before try primary connection recovery.
    - Adopt Device::Network.shutdown at payment channel handlers and trigger fallback recovery if primary communication try has failed.
    - Adopt print_last at CloudWalk and MediaConfiguration.
    - Update cloudwalk_handshake (0.9.0)
        - Add rescue for SSL exceptions.
        - Add cloudwalk gem.
    - da_funk (0.10.0)
        - Define pt-br as default locale.
        - Implement Kernel#print_last.
        - Adopt print_last for Herlper#attach.
        - Implement Device::Network.shutdown, what call disconnect and power(0).
        - Update cloudwalk_handshake (0.9.0), funky-emv (0.9.0) and posxml_parser(0.16.0).
    - posxml_parser (0.16.0)
        - Add cloudwalk gem.
        - Add ISO20022 initial implementation.
        - Add 3 instructions related with ISO 20022:
            - iso20022_new(document).
            - iso20022_add(tag, value).
            - iso20022_build(variablereturn, buffer).

### 0.4.1 - 2017-07-11

- Update posxml_en documentation for json.getelement.

### 0.4.0 - 2017-06-30

- Update main (1.6.0).

### 0.3.1 - 2017-06-28

- Fix posxml_en documentation for xml.getelment.
- Update main (1.5.0).

### 0.3.0 - 2017-05-31

- Fix cloudwalk config env.
- Turn ask and ask_secret methods more posix.
- On upgrade-version switch support the send of application name without extension.
- Improve upgrade-version messages and remove support to check Cwfile.

### 0.2.5 - 2017-05-30

- Update main(1.4.7) to update posxml_parser (0.14.5).

### 0.2.4 - 2017-05-23

- Turn POSXML xsd constant a literal string.
- Update main to update posxml_parser (0.14.1) and fix some errors of xml compilation.

### 0.2.3 - 2017-05-22

- Update authorizer_url, description, pos_display_label and displayable from Cwfile.

### 0.2.2 - 2017-05-22

- Fix Cwfile.json generation.

### 0.2.1 - 2017-05-22

- Fix cloudwalk load in generated application.

### 0.2.0 - 2017-05-22

- First stable version.