function update --wraps='sudo pacman -Syu' --description 'alias update=sudo pacman -Syu'
  sudo pacman -Syu && yay -Syu $argv; 
end
