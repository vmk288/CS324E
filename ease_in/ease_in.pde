float dx = abs(targetX - x);
float easing = 1/(dx*dx) * totalDistance*3;
if (easing < 1.0) {
  x = lerp(x, targetX, easing);
}

float easing = totalDistance/(dx*dx) * totalDistance*3;
easing /= totalDistance;