code.language: typescript
code.language: typescriptreact
-
settings():
    user.code_typename_formatter = "PUBLIC_CAMEL_CASE"

<user.operator> union [<user.code_type>]: " | {code_type or ''}"
<user.operator> pipe: " | {code_type or ''}"
<user.operator> intersect [<user.code_type>]: " & {code_type or ''}"

<user.operator> type: user.insert_between("type ", " = ")

as const: " as const"
as const satisfies: " as const satisfies "
