var Y = function (F) {
    return (function (x) {
        return F(function (y) { return (x(x))(y);});
    })
    (function (x) {
        return F(function (y) { return (x(x))(y);});
    });
};

var FactGen = function (fact) {
    return (function(n) {
        return ((n == 0) ? 1 : (n*fact(n-1))) ;
    });
}; 
