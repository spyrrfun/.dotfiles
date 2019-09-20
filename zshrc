function workon() {
	BASE=~/.py/;
	if [ ${#} -eq 0 ]; then
		echo "Usage: workon [virtualenv dir]";
		return;
	fi
	[ -d ${BASE}${1} ] && source ${BASE}${1}/bin/activate || echo "There is no virtual environment, '${1}'"
}
