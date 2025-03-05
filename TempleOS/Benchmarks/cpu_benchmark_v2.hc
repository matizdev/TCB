#include "HolyC.h"

U0 CpuBenchmark() {
    U64 start_time, end_time, elapsed_time;
    U64 i, iterations = 1000000000; // 1 billion iterations
    U64 dummy = 0; // Dummy variable to prevent optimization
    F64 score; // Performance score

    // Get the starting time using inline assembly (optional)
    start_time = Rdtsc(); // Read Time Stamp Counter

    // Perform a large number of integer operations
    for (i = 0; i < iterations; i++) {
        dummy += i * 2 - i / 2; // Arbitrary math operations
    }

    // Get the ending time
    end_time = Rdtsc();

    // Calculate elapsed time
    elapsed_time = end_time - start_time;

    // Calculate the score (iterations per tick)
    score = (F64)iterations / (F64)elapsed_time;

    // Print the results
    "CPU Benchmark Results:\n";
    "Iterations: %lu\n", iterations;
    "Elapsed Time: %lu CPU cycles\n", elapsed_time;
    "Performance Score: %.2f iterations/cycle\n", score;
    "Dummy Value: %lu (to prevent optimization)\n", dummy;
}

U0 Main() {
    CpuBenchmark();
}
