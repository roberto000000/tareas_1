s0.initImage("https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");

// Aplicando blend con ajuste
src(s0)
  .blend(o0, 0.1) 
  .modulateKaleid(osc(2,1,0), 500) // Efecto Kaleidoscopio con moderación
  .scrollX(0.1, 0.2)
  .out();