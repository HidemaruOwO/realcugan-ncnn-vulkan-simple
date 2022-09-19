#!/bin/bash

echo "Running realcugan-ncnn-vulkan."
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
    echo -e "\e[31mbin does not exist.\e[m"
    mkdir bin
fi

if [ -d "./baseimg" ]; then
    echo "baseimg exists."
else
    echo -e "\e[31mbaseimg does not exist.\e[m"
    mkdir baseimg
fi

if [ -d "./dist" ]; then
    echo "dist exists."
else
    echo -e "\e[31mdist does not exist.\e[m"
    mkdir dist
fi

if [ -f "./bin/realcugan-ncnn-vulkan" ]; then
  echo "realcugan-ncnn-vulkan exists."
else
  echo -e "\e[31mrealcugan-ncnn-vulkan does not exist.\e[m"
  echo -e "\e[31mPlease the realcugan-ncnn-vulkan binary in the bin directory.\e[m"
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

echo -e "\e[33mConverting...\e[m"
for i in ${fileary[@]}; do
  echo $i
  ./bin/realcugan-ncnn-vulkan -i $i -o ./dist/$(basename $i).png -s $1 -n $2
  echo -e "\e[32mConverted\e[m"
done

echo -e "\e[36mDone.\e[m"
