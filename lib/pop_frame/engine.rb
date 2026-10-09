module PopFrame
  class Engine < ::Rails::Engine
    initializer 'pop_frame.helper' do
      ActiveSupport.on_load(:action_view) { include PopFrame::Helper }
    end

    # Propshaft puts every engine's app/assets on the load path by itself; Sprockets wants it named.
    initializer 'pop_frame.assets' do |app|
      app.config.assets.precompile << 'pop_frame.css' if app.config.respond_to?(:assets)
    end
  end
end
