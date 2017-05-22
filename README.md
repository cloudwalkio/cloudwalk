# Cloudwalk CLI

Cloudwalk CLI is the CLI to create, pack, run and test posxml and DaFunk projects. Cloudwalk CLI  was created using mruby-cli.

## Install

- Donwnload the lastest version(remember to rename to cloudwalk) based in your OS [here](https://github.com/cloudwalkio/cloudwalk/releases/latest).
- (Performance loss, not recomendated) Or You can install it in Ruby environment with as gem `gem install cloudwalk`.


## Usage
 
```
$ cloudwalk
cloudwalk [switches] [arguments]
cloudwalk help                            : show this message
cloudwalk login                           : perform cloudwalk.io authentication
cloudwalk logout                          : perform cloudwalk.io logoff
cloudwalk new <name>                      : create app, with: -xml to xml app
cloudwalk compile -o<out> <file1> <file2> : compile ruby to mrb
cloudwalk app upgrade-version <old>..<new>: create a new version for xml app
cloudwalk console                         : mirb console
cloudwalk run -b <out>, <file1>           : run ruby or binary file
cloudwalk package <parameters>            : Create package based in the params: MODEL, BRAND, SERIAL_NUMBER, LOGICAL_NUMBER; ie: DEVICE=d200
cloudwalk config <parameter>              : print config parameters (token, user_id, env, host)
cloudwalk about                           : print cloudwalk cli about
cloudwalk version                         : print cloudwalk version
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request