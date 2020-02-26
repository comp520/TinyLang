OCAMLBUILD := ocamlbuild -no-links -use-menhir -menhir "menhir -v"

main:
	@$(OCAMLBUILD) main.byte
	@ln -sf _build/main.byte tiny

check:
	./check

clean:
	$(OCAMLBUILD) -clean
	rm -f tiny result
