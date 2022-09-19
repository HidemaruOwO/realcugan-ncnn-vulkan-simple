#!/bin/bash

echo "Running realcugan."
echo "Scale: $1"
echo "Noise: $2"

echo "Checking for existing files."

# is mac os
if [[ "$OSTYPE" == "darwin"* ]]; then
  find -f . | grep .DS_Store | xargs rm
fi

if [ -d "./bin" ]; then
    echo "bin exists."
else
    echo "bin does not exist."
    mkdir bin
fi

if [ -d "./baseimg" ]; then
    echo "baseimg exists."
else
    echo "baseimg does not exist."
    mkdir baseimg
fi

if [ -d "./dist" ]; then
    echo "dist exists."
else
    echo "dist does not exist."
    mkdir dist
fi

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

echo "Converting..."
for i in ${fileary[@]}; do
  echo $i
  ./bin/realcugan -i $i -o ./dist/$(basename $i).png -s $1 -n $2
  echo "Converted"
done

echo "Done."
