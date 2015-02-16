# ===========================
#     DOUBAN VAGRANT FUNC
# ===========================

douban() {
  local id="71351b4"
  if [[ $1 = "up" ]] ; then
    vagrant up $id
  elif [[ $1 = "ssh" ]] ; then
    vagrant ssh $id
  elif [[ $1 = "halt" ]] ; then
    vagrant hatl $id
  elif [[ $1 = "resume" ]] ; then
    vagrant resume $id
  elif [[ $1 = "reload" ]] ; then
    vagrant reload $id
  elif [[ $1 = "provision" ]] ; then
    vagrant reload --provision $id
  fi
}
