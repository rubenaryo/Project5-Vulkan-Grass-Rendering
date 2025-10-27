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

    const vec3 GREEN = vec3(0.24, 0.61, 0.09);
    const vec3 norColor = inNormal.xyz * 0.5 + 0.5;
    outColor = vec4(norColor.rgb, 1.0);
}
