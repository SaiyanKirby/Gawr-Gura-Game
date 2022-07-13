varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float PixelW;
uniform float PixelH;
uniform float Timer;

vec3 hsv2rgb(vec3 c)
	{
		vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
		vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
		return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
	}

void main()
{
	//OS = original size, in pixels, converted to floats
	vec2 OS;
	OS.x = 1.0/PixelW;
	OS.y = 1.0/PixelH;
	
	float alpha = texture2D(gm_BaseTexture,v_vTexcoord).a;
	
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord - vec2(OS.x,0.0)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord + vec2(OS.x,0.0)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord - vec2(0.0,OS.y)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord + vec2(0.0,OS.y)).a);

	// diagonals
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord - vec2(OS.x,OS.y)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord + vec2(OS.x,OS.y)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord - vec2(OS.x,0.0) + vec2(0.0,OS.y)).a);
	alpha = max(alpha,texture2D(gm_BaseTexture,v_vTexcoord + vec2(OS.x,0.0) - vec2(0.0,OS.y)).a);
	
	float angle = degrees(atan(v_vTexcoord.y - 0.5, v_vTexcoord.x - 0.5));
	
	float hue = mod(angle + Timer, 180.0) / 180.0;
	
	gl_FragColor.rgb = hsv2rgb(vec3(hue, 1.0, 1.0));
	gl_FragColor.a = alpha;
}