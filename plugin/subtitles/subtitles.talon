settings():
    # Show subtitles?
    user.subtitles_show = true
    # Screens on which to show subtitles:
    # "all" - all screens
    # "main" - main screen as configured in OS
    # "cursor" - screen containing mouse pointer
    # "focus" - screen containing active/focused window/app
    user.subtitles_screens = "main"
    # 100 px maximum subtitle font size
    user.subtitles_size = 50
    user.subtitles_color = "aebfff"
    user.subtitles_color_outline = "1122aa"
    # For each character in the subtitle, extend the timeout 50 ms
    user.subtitles_timeout_per_char = 37
    # 750 ms is the minimum time to display a subtitle
    user.subtitles_timeout_min = 310
    # 3 seconds is the maximum time to display a subtitle
    user.subtitles_timeout_max = 3000
    # Position subtitles at the bottom of the screen (93% from top)
    user.subtitles_y = 0.93
