%Brent
function[x]=Brent(f,a,b,tol,MAX);
%Brent : Numerically solves f(x)=0 using Brent's method.
%
%INPUTS:
%f: function from the equation f(x)= 0
%a,b : work interval [a,b]
%tol : Tolerance Error
%MAX : Maximum number of iterations
%OUTPUTS:
%[x] where x is the approximation to the root of f(x)=0.
%
%Function declaration:
%[x]=Brent(f,a,b,tol,MAX)
%Marcela Tobar 06/06/16
%Kevin Santos  06/06/16
	fa=feval(f,a);
	fb=feval(f,b);
	if (fa > 0 & fb>0) || (fa<0 & fb<0);
		error('Root must be bracketed for Brent' )
	end
	c=b;
	fc=fb;
	for i=1:MAX;
		if (fb>0 & fc>0) || (fb<0 & fc<0);				
			c=a;  %Rename a, b, c and adjust bounding interval d.
			fc=fa;
			d=b-a;
			e=d;
		end
		if abs(fc)<abs(fb);
			a=b;
			b=c;
			c=a;
			fa=fb;
			fb=fc;
			fc=fa;
		end
		tol1=2*eps*abs(b)+0.5*tol; %Convergence check.
		xm=0.5*(c-b);
		if abs(xm)<=tol1 || fb==0;
			x=b;
			return
		end
		if abs(e)>=tol1 || abs(fa)>abs(fb);
			s=fb/fa; %Attempt inverse quadratic interpolation.
			if a==c;
				p=2*xm*s;
				q=1-s;
			else
				q=fa/fc;
				r=fb/fc;
				p=s*(2*xm*q*(q-r)-(b-a)*(r-1));
				q=(q-1)*(r-1)*(s-1);
			end
			if p <0; %Check wheter in bounds.
				p=abs(p);
			end
			if 2*p < min(3*xm*q-abs(tol1*q),abs(e*q));
				e=d;
				d=p/q;
			else
				d=xm; %Interpolation failed, use bisection.
				e=d;
			end
		else			%Bounds decreasing too slowly, use bisection.
			d=xm;
			e=d;
		end
		a=b;			%Move last best guess to a.
		fa=fb;
		if abs(d)>tol1;		%Evaluate new trial root.
			b=b+d;
		else
			b=b+sign(xm)*tol1;
		end
		fb=feval(f,b);
	end
	x=b;
endfunction
	
%!test
%! TOL=1e-7;
%! [x]= Brent(@(x)(exp(2*x)-3),1/2,1,TOL,40);

