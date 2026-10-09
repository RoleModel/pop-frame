require 'application_system_test_case'

class PopFrameTest < ApplicationSystemTestCase
  setup do
    WeeksController.version = 1
    WeeksController.fetches = 0
  end

  test 'loads the frame the first time it opens, below the button' do
    visit weeks_path
    assert_no_selector '.pop-frame'
    assert_equal 0, WeeksController.fetches

    click_on 'Week 2'

    assert_selector '.pop-frame', text: 'Week 2, version 1'
    assert_equal 1, WeeksController.fetches
    button_bottom, popover_top = evaluate_script(<<~JS)
      [document.querySelector('[popovertarget=week_2_popover]').getBoundingClientRect().bottom,
       document.getElementById('week_2_popover').getBoundingClientRect().top]
    JS
    assert_operator popover_top, :>=, button_bottom
  end

  test 'closes on Escape and reopens without loading again' do
    visit weeks_path
    click_on 'Week 1'
    assert_selector '.pop-frame', text: 'Week 1, version 1'

    find('body').send_keys(:escape)
    assert_no_selector '.pop-frame'

    click_on 'Week 1'
    assert_selector '.pop-frame', text: 'Week 1, version 1'
    assert_equal 1, WeeksController.fetches
  end

  test 'stays open through a morph refresh and shows the fresh content' do
    visit weeks_path
    click_on 'Week 1'
    assert_selector '.pop-frame', text: 'Week 1, version 1'

    within('.pop-frame') { click_on 'Save' }

    assert_selector '.pop-frame', text: 'Week 1, version 2'
  end
end
