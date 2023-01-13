# act-bench
Activation function benchmark datasets `Act-Bench-CNN`, `Act-Bench-ResNet`, and `Act-Bench-ViT`

---

## Getting Started

Clone the repository and download the datasets.

```bash
git clone https://github.com/cognizant-ai-labs/act-bench.git
cd act-bench
bash download-datasets.sh
```

In total, the datasets are about 381 MB in size.

---

## Loading the Datasets

Load the datasets with the `json` module.

```python
import json

with open('datasets/act-bench-cnn.json', 'r') as f:
    act_bench_cnn = json.load(f)

with open('datasets/act-bench-resnet.json', 'r') as f:
    act_bench_resnet = json.load(f)

with open('datasets/act-bench-vit.json', 'r') as f:
    act_bench_vit = json.load(f)
```

---

## Exploring the Datasets

Each dataset is a dictionary, where the keys are activation function names and the values are themselves dictionaries containing information about that activation function.  For example:

```python
>>> for k, v in act_bench_cnn.items():
...   print(k)
...   print(v.keys())
...   break
... 
min(square(x),selu(x))
dict_keys(['Train Accuracy', 'Validation Accuracy', 'Train Loss', 'Validation Loss', 'Test Accuracy', 'Test Loss', 'Equivalent Activation Functions', 'Fisher log eigenvalue CDF', 'Runtime (s)'])
>>> 
```

The train, validation, and test accuracies and losses are the median of three independent runs for `Act-Bench-CNN` and `Act-Bench-ResNet`, and the result of a single run for `Act-Bench-ViT`.  The same is true of the runtime, which is reported in seconds.  

If desired, the activation function name can be used to instantiate the activation function as a TensorFlow `Layer` using the `ActivationFunction` class in the `aquasurf` package at https://github.com/cognizant-ai-labs/aquasurf.

The `Equivalent Activation Functions` key contains a list of activation function names that are functionally equivalent to the activation function.  For example, `'min(selu(x),square(x))'` is equivalent to `'min(square(x),selu(x))'`.

Finally, `Fisher log eigenvalue CDF` contains a feature vector encoding the CDF of the log-scaled eigenvalues of the Fisher Information Matrix associated with the weights at each layer of the network.
