%Tetrahedron
%With this m-file we obtain the average volume of a tetrahedron run 100 times.
%Marcela Tobar 06/06/16
%Kevin Santos  06/06/16
V = 0;
for i=1:100;
	V= V+Volume(5000);
end
Promedio = V/100
