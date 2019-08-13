for i in $(seq 1990 2020)
do
  for j in $(echo januar februar maert april mai juni juli august september oktober november dezember)
  do
  cat x.csv | grep $i -i |grep $j -i
  done
done
