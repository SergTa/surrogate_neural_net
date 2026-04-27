function Vehicle_4WD_SetTires(modelname,tirevariant)
% Code to select tire model in VehicleWithFourWheelDrive

% Copyright 2016 The MathWorks, Inc.

if strcmpi(tirevariant,'Simple')
    evalin('base','TIRE=1;');
    h=find_system(modelname,'MatchFilter', @Simulink.match.allVariants,'ActiveVariant',tirevariant);
elseif strcmpi(tirevariant,'Friction')
    evalin('base','TIRE=2;');
    h=find_system(modelname,'MatchFilter', @Simulink.match.allVariants,'ActiveVariant',tirevariant);
elseif strcmpi(tirevariant,'MFormula')
    evalin('base','TIRE=3;');
    h=find_system(modelname,'MatchFilter', @Simulink.match.allVariants,'ActiveVariant',tirevariant);
end

% Triggers update of Variant Subsystem mask
for i=1:length(h)
    set_param(h{i},'ShowName','on');
end


