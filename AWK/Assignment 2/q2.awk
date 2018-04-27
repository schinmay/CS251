#!/usr/bin/gawk
BEGIN{
	i=0
	flag=0
	initime[0]=$1
	A[0]=$3
	split($5,x,":")
	B[0]=x[1]
	numpacketsA[0]=0
        numdatapacketsA[0]=0
        numbytesA[0]=0
        numretransA[0]=-1
       	numpacketsB[0]=0
	numdatapacketsB[0]=0
        numbytesB[0]=0
	numretransB[0]=0
}
{
	split($5,y,":")
	for(j=0;j<=i;j++)
	{
		if( $3 == A[j] && y[1] == B[j] )
		{
			flag=1
			fintimeA[j]=$1
			ind=j
			break
		}
		else if( $3 == B[j] && y[1] == A[j] )
		{	
			flag=1
			fintimeB[j]=$1
			ind=j
			break	
		}
	}
	if( flag==0 )
	{
		i++
		A[i]=$3
		B[i]=y[1]
		initime[i]=$1
		numpacketsA[i]=0
		numdatapacketsA[i]=0
		numbytesA[i]=0
		numretransA[i]=-1
		numpacketsB[i]=0
                numdatapacketsB[i]=0
                numbytesB[i]=0
                numretransB[i]=0
		ind=i
	}
	else
	{	
		flag=0		
	}
	if(A[ind] == $3)
	{
		numpacketsA[ind]++
		if( $9 ~ /:/ )
		{
			numdatapacketsA[ind]++
			split($9,bytesA,":")
			numbytesA[ind]+=bytesA[2]-bytesA[1]
		}
		if( $8 != "ack" && $10 != "ack" )
                {
                        numretransA[ind]++
                }
	}
	else if(B[ind] == $3)
	{
                numpacketsB[ind]++
                if( $9 ~ /:/ )
                {
                        numdatapacketsB[ind]++
                        split($9,bytesB,":")
                        numbytesB[ind]+=bytesB[2]-bytesB[1]
                }
		if( $8 != "ack" && $10 != "ack" )
		{
			numretransB[ind]++
		}
	}		
}
END{
	for(l=1;l<=i;l++)
	{
		split(A[l],nameA,".");
		connA[l]=nameA[1]"."nameA[2]"."nameA[3]"."nameA[4]":"nameA[5]
		split(B[l],nameB,".");
        	connB[l]=nameB[1]"."nameB[2]"."nameB[3]"."nameB[4]":"nameB[5]
		split(initime[l],fir,":")
		split(fintimeA[l],secA,":")
		split(fintimeB[l],secB,":")
		timeA = (secA[1]-fir[1])*3600 + (secA[2]-fir[2])*60 + (secA[3]-fir[3])
		timeB = (secB[1]-fir[1])*3600 + (secB[2]-fir[2])*60 + (secB[3]-fir[3])
		xputA = (numbytesA[l] - numretransA[l])/timeA
		xputB = (numbytesB[l] - numretransB[l])/timeB
		print "Connection (A=" connA[l] " B=" connB[l] ")"
		print "A-->B #packets=" numpacketsA[l] ", #datapackets=" numdatapacketsA[l] ", #bytes=" numbytesA[l] ", #retrans=" numretransA[l] " xput=" xputA " bytes/sec"
		print "B-->A #packets=" numpacketsB[l] ", #datapackets=" numdatapacketsB[l] ", #bytes=" numbytesB[l] ", #retrans=" numretransB[l] " xput=" xputB " bytes/sec"	
	}
}
