/################################
/# Time-based One-Time Password #
/################################

/ @param algo - function - hash function
/ @param step - number - time step in seconds
/ @param len - number - OTP length
/ @param k - string - base32 encoded text
/ @param t - timestamp
/ @return - string - digits of length (len)
.totp.i.totp:{[algo;step;len;k;t]
    / Base32 decode key
    k:.codec.b32ToByte k;
    / Time step calculation
    time:floor .util.unixTimeStamp[t]%step;
    / 8-Byte Big-Endian message
    msg:.codec.decToByte8 time;
    / Hash
    hash:algo[k;msg];
    / Dynamic truncation
    offset:.codec.binToDec 00001111b&.codec.byteToBin last hash;
    slice:hash offset+til 4;
    / Strip the Most Significant Bit
    dec:.codec.binToDec raze(01111111b;11111111b;11111111b;11111111b)&.codec.byteToBin slice;
    "0"^neg[len]$string mod[dec;"j"$10 xexp len]
    };

.totp.totp:{[algo;step;len;k] .totp.i.totp[.hmac algo;step;len;k;.z.p]};
.totp.md5:.totp.totp[`md5;;;];
.totp.sha1:.totp.totp[`sha1;;;];
.totp.sha224:.totp.totp[`sha224;;;];
.totp.sha256:.totp.totp[`sha256;;;];
.totp.sha384:.totp.totp[`sha384;;;];
.totp.sha512:.totp.totp[`sha512;;;];
.totp.sha512x224:.totp.totp[`sha512x224;;;];
.totp.sha512x256:.totp.totp[`sha512x256;;;];

/ With this library, you can build and actual TOTP Authenticator in q :)
