# function fish_prompt
# 	test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '
#
#     test $USER = 'root'; and echo (set_color red)"#"
#
#     # Main
# 	echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
# end

function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

#    if not set -q __git_cb
#        set __git_cb (set_color $fish_color_keyword)" "(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)""
#    end
#
#    switch $USER
#    case root
#        printf ' %s%s%s# ' (set_color white) (prompt_pwd) $__git_cb
#    case '*'
#        printf ' %s%s%s$ ' (set_color white) (prompt_pwd) $__git_cb
#    end
    switch $USER
    case root
        printf ' %s%s%s# ' (set_color white) (prompt_pwd) (set_color $fish_color_keyword) (fish_git_prompt)(set_color normal)
    case '*'
        printf ' %s%s%s ' (set_color white) (prompt_pwd)(set_color $fish_color_keyword)(fish_git_prompt)(set_color normal)
    end
end
