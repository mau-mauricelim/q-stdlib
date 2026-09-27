/#########
/# SHA-2 #
/#########

// NOTE: No performance benefit converting to an accumulator
/ @param ns - namespace
/ @param algo - namespace key
/ @param text - string/byte
/ @return - byte
.sha2.hash:{[ns;algo;text]
    messageSize:ns`messageSize;
    blockSize:ns`blockSize;
    wordSize:ns`wordSize;
    K:ns`K;
    sigma0:ns`sigma0;
    sigma1:ns`sigma1;
    Sigma0:ns`Sigma0;
    Sigma1:ns`Sigma1;

    H:ns[algo;`H];
    bit:ns[algo;`bit];

    bits:.sha.preprocess[messageSize;blockSize;wordSize;text];
    / 3.2 Operations on Words
    addMod2w:.sha.addMod2w wordSize;
    / 5.2 Parsing the Message
    blocks:blockSize cut bits;
    / Process each block
    j:0;
    do[count blocks;
        / Message schedule
        W,:(count[K]-count W:wordSize cut blocks j)#enlist wordSize#0b;
        / Extend the first 16 words into the remaining words
        do[count[W]-i:16;
            W[i]:addMod2w(W i-16;sigma0 W i-15;W i-7;sigma1 W i-2);
            i+:1];
        / Compression loop
        a:H 0;
        b:H 1;
        c:H 2;
        d:H 3;
        e:H 4;
        f:H 5;
        g:H 6;
        h:H 7;
        i:0;
        do[count K;
            T1:addMod2w(h;Sigma1 e;.sha.Ch[e;f;g];K i;W i);
            T2:addMod2w(Sigma0 a;.sha.Maj[a;b;c]);
            h:g;
            g:f;
            f:e;
            e:addMod2w(d;T1);
            d:c;
            c:b;
            b:a;
            a:addMod2w(T1;T2);
            i+:1];
        / Update hash values
        H:addMod2w each flip((a;b;c;d;e;f;g;h);H);
        j+:1];
    / Concatenation of the hash values
    .codec.hexToByte(bit div 4)#raze flip .codec.decToHex .codec.binToDec each H
    };
