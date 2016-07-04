# Open the last directory
alias cdlast='cd $( ls -lt | grep d | head -1 |  cut -b 49- )'

# Locaweb Alias
alias nibbler='ssh -i ~/.ssh/id_rsa_gateway _bsantos@nibbler0001.linux.locaweb.com.br'
alias nibbler-ftp='sftp -i ~/.ssh/id_rsa_gateway _bsantos@nibbler0001.linux.locaweb.com.br'

# GIT
alias gsupdate="git submodule foreach git pull origin master"
alias gprune="git remote prune origin"
alias gbdm="git branch --merged master | grep -v 'master$' | xargs git branch -d"

# GIT - Update all post-commit hook in repositories inside this folder
alias gupdatehook='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && rm .git/hooks/post-commit && git init ." \;'

# Ruby & cia
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias brake="bin/rake"
alias brails="bin/rails"

# Fuck!
alias fuck="sudo $(history -p \!\!)"
alias fuck_product="RAILS_ENV=test rake db:drop db:create db:migrate db:seed"

alias recipes-up="bundle exec rails s -p 3001 | grep -v metriks | grep -v COUNT"
alias hodor-up="bundle exec rails s -p 3002"

alias all_projects="ls  ~/projetos/ ~/projetos/locaweb/ | grep -v /"

alias calendar-indicator="/opt/extras.ubuntu.com/calendar-indicator/bin/calendar-indicator &"