
const fs = require('fs');

const isObject = function isObject(val) { return (val != null) && (Object(val) === val); }

const isArray = Array.isArray ?
	function isArray(val) {
		return Array.isArray(val);
	} :
	function isArray(val) {
		return Object.prototype.toString.call(val) === '[object Array]';
	} ;

const isFunction =
	function isFunction(val) { return typeof val === 'function'; };

const deepMerge = function (a, b) {
	if (isArray(a)) {
		return b;
	} else if (isFunction(a)) {
		return b;
	} else if (isObject(a)) {
		if (isArray(b)) {
			return b;
		} else if (isFunction(b)) {
			return b;
		} else if (isObject(b)) {
			const c = {};
			for (const key in a) {
				if (a.hasOwnProperty(key)) {
					c[key] = a[key];
				}
			}
			for (const key in b) {
				if (b.hasOwnProperty(key)) {
					c[key] = c.hasOwnProperty(key) ? deepMerge(c[key], b[key]) : b[key];
				}
			}
			return c;
		} else {
			return b;
		}
	} else {
		return b;
	}
}

const files = process.argv.slice(2);

const manifest = files.reduce(
	(merged, file) => {
		const fileBody = fs.readFileSync(file, 'utf8');
		const json = JSON.parse(fileBody);
		merged = deepMerge(merged, json);
		return merged;
	},
	{}
);

process.stdout.write(JSON.stringify(manifest, null, '\t'));
