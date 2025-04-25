# fmt: off

# define the spoken forms for symbols in command and dictation mode
punctuation_dict = {}

# for dragon, we add a couple of mappings that don't work for conformer
# i.e. dragon supports some actual symbols as the spoken form
dragon_punctuation_dict = {
    "`": "`",
    ",": ",",
}

# define the spoken forms for symbols that are intended for command mode only
symbol_key_dict = {}

# define spoken form for symbols for use in create_spoken_forms.py functionality
# we define a handful of symbol only. at present, this is restricted to one entry per symbol.
symbols_for_create_spoken_forms = {
    # for application names like "Movies & TV"
    "and": "&",
    # for emails
    "at": "@",
    "dot": ".",
    # for application names like "notepad++"
    "plus": "+",
}


class Symbol:
    character: str
    command_and_dictation_forms: list[str] = None
    command_forms: list[str] = None

    def __init__(
        self, character: str, command_and_dictation_forms=None, command_forms=None
    ):
        self.character = character

        if command_and_dictation_forms:
            self.command_and_dictation_forms = (
                [command_and_dictation_forms]
                if isinstance(command_and_dictation_forms, str)
                else command_and_dictation_forms
            )

        if command_forms:
            self.command_forms = (
                [command_forms] if isinstance(command_forms, str) else command_forms
            )

currency_symbols = [
    Symbol("$", ["dollar sign"], ["dollar"]),
    Symbol("£", ["pound sign"], None),
]

symbols = [
    Symbol("`", None, ["brick"]),
    Symbol(",", None, ["drip"]),
    Symbol(".", None, ["dot"]),
    Symbol(";", ["semicolon"], ["semi"]),
    Symbol(":", ["colon"], ["stack"]),
    Symbol("?", ["question mark"], ["quest"]),
    Symbol("!", ["exclamation mark", "exclamation point"], ["bang"]),
    Symbol("*", ["asterisk"], ["star", "snow"]),
    Symbol("#", ["hash sign", "number sign"], ["pound"]),
    Symbol("%", ["percent sign"], ["percy", "percent"]),
    Symbol("@", ["at sign"]),
    Symbol("&", ["ampersand", "and sign"], ["amper"]),
    Symbol("-", ["hyphen"], ["minus", "dash"]),
    Symbol("=", None, ["equals", "eccles"]),
    Symbol("+", None, ["plus"]),
    Symbol("~", None, ["tilde"]),
    Symbol("_", None, ["down score", "underscore", "score"]),
    Symbol("(", ["paren", "L paren", "left paren"], ["lepper"]),
    Symbol(")", ["R paren", "right paren"], ["repper"]),
    Symbol("[", None,["brack", "L brack", "bracket", "L bracket", "left bracket", "square", "L square", "left square", "lacquer", "lacker"]),
    Symbol("]", None, ["R brack", "R bracket", "right bracket", "R square", "right square", "racker"]),
    Symbol("/", ["forward slash"], ["strock"]),
    Symbol("\\", None, ["backstroke"]),
    Symbol("{", None, ["brace", "L brace", "left brace", "curly bracket", "left curly bracket", "lace", "laser"],),
    Symbol("}", None, ["R brace", "right brace","R curly bracket", "right curly bracket", "bracer", "racer"]),
    Symbol("<", None, ["angle", "L Angle", "left angle", "less than", "langle"]),
    Symbol(">", None, ["rangle", "R angle", "right angle", "greater than"]),
    Symbol("^", None, ["tangle"]),
    Symbol("|", None, ["pipe"]),
    Symbol("'", None, ["single"]),
    Symbol('"', None, ["double"]),
]

# by convention, symbols should include currency symbols
symbols.extend(currency_symbols)

for symbol in symbols:
    if symbol.command_and_dictation_forms:
        for spoken_form in symbol.command_and_dictation_forms:
            punctuation_dict[spoken_form] = symbol.character
            symbol_key_dict[spoken_form] = symbol.character
            dragon_punctuation_dict[spoken_form] = symbol.character

    if symbol.command_forms:
        for spoken_form in symbol.command_forms:
            symbol_key_dict[spoken_form] = symbol.character
