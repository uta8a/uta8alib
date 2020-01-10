// name   : kaito_tateyama (uta8a)
// tag    : "Number"
// comment: "これ、悲しいけどvector fact(n+1)を宣言してから`for(1..n)fact[i] = fact[i-1]*i%MOD`したほうがいい。前計算O(N)すべき"

template < typename T >
T mod_factorial(T n, T m) {
    T res = 1;
    T op = 1;
    while(op <= n) {
        res *= op%m;
        res%=m;
        op++;
    }
    return res;
}
