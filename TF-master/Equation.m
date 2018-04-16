function Derivatives = Equation(x,Length_dom,Numb_cells,Mass,Charge,Numb_part,Pos_cells,Electric_Field_RHS,Frequency_RHS,Collisional_Freq,Bz,dBz)

Index_part = Index_cells(x(4),Length_dom,Numb_cells);
[~,~,Node_chargeDensity,~] = Node(Mass,x(4),Pos_cells,Numb_cells,x(3),Length_dom,Index_part,Charge,Numb_part);
[~,Electric_Field] = Poisson(Numb_cells,Length_dom,Node_chargeDensity,Pos_cells);


% Differential equations with respect to time to solve
for i = 1:
    Derivatives(1) = -Charge*Electric_Field_RHS/Mass*cos(x(5)-x(2))+x(3)*x(1)*dBz/(2*Bz);
    Derivatives(2) = Charge*Bz/Mass - Charge*Electric_Field_RHS*sin(x(5)-x(2))/(Mass*x(1));
    Derivatives(3) = -Charge*Electric_Field/Mass-x(1)^2*dBz/(2*Bz)-Collisional_Freq*x(3);
    Derivatives(4) = x(3);
    Derivatives(5) = Frequency_RHS;
    

end