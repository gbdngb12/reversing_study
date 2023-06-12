#!/bin/sh

# 입력된 매개변수 확인
if [ $# -ne 1 ]; then
  echo "사용법: $0 <파일 이름>"
  exit 1
fi

# 파일 이름을 매개변수로 설정
filename=$1

# 파일 컴파일
gcc "${filename}" -o "x86_64_gcc"
gcc "${filename}" -o "x86_32_gcc" -m32

# objdump 실행
objdump -d -M intel "x86_64_gcc"
echo '------------------------------------------------------------'
objdump -d -M intel "x86_32_gcc"
