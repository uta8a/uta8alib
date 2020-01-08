# uta8alib
競技プログラミングのライブラリ周りの環境整備をしたい

[Todo](./todo.md)

# git addの前に
- バイナリをcommitしないようにしましょう
```
find . -executable -type f -exec file {} \; | grep -i elf | sed '/^\.\/\.git\//d' | sed -e 's/^\.\/\(.*\):.*/\1/' >> .gitignore
echo "$(sort .gitignore | uniq)" > .gitignore
```
