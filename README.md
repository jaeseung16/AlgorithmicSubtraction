# Algorithmic Subtraction

The matlab function file "AlgoSub.m" implements the algorithm introduced in Ref. [1].

[1] Lee J-S, Khitrin AK. Algorithmic subtraction of high peaks in NMR spectra. Chemical Physics Letters. 2006;433:244–7. DOI: 10.1016/j.cplett.2006.11.059

[ ysub, ybase ] = AlgoSub( x, y, max_height, max_iter )

Algorithmic subtraction of high peaks in NMR spectra

Dec 29, 2005 - written by Jae-Seung Lee and A. K. Khitrin
Jul 8, 2015 - made as a function by Jae-Seung Lee
Oct 15, 2016 - uploaded to https://github.com/jaeseung16/AlgorithmicSubtraction/

Input parameters
* x: frequency offsets
* y: spectral intensities
* max_height: the maximum height of the subtraceted spectrum
* max_iter: the number of iterations

Outputs
* ybase: the baseline to subtract
* ysub: the subtracted spectrum

* Comment out the line "waitbar(m/max_iter)" for speed.
