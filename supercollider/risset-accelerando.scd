// Supercollider Code:
// nxInstrument002.sc
// Date: 2009.03.08
// Author: Miquel Parera Jaques
// Observations: Risset accelerando writen by Dan Stowell (Thanks!)
// Target: Risset accelerando

// - 0:0:0 -
(
p = ProxySpace.push(s.boot);
p.makeTempoClock(2.0);
MIDIIn.connect;
History.clear.end;
History.start;
)

// - 0:0:3.73 -
(
b = Buffer.read(s,"/home/lucastonussi/Freesound/snd/imerge_Synth 5-3.57.wav",0);
c = Buffer.read(s,"/home/lucastonussi/Freesound/snd/massive_Synth 5-3.136.wav",1);
d = Buffer.read(s,"/home/lucastonussi/Freesound/snd/misticos_Synth 5-5.9.wav",2);
)

// - 0:0:13.55 -
(
var ampTable = Signal.hanningWindow(1024,100).squared;
var ampBuf = Buffer.loadCollection(s, ampTable);
var ampTable2 = Signal.hanningWindow(1024,100).squared;
var ampBuf2 = Buffer.loadCollection(s, ampTable2);
var ampTable3 = Signal.hanningWindow(1024,100).squared;
var ampBuf3 = Buffer.loadCollection(s, ampTable3);
SynthDef("accelerando_inf1", { arg out=0,bufnum=0;
    var pos, posses, pitches, amps, sons;
    pos = Phasor.ar(1, 0.007 / SampleRate.ir, 0, 1);
    posses = (pos + ((0..4)/5)).wrap(0.0, 1.0);
    pitches = (0.2 * 2.0.pow(posses * 5));
    amps = BufRd.kr(1, ampBuf.bufnum, posses * BufFrames.ir(ampBuf.bufnum));
    sons = (CombN.ar(SinOsc.ar(33) * PlayBuf.ar(1,bufnum,pitches.poll(100), loop:1)) * amps * 10);
    Out.ar(out,
        Pan2.ar(sons.mean.softclip, -1)
    )
}).send(s);
SynthDef("accelerando_inf2", { arg out=0,bufnum=1;
    var pos, posses, pitches, amps, sons;
    pos = Phasor.ar(1, 0.007 / SampleRate.ir, 0, 1);
    posses = (pos + ((0..4)/5)).wrap(0.0, 1.0);
    pitches = (0.2 * 2.0.pow(posses * 5));
    amps = BufRd.kr(1, ampBuf2.bufnum, posses * BufFrames.ir(ampBuf2.bufnum));
    sons = (CombN.ar(SinOsc.ar(33) * PlayBuf.ar(1,bufnum,pitches.poll(100), loop:1)) * amps * 10);
    Out.ar(out,
        Pan2.ar(sons.mean.softclip, 1)
    )
}).send(s);
SynthDef("accelerando_inf3", { arg out=0,bufnum=2;
    var pos, posses, pitches, amps, sons;
    pos = Phasor.ar(1, 0.007 / SampleRate.ir, 0, 1);
    posses = (pos + ((0..4)/5)).wrap(0.0, 1.0);
    pitches = (0.2 * 2.0.pow(posses * 5));
    amps = BufRd.kr(1, ampBuf3.bufnum, posses * BufFrames.ir(ampBuf3.bufnum));
    sons = (CombN.ar(SinOsc.ar(33) * PlayBuf.ar(1,bufnum,pitches.poll(100), loop:1)) * amps * 10);
    Out.ar(out,
        Pan2.ar(sons.mean.softclip, 0)
    )
}).send(s);
)

// - 0:0:21.32 -
s.prepareForRecord("/home/lucastonussi/Freesound/snd/rec.wav");

// - 0:0:26.24 -
(
t = Task({x = Synth("accelerando_inf1");
    s.record;
    60.wait;
    y = Synth("accelerando_inf2");
    60.wait;
    z = Synth("accelerando_inf3");
    60.wait;
    y.free;
    x.free;
    z.free;
    w.free;
    s.stopRecording;
    });
);

// - 0:0:32.01 -
t.play;