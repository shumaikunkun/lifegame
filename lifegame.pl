@arr=(
[1,1,0,0],
[1,1,0,0],
[0,0,1,1],
[0,0,1,1],
);

@copy=(
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
);

for($i=0;$i<$#arr+1;$i++){
  for($j=0;$j<$#(@$arr[0])+1;$j++){
    print("$i,$j\n");
  }
}




&disp();


sub disp{
foreach $row (@arr){
  foreach $cell (@$row){ print $cell;
  }
  print "\n";
}
}

sub next_state{
    my($living_cells, $my_status)=@_;
    if($living_cells==3){ return 1; }
    elsif($living_cells==2){ return $my_status; }
    else{ return 0; }
}
