#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec4 inNormal;

layout(location = 0) out vec4 outColor;

void main()
{    
    const vec3 SUNLIGHT_DIR = normalize(vec3(0.6, 1.0, 0.4));
    const vec3 SUNLIGHT_COLOR = vec3(1.0, 1.0, 0.95); // Slightly warm sunlight
    
    const vec3 AMBIENT_COLOR = vec3(0.3, 0.4, 0.5); // Slight blue sky ambient
    const float AMBIENT_STRENGTH = 0.65;
    
    const vec3 GREEN = vec3(0.24, 0.61, 0.09);
    
    vec3 normal = normalize(inNormal.xyz);
    
    float lambert = max(dot(normal, SUNLIGHT_DIR), 0.0);
    
    vec3 diffuse = SUNLIGHT_COLOR * lambert;
    vec3 ambient = AMBIENT_COLOR * AMBIENT_STRENGTH;
    
    vec3 finalColor = GREEN * (diffuse + ambient);
    
    outColor = vec4(finalColor, 1.0);
}
