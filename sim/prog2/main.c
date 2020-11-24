#include <stdio.h>
int main(){

    extern short _test_start;
    //extern short _test_start [];
    FILE *fp = fopen("./image.bmp","rb");
    char *buffer;
    long filelen;
    char grayscale=0;

    fseek(fp,0,SEEK_END);
    filelen = ftell(fp);
    rewind(fp);

    buffer = (char*)malloc(filelen * sizeof(char));
    
    
    //size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream)
    fread(buffer,filelen,1,fp); 

    for(int i = 54 ; i < filelen ; i += 3){
        grayscale = buffer[i]*0.11+buffer[i+1]*0.59+buffer[i+2]*0.3;
        buffer[i] = grayscale;
        buffer[i+1] = grayscale;
        buffer[i+2] = grayscale;
    }
    
    for(int i = 0 ; i < filelen ; i++){
        *(&_test_start + i) = buffer[i];
        //_test_start[i] = buffer[i];
    }

    fclose(fp);
    return 0;
}