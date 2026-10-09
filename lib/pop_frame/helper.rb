module PopFrame
  module Helper
    # A button whose block is its content, opening a popover with a Turbo Frame that loads +src+
    # (anything url_for takes) the first time it's shown, and reloads in place on a morph refresh.
    def pop_frame_tag(id, src, loading: 'Loading…', **button_options, &)
      popover_id = "#{id}_popover"

      safe_join [
        tag.button(type: 'button', popovertarget: popover_id, **button_options, &),
        tag.div(id: popover_id, class: 'pop-frame', popover: 'auto') do
          tag.turbo_frame(loading, id:, src: url_for(src), loading: 'lazy', refresh: 'morph')
        end
      ]
    end
  end
end
