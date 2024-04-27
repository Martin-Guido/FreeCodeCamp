import numpy as np


def calculate(list):
  try:
    M = np.reshape(list, (3, 3))
    calculations = {
      'mean': [
        np.mean(M, axis=0, dtype='float64').tolist(),
        np.mean(M, axis=1, dtype='float64').T.tolist(),
        np.mean(M)
      ],
      'variance': [
        np.var(M, axis=0, dtype='float64').tolist(),
        np.var(M, axis=1, dtype='float64').T.tolist(),
        np.var(M)
      ],
      'standard deviation': [
        np.std(M, axis=0, dtype='float64').tolist(),
        np.std(M, axis=1, dtype='float64').T.tolist(),
        np.std(M)
      ],
      'max':
      [np.max(M, axis=0).tolist(),
       np.max(M, axis=1).T.tolist(),
       np.max(M)],
      'min':
      [np.min(M, axis=0).tolist(),
       np.min(M, axis=1).T.tolist(),
       np.min(M)],
      'sum':
      [np.sum(M, axis=0).tolist(),
       np.sum(M, axis=1).T.tolist(),
       np.sum(M)]
    }

    return calculations
  except ValueError:
    raise ValueError('List must contain nine numbers.')
    #print("List must contain nine numbers.")
    raise
