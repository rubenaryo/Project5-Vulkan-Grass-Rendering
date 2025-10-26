#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4[] inV0;
layout(location = 1) in vec4[] inV1;
layout(location = 2) in vec4[] inV2;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade

    gl_Position = camera.proj * camera.view * (inV0[0] + vec4(u, v, 0.0, 0.0));
}
