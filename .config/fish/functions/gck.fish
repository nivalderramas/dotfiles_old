function gck --wraps='git commit' --wraps='git checkout' --description 'alias gck git checkout'
  git checkout $argv; 
end
