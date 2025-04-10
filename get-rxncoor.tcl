## load files here
proc analysis {text1 fileb} {
for {set i -2} {$i < 2} {incr i 1} {
mol new win$i/step5_assembly.psf
mol addfile win$i/win$i-out-20ns.dcd step 5 waitfor all


set sel1 [atomselect top "serial 115 249 383 517 651 785 919 1053 1187 1321 1455 1589 1723 1857 1991 2125 2259 2393 2527 2661 2795 2929 3063 3197 3331 3465 3599 3733 3867 4001 4135 4269 4403 4537 4671 4805 4939 5073 5207 5341 5475 5609 5743 5877 6011 6145 6279 6413 6547 6681"]
set sel2 [atomselect top "$text1"]

set all [atomselect top all]
set filename ["$fileb" w]
for {set j 0} {$j < [molinfo top get numframes]} {incr j 1} {

   $sel1 frame $j
   $sel2 frame $j
   $all frame $j

   set c1 [measure center $sel1]
   set c2 [measure center $sel2]

   set distZ [lindex [vecsub $c2 $c1] 2]
puts $filename "$i $distZ"

      }
   } close $filename

}

quit

