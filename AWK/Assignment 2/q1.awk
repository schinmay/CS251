#!/usr/bin/gawk
BEGIN {
	com=0
	str=0
	nocom=0
	nostr=0
}
{
	if ( $0 ~ /\/\// )
	{
		com++
	}
	if ( $0 ~ /\".*\"/ )
	{
		str++
	}
	if ( $0 ~ /\/\/.*\".*\"/ )
	{
		nostr++
	}
	if ( $0 ~ /\".*\/\/.*\"/ )
	{
		nocom++
	}
	if ( $0 ~ /\".*\/\*.*\*\/.*\"/ )
        {
                nocom++
        }
	if ( index($0, "/*") != 0 )
	{
		if( $0 ~ /\/\*.*\".*\"/ )
		{
			nostr++
		}
		if( $0 ~ /\/\*.*\/\// )
		{
			nocom++
		}		
		if( index($0, "*/") != 0 )
		{
			
			com++
		}
		else
		{
			com++
			while( index($0, "*/") == 0 )
			{
				com++
				if(getline<=0)
				{	
					com++
					break
				}
				if( index($0, "*/") != 0 )
		                {
					break
				}
			}
		}
	}
}	
END {
	if(com > nocom)
        {
                com = com-nocom;
        }
        else
        {
                com=0;
        }
        if(str > nostr)
        {
                str = str-nostr;
        }
        else
        {
                str=0;
        }
	printf("%d lines of comments\n",com)
	printf("%d quoted strings\n",str)
}
