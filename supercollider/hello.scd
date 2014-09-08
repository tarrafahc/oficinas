// print "Hello world!"
"Hello world!".postln;

// play a mixture of an 800 Hz sine tone and pink noise
{ SinOsc.ar(800, 0, 0.1) + PinkNoise.ar(0.01) }.play;

// modulate a sine frequency and a noise amplitude with another sine
// whose frequency depends on the horizontal mouse pointer position
{
	var x = SinOsc.ar(MouseX.kr(1, 100));
	SinOsc.ar(300 * x + 800, 0, 0.1)
	+ PinkNoise.ar(0.1 * x + 0.1)
}.play;

// list iteration: multiply the elements of a collection by their indices
[1, 2, 5, 10, -3].collect { |elem, idx| elem * idx };

// factorial function
f = { |x| if(x == 0) { 1 } { f.(x-1) * x } };

f(12).postln;