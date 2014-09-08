// Supercollider Code:
// nxInstrument004.sc
// Date: 2009.20.03
// Author: Miquel Parera Jaques
// Target: Connect MIDIOut & AudioOut

(
  p = ProxySpace.push(s.boot);
  p.makeTempoClock(4.0);
  History.clear.end;
  History.start;
)

"zynaddsubfx -L '/home/lucastonussi/banks/Strings/0004-Saw Strings 4.xiz' -U".unixCmd;
z = Buffer.read(s,"/home/lucastonussi/Freesound/snd/mistico_Synth 5-3.151.wav",0);

z.play;

"aconnect -o".unixCmd;
"aconnect -i".unixCmd;

"aconnect 129:7 130:0".unixCmd;

(
  MIDIClient.init;
  m = MIDIOut(0);
)

Pdef(\x);
Pdef(\x, Pbind(\type, \midi, \midiout, m, \midinote, Pseq("@  $ ># Ç:}@#$".ascii, inf), \dur, Pseq([0.1, 0.4, 0.8], inf))).play;

(
SynthDef( "click1", {arg rate=0.29, pan = 0, freq = 95, rq = 0.08;
    var a;
    a = PlayBuf.ar(1, 0, rate, 1, 0, 4);
    a = RLPF.ar(a,freq,rq);
    a = a + VarSaw.ar(a.ar(1,10,5,a.ar([0.05,0.04],0,50,160).round(40)),0,a.ar(10.2,0,0.5,a.ar(3,0,0.2,0.5)));
    Out.ar(0, Pan2.ar(a, pan));
}).send(s);
SynthDef( "click2", {arg rate=0.2, pan = -1, freq = 350, rq = 0.8;
    var a;
    a = PlayBuf.ar(1, 0, rate, 1, 0, 1);
    a = RLPF.ar(a,freq,rq);
    a = a - BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35));
    Out.ar(0, Pan2.ar(a, pan));
}).send(s);
SynthDef( "click3", {arg rate=0.2, pan = 1, freq = 75, rq = 0.28;
    var a;
    a = PlayBuf.ar(1, 0, rate, 1, 0, 1);
    a = RLPF.ar(a,freq,rq);
    Out.ar(0, Pan2.ar(a, pan));
}).send(s);
)

"ecasound -i jack -o '/home/lucastonussi/Freesound/snd/bounces_Synth 5-3.108.wav'".unixCmd;

"jack_lsp".unixCmd;

"jack_connect ZynAddSubFX:out_1 ecasound:in_1".unixCmd;
"jack_connect ZynAddSubFX:out_2 ecasound:in_2".unixCmd;
"jack_connect SuperCollider:out_1 ecasound:in_1".unixCmd;
"jack_connect SuperCollider:out_2 ecasound:in_2".unixCmd;

// This is the SuperCollider (env = gui + interp)

(
d =Task({
    Pdef(\x).play;
    a = Synth("click1");
    b = Synth("click2");
    c = Synth("click3");
    24.wait;
    a.set(\rate, 0.8);
    a.set(\freq, 100);
    8.wait;
    b.set(\rate, -0.8);
    b.set(\freq, 333);
    8.wait;
    c.set(\rate, 1.0);
    c.set(\freq, 366);
    24.wait;
    a.set(\rate, 1.6);
    a.set(\freq, 366);
    8.wait;
    b.set(\rate, -1.6);
    b.set(\freq, 413);
    8.wait;
    c.set(\rate, 2.0);
    c.set(\freq, 444);
    24.wait;
    a.set(\rate, 3.2);
    a.set(\freq, 484);
    8.wait;
    b.set(\rate, -3.2);
    b.set(\freq, 510);
    8.wait;
    c.set(\rate, 4.0);
    c.set(\freq, 520);
    24.wait;
    a.free;
    8.wait;
    b.free;
    8.wait;
    c.free;
    8.wait;
    Pdef(\x).stop;
}
);
)

d.play;
d.free;

"killall zynaddsubfx".unixCmd;
"killall ecasound".unixCmd;

History.end;
History.saveStory("nxInstrument004-01-Story.scd");

"killall jackd & killall java".unixCmd; p.pop; s.quit;
