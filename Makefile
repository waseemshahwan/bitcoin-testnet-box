BLOCKS=1

start:
	docker-compose up -d --build

generate:
	docker exec -it bitcoin-1 bitcoin-cli generate $(BLOCKS)

getblockchaininfo:
	docker exec -it -u bitcoind bitcoin-1 bitcoin-cli getblockchaininfo
	docker exec -it -u bitcoind bitcoin-2 bitcoin-cli getblockchaininfo

stop:
	docker-compose down

clean:
	find $$(pwd)/bitcoin/regtest/* -not -name 'server.*' -exec rm -rf {} \;
