
s.boot;

// Define un sintetizador para el bombo electrónico
(
SynthDef(\elecKick, {
    arg amp = 0.8, freq = 60, decay = 0.3;
    var env = EnvGen.kr(Env.perc(0.01, decay), doneAction: 2);
    var osc = SinOsc.ar(freq) * env;
    var subOsc = SinOsc.ar(freq / 2) * env * 0.5; // Añade un sub-osc para profundidad
    Out.ar(0, (osc + subOsc) * amp);
}).add;


SynthDef(\elecSnare, {
    arg amp = 0.5, freq = 200, decay = 0.2;
    var env = EnvGen.kr(Env.perc(0.005, decay), doneAction: 2);
    var noiseEnv = EnvGen.kr(Env.perc(0.001, decay), doneAction: 2);
    var noise = WhiteNoise.ar() * noiseEnv;
    var osc = Resonz.ar(noise, freq, 0.2) * env * 0.3;
    Out.ar(0, osc * amp);
}).add;


SynthDef(\elecHihat, {
    arg amp = 0.3, decay = 0.05;
    var env = EnvGen.kr(Env.perc(0.001, decay), doneAction: 2);
    var noise = WhiteNoise.ar() * env;
    var hp = HPF.ar(noise, 8000); // Filtro pasa altos
    Out.ar(0, hp * amp);
}).add;


SynthDef(\elecPerc, {
    arg amp = 0.4, freq = 400, decay = 0.1;
    var env = EnvGen.kr(Env.perc(0.001, decay), doneAction: 2);
    var osc = SinOsc.ar(freq) * env;
    var noise = PinkNoise.ar() * env * 0.3;
    Out.ar(0, (osc + noise) * amp);
}).add;
)
// Patrón rítmico combinando bombo, caja, hi-hat y percusión adicional
(
Pdef(\elecRhythm, Pbind(
    \instrument, Pseq([\elecKick, \elecHihat, \elecSnare, \elecHihat, \elecKick, \elecPerc, \elecHihat, \elecSnare, \elecKick, \elecHihat, \elecPerc, \elecHihat, \elecSnare, \elecHihat, \elecPerc, \elecKick], inf),
    \dur, Pseq([0.25, 0.125, 0.25, 0.125, 0.25, 0.125, 0.125, 0.25, 0.25, 0.125, 0.125, 0.125, 0.25, 0.125, 0.125, 0.25], inf), // Duraciones en segundos
    \amp, Pseq([0.8, 0.3, 0.6, 0.3, 0.8, 0.4, 0.3, 0.6, 0.8, 0.3, 0.4, 0.3, 0.6, 0.3, 0.4, 0.8], inf), // Amplitudes
    \pan, Pseq([-0.5, 0.5, -0.3, 0.3, 0, 0.2, -0.2, 0, 0.4, -0.4, 0.1, -0.1, 0.3, -0.3, 0.5, -0.5], inf) // Panning
)).play;
)


