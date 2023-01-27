#!/bin/bash
echo ' ' 

 echo "Digit the basename string to find the files ";  
 
read texto

 echo "Gerar gráfico? [s/n]"

read grafico


 echo "Apagar arquivos de saída? [s/n]"

read arquivo

w_0=6500
w_f=6800  

v_vtol1=450
v_vtol2=20
v_vg=513
v_g=500
v_rg=1400
v_rtol1=1000
v_rtol2=15



vtol1_pm=200
vtol1_step=100


vtol_menos=$((v_vtol1-vtol1_pm))
vtol_mais=$((v_vtol1+vtol1_pm))


vtol2_pm=10
vtol2_step=10

vtol2_menos=$((v_vtol2-vtol2_pm))
vtol2_mais=$((v_vtol2+vtol2_pm))



rtol1_pm=200
rtol1_step=100


rtol_menos=$((v_rtol1-rtol1_pm))
rtol_mais=$((v_rtol1+rtol1_pm))




rtol2_pm=10
rtol2_step=10


rtol2_menos=$((v_rtol2-rtol2_pm))
rtol2_mais=$((v_rtol2+rtol2_pm))


for i in $(seq $vtol_menos $vtol1_step $vtol_mais) 
do


for j in $(seq $vtol2_menos $vtol2_step $vtol2_mais) 
do


for k in $(seq $rtol_menos $rtol1_step $rtol_mais) 
do


for l in $(seq $rtol2_menos $rtol2_step $rtol2_mais) 
do



echo $i,$j,$k,$l

#colar o código aqui




ls $texto*".fits" >> "filename.txt" 

echo $w_0","$w_f > "temp1.txt"


file="filename.txt"

while IFS= read -r line 

do  

auxiliar=$line"_vtol1_"$i"_""vtol2_"$j"_vg_"$v_vg"_rg_"$v_rg"_rtol1_"$k"_rtol2_"$l

echo $auxiliar

alfa -vg $v_vg -vtol1 $i -vtol2 $j -g $v_g -rg $v_rg -rtol1 $k -rtol2 $l $line  

echo $line 
echo "vtol1" $i 
echo "vtol2" $j
echo "vg"    $v_vg
echo "rg"    $v_rg
echo "g"     $v_g
echo "rtol1" $k
echo "rtol2" $l



nome_antigo_fit=$line"_fit"
nome_antigo=$line"_lines"
nome_antigo_tex=$line"_lines.tex"
echo $nome_antigo_fit
echo $nome_antigo
echo $nome_antigo_tex


mv $nome_antigo_fit $auxiliar"_fit"
mv $nome_antigo $auxiliar"_lines" 
mv $nome_antigo_tex $auxiliar"_lines.tex"

cp $auxiliar"_fit" 'temp.txt'


if [ "$grafico" == 's' ];
then
python gerar_grafico3.py 
fi


mv obj_temp.png $auxiliar"_fit.png"
#python media_residuos.py 
result=$(python media_residuos.py)

echo $line" vtol1 "$i" ""vtol2 "$j" vg "$v_vg" rg "$v_rg" rtol1 "$k" rtol2 "$l  $result >> "saida.txt"


#python media_residuos.py >>"saida.txt"

done <"$file"
rm "filename.txt"


if [ "$arquivo" == 's' ];
then

rm $nome_antigo_fit $auxiliar"_fit"
rm $nome_antigo $auxiliar"_lines" 
rm $nome_antigo_tex $auxiliar"_lines.tex"

fi


done
done
done
done
