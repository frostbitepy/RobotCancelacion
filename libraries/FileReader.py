

class FileReader:

    def read_txt(self, file_name):
        with open(file_name) as f:
            return f.readline()