#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

_openwebui_venv_install() {
    ynh_exec_as "$app" python3 -m venv --upgrade "$install_dir/venv"
    venvpy="$install_dir/venv/bin/python3"

    ynh_exec_as "$app" "$venvpy" -m pip install --upgrade --no-cache-dir pip

    ynh_exec_as "$app" "$venvpy" -m pip install openwebui
}

# myynh_setup_python_venv() {
#     # Install Python if needed:
#     myynh_install_python

#     ynh_print_info "Create Python virtualenv for $app..."

#     # Create a virtualenv with python installed by myynh_install_python():
#     # Skip pip because of: https://github.com/YunoHost/issues/issues/1960
#     ynh_exec_as_app $py_app_version -m venv --clear --upgrade-deps "$data_dir/.venv"

# 	# Print some version information:
# 	ynh_print_info "venv Python version: $($data_dir/.venv/bin/python3 -VV)"
# 	ynh_print_info "venv Pip version: $($data_dir/.venv/bin/python3 -m pip -V)"

#     ynh_print_info "Install $app dependencies in virtualenv..."
#     ynh_exec_as_app $data_dir/.venv/bin/pip3 install --upgrade pip wheel setuptools
#     ynh_exec_as_app $data_dir/.venv/bin/pip3 install --no-deps -r "$data_dir/requirements.txt"
# }

# myynh_setup_log_file() {
#     mkdir -p "$(dirname "$log_file")"
#     touch "$log_file"

#     chown -c -R $app:$app "$log_path"
#     chmod -c u+rwx,o-rwx "$log_path"
# }