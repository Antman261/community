# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word,
# line, etc.) commands for editing text.
# eg: "select line", "clear all"
# For overriding or creating aliases for specific actions, this function will
# also accept strings, e.g. `user.edit_command("delete", "wordLeft")`.
# See edit_command_modifiers.py to discover the correct string for the modify argument,
# and `edit_command_actions.py` `simple_action_callbacks` to find strings for the action argument.
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in | zim: edit.zoom_in()
zoom out | zout: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
# find it: edit.find()
next one: edit.find_next()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

# go left, go left left down, go 5 left 2 down
# go word left, go 2 words right
# pop <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)
drain | (word tug): edit.word_left()
step | (word pump): edit.word_right()

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

take (drain | word tug): edit.extend_word_left()
take (step | word pump): edit.extend_word_right()

take head: edit.extend_line_start()
take tail: edit.extend_line_end()
take start: edit.extend_file_start()
take end: edit.extend_file_end()

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
cut that: edit.cut()

# Paste
(poster | paster | pasta): edit.paste()
(pasta match) | spaghetti: edit.paste_match_style()

# Undo/redo
(undo that | blooper | blundor):
    edit.undo()
    user.increment_command_counter('blundor')
(redo that | yes indeed): edit.redo()

# Save
disk: edit.save()
disk oliver: edit.save_all()

pour | trailer: edit.line_insert_down()
drink: edit.line_insert_up()

emoji scout [<user.text>]:
    key(cmd-ctrl-space)
    sleep(200ms)
    insert(user.text or "")
pop mid: user.line_middle()
