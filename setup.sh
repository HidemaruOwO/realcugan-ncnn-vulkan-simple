#!/bin/bash

function not_support {
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
}

function create_bin {
  curl "$1" >> rcnvg.zip
  unzip rcnvg.zip
  mv rcnvg bin

}

if type "curl" > /dev/null 2>&1; then
    echo "curl is exist"
  else
    echo "Please install curl."
    exit 1
fi

if type "unzip" > /dev/null 2>&1; then
    echo "unzip is exist"
  else
    echo "Please install unzip."
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

ARCH="$(uname -m)"

if [ "$(ARCH)" == "arm64" ] && ["$(OS)" == "Mac"]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/arm/mac/rcnvg.zip"
elif [ "$(ARCH)" == "x86_64" ] && [ "$(OS)" == "Mac" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/mac/rcnvg.zip"
elif [ "$(ARCH)" == "x86_64" ] && [ "$(OS)" == "Cygwin" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/windows/rcnvg.zip"
elif [ "$(ARCH)" == "x86_64" ] && [ "$(OS)" == "Linux" ]; then
  create_bin "https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/linux/rcnvg.zip"
else
  not_support
fi

echo "Done."

