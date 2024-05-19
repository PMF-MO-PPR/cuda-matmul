/*
   Kernel koji množi dvije kvadratne matrice. Matrice su dinamički alocirane i
   zadane su po recima. 
    C = A B
    Matrice su kvadratne dimenzije,  N x N. 
    Verzija s optimizacijom dohvata iz memorije (blok algoritam)
    i dimenzijom matrice koja ne mora biti djeljiva s dimenzijom bloka. 
*/


__global__
void matMulKernel(float * A, float * B, float * C, int N)
{
    // VAŠ KOD
}

void error_h(cudaError_t error, const char * file, int line){
     if(error != cudaSuccess){
         std::cerr << cudaGetErrorString(error) << " at file " << file << " in line " << line << "\n";
         std::exit(EXIT_FAILURE);
     }
}

__host__
bool checkResult(float * A, float * B, float * C, int N){
    float EPS = 1E-6f;
    bool res = true;
    float max_error = 0.0f;
    float max_value = 0.0f;
    for(int i=0; i<N; ++i)
    {
        for(int j=0; j<N; ++j)
        {
	       float tmp = 0.0;
           for(int k=0; k<N; ++k)
		       tmp += A[i*N+k] * B[k*N+j];

	       float diff = fabs(tmp - C[i*N+j]);
	       float val  = fabs(tmp);
	       if(diff > max_error) max_error = diff;
	       if(val  > max_value) max_value = val;  
	    } // for po j
    } // for po i

    
    if(max_error > EPS*max_value){
        std::cout << "(Max error = " << max_error << ", max value = " << max_value 
                  << ", relative error = " <<  max_error/max_value << ")";
        res = false;
    }
    return res;
}


int main()
{
    // VAŠ KOD   
    return 0;
}

