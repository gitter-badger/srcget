#
# phpvers.awk
#
# created: 310713
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        pos = 0
      }

# custom rules

/.tar.xz/ \
{
  bn = $2
  sub(/\/get\//,"", bn);
  sub(/\/from\/a\/mirror/, "", bn);
  bn = substr(bn, 1, index(bn, ".tar.")-1)
  sub(/php-/, "", bn);
} 

### end loop ###

END \
{
  print bn
}
## EOF ##
