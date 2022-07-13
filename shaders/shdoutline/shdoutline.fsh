varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float PixelW;
uniform float PixelH;
uniform float Timer;

void main()
{
	//OS = original size, in pixels
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
	
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture,v_vTexcoord);
	gl_FragColor.a = alpha;
}