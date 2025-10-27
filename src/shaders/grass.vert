#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
	mat4 proj;
} camera;

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// From Blades.h
layout(location = 0) in vec4 inV0;
layout(location = 1) in vec4 inV1;
layout(location = 2) in vec4 inV2;
layout(location = 3) in vec4 inUp;

layout(location = 0) out vec4 outV0;
layout(location = 1) out vec4 outV1;
layout(location = 2) out vec4 outV2;


out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
    // Transform to World space
    outV0 = model * vec4(inV0.xyz, 1.0);
    outV1 = model * vec4(inV1.xyz, 1.0);
    outV2 = model * vec4(inV2.xyz, 1.0);

    // Pass secondary attributes as well
    outV0.w = inV0.w;
    outV1.w = inV1.w;
    outV2.w = inV2.w;

    gl_Position = model * vec4(outV0.xyz, 1.0);
}
