# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word, line, etc.) commands for editing text.
# eg: "select line", "clear all"
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in | zim: edit.zoom_in()
zoom out | zout: edit.zoom_out()
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
# pop <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)
drain: edit.word_left()
step: edit.word_right()

tug: edit.left()
pump: edit.right()
north: edit.up()
south: edit.down()
head: edit.line_start()
tail: edit.line_end()

pop north: edit.file_start()
pop south: edit.file_end()

pop pager: edit.page_up()
pop dager: edit.page_down()

# Selecting

take tug: edit.extend_left()
take pump: edit.extend_right()
take north: edit.extend_line_up()
take south: edit.extend_line_down()

take drain: edit.extend_word_left()
take step: edit.extend_word_right()

take head: edit.extend_line_start()
take tail: edit.extend_line_end()
take pager: edit.extend_file_start()
take dager: edit.extend_file_end()

# Indentation
indent [more]: edit.indent_more()
(indent less | out dent): edit.indent_less()

# Delete
drill: edit.delete_right()
scrum: edit.delete()
scrap:
    edit.extend_word_left()
    edit.delete()
junker:
    edit.extend_word_right()
    edit.delete()

# Copy
copper: edit.copy()

# Cut
cutter: edit.cut()

# Paste
(poster | paster | pasta): edit.paste()
(paste | pasta) match: edit.paste_match_style()

# Undo/redo
(undo that | nope | blast | (ah | oh) shit | boom | blooper | blunder): edit.undo()
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
pop mid: user.line_middle()
