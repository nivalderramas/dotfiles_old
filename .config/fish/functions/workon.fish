function workon -d "Activate virtual environment in $WORKON_HOME"
  set tgt {$WORKON_HOME}/$argv[1]
  if [ -d $tgt ]
    cd $tgt

    # deactivate any active venv, and activate the target
    # this needs to be rewritten with the `type` fish command
    if test -n "$VIRTUAL_ENV"
      deactivate
    end

    . bin/activate.fish

    if test (count $argv) -gt 1
      if test $argv[2] = "open"
        set -gx WORKON_OPEN_SUBLIME True
      end
    else
      set -ge WORKON_OPEN_SUBLIME
    end

    # open sublime text
    if test -n "$WORKON_OPEN_SUBLIME"
      open {$WORKON_SRC_DIR}/{$argv[1]}.sublime-project
    end

    # change to working dir
    if test -n "$WORKON_SRC_DIR"
      cd {$WORKON_SRC_DIR}/{$argv[1]}
    end
  else
    echo "$tgt not found"
  end
end

complete -c workon -a "(cd $WORKON_HOME; ls -d *)"
