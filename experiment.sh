#!/bin/bash


# The car is black
# The cars are black
# for i in 84 104 101 32 99 97 114 32 105 115 32 98 108 97 99 107
# do 
# 	echo -n `echo "obase=2; ibase=10; $i" | bc`
# done

# for i in The car is black
# do 
# 	echo -n $i
# done

echo "65" | awk '{ printf("%c", $0); }'

alias od="unset DJANGO_SETTINGS_MODULE; export DJANGO_SETTINGS_MODULE=core.settings; printenv | grep DJANGO_SETTINGS_MODULE"
alias gie="nano .git/info/exclude"
alias gia="git add"
alias gss="git show --stat"

quire(){
  if [ -z "$1" ]; then
    pip freeze | egrep -i `python3 -c "print('|'.join([_.split('==')[0] for _ in open('requirements.txt').readlines() if _.strip() and not _.startswith('#')]))"` 
  else
    pip freeze | egrep -i `python3 -c "print('|'.join([_.split('==')[0] for _ in open('$1').readlines() if _.strip() and not _.startswith('#')]))"` 
  fi
}

sitepack(){
  echo `python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}

oneliner(){
  if [ -z "$1" ]; then
    echo -e "\nCall 'oneliner <argument>' to run this command!\n"
  else
    awk '{printf "%s\\n", $0}' $1
  fi
}

rone(){
  if [ -z "$1" ]; then
    echo -e "\nCall 'rone <argument>' to run this command!\n"
  else
    echo "`awk '{printf "%s\\n", $0}' $1.py`" | /usr/bin/env python3
  fi
}

cv(){
  if [ -z "$1" ]; then
    echo -e "\nCall 'cv <output-base>' to run this command!"
    echo "where base can be 2, 8, 10 or 16." 1>&2
  else
    if [ -z "$2" ]; then
      echo -e "\nCall 'cv <output-base> <input-base>' to run this command!"
      echo "where base can be 2, 8, 10 or 16." 1>&2
    else
      if [ -z "$3" ]; then
        echo -e "\nCall 'cv <output-base> <input-base> <number-to-convert>' to run this command!"
        echo "where base can be 2, 8, 10 or 16." 1>&2
      else
        echo "obase=$1; ibase=$2; $3" | bc
      fi
    fi
  fi
}
