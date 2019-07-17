# Cloudwalk CLI

Cloudwalk CLI is the CLI to create, pack, run and test posxml and DaFunk projects. Cloudwalk CLI  was created using mruby-cli.

## Setup

- You'll need the following installed and in your `PATH`:
    - [Docker](https://docs.docker.com/installation/)
    - [Docker Compose](https://docs.docker.com/compose/install/)

- Docker Setup
  - `git submodule update --init`
  - `docker-compose build`
  - `docker-compose run da_funk`
  - `docker-compose run all`

Each app will be generated with a Dockerfile that inherits a base image. You can pull the image from docker hub here: https://registry.hub.docker.com/u/scalone/cloudwalk-cli/

- Compile
    - `docker-compose run compile`


## Bin Install

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

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).
