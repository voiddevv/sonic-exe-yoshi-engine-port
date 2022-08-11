#pragma header

uniform float iTime;
uniform bool vignetteOn;
uniform bool perspectiveOn;
uniform bool distortionOn;
uniform bool scanlinesOn;
uniform bool vignetteMoving;
uniform sampler2D noiseTex;
uniform float glitchModifier;
uniform vec3 iResolution;

float onOff(float a,float b,float c)
{
	return step(c,sin(iTime+a*cos(iTime*b)));
}

float ramp(float y,float start,float end)
{
	float inside=step(start,y)-step(end,y);
	float fact=(y-start)/(end-start)*inside;
	return(1.-fact)*inside;
	
}

vec4 getVideo(vec2 uv)
{
	vec2 look=uv;
	if(distortionOn){
		float window=1./(1.+20.*(look.y-mod(iTime/4.,1.))*(look.y-mod(iTime/4.,1.)));
		look.x=look.x+(sin(look.y*10.+iTime)/50.*onOff(4.,4.,.3)*(1.+cos(iTime*80.))*window)*(glitchModifier*2.);
		float vShift=.4*onOff(2.,3.,.9)*(sin(iTime)*sin(iTime*20.)+
		(.5+.1*sin(iTime*200.)*cos(iTime)));
		look.y=mod(look.y+vShift*glitchModifier,1.);
	}
	vec4 video=flixel_texture2D(bitmap,look);
	
	return video;
}

vec2 screenDistort(vec2 uv)
{
	if(perspectiveOn){
		uv=(uv-.5)*2.;
		uv*=1.1;
		uv.x*=1.+pow((abs(uv.y)/5.),2.);
		uv.y*=1.+pow((abs(uv.x)/4.),2.);
		uv=(uv/2.)+.5;
		uv=uv*.92+.04;
		return uv;
	}
	return uv;
}
float random(vec2 uv)
{
	return fract(sin(dot(uv,vec2(15.5151,42.2561)))*12341.14122*sin(iTime*.03));
}
float noise(vec2 uv)
{
	vec2 i=floor(uv);
	vec2 f=fract(uv);
	
	float a=random(i);
	float b=random(i+vec2(1.,0.));
	float c=random(i+vec2(0.,1.));
	float d=random(i+vec2(1.));
	
	vec2 u=smoothstep(0.,1.,f);
	
	return mix(a,b,u.x)+(c-a)*u.y*(1.-u.x)+(d-b)*u.x*u.y;
	
}

vec2 scandistort(vec2 uv){
	float scan1=clamp(cos(uv.y*2.+iTime),0.,1.);
	float scan2=clamp(cos(uv.y*2.+iTime+4.)*10.,0.,1.);
	float amount=scan1*scan2*uv.x;
	
	uv.x-=.05*mix(flixel_texture2D(noiseTex,vec2(uv.x,amount)).r*amount,amount,.9);
	
	return uv;
	
}
void main()
{
	vec2 uv=openfl_TextureCoordv;
	vec2 curUV=screenDistort(uv);
	uv=scandistort(curUV);
	vec4 video=getVideo(uv);
	float vigAmt=1.;
	float x=0.;
	
	video.r=getVideo(vec2(x+uv.x+.001,uv.y+.001)).x+.05;
	video.g=getVideo(vec2(x+uv.x+0.,uv.y-.002)).y+.05;
	video.b=getVideo(vec2(x+uv.x-.002,uv.y+0.)).z+.05;
	video.r+=.08*getVideo(.75*vec2(x+.025,-.027)+vec2(uv.x+.001,uv.y+.001)).x;
	video.g+=.05*getVideo(.75*vec2(x+-.022,-.02)+vec2(uv.x+0.,uv.y-.002)).y;
	video.b+=.08*getVideo(.75*vec2(x+-.02,-.018)+vec2(uv.x-.002,uv.y+0.)).z;
	
	video=clamp(video*.6+.4*video*video*1.,0.,1.);
	if(vignetteMoving)
	vigAmt=3.+.3*sin(iTime+5.*cos(iTime*5.));
	
	float vignette=(1.-vigAmt*(uv.y-.5)*(uv.y-.5))*(1.-vigAmt*(uv.x-.5)*(uv.x-.5));
	
	if(vignetteOn)
	video*=vignette;
	
	gl_FragColor=mix(video,vec4(noise(uv*75.)),.05);
	
	if(curUV.x<0.||curUV.x>1.||curUV.y<0.||curUV.y>1.){
		gl_FragColor=vec4(0,0,0,0);
	}
	
}