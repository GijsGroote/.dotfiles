import sys



class TestClass():

    def __init__(self, *args, **kwargs):
        self.number = 1
        print(f'initialise with some args maypbe {args}, kwargs? {kwargs}')
        

    def add(self, a, b):
        ''' Open dialog to edit the settings. '''
        return a + b

    def subtract(self, a, b):
        ''' Open the search job dialog. '''
        print('subtarcting')
        a = 5

        return a - b

if __name__ == '__main__':
    test = TestClass(sys.argv)
    test.add(1, 2)
    x = 15
    print(test.subtract(1, 2))




