function[vol]=Volume(n);
%Volume : Expected value of volume of a tetrahedron by Monte Carlo's method.
%
%INPUTS:
%n: Number of iterations to estimate the volume.
%OUTPUTS:
%[vol] where vol is the expected value of volume.
%
%Function declaration:
%[vol]=Volume(n)
%Marcela Tobar 06/06/16
%Kevin Santos  06/06/16
	iprt=1000;
	X=rand(n,3);
	m=0;
	for i=1:n;
		x=X(i,1);
		y=X(i,2);
		z=X(i,3);
		if x+y+z <= 1;
			m=m+1;
		end
		if mod(i,iprt)==0;
			vol=real(m)/real(i);
		end
	end
endfunction
