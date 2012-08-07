var Template = function(input) {
	this.src = input.source;
};

Template.prototype = {
	render: function(data) {
		//記事データの読み取りとhtmlエスケープ
		this.h1 = this.escapeChars(data["title"]);
		this.h2 = this.escapeChars(data["content"]);
		//テンプレートの置き換え
		this.src = this.src.replace(/{%\s*title\s*%}/,this.h1);
		this.src = this.src.replace(/{%\s*content\s*%}/,this.h2);
		return this.src;
	},
	escapeChars:function(char){
		char = char.replace(/</g, "&lt;");
		char = char.replace(/>/g, "&gt;");
		char = char.replace(/"/g, "&quot;");
		char = char.replace(/'/g, "&#039;");
		char = char.replace(/&/g, "&amp;");
		return char;
	}
};
