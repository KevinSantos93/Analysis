a=Cuadratura(@(x)((x^2)*e^(-x)+cos(x)),-1,1,10^(-6))
b=Cuadratura(@(x)((x^2)*e^(-x)+cos(x)),-1,1,10^(-8))
c=Cuadratura(@(x)(sin(x)),0,pi,10^(-8))
d=Cuadratura(@(x)(cos(x)),0,9*pi/2,10^(-6))
e1=Cuadratura(@(x)(sqrt(x)),0,1,10^(-8))
f=Cuadratura(@(x)(sqrt(x)*log(x)),eps,1,10^(-8))
g=Cuadratura(@(x)(tan(sin(x))-sin(tan(x))),0,pi,10^(-8))
h=Cuadratura(@(x)(1/(3*x-1)),0,1,10^(-4))
i=Cuadratura(@(x)(x^(8/3)*(1-x)^(10/3)),0,1,10^(-8))
j=Cuadratura(@(x)(x^(25)*(1-x)^(2)),0,1,10^(-8))
k=Cuadratura(@(x)((1/((x-3)^2+0.01))+(1/((x-9)^2+0.04))-6),0,2,10^(-6))