rm -rf dist
mkdir dist
emcc -c add.c -o dist/add.o
zig build-obj main.zig -target wasm32-freestanding -fno-entry --export=doCalc -femit-bin=dist/main.o
emcc dist/main.o dist/add.o -o dist/program.wasm --no-entry -s WASM=1 -s EXPORTED_FUNCTIONS='_doCalc' -s ERROR_ON_UNDEFINED_SYMBOLS=1
wasm-objdump -x dist/program.wasm
cp index.html dist/index.html
cp main.js dist/main.js
cd dist
python -m http.server