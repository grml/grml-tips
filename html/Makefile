all: html online

html:
	cp ../grml_tips grml_tips
	./grml-tips2html.sh

online: html
	scp grml_tips.html grml:/var/www/grml/tips/index.html

clean:
	rm grml_tips grml_tips.html grml_tips.orig
