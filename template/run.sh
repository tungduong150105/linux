# Get name of problem
PROBLEM=""
for file in *.cpp; do
  PROBLEM="${file%.cpp}"
done

# For testcase
i=1
case_passed=0
case_failed=0
Red='\033[0;31m'
Green='\033[0;32m'
Color="$Green"
for file in *.in; do
  NAMECASE="CASE$i"
  CASE="${file%.in}"
  ./"$PROBLEM" < "$CASE".in > "$CASE".res
  DIFF=$(diff "$CASE".res "$CASE".out) 
  if [ "$DIFF" != "" ]; then
    case_failed=$((case_failed+1))
    Color="$Red"
  else
    case_passed=$((case_passed+1))
  fi
  i=$((i+1))
done

i=$((i-1))

# Print answer
echo "Answer:"
for file in *.out; do
  cat "$file"
done

echo "----------"

echo "Output:"
for file in *.res; do
  cat "$file"
done

echo "----------"

if [ "$case_failed" != 0 ]; then
  echo "${Red}Failed"
else
  echo "${Green}Passed"
fi

echo "${Color}$case_passed / $i tests passed"
