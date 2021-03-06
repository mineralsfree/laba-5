{$APPTYPE CONSOLE}
  uses Windows, Sysutils;
const n=2001;
 type TArray= array [1..n] of integer;

var A,B:TArray ;
var i,j,f: Integer;
procedure writeTableHead;
begin
  Writeln('+---------+-------------------------------+-------------------------------+');
  Writeln('|         |        Shell Sorting #1       |        InsertionSort    #2    |');
  Writeln('|  Array  +---------------+---------------+---------------+---------------+');
  Writeln('|  type   |  Number of    |   Number of   |  Number of    |   Number of   |');
  Writeln('|         |  comparisons  |   exchanges   |  comparisons  |   exchanges   |');
  Writeln('+---------+---------------+---------------+---------------+---------------+');
end;
procedure output (var steps,comp,max:integer);
begin
  write('         ',Comp:5) ;
 write('          ',Steps:5);
end;
procedure ShellSort(var A: TArray; max: Integer);
var Steps,Comp,t,k,i,j,tmp,m:integer;
begin
  comp:=0;
  steps:=0 ;
  t := Trunc(Ln(max) / Ln(2)) - 1;
  //writeln('t = ', t);
  for i:=1 to t do
  begin
    // Writeln('t= ',t+1-i);
    k:= (1 shl (t+1-i)) - 1;
    // Writeln(k);
    for j:=(k + 1) to max do
    begin
      tmp:=A[j];
      m:=j-k;
      While((m>=1) and (A[m] > tmp)) do
      begin
        A[M+k] := A[m];
        m:=m-k;
        Inc(Comp);
        Inc(steps);
      end;
      A[m+k] := tmp;
      Inc(Comp);
      //Inc(Perm);

    end;
  end;
  output(steps,comp,max);
end;

procedure InsertionSort(var A: TArray; max: Integer);
var i,j,tmp,Steps,Comp:integer;
begin
Steps:=0;
comp:=0;
for i:=2 to max do
  begin
  tmp:=A[i];
  j:=i;
    While ((j>1) and   (A[j-1]>tmp)) do
     begin
     inc(steps);
     inc(Comp);
      A[j]:=A[j-1];
      dec(j);
      end;
  A[j]:=tmp;
   inc(comp);
 end;
  output(steps,comp,max);

end;
procedure reverse(var A: TArray; max: Integer);
var i,j,tmp:integer;
begin
i:=0;
j:=max;
for i:=1 to (max div 2) do
begin
tmp:=A[i];
A[i]:=A[j];
A[j]:=tmp;
dec(j);
end;
end;


begin
 SetConsoleOutputCP(1251);
SetConsoleCP(1251);
  Randomize;
  Writetablehead;
  f:=10 ;
   j:=0;
   while j<>3 do
  begin
  inc(j);
for i:=1 to f do
  begin
    A[i]:=random(100);
    B[i]:=A[i];
    //write(A[i],' ');
  end;
  writeln;
  writeln(f,' el.');
write('unsorted|');
ShellSort(A,f);
InsertionSort(B,f);
reverse(A,f);
reverse(B,f);
writeln;
write('reverse  ');
ShellSort(A,f);
InsertionSort(B,f);
writeln;
write('sorted   ');
ShellSort(A,f);
InsertionSort(B,f);
f:=f*10*j;
  end;
readln;
end.
