// example: [metro 2012]
// 2012 ms = 2.012 s
// BPM: 60 / 2.012 = 29.821073558648
// BPS: BPM / 60 = 0.49701789264413 -> ~ 0.497 Hz

Impulse.kr((2012/1000).reciprocal); // equals to Impulse.kr(60/(2012/1000)/60);

// [bp~] and BPF.ar differ in their behaviour.
// This example is just an approximation to [bp~].

BPF.ar(signal, centerFrequency, Q.reciprocal)

(signal * 2pi).cos

// at first: a buffer for the UGens to use
buffer = Buffer.alloc(s, 44100, 1); // or LocalBuf(44100, 1) ... whatever suits best

DelTapWr.ar(buffer, signal)