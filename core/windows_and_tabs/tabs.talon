tag: user.tabs
-
tab make: app.tab_open()
tab (last | back | tug): app.tab_previous()
tab (next | pump): app.tab_next()
tab close: user.tab_close_wrapper()
tab (reopen | restore): app.tab_reopen()
tab <number>: user.tab_jump(number)
tab final: user.tab_final()
tab (duplicate | clone): user.tab_duplicate()
