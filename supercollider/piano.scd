{[SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)]}.play;

({
  var freq;
  freq = [[90, 120]. [80, 70], 98, 67].choose;
  SinOsc.ar(freq, 0, 0.2);
}.play)

{ Pan2.ar(PinkNoise.ar(0.2), -0.3) }.play; // slightly to the left

{ Pan1.ar(BrownNoise.ar(0.1), -0.3) }.play;

SynthDef(\mall,{arg out=0,note, amp = 1;
  var sig=Array.fill(3,{|n| SinOsc.ar(note.midicps*(n+1),0,0.3)}).sum;
  var env=EnvGen.kr(Env.perc(0.01,1.2), doneAction:2);
  Out.ar(out, sig*env*amp!2);
}).add;

({
  var matrix, index, ind, notes, times, n, a;

  notes = [48, 53, 52, 57, 53, 59, 60] + 12;
  times = [1/2, 1/2, 1, 1/2, 1/2, 1, 1]*0.1;
  n = 7;
  matrix = Array.fill(n,{Array.fill(n, {rrand(0, n-1);})});
  index = (0..(n-1));

  a = Prout({
    inf.do({
      ind = [];

      matrix.collect({|row|
        ind = ind ++ [(row * index).sum % n];
        ((row * index).sum % n).yield;
      });
      index = ind;

    });
  });


  Pbind(*[\instrument: \mall, \index: a, \note: Pfunc({|ev| notes[ev[\index]];}), \dur:Pfunc({|ev|
    times[ev[\index]];})]).trace.play;
}.play)


(
var string;
string = "Call me?";
string.postln;
"Ishmael.".postln;
)

// once that's done execute this to make a sound
{ FSinOsc.ar(800, 0, 0.1) }.play;

SynthDef(\mall,{arg out=0,note, amp = 1;
  var sig=Array.fill(3,{|n| SinOsc.ar(note.midicps*(n+1),0,0.3)}).sum;
  var env=EnvGen.kr(Env.perc(0.01,1.2), doneAction:2);
  Out.ar(out, sig*env*amp!2);
}).add;

({
  var matrix, index, ind, notes, times, n, a;

  notes = [48, 53, 52, 57, 53, 59, 60] + 12;
  times = [1/2, 1/2, 1, 1/2, 1/2, 1, 1]*0.5;
  n = 7;
  matrix = Array.fill(n,{Array.fill(n, {rrand(0, n-1);})});
  index = (0..(n-1));

  a = Prout({
    inf.do({
      ind = [];

      matrix.collect({|row|
        ind = ind ++ [(row * index).sum % n];
        ((row * index).sum % n).yield;
      });
      index = ind;

    });
  });

  Pbind(*[\instrument: \mall, \index: a, \note: Pfunc({|ev| notes[ev[\index]];}), \dur:Pfunc({|ev|
    times[ev[\index]];})]).trace.play;
}.play)

// Select all 9 of the following lines and press 'Enter':
w = Window.new("Fading").front;
r = Routine({
    200.do({|i|
        w.view.background = Color.blue(val: 1, alpha: 1 - (i * 0.005));
        0.025.wait;
    });
    w.close;
});
AppClock.play(r);