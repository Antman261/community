control mouse: user.control_mouse_toggle()
control off: user.mouse_sleep()
zoom mouse: tracking.control_zoom_toggle()
camera overlay: tracking.control_debug_toggle()
run calibration: tracking.calibrate()
left drag | drag | drag start:
    # close zoom if open
    tracking.zoom_cancel()
    user.mouse_drag(0)
    # close the mouse grid
    user.grid_close()
right drag | righty drag:
    # close zoom if open
    tracking.zoom_cancel()
    user.mouse_drag(1)
    # close the mouse grid
    user.grid_close()
end drag | drag end: user.mouse_drag_end()
spin down: user.mouse_scroll_down()
spin tiny [down]: user.mouse_scroll_down(0.2)
spin up: user.mouse_scroll_up()
spin tiny up: user.mouse_scroll_up(0.2)
spin scroll: user.mouse_gaze_scroll()
gaze spin: user.mouse_gaze_scroll()
spin (gaze | guys): user.mouse_gaze_scroll_toggle()
spin left: user.mouse_scroll_left()
spin tiny left: user.mouse_scroll_left(0.5)
spin right: user.mouse_scroll_right()
spin tiny right: user.mouse_scroll_right(0.5)
spin {user.continuous_scrolling_direction}:
    user.mouse_scroll_continuous(continuous_scrolling_direction)
spin {user.continuous_scrolling_direction} <number_small>:
    user.mouse_scroll_continuous(continuous_scrolling_direction, number_small)
copy mouse position: user.copy_mouse_position()
# To scroll with a hiss sound, set mouse_enable_hiss_scroll to true in settings.talon
mouse hiss up: user.hiss_scroll_up()
mouse hiss down: user.hiss_scroll_down()
