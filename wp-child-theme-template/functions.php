<?php
function theme_enqueue_styles() {

    $parent_style = 'parent-style'; // nom du theme parent

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    
     /* ajout theme enfany*/
    wp_enqueue_style( 'child-style',
        get_stylesheet_directory_uri() . '/style.css',
        array( $parent_style ),
        wp_get_theme()->get('Version')
    );
    
    /* Ajout style autre */

    // wp_enqueue_style( "style-custom", get_template_directory_uri() . '/assets/style.css' );    
}
add_action( 'wp_enqueue_scripts', 'my_child-theme_enqueue_styles' );


?>