n,m = map(int,input().split())

if n < m:
    n,m = m,n

while m != 0:
    r = n % m
    print(r)
    n = m
    m = r
