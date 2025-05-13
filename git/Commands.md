# Git tips

### Single branch + second tracking branch
1. git clone --single-branch -b `<remote-branch>` --no-tags `<URL>`
2. git remote set-branches --add `<remote>` `<remote-branch>`
3. git fetch `<remote>` `<remote-branch>`
4. git branch `<local-branch>` `<remote>/<remote-branch>`

### Sparse checkout
1. git clone --no-checkout --depth=1 --filter=tree:0 `<URL>` `<directory>`
2. cd <directory>
3. git sparse-checkout set `<path1>` `<path2>` ...
4. git checkout

### Reset Author
git rebase -r [--root] --exec "git commit --amend --no-edit --reset-author" <hash>

### Annotated vs lightweight tags
git for-each-ref refs/tags
<br>tag --> Annotated / commit --> light

### Commit from tag
git rev-list -n 1 `tag`

### Debugging
see also [Environment Variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables)
 - ssh connection: GIT_SSH_COMMAND="ssh -v" git ...
 - http connection: GIT_CURL_VERBOSE=true git ...
 - GIT_TRACE=2 git ...
