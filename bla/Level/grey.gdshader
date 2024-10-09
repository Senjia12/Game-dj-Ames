shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

uniform float grayscale_amount = 0.5; // Valeur entre 0.0 et 1.0 pour ajuster l'effet

void fragment() {
    // Récupère la couleur actuelle de l'écran
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
    
    // Calcul de la luminance pour obtenir le niveau de gris
    float grayscale = dot(screen_color.rgb, vec3(0.299, 0.587, 0.114));
    
    // Mélange entre la couleur d'origine et le niveau de gris
    vec3 mixed_color = mix(screen_color.rgb, vec3(grayscale), grayscale_amount);
    
    // Applique le résultat final
    COLOR = vec4(mixed_color, screen_color.a);
}
