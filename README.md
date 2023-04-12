# atcoder

Atcoder の環境構築をしてくれるスクリプトです。(自分用)

## 使い方

### 1. リポジトリをクローンします。
```shell
$ git clone git@github.com:abe-tetsu/atcoder.git
```

### 2. サンプルテストケースをダウンロードしてくれるライブラリをインストールします。
```shell
$ pip3 install online-judge-tools
$ pip3 install online-judge-template-generator
```

ライブラリの詳細はこちらを参照してください。
https://github.com/online-judge-tools/oj/blob/master/docs/getting-started.ja.md

### 3. make init で始めることができます。

```shell
$ make init
```

## make init について

```shell
 $ make init                                                                        [~/test/atcoder@main]
./scripts/init.sh
================== init Start ==================
解く問題のURLを入力してください。
例: https://atcoder.jp/contests/abc289
URL: <URL を入力してください>
ディレクトリ名: <ディレクトリ名を入力してください>
```

### maek init の実行例

```shell
 $ make init                                                                        [~/test/atcoder@main]
./scripts/init.sh
================== init Start ==================
解く問題のURLを入力してください。
例: https://atcoder.jp/contests/abc289
URL: https://atcoder.jp/contests/abc289
ディレクトリ名: test
```

以上のコードを実行すると、入力したディレクトリに問題のテストケースと、Goのコードのテンプレートが作成されます。

```shell
 $ tree test                                                                     [~/gitrepo/atcoder@main]
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
├── D
│   ├── main.go
│   └── test
│       ├── sample-1.in
│       ├── sample-1.out
│       ├── sample-2.in
│       ├── sample-2.out
│       ├── sample-3.in
│       └── sample-3.out
└── Makefile
```

### テストの走らせ方

生成されたディレクトリ内にある Makefile から実行することで、テストケースを走らせることができます。
上で生成した test ディレクトリを例に挙げます。

```shell
$ cd test
$ make test-A  # Aのテストをします
$ make test-B  # Bのテストをします
$ make test-C  # Cのテストをします
$ make test-D  # Dのテストをします
```

### ランダムテストの生成

テストの走らせ方 と同様に、生成されたディレクトリ内にある Makefile から実行します。

```shell
$ cd test
$ make random-A  # Aのランダムテストを生成します
$ make random-B  # Bのランダムテストを生成します
$ make random-C  # Cのランダムテストを生成します
$ make random-D  # Dのランダムテストを生成します
```

make random-A を実行したら、A ディレクトリ配下にランダムテストが生成されます。
生成された後に make test-A をするのがおすすめです。

ランダムテストの生成は失敗する可能性があります。
失敗したら、generate.py を編集して、よしなにしてください。

### 生成された Go のコードについて

生成された Go のコードは、以下のようになっています。
それぞれ入力や型変換に便利な関数が詰まっているので、Go で Atcoder を解くときには便利です。

