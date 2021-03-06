apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    io.kompose.service: frontend
  name: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: frontend
  template:
    metadata:
      labels:
        io.kompose.service: frontend
    spec:
      containers:
        - image: ghcr.io/mxschmitt/try-playwright/frontend:${DOCKER_TAG}
          name: frontend
          ports:
            - containerPort: 8080
          imagePullPolicy: IfNotPresent
      restartPolicy: Always
