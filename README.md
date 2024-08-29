# A repository that contains docker images of different ROS Distros.


# On your host machine:
To your ```~/.bashrc``` add ```xhost +``` and source your .bashrc using ```source ~/.bashrc```

Run ```cd <cloned_repo>```

1. ```sudo docker build -t humble-ros-image-gpu:base .``` This will build the Dockerfile to make a jazzy image.
2. ```sudo docker compose run humble-image-gpu``` This will create a container of the jazzy image.

# Inside the container

## Verifying the display setup. 

Once you have sourced the ```.bashrc``` on your host terminal and opened a new container, run ```xeyes``` inside the container. This should show up two eyes and if they show up, it means the display has been forwarded properly. You can now run GUI apps on the docker.

## Running vscode inside the docker.

If you wish to open vscode inside your docker container, after running the container use the command ```vsc``` This will open vscode in the path ```/root/ros2_ws/src``` You can change this in the ```~/.bashrc``` inside the container.

If you install any extensions etc on your vscode, you don't need to rebuild the docker image. The extensions will remain if you open a new container.

## Mounted files.

The ```root_dir``` and ```ros2_ws``` in the repository are mounted into the docker container. Hence if you make changes to these directories, they will persist with new containers and you don't have to rebuild your docker image.

## Opening up new terminals.

If you start a container using ```docker run``` like in step 2, this will create a new container. 

### Option 1

If you do ```sudo docker ps``` on your host machine, you can see the active containers. You can use ```docker exec -it <active_container_id> bash``` to get into an active container. If you find this to be a pain, you can use tmux.

### Option 2

Once you are inside the container, you can run ```tmux``` and it will start a tmux session. To split the tmux session, do ```ctrl + B``` + ```release all keys``` + ```=```. This will split the terminal horizontally. If you do ```ctrl + B``` + ```release all keys``` + ```|```, it will split the terminal vertically, all within the docker container!
