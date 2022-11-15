# Git tips

### Sparse checkout
1. git clone --no-checkout <URL> <directory>
2. cd <directory>
3. git sparse-checkout init --cone
4. git sparse-checkout set path1 path2/subpath
5. git checkout

### Reset Author
git rebase -r [--root] --exec "git commit --amend --no-edit --reset-author" <hash>
