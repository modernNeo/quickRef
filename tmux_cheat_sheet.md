# TMUX Cheat Sheet

1. Show windows tab at top
in `~/.tmux.conf`
```bash
set-option -g status-position top
```
|                 Session Management | Pane Management         |
|------------------------------------|-------------------------|
|**Creates session with name “foobar”**<br>tmux new -s “foobar”<br>**creates new session and window**<br>tmux new -t “stacy”<br>**detach from session**<br>Ctrl + B, D<br>**retach to previously connected session**<br>tmux a<br>**list sessions**<br>tmux ls<br>**attach to session “0”**<br>tmux a -t 0<br>**kills session bob**<br>tmux kill-session -t bob<br>**kills all sessions**<br>tmux kill-server|**creates new vertical pane**<br>Ctrl + b, %<br>**creates new horizontal pane**<br>Ctrl + b,  “<br>**shows pane index**<br>Ctrl + b, Q<br>**switch to specified pane**<br>Ctrl + b, Q, <index><br>**change size of pane with directional arrows**<br>Ctrl+b, Ctrl<br>**last one but bigger resize steps**<br>Ctrl+b, ALT<br>**use a preset pane layout**<br>Ctrl+b, Alt+<number><br>**opens “kill” mode for pane**<br>Ctrl+b, X|
| Window Management | Copy Paste Management |
| **creates a new window**<br>Ctrl+b, C<br>**moves to the next/previous window**<br>Ctrl+b, N/P<br>**rename window**<br>Ctrl+b, “,”<br>**shows a list of windows**<br>Ctrl+b, W<br>**kills all windows**<br>Ctrl+b, & | `~/.tmux.conf`<br><pre>setw -g mode-keys vi</pre><br>**start copy mode**<br>`Ctrl`+`b`, `[`<br>**start copy selection**<br>`[Space]`<br>**end copy selection**<br>`[Enter]`<br>**paste**<br>`Ctrl`+`b`, `]`|