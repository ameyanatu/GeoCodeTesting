import csv
def read_csv_file(filename):
    data = []
    with open(filename, 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            data.append(row)
    return data

def should_contain_one_of_these_substrings(value, *substrings):
    if not any(substring in value for substring in substrings):
        raise AssertionError("'%s' does not contain one of: %s" % (value, substrings))
