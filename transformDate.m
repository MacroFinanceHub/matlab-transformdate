function dateOut = transformDate(dateIn, varargin)
%TRANSFORMDATE converts any MATLAB dates to a specified format
%
% TRANSFORMDATE takes a dateIn with a formatIn (can be specified or can
% allow the function to classify it), transforms it to a datenum, and then
% transforms that to a dateOut with formatOut (or defaults to 'dd-mmm-yyyy').
%
% INPUTS:
%   dateIn      ~ char/double/datetime, the date being converted
%   formatIn    ~ char, the format of the date coming in
%   formatOut   ~ char, the format of the date going out
%
% OUPTUTS:
%   dateOut     ~ char/double/datetime, the outgoing date
%
% USAGE
%   >> x = transformDate(737426); % return dd-mmm-yyyy
%   >> x = transformDate('01-Jan-2019', ...
%       'formatOut', 'datetime'); % return datetime
%   >> x = transformDate('01/01/2019', ...
%       'formatIn', 'mm/dd/yyyy', ...
%       'formatOut', 'yyyy/mm-dd'); % return yyyy/mm-dd
%
% Santiago I. Sordo-Palacios, 2019

% Check that the class of dateIn is valid
classDateIn = class(dateIn);
supportedClasses = {'char', 'double', 'datetime'};
assert(ismember(classDateIn, supportedClasses), ...
    'transformDate:badClass', ...
    'Class "%s" not supported in transformDate', classDateIn);

% Parse the inputs
inP = inputParser;
inP.addParameter('formatIn', classDateIn, @ischar);
defaultFormatOut = 'dd-mmm-yyyy';
inP.addParameter('formatOut', defaultFormatOut, @ischar);
inP.parse(varargin{:})

% Set the variables
formatIn = inP.Results.formatIn;
formatOut = inP.Results.formatOut;

% Convert incoming date to datenum
switch formatIn
    case {'double', 'datenum'}
        % Handle the numeric case
        assert(strcmp('double', class(dateIn)), ...
            'transformDate:notDouble', ...
            '"%s" is not a double but specified as such', dateIn)
        dateAsNum = dateIn;
    case 'datetime'
        % Handle the datetime case
        assert(strcmp('datetime', class(dateIn)), ...
            'transformDate:notDatetime', ...
            '"%s" is not a datetime but specified as such', dateIn);
        dateAsNum = datenum(dateIn);
    case {'char', 'datestr'}
        % Handle the character case
        assert(strcmp('char', class(dateIn)), ...
            'transformDate:notChar', ...
            '"%s" is not a char but specified as such', dateIn);
        dateAsNum = datenum(dateIn);
    otherwise
        dateAsNum = datenum(dateIn, formatIn);
end % switch-case

% Convert datenum to outgoing date
switch formatOut
    case {'double', 'datenum'}
        dateOut = dateAsNum;
    case 'datetime'
        dateOut = datetime(dateAsNum, 'ConvertFrom', 'datenum');
    case {'char', 'datestr'}
        dateOut = datestr(dateAsNum);
    otherwise
        dateOut = datestr(dateAsNum, formatOut);
end % switch-case

end % function-transformDate

