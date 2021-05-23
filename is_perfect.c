#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

int perfect_count;
void *perfectthreadFunction(void *args){

	int n = (int)(long)args;
	int sum;
	
		for(int i=1; i<n; i++){
			if(n%i == 0){ // check it i is a factor of n
				sum += i; // add the factor to sum
			}

		}



	if(sum==n){
		perfect_count++;
		printf("%d is a perfect number \n", n);
	}else{
		printf("%d is not perfect number \n", n);
	}
	
	pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
	int n_threads =10;

	pthread_t prime_threads[n_threads];
	int returnCode;

	//Create n threads and let them calculate primes
	for(int t=1; t<=n_threads;t++){
		returnCode = pthread_create(&prime_threads[t], NULL, 
			perfectthreadFunction, (void *)(long)t);
		//Check that pthread has been created
		if(returnCode){
			printf("ERROR return code form pthread_create() : %d\n", returnCode);
			exit(-1);
		}
	}
	//Wait for sll threads to exit
	for(int t=0; t<=n_threads; t++){
		pthread_join(prime_threads[t], NULL);
	}

	printf("Successfully exited all threads!\n");
	printf("Number of perfect numbers between 1 and %d = %d\n", n_threads, perfect_count );
	return 0;

}