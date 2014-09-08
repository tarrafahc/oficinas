// http://www.fredrikolofsson.com/f0blog/?q=node/537

play({CombL.ar(In.ar(8).tanh/8,3,1,8)!2}.play;Pbind(\amp,8,\dur,1/4,\degree,Pseq(List.fib(12)%(List.fib(64)%12),inf),\out,8))

play{MoogFF.ar(LFTri.ar(CombN.ar(Duty.ar(1/8,0,Dseq(Dshuf(List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2}


play{a=LFPar;GVerb.ar(VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)}


play{a=LFPar;GVerb.ar(VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)}


(
{
  LFPar.ar(1/14).round<<3+80;Splay.ar(LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3)
}.play;
)


play{o=SinOsc.ar(1/RunningMax.ar(Sweep.ar(LocalIn.ar(6)),Impulse.ar([1,0.749,6,12,3,4])));LocalOut.ar(o);Splay.ar(o).tanh/2}


play{a=SinOsc;Limiter.ar(LeakDC.ar(a.ar(0.11,BRF.ar(a.ar(a.ar(0.12).exprange(1,1e4),2pi),1/a.ar(0.13).range(1,[99,100])))))}


play{Splay.ar(SinOsc.ar(9,SinOsc.ar(midicps((Sweep.ar(0,(33..3))%128&(Sweep.ar(0,(3..9))%(LFSaw.ar(3)*9+99)))+33),0,pi)))/3}


play{a=LFTri;GVerb.ar(Mix(Limiter.ar(BRF.ar(a.ar(50,1e-4),a.ar(a.ar([1.01,1.0111])*a.ar(8e3)*1e3+4e3,55),a.ar(0.01)*3))))/9}


play{CombN.ar(Limiter.ar(BRF.ar(LFSaw.ar(10,0,0.01),LFTri.ar([5,6]*0.1))),0.1,LFTri.kr(0.1,0,0.05,0.05).round(0.01))}


play{CombN.ar(Limiter.ar(BRF.ar(LFSaw.arn(10,0,0.01),LFTri.ar([5,6]*0.1))),0.1,LFTri.kr(0.1,0,0.05,0.05).round(0.01))}


play{a=Impulse;b=SinOsc;c=b.ar(0,BRF.ar(a.ar([7,8]),a.ar(9).lag2(1e-3),1.5,2pi));Ringz.ar(c,b.ar(0.02,0,99,150),1/9)+c*0.02}


Pbind(\freq, Pseq("lu casto nuss i".ascii, inf)*Pstutter(64,Pseq([3,4,5],inf))*[1,2.045],\dur,0.03,\amp,Pseq([0,0.01],inf)).play


play{CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)}


play{a=Pulse;CombN.ar(Slope.ar(a.ar(a.ar([1,2]/3,1/9,50,[50,150])),a.ar([3,4],1/3)+a.ar([2,3],1/4)/10+0.005).cos/5,1,1/6,2)}


a=LFTri;play{CombN.ar(SinOsc.ar(Saw.ar(3,128,128),Saw.ar([3,4],a.ar(a.kr(0.1,0,8,12),0,32,128)).sin)/4,1,1/6,a.kr(1/32)+1)}


a=Demand;b=SinOsc;play{b.ar(a.ar(t=Saw.ar([9,9.01]),0,Dseq(0!6++500,inf)),b.ar(a.ar(t,0,Dshuf((0..7)*99,inf)).lag(0.04)))/2}


/*
 @ supercollider
 */