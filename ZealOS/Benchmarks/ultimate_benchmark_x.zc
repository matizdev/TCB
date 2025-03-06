#include "DAdam.h"

// Constants for scoring
#define MAX_DISK_SCORE 100
#define MAX_RAM_SCORE 100
#define MAX_CPU_SCORE 100
#define BASELINE_DISK_SPEED 50.0  // Baseline disk speed in MB/s
#define BASELINE_RAM_SPEED 5000.0 // Baseline RAM speed in MB/s
#define BASELINE_CPU_MOPS 1000.0  // Baseline CPU integer speed in MOPS
#define BASELINE_CPU_MFLOPS 500.0 // Baseline CPU floating-point speed in MFLOPS

// Disk Benchmark
F64 DiskBenchmark() {
    U8 *buffer;
    U64 size = 1024 * 1024 * 100; // 100 MB
    U64 start, end;
    F64 write_speed, read_speed, avg_speed;

    // Allocate buffer
    buffer = MAlloc(size);
    if (!buffer) {
        "Failed to allocate memory for disk benchmark.\n";
        return 0;
    }

    // Write benchmark
    start = GetTime();
    if (!DFileWrite("C:\\BenchmarkFile.bin", buffer, size)) {
        "Failed to write file.\n";
        MFree(buffer);
        return 0;
    }
    end = GetTime();
    write_speed = (size / (1024.0 * 1024.0)) / ((end - start) / 1000.0);

    // Read benchmark
    start = GetTime();
    if (!DFileRead("C:\\BenchmarkFile.bin", buffer, size)) {
        "Failed to read file.\n";
        MFree(buffer);
        return 0;
    }
    end = GetTime();
    read_speed = (size / (1024.0 * 1024.0)) / ((end - start) / 1000.0);

    // Calculate average speed
    avg_speed = (write_speed + read_speed) / 2.0;
    "Disk Write Speed: %.2f MB/s\n", write_speed;
    "Disk Read Speed: %.2f MB/s\n", read_speed;
    "Average Disk Speed: %.2f MB/s\n", avg_speed;

    // Clean up
    MFree(buffer);
    DFileDelete("C:\\BenchmarkFile.bin");

    // Calculate disk score
    return (avg_speed / BASELINE_DISK_SPEED) * MAX_DISK_SCORE;
}

// RAM Benchmark
F64 RAMBenchmark() {
    U8 *buffer;
    U64 size = 1024 * 1024 * 100; // 100 MB
    U64 start, end;
    F64 write_speed, read_speed, avg_speed;

    // Allocate buffer
    buffer = MAlloc(size);
    if (!buffer) {
        "Failed to allocate memory for RAM benchmark.\n";
        return 0;
    }

    // Write benchmark
    start = GetTime();
    MemSet(buffer, 0xFF, size);
    end = GetTime();
    write_speed = (size / (1024.0 * 1024.0)) / ((end - start) / 1000.0);

    // Read benchmark
    start = GetTime();
    MemCmp(buffer, buffer, size);
    end = GetTime();
    read_speed = (size / (1024.0 * 1024.0)) / ((end - start) / 1000.0);

    // Calculate average speed
    avg_speed = (write_speed + read_speed) / 2.0;
    "RAM Write Speed: %.2f MB/s\n", write_speed;
    "RAM Read Speed: %.2f MB/s\n", read_speed;
    "Average RAM Speed: %.2f MB/s\n", avg_speed;

    // Clean up
    MFree(buffer);

    // Calculate RAM score
    return (avg_speed / BASELINE_RAM_SPEED) * MAX_RAM_SCORE;
}

// CPU Benchmark
F64 CPUBenchmark() {
    U64 i, j;
    U64 start, end;
    F64 elapsed_time;
    U64 iterations = 100000000; // 100 million iterations
    F64 int_speed, float_speed, avg_speed;

    // Integer arithmetic benchmark
    start = GetTime();
    for (i = 0; i < iterations; i++) {
        j = i * i;
    }
    end = GetTime();
    elapsed_time = (end - start) / 1000.0;
    int_speed = iterations / (elapsed_time * 1000000.0);
    "Integer Arithmetic Speed: %.2f MOPS\n", int_speed;

    // Floating-point arithmetic benchmark
    F64 f;
    start = GetTime();
    for (i = 0; i < iterations; i++) {
        f = i * 3.14159265358979323846;
    }
    end = GetTime();
    elapsed_time = (end - start) / 1000.0;
    float_speed = iterations / (elapsed_time * 1000000.0);
    "Floating-Point Arithmetic Speed: %.2f MFLOPS\n", float_speed;

    // Calculate average speed
    avg_speed = (int_speed + float_speed) / 2.0;

    // Calculate CPU score
    return (avg_speed / ((BASELINE_CPU_MOPS + BASELINE_CPU_MFLOPS) / 2.0)) * MAX_CPU_SCORE;
}

// Main function
U0 Main() {
    F64 disk_score, ram_score, cpu_score, total_score;

    "Starting Disk Benchmark...\n";
    disk_score = DiskBenchmark();
    "Disk Score: %.2f/%.2f\n", disk_score, MAX_DISK_SCORE;

    "Starting RAM Benchmark...\n";
    ram_score = RAMBenchmark();
    "RAM Score: %.2f/%.2f\n", ram_score, MAX_RAM_SCORE;

    "Starting CPU Benchmark...\n";
    cpu_score = CPUBenchmark();
    "CPU Score: %.2f/%.2f\n", cpu_score, MAX_CPU_SCORE;

    // Calculate total score
    total_score = (disk_score + ram_score + cpu_score) / 3.0;
    "Overall Benchmark Score: %.2f/%.2f\n", total_score, (MAX_DISK_SCORE + MAX_RAM_SCORE + MAX_CPU_SCORE) / 3.0;
}
