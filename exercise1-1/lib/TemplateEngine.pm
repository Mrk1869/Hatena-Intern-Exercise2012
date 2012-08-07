#!/usr/bin/perl
use strict;
use warnings;

package TemplateEngine;
use IO::File;
use Encode;

sub new {
	my ($class, %values) = @_;
	my $dataStructure ={file => $values{file}};
	bless $dataStructure, $class;	
}

sub render {
	my ($self, $insertText) = @_;
	
	#引数のデリファレンスと分割
	my %insertText = %$insertText;
	my $title = $insertText{"title"};
	my $content = $insertText{"content"};

	#HTMLエスケープ
    $title = &escapeChars($title);
    $content = &escapeChars($content);

	#テンプレートファイルオープン
    open(templateFileHundle, '<:utf8', $self ->{file}) or die "Cannot open ".$self->{file}." :".$!;
	my @template = <templateFileHundle>;
	close(templateFileHundle);

	#テンプレートの置き換え
	foreach my $line (@template){
		$line =~ s/{%\s*title\s*%}/$title/g;
		$line =~ s/{%\s*content\s*%}/$content/g;
		print encode("utf8",$line);
    }
}

sub escapeChars {
	my $char = $_[0];
	$char =~ s/</&lt;/g;
	$char =~ s/</&gt;/g;
	$char =~ s/"/&quot;/g;
	$char =~ s/'/#39;/g;
	$char =~ s/&/&amp;/g;
}

#何か返さないとエラー
1;
