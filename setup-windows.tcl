
for {set i -39} {$i < 21} {incr i} {

## write the config files
  set in1 [open "win-base.conf" r]
  set out [open "../win${i}/win${i}.conf" w]
  puts $out "set num $i"
  while { [gets $in1 line] >= 0} {
    puts $out $line
  } 
  close $out

## write the colvars input files      
#  set in2 [open "US-base.in" r]
#  set out [open "win${i}/win${i}.in" w]
#  while { [gets $in2 line] >= 0} {
#    if { [string match "*CENTER*" $line]} {
#      puts $out "   centers        [expr $i]"
#    } else {  
#      puts $out $line
#    }
#  }
}
