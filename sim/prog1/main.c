int main(void) {

    extern int array_size;
    extern short array_addr[];
    extern short _test_start;
    short temp;
    
    /*    if(array_addr[0] > array_addr[1]){
                temp = array_addr[0];
                array_addr[0] = array_addr[1];
                array_addr[1] = temp;
            }
            if(array_addr[0] > array_addr[2]){
                temp = array_addr[0];
                array_addr[0] = array_addr[2];
                array_addr[2] = temp;
            }
            if(array_addr[0] > array_addr[3]){
                temp = array_addr[0];
                array_addr[0] = array_addr[3];
                array_addr[3] = temp;
            }
            if(array_addr[0] > array_addr[4]){
                temp = array_addr[0];
                array_addr[0] = array_addr[4];
                array_addr[4] = temp;
            }*/
            
    for(int i = 0; i < array_size; i++) {
         for(int j = 0; j < array_size-1; j++) {
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
    //*(&_test_start + 1) = array_addr[1];

    return 0;
}

// int main(){
//     extern const short  array_size;
//     extern const short  array_addr;
//     extern short _test_start;
//     short sort_array[0x80];
//     //short tmp;
//     // sort_array[0] = *(&array_addr + 0);
//     //  *(&_test_start + 0) = sort_array[0];
//     //  sort_array[1] = *(&array_addr + 1);
//     //  *(&_test_start + 1) = sort_array[1];
//     //sort_array[1] = *(&array_addr + 1);
//     // ============ Initial =========================
//       for(int i = 0; i < 0x80; i++){
//          sort_array[i] = *(&array_addr + i); 
//       }
    


//     //============= Bubble sort ==================== 
//     // for(int i = 0; i < 0x80 -1; i++){
//     //     for(int j = 0; j < 0x80 -1 -i; j++){
//     //         if(sort_array[j] > sort_array[j+1]){
//     //             tmp = sort_array[j];
//     //             sort_array[j] = sort_array[j+1];
//     //             sort_array[j+1] = tmp;
//     //         }
//     //     }
//     // }

//     // ============= Output =========================
//     *(&_test_start + 1) = sort_array[1];
//     for( int i = 0; i < 0x80; i++){
//         *(&_test_start + i) = sort_array[i];
//     }

    
    
//     return 0; 
// }