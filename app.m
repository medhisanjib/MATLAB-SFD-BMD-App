classdef Mortgage < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        MortgageCalculatorUIFigure  matlab.ui.Figure
        GridLayout                  matlab.ui.container.GridLayout
        LeftPanel                   matlab.ui.container.Panel
        ShearForceandBendingMomentPlotterButtonGroup  matlab.ui.container.ButtonGroup
        TabGroup                    matlab.ui.container.TabGroup
        CLTab                       matlab.ui.container.Tab
        LoadEditFieldLabel          matlab.ui.control.Label
        LoadEditField               matlab.ui.control.NumericEditField
        PositionEditFieldLabel      matlab.ui.control.Label
        PositionEditField           matlab.ui.control.NumericEditField
        PlotButton                  matlab.ui.control.Button
        LengthEditField_6Label      matlab.ui.control.Label
        LengthEditField_6           matlab.ui.control.NumericEditField
        Support1EditFieldLabel      matlab.ui.control.Label
        Support1EditField           matlab.ui.control.NumericEditField
        Support2EditFieldLabel      matlab.ui.control.Label
        Support2EditField           matlab.ui.control.NumericEditField
        UDLTab                      matlab.ui.container.Tab
        LoadEditField_2Label        matlab.ui.control.Label
        LoadEditField_2             matlab.ui.control.NumericEditField
        PositionEditField_2Label    matlab.ui.control.Label
        PositionEditField_2         matlab.ui.control.NumericEditField
        LoadEditField_3Label        matlab.ui.control.Label
        LoadEditField_3             matlab.ui.control.NumericEditField
        PositionEditField_3Label    matlab.ui.control.Label
        PositionEditField_3         matlab.ui.control.NumericEditField
        PlotButton_2                matlab.ui.control.Button
        LengthEditField_7Label      matlab.ui.control.Label
        LengthEditField_7           matlab.ui.control.NumericEditField
        Support1EditField_2Label    matlab.ui.control.Label
        Support1EditField_2         matlab.ui.control.NumericEditField
        Support2EditField_2Label    matlab.ui.control.Label
        Support2EditField_2         matlab.ui.control.NumericEditField
        CLUDLTab                    matlab.ui.container.Tab
        CLoadEditFieldLabel         matlab.ui.control.Label
        CLoadEditField              matlab.ui.control.NumericEditField
        PositionEditField_4Label    matlab.ui.control.Label
        PositionEditField_4         matlab.ui.control.NumericEditField
        ULoadEditFieldLabel         matlab.ui.control.Label
        ULoadEditField              matlab.ui.control.NumericEditField
        PositionEditField_5Label    matlab.ui.control.Label
        PositionEditField_5         matlab.ui.control.NumericEditField
        ULoadEditField_2Label       matlab.ui.control.Label
        ULoadEditField_2            matlab.ui.control.NumericEditField
        PositionEditField_6Label    matlab.ui.control.Label
        PositionEditField_6         matlab.ui.control.NumericEditField
        PlotButton_3                matlab.ui.control.Button
        LengthEditField_8Label      matlab.ui.control.Label
        LengthEditField_8           matlab.ui.control.NumericEditField
        Support1EditField_3Label    matlab.ui.control.Label
        Support1EditField_3         matlab.ui.control.NumericEditField
        Support2EditField_3Label    matlab.ui.control.Label
        Support2EditField_3         matlab.ui.control.NumericEditField
        CLBMTab                     matlab.ui.container.Tab
        LoadEditField_4Label        matlab.ui.control.Label
        LoadEditField_4             matlab.ui.control.NumericEditField
        PositionEditField_7Label    matlab.ui.control.Label
        PositionEditField_7         matlab.ui.control.NumericEditField
        MomentEditFieldLabel        matlab.ui.control.Label
        MomentEditField             matlab.ui.control.NumericEditField
        PositionEditField_8Label    matlab.ui.control.Label
        PositionEditField_8         matlab.ui.control.NumericEditField
        PlotButton_4                matlab.ui.control.Button
        LengthEditField_9Label      matlab.ui.control.Label
        LengthEditField_9           matlab.ui.control.NumericEditField
        Support1EditField_4Label    matlab.ui.control.Label
        Support1EditField_4         matlab.ui.control.NumericEditField
        Support2EditField_4Label    matlab.ui.control.Label
        Support2EditField_4         matlab.ui.control.NumericEditField
        UDLBMTab                    matlab.ui.container.Tab
        ULoadEditField_5Label       matlab.ui.control.Label
        ULoadEditField_5            matlab.ui.control.NumericEditField
        PositionEditField_9Label    matlab.ui.control.Label
        PositionEditField_9         matlab.ui.control.NumericEditField
        ULoadEditField_3Label       matlab.ui.control.Label
        ULoadEditField_3            matlab.ui.control.NumericEditField
        PositionEditField_10Label   matlab.ui.control.Label
        PositionEditField_10        matlab.ui.control.NumericEditField
        MomentEditField_2Label      matlab.ui.control.Label
        MomentEditField_2           matlab.ui.control.NumericEditField
        PositionEditField_11Label   matlab.ui.control.Label
        PositionEditField_11        matlab.ui.control.NumericEditField
        PlotButton_5                matlab.ui.control.Button
        LengthEditField_10Label     matlab.ui.control.Label
        LengthEditField_10          matlab.ui.control.NumericEditField
        Support1EditField_5Label    matlab.ui.control.Label
        Support1EditField_5         matlab.ui.control.NumericEditField
        Support2EditField_5Label    matlab.ui.control.Label
        Support2EditField_5         matlab.ui.control.NumericEditField
        RightPanel                  matlab.ui.container.Panel
        Label                       matlab.ui.control.Label
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.MortgageCalculatorUIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {264, 264};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {369, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end

        % Callback function
        function MonthlyPaymentButtonPushed(app, event)
                       
            % Calculate the monthly payment
            amount = app.LoanAmountEditField.Value ;
            rate = app.InterestRateEditField.Value/12/100 ;
            nper = 12*app.LoanPeriodYearsEditField.Value ;
            payment = (amount*rate)/(1-(1+rate)^-nper);
            app.MonthlyPaymentEditField.Value = payment;
            
            % pre allocating and initializing variables 
            interest = zeros(1,nper);
            principal = zeros(1,nper);
            balance = zeros (1,nper);
            
            balance(1) = amount;
            
            % Calculate the principal and interest over time
            for i = 1:nper
                interest(i)  = balance(i)*rate ;
                principal(i) = payment - interest(i) ;
                balance(i+1) = balance(i) - principal(i) ;
            end
            
            % Plot the principal and interest
            plot(app.PrincipalInterestUIAxes, (1:nper)', principal, ...
                (1:nper)', interest) ;
            legend(app.PrincipalInterestUIAxes,{'Principal','Interest'},'Location','Best')
            xlim(app.PrincipalInterestUIAxes,[0 nper]) ; 
            
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            Name = 'Concentrated Load';
            Support1 = [app.LengthEditField_6.Value,app.Support1EditField.Value,app.Support2EditField.Value];
            Load1 = {'CF',app.LoadEditField.Value,app.PositionEditField.Value};
            SFBM(Name,Support1,Load1);
        end

        % Button pushed function: PlotButton_2
        function PlotButton_2Pushed(app, event)
            Name = 'Uniformly Distriuted Load';
            Support1 = [app.LengthEditField_7.Value,app.Support1EditField_2.Value,app.Support2EditField_2.Value];
            Load1 = {'DF',[app.LoadEditField_2.Value,app.LoadEditField_3.Value],[app.PositionEditField_2.Value,app.PositionEditField_3.Value]};
            SFBM(Name,Support1,Load1);
        end

        % Button pushed function: PlotButton_3
        function PlotButton_3Pushed(app, event)
            Name = 'CL/UDL';
            Support1 = [app.LengthEditField_8.Value,app.Support1EditField_3.Value,app.Support2EditField_3.Value];
            Load1 = {'CF',app.CLoadEditField.Value,app.PositionEditField_4.Value};
            Load2 = {'DF',[app.ULoadEditField.Value,app.ULoadEditField_2.Value],[app.PositionEditField_5.Value,app.PositionEditField_6.Value]};
             SFBM(Name,Support1,Load1,Load2);
            
        end

        % Button pushed function: PlotButton_4
        function PlotButton_4Pushed(app, event)
            Name = 'CL with Moment';
            Support1 = [app.LengthEditField_9.Value,app.Support1EditField_4.Value,app.Support2EditField_4.Value];
            Load1 = {'CF',app.LoadEditField_4.Value,app.PositionEditField_7.Value};
            Moment1 = {'M',app.MomentEditField.Value,app.PositionEditField_8.Value};
              SFBM(Name,Support1,Load1,Moment1);
            
        end

        % Button pushed function: PlotButton_5
        function PlotButton_5Pushed(app, event)
            Name = 'Uniformly Distriuted Load';
            Support1 = [app.LengthEditField_10.Value,app.Support1EditField_5.Value,app.Support2EditField_5.Value];
            Load1 = {'DF',[app.ULoadEditField_5.Value,app.ULoadEditField_3.Value],[app.PositionEditField_9.Value,app.PositionEditField_10.Value]};
            Moment1 = {'M',app.MomentEditField_2.Value,app.PositionEditField_11.Value};
            SFBM(Name,Support1,Load1,Moment1);
            
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create MortgageCalculatorUIFigure and hide until all components are created
            app.MortgageCalculatorUIFigure = uifigure('Visible', 'off');
            app.MortgageCalculatorUIFigure.AutoResizeChildren = 'off';
            app.MortgageCalculatorUIFigure.Position = [100 100 594 264];
            app.MortgageCalculatorUIFigure.Name = 'Shear Force Bending Moment Plotter';
            app.MortgageCalculatorUIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.MortgageCalculatorUIFigure);
            app.GridLayout.ColumnWidth = {369, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;
            app.LeftPanel.Scrollable = 'on';

            % Create ShearForceandBendingMomentPlotterButtonGroup
            app.ShearForceandBendingMomentPlotterButtonGroup = uibuttongroup(app.LeftPanel);
            app.ShearForceandBendingMomentPlotterButtonGroup.Title = 'Shear Force and Bending Moment Plotter';
            app.ShearForceandBendingMomentPlotterButtonGroup.Position = [7 7 357 250];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.ShearForceandBendingMomentPlotterButtonGroup);
            app.TabGroup.Position = [1 0 351 226];

            % Create CLTab
            app.CLTab = uitab(app.TabGroup);
            app.CLTab.Title = 'CL';

            % Create LoadEditFieldLabel
            app.LoadEditFieldLabel = uilabel(app.CLTab);
            app.LoadEditFieldLabel.HorizontalAlignment = 'right';
            app.LoadEditFieldLabel.Position = [108 116 32 22];
            app.LoadEditFieldLabel.Text = 'Load';

            % Create LoadEditField
            app.LoadEditField = uieditfield(app.CLTab, 'numeric');
            app.LoadEditField.Position = [155 116 100 22];

            % Create PositionEditFieldLabel
            app.PositionEditFieldLabel = uilabel(app.CLTab);
            app.PositionEditFieldLabel.HorizontalAlignment = 'right';
            app.PositionEditFieldLabel.Position = [92 95 48 22];
            app.PositionEditFieldLabel.Text = 'Position';

            % Create PositionEditField
            app.PositionEditField = uieditfield(app.CLTab, 'numeric');
            app.PositionEditField.Position = [155 95 100 22];

            % Create PlotButton
            app.PlotButton = uibutton(app.CLTab, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Position = [124 56 100 22];
            app.PlotButton.Text = 'Plot';

            % Create LengthEditField_6Label
            app.LengthEditField_6Label = uilabel(app.CLTab);
            app.LengthEditField_6Label.HorizontalAlignment = 'right';
            app.LengthEditField_6Label.Position = [4 165 42 22];
            app.LengthEditField_6Label.Text = 'Length';

            % Create LengthEditField_6
            app.LengthEditField_6 = uieditfield(app.CLTab, 'numeric');
            app.LengthEditField_6.Position = [56 165 37 22];

            % Create Support1EditFieldLabel
            app.Support1EditFieldLabel = uilabel(app.CLTab);
            app.Support1EditFieldLabel.HorizontalAlignment = 'right';
            app.Support1EditFieldLabel.Position = [108 165 54 22];
            app.Support1EditFieldLabel.Text = 'Support1';

            % Create Support1EditField
            app.Support1EditField = uieditfield(app.CLTab, 'numeric');
            app.Support1EditField.Position = [172 165 37 22];

            % Create Support2EditFieldLabel
            app.Support2EditFieldLabel = uilabel(app.CLTab);
            app.Support2EditFieldLabel.HorizontalAlignment = 'right';
            app.Support2EditFieldLabel.Position = [223 165 54 22];
            app.Support2EditFieldLabel.Text = 'Support2';

            % Create Support2EditField
            app.Support2EditField = uieditfield(app.CLTab, 'numeric');
            app.Support2EditField.Position = [287 165 37 22];

            % Create UDLTab
            app.UDLTab = uitab(app.TabGroup);
            app.UDLTab.Title = 'UDL';

            % Create LoadEditField_2Label
            app.LoadEditField_2Label = uilabel(app.UDLTab);
            app.LoadEditField_2Label.HorizontalAlignment = 'right';
            app.LoadEditField_2Label.Position = [103 131 32 22];
            app.LoadEditField_2Label.Text = 'Load';

            % Create LoadEditField_2
            app.LoadEditField_2 = uieditfield(app.UDLTab, 'numeric');
            app.LoadEditField_2.Position = [150 131 100 22];

            % Create PositionEditField_2Label
            app.PositionEditField_2Label = uilabel(app.UDLTab);
            app.PositionEditField_2Label.HorizontalAlignment = 'right';
            app.PositionEditField_2Label.Position = [87 110 48 22];
            app.PositionEditField_2Label.Text = 'Position';

            % Create PositionEditField_2
            app.PositionEditField_2 = uieditfield(app.UDLTab, 'numeric');
            app.PositionEditField_2.Position = [150 110 100 22];

            % Create LoadEditField_3Label
            app.LoadEditField_3Label = uilabel(app.UDLTab);
            app.LoadEditField_3Label.HorizontalAlignment = 'right';
            app.LoadEditField_3Label.Position = [103 89 32 22];
            app.LoadEditField_3Label.Text = 'Load';

            % Create LoadEditField_3
            app.LoadEditField_3 = uieditfield(app.UDLTab, 'numeric');
            app.LoadEditField_3.Position = [150 89 100 22];

            % Create PositionEditField_3Label
            app.PositionEditField_3Label = uilabel(app.UDLTab);
            app.PositionEditField_3Label.HorizontalAlignment = 'right';
            app.PositionEditField_3Label.Position = [87 68 48 22];
            app.PositionEditField_3Label.Text = 'Position';

            % Create PositionEditField_3
            app.PositionEditField_3 = uieditfield(app.UDLTab, 'numeric');
            app.PositionEditField_3.Position = [150 68 100 22];

            % Create PlotButton_2
            app.PlotButton_2 = uibutton(app.UDLTab, 'push');
            app.PlotButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotButton_2Pushed, true);
            app.PlotButton_2.Position = [119 35 100 22];
            app.PlotButton_2.Text = 'Plot';

            % Create LengthEditField_7Label
            app.LengthEditField_7Label = uilabel(app.UDLTab);
            app.LengthEditField_7Label.HorizontalAlignment = 'right';
            app.LengthEditField_7Label.Position = [22 166 42 22];
            app.LengthEditField_7Label.Text = 'Length';

            % Create LengthEditField_7
            app.LengthEditField_7 = uieditfield(app.UDLTab, 'numeric');
            app.LengthEditField_7.Position = [74 166 37 22];

            % Create Support1EditField_2Label
            app.Support1EditField_2Label = uilabel(app.UDLTab);
            app.Support1EditField_2Label.HorizontalAlignment = 'right';
            app.Support1EditField_2Label.Position = [126 166 54 22];
            app.Support1EditField_2Label.Text = 'Support1';

            % Create Support1EditField_2
            app.Support1EditField_2 = uieditfield(app.UDLTab, 'numeric');
            app.Support1EditField_2.Position = [190 166 37 22];

            % Create Support2EditField_2Label
            app.Support2EditField_2Label = uilabel(app.UDLTab);
            app.Support2EditField_2Label.HorizontalAlignment = 'right';
            app.Support2EditField_2Label.Position = [241 166 54 22];
            app.Support2EditField_2Label.Text = 'Support2';

            % Create Support2EditField_2
            app.Support2EditField_2 = uieditfield(app.UDLTab, 'numeric');
            app.Support2EditField_2.Position = [305 166 37 22];

            % Create CLUDLTab
            app.CLUDLTab = uitab(app.TabGroup);
            app.CLUDLTab.Title = 'CL/UDL';

            % Create CLoadEditFieldLabel
            app.CLoadEditFieldLabel = uilabel(app.CLUDLTab);
            app.CLoadEditFieldLabel.HorizontalAlignment = 'right';
            app.CLoadEditFieldLabel.Position = [91 135 44 22];
            app.CLoadEditFieldLabel.Text = 'C.Load';

            % Create CLoadEditField
            app.CLoadEditField = uieditfield(app.CLUDLTab, 'numeric');
            app.CLoadEditField.Position = [150 135 100 22];

            % Create PositionEditField_4Label
            app.PositionEditField_4Label = uilabel(app.CLUDLTab);
            app.PositionEditField_4Label.HorizontalAlignment = 'right';
            app.PositionEditField_4Label.Position = [87 114 48 22];
            app.PositionEditField_4Label.Text = 'Position';

            % Create PositionEditField_4
            app.PositionEditField_4 = uieditfield(app.CLUDLTab, 'numeric');
            app.PositionEditField_4.Position = [150 114 100 22];

            % Create ULoadEditFieldLabel
            app.ULoadEditFieldLabel = uilabel(app.CLUDLTab);
            app.ULoadEditFieldLabel.HorizontalAlignment = 'right';
            app.ULoadEditFieldLabel.Position = [91 93 44 22];
            app.ULoadEditFieldLabel.Text = 'U.Load';

            % Create ULoadEditField
            app.ULoadEditField = uieditfield(app.CLUDLTab, 'numeric');
            app.ULoadEditField.Position = [150 93 100 22];

            % Create PositionEditField_5Label
            app.PositionEditField_5Label = uilabel(app.CLUDLTab);
            app.PositionEditField_5Label.HorizontalAlignment = 'right';
            app.PositionEditField_5Label.Position = [87 72 48 22];
            app.PositionEditField_5Label.Text = 'Position';

            % Create PositionEditField_5
            app.PositionEditField_5 = uieditfield(app.CLUDLTab, 'numeric');
            app.PositionEditField_5.Position = [150 72 100 22];

            % Create ULoadEditField_2Label
            app.ULoadEditField_2Label = uilabel(app.CLUDLTab);
            app.ULoadEditField_2Label.HorizontalAlignment = 'right';
            app.ULoadEditField_2Label.Position = [91 51 44 22];
            app.ULoadEditField_2Label.Text = 'U.Load';

            % Create ULoadEditField_2
            app.ULoadEditField_2 = uieditfield(app.CLUDLTab, 'numeric');
            app.ULoadEditField_2.Position = [150 51 100 22];

            % Create PositionEditField_6Label
            app.PositionEditField_6Label = uilabel(app.CLUDLTab);
            app.PositionEditField_6Label.HorizontalAlignment = 'right';
            app.PositionEditField_6Label.Position = [87 30 48 22];
            app.PositionEditField_6Label.Text = 'Position';

            % Create PositionEditField_6
            app.PositionEditField_6 = uieditfield(app.CLUDLTab, 'numeric');
            app.PositionEditField_6.Position = [150 30 100 22];

            % Create PlotButton_3
            app.PlotButton_3 = uibutton(app.CLUDLTab, 'push');
            app.PlotButton_3.ButtonPushedFcn = createCallbackFcn(app, @PlotButton_3Pushed, true);
            app.PlotButton_3.Position = [128 1 100 22];
            app.PlotButton_3.Text = 'Plot';

            % Create LengthEditField_8Label
            app.LengthEditField_8Label = uilabel(app.CLUDLTab);
            app.LengthEditField_8Label.HorizontalAlignment = 'right';
            app.LengthEditField_8Label.Position = [23 166 42 22];
            app.LengthEditField_8Label.Text = 'Length';

            % Create LengthEditField_8
            app.LengthEditField_8 = uieditfield(app.CLUDLTab, 'numeric');
            app.LengthEditField_8.Position = [75 166 37 22];

            % Create Support1EditField_3Label
            app.Support1EditField_3Label = uilabel(app.CLUDLTab);
            app.Support1EditField_3Label.HorizontalAlignment = 'right';
            app.Support1EditField_3Label.Position = [127 166 54 22];
            app.Support1EditField_3Label.Text = 'Support1';

            % Create Support1EditField_3
            app.Support1EditField_3 = uieditfield(app.CLUDLTab, 'numeric');
            app.Support1EditField_3.Position = [191 166 37 22];

            % Create Support2EditField_3Label
            app.Support2EditField_3Label = uilabel(app.CLUDLTab);
            app.Support2EditField_3Label.HorizontalAlignment = 'right';
            app.Support2EditField_3Label.Position = [242 166 54 22];
            app.Support2EditField_3Label.Text = 'Support2';

            % Create Support2EditField_3
            app.Support2EditField_3 = uieditfield(app.CLUDLTab, 'numeric');
            app.Support2EditField_3.Position = [306 166 37 22];

            % Create CLBMTab
            app.CLBMTab = uitab(app.TabGroup);
            app.CLBMTab.Title = 'CL/BM';

            % Create LoadEditField_4Label
            app.LoadEditField_4Label = uilabel(app.CLBMTab);
            app.LoadEditField_4Label.HorizontalAlignment = 'right';
            app.LoadEditField_4Label.Position = [97 134 32 22];
            app.LoadEditField_4Label.Text = 'Load';

            % Create LoadEditField_4
            app.LoadEditField_4 = uieditfield(app.CLBMTab, 'numeric');
            app.LoadEditField_4.Position = [144 134 100 22];

            % Create PositionEditField_7Label
            app.PositionEditField_7Label = uilabel(app.CLBMTab);
            app.PositionEditField_7Label.HorizontalAlignment = 'right';
            app.PositionEditField_7Label.Position = [81 113 48 22];
            app.PositionEditField_7Label.Text = 'Position';

            % Create PositionEditField_7
            app.PositionEditField_7 = uieditfield(app.CLBMTab, 'numeric');
            app.PositionEditField_7.Position = [144 113 100 22];

            % Create MomentEditFieldLabel
            app.MomentEditFieldLabel = uilabel(app.CLBMTab);
            app.MomentEditFieldLabel.HorizontalAlignment = 'right';
            app.MomentEditFieldLabel.Position = [80 92 49 22];
            app.MomentEditFieldLabel.Text = 'Moment';

            % Create MomentEditField
            app.MomentEditField = uieditfield(app.CLBMTab, 'numeric');
            app.MomentEditField.Position = [144 92 100 22];

            % Create PositionEditField_8Label
            app.PositionEditField_8Label = uilabel(app.CLBMTab);
            app.PositionEditField_8Label.HorizontalAlignment = 'right';
            app.PositionEditField_8Label.Position = [81 71 48 22];
            app.PositionEditField_8Label.Text = 'Position';

            % Create PositionEditField_8
            app.PositionEditField_8 = uieditfield(app.CLBMTab, 'numeric');
            app.PositionEditField_8.Position = [144 71 100 22];

            % Create PlotButton_4
            app.PlotButton_4 = uibutton(app.CLBMTab, 'push');
            app.PlotButton_4.ButtonPushedFcn = createCallbackFcn(app, @PlotButton_4Pushed, true);
            app.PlotButton_4.Position = [116 34 100 22];
            app.PlotButton_4.Text = 'Plot';

            % Create LengthEditField_9Label
            app.LengthEditField_9Label = uilabel(app.CLBMTab);
            app.LengthEditField_9Label.HorizontalAlignment = 'right';
            app.LengthEditField_9Label.Position = [17 166 42 22];
            app.LengthEditField_9Label.Text = 'Length';

            % Create LengthEditField_9
            app.LengthEditField_9 = uieditfield(app.CLBMTab, 'numeric');
            app.LengthEditField_9.Position = [69 166 37 22];

            % Create Support1EditField_4Label
            app.Support1EditField_4Label = uilabel(app.CLBMTab);
            app.Support1EditField_4Label.HorizontalAlignment = 'right';
            app.Support1EditField_4Label.Position = [121 166 54 22];
            app.Support1EditField_4Label.Text = 'Support1';

            % Create Support1EditField_4
            app.Support1EditField_4 = uieditfield(app.CLBMTab, 'numeric');
            app.Support1EditField_4.Position = [185 166 37 22];

            % Create Support2EditField_4Label
            app.Support2EditField_4Label = uilabel(app.CLBMTab);
            app.Support2EditField_4Label.HorizontalAlignment = 'right';
            app.Support2EditField_4Label.Position = [236 166 54 22];
            app.Support2EditField_4Label.Text = 'Support2';

            % Create Support2EditField_4
            app.Support2EditField_4 = uieditfield(app.CLBMTab, 'numeric');
            app.Support2EditField_4.Position = [300 166 37 22];

            % Create UDLBMTab
            app.UDLBMTab = uitab(app.TabGroup);
            app.UDLBMTab.Title = 'UDL/BM';

            % Create ULoadEditField_5Label
            app.ULoadEditField_5Label = uilabel(app.UDLBMTab);
            app.ULoadEditField_5Label.HorizontalAlignment = 'right';
            app.ULoadEditField_5Label.Position = [85 137 44 22];
            app.ULoadEditField_5Label.Text = 'U.Load';

            % Create ULoadEditField_5
            app.ULoadEditField_5 = uieditfield(app.UDLBMTab, 'numeric');
            app.ULoadEditField_5.Position = [144 137 100 22];

            % Create PositionEditField_9Label
            app.PositionEditField_9Label = uilabel(app.UDLBMTab);
            app.PositionEditField_9Label.HorizontalAlignment = 'right';
            app.PositionEditField_9Label.Position = [81 116 48 22];
            app.PositionEditField_9Label.Text = 'Position';

            % Create PositionEditField_9
            app.PositionEditField_9 = uieditfield(app.UDLBMTab, 'numeric');
            app.PositionEditField_9.Position = [144 116 100 22];

            % Create ULoadEditField_3Label
            app.ULoadEditField_3Label = uilabel(app.UDLBMTab);
            app.ULoadEditField_3Label.HorizontalAlignment = 'right';
            app.ULoadEditField_3Label.Position = [85 95 44 22];
            app.ULoadEditField_3Label.Text = 'U.Load';

            % Create ULoadEditField_3
            app.ULoadEditField_3 = uieditfield(app.UDLBMTab, 'numeric');
            app.ULoadEditField_3.Position = [144 95 100 22];

            % Create PositionEditField_10Label
            app.PositionEditField_10Label = uilabel(app.UDLBMTab);
            app.PositionEditField_10Label.HorizontalAlignment = 'right';
            app.PositionEditField_10Label.Position = [81 74 48 22];
            app.PositionEditField_10Label.Text = 'Position';

            % Create PositionEditField_10
            app.PositionEditField_10 = uieditfield(app.UDLBMTab, 'numeric');
            app.PositionEditField_10.Position = [144 74 100 22];

            % Create MomentEditField_2Label
            app.MomentEditField_2Label = uilabel(app.UDLBMTab);
            app.MomentEditField_2Label.HorizontalAlignment = 'right';
            app.MomentEditField_2Label.Position = [80 53 49 22];
            app.MomentEditField_2Label.Text = 'Moment';

            % Create MomentEditField_2
            app.MomentEditField_2 = uieditfield(app.UDLBMTab, 'numeric');
            app.MomentEditField_2.Position = [144 53 100 22];

            % Create PositionEditField_11Label
            app.PositionEditField_11Label = uilabel(app.UDLBMTab);
            app.PositionEditField_11Label.HorizontalAlignment = 'right';
            app.PositionEditField_11Label.Position = [81 32 48 22];
            app.PositionEditField_11Label.Text = 'Position';

            % Create PositionEditField_11
            app.PositionEditField_11 = uieditfield(app.UDLBMTab, 'numeric');
            app.PositionEditField_11.Position = [144 32 100 22];

            % Create PlotButton_5
            app.PlotButton_5 = uibutton(app.UDLBMTab, 'push');
            app.PlotButton_5.ButtonPushedFcn = createCallbackFcn(app, @PlotButton_5Pushed, true);
            app.PlotButton_5.Position = [126 0 100 22];
            app.PlotButton_5.Text = 'Plot';

            % Create LengthEditField_10Label
            app.LengthEditField_10Label = uilabel(app.UDLBMTab);
            app.LengthEditField_10Label.HorizontalAlignment = 'right';
            app.LengthEditField_10Label.Position = [21 169 42 22];
            app.LengthEditField_10Label.Text = 'Length';

            % Create LengthEditField_10
            app.LengthEditField_10 = uieditfield(app.UDLBMTab, 'numeric');
            app.LengthEditField_10.Position = [73 169 37 22];

            % Create Support1EditField_5Label
            app.Support1EditField_5Label = uilabel(app.UDLBMTab);
            app.Support1EditField_5Label.HorizontalAlignment = 'right';
            app.Support1EditField_5Label.Position = [125 169 54 22];
            app.Support1EditField_5Label.Text = 'Support1';

            % Create Support1EditField_5
            app.Support1EditField_5 = uieditfield(app.UDLBMTab, 'numeric');
            app.Support1EditField_5.Position = [189 169 37 22];

            % Create Support2EditField_5Label
            app.Support2EditField_5Label = uilabel(app.UDLBMTab);
            app.Support2EditField_5Label.HorizontalAlignment = 'right';
            app.Support2EditField_5Label.Position = [240 169 54 22];
            app.Support2EditField_5Label.Text = 'Support2';

            % Create Support2EditField_5
            app.Support2EditField_5 = uieditfield(app.UDLBMTab, 'numeric');
            app.Support2EditField_5.Position = [304 169 37 22];

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;
            app.RightPanel.Scrollable = 'on';

            % Create Label
            app.Label = uilabel(app.RightPanel);
            app.Label.Position = [7 90 213 89];
            app.Label.Text = {'ME212 Assignment 2019-20 (Group 4)'; 'Members:'; 'Shubham Raj'; 'Anubhav Rishikesh'; 'Sanjib Mehdi'; 'Piyush Kulkarni'};

            % Show the figure after all components are created
            app.MortgageCalculatorUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Mortgage

            % Create UIFigure and components
            createComponents(app)0

            % Register the app with App Designer
            registerApp(app, app.MortgageCalculatorUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.MortgageCalculatorUIFigure)
        end
    end
end