#include <stdlib.h>
#include <stdio.h>
void insertionSort(int array[], int length)
{
    for (int i = 1; i < length; i++)
    {
        int current = array[i];
        int j = i - 1;
        while (j >= 0 && array[j] > current)
        {
            array[j + 1] = array[j];
            j--;
        }
        printf("%d\n", j + 1);
        array[j + 1] = current;
    }
}
int main()
{
    int array[5];
    for (int i = 0; i < 5; i++)
    {
        scanf("%d", &array[i]);
    }

    insertionSort(array, 5);

    for (int i = 0; i < 5; i++)
    {
        printf("%d\n", array[i]);
    }
    
    return 0;
}