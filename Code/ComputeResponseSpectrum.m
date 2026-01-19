function [Sd, Sv, Sa] = ComputeResponseSpectrum(ug, dtug, f, zeta, dtsim)

% Inputs
% ug = ground acceleration 
% dtug = sample time of ground acceleration
% f = frequencies at which to compute response spectrum
% zeta = damping ratio for which to compute response spectrum
% dtsim = sample time to execute simulations (optional)
% Outputs
% Sd = relative displacement response spectrum
% Sv = pseudo-vlocity response spectrun (w*Sd)
% Sa = pseudo-acceleration response spectrum (w^2*Sd)

t_ug = (0:length(ug)-1)'*dtug; % time corresponding to sampled ug
if (nargin < 5) % dtsim not present
    dtsim = dtug/2;
end
tend = t_ug(length(t_ug));
t = (0:dtsim:tend)'; % time for simulation
u = interp1(t_ug, ug, t); % resample ug at simulation times

% Allocate output
Sd = zeros(size(f));
Sv = Sd;
Sa = Sd;

% compute spectrum
for n = 1:length(f)
    f_ = f(n);
    w = 2*pi*f_;
    
    % create state space representation of SDOF system with frequency w and
    % damping ratio zeta
    A = [0 1; -w^2 -2*zeta*w];
    B = [0; -1];
    
    % USED FOR lsim
    % C = [1 0]; % so that output is relative displacement
    % D = [];
    
    % USED FOR lsim
    % sdofsys = ss(A, B, C, D);
    % y = lsim(sdofsys, u, t);
    
    % USED FOR ode45
    odeopt = odeset('maxstep',0.01);
    [~,X] = ode45(@sdofode, t, zeros(2,1), odeopt);
    
    % USED FOR lsim
    % Sd(n) = max(abs(y));
    
    % USED for ode45
    Sd(n) = max(abs(X(:,1)));
    
    Sv(n) = w*Sd(n);
    Sa(n) = w*Sv(n);
end

function xdot = sdofode(t, x)
    nn = floor(t/dtsim) + 1;
    if (nn+1 > length(u))
        u_ = 0;
    else
        u_ = u(nn) + (t - (nn-1)*dtsim)/dtsim*(u(nn+1)-u(nn));
    end
    xdot = A*x + B*u_;
end

end