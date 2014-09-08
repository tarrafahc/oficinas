Ndef(\wrap).play
(Ndef(\wrap, {var n= 29; Splay.ar({|i|var w= i+LFSaw.ar(i+1*SinOsc.ar(0.1, i/n*2pi, 1, 0.1), 0, 2, 2);Saw.ar(340+LFSaw.ar(0.1, i/n, 10, 10).round(20)+i)%Saw.ar(60+w, SinOsc.ar(0.01, i/n*2pi, 2, 2.05))*0.25;}!n)});)
Ndef(\wrap).stop
