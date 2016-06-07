function[n app] = Cuadratura(f,A,B,tol)
%Cuadratura  Numerically finds the approximation of the integral of a function 
%on a given interval.
%
%INPUTS:
%f: function we want to approximate its integral.
%A,B: work interval [A,B].
%tol: the level of tolerance required
%
%OUTPUTS:
%n: number of function evaluations.
%app: the approximation of the integral of the function.
%
%Function declaration:
%[n app]=Cuadratura(f,A,B,tol)
%
%Marcela Tobar, 06/06/16
%Kevin Santos, 06/06/16
%
	%We initialize the variables we are going to use.	
	n=0;
	app=0;
	TOL=[];
	a=[];
	h=[];
	FA=[];
	FC=[];
	FB=[];
	S=[];
	L=[];
	%Make the first iteracion on the full interval.
	i=1;
	TOL(i)=10*tol;
	a(i)=A;
	h(i)=(B-A)/2;
	FA(i)=feval(f,A);
	n=n+1;
	FC(i)=feval(f,A+h(i));
	n=n+1;
	FB(i)=feval(f,B);
	n=n+1;
	S(i)=h(i)*(FA(i)+4*FC(i)+FB(i))/3;
	L(i)=1;
	while i>0
		%We save the information of this level.
		FD=feval(f,a(i)+h(i)/2);
		n=n+1;
		FE=feval(f,a(i)+3*h(i)/2);
		n=n+1;
		S1=h(i)*(FA(i)+4*FD+FC(i))/6;
		S2=h(i)*(FC(i)+4*FE+FB(i))/6;
		v1=a(i);
		v2=FA(i);
		v3=FC(i);
		v4=FB(i);
		v5=h(i);
		v6=TOL(i);
		v7=S(i);
		v8=L(i);
		%We delete this level
		i=i-1;
		%We see if the tolerance level has been reached.
		if abs(S1+S2-(v7))<(v6)
			%If the tolerance has been reached, we save the aproximation.
			app=app+(S1+S2);
		else
			%If the tolerance hasn't been reached:
			%We save the information for the right interval.	
			i=i+1;
			a(i)=(v1)+(v5);
			FA(i)=v3;
			FC(i)=FE;
			FB(i)=v4;
			h(i)=(v5)/2;
			TOL(i)=(v6)/2;
			S(i)=S2;
			L(i)=(v8)+1;
			%We save the information for the left interval
			i=i+1;
			a(i)=v1;
			FA(i)=v2;
			FC(i)=FD;
			FB(i)=v3;
			h(i)=h(i-1);
			TOL(i)=TOL(i-1);
			S(i)=S1;
			L(i)=L(i-1);
		end
		%In case the integral diverges in the given interval.
		if n>2000
			fprintf('We cannot compute an approximation to the integral of the given function.')
			break
		end
	end
	fprintf('Approximation: %0.10g.\n', app)
endfunction		
	
