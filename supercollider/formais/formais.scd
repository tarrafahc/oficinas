(

~kick = Buffer.read(s, "/home/lucastonussi/Freesound/snd/NyxFragment1_Selection.wav");
~hhat = Buffer.read(s, "/home/lucastonussi/Freesound/snd/mistico_Synth 5-3.151.wav");
~clap = Buffer.read(s, "/home/lucastonussi/Freesound/snd/psy_Synth 5-3.140.wav");

SynthDef(\playbuf,{arg out = 0, r = 1, buff = 0, amp = 1, t = 0;
  var sig = PlayBuf.ar(1, buff, r);
  var env = EnvGen.kr( Env.perc(0.01, 0.8), doneAction: 2);
  Out.ar(out, sig*env*amp*t!2);
}).add;

SynthDef(\mall,{arg out=0,note, amp = 1;
  var sig=Array.fill(3,{|n| SinOsc.ar(note.midicps*(n+1),0,0.3)}).sum;
  var env=EnvGen.kr(Env.perc(0.01,0.8), doneAction:2);
  Out.ar(out, sig*env*amp!2);
}).add;

)

(

var dict = IdentityDictionary[\A -> "AB", \B -> "A", \C -> "DB", \D -> "BC"]; //These are the production rules of the L-system
var word = "AC"; //Axiom word
var string_temp = "";
var iter = 10;

//These are diction for the mapping of the alphabet to "artistic" parameters: degrees in a scale, beat occurrence, etc.

var dictnotes = IdentityDictionary[\A -> 50, \B -> 55, \C -> 54, \D -> 57];
var dictkick = IdentityDictionary[\A -> 1, \B -> 0, \C -> 1, \D -> 0];
var dicthat = IdentityDictionary[\A -> 1, \B -> 0, \C -> 1, \D -> 1];
var notes = [];
var beat = [];
var beat2 = [];

//This iteration generates the system recursively

iter.do({
  word.asArray.do({|i|
    string_temp = string_temp ++ dict[i.asSymbol];
  });
  word = string_temp;
});

word.postln;

//Here we map the final system to the parameters as above

//word.do({|i| notes = notes ++ dictnotes[i.asSymbol];});
//word.do({|i| beat = beat ++ dictkick[i.asSymbol];});
//word.do({|i| beat2 = beat2 ++ dicthat[i.asSymbol];});

notes = Pcollect({|i| dictnotes[i.asSymbol]}, Pseq(word.asList));
beat = Pcollect({|i| dictkick[i.asSymbol]}, Pseq(word.asList));
beat2 = Pcollect({|i| dicthat[i.asSymbol]}, Pseq(word.asList));

notes.postln;
beat.postln;

s.record;

Pbind(*[\instrument: \mall, \note: notes, \amp: Pfunc({rrand(0.06,0.1)}), \dur: 1/4]).play(quant:32);
Pbind(*[\instrument: \mall, \note: Pseq(notes,inf), \amp: Pfunc({rrand(0.06,0.1)}), \dur: 1/4]).play(quant:32);
Pbind(*[\instrument: \mall, \note: Pseq(notes + 48,inf), \amp: Pfunc({rrand(0.06,0.1)}),\dur: 1/8]).play(quant:32 + 16);
Pbind(*[\instrument: \playbuf, \t: Pseq(beat,inf), \buff: ~kick, \dur: 1/8]).play(quant:32 + 32);
Pbind(*[\instrument: \playbuf, \t: Pseq(beat2,inf), \buff: ~hhat, \r:8, \dur: 1/8]).play(quant:32 + 32 + 8);
Pbind(*[\instrument: \playbuf, \t: Prand([Pseq([0,0,1,0],4), Pseq([0,1,0,0],1)],inf), \buff: ~clap, \r: 1,\dur: 1/4]).play(quant:32 + 32 + 8);

)