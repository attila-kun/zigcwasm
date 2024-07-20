async function loadWasm() {
    const response = await fetch('program.wasm');
    const buffer = await response.arrayBuffer();
    const { instance } = await WebAssembly.instantiate(buffer, {
        env: {}
    });

    // Access the exported function doCalc
    const result = instance.exports.doCalc();
    document.getElementById('result').textContent = `Result of doCalc: ${result}`;
}

loadWasm();
