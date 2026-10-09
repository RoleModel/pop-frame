require 'test_helper'

class HelperTest < ActionView::TestCase
  tests PopFrame::Helper

  test 'wires the button to a popover holding a lazy, morph-refreshed frame' do
    render html: pop_frame_tag('week_1', '/weeks/1', class: 'pill') { 'Week 1' }

    assert_dom 'button.pill[type=button][popovertarget=week_1_popover]', text: 'Week 1'
    assert_dom 'button + div#week_1_popover.pop-frame[popover=auto]' do
      assert_dom 'turbo-frame#week_1[src="/weeks/1"][loading=lazy][refresh=morph]', text: 'Loading…'
    end
  end

  test 'takes markup for the loading state' do
    render html: pop_frame_tag('week_1', '/weeks/1', loading: tag.span('Hang on')) { 'Week 1' }

    assert_dom 'turbo-frame span', text: 'Hang on'
  end
end
