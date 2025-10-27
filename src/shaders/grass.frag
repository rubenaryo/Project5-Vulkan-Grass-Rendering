#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec4 inNormal;

layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color

    const vec4 GREEN = vec4(0.24, 0.61, 0.09, 1.0);
    outColor = vec4(inNormal.xyz, 1.0);
}
