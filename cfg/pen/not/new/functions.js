// functions.js

var newHints = ()=> {
	let modes = [
	['e','alt hints', e => { commands.execute(x+' p '+e.src)}, ''],
	['k','rev img'  , e => { commands.execute(x+' k '+e.src)}, ''],
	['p','gcache'   , e => { commands.execute(x+' p '+e.src)}, ''],
	['q','wayback'  , e => { commands.execute(x+' q '+e.src)}, ''],
	['u','in site'  , e => { commands.execute(x+' p '+e.src)}, '']]
	let mystery = node => node != -1 ? true : false;
	for (let i of modes) {
		i[3]='o'; hints.addMode(
			i[0], '(o)'+i[1], i[2], mystery);
		i[3]='w'; hints.addMode(
			i[0].toUpperCase(), '(t)'+i[1], i[2], mystery); }
}

var newModes = ()=> {
	if (!modes.BW) modes.addMode('BW',
		{ char: 'bw', description: 'bw mode', bases: [modes.NORMAL] }, "")
}

var base = (base, numbers) => {
	let out = '', algs =
		'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
	for (let i = numbers.length-1; i>=0; i--) {
		let Q = Math.floor(Math.abs(numbers[i])), R;
		do { R = Q%base; out=algs[R]+out; Q = (Q-R)/base; } while (Q>0);
	} return out;
}

var time = (sep) => {
	let d = new Date(), output = [
		d.getFullYear(), d.getMonth()+1, d.getDate(),
		d.getHours(), d.getMinutes(), d.getSeconds() ];
	return sep == undefined ? output : output.join(sep);
}
