# shell_wallet
Store and use your common shell commands. Tested on bash and zsh.


## How to use
1. Clone this repo.
2. `cd` to where the folder that was cloned. Run: `chmod +x shell_wallet.sh`.
3. In the folder where the repo was cloned, created a `commands.txt`.
4. Add your commands to `commands.txt`. Each one should be on a new line.
5. Add this alias to your rc file (.bashrc or .zshrc) `alias shell_wallet="~/path/to/your/dir/shell_wallet.sh"` (replacing the example with the actual path).

Now you can type `shell_wallet` into your terminal emulator running bash or zsh. You should see a list of your commands with the ability to run it or copy it to your clipboard (example: `4` to copy or `4!` to run).
