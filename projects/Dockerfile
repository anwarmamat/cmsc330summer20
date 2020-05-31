FROM gradescope/auto-builds

RUN apt-get update \
	&& apt-get install -y ruby-dev sqlite3 libsqlite3-dev\
			ocaml ocaml-native-compilers\
			camlp4 opam make m4 curl\
			default-jre graphviz \
	&& gem install minitest sqlite3 sinatra \
	&& opam init && opam switch 4.07.0  && opam install ocamlfind ounit utop dune qcheck  \
	&& curl https://sh.rustup.rs -sSf > rust_installer.sh && sh rust_installer.sh -y

ENTRYPOINT PATH="$HOME/.cargo/bin:$PATH" && eval $(opam config env) && cd && /bin/bash

# FROM ruby:2.5

# FROM ocaml/opam2-staging
# FROM rust

