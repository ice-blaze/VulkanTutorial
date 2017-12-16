VULKAN_SDK_PATH = /home/etienne/Downloads/VulkanSDK/1.0.61.1/x86_64
STB_INCLUDE_PATH = /home/etienne/Downloads/stb
TINYOBJ_INCLUDE_PATH = ./

CFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include -I$(STB_INCLUDE_PATH) -I$(TINYOBJ_INCLUDE_PATH)
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan -DNBDEBUG=1

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest.so main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./VulkanTest.so

clean:
	rm -f VulkanTest.so
