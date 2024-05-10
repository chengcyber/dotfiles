; Mapping CapsLock to Control when using Visual Studio

#Requires AutoHotkey v2.0
; #NoEnv is the default setting in AutoHotkey v2 and doesn't need to be explicitly declared.
; #Warn  ; Warnings are enabled by default in v2.

SendMode("Input")  ; The command now requires parentheses and quotes around its argument.

; In v2, you must explicitly use the 'A_' prefix for built-in variables.
SetWorkingDir(A_ScriptDir)  ; Set the working directory to the script directory.

SetTitleMatchMode(2)  ; Command and parameters now require parentheses.

if WinActive("Visual Studio Code") ; The syntax now uses function calls and requires quotes for strings.
{
; The hotkey syntax is mostly unchanged, but the commands they trigger may need adjustments.
CapsLock::Ctrl  ; Using Send function to send Ctrl press.
}