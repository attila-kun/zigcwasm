rm -rf dist
mkdir dist
emcc -c add.c -o dist/add.o
zig build-obj main.zig -target wasm32-freestanding -fno-entry --export=doCalc -femit-bin=dist/main.o
zig wasm-ld --no-entry --export-all dist/main.o dist/add.o -o dist/program.wasm
wasm-objdump -x dist/program.wasm
cp index.html dist/index.html
cp main.js dist/main.js
cd dist
python -m http.server