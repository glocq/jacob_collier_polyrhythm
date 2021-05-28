import("stdfaust.lib");

s2 = gain2 * os.lf_saw(f0);
s3 = gain3 * os.lf_saw(f0*3/2);
s4 = gain4 * os.lf_saw(f0*2);
s5 = gain5 * os.lf_saw(f0*5/2);
s6 = gain6 * os.lf_saw(f0*3);

f0 = ba.midikey2hz(nentry("MIDI pitch", -45, -50, 100, 1));

gain2 = hslider("Gain 2", 1, 0, 1, 0.01);
gain3 = hslider("Gain 3", 1, 0, 1, 0.01);
gain4 = hslider("Gain 4", 1, 0, 1, 0.01);
gain5 = hslider("Gain 5", 1, 0, 1, 0.01);
gain6 = hslider("Gain 6", 1, 0, 1, 0.01);

process = (s2+s3+s4+s5+s6)/5 : fi.bandpass(1, 50, 2000) <: (_,_);
