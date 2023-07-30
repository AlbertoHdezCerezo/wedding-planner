const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config} */
module.exports = {
	// Just-In-Time compilation mode:
	// https://v2.tailwindcss.com/docs/just-in-time-mode
	mode: 'jit',
	// Set of files using TailwindCSS classes. TW will use these paths to find
	// usages of TW CSS classes, so it only compiles the minimal set of them
	// being used by the application (when JIT mode is enabled)
	// https://tailwindcss.com/docs/content-configuration
	content: [
		'./test/components/previews/**/*',
		'./app/javascript/**/*',
		'./app/components/**/*',
		'./app/helpers/**/*',
		'./app/views/**/*'
	],
	theme: {},
	variants: {},
	plugins: []
}
