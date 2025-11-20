shader_type canvas_item;

uniform float scale : hint_range(1.0, 100.0) = 1.0;
uniform float speed : hint_range(0.0, 10.0) = 1.0;
uniform vec4 color_on : source_color = vec4(0.0, 0.25, 0.80, 1.0);
uniform vec4 color_off : source_color = vec4(0.0, 0.0, 0.75, 1.0);

// Rotate any 2D vector by an angle (in radians)
vec2 rotate(vec2 p, float angle) {
    float c = cos(angle);
    float s = sin(angle);
    return vec2(
        p.x * c - p.y * s,
        p.x * s + p.y * c
    );
}

void fragment() {
    // Rotate UV around center (0.5, 0.5)
    vec2 uv = UV + vec2(TIME * speed/100.0, TIME * speed/100.0);
    uv = rotate(uv, radians(50.0));
    uv += vec2(0.5);

    // Tile pattern
    vec2 gv = fract(uv * scale);

    // Cube padding
    float edge = 0.2;

    float cube =
        step(edge, gv.x) * step(edge, gv.y) *
        step(gv.x, 1.0 - edge) * step(gv.y, 1.0 - edge);

    COLOR = mix(color_off, color_on, cube);
}
