# atcoder

Atcoder の環境構築をしてくれるスクリプトです。

# 使い方

## 1. リポジトリをクローンします。
```shell
$ git clone git@github.com:abe-tetsu/atcoder.git
```

## 2. サンプルテストケースをダウンロードしてくれるライブラリをインストールします。
```shell
$ pip3 install online-judge-tools
```

ライブラリの詳細はこちらを参照してください。
https://github.com/online-judge-tools/oj/blob/master/docs/getting-started.ja.md

## 3. make init で始めることができます。

```shell
$ make init
```

# make init の入力

```shell
 $ make init                                                                        [~/test/atcoder@main]
./scripts/init.sh
================== init Start ==================
解く問題のURLを入力してください。
例: https://atcoder.jp/contests/abc289
URL: <URL を入力してください>
ディレクトリ名: <ディレクトリ名を入力してください>
```

以上のコードを実行すると、入力したディレクトリに問題のテストケースと、Goのコードのテンプレートが作成されます。

```shell
$ tree test
test
├── A
│   ├── main.go
│   └── test
│       ├── sample-1.in
│       ├── sample-1.out
│       ├── sample-2.in
│       ├── sample-2.out
│       ├── sample-3.in
│       └── sample-3.out
├── B
│   ├── main.go
│   └── test
│       ├── sample-1.in
│       ├── sample-1.out
│       ├── sample-2.in
│       ├── sample-2.out
│       ├── sample-3.in
│       └── sample-3.out
├── C
│   ├── main.go
│   └── test
│       ├── sample-1.in
│       ├── sample-1.out
│       ├── sample-2.in
│       ├── sample-2.out
│       ├── sample-3.in
│       └── sample-3.out
└── D
    ├── main.go
    └── test
        ├── sample-1.in
        ├── sample-1.out
        ├── sample-2.in
        ├── sample-2.out
        ├── sample-3.in
        └── sample-3.out
```
