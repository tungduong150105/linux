# Get name of problem
PROBLEM=""
for file in *.cpp; do
  PROBLEM="${file%.cpp}"
done

echo "g++ -o "$PROBLEM" "$PROBLEM".cpp -O2"
echo "Building..."
g++ -o "$PROBLEM" "$PROBLEM".cpp -O2
echo "Done."
echo ""
