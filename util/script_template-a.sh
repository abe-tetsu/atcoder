
# make random-A が実行された時のスクリプト

# .envファイルから、環境変数URLと、CONTESTを取得
export $(grep -v '^#' .env | xargs)

# QUESTION=URL+"/tasks"+CONTEST+"_"+A
QUESTION="${URL}"/tasks/"${CONTEST}"_A

cd A && oj-prepare $QUESTION

# oj g/i ./generate.py を実行
oj g/i ./generate.py

cd ..
