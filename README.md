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

### 生成された Go のコードについて

生成された Go のコードは、以下のようになっています。
それぞれ入力や型変換に便利な関数が詰まっているので、Go で Atcoder を解くときには便利です。

```go
package main

import (
	"bufio"
	"os"
	"sort"
	"strconv"
	"strings"
)

var sc = bufio.NewScanner(os.Stdin)

func readString() string {
	sc.Scan()
	return sc.Text()
}

func readInt1() int {
	sc.Scan()
	return s2i(sc.Text())
}

func readInt2() (int, int) {
	lines := strings.Split(sc.Text(), " ")
	return s2i(lines[0]), s2i(lines[1])
}

func readInt3() (int, int, int) {
	lines := strings.Split(sc.Text(), " ")
	return s2i(lines[0]), s2i(lines[1]), s2i(lines[3])
}

func readFloat64() float64 {
	sc.Scan()
	r, _ := strconv.ParseFloat(sc.Text(), 64)
	return r
}

func readIntList() []int {
	sc.Scan()
	intList := make([]int, 0)
	text := strings.Split(sc.Text(), " ")
	for _, s := range text {
		intList = append(intList, s2i(s))
	}
	return intList
}

// 昇順にソート
func sortIntListAsc(intList []int) []int {
	sort.Slice(intList, func(i, j int) bool {
		return intList[i] < intList[j]
	})
	return intList
}

// 降順にソート
func sortIntListDes(intList []int) []int {
	sort.Slice(intList, func(i, j int) bool {
		return intList[i] > intList[j]
	})
	return intList
}

// String -> Int
func s2i(s string) int {
	v, ok := strconv.Atoi(s)
	if ok != nil {
		panic("Faild : " + s + " can't convert to int")
	}
	return v
}

// Int -> String
func i2s(i int) string {
	return strconv.Itoa(i)
}

func main() {

}
```

