#!/usr/bin/perl -w
use strict;
use warnings;
use SVG;


my $width = 1200;  
my $height = 1200;
my $svg = SVG->new('width', ($width+100), 'height', ($height+100));  

my $x = $svg->group(id=>'group_x', style=>{stroke=>'black','stroke-width',1} );  #建x轴  
my $y = $svg->group(id=>'group_y', style=>{stroke=>'blue', 'stroke-width',1} ); 
my $z = $svg->group(id=>'group_z', style=>{stroke=>'blue', 'stroke-width',1} ); 
my $p = $svg->group(id=>'group_p', style=>{stroke=>'grey', 'opacity',0.2,'stroke-width',8} );  

$x->line(x1=>100, y1=>$height-100, x2=>($width-100), y2=>$height-100 );
$y->line(x1=>100, y1=>$height-100, x2=>100, y2=>100);
$z->line(x1=>$width-100, y1=>$height-100, x2=>$width-100, y2=>100);

my $sw = ($width - 200) / 5; #x轴长标度（刻度数）
my $sh = ($height- 200) / 14; #z轴长标度
my $sy = ($height- 200)/(14*5);#y轴长标度

my $k; 
#for ($k=2,$k<10,$k++) {
#	$p->line(x1=>$width-100, y1=>100+$k*$sh, x2=>100, y2=>100+$k*$sh );  
#}
#

 
for($k=1; $k <5; $k++){  #x轴刻度
$x->line(x1=>(100+$sw*$k), y1=>$height-100, x2=>(100+$sw*$k), y2=>$height-95 );
}

for($k=0; $k <70; $k=$k+5){  #y轴刻度
	for (my $i=0;$i<5;$i++) {
		$svg->text(x=>75, y=>($height-100-$sy*$k-$i*$sy),'font-size'=>1, 'stroke', 'black', '-cdata', $i*3);
		$p->line(x1=>100, y1=>$height-100-$sy*$k-$i*$sy, x2=>$width-100, y2=>$height-100-$sy*$k-$i*$sy,style=>"stroke:rgb(128,128,128);stroke-width:10,opacity:1");  #p轴
	}
}

my $value_x = 0;  #x轴刻度值
#my $value_y;  
for($k=0; $k<5; $k++){
	$svg->text(x=>(95+$sw*$k), y=>$height-85, 'font-size'=>10, 'stroke', 'black', '-cdata', 10*$k."M" ); 
} 



#my @j=(1..15);	#z轴刻度值
my %hash;
my %hash1;
for(my $j=0; $j<15; $j++){
#	$hash{$j[$j]}=$chr[$j];
#	$hash1{$j[$j]}=$len[$j];
	$svg->text(x=>$width-75, y=>(100+$sh*$j),'font-size'=>10, 'stroke', 'black', '-cdata', "chr");
}


#for($k=1; $k<15; $k++){ #画染色体
#	$svg->rect(x => 100, y=>(85+$sh*$k), width => $hash1{$k}*20, height => 20,style=>"fill:rgb(128,138,154);stroke-width:1;stroke:rgb(128,138,54)");
#}
#
#open (G,"<",$gff3file) or die $!;#读gff3文件
#my %hash2;
#my %hash3;
#$/="\n";
#while(<G>){
#	chomp;
#	next if (/^##/);
#	if ($_=~/.*gene.*/) {
#		my ($chr,undef,$type,$start,$end,@arr)=split /\t/,$_;
#		$hash2{$chr}{$start*20*0.000001}=$end*20*0.000001;
#	}
#}
#for(my $k=1; $k<15; $k++){	#画基因
#	for my $key(keys %{$hash2{$hash{$k}}}){
#		$svg->line(x1=>100+$key, y1=>(85+$sh*$k), x2=>100+$key, y2=>105+$sh*$k,style=>"stroke:rgb(255,0,0);stroke-width:0.05");
#	}
#}	
#
print $svg->xmlify;  
















