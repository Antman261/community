code.language: typescript
code.language: typescriptreact
-
settings():
    user.code_typename_formatter = "PUBLIC_CAMEL_CASE"

type (union | or) [<user.code_type>]: " | {code_type or ''}"
type (intersect | and) [<user.code_type>]: " & {code_type or ''}"

#state type: user.insert_between("type ", " = ")

as const: " as const"
