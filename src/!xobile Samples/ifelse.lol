#begin
#int x;
#x = 2;
#if x ~ 2
#{
#    x = x-1;
#}
#else
#{
#    print x;
#}
#end.


begin
int x;
int y;
x = 5;
y = 6;
if x~ y
{
	print x;
	x = x + 1 ;
	print x;
}
else
{
	print y;
	y = y + 1;
	print y;
}
end
.
