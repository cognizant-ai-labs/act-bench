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

In total, the datasets are about 408 MB in size.

---

## Loading the Datasets

To load the datasets, unpickle them using the `dill` module.

```python
import dill as pickle

with open('datasets/act-bench-cnn.pkl', 'rb') as f:
    act_bench_cnn = pickle.load(f)

with open('datasets/act-bench-resnet.pkl', 'rb') as f:
    act_bench_resnet = pickle.load(f)

with open('datasets/act-bench-vit.pkl', 'rb') as f:
    act_bench_vit = pickle.load(f)
```

---

## Exploring the Datasets

Each dataset is a dictionary.  Each key is a tuple of functionally equivalent activation functions.  For example:

```python
>>> for k in act_bench_cnn.keys():
...   print(k)
...   break
... 
('min(selu(x),square(x))', 'min(square(x),selu(x))')
```

The activation functions `'min(selu(x),square(x))'` and `'min(square(x),selu(x))'` are identical, so they are grouped together.  The value of each key is itself a dictionary containing information about that activation function.  For example:

```python
>>> for v in act_bench_cnn.values():
...   print(v.keys())
...   break
... 
dict_keys(['Fisher log eigenvalue CDF', 'W&B Run Configs', 'Activation Function', 'Train Accuracy', 'Validation Accuracy', 'Test Accuracy', 'Train Loss', 'Validation Loss', 'Test Loss', 'Runtime (s)'])
```

The train, validation, and test accuracies and losses are the median of three independent runs for `Act-Bench-CNN` and `Act-Bench-ResNet`, and the result of a single run for `Act-Bench-ViT`.  The same is true of the runtime, which is reported in seconds.  

The `Activation Function` contains one of the activation function names from the tuple of equivalent functions.  If desired, this string can be used to instantiate the activation function as a TensorFlow `Layer` using the `ActivationFunction` class in the `aquasurf` package at https://github.com/cognizant-ai-labs/aquasurf.

The `Fisher log eigenvalue CDF` contains a feature vector encoding the CDF of the log-scaled eigenvalues of the Fisher Information Matrix associated with the weights at each layer of the network.

Finally, the `W&B Run Configs` contains the hyperparameters used to train the network.
