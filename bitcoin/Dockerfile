# Ubuntu 14.04 LTS (Trusty Tahr)
FROM ubuntu:14.04
LABEL maintainer="Sean Lavine <lavis88@gmail.com>"

# add bitcoind from the official PPA
# install bitcoind (from PPA) and make
RUN apt-get update && \
	apt-get install --yes software-properties-common && \
	add-apt-repository --yes ppa:bitcoin/bitcoin && \
	apt-get update && \
	apt-get install --yes bitcoind make

RUN adduser --disabled-login --gecos "" bitcoind

RUN mkdir /home/bitcoind/.bitcoin
ADD . /home/bitcoind/.bitcoin
RUN chown -R bitcoind:bitcoind /home/bitcoind/.bitcoin

USER bitcoind

ARG rpcuser=admin
ARG rpcpass=admin
ARG connect=

RUN echo "\nrpcuser=${rpcuser}\nrpcpassword=${rpcpass}\nconnect=${connect}" >> /home/bitcoind/.bitcoin/bitcoin.conf

EXPOSE 19001 19011
CMD bitcoind