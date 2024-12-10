CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

TARGET = $(BUILD_DIR)/app
BUILD_DIR = build
INCLUDE_DIR = include

SOURCES = src/lib.cpp app/main.cpp

# Change OBJECTS to generate .o files directly in $(BUILD_DIR)
OBJECTS = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(SOURCES)) # generates subdirectories in build

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)/

# Ensure all necessary directories exist
$(BUILD_DIR)/%.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -I $(BUILD_DIR) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -I $(INCLUDE_DIR) -o $@ $^

all: $(TARGET)

clean:
	rm -rf $(BUILD_DIR)
	@echo "Build directory cleaned up!"
