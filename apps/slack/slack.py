from talon import Context, Module, actions

ctx = Context()
mod = Module()
apps = mod.apps
apps.slack = "app.name: Slack"
apps.slack = """
os: mac
and app.bundle: com.tinyspeck.slackmacgap
"""
apps.slack = """
tag: browser
browser.host: app.slack.com
"""
ctx.matches = r"""
app: slack
"""


@ctx.action_class("edit")
class EditActions:
    def line_insert_down():
        actions.edit.line_end()
        actions.key("shift-enter")
