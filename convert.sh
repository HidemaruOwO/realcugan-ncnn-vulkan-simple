#!/bin/bash

echo "Running realcugan."
echo "Scale: $1"
echo "Noise: $2"

if [ -f "./bin/realcugan" ]; then
  echo "realcugan exists."
else
  echo "realcugan does not exist."
  echo "Please the realcugan binary in the bin directory."
  exit 1
fi

rm -rf ./dist/*
files="./baseimg/*"
fileary=()
dirary=()
for filepath in $files; do
  if [ -f $filepath ] ; then
    fileary+=("$filepath")
  elif [ -d $filepath ] ; then
    dirary+=("$filepath")
  fi
done

echo "変換中..."
for i in ${fileary[@]}; do
  echo $i
  ./bin/realcugan -i $i -o ./dist/$(basename $i) -s $1 -n $2
  echo "変換完了"
done

echo "Done"
