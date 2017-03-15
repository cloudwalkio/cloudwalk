# Funky-cli

Funky CLI is the CLI to create, run and test DaFunk projects. Funky CLI was created using mruby-cli.

## Install

- Donwnload the lastest version(remember to rename to funky-cli) based in your OS [here](https://github.com/cloudwalkio/da_funk/releases/latest).
- (Performance loss, not recomendated) Or You can install it in Ruby environment with as gem `gem install funky-cli`.


## Usage
 
```
$ funky-cli
funky-cli [switches] [arguments]
funky-cli help                            : show this message
funky-cli new <name>                      : create app
funky-cli compile -o<out> <file1> <file2> : compile ruby to mrb
funky-cli console                         : mirb console
funky-cli run -b <out>, <file1>           : run ruby or binary file
funky-cli version                         : print funky-cli version
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request