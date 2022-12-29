// generated automatically
// DO NOT MODIFY!
declare id "selwah";
declare name "Selmer Wah";
declare category "Guitar Effects";
declare shortname "Selmer Wah";
declare description "Selmer Wah";

import("stdfaust.lib");
import("guitarix.lib");

process(x) = x : _<:*(dry),(*(wet) : pre : fi.iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0),(a1/a0,a2/a0,a3/a0,a4/a0))):>_ with {
    LogPot(a, x) = ba.if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = ba.if(b, 1 - x, x);
    s = 0.993;
    fs = float(ma.SR);
    pre = fi.dcblockerat(696.855682347);

    wet = wah_ctrl.wet_dry;
    dry = 1 - wet;

    Wah1 = (x : an.amp_follower_ud(0.01,0.1) : min(0.99) : max(0.1) : Inverted(1)): si.smooth(s);
    
    Wah2 = wah_ctrl.wah  : LogPot(5) :  si.smooth(s);
    
    sl = wah_ctrl.mode;

    Wah3 = (os.oscs(freq) + 1) / 2 : min(0.90) : max(0.01) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);
    
    b0 = Wah*(Wah*pow(fs,2)*(fs*(9.34067018664482e-21*fs + 1.87102855759734e-16) + 2.81828342103572e-13) + fs*(fs*(fs*(-9.34656187780755e-21*fs - 1.86919114730712e-16) - 2.77734086106026e-13) + 6.21752156007224e-12)) + fs*(fs*(fs*(-3.81791996652528e-20*fs - 8.47349775377979e-16) - 1.29923285740847e-12) - 2.03089386652508e-11);

    b1 = Wah*(Wah*pow(fs,3)*(-3.73626807465793e-20*fs - 3.74205711519468e-16) + fs*(pow(fs,2)*(3.73862475112302e-20*fs + 3.73838229461424e-16) + 1.24350431201445e-11)) + fs*(pow(fs,2)*(1.52716798661011e-19*fs + 1.69469955075596e-15) - 4.06178773305017e-11);

    b2 = Wah*(Wah*pow(fs,2)*(5.60440211198689e-20*pow(fs,2) - 5.63656684207144e-13) + pow(fs,2)*(-5.60793712668453e-20*pow(fs,2) + 5.55468172212051e-13)) + pow(fs,2)*(-2.29075197991517e-19*pow(fs,2) + 2.59846571481694e-12);

    b3 = Wah*(Wah*pow(fs,3)*(-3.73626807465793e-20*fs + 3.74205711519468e-16) + fs*(pow(fs,2)*(3.73862475112302e-20*fs - 3.73838229461424e-16) - 1.24350431201445e-11)) + fs*(pow(fs,2)*(1.52716798661011e-19*fs - 1.69469955075596e-15) + 4.06178773305017e-11);

    b4 = Wah*(Wah*pow(fs,2)*(fs*(9.34067018664482e-21*fs - 1.87102855759734e-16) + 2.81828342103572e-13) + fs*(fs*(fs*(-9.34656187780755e-21*fs + 1.86919114730712e-16) - 2.77734086106026e-13) - 6.21752156007224e-12)) + fs*(fs*(fs*(-3.81791996652528e-20*fs + 8.47349775377979e-16) - 1.29923285740847e-12) + 2.03089386652508e-11);

    a0 = Wah*(Wah*pow(fs,2)*(fs*(-6.9507309070366e-20*fs - 1.01737279942973e-17) - 8.91391550989893e-14) + fs*(fs*(fs*(-2.47965348716056e-19*fs - 9.25643357134141e-18) + 1.10300249541729e-13) - 2.02588988861339e-12)) + fs*(fs*(fs*(3.2847328592148e-19*fs + 5.6599406495133e-17) + 5.11880447644045e-13) + 1.73599395967319e-11) + 1.0129449443067e-10;

    a1 = Wah*(Wah*pow(fs,3)*(2.78029236281464e-19*fs + 2.03474559885945e-17) + fs*(pow(fs,2)*(9.91861394864224e-19*fs + 1.85128671426828e-17) - 4.05177977722679e-12)) + fs*(pow(fs,2)*(-1.31389314368592e-18*fs - 1.13198812990266e-16) + 3.47198791934638e-11) + 4.05177977722679e-10;

    a2 = Wah*(Wah*pow(fs,2)*(-4.17043854422196e-19*pow(fs,2) + 1.78278310197979e-13) + pow(fs,2)*(-1.48779209229634e-18*pow(fs,2) - 2.20600499083458e-13)) + pow(fs,2)*(1.97083971552888e-18*pow(fs,2) - 1.02376089528809e-12) + 6.07766966584018e-10;

    a3 = Wah*(Wah*pow(fs,3)*(2.78029236281464e-19*fs - 2.03474559885945e-17) + fs*(pow(fs,2)*(9.91861394864224e-19*fs - 1.85128671426828e-17) + 4.05177977722679e-12)) + fs*(pow(fs,2)*(-1.31389314368592e-18*fs + 1.13198812990266e-16) - 3.47198791934638e-11) + 4.05177977722679e-10;

    a4 = Wah*(Wah*pow(fs,2)*(fs*(-6.9507309070366e-20*fs + 1.01737279942973e-17) - 8.91391550989893e-14) + fs*(fs*(fs*(-2.47965348716056e-19*fs + 9.25643357134141e-18) + 1.10300249541729e-13) + 2.02588988861339e-12)) + fs*(fs*(fs*(3.2847328592148e-19*fs - 5.6599406495133e-17) + 5.11880447644045e-13) - 1.73599395967319e-11) + 1.0129449443067e-10;
};
