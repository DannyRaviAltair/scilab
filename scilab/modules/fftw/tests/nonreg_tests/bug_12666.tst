// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 12666 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=12666
//
// <-- Short Description -->
// 
// There is a memory leak in fft function

[a1,b1]=getmemory();
mat=zeros(128,128);
tic();
for(i=1:50000)
    mat = fft(mat,1);
end
time=toc();
[a2,b2]=getmemory();
assert_checktrue(abs(a1-a2) < 20000);
assert_checktrue(time < 40);