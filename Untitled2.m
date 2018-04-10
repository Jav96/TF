Sum1=0;
Sum2=0;
DeltaX=Length_dom/Numb_cells;
for i= 1:length(Pos_cells)
    Sum1=Sum1+Node_chargeDensity(i)*Pos_cells(i)
end
Sum1=DeltaX*Sum1;
for i=1:Numb_cells
    for j=1:Numb_part
        Sum2=Sum2+Charge(i,j)*Pos_part(i,j)
    end
end