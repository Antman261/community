#custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
tag(): user.command_search

window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
#multiple_cursor.py support end

pop view [<user.text>]:
    user.vscode("workbench.action.openView")
    insert(user.text or "")

# Sidebar
pop (explore | tree): user.vscode("workbench.view.explorer")
pop (extensions | ext): user.vscode("workbench.view.extensions")
bar run: user.vscode("workbench.view.debug")
pop git: user.vscode("workbench.view.scm")
bar test: user.vscode("workbench.view.testing.focus")
flick side: user.vscode("workbench.action.toggleSidebarVisibility")
search pump: user.vscode("search.action.focusNextSearchResult")
search tug: user.vscode("search.action.focusPreviousSearchResult")
tree collapse: user.vscode("workbench.files.action.collapseExplorerFolders")

scout here: key(cmd-f)
scout space: key(cmd-shift-f)
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
panel control: user.vscode("workbench.panel.repl.view.focus")
<user.teleport> output: user.vscode("workbench.panel.output.focus")
<user.teleport> problems: user.vscode("workbench.panel.markers.view.focus")
panel switch: user.vscode("workbench.action.togglePanel")
# focus editor: user.vscode("workbench.action.focusActiveEditorGroup")
problem show: user.vscode("workbench.panel.markers.view.focus")
(low | flick) (dog | dob): user.vscode("workbench.action.togglePanel")
term show:
    user.vscode("workbench.action.terminal.focus")
    sleep(250ms)
# low show: user.vscode("workbench.action.focusPanel")
pan edit: user.vscode("workbench.action.focusActiveEditorGroup")
<user.teleport> (doc <number_small> | <user.ordinals> doc): 
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
snip next: user.vscode("jumpToNextSnippetPlaceholder")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
(zen switch) | (flick zen): user.vscode("workbench.action.toggleZenMode")

# File Commands
(file hunt | scout file) [<user.text>]:
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
suggest show: user.vscode("editor.action.triggerSuggest")
hint show: user.vscode("editor.action.triggerParameterHints")
definition peek: user.vscode("editor.action.peekDefinition")
definition side: user.vscode("editor.action.revealDefinitionAside")
references show: user.vscode("editor.action.goToReferences")
hierarchy peek: user.vscode("editor.showCallHierarchy")
format that: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
imports fix: user.vscode("editor.action.organizeImports")
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
(<user.teleport> declaration | follow): user.vscode("editor.action.revealDefinition")
spring back: user.vscode("workbench.action.navigateBack")
spring forward: user.vscode("workbench.action.navigateForward")
<user.teleport> implementation: user.vscode("editor.action.goToImplementation")
<user.teleport> type: user.vscode("editor.action.goToTypeDefinition")
<user.teleport> usage: user.vscode("references-view.find")
<user.teleport> references: user.vscode("references-view.find")
<user.teleport> def: user.vscode("editor.action.revealDefinition")
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
git branches: user.vscode("gitlens.views.branches.focus")
git branch: user.vscode("git.branchFrom")
git branch this: user.vscode("git.branch")
git checkout [<user.text>]:
    user.vscode("git.checkout")
    sleep(50ms)
    insert(text or "")
git commit [<user.text>]:
    user.vscode("git.commitStaged")
    sleep(100ms)
    user.insert_formatted(text or "", "CAPITALIZE_FIRST_WORD")
git commit undo: user.vscode("git.undoCommit")
git commit amend: user.vscode("git.commitStagedAmend")
git diff: user.vscode("git.openChange")
git fetch: user.vscode("git.fetch")
git fetch all: user.vscode("git.fetchAll")
git ignore: user.vscode("git.ignore")
git merge: user.vscode("git.merge")
git output: user.vscode("git.showOutput")
git pull: user.vscode("git.pullRebase")
git push: user.vscode("git.push")
# git push force: user.vscode("git.pushForce")
git rebase abort: user.vscode("git.rebaseAbort")
git reveal: user.vscode("git.revealInExplorer")
git revert: user.vscode("git.revertChange")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
git status: user.vscode("workbench.scm.focus")
git stage: user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git sync: user.vscode("git.sync")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
pull request: user.vscode("pr.create")
# Use keyboard shortcuts because VSCode relies on when clause contexts to choose the appropriate
# action: https://code.visualstudio.com/api/references/when-clause-contexts
change next: key(alt-f5)
change last: key(shift-alt-f5)

# Testing
test here: user.vscode("testing.runAtCursor")
test [run] (file | doc): user.vscode("testing.runCurrentFile")
test run all: user.vscode("testing.runAll")
test [run] failed: user.vscode("testing.reRunFailTests")
test [run] last: user.vscode("testing.reRunLastRun")

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
debug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stopper: user.vscode("workbench.action.debug.stop")
debug continue: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.debug.action.toggleRepl")
debug clean: user.vscode("workbench.debug.panel.action.clearReplAction")

# Terminal
term external: user.vscode("workbench.action.terminal.openNativeConsole")
term new: user.vscode("workbench.action.terminal.new")
term next: user.vscode("workbench.action.terminal.focusNext")
term last: user.vscode("workbench.action.terminal.focusPrevious")
term split: user.vscode("workbench.action.terminal.split")
term zoom: user.vscode("workbench.action.toggleMaximizedPanel")
term trash: user.vscode("workbench.action.terminal.kill")
<user.teleport> term: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
term scroll up: user.vscode("workbench.action.terminal.scrollUp")
term scroll down: user.vscode("workbench.action.terminal.scrollDown")
term <number_small>: user.vscode_terminal(number_small)

task run [<user.text>]:
    user.vscode("workbench.action.tasks.runTask")
    insert(user.text or "")

#Expand/Shrink AST Selection
select less: user.vscode("editor.action.smartSelect.shrink")
select (more | this): user.vscode("editor.action.smartSelect.expand")

minimap: user.vscode("editor.action.toggleMinimap")
maximize: user.vscode("workbench.action.minimizeOtherEditors")
restore: user.vscode("workbench.action.evenEditorWidths")

#breadcrumb
select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")
# Use `alt-left` and `alt-right` to navigate the bread crumb

replace here:
    user.replace("")
    key(cmd-alt-l)

hover show: user.vscode("editor.action.showHover")

join lines: user.vscode("editor.action.joinLines")

full screen: user.vscode("workbench.action.toggleFullScreen")

curse undo: user.vscode("cursorUndo")
curse redo: user.vscode("cursorRedo")

select word: user.vscode("editor.action.addSelectionToNextFindMatch")
skip word: user.vscode("editor.action.moveSelectionToNextFindMatch")

install local: user.vscode("workbench.extensions.action.installVSIX")
(preview markdown) | (markdown preview): user.vscode("markdown.showPreview")

#han solo: user.vscode("workbench.action.joinAllGroups")

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
doc move right: user.vscode("workbench.action.moveEditorToRightGroup")
doc move left: user.vscode("workbench.action.moveEditorToLeftGroup")

make executable: user.vscode("chmod.plusX")

{user.search_engine} scout <user.cursorless_target>:
    text = user.cursorless_get_text(cursorless_target)
    user.search_with_search_engine(search_engine, text)
