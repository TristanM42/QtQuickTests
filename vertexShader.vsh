#version 130
in vec4 vertex;
uniform mat4 qt_Matrix;
void main() {
    gl_Position = qt_Matrix * vertex;
    gl_PointSize = 5.0; // Set the point size
}
