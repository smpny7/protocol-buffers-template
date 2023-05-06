.PHONY: build
build:
	@docker run --rm -v `pwd`:/workdir -w /workdir \
	ghcr.io/amothic/protoc --proto_path=proto \
	--go_out=go/grpcservice \
	--go_opt=paths=source_relative \
	--go-grpc_out=go/grpcservice \
	--go-grpc_opt=paths=source_relative \
	--js_out=import_style=commonjs:typescript/grpcservice --ts_out=service=grpc-web:typescript/grpcservice \
	--python_out=python/grpcservice \
	--experimental_allow_proto3_optional \
	proto/*.proto

.PHONY: mock
mock:
	npm install grpc-tools grpc_tools_node_protoc_ts --save-dev
	npx grpc_tools_node_protoc --proto_path=proto \
	--js_out=import_style=commonjs,binary:typescript/mock \
	--grpc_out=grpc_js:typescript/mock \
	--ts_out=grpc_js:typescript/mock \
	proto/*.proto

.PHONY: clean
clean:
	rm -f go/grpcservice/*.go python/grpcservice/*.py typescript/grpcservice/*.ts typescript/grpcservice/*.js typescript/mock/*.ts typescript/mock/*.js

.PHONY: lint
lint:
	@docker run -v `pwd`:/workdir -w /workdir yoheimuta/protolint lint proto
