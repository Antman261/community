os: mac
app: slack
-
tag(): user.messaging
tag(): user.emoji
# Workspace
workspace <number>: key("cmd-{number}")
# Channel
(slack | lack) [channel] info: key(cmd-shift-i)
# Navigation
focus (move | next): key(ctrl-`)
(section | zone) [next]: key(f6)
(section | zone) (previous | last): key(shift-f6)
(slack | lack) [direct] messages: key(cmd-shift-k)
(slack | lack) threads: key(cmd-shift-t)
(slack | lack) (history [next] | back | backward): key(cmd-[)
(slack | lack) forward: key(cmd-])
(element) [next]: key(tab)
(element) (previous | last): key(shift-tab)
(slack | lack) (my stuff | activity): key(cmd-shift-m)
(slack | lack) directory: key(cmd-shift-e)
(slack | lack) (starred [items] | stars): key(cmd-shift-s)
(slack | lack) unread [messages]: key(cmd-shift-a)
(go | undo | toggle) full: key(ctrl-cmd-f)
# Messaging
grab left: key(shift-up)
grab right: key(shift-down)
add line: key(shift-enter)
(slack | lack) (slap | slaw | slapper): key(cmd-right shift-enter)
(slack | lack) (react | reaction): key(cmd-shift-\)
make code: key(cmd-shift-c)
make code block: key(cmd-shift-alt-c)
insert link: key(cmd-shift-u)
(slack | lack) (bull | bullet | bulleted) [list]: key(cmd-shift-8)
(slack | lack) (number | numbered) [list]: key(cmd-shift-7)
(slack | lack) (quotes | quotation): key(cmd-shift->)
make bold: key(cmd-b)
make italic: key(cmd-i)
make strike: key(cmd-shift-x)
(slack | lack) snippet: key(cmd-shift-enter)
# Calls
([toggle] mute | unmute): key(m)
(slack | lack) huddle: key(cmd-shift-h)
(slack | lack) ([toggle] video): key(v)
(slack | lack) invite: key(a)
# Miscellaneous
(slack | lack) shortcuts: key(cmd-/)
emote <user.text>: "{text}"
flick side: key(cmd-shift-d)
flick right side: key(cmd-.)

# DEPRECATED
(move | next) focus:
    app.notify("please use the voice command 'focus next' instead of 'next focus'")
    key(ctrl-`)
[next] (section | zone):
    app.notify("please use the voice command 'section next' instead of 'next section'")
    key(f6)
(previous | last) (section | zone):
    app.notify("please use the voice command 'section last' instead of 'last section'")
    key(shift-f6)
[next] (element):
    app.notify("please use the voice command 'element next' instead of 'next element'")
    key(tab)
(previous | last) (element):
    app.notify("please use the voice command 'element last' instead of 'last element'")
    key(shift-tab)
