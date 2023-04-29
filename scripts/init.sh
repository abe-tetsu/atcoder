ESC=$(printf '\033') # \e や \x1b または $'\e' は使用しない
printf "${ESC}[32m%s${ESC}[m\n" '================== init Start =================='

# 解く問題のURLを入力
echo "解く問題のURLを入力してください。"
echo "例: https://atcoder.jp/contests/abc289"

# shellcheck disable=SC2162
read -p "URL: " URL
contest=$(basename "${URL}")

# shellcheck disable=SC2162
read -p "ディレクトリ名: " DIR_NAME

# ディレクトリ名が入力された場合、ディレクトリを作成する
if [ -n "$DIR_NAME" ]; then
  echo "ディレクトリ名: $DIR_NAME"

  # ディレクトリが存在しない場合は作成
  if [ ! -d "$DIR_NAME" ]; then
    mkdir "$DIR_NAME"
    cd "$DIR_NAME"
  else
    echo "ディレクトリが既に存在しています。"
    exit 1
  fi

  # 環境変数ファイルを作成し、そこに問題のURLを記載
  touch .env
  echo "URL=$URL" >> .env

  mkdir scripts
  cd scripts
  cat ../../util/script_template-a.sh >> script-a.sh
  cat ../../util/script_template-b.sh >> script-b.sh
  cat ../../util/script_template-c.sh >> script-c.sh
  cat ../../util/script_template-d.sh >> script-d.sh

  chmod +x script-a.sh
  chmod +x script-b.sh
  chmod +x script-c.sh
  chmod +x script-d.sh
  cd ..

  # URLの末尾を取得し、環境変数ファイルに記載
  contest=$(basename "${URL}")
  echo "CONTEST=$contest" >> .env

  # A-D のディレクトリを作成
  for i in {A..D}; do
    mkdir "$i"
  done

  touch Makefile
  cat ../util/Makefile >> Makefile

  # ディレクトリを移動して、テストファイルをダウンロードする。とりえあず a~d まで
  for i in {A..D}; do
    cd "$i"
    touch main.go
    cat ../../util/file_template.go >> main.go
    # URL + /contests + _a, _b, _c, _d
    oj download "${URL}"/tasks/"${contest}"_"$i"
    cd ..
  done

  printf "${ESC}[32m%s${ESC}[m\n" '================== init Finish =================='
else
  echo "ディレクトリ名が入力されていません."
  exit 1
fi
