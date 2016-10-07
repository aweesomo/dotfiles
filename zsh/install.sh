install() {
    install_fzf
    install_fasd
    install_antigen
}

install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

install_fasd () {
    local fasd_script_file="${HOME}/.fasd.zsh"
    local fasd_link_file="${HOME}/.local/bin/fasd"

    if [ ! -e "${fasd_script_file}" ]
    then
        get_url_to_file "https://raw.githubusercontent.com/clvv/fasd/master/fasd" "${fasd_script_file}" || return 1
        chmod 755 "${fasd_script_file}"
    fi

    if [ ! -e "${fasd_link_file}" ]
    then
        ln -s "${fasd_script_file}" "${HOME}/.local/bin/fasd"
    fi
}

get_url_to_file () {
    local url="$1"
    local filename="$2"

    if which wget >/dev/null
    then
        wget --output-document "${filename}" "${url}"
    elif which curl >/dev/null
    then
        curl --location "${url}" > "${filename}"
    else
        echo "Unable to download ${file} from ${url}... wget and curl commands not found"
        return 1
    fi
}

install_antigen() {
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
}

install
