
# make random-C が実行された時のスクリプト

# .envファイルから、環境変数URLと、CONTESTを取得
export $(grep -v '^#' .env | xargs)

# QUESTION=URL+"/tasks"+CONTEST+"_"+C
QUESTION="${URL}"/tasks/"${CONTEST}"_C

cd C && oj-prepare $QUESTION

# oj g/i ./generate.py を実行
oj g/i ./generate.py

cd ..
