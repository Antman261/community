app: vscode
-
tag(): user.find_and_replace
# tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
tag(): user.command_search

window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
pop view [<user.text>]:
    user.vscode("workbench.action.openView")
    insert(user.text or "")

# Sidebar
tree pop: user.vscode("workbench.view.explorer")
ecky pop: user.vscode("workbench.view.extensions")
runner pop: user.vscode("workbench.view.debug")
git pop: user.vscode("workbench.view.scm")
tester pop: user.vscode("workbench.view.testing.focus")
flick (side | left): user.vscode("workbench.action.toggleSidebarVisibility")
flick right [side]: key(cmd-alt-b)
search pump: user.vscode("search.action.focusNextSearchResult")
search tug: user.vscode("search.action.focusPreviousSearchResult")
tree collapse: user.vscode("workbench.files.action.collapseExplorerFolders")

# Search
scout here: key(cmd-f)
scout (space | all): key(cmd-shift-f)
scout replace: key(cmd-alt-f)
scout replace all: key(cmd-shift-h)

# Symbol search
scout symbol [<user.text>]:
    user.vscode("workbench.action.gotoSymbol")
    sleep(50ms)
    insert(text or "")

scout symbol all [<user.text>]:
    user.vscode("workbench.action.showAllSymbols")
    sleep(50ms)
    insert(text or "")

# Panels
commands <user.teleport>: user.command_palette()
panel control: user.vscode("workbench.panel.repl.view.focus")
output <user.teleport>: user.vscode("workbench.panel.output.focus")
problems <user.teleport>: user.vscode("workbench.panel.markers.view.focus")
(low | flick) (dog | dob): user.vscode("workbench.action.togglePanel")
term <user.teleport>: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
<user.teleport> (doc (<number_small> | <user.ordinals>) | <user.ordinals> doc):
    num = number_small or ordinals
    key("cmd-{num}")

# Settings
<user.teleport> settings: user.vscode("workbench.action.openGlobalSettings")
<user.teleport> settings json: user.vscode("workbench.action.openSettingsJson")
<user.teleport> settings folder: user.vscode("workbench.action.openFolderSettings")
<user.teleport> settings folder json: user.vscode("workbench.action.openFolderSettingsFile")
<user.teleport> settings workspace: user.vscode("workbench.action.openWorkspaceSettings")
<user.teleport> settings workspace json: user.vscode("workbench.action.openWorkspaceSettingsFile")
<user.teleport> shortcuts: user.vscode("workbench.action.openGlobalKeybindings")
<user.teleport> shortcuts json: user.vscode("workbench.action.openGlobalKeybindingsFile")
<user.teleport> snippets: user.vscode("workbench.action.openSnippets")

# VSCode Snippets
snip (last | previous): user.vscode("jumpToPrevSnippetPlaceholder")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
(zen switch) | (flick zen): user.vscode("workbench.action.toggleZenMode")
flick mini: user.vscode("editor.action.toggleMinimap")
doc (maxxer | bigger): user.vscode("workbench.action.minimizeOtherEditors")
doc restore: user.vscode("workbench.action.evenEditorWidths")
doc move right: user.vscode("workbench.action.moveEditorToRightGroup")
doc move left: user.vscode("workbench.action.moveEditorToLeftGroup")

#breadcrumb
pop bread: user.vscode("breadcrumbs.focusAndSelect")
bread pump: key(alt-right)
bread tug: key(alt-left)

