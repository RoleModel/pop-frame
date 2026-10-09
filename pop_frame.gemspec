require_relative 'lib/pop_frame/version'

Gem::Specification.new do |spec|
  spec.name        = 'pop_frame'
  spec.version     = PopFrame::VERSION
  spec.authors     = [ 'Andy Cohen' ]
  spec.email       = [ 'andy.cohen@rolemodelsoftware.com' ]
  spec.homepage    = 'https://github.com/RoleModel/pop-frame'
  spec.summary     = 'A Turbo Frame in a native popover, loaded when it opens.'
  spec.description = 'A view helper for a button that opens a lazily loaded Turbo Frame in a native ' \
                     'popover, anchored to the button with CSS. No JavaScript of its own.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,lib}/**/*', 'MIT-LICENSE', 'README.md', 'CHANGELOG.md']
  end

  spec.required_ruby_version = '>= 3.1'

  spec.add_dependency 'actionview', '>= 7.1.0'
  spec.add_dependency 'railties', '>= 7.1.0'
end
