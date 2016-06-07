%Random finds an approximation to the probability of a neutron to emerge from
%a lead wall. 
k=1;
Promedio=[];
%We make 50 runs to find the average probability.
while k<51 
	Per=[];
	n=5000;
	%We make a matrix of nX7 random elements on the interval [0,1].
	X=rand(n,7);
	iprt=1000;
	m=0;
	for i=1:n
		x=1;
		for j=1:7
			x=x+cos(pi*X(i,j));
			if x<=0
				break
			elseif x>=5
				m=m+1;
				break
			end
		end
		if mod(i,iprt)==0
			per=100*real(m)/real(i);
			Per(1,i/1000)=per;
		end
	end
	%We find the average probability of every run.
	a=(Per(1,1)+Per(1,2)+Per(1,3)+Per(1,4)+Per(1,5))/5;
	Promedio(k)=a;
	k=k+1;
end
%We find the average probability of the 50 runs
b=0;
for i=1:50
	b=b+Promedio(i);
end
b=b/50;
fprintf('In average, we expect that %f percent of the neutrons will exit the lead wall.\n',b)
%
%Marcela Tobar, 06/06/16
%Kevin Santos, 06/06/16
