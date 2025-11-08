from talon import Module, actions

mod = Module()


@mod.action_class
class Actions:
    def terminal_run_ordinal_last(num: int):
        """Repeats the nth command"""
        for i in range(num - 1):
            actions.key("up")
        actions.key("up enter")
