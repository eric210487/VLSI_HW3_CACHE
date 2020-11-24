int main(void) {

    extern short array_size;
    extern short array_addr[];
    extern short _test_start;
    short temp;

    for(int i = 0; i < array_size; i++) {
        for(int j = 0; j < array_size - 1; j++) {
            if(array_addr[j] > array_addr[j+1]){
                temp = array_addr[j];
                array_addr[j] = array_addr[j+1];
                array_addr[j+1] = temp;
            }
        }
    }

    for(int i = 0; i < array_size; i++) {
        *(&_test_start + i) = array_addr[i];
    }

    return 0;
}