{system each("l ",x,"/q";"cd ../..")}each string`codec`hash;

.q.xor:<>;
.q.roundup:{x*ceiling y%x};

.Q.b32:.Q.a,"234567";
.Q.hex:.Q.n,6#.Q.a;

/ Decodes (and pad to length of multiple 4) base 64 data
/ atob - ASCII to Binary
/ @example - `char$.Q.atobp"SGVsbG8sIFdvcmxkIQ"
.Q.atobp:{
    / Pad to length of multiple 4
    x:"="^.q.roundup[4;count x]$x:(x?"=")#x;
    `byte$(neg sum"="=x)_raze flip 256 vs 64 sv'0N 4#.Q.b6?x};

/ Convert kdb to Unix timestamp in seconds
/ kdb+ Epoch: Starts on 2000.01.01 and measures time in nanoseconds
/ Unix Epoch: Starts on 1970.01.01 and traditionally measures time in seconds
/ @param x - timestamp/datetime
.util.unixTimeStamp:{
    floor$[-12h~typ:type x;((-).`long$x,1970.01.01D)%1e9;
        -15h~typ;86400*x-1970.01.01T;'.log.error"Unsupported input type"]};
