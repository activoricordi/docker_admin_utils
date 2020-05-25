#!/usr/bin/env bash
set -e

################################################################
#  Provisioning Helper for Vagrant
#   Base (https://github.com/boof/vagrant.sh/blob/master/base.sh)
################################################################
function as () {
    local login=$1
    shift
    local cmd=`echo "$*"`
    su -c "${cmd}" ${login}
}

################################################################
### *function provision*
### Provision function 
### Loads provisioning modules and its dependencies
################################################################
function provision () {
    local module
    for module in $@; do
        # prevent dependency loops
        includes "${module}" $LOADED && continue

        LOADED+=" ${module}"
        source "${DIR}/${module}.sh"
    done
}

################################################################
### *function install*
### The output of all these installation steps is noisy. 
### with this utility the progress report is nice and concise.
### $1 first parameter is the package description. 
### $2 second parameter is the package name
################################################################
function packageInstall {
    echo -e "packageInstall: Package Installation parameters: ${1} Package Name is called ${2}"
    echo -e "packageInstall: Starting installing ${1}"
    apt-get -y -q install "${2}"
    # apt-get -y install "$@" >/dev/null 2>&1
    
    echo -e "packageInstall: Package '${1}' installation completed"
}

################################################################
### *function build dependencies*
### Build Dependencies 
function buildDependencies {
  apt-get -y build-dep "${@}"
}

###############################################################
### *add Repository"
### Add Repository
function addRepository {
  apt-add-repository --yes --update "${@}"
  apt-get update -y -qq
}

################################################################
### *function apt update and upgrade*
### Prior performing installation we  
### with this utility the progress report is nice and concise.
################################################################
function packageManagerUpdate {
    echo -e "Executing Upgrade and Update"
    apt-get update -y -qq && apt-get upgrade -y -qq
}

################################################################
### *function Post Installation CleanUp*
### Perform Post installation cleanup
################################################################
function PostInstallationCleanUp {
    echo -e "Cleaning up..."
    apt-get -y autoremove
    apt-get -y autoclean
    echo -e "... Complete Post Installation Clean Up"
}
    

#################################################################
### * function exe  '[Command Description]' \ [command] [paramters]*
### execute vagrant commands and return success or error messages
### Function by michaelward82 at https://github.com/michaelward82/vagrant-provisioning-shell-function-helper.git
###
################################################################
exe () {
    MESSAGE_PREFIX="\b\b\b\b\b\b\b\b\b\b"
    echo -e "$MESSAGE_PREFIX Execute: $1"
    LOOP=0
    while true;
    do
        if ! [ $LOOP == 0 ]; then echo -e "$MESSAGE_PREFIX ...     "; fi;
        sleep 3;
        LOOP=$((LOOP+1))
    done & ERROR=$("${@:2}" 2>&1)
    status=$?
    kill $!; trap 'kill $!' SIGTERM

    if [ $status -ne 0 ];
    then
        echo -e "$MESSAGE_PREFIX ✖ Error" >&2
        echo -e "$ERROR" >&2
    else
        echo -e "$MESSAGE_PREFIX ✔ Success"
    fi
    return $status
}

#################################################################
### * function prettyTime  '[Seconds]'
### convert seconds in pretty Time to human readable string: 165392 -> 1d 21h 56m 32s
### Function by sindresorhus at https://github.com/sindrerhus/pretty-time-zsh.git
###
################################################################
function prettyTime() {
  local human total_seconds=$1
  local days=$(( total_seconds / 60 / 60 / 24))
  local hours=$(( total_seconds / 60 / 60 % 24 ))
  local minutes=$(( total_seconds / 60 % 60))
  local seconds=$(( total_seconds % 60))

  ((days > 0)) && human +="${days}d "
  ((hours > 0)) && human+="${hours}h "
  ((minutes > 0)) && human+="${minutes}m "
  human+="${seconds}s"

  return "$human"
}

echo -e "Start Server Basic Provisioning ✔ Success"

# Set start time
start_time="$(date +%s)"

# Get domain name passed from Vagrantfile
vagrant_domain=$1

# exe "Performing Ubuntu Package Manager Upgrade and Update"
#    packageManagerUpdate

# install build-essential - It a set of libraries which enables you to build libraries created in emacs and vim.
exe "Install Build Essential Package" \
    packageInstall "Build Essential" build-essential

exe "Install Compiler Package" \
    packageInstall "gcc" gcc 

exe 'Install Patch Package' \
    packageInstall "patch" patch

exe "Install coreutils Package" \
    packageInstall "coreutils" coreutils 

exe 'Install software properties common Package' \
    packageInstall "software-properties-common" software-properties-common

exe 'Install libpq-dev Package' \
    packageInstall "libpq-dev" libpq-dev

exe 'Install libssl-dev Package' \
    packageInstall "libssl-dev" libssl-dev

exe 'Install openssl Package' \
    packageInstall "openssl" openssl

exe 'Install libffi-dev Package' \
    packageInstall "libffi-dev" libffi-dev

exe 'Install zlib1g-dev Package' \
    packageInstall "zlib1g-dev" zlib1g-dev

# Add Repository and Update for running Ansible with Python 3.6
exe 'Add Repository python3.6 and Ansible' \
    addRepository ppa:jonathonf/python-3.6 ppa:ansible/ansible

# Install Python 3.6 at Linux Distro for running Ansible
exe 'Install python3.6 common Package' \
    packageInstall "python3.6" python3.6

exe 'Install python3.6-dev' \
    packageInstall "python3.6-dev" python3.6-dev

exe 'Install ansible' \
    packageInstall "ansible" ansible

exe 'Install python3-pip package' \
    packageInstall "python3-pip" python3-pip

exe 'Install python3-setuptools package' \
    packageInstall "python3-setuptools" python3-setuptools

# We install python 3 apt package (python3-apt) 
# to import python modules: apt, apt_pkg from.
exe 'Install python3 apt' \
    packageInstall "python3-apt" python3-apt

exe 'Perform Post Installation Clean Up'
    PostInstallationCleanUp

sudo echo "alias python=python3" >> ~/.bash_aliases
sudo echo "alias pip=pip3" >> ~/.bash_aliases
source ~/.bash_aliases
echo -e pip --version
echo -e python –version

echo -e "All done!! Provision Complete ✔ Success"

end_time="$(date -u +%s.%N)"
elapsed="$(bc <<<"$end_time-$start_time")"
echo -e "Total of $elapsed seconds elapsed for Provision Virtual Machine"
