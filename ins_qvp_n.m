%the differential equation of inertial navigation
%q is Cnb

%x = [q1; q2; q3; q4; vn; ve; vd; lat; lon; h]
%u = [wx; wy; wz; ax; ay; az], rad
function dx = ins_qvp_n(x, u)

global a f w
q = x(1:4);
v = x(5:7);
lat = x(8);
h = x(10);
wibb = u(1:3);
fb = u(4:6);

Rm = (1-f)^2*a / (1-(2-f)*f*sin(lat)^2)^1.5 + h;
Rn =         a / (1-(2-f)*f*sin(lat)^2)^0.5 + h;
Cnb = quat2dcm(q');
wien = [w*cos(lat); 0; -w*sin(lat)];
wenn = [v(2)/Rn; -v(1)/Rm; -v(2)/Rn*tan(lat)];
wnbb = wibb-Cnb*(wien+wenn);
dq = 0.5*sym(wnbb)*q; %--dq
dv = Cnb'*fb - cross(2*wien+wenn,v) + [0;0;9.8]; %--dv
dlat = v(1)/Rm;
dlon = v(2)/Rn*sec(lat);
dh = -v(3);
dx = [dq; dv; dlat; dlon; dh]; %--dx
    
end

function C = sym(w)
    C = [ 0,   -w(1), -w(2), -w(3);
         w(1),   0,    w(3), -w(2);
         w(2), -w(3),   0,    w(1);
         w(3),  w(2), -w(1),   0 ]; 
end