#!/bin/bash
set -x

# Set the number of parallel processes
parallel_processes=5

# Define the function to be executed in parallel
process_item() {
    item=$1
    echo "Processing item: $item"
    # Add your actual processing logic here
    ./nr-ue -c config/$item
    echo "Completed processing item: $item"
}

# Export the function to make it available to parallel
export -f process_item

# Generate a list of item names
item_names=("uecfg1.yaml" "uecfg2.yaml" "uecfg3.yaml" "uecfg4.yaml" "uecfg5.yaml")

# Run the parallel command
parallel --jobs $parallel_processes process_item ::: "${item_names[@]}"
