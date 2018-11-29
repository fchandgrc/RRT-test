
function [q_new,q_near,q_near_ind,vector_dir,v] = get_qnew_qnear(delta_q,q_rand,vertices)
%获得节点中最近的和新节点
v=1;
dist_rand = pdist2(vertices,q_rand);
[dist_min,q_near_ind]=min(dist_rand);

if dist_min==0
    v=0
end
q_near=vertices(q_near_ind,:);
vector_dir =q_rand-q_near;
vector_dir = vector_dir./dist_min;
if dist_min > delta_q    %随机点到最近点的距离不确定
    q_new = floor( q_near+delta_q*vector_dir );
else
    q_new=q_rand;
end
end
