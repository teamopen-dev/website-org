#!/usr/bin/env node

// Can be installed with npm i trianglify
// GPL3 licensed

const Trianglify = require('trianglify');
const {writeFileSync} = require('fs');
const {resolve} = require('path');

if(!process.argv[2]) {
	throw 'Please provide a path as CLI argument to output the file to.';
}

const outPath = resolve(process.argv[2]);
console.log('Writing file to', outPath);

const pattern = Trianglify({width: 1440, height: 900});
const svgData = pattern.svg({includeNamespace: true});
writeFileSync(outPath, svgData.outerHTML);
