#!/bin/bash

function not_support {
  echo -e "\e[31mYour platform ($(uname -a)) is not supported.\e[m"
  exit 1
}

function create_bin {
  curl "$1" >> rcnvg.zip
  unzip rcnvg.zip
  rm rcnvg.zip
  mv rcnvg bin
}

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


if type "curl" > /dev/null 2>&1; then
    echo "curl is exist"
  else
    echo -e "\e[31mPlease install curl.\e[m"
    exit 1
fi

if type "unzip" > /dev/null 2>&1; then
    echo "unzip is exist"
  else
    echo -e "\e[31mPlease install unzip.\e[m"
    exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
  OS="Mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  OS="Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then 
  OS="Cygwin"
else
  not_support
fi

CPU_ARCH="$(uname -m)"

if [ "$CPU_ARCH" == "arm64" ] && [ "$OS" == "Mac" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/arm/mac/rcnvg.zip"
elif [ "$CPU_ARCH" == "x86_64" ] && [ "$OS" == "Mac" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/mac/rcnvg.zip"
elif [ "$CPU_ARCH" == "x86_64" ] && [ "$OS" == "Cygwin" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/windows/rcnvg.zip"
elif [ "$CPU_ARCH" == "x86_64" ] && [ "$OS" == "Linux" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/linux/rcnvg.zip"
else
  not_support
fi

echo -e "\e[36mDone.\e[m"

