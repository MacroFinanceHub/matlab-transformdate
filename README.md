# MATLAB transformDate

A function to convert any MATLAB date to/from a specified format

## Installation

From GitBash, clone this project

```bash
git clone git@github.com:ssordopalacios/matlab-transformdate.git
```

From MATLAB, add it to your path

```matlab
addpath('matlab-transformdate');
```

## Usage

Return a defualt `dd-mmm-yyyy` date from an automatically detected `datenum`

```matlab
transformDate(737426)
```

Return a specified `datetime` from an automatically detected `dd-mmm-yyyy`

```matlab
transformDate('01-Jan-2019', 'formatOut', 'datetime')
```

Return a specified `yyyy/mm-dd` from a specified `mm/dd/yyyy`

```matlab
transformDate('01/01/2019', 'formatIn', 'mm/dd/yyyy', 'formatOut', 'yyyy/mm-dd')
```

## Contributing

Open an issue via the [GitHub page](https://github.com/ssordopalacios/matlab-transformdate)

Run the testing suite from MATLAB

```matlab
runtests('test_transformDate');
```

## Authors

* Santiago I. Sordo Palacios, 2019
