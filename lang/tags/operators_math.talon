tag: user.code_operators_math
-

# math operators
<user.operator> (minus | subtract): user.code_operator_subtraction()
<user.operator> (plus | add): user.code_operator_addition()
<user.operator> (times | multiply): user.code_operator_multiplication()
<user.operator> divide: user.code_operator_division()
<user.operator> mod: user.code_operator_modulo()
(<user.operator> (power | exponent) | to the power [of]): user.code_operator_exponent()

# comparison operators
is equal: user.code_operator_equal()
is not equal: user.code_operator_not_equal()
(is | <user.operator>) (greater | more): user.code_operator_greater_than()
(is | <user.operator>) (less | below) [than]: user.code_operator_less_than()
(is | <user.operator>) greater [than] or equal: user.code_operator_greater_than_or_equal_to()
(is | <user.operator>) less [than] or equal: user.code_operator_less_than_or_equal_to()

# logical operators
(<user.operator> | logical) and: user.code_operator_and()
(<user.operator> | logical) or: user.code_operator_or()
(<user.operator> | logical) not: user.code_operator_not()

# set operators
(<user.operator> | is) in: user.code_operator_in()
(<user.operator> | is) not in: user.code_operator_not_in()

# TODO: This operator should either be abstracted into a function or removed.
(<user.operator> | pad) colon: " : "
