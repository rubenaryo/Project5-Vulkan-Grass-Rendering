#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

layout(location = 0) in vec4[] inV0;
layout(location = 1) in vec4[] inV1;
layout(location = 2) in vec4[] inV2;

layout(location = 0) out vec4 outNormal;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

    vec3 v0 = inV0[0].xyz;
    vec3 v1 = inV1[0].xyz;
    vec3 v2 = inV2[0].xyz;

    float rot = inV0[0].w;
    float w = inV2[0].w;

    vec3 t1 = vec3(-cos(rot), 0.0, sin(rot));

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    vec3 a = mix(v0, v1, v);
    vec3 b = mix(v1, v2, v);
    vec3 c = mix(a, b, v);

    vec3 c0 = c - (w * t1);
    vec3 c1 = c + (w * t1);

    vec3 t0 = normalize(b-a);

    const float TAU = 0.001;
    const float ONE_MINUS_TAU = 1.0 - TAU;
    float vMinusTau = max(v-TAU, 0.0);
    float t = 0.5 + (u - 0.5) * (1.0 - (vMinusTau/ONE_MINUS_TAU));

    vec3 p = mix(c0, c1, t);

    vec3 nor = normalize(cross(v0-v1, t1));

    outNormal = vec4(nor, 0.0);
    gl_Position = camera.proj * camera.view * vec4(p, 1.0);
}
