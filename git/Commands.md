# Git tips

### Sparse checkout
1. git clone --no-checkout --depth=1 --filter=tree:0 `<URL>` `<directory>`
2. cd <directory>
3. git sparse-checkout set `<path1>` `<path2>` ...
4. git checkout

### Reset Author
git rebase -r [--root] --exec "git commit --amend --no-edit --reset-author" <hash>

### Annotated vs lightweight tags
Annotated -> tag / light -> commit: git for-each-ref refs/tags

### Debugging
see also [Environment Variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables)
 - ssh connection: GIT_SSH_COMMAND="ssh -v" git ...
 - http connection: GIT_CURL_VERBOSE=true git ...
 - GIT_TRACE=2 git ...
