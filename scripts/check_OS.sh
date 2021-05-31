
check_OS(){
  if [[ "$(uname)" == "Darwin"  ]]; then
    export OS="Mac"
  else
    export OS="Linux"
  fi
}

check_OS

echo "OS : ${OS}"

