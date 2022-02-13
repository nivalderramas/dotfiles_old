if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR nvim
set -gx WORKON_HOME ~/dev/venv
set -gx WORKON_SRC_DIR ~/dev
set -gx WORKON_OPEN_SUBLIME False
set -gx MONGO_PORT_DUMP 27017
set -gx MONGO_PORT 27017
set -gx MONGO_HOST LOCALHOST
set -gx MONGO_DB VT
set -gx MONGO_PASSWORD nico0905
set -gx MONGO_PASS nico0905
set -gx MONGO_USER nivalderramas
set -gx MONGO_AUTHDB VT
set -gx MODE dark
#set --servercert pin-sha256:2HDrTUlSMfyVU6+8PmA0lAffhel8/feUP8P8x5aDDUQ=

set -gx TERMINAL /usr/bin/alacritty
set -gx MYVIMRC ~/.config/nvim/init.vim
#Fish
set -g theme_color_scheme nord
set -g theme_git_default_branches master main
set -g theme_git_worktree_support no
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Bogota
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '> '

#rbenv
status --is-interactive; and rbenv init - fish | source

#####################
######SCALING########
#####################
set -gx QT_SCREEN_SCALE_FACTORS 2
set -gx GDK_SCALE 2
set -gx GDK_DPI_SCALE 0.5


if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end



#Fix java applications problem with bspwm
set -gx _JAVA_AWT_WM_NONREPARENTING 1
