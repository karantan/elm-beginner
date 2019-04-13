# convince Makefile

.PHONY: fmt
fmt:
	@elm-format src/* --yes

.PHONY: hello
hello:
	@elm make src/01_Hello.elm --output=js/hello.js

.PHONY: hello2
hello2:
	@elm make src/02_Hello2.elm --output=js/hello2.js


.PHONY: reactor
reactor:
	@elm reactor
