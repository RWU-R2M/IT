# Install Python

To use the Python based ODrive tool, Python needs to be installed on your machine. Like recommended by ODrive, this guide sticks to Python version 3.8.6 to ensure full compatibility. You can download this specific version of Python [here](https://www.python.org/downloads/release/python-386/).

> [!WARNING] 
As of 2024-10-07, 3.8 has reached the end-of-life phase of its release cycle. 3.8.20 was the final security release. The codebase for 3.8 is now frozen and no further updates will be provided nor issues of any kind will be accepted on the bug tracker. [(Source)](https://peps.python.org/pep-0569/). This version shall thereby not be used for any other developing purpose, stick to active versions instead. 

After downloading your installer, open it and make sure to add Python's path to your environmental variables.

To download the ODrive tool, open a command prompt and execute the following two commands:

```shell
pip install matplotlib
```
```shell
pip install --upgrade odrive
```
