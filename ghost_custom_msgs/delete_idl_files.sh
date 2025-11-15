#!/bin/bash

# 확인 메시지를 출력하고 사용자의 확인을 기다립니다.
read -p "This will delete all .idl files in the current directory and all subdirectories. Are you sure? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# 현재 디렉토리와 모든 하위 디렉토리에서 .idl 파일을 찾아 삭제합니다.
find . -type f -name "*.idl" -exec rm -f {} \;

echo "All .idl files have been deleted."
