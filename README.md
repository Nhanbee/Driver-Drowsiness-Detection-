# Driver Drowsiness Detection and Alert System

A Python-based driver drowsiness detection project that uses a webcam, dlib facial landmarks, eye aspect ratio (EAR), and an audio alarm to detect possible driver fatigue.

## Features

- Real-time face detection from a webcam.
- Eye landmark detection with a trained dlib shape predictor.
- Eye Aspect Ratio (EAR) calculation for drowsiness detection.
- Audio alert when the eyes remain closed for multiple frames.
- Training pipeline for generating an eye-only landmark predictor from the iBUG 300-W dataset.

## Requirements

- Python 3.8 or newer.
- A working webcam.
- The packages listed in `requirements.txt`.
- The iBUG 300-W dataset if you want to train the eye landmark model.

Install dependencies:

```bash
pip install -r requirements.txt
```

## Project Structure

```text
assets/
  alarm.mp3                         Alert sound
  eye_predictor.dat                 Generated model file, not committed
src/
  prepare_eye_landmarks.py          Extracts eye landmarks from iBUG annotations
  train_eye_predictor.py            Trains the dlib eye landmark predictor
  evaluate_eye_predictor.py         Evaluates the trained predictor
  run_drowsiness_detection.py       Runs live drowsiness detection from webcam
requirements.txt                    Python dependencies
run_training_pipeline.sh            End-to-end training and detection script
README.md                           Project documentation
```

## Dataset Setup

Download the iBUG 300-W dataset:

http://dlib.net/files/data/ibug_300W_large_face_landmark_dataset.tar.gz

Extract it and rename the extracted folder to `datasets`, then place it in the project root:

```text
Driver-Drowsiness-Detection-/
  datasets/
    afw/
    helen/
    ibug/
    lfpw/
    labels_ibug_300W_train.xml
    labels_ibug_300W_test.xml
```

The `datasets/` folder is ignored by Git because it is large.

## Train the Eye Predictor

Run the full pipeline from the project root:

```bash
./run_training_pipeline.sh
```

Or run each step manually:

```bash
cd src
python3 prepare_eye_landmarks.py
python3 train_eye_predictor.py
python3 evaluate_eye_predictor.py
```

The trained model is saved as:

```text
assets/eye_predictor.dat
```

This file is ignored by Git. Generate it locally before running detection.

## Run Drowsiness Detection

After `assets/eye_predictor.dat` exists, run:

```bash
cd src
python3 run_drowsiness_detection.py
```

Press `q` in the OpenCV window to stop the program.

## Notes

- Make sure your webcam is available as camera index `0`.
- If the alarm does not play, verify that `assets/alarm.mp3` exists and that your audio output is enabled.
- The drowsiness threshold is configured in `src/run_drowsiness_detection.py` with `EYE_AR_THRESH` and `EYE_AR_CONSEC_FRAMES`.
