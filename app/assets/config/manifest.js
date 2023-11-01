/**
 * Paths used by assets pre-compiler to find asset files to compile.
 *
 * (!) We use PostCSS to compile application.tailwind.scss. Thus, we
 * do not need additional gems such as SASS to process it. Make sure
 * to set up the PostCSS pipeline to compile the .scss into a .css
 * bundle and ignore scss files in the manifest paths, otherwise
 * the pipeline will fail.
 */
//= link_tree ../fonts
//= link_tree ../images
//= link_tree ../builds
