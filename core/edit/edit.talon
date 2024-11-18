# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word, line, etc.) commands for editing text.
# eg: "select line", "clear all"
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
find it: edit.find()
next one: edit.find_next()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

# go left, go left left down, go 5 left 2 down
# go word left, go 2 words right
go <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)
drain: edit.word_left()
drain <number_small> times: user.words_left(number_small)
step: edit.word_right()
step <number_small> times: user.words_right(number_small)

tug: edit.left()
tug <number_small> times: user.left_n(number_small)
push: edit.right()
push <number_small> times: user.right_n(number_small)
north: edit.up()
north <number_small> times: user.up_n(number_small)
south: edit.down()
south <number_small> times: user.down_n(number_small)
head: edit.line_start()
tail: edit.line_end()

# go way left:
#     edit.line_start()
#     edit.line_start()
# go way right: edit.line_end()
# pop way up: edit.file_start()
# pop way down: edit.file_end()

pop north: edit.file_start()
pop south: edit.file_end()

pop page up: edit.page_up()
pop page down: edit.page_down()

# Selecting

take left: edit.extend_left()
take right: edit.extend_right()
take up: edit.extend_line_up()
take down: edit.extend_line_down()

take word left: edit.extend_word_left()
take word right: edit.extend_word_right()

take way left: edit.extend_line_start()
take way right: edit.extend_line_end()
take way up: edit.extend_file_start()
take way down: edit.extend_file_end()

# Indentation
indent [more]: edit.indent_more()
(indent less | out dent): edit.indent_less()

# Delete
drill: user.delete_right_n(1)
# scratch <number_small> times: user.delete_left_n(number_small)
drill <number_small> times: user.delete_right_n(number_small)
scrap: user.delete_word_left_n(1)
scrap <number_small> times: user.delete_word_left_n(number_small)
junk: user.delete_word_right_n(1)
junk <number_small> times: user.delete_word_right_n(number_small)
# clear left: edit.delete()
# clear right: user.delete_right()

# clear up:
#     edit.extend_line_up()
#     edit.delete()

# clear down:
#     edit.extend_line_down()
#     edit.delete()

# clear way left:
#     edit.extend_line_start()
#     edit.delete()

# clear way right:
#     edit.extend_line_end()
#     edit.delete()

# Copy
copy that: edit.copy()
# copy word left: user.copy_word_left()
# copy word right: user.copy_word_right()

#to do: do we want these variants, seem to conflict
# copy left:
#      edit.extend_left()
#      edit.copy()
# copy right:
#     edit.extend_right()
#     edit.copy()
# copy up:
#     edit.extend_up()
#     edit.copy()
# copy down:
#     edit.extend_down()
#     edit.copy()

# Cut
cut that: edit.cut()
cut word left: user.cut_word_left()
cut word right: user.cut_word_right()

# Paste
(pace | paste) that: edit.paste()
# (pace | paste) enter:
#     edit.paste()
#     key(enter)
paste match: edit.paste_match_style()

# Duplication
# clone that: edit.selection_clone()
# clone line: edit.line_clone()

# Insert new line
new line above: edit.line_insert_up()
new line below | slap: edit.line_insert_down()

# Insert padding with optional symbols
# (pad | padding): user.insert_between(" ", " ")
# (pad | padding) <user.symbol_key>+:
#     insert(" ")
#     user.insert_many(symbol_key_list)
#     insert(" ")

# Undo/redo
(undo that | nope | blast): edit.undo()
(redo that | yes indeed): edit.redo()

# Save
disk: edit.save()
disk oliver: edit.save_all()

pour: edit.line_insert_down()
drink: edit.line_insert_up()

emoji scout [<user.text>]:
    key(cmd-ctrl-space)
    sleep(200ms)
    insert(user.text or "")
cb,f