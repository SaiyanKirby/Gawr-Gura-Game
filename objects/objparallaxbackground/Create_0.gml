background_layer = layer_create(depth);
background = layer_background_create(background_layer, sprite_index);
layer_background_htiled(background, tiled_x);
layer_background_vtiled(background, tiled_y);