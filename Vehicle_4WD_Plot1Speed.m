% Код для построения графиков результатов моделирования модели Vehicle_4WD
%% Описание графиков:
%
% На графиках ниже показаны скорость двигателя и скорость автомобиля.
% Поскольку автомобиль начинает движение с нуля на подъёме, он сначала катится назад,
% пока крутящий момент двигателя не станет достаточным для движения вверх по склону.
% Copyright 2016 The MathWorks, Inc.
% Сгенерировать результаты моделирования, если они ещё не существуют

if ~exist('simlog_Vehicle_4WD', 'var')
    sim('Vehicle_4WD')
end

% Использовать существующее окно графика, если оно уже есть, иначе создать новое окно
if ~exist('h1_Vehicle_4WD', 'var') || ...
        ~isgraphics(h1_Vehicle_4WD, 'figure')
    h1_Vehicle_4WD = figure('Name', 'Vehicle_4WD');
end
figure(h1_Vehicle_4WD)
clf(h1_Vehicle_4WD)

% Получить результаты моделирования
simlog_t = simlog_Vehicle_4WD.Vehicle_Body.V.series.time;
simlog_vehSpd = simlog_Vehicle_4WD.Vehicle_Body.V.series.values('km/hr');
simlog_wEngine = simlog_Vehicle_4WD.Engine.F.w.series.values('rpm');
simlog_thrEngine = simlog_Vehicle_4WD.Engine.ThrNorm.series.values;

% Построить графики результатов
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_vehSpd, 'LineWidth', 1)
hold off
grid on
title('Vehicle Speed')
ylabel('Speed (km/hr)')

simlog_handles(2) = subplot(2, 1, 2);
yyaxis left
plot(simlog_t, simlog_thrEngine, 'LineWidth', 1)
ylabel('Throttle (0-1)')
set(gca,'YLim',[-0.1 1.1])
yyaxis right
hold on
plot(simlog_t, simlog_wEngine, 'LineWidth', 1)
ylabel('Speed (RPM)')
grid on
title('Engine Throttle and Speed')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Удалить временные переменные
clear simlog_t simlog_handles
clear simlog_vehSpd simlog_wEngine simlog_thrEngine 

