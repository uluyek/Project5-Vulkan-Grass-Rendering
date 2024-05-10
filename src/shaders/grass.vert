
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

layout(location = 0) in vec4 grass_v0; 
layout(location = 1) in vec4 grass_v1; 
layout(location = 2) in vec4 grass_v2; 
layout(location = 3) in vec4 grass_up; 

layout(location = 0) out vec4 _v1;
layout(location = 1) out vec4 _v2;
layout(location = 2) out vec4 _up;

out gl_PerVertex {
    vec4 gl_Position;
};

vec4 dirOfWorld(mat4 mproj, vec4 v) {
    vec4 vproj = mproj * vec4(v.xyz, 0.f);
    return vec4(vproj.xyz, v.w);
}
vec4 posOfWorld(mat4 mproj, vec4 v) {
    vec4 vproj = mproj * vec4(v.xyz, 1.f);
    return vec4(vproj.xyz / vproj.w, v.w);
}
void main() {
    gl_Position = posOfWorld(model, grass_v0);
    _v1 = posOfWorld(model, grass_v1);
    _v2 = posOfWorld(model, grass_v2);
    _up = dirOfWorld(model, grass_up);
}
