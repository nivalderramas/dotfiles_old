function wh --wraps='workon horus && z horus' --description 'alias wh workon horus && z horus'
  workon horus && z horus $argv; 
end
