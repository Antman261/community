tag: user.mic_picker_open
-
^(microphone | mike) close$: user.microphone_selection_hide()
^<user.select> [mike] <number_small>$: user.microphone_select(number_small)
