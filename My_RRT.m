
clc
clear
filename='map.jpg'
map=imread(filename);
x=rgb2gray(map);
[map_height,map_width]=size(x); %行是高y，列是宽x
q_start = [96, 58]; %q s t a r t ( 1 ) : x宽 , q s t a r t ( 2 ) : y高
q_goal = [176, 222];
imshow(x)
hold on

%initial
vertices=q_start;
edges = [];
K=20000;
delta_q=9;
p=0.7;
q_rand=[];
q_near=[];
q_new=[];
%main loop
plot(q_start(2),q_start(1),'*b')
plot(q_goal(2),q_goal(1),'*y')
for k = 1:K
   v=1;
    arrived=is_goal_arrived(vertices,q_goal,delta_q);
    if arrived
        vertices=[vertices;q_goal];
        edges = [edges;[size(vertices,1),size(vertices,1)-1]];
        break;
    end
    if rand <= p
        q_rand = q_goal;%q(1)宽x，q(2)高y
    else
        q_rand = [randi(map_height),randi(map_width)];
    end
    if x( q_rand(1,1),q_rand(1,2) ) < 100 %map(1)height,map(2)width
        continue;
    end
    [point1,point2]=size(vertices)
    for i=1:point1
     if vertices(i,:)==[randi(map_height),randi(map_width)]
         v=0;
     end
    end
    
    [q_new,q_near,q_near_ind,vector_dir,v] = get_qnew_qnear(delta_q,q_rand,vertices);
    if v==0;
        v=1;
        continue
    end
    add_qnew = is_add_in_veritces(x,q_new,q_near,vector_dir,10);
    if add_qnew
        vertices=[vertices;q_new];
        r_v = size(vertices,1);
        edges = [edges;[r_v,q_near_ind]];
    else
        continue;
    end
%     plot(q_near(1,1),q_near(2,1),'*b');
   plot([q_near(1,2),q_new(1,2)],[q_near(1,1),q_new(1,1)],'-b')
   drawnow
end
path =find_path_node(edges);
%plot base path
plot(vertices(path,2),vertices(path,1),'-r')
%smooth
path_smooth = smooth(path,vertices,x);
%plot smooth path
plot(vertices(path_smooth,2),vertices(path_smooth,1),'-g');
