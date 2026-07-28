# bash shell

# install dependencies
pip3 install -r requirements.txt

# go to source directory
cd src

# extract eye-only landmarks from the iBUG 300-W annotations
python3 prepare_eye_landmarks.py

# train the dlib eye landmark predictor
python3 train_eye_predictor.py

# evaluate the trained predictor
python3 evaluate_eye_predictor.py

# run live driver drowsiness detection
python3 run_drowsiness_detection.py
