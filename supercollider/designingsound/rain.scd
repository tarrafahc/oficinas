~dropletonhard = { |dur=0.005| Env.perc(dur/2, dur/2, 1, [-4, 4])};
~dropletonhard.value.plot

x = { {BrownNoise.ar}.dup(12).mean.dup * 0.5}.play

x.free;

(
x = {
  var amount = MouseX.kr(0, 1);
  var n1 = WhiteNoise.ar.abs * amount + (1-amount);
s  var n2 = LFNoise2.ar(2pi);
  var gaussian = sqrt(-2 * log(n1)) * cos(n2);
  gaussian.dup * 0.5
}.play;
)

x.free;

(
y = {
  var gauss, osc;
  gauss = {WhiteNoise.ar}.dup(12).sum;
  gauss = LPF.ar(BPF.ar(gauss, 50, 1/0.4), 500);
  osc = SinOsc.ar(gauss.linlin(-1, 1, 40, 80)) * gauss.squared * 10;
  2.do {
    osc = HPF.ar(osc, 500);
  };
  osc.dup
}.play
)

y.free