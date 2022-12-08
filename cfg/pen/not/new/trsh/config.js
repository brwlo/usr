// config.js

/win/i.test(window.navigator.platform) ? bwRoot = 'i:\\u\\' : bwRoot = '/home/bw/u/'

let bwDirs = [
	["downloads","v/downloads"],
]; for (i of bwDirs) prefs.set("bw."+i[0], bwRoot+i[1])

let bwPrefs = [
	["profile",""],
]; for (i of bwPrefs) prefs.set("bw."+i[0], i[1])
