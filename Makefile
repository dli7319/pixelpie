CUDA_INSTALL_PATH="/usr/local/cuda/targets/x86_64-linux"
CXXFLAGS = -Wall -g -O2 -I $(CUDA_INSTALL_PATH)/include/ -I .
NVCCFLAGS = -g -O2 -I $(CUDA_INSTALL_PATH)/include/ -I .
LDFLAGS = -L $(CUDA_INSTALL_PATH)/lib64
LIBS = -lGL -lGLEW -lglfw -lcudart

OBJECTS = lodepng.o  main.o  PoissonDiskSampler.o cudaThrustOGL.o


uniformpixelpie: $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJECTS) $(LDFLAGS) $(LIBS)

%.o: %.cu
	nvcc $(NVCCFLAGS) -c $<

clean:
	rm *.o
