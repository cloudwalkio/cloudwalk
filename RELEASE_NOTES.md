# Cloudwalk CLI

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