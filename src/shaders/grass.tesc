#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    mat4 invView;
} camera;

// TODO: Declare tessellation control shader inputs and outputs
layout(location = 0) in vec4 grass_v1[];
layout(location = 1) in vec4 grass_v2[];
layout(location = 2) in vec4 grass_up[];

layout(location = 0) out vec4 tes_v1[];
layout(location = 1) out vec4 tes_v2[];
layout(location = 2) out vec4 tes_up[];

in gl_PerVertex
{
  vec4 gl_Position;
} gl_in[gl_MaxPatchVertices];


void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs

    tes_v1[gl_InvocationID] = grass_v1[gl_InvocationID];
    tes_v2[gl_InvocationID] = grass_v2[gl_InvocationID];
    tes_up[gl_InvocationID] = grass_up[gl_InvocationID];

	// TODO: Set level of tesselation
    float dist  = length(camera.view * gl_in[gl_InvocationID].gl_Position);
    float level;
    float idxlevel = (floor(dist/5.0));


    if(idxlevel <1)
    {
    level = 12;
    }
    else if(idxlevel<2)
    {
    level =10;
    }
    else if(idxlevel<4)
    {
    level =6;
    }
    else
    {
    level = 3;
    }

    gl_TessLevelInner[0] = level;
    gl_TessLevelInner[1] = level;
    gl_TessLevelOuter[0] = level;
    gl_TessLevelOuter[1] = level;
    gl_TessLevelOuter[2] = level;
    gl_TessLevelOuter[3] = level;
}

