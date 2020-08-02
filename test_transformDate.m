classdef test_transformDate < matlab.unittest.TestCase
    %test_transformDate is the testing suite for transformDate
    %
    % USAGE:
    %   >> runtests('test_transformDate')
    %
    % Santiago I. Sordo Palacios, 2019

    properties
        datenumDate = 737426; % 01-Jan-2019
        expectedDate
        datestrDate
        datetimeDate
        expectedFmt = 'dd-mmm-yyyy';
        datestrFmt = 'mm/dd/yyyy';
        datestrInvalid = 'INVALID';
    end % properties

    methods (TestClassSetup)
        function setupOnce(tc)
            tc.datetimeDate = datetime(tc.datenumDate, 'ConvertFrom', 'datenum');
            tc.expectedDate = datestr(tc.datenumDate, tc.expectedFmt);
            tc.datestrDate = datestr(tc.datenumDate, tc.datestrFmt);
        end % function
    end % methods

    methods (Test)

        function badClassIn(tc)
            expectedErr = 'transformDate:badClass';
            actualErr = @() transformDate({});
            tc.verifyError(actualErr, expectedErr);
        end % function

        %------------------------------------------------------------------
        function doubleImplicitIn(tc)
            actualDate = transformDate(tc.datenumDate);
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datetimeImplicitIn(tc)
            actualDate = transformDate(tc.datetimeDate);
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function charImplicitIn(tc)
            actualDate = transformDate(tc.datestrDate);
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        %------------------------------------------------------------------
        function doubleExplicitIn(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatIn', 'double');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datenumExplicitIn(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatIn', 'datenum');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datetimeExplicitIn(tc)
            actualDate = transformDate(tc.datetimeDate, ...
                'formatIn', 'datetime');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function charExplicitIn(tc)
            actualDate = transformDate(tc.datestrDate, ...
                'formatIn', 'char');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datestrExplicitIn(tc)
            actualDate = transformDate(tc.datestrDate, ...
                'formatIn', 'datestr');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datestrFmtIn(tc)
            actualDate = transformDate(tc.datestrDate, ...
                'formatIn', tc.datestrFmt);
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        %------------------------------------------------------------------
        function notDouble(tc)
            expectedErr = 'transformDate:notDouble';
            actualErr = @() transformDate(tc.expectedDate, ...
                'formatIn', 'double');
            tc.verifyError(actualErr, expectedErr);
        end % function

        function notDatenum(tc)
            expectedErr = 'transformDate:notDouble';
            actualErr = @() transformDate(tc.expectedDate, ...
                'formatIn', 'double');
            tc.verifyError(actualErr, expectedErr);
        end % function

        function notDatetime(tc)
            expectedErr = 'transformDate:notDatetime';
            actualErr = @() transformDate(tc.datenumDate, ...
                'formatIn', 'datetime');
            tc.verifyError(actualErr, expectedErr);
        end % function

        function notChar(tc)
            expectedErr = 'transformDate:notChar';
            actualErr = @() transformDate(tc.datenumDate, ...
                'formatIn', 'char');
            tc.verifyError(actualErr, expectedErr);
        end % function

        function notDatestr(tc)
            expectedErr = 'transformDate:notChar';
            actualErr = @() transformDate(tc.datenumDate, ...
                'formatIn', 'datestr');
            tc.verifyError(actualErr, expectedErr);
        end % function

        function invalidDatestrImplicitIn(tc)
            expectedErr = 'MATLAB:datenum:ConvertDateString';
            actualErr = @() transformDate(tc.datestrInvalid);
            tc.verifyError(actualErr, expectedErr);
        end % function

        function invalidDatestrExplicitIn(tc)
            expectedErr = 'MATLAB:datenum:ConvertDateString';
            actualErr = @() transformDate(tc.datestrInvalid, ...
                'formatIn', tc.expectedFmt);
            tc.verifyError(actualErr, expectedErr);
        end % function

        %------------------------------------------------------------------
        function doubleOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', 'double');
            tc.verifyEqual(actualDate, tc.datenumDate);
        end % function

        function datenumOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', 'datenum');
            tc.verifyEqual(actualDate, tc.datenumDate);
        end % function

        function datetimeOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', 'datetime');
            tc.verifyEqual(actualDate, tc.datetimeDate);
        end % function

        function charOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', 'char');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datestrOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', 'datestr');
            tc.verifyEqual(actualDate, tc.expectedDate);
        end % function

        function datestrFmtOut(tc)
            actualDate = transformDate(tc.datenumDate, ...
                'formatOut', tc.datestrFmt);
            tc.verifyEqual(actualDate, tc.datestrDate);
        end % function

    end % methods-test
end % classdef
