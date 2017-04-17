def gem_config(conf)
  conf.gem :core => "mruby-sprintf"
  conf.gem :mgem => 'mruby-mtest'
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
  conf.gem :mgem => "mruby-tempfile"
  conf.gem :github => "iij/mruby-require"
  conf.gem :mgem => "mruby-socket"
  conf.gem :mgem => "mruby-pack"
  conf.gem :mgem => "mruby-polarssl"
  #conf.gem :github => "sadasant/mruby-qrcode", :check_sum => "83205181508fe77f9fa7e556002334e439bcbc7b"
  conf.gem :github => "scalone/mruby-miniz"
  conf.gem :mgem => "mruby-sleep"
  conf.gem :mgem => "mruby-msgpack"
  conf.gem :mgem => "mruby-json"
  conf.gem :github => "scalone/mruby-context"
  conf.gem :github => "scalone/mruby-ripemd"
  conf.gem :github => "scalone/mruby-hmac"
  conf.gem :mgem => "mruby-sha2"
  conf.gem :github => "scalone/mruby-sha1"
  conf.gem :mgem => "mruby-base58"
  conf.gem :mgem => "mruby-bignum"

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

  conf.gem :mgem => 'mruby-mtest'
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

