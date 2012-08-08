use strict;
use warnings;
use utf8;
use FindBin::libs;

use TemplateEngine;

my $template = TemplateEngine->new( file => 'templates/main.html' );

print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです.
  contentにリンクを埋め込みます.
  http://dotinstall.com/
  リンク先のタイトルに変換されてそのURLへジャンプできます.',
}); 
