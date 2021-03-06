/*

 DownDyadHi.C .MEX file corresponding to DownDyadHi.m
		HIPass Dyadic Downsampling Transform

  The calling syntax is:

			wc = DownDyadHi(signal,lpf)


  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	 Sig_IN	prhs[0]
#define  LPF_IN prhs[1]

/* Output Arguments */

#define	HP_OUT	plhs[0]

void mexFunction(nlhs, plhs, nrhs, prhs)
INT nlhs, nrhs;
Matrix *plhs[], *prhs[];
{
	DOUBLE	*hpp, *lpf, *hpf, *sig;
	unsigned int	m,n,nn,mm;
	int nr,nc,J,kk,lenfil;
	Matrix *HPF_MAT;
	
	/* Check for proper number of arguments */

	if (nrhs != 2) {
		mexErrMsgTxt("DownDyadHi requires two input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("DownDyadHi requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m = mxGetM(Sig_IN);
	n = mxGetN(Sig_IN);
	if(m == 1){
		nr = (int) n;
		nc = 1;
		nn = n/2;
		mm = 1;
	} else {
		nr = (int) m;
		nc = (int) n;
		nn = 1;
		mm = m/2;
	}

	J = 0;
	for( kk = 1; kk < nr;  kk *= 2 )  
		 J ++;
	if(  kk  !=  nr){
		mexErrMsgTxt("DownDyadHi requires dyadic length");
	}


	/* Create a matrix for the return argument */
	HP_OUT  = mxCreateFull(mm, nn, REAL);


	/* Assign pointers to the various parameters */

	hpp = mxGetPr(HP_OUT);

	sig = mxGetPr(Sig_IN);
	lpf = mxGetPr(LPF_IN);
    lenfil = (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */
	HPF_MAT = mxCreateFull(lenfil,1,REAL);
    hpf = mxGetPr(HPF_MAT);
	
	/* Do the actual computations in a subroutine */
    mirrorfilt(lpf,hpf,lenfil);
	downhi(sig,nr,hpf,lenfil,hpp);
}


#include "downhi.c"
#include "mirrorfilt.c"
			
          