# File Commands
(file hunt | scout (file | doc)) [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    insert(text or "")
file hunt (pace | paste):
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    edit.paste()
dock copy name: user.vscode("fileutils.copyFileName")
dock copy path: user.vscode("copyFilePath")
dock copy relative: user.vscode("copyRelativeFilePath")
dock make [(<user.format_text> | <user.text>)] [{user.file_extension}]:
    formatted = format_text or ""
    text_formatted = user.formatted_text(text or "", "PRIVATE_CAMEL_CASE")
    extension = file_extension or ""
    user.vscode_with_plugin("andreas.newFile", "{formatted}{text_formatted}{extension}")
    sleep(150ms)
dock rename:
    user.vscode("fileutils.renameFile")
    sleep(150ms)
disk:
    edit.save()
    sleep(150ms)
    user.vscode("hideSuggestWidget")
dock chuck:
    user.vscode("fileutils.removeFile")
    sleep(150ms)

# Language Features
quick fix | fixer: user.vscode("editor.action.quickFix")
flick (sugger | suggest): user.vscode("editor.action.triggerSuggest")
flick hint: user.vscode("editor.action.triggerParameterHints")
definition peek: user.vscode("editor.action.peekDefinition")
definition side: user.vscode("editor.action.revealDefinitionAside")
references show: user.vscode("editor.action.goToReferences")
hierarchy peek: user.vscode("editor.showCallHierarchy")
format that: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
# imports fix: user.vscode("editor.action.organizeImports")
problem next: user.vscode("editor.action.marker.nextInFiles")
problem last: user.vscode("editor.action.marker.prevInFiles")
problem fix: user.vscode("problems.action.showQuickFixes")
rename that: user.vscode("editor.action.rename")
refactor that: user.vscode("editor.action.refactor")
whitespace trim: user.vscode("editor.action.trimTrailingWhitespace")
language switch: user.vscode("workbench.action.editor.changeLanguageMode")
refactor rename: user.vscode("editor.action.rename")
refactor this: user.vscode("editor.action.refactor")
ref pump:
    user.vscode("references-view.tree.focus")
    key(down enter)
ref tug:
    user.vscode("references-view.tree.focus")
    key(up enter)

#code navigation
<user.teleport> (declaration | follow | def): user.vscode("editor.action.revealDefinition")
<user.teleport> tug: user.vscode("workbench.action.navigateBack")
<user.teleport> pump: user.vscode("workbench.action.navigateForward")
<user.teleport> implementation: user.vscode("editor.action.goToImplementation")
<user.teleport> type: user.vscode("editor.action.goToTypeDefinition")
<user.teleport> (usage | references | refs): user.vscode("references-view.find")
<user.teleport> def peek: user.vscode("editor.action.peekDefinition")
go edit: user.vscode("workbench.action.navigateToLastEditLocation")

close other tabs: user.vscode("workbench.action.closeOtherEditors")
close all tabs: user.vscode("workbench.action.closeAllEditors")
close tabs way right: user.vscode("workbench.action.closeEditorsToTheRight")
close tabs way left: user.vscode("workbench.action.closeEditorsToTheLeft")

# Folding
fold that: user.vscode("editor.fold")
unfold that: user.vscode("editor.unfold")
fold those: user.vscode("editor.foldAllMarkerRegions")
unfold those: user.vscode("editor.unfoldRecursively")
fold all: user.vscode("editor.foldAll")
unfold all: user.vscode("editor.unfoldAll")
fold comments: user.vscode("editor.foldAllBlockComments")

# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git commit undo: user.vscode("git.undoCommit")
git commit amend: user.vscode("git.commitStagedAmend")
git diff: user.vscode("git.openChange")
git fetch: user.vscode("git.fetch")
git fetch all: user.vscode("git.fetchAll")
git merge: user.vscode("git.merge")
git output: user.vscode("git.showOutput")
git push: user.vscode("git.push")
# git push force: user.vscode("git.pushForce")
git reveal: user.vscode("git.revealInExplorer")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
git status: user.vscode("workbench.scm.focus")
git stage: user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git sync: user.vscode("git.sync")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
# Use keyboard shortcuts because VSCode relies on when clause contexts to choose the appropriate
# action: https://code.visualstudio.com/api/references/when-clause-contexts
change next: key(alt-f5)
change last: key(shift-alt-f5)

# Testing
test (here | it): user.vscode("testing.runAtCursor")
test [run] (file | doc): user.vscode("testing.runCurrentFile")
test everything: user.vscode("testing.runAll")
test [run] failed: user.vscode("testing.reRunFailTests")
test [run] last: user.vscode("testing.reRunLastRun")
(re test) | retest: user.vscode("testing.reRunLastRun")

test debug here: user.vscode("testing.debugAtCursor")
test debug file: user.vscode("testing.debugCurrentFile")
test debug all: user.vscode("testing.debugAll")
test debug failed: user.vscode("testing.debugFailTests")
test debug last: user.vscode("testing.debugLastRun")

test cancel: user.vscode("testing.cancelRun")

# Debugging
break point: user.vscode("editor.debug.action.toggleBreakpoint")
step over: user.vscode("workbench.action.debug.stepOver")
step into: user.vscode("workbench.action.debug.stepInto")
step out of: user.vscode("workbench.action.debug.stepOut")
run here: user.vscode("workbench.action.debug.run")
debug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stopper: user.vscode("workbench.action.debug.stop")
debug continue: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.debug.action.toggleRepl")
debug clean: user.vscode("workbench.debug.panel.action.clearReplAction")

# Terminal
term external: user.vscode("workbench.action.terminal.openNativeConsole")
term make: user.vscode("workbench.action.terminal.new")
term pump: user.vscode("workbench.action.terminal.focusNext")
term tug: user.vscode("workbench.action.terminal.focusPrevious")
term split: user.vscode("workbench.action.terminal.split")
term zoom: user.vscode("workbench.action.toggleMaximizedPanel")
#term chuck: user.vscode("workbench.action.terminal.kill")
term scroll up: user.vscode("workbench.action.terminal.scrollUp")
term scroll down: user.vscode("workbench.action.terminal.scrollDown")
term <number_small>: user.vscode_terminal(number_small)

#Expand/Shrink AST Selection
take less: user.vscode("editor.action.smartSelect.shrink")
take (more | this): user.vscode("editor.action.smartSelect.expand")

hover show: user.vscode("editor.action.showHover")

full screen: user.vscode("workbench.action.toggleFullScreen")

curse undo: user.vscode("cursorUndo")
curse redo: user.vscode("cursorRedo")

take word: user.vscode("editor.action.addSelectionToNextFindMatch")
word pump: user.vscode("editor.action.moveSelectionToNextFindMatch")
word tug: user.vscode("editor.action.moveSelectionToPreviousFindMatch")

(preview markdown) | (markdown preview): user.vscode("markdown.showPreview")

reflow: user.vscode("rewrap.rewrapComment")
break <user.cursorless_target>:
    user.cursorless_command("setSelectionBefore", cursorless_target)
    user.vscode("hideSuggestWidget")
    key("enter")
break:
    user.vscode("hideSuggestWidget")
    key("enter")

dock string <user.cursorless_target>:
    user.cursorless_command("editNewLineBefore", cursorless_target)
    "/**"
    sleep(350ms)
    key(tab)

dock short <user.cursorless_target>:
    user.cursorless_command("editNewLineBefore", cursorless_target)
    "/** "
place <user.any_alphanumeric_key> <user.cursorless_destination>:
    user.cursorless_insert(cursorless_destination, any_alphanumeric_key)

place [word] <word> <user.cursorless_destination>:
    user.cursorless_insert(cursorless_destination, word)
format doc:
    user.vscode("editor.action.formatDocument")
    user.vscode("editor.action.organizeImports")

imports fix:
    sleep(600ms)
    user.vscode_add_missing_imports()
    sleep(250ms)
    user.vscode("editor.action.organizeImports")

# search again: user.vscode("rerunSearchEditorSearch")

typescript restart: user.vscode("typescript.restartTsServer")
