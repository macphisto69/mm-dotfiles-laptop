function ssn --wraps='sudo shutdown -h now' --description 'alias ssn=sudo shutdown -h now'
  sudo shutdown -h now $argv
        
end
