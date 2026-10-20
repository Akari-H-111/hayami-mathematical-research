"""Exact finite checks for the written all-n golden trace identities."""
import json
from pathlib import Path
if not __debug__:
    raise RuntimeError("Assertions must remain enabled")
# (a,b) represents a+b*c with c^2=3*c-1; integral pair arithmetic.
def add(v,w): return (v[0]+w[0],v[1]+w[1])
def scale(k,v): return (k*v[0],k*v[1])
def mul(v,w):
    a,b=v;d,e=w
    return (a*d-b*e,a*e+b*d+3*b*e)
def matmul(A,B):
    return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
M=((2,1),(1,1)); P=((1,0),(0,1)); cp=lp=(1,0)
fib=[0,1]
for _ in range(80):fib.append(sum(fib[-2:]))
for n in range(1,41):
    P=matmul(P,M);cp=mul(cp,(0,1));lp=mul(lp,(3,-1))
    q,p=fib[2*n],fib[2*n+1]
    assert P==((p,q),(q,fib[2*n-1]))
    assert add(lp,cp)==(P[0][0]+P[1][1],0)
    # phi=2-c; q*phi-p=-c^n.
    assert add((2*q-p,-q),cp)==(0,0)
    # sqrt(5)=3-2*c; sqrt(5)*q*c^n=1-c^(2n).
    assert mul((3,-2),scale(q,cp))==add((1,0),scale(-1,mul(cp,cp)))
result={"status":"PASS","exact_checks":"40 matrix powers, integral traces, Fibonacci errors and scaled identities","proof_scope":"all-n induction, recurrence and golden liminf norm proof in DIRECTOR_TRACE_BRIDGE.md; universal Hurwitz upper bound external"}
Path(__file__).with_name("DIRECTOR_TRACE_RESULTS.json").write_text(json.dumps(result,indent=2)+"\n")
print("PASS: exact golden trace and Fibonacci error identities, n=1..40")
