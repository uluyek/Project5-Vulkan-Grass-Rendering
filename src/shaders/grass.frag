#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    mat4 invView;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec3 vec_pos;
layout(location = 1) in vec3 vec_norm;
layout(location = 2) in vec2 vec_uv;

layout(location = 0) out vec4 Color;



void main() {
    // TODO: Compute fragment color
    vec3 posOflight = vec3(0.0, 80.0, 0.0);
    vec3 albedo  = vec3(0.2, 0.4, 0.1);

    vec3 l = normalize(posOflight - vec_pos);
    float lambert = max(dot(l, normalize(vec_norm)), 0.0);

    vec3 ret = albedo + lambert * vec3(0.2);

    Color = vec4(ret, 1.f);
}
