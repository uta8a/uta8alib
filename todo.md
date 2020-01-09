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
- 