#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/syscall.h>
int primes_count; 
void *primesthreadFunction(void *args){

	int n = (int)(long)args;
	printf("n is %d\n",n );
	int is_prime=1; //number is prime
	
	if(n!=1 || n!=2){

		for(int i=2; i<n/2; i++){
			if(n%i == 0){ // check it i is a factor of n
				is_prime=0; //number is not prime
				break;
			}

		}
	}

	if(is_prime==1){
		primes_count++;
		printf("%d is prime \n", n);
	}else{
		printf("%d is not prime \n", n);
	}
	
	pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
	int n_threads =5;

	pthread_t prime_threads[n_threads];
	int returnCode;

	//Create n threads and let them calculate primes
	for(int t=1; t<n_threads;t++){
		printf("t is %d\n",t );
		returnCode = pthread_create(&prime_threads[t], NULL, 
			primesthreadFunction, (void *)(long)t);
		//Check that pthread has been created
		if(returnCode){
			printf("ERROR return code form pthread_create() : %d\n", returnCode);
			exit(-1);
		}else{
			printf("created\n");
		}
	}
	//Wait for sll threads to exit
	for(int t=0; t<=n_threads; t++){
		pthread_join(prime_threads[t], NULL);
	}

	printf("Successfully exited all threads!\n");
	printf("Number of primes between 1 and %d = %d\n", n_threads, primes_count );
	return 0;

}