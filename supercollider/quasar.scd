{
  SinOsc.ar
  (
    LFNoise2.ar
    (
      216, 253, 245
    ),
    43, 0.3
  )
}.play

{SinOsc.ar}.play

(
{
  CombN.ar(
    SinOsc.ar(
      LFNoise1.kr(
        4, // LFO
        12, // range in MIDI
        LFSaw.kr(
          [8,7.23], //second LFO
          0,
          3,
          80
        )
      ).midicps,
      0,
      0.04
    ),
    0.2,
    0.2,
    4
  )
}.play
)

{SinOsc.ar([190, 143], 0, 0.4, 0)}.scope(1)

{BrownNoise.ar(0.7)}.scope(1)

(
{
  Out.ar(0, In.ar(MouseY.kr(15, 23).div(1), 1)*0.8)}