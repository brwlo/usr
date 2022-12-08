// library of fuzzy match functions

// stackoverflow.com/questions/9206013/javascript-fuzzy-search
// unamatasanatarai.github.io/FuzzyMatch/test/index.html
String.prototype.fuzzy1 = function (str) {
	var hay = this.toLowerCase(), i=0, n=-1, l
	str = str.toLowerCase();
	for (;l=str[i++];) {
		if (!~(n = hay.indexOf(l,n+1))) return false;
	}
	return true;
};
