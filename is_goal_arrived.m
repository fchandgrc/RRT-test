function arrived=is_goal_arrived(vertices,q_goal,delta_q)
%�ж��Ƿ񵽴��յ�
dist=pdist2(vertices(end,:),q_goal);
if dist <= delta_q
    arrived=1;
else
    arrived=0;
end
end

