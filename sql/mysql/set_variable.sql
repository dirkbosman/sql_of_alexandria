SET @t1=1, @t2=2, @t3:=4;
SELECT @t1, @t2, @t3, @t4 := @t1+@t2+@t3;
