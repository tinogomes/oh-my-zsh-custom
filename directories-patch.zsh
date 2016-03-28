export PROJECTS_PATH="$HOME/Projects"
export CDPATH=.:~:$PROJECTS_PATH

# Always create $PROJECTS_PATH directory at HOME
if [[ ! -d "$PROJECTS_PATH" ]]; then
	mkdir "$PROJECTS_PATH"
fi

alias p='cd $PROJECTS_PATH'
