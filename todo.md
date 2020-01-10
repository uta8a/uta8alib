# TodoList
- testをローカルで行う方法の追加 https://qiita.com/shohirose/items/45fb49c6b429e8b204ac
- CMakeLists.txtとCache2のテスト例の追加
- CIの導入
- まず小さな例でCMakeとインクルードを理解する必要がある。

# Done
- library fileの生成 commandline toolの作成
- ngtkanaさん https://github.com/ngtkana/ngtlib/blob/master/make_snippet.sh のように、cargoを使おう。gitmoduleを使う

# 考えていること
- ディレクトリ構成
```
- src
    - rust
        - mod/main.rs
    - cpp
    - python
- .ci-config-file
- test
    - rust
        - testcase
        - verify
    - cpp
        - testcase
        - verify
- docs-out # satysfiのdockerを使ってpdf出力したい
- LICENSE # MIT
- generate-html # netlifyにデプロイする
```
- ファイル名は面倒なのですべてmain.rs, main.cppにしたい
- src/rust/template/main.rsのように分野別はなくして、一同に作る。tagをコメントにつける。tagでhtmlの方から検索できるようにする。
```
// name   : kaito_tateyama (uta8a)
// tag    : "Number Theory", "Geometry"
// comment: 使い方をここに書く

fn func(a:i32) -> i32 {
    a
}
```

### rustのtest
- コピペもしたいので、1ファイルには本体のみ置きたい。testは別々にしたい。
- pubはつけたくない(どうせ1ファイルにまとめるので)
- でも1ファイルにしないとprivate methodにアクセスできない
- **結論** test.shでcargoを新規作成して、そこにrust/example/main.rsとtest/rust/example/main.rsをまとめたものをrust-test/src/example.rsに入れる。あくまで見えているファイルは出力前の状態。

ｗ### git addの前に
- バイナリをcommitしないようにしましょう
```
find . -executable -type f -exec file {} \; | grep -i elf | sed '/^\.\/\.git\//d' | sed -e 's/^\.\/\(.*\):.*/\1/' >> .gitignore
echo "$(sort .gitignore | uniq)" > .gitignore
```

# note
- git submoduleはまず最初にaddを行う。.gitmodulesから自動でとってくるみたいな便利機能はなさそう。
- 自動でgitmodulesに記載されるので気にしない
```
git submodule add git@github.com:uta8a/chan.git chan
```
- remoteの最新に追従する
```
git submodule foreach git pull origin master
```

- https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
- https://www.task-notes.com/entry/20150214/1423882800
- https://www.jonki.net/entry/2016/06/15/220029 ctest --verboseで確かめよう

# circle ci導入
```
❯ curl https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh --fail --show-error |sudo bash
```
- localに、yamlチェック用でインストールしておく
- dockerfileを作る
- pushした
```
docker login
docker build -t uta8a/circleci-rust-cmake:0.0.1 .
docker push uta8a/circleci-rust-cmake:0.0.1
```
- circleci local execute
```
circleci local execute --job build_and_test
```
- ci skip
```
git commit -m "fix: docs [ci skip]"
```

# snippets
- https://githubja.com/sirver/ultisnips
- https://github.com/sirver/ultisnips
- https://sy-base.com/myrobotics/vim/dein/
- https://leico.github.io/TechnicalNote/VimR/Vim-neosnippet-cpp
- https://github.com/Shougo/dein.vim
  - ultisnip

# ライブラリの拡充
- https://github.com/kgtkr/procon-lib-rs/blob/master/src/gcd.rs
  - tkrさんのライブラリ。Rustで参考になる
- http://sigma1113.hatenablog.com/entry/2019/12/14/192945
  - segment tree

# C++とRust
- https://qiita.com/rita0222/items/09e49723e3339ba5de24
  - Traits C++
- https://postd.cc/cpp-for-rust-devs/
  - Rust to C++
- https://dragly.org/2018/04/21/rust-like-traits-in-cpp/
  - Rust like traits C++
- https://qiita.com/akinomyoga/items/506bd1fe47046bd636ae
  - Conceptsの関係