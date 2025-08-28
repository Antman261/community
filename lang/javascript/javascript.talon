code.language: javascript
code.language: typescript
code.language: javascriptreact
code.language: typescriptreact
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_keywords
tag(): user.code_libraries
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_private_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_variable_formatter = "PRIVATE_CAMEL_CASE"

is loose: " == "
(isn't | is not) loose: " != "
is equal: " === "
(isn't | is not) equal: " !== "
<user.operator> fallback: " ?? "
<user.operator> quote var: user.insert_between("${", "}")

chain length: ".length"
chain {user.code_common_member_function}:
    user.insert_between(".{code_common_member_function}(", ")")
chain {user.code_common_member_function_with_lambda}:
    user.cursorless_insert_snippet(".{code_common_member_function_with_lambda}(($args) => ($value))")
chain {user.code_common_member_function_with_lambda} block:
    user.cursorless_insert_snippet(".{code_common_member_function_with_lambda}(($args) => {{\n\t$body\n}})")
chain {user.code_common_member_function_with_lambda} short:
    user.insert_between(".{code_common_member_function_with_lambda}(", ")")
chain {user.code_common_member_function_with_lambda} <phrase>:
    name = user.formatted_text(phrase, "PRIVATE_CAMEL_CASE")
    user.cursorless_insert_snippet(".{code_common_member_function_with_lambda}(({name}) => ($value))")
chain {user.code_common_member_function_with_lambda} block <phrase>:
    name = user.formatted_text(phrase, "PRIVATE_CAMEL_CASE")
    user.cursorless_insert_snippet(".{code_common_member_function_with_lambda}(({name}) => {{\n\t$body\n}})")

chain reduce:
    user.cursorless_insert_snippet(".reduce((acc, val) => ($value), $initialValue)")
chain reduce block:
    user.cursorless_insert_snippet(".reduce((acc, val) => {{\n$body\n}}, $initialValue)")
chain reduce short: user.cursorless_insert_snippet(".reduce($function, $initialValue)")

<user.operator> const: "const "
<user.operator> let: "let "
<user.operator> var: "var "
<user.operator> export: "export "
<user.operator> async: "async "
<user.operator> await: "await "
dot {user.code_common_member_function}:
    user.insert_between(".{code_common_member_function}(", ")")
state map: app.notify('ERROR: Command deprecated; please use "dot map"')
state filter: app.notify('ERROR: Command deprecated; please use "dot filter"')
state reduce: app.notify('ERROR: Command deprecated; please use "dot reduce"')

state spread: "..."

from import: user.insert_between(' from  "', '"')
