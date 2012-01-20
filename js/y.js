var Y = function (h) {
    return (function (f) {
        return f(f);
    })(function (f) {
        return h(function () {
            return f(f).apply(null, arguments);
        });
    });
};

var fact = Y(function (recur) {
    return function (n) {
        if (n < 2) return 1;
        return n * recur(n - 1);
   };
})

console.log(fact(5));
