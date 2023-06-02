# Multimedia Signal Processing Repository

Welcome to the Multimedia Signal Processing Repository! This repository aims to provide a comprehensive collection of concepts and techniques in audio, video, and image processing.

## Table of Contents

- [Introduction](#introduction)
- [Image Processing](#image-processing)
- [Audio Processing](#audio-processing)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Multimedia signal processing is a field of study that focuses on the processing, manipulation, analysis, and understanding of various types of multimedia data, including audio, video, and images. It involves the application of digital signal processing techniques to extract information, enhance quality, and enable efficient transmission, storage, and retrieval of multimedia content.

Multimedia data encompasses a wide range of information, such as speech, music, videos, images, and graphics. These forms of data are typically represented and processed in a digital format, allowing for efficient handling and manipulation using computers.

The goal of multimedia signal processing is to develop algorithms and methodologies that enable effective and efficient processing of multimedia data. By applying signal processing techniques, it becomes possible to extract meaningful information, reduce noise, enhance quality, compress data for efficient storage and transmission, and perform various analysis and recognition tasks.

In this repository, you will find a diverse range of multimedia signal processing topics, accompanied by code examples, algorithms, and demonstrations. The goal is to empower you with practical knowledge and resources to understand and implement various techniques effectively.

## Image Processing
### 1. JPEG Compression
  JPEG is a lossy image compression method. JPEG compression uses the DCT (Discrete Cosine Transform) method for coding transformation. It allows a trade-off between storage size and the degree of compression can be adjusted.
### Steps involved JPEG Compression 
    1. The input image is divided into a small block which is having 8x8 dimensions. This dimension is sum up to 64 units. Each unit of the image is called pixel.
    2. JPEG uses [Y, Cb, Cr] model instead of using the [R, G, B] model. So, in the 2nd step, RGB is converted into YCbCr. The range of 8-bit luminance values f (i, j) is [0, 255]. In the JPEG implementation, each Y value is first reduced by 128 by simply subtracting 128 before encoding. The idea here is to turn the Y component into a zero-mean image, the same as the chrominance images.
    3. After the conversion of colours, it is forwarded to DCT. DCT uses a cosine function and does not use complex numbers. It converts information’s which are in a block of pixels from the spatial domain to the frequency domain.
    4. Humans are unable to see important aspects of the image because they are having high frequencies. The matrix after DCT conversion can only preserve values at the lowest frequency that to in certain point. Quantization is used to reduce the number of bits per sample.
    5. After quantization de-quantize the image by multiplying Quantization to the image.
    6. Apply Inverse - DCT to the image.
    7. Add 128 to the Y values on the decoder side.
 ## Audio Processing
 ### 1. Signal to Noise Ratio of Audio signals
  The Signal-to-Noise Ratio (SNR) is a critical metric used to quantify the quality and fidelity of audio signals. It measures the ratio of the desired signal power to the power of the background noise present in the signal. A higher SNR indicates a stronger and clearer signal relative to the background noise, while a lower SNR indicates a weaker and more distorted signal compared to the noise.
### 2. De-noising audio signals using Mean, Median and Weighted average filters
  De-noising is a process of removing noise from the signal. Here, the noises are any unwanted audio segments for the human hearing like vehicle horn sounds, wind noise, even static noise or awgn. It is also known as audio enhancement as it enhances the quality of audio. Audio enhancement is an important task and it is used as a pre-processing step in various applications such as audio/video calls, Automatic Speech Recognition (ASR) etc.
  * Mean filter: Mean filter, or average filter is windowed filter of linear class, that smooths the signal. The filter works as low-pass filter. It replaces the center value in the window with the mean value of window. Filter updates every element by taking average across its neighbourhood.
  * Median filter: The median filter is a non-linear digital filtering technique, often used to remove noise from an image or signal.The main idea of the median filter is to run through the signal entry by entry, replacing each entry with the median of neighboring entries.
  * Weighted Average: An A-weighting filter is a band pass filter designed to simulate the perceived loudness of low-level tones. In weighted average filter, we gave more weight to the center value, due to which the contribution of center becomes more than the rest of the values.
### 3. Pulse Code Modulation(PCM)
In the context of audio signals, PCM stands for Pulse Code Modulation. It is a method used to digitally represent analog audio signals.
PCM works by sampling the continuous analog audio waveform at regular intervals and quantizing the amplitude of each sample. This process converts the analog signal into a digital representation.
#### Encoding:
1. Sampling: The analog audio signal is sampled at regular intervals using an ADC, similar to the PCM encoding process.
2. Quantization: The sampled amplitudes are quantized into discrete levels using a fixed bit depth, as in PCM encoding.
3. Companding: Instead of directly encoding the quantized amplitudes as in PCM, companding techniques are applied to compress the dynamic range of the signal. μ-law and A-law are logarithmic companding algorithms commonly used.

* μ-law Encoding: In μ-law encoding, the quantized amplitudes are mapped to a logarithmic scale using a non-linear companding function. This logarithmic compression increases the representation accuracy for smaller amplitudes and reduces the quantization noise for higher amplitudes.

* A-law Encoding: Similarly, A-law encoding also applies logarithmic companding but with a different companding function. A-law encoding is commonly used in European telecommunications systems.
4. Encoding: The compressed and encoded values are represented as binary numbers, as in PCM encoding.

#### Decoding:
  1. Decoding: The encoded binary numbers are retrieved from storage or transmitted data.
  2. Decoding: Each binary number is interpreted as the compressed and encoded quantized amplitude value.
  3. Expansion: The decoded compressed values are expanded using the inverse of the companding function.
  4. Reconstruction: The expanded amplitudes are converted back into a continuous signal using a digital-to-analog converter (DAC), similar to the PCM decoding process.
  5. Reconstruction Filtering: Similar to PCM, the reconstructed signal may undergo filtering to remove any artifacts and enhance the audio quality.

The inclusion of μ-law or A-law companding helps to reduce quantization noise and improve the dynamic range of the encoded audio signal, resulting in better audio quality. These companding techniques are commonly used in various telecommunication systems and audio applications, particularly in regions where they are standard practice.
Note: The specific companding algorithm used (μ-law or A-law) may vary depending on the region or application, and both techniques achieve similar benefits.
 
 



