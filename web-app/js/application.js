if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function validateIng(obj,evt) {
	var units = new Array( 
	     		"ml",
	     		"L",
	     		"g",
	     		"kg",
	     		"tsp",
	     		"tbsp",
	     		"drop",
	     		"cup",
	     		"pinch",
	     		"taste",
	     		"piece",
	     		"slice",
	     		"can"
	     );
	units.sort();
	
	var val = document.getElementById('ing').value;
	var tip = document.getElementById('ingTip');
	
	if(val=="") {
		tip.innerHTML="Start by typing ingredients quantity...";
		return;
	}
	
	// Parse quantity
	var quantity;
	if(val.indexOf(' ')==-1) {
		quantity = val;
	}
	else {
		quantity = val.substr(0,val.indexOf(' '));
	}
	var twoPlacedFloat = parseFloat(quantity).toFixed(2);
	
	if(isNaN(twoPlacedFloat)) {
		if(quantity=="some") {
			twoPlacedFloat = 0;
		}
		else {
			tip.innerHTML="You are not specifying a valid ingredient quantity. Try '1.5', '3', or 'some'.";
			return;
		}
	}
	tip.innerHTML="Next, enter the unit of measurement of the ingredient...";
	
	if(document.getElementById('ing').value.indexOf(' ')==-1) {
		return;
	}
	complete(document.getElementById('ing'),evt, units);
	
	//if(document.getElementById('ing').value.match(/[\d\.]+ .+$/g)) {
	//	return;
	//}
	
	if(document.getElementById('ing').value.match(/[\d\.]+ .+ .+$/g)) {
		tip.innerHTML="When you are ready to add this ingredient, hit ENTER!";
		checkSubmit();
	}
	if(document.getElementById('ing').value.match(/[\d\.]+ .+ $/g)) {
		tip.innerHTML="Example ingredient format: '2 tbsp sugar'";
	}
}

function randomString(length) {
    var chars = '0123456789abcdefghiklmnopqrstuvwxyz'.split('');

    if (! length) {
        length = Math.floor(Math.random() * chars.length);
    }

    var str = '';
    for (var i = 0; i < length; i++) {
        str += chars[Math.floor(Math.random() * chars.length)];
    }
    return str;
}

function removeDiv(id)
{
	var div = document.getElementById(id);
	div.parentNode.removeChild(div);
}

function checkSubmit()
{
    if (window.event.keyCode == 13)
    {
    	var ingId = randomString(5);
    	document.getElementById('ingList').innerHTML = document.getElementById('ingList').innerHTML + '<li style="size: 4em" id="'+ ingId + '">' + document.getElementById('ing').value + '<a style="float:right" href="#" onclick="removeDiv(\'' + ingId + '\')">[X]</a></li>';
    	document.getElementById('ing').value = "";
    }
}

function complete(obj, evt, units) {
	if ((!obj) || (!evt) || (units.length == 0)) {
		return;
	}

	if (obj.value.length == 0) {
		return;
	}

	var elm = (obj.setSelectionRange) ? evt.which : evt.keyCode;

	if ((elm < 32) || (elm >= 33 && elm <= 46) || (elm >= 112 && elm <= 123)) {
		return;
	}

	var txt = obj.value.replace(/;/gi, " ");
	elm = txt.split(" ");
	txt = elm.pop();
	txt = txt.replace(/^\s*/, "");

	if (txt.length == 0) {
		return;
	}
	
	if (obj.createTextRange) {
		var rng = document.selection.createRange();
		if (rng.parentElement() == obj) {
			elm = rng.text;
			var ini = obj.value.lastIndexOf(elm);
		}
	} else if (obj.setSelectionRange) {
		var ini = obj.selectionStart;
	}

	for (var i = 0; i < units.length; i++) {
		elm = units[i].toString();

		if (elm.toLowerCase().indexOf(txt.toLowerCase()) == 0) {
			obj.value += elm.substring(txt.length, elm.length);
			break;
		}
	}

	if (obj.createTextRange) {
		rng = obj.createTextRange();
		rng.moveStart("character", ini);
		rng.moveEnd("character", obj.value.length);
		rng.select();
	} else if (obj.setSelectionRange) {
		obj.setSelectionRange(ini, obj.value.length);
	}
	var textbox = document.getElementById('ing');
	var sel = textbox.value.substr(textbox.selectionStart,textbox.selectionEnd-textbox.selectionStart);
	var tip = document.getElementById('ingTip');
	if(sel.length == 0) {
		if(contains(units, textbox.value)) {
			tip.innerHTML="Next, enter the name of the ingredient...";
			return;
		}
		tip.innerHTML="You are not specifying a valid ingredient measurement unit. The valid list is as follows: " + units;
		return;
	}
	tip.innerHTML="Next, enter the name of the ingredient...";
}

function contains(array,value)
{
	for (index = 0; index < array.length; ++index) {
		if(value.indexOf(array[index])!=-1) {
			return true;
		}
	}	
	return false;
}

function occurrences(string, subString, allowOverlapping){

    string+=""; subString+="";
    if(subString.length<=0) return string.length+1;

    var n=0, pos=0;
    var step=(allowOverlapping)?(1):(subString.length);

    while(true){
        pos=string.indexOf(subString,pos);
        if(pos>=0){ n++; pos+=step; } else break;
    }
    return(n);
}