DIRECTORY="results"
if [ ! -d "$DIRECTORY" ]; then
  echo "Directory $DIRECTORY does not exist, creating..."
  mkdir -p "$DIRECTORY"
else
  echo "Directory $DIRECTORY already exists."
fi

for i in {1..5}; do
  for j in {1..5}; do
    for mode in AI Student; do
      echo "Running: ./autoplayer $i $j $mode > out_${i}_${j}_${mode}.txt"
      ./autoplayer "$i" "$j" "$mode" > "${DIRECTORY}/out_${i}_${j}_${mode}.txt"
    done
  done
done

echo "Finished"