from vim import *
from tables import *

def rangeToHTMLTable():
    """
        A Vim function to convert a range into an html table
    """
    range = current.range
    csv = toCSV(range)
    table = htmlTableOut(csv)
    range[:] = table.split('\n')

def rangeToHTMLList():
    """
        A Vim function to convert a range into an html table
    """
    range = current.range
    csv = toCSV(range)
    table = htmlListOut(csv)
    range[:] = table.split('\n')

def rangeToASCII():
    """
        A Vim function to convert a range into an ASCII table
    """
    range = current.range
    csv = toCSV(range)
    table = asciiOut(csv,1)
    range[:] = table.split('\n')
