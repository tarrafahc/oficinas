// Krystof Pesek 2014

(
Ndef(\p).fadeTime = 5.0;
Ndef(\p,{|spread = 22|Splay.ar(VarSaw.ar(VarSaw.kr(33).exprange(11,4440).lag({ExpRand()}!8) + {ExpRand()*spread}!16,{ExpRand()*spread}!16),1,0.1)}).play;
Ndef(\aaa,{VarSaw.kr(11).exprange(44,9999).lag({ExpRand()!8})});
Ndef(\p).map(\spread,Ndef(\aaa));
)
s.scope;


(
var fibonacci = 1/[1,1,2,3,5,8,13,21,34,55,89];
Ndef(\a,{|freq = 440| Splay.ar(CombN.ar(Pulse.ar((fibonacci) * 220/60).clip(-1,1) *
  SinOsc.ar((fibonacci)*freq.lag(0.2)) *
  SinOsc.ar((fibonacci)).range(0.0,1.0),0.2,0.2,1.0),0.5,0.2)}).play;
Tdef(\tt,{
  var i = 0;
  var fibonacci = 1/[1,1,2,3,5,8,13,21,34,55,89];
  loop{
    Ndef(\a).set(\freq,(220/(fibonacci.wrapAt(i))));
    i = i + 1;
    1.0.wait;
  }
}).play;
)


(
var tempo = 64.0;
var fade = 1.0;
var arr1 = [1/3,1/6,1/12,1/24,1/48];
var arr2 = [1,1/16,1/32,1/64];
Tdef(\tt,{
  var i = 0;
  loop{
    tempo = "lucas".ascii.wrapAt(i)*64;
    i = i + 1;
    Ndef(\a).fadeTime = fade;
    Ndef(\b).fadeTime = fade;
    Ndef(\c).fadeTime = fade;
    Ndef(\sin).fadeTime = fade;
    Ndef(\a,{Splay.ar((Pulse.ar(arr1*tempo) * VarSaw.ar(22000*{ExpRand()}!8)))}).play;
    Ndef(\b,{Splay.ar((Pulse.ar(arr1*tempo) * BPF.ar(WhiteNoise.ar({ExpRand()}!8),SinOsc.kr(1.0).exprange(44,22000))))}).play;
    Ndef(\c,{Splay.ar((Pulse.ar(arr2*tempo) * SinOsc.ar({WhiteNoise.ar(1.0).range(44,77)}!8)))}).play;
    Ndef(\d,{Splay.ar(Pulse.ar(arr1*tempo) * SinOsc.ar(Saw.ar(arr1*tempo).exprange(44,4444*{ExpRand()}!8)))}).play;
    Ndef(\sin,{Splay.ar(SinOsc.ar(({LFNoise0.ar(tempo).exprange(2000,2200)}!10)+1*{ExpRand()}!10),1,0.1)}).play;
    Ndef(\d,{ Splay.ar(BPF.ar(WhiteNoise.ar(SinOsc.kr(10*{TRand.kr(1.0,1.5)}!8).range(0.001,0.5)),SinOsc.kr(1).range(44,22000))) }).play;
    "bang!".postln;
    5.0.wait;
  }
}).play;
)
NdefMixer(s);


(Ndef(\a).fadeTime = 0.02;Ndef(\a,{|freq = 77,voice = 33| Splay.ar(DelayN.ar(BBandPass.ar(Pulse.ar([3.3,2.2,1.1,0.55,6.6,13.2]).clip() *Blip.ar(SinOsc.kr(3.3).exprange(freq,freq+2.0),voice,1.0),SinOsc.kr(0.3).exprange(77.0,444.0),0.95),0.3,0.252))}).play();)
(Tdef(\tt,{var i = 0;loop{Ndef(\a).set(\freq,[60,63,65,67,69].wrapAt(i).midicps/4.0);Ndef(\a).set(\voice[10,15,12,12,5,12,10,10].wrapAt(i));i = i + 3;2.2.wait();}}).play;)

(
Ndef(\b).fadeTime = 5.0;Ndef(\b,{Splay.ar(Pulse.ar(3.3*[2.0,0.5,0.25,0.0115,1.5,1.75,1.0,0.25]).clip() * SinOsc.ar(77+({ExpRand()*777.0}!8),{ExpRand()}!8,SinOsc.kr({ExpRand()*0.1}!8).exprange(0.1,1.0)))}).play();
)Ndef(\c,{Splay.ar(Pulse.ar(MouseX.kr*[3.3,2.2,1.1,6.6]).clip()*SinOsc.ar(77+{ExpRand()*333.0}!4))}).play();
s.scope;

(
Ndef(\beat).fadeTime = 5.0;
Ndef(\beat,{Splay.ar(
  ~tempo = 122/60; //bpm
  ~freq = Select.kr(Stepper.kr(Impulse.kr(1/2),max:4),[60,62,63,67,69].scramble.midicps*2) * [0.5,0.5,0.25,0.75];
  ~saw = LFPulse.ar([1,2,4]*~tempo) * 4.0 * BPF.ar(WhiteNoise.ar([0.2,0.2,0.1]),[77,322,5431]);
  ~lfo = SinOsc.kr([0.01,0.02]*10).range(0,1);
  ~tone = SinOsc.ar(
    Decay.ar(Impulse.ar([1,2,3,1/2,1/4]*[1,1/2,1/4]*~tempo),~saw).exprange([77,88,99]*[1,2,4],~freq.lag([0.1,0.2])));
  ~oo = Decay.ar(Impulse.ar([1,2,4]*[1,1/2,1/4]*~tempo),~lfo).exprange(0.01,3/~tempo) * ~tone - ~saw;
  CombN.ar(~oo,delaytime:(~lfo*4.0)+0.002*[1,2,4,8,10,20],decaytime:[1,2,4]);
)}).play;
)

