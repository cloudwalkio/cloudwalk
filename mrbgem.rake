MRuby::Gem::Specification.new('cloudwalk') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'cloudwalk'
  spec.bins    = ['cloudwalk']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end
