alias zz='history | tail -2 | head -1 | sed s/\ // | sed s/\ // | sed s/^[[:digit:]]*\ //g | sed s/\(.*\)/\"$\"/g | xargs /home/kulwant/Desktop/ctrl-z.sh'
