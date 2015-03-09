# ===========================
#     VAGRANT FUNC
# ===========================

douban() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    local id="71351b4"
    if [[ $1 = "up" ]] ; then
      vagrant up $id
    elif [[ $1 = "ssh" ]] ; then
      vagrant ssh $id
    elif [[ $1 = "halt" ]] ; then
      vagrant halt $id
    elif [[ $1 = "resume" ]] ; then
      vagrant resume $id
    elif [[ $1 = "reload" ]] ; then
      vagrant reload $id
    elif [[ $1 = "provision" ]] ; then
      vagrant reload --provision $id
    fi
  fi

}

akapollo() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    local id="a4ba3b6"
    if [[ $1 = "up" ]] ; then
      vagrant up $id
    elif [[ $1 = "ssh" ]] ; then
      vagrant ssh $id
    elif [[ $1 = "halt" ]] ; then
      vagrant halt $id
    elif [[ $1 = "resume" ]] ; then
      vagrant resume $id
    elif [[ $1 = "reload" ]] ; then
      vagrant reload $id
    elif [[ $1 = "provision" ]] ; then
      vagrant reload --provision $id
    fi
  fi
}
