{LFPulse.ar(1, 0.99, 0.4).lagud(0.3, 0.7)}.plot(2)

(
SynthDef(\dsaf_horn1, { |rate=0.1|
	var freq = LFPulse.kr(rate, 0.99, 0.4).lagud(0.4 / rate, 0.6 / rate) * 800 + 300;
	var son  = LFPulse.ar(freq, 0.99, 0.2).lagud(0.4 / freq, 0.6 / freq) * 2 - 1;

	// This filtering is a simple approximation of the plastic horn acoustics:
	son = BPF.ar(son.clip2(0.2), 1500, 1/4) * 4;

	// delay and reverb, to simulate the environment in which we hear the siren
	son = son + DelayC.ar(son, 0.1, 0.1, 0.3);
	son = son + FreeVerb.ar(son);

	Out.ar(0, Pan2.ar(son * 0.4));
}).add;
)

x = Synth(\dsaf_horn1);

s.scope

// Choose a rate
x.set(\rate, 3);
x.set(\rate, 0.1);