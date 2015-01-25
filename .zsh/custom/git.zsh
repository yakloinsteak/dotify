function git-sync()
{
  if [[ ! -n `ssh-add -l | egrep '^[0-9]'` ]] ; then
    ssh-add
  fi

  for project in ~/prj/**/.git ; do
    pushd $project/..
    git fetch -q
    git push -q mine
    popd
  done
}
