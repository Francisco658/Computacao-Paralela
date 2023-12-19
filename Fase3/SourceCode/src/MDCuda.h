#include <stdio.h>
#include <cstdlib>
#include <iostream>
#include <sys/time.h>
#include <cuda.h>
#include <chrono>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include<cuda.h>

using namespace std;

void checkCUDAError (const char *msg) {
	cudaError_t err = cudaGetLastError();
	if( cudaSuccess != err) {
		cerr << "Cuda error: " << msg << ", " << cudaGetErrorString( err) << endl;
		exit(-1);
	}
}