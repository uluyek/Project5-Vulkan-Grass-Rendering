#version 450
#extension GL_ARB_separate_shader_objects : enable

#define SHAPE_THRESH  0.5
#define shapefuc(u, v)  (0.5 + (u-0.5)*(1- (max(v-SHAPE_THRESH, 0))/(1- SHAPE_THRESH) ) )
//#define shapefuc(u, v)  (u+0.5*v-u*v)
//#define shapefuc(u, v)  (u - u * v * v)
layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    mat4 invView;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 grass_v1[];
layout(location = 1) in vec4 grass_v2[];
layout(location = 2) in vec4 grass_up[];

layout(location = 0) out vec3 vec_pos;
layout(location = 1) out vec3 vec_norm;
layout(location = 2) out vec2 vec_uv;

vec3 translatevec(vec3 v0, vec3 v1, float v)
{
return v0+ v*(v1-v0);
}
void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

    vec3 v0 = gl_in[0].gl_Position.xyz;
    vec3 v1 = grass_v1[0].xyz;
    vec3 v2 = grass_v2[0].xyz;
    vec3 up = grass_up[0].xyz;

    float theta = gl_in[0].gl_Position.w;
    vec3 t1 = vec3(cos(theta), 0, sin(theta)); // bitangent
    float w = grass_v2[0].w;

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    vec3 a = translatevec(  v0,   v1,   v);  
    vec3 b = translatevec(  v1,   v2,   v); 
    vec3 c = translatevec(  a,   b,   v);  
    vec3 c0 = c - w * t1;
    vec3 c1 = c + w * t1;

    vec3 n = normalize(cross(b - a, t1));

    float t = shapefuc(u, v);
    vec3 pos = (1 - t) * c0 + t * c1;

    gl_Position = camera.proj * camera.view * vec4(pos, 1.f); // project to clip space

    vec_pos = pos; 
    vec_norm = n;
    vec_uv = vec2(u,v);
}
