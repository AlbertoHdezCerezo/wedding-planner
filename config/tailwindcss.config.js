// Tailwind Default Theme
const defaultTheme = require('tailwindcss/defaultTheme')

// Default Tailwind Colors
const colors = require('tailwindcss/colors')

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
  theme: {
    configViewer: {
      fonts: [
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,200&display=swap',
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400&display=swap',
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,700&display=swap',
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@1,200&display=swap',
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@1,400&display=swap',
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@1,700&display=swap',
        'https://fonts.googleapis.com/css2?family=Newsreader:opsz,wght@6..72,400&display=swap',
        'https://fonts.googleapis.com/css2?family=Newsreader:opsz,wght@6..72,300&display=swap'
      ]
    },
    fontFamily: {
      ibm: ['IBM Plex Sans'],
      newsreader: ['Newsreader']
    },
    colors: {
      transparent: 'transparent',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
      primary: {
        DEFAULT: '#6CCACC',
        100: '#102e2e',
        200: '#205b5c',
        300: '#31898a',
        400: '#41b6b8',
        500: '#6ccacc',
        600: '#89d4d6',
        700: '#a7dfe0',
        800: '#c4eaea',
        900: '#e2f4f5'
      },
      tiffany_blue: {
        DEFAULT: '#6CCACC',
        100: '#102e2e',
        200: '#205b5c',
        300: '#31898a',
        400: '#41b6b8',
        500: '#6ccacc',
        600: '#89d4d6',
        700: '#a7dfe0',
        800: '#c4eaea',
        900: '#e2f4f5'
      },
      maize: {
        DEFAULT: '#FEE644',
        100: '#403700',
        200: '#806f01',
        300: '#c0a601',
        400: '#fedc03',
        500: '#fee644',
        600: '#feea69',
        700: '#feef8e',
        800: '#fff5b4',
        900: '#fffad9'
      },
      wheat: {
        DEFAULT: '#FDE4BB',
        100: '#553503',
        200: '#aa6b05',
        300: '#f89f10',
        400: '#fac165',
        500: '#fde4bb',
        600: '#fde9c8',
        700: '#feeed5',
        800: '#fef4e3',
        900: '#fff9f1'
      },
      tyrian_purple: {
        DEFAULT: '#4C062B',
        100: '#0f0109',
        200: '#1e0211',
        300: '#2d041a',
        400: '#3c0522',
        500: '#4c062b',
        600: '#9b0d58',
        700: '#ea1386',
        800: '#f260ae',
        900: '#f9b0d7'
      },
      cerise: {
        DEFAULT: '#DD2764',
        100: '#2d0714',
        200: '#5a0e27',
        300: '#87153b',
        400: '#b41c4f',
        500: '#dd2764',
        600: '#e45283',
        700: '#eb7da2',
        800: '#f2a9c1',
        900: '#f8d4e0'
      },
      office_green: {
        DEFAULT: '#267406',
        100: '#071701',
        200: '#0f2f02',
        300: '#164604',
        400: '#1e5d05',
        500: '#267406',
        600: '#3dbe0a',
        700: '#5df322',
        800: '#93f76c',
        900: '#c9fbb5'
      },
      dark_moss_green: {
        DEFAULT: '#175500',
        100: '#051100',
        200: '#092300',
        300: '#0e3400',
        400: '#124500',
        500: '#175500',
        600: '#2eab00',
        700: '#45ff01',
        800: '#83ff56',
        900: '#c1ffaa'
      },
      cinnabar: {
        DEFAULT: '#ED4B34',
        100: '#350a05',
        200: '#6b1509',
        300: '#a01f0e',
        400: '#d62913',
        500: '#ed4b34',
        600: '#f16f5e',
        700: '#f49386',
        800: '#f8b7ae',
        900: '#fbdbd7'
      }
    }
  },
  variants: {},
  plugins: []
}
