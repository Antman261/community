(square | bracket | square bracket) that:
    user.deprecate_command("2024-11-24", "(square | bracket | square bracket) that", "box that")
    text = edit.selected_text()
    user.paste("[{text}]")

percent that:
    user.deprecate_command("2024-11-24", "percent that", "percentages that")
    text = edit.selected_text()
    user.paste("%{text}%")