(
Ndef(\a).fadeTime = 5.0;
Ndef(\a,{Splay.ar(CombL.ar(VarSaw.ar(2*[98,99,100,101,102,103,104]+SinOsc.kr([1,2,4,8,16]/1000.0).range(1,2),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/8.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/40.0)),0.2,0.21,3.0))}).play;
Ndef(\b).fadeTime = 5.0;
Ndef(\b,{Splay.ar(CombL.ar(VarSaw.ar(1.01*[98,99,100,101,102,103,104,105]+SinOsc.kr([1,2,4,8,16]/1001.0).range(1,5),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.1).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/30.14)),0.2,0.22,3.0))}).play;
Ndef(\c).fadeTime = 5.0;
Ndef(\c,{Splay.ar(CombL.ar(VarSaw.ar(4.01*[98,99,100,101,102,103,104,105,106]+SinOsc.kr([1,2,4,8,16]/1003.1337).range(1,2.3),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/100.23)),0.2,0.23,3.0))}).play;
Ndef(\d).fadeTime = 5.0;
Ndef(\d,{Splay.ar(CombL.ar(VarSaw.ar(0.5127*[98,99,97,96,95,94,93]+SinOsc.kr([1,2,4,8,16]/1008.1337).range(1,2.2),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/10.1)),0.2,0.27,3.0))}).play;
)
Ndef(\a).stop(10);
Ndef(\b).stop(10);
Ndef(\c).stop(10);
Ndef(\d).stop(10);
NdefMixer(s);


(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
  ~scale1 = [38,48,72,55,48,57,70,67,67,74,70,72,65,70,67];
  ~scale2 = [63,65,57,72,70,67,75,74,89,60,55,48,70,70,63];
  ~mul1 = Select.kr(Stepper.kr(Impulse.kr(8/[1,2,4,8]),max:6),[1,1,0.5,1,0.5,1,0.5].scramble).lag((_*0.0011!16));
  ~mul2 = Select.kr(Stepper.kr(Impulse.kr(2/[1,2,4,8]),max:1),[1,0.5,2,0.5,0.5,1,2]).lag((_*0.001!16));
  ~mul3 = Select.kr(Stepper.kr(Impulse.kr(4/[1,2,4,8]),max:3),[1,0.5,2,1,0.5,1,1]).lag((_*0.001!16));
  ~note1 = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,4,8,16,32].scramble),max:~scale1.size),~scale1.scramble.midicps * (~mul1 * ~mul2)).lag((_*0.001!16));
  ~note2 = Select.kr(Stepper.kr(Impulse.kr(1/2/[1,2,4,8,16,32].scramble),max:~scale2.size),~scale2.scramble.midicps * (~mul1 * ~mul3)).lag((_*0.001!16));
  Splay.ar(
    Limiter.ar(
      (0.5 * Pluck.ar(SinOsc.ar((_*0.1!16)+~note1,{ExpRand()*10.0}!16), Impulse.ar(2*[1,2,4,8]),decaytime:0.8, delaytime:0.3 )) +
      (0.25 * Pluck.ar(LFCub.ar((_*0.1!16)+(~note2*~mul1),{ExpRand()*10.0}!16), Impulse.ar([1,2,4,8]),decaytime:2, delaytime:0.31 )) +
      (0.15 * Pluck.ar(VarSaw.ar((_*0.1!16)+(~note1*~mul1*~mul2*~mul3),{ExpRand()*10.0}!16), Impulse.ar([1,2,4,8]),decaytime:2, delaytime:0.32 ))
    )
)}).play;
)
Ndef(\a).stop(1);

(
var f1 = 44;
var f2 = 777;
var arr = 0.5 * [0.25,3,12,0.25,0.25,6,0.5,0.25];
Ndef(\bass1,{Splay.ar(SinOsc.ar({ExpRand().exprange(f1,f1*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass2,{Splay.ar(SinOsc.ar({ExpRand().exprange(f1,f1*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass3,{Splay.ar(SinOsc.ar({ExpRand().exprange(f2,f2*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass4,{Splay.ar(SinOsc.ar({ExpRand().exprange(f2,f2*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
)
NdefMixer(s);
s.scope;

Ndef(\a,{Splay.ar(CombN.ar((WhiteNoise.ar(0.08!8) * Pulse.ar(6.6).clip()) + VarSaw.ar(VarSaw.kr(0.01*{ExpRand()}!20).exprange(44,99),{ExpRand()}!20,{ExpRand()}!20)))});
Ndef(\b,{Splay.ar( Compander.ar(BBandPass.ar( Ndef(\a).ar, SinOsc.kr(0.1).exprange(44,444))) )}).play;
Ndef(\c,{Splay.ar(Compander.ar(Ndef(\b).ar * Pulse.ar(6.6),0,0.75,2.2))}).play();
Ndef(\d,{Splay.ar(Compander.ar(VarSaw.ar({ExpRand()*44100}!8,{ExpRand()}!8,{ExpRand()}!8,{ExpRand()/2.0}!8) * Pulse.ar({ExpRand()*10.0}!8).clip()))}).play;
NdefMixer(s);

// Krystof Pesek 2014