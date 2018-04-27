#!/usr/bin/gawk
BEGIN {
	first=0
	i=0
	flag=0
	name[i]=$unameno
        pcnt[i]=0
        tcnt[i]=0
        ctime[i]=0
        muse[i]=0
	pid=0
}
{
	if(first == 0)
	{
		for(a=0;a<=8;a++)
		{
			if( $a == "USER" )
			{
				unameno = a
			}
			if( $a == "PID" )
			{
				pidno = a
			}
			if( $a == "LWP" )
			{
				thrno = a
			}
			if( $a == "SZ" )
			{
				sizeno = a
			}
			if( $a == "TIME" )
			{
				timeno = a
			}
		}
		first=1
	}
	else
	{
		for(j=0;j<=i;j++)
		{
			if( $unameno == name[j] )
			{
				flag=1
				ind=j
				break
			}
		}
		if( flag==0 )
		{
			i++
			name[i]=$unameno
			pcnt[i]=0
			tcnt[i]=0
			ctime[i]=0
			muse[i]=0
			ind=i
		}
		else
		{
			flag=0
		}
		split($timeno,x,":")
		time=x[1]*3600+x[2]*60+x[3]
		if(pid == $pidno)
		{
			tcnt[ind]++
			ctime[ind]+=time
		}
		else
		{
			pid = $pidno
			pcnt[ind]++
			tcnt[ind]++
			ctime[ind]+=time
			muse[ind]+=$sizeno
		}	
	}
}
END {
	printf("Number of users: %d\n",i)
	for(l=1;l<=i;l++)
	{
		printf("User %s has: Processes = %d; Total threads = %d; Memory usage = %d bytes; CPU Time = %d sec\n",name[l],pcnt[l],tcnt[l],muse[l],ctime[l])
	}
}
