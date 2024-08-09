# Git tips

### Sparse checkout
1. git clone --no-checkout --depth=1 --filter=tree:0 `<URL>` `<directory>`
2. cd <directory>
3. git sparse-checkout set `<path1>` `<path2>` ...
4. git checkout

### Reset Author
git rebase -r [--root] --exec "git commit --amend --no-edit --reset-author" <hash>

### Debug ssh connection
GIT_SSH_COMMAND="ssh -v" git ...
