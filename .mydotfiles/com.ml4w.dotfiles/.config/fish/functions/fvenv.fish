function fvenv --wraps='source .venv/bin/activate.fish' --description 'alias fvenv=source .venv/bin/activate.fish'
  source .venv/bin/activate.fish $argv
        
end
