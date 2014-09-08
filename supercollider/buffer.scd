~b0 = Buffer.read(s, "/home/lucastonussi/Freesound/snd/bounces_Synth 5-3.138.wav");
~b1 = Buffer.read(s,"/home/lucastonussi/Freesound/snd/61950-radio6.wav");
~b2 = Buffer.read(s, "/home/lucastonussi/Freesound/snd/birds_Synth 6-1.14.wav");
~b3 = Buffer.read(s, "/home/lucastonussi/Freesound/snd/bounces_Synth 5-3.170.wav");

~b0.play;
~b1.play;
~b2.play;
~b3.play;

// frames
~b0.numFrames;

// channels
~b0.numChannels;
numSamples = numFrames * numChannels

// buffer numbers (bufnums)
~b0.bufnum;
~b1.bufnum;
~b2.bufnum;
~b3.bufnum;

// buffer sample rate
~b0.sampleRate;
s.sampleRate;

// query
~b0.query;

~b4 = Buffer.read(s, "/home/lucastonussi/Freesound/snd/Badass_Voices-1.0.wav");

~b4.play;

~b4.numFrames;

~b4_frag0 = Buffer.read(s, "/home/lucastonussi/Freesound/snd/Badass_Voices-1.0.wav", 6981596/2, 90000);

~b4_frag0.play;

// alloc an array of buffers and fll them with different harmonics
(
  b = Buffer.allocConsecutive(8, s, 4096, 1, { |buf, i|
  buf.sine1Msg((1..((i+1)*6)).reciprocal) // completion messages
});

a = { VOsc.ar(SinOsc.kr(0.5, 0).range(b.first.bufnum + 0.1, b.last.bufnum - 0.1),
  [440, 441], 0, 0.2) }.play;
)

a.free;

// iterate over the array and free it
b.do(_.free);

~bells = Array.new;
~folder = PathName.new("/home/lucastonussi/Freesound/snd/");

(
  ~folder.entries.do({
  arg path;
  ~bells = ~bells.add(Buffer.read(s, path.fullPath));
});
)

~bells.ar(0).play;
~bells.ar(4).play;
~bells.ar(7).play;
~bells[12].play;
