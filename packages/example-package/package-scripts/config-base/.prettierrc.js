// WARNING: this package is a controlled file generated from a template
// do not try to make changes in here, they will be overwritten

// if you want to customize prettier for this package, 
// add rules to config-extras instead

const extras = require('../config-extras/.prettierrc.js');

module.exports = {
	useTabs: true,
	semi: true,
	singleQuote: true,
	quoteProps: 'as-needed',
	jsxSingleQuote: false,
	trailingComma: 'es5',
	bracketSpacing: true,
	bracketSameLine: false,
	arrowParens: 'always',
	...extras,
};