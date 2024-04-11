shape(5,0.5)
  .mult(osc(8,0.25,1))
  .modulateRepeatY(osc(10), 5.0, ({time}) => Math.sin(time) * 5)
  .scale(1,0.5,0.05)
  .out(o0)

src(o0)
  .modulate(noise(15), 0.01)
  .blend(shape(10).color(0, 1, 0), 0.00)
  .rotate(1)
  .out(o0);