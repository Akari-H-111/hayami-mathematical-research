#!/usr/bin/env python3
"""Deterministic Matplotlib renderer for the twelve golden-coordinate plates."""
from __future__ import annotations
import json, math
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import patches
from matplotlib.colors import LinearSegmentedColormap
import mpmath as mp
import numpy as np

ROOT=Path(__file__).resolve().parent
OUT=ROOT/"output"
for d in ("pdf","svg","png"): (OUT/d).mkdir(parents=True,exist_ok=True)
(ROOT/"data").mkdir(exist_ok=True)
WARM="#fffdf8"; NAVY="#12233f"; GOLD="#c99618"; TEAL="#008c95"; VIOLET="#7354a8"; BLUE="#2878b5"; CORAL="#c85c45"; GRAY="#657082"; PALE="#e8edf2"
COLORS={"background":WARM,"typography":NAVY,"geometry":GOLD,"fourier":TEAL,"modular":VIOLET,"hermite_cm":BLUE}
plt.rcParams.update({"figure.facecolor":WARM,"axes.facecolor":WARM,"savefig.facecolor":WARM,"text.color":NAVY,"axes.labelcolor":NAVY,"axes.edgecolor":NAVY,"xtick.color":NAVY,"ytick.color":NAVY,"font.family":"DejaVu Sans","font.size":12,"axes.titlesize":17,"axes.labelsize":12,"pdf.fonttype":42,"ps.fonttype":42,"svg.fonttype":"path","svg.hashsalt":"heegner-golden-terra56-20261019","mathtext.fontset":"dejavusans","axes.unicode_minus":False})
FIXED_DATE=datetime(2026,10,19,tzinfo=timezone.utc)
PDF_META={"Title":"Golden-coordinate figure plate","Author":"Research figure packet","Creator":"Matplotlib deterministic renderer","CreationDate":FIXED_DATE,"ModDate":FIXED_DATE}
mp.mp.dps=180

def mps(x,n=90):
    if isinstance(x,mp.mpc): return {"re":mp.nstr(x.real,n),"im":mp.nstr(x.imag,n)}
    return mp.nstr(x,n)

phi_m=(1+mp.sqrt(5))/2
c0_m=(3-mp.sqrt(5))/2
gamma_m=1-c0_m
u0_m=gamma_m/2
kappa_m=gamma_m/(1+mp.sqrt(1+c0_m))
phi,c0,gamma,u0,kappa=map(float,(phi_m,c0_m,gamma_m,u0_m,kappa_m))
M=np.array([[-1,gamma],[gamma,1.]])/math.sqrt(1+c0)
J=np.array([[0.,1.],[1.,0.]])
A=J@M@J

def surface(t,u):
    c=np.cos(t); s=np.sin(t); q=np.sqrt(np.maximum(c*(2-c),0))
    return np.array([c+2*u*(1-c),(1-u)*s,u*q])

def cross_norm(c,u):
    s=np.sqrt(np.maximum(1-c*c,0));q=np.sqrt(c*(2-c))
    st=np.array([s*(2*u-1),(1-u)*c,-u*s*(1-c)/q])
    su=np.array([2*(1-c),-s,q])
    return np.linalg.norm(np.cross(st,su,axis=0),axis=0)

def rr_iy(y,terms=180):
    y=mp.mpf(y);q=mp.e**(-2*mp.pi*y);prod=mp.mpf(1)
    for n in range(1,terms+1): prod*=((1-q**(5*n-4))*(1-q**(5*n-1))/((1-q**(5*n-3))*(1-q**(5*n-2))))
    return q**(mp.mpf(1)/5)*prod

def theta(t,cutoff=90):
    total=mp.mpf(0)
    for n in range(-cutoff,cutoff+1): total+=n*[0,1,kappa_m,-kappa_m,-1][n%5]*mp.e**(-mp.pi*n*n*mp.mpf(t)/5)
    return total

def completed(s):
    F=sum(a*mp.zeta(s,mp.mpf(j)/5) for j,a in zip(range(1,5),(1,kappa_m,-kappa_m,-1))) * mp.power(5,-s)
    return mp.power(5/mp.pi,(s+1)/2)*mp.gamma((s+1)/2)*F

def conv(a,b,n):
    r=[0]*(n+1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            if i+j<=n:r[i+j]+=x*y
    return r

def j_coefficients(nmax=10):
    """Exact coefficients of q*j derived from E4^3/Delta."""
    e4=[1]+[240*sum(d**3 for d in range(1,n+1) if n%d==0) for n in range(1,nmax+2)]
    e43=conv(conv(e4,e4,nmax+1),e4,nmax+1)
    delta=[1]+[0]*(nmax+1)
    for n in range(1,nmax+2):
        new=[0]*(nmax+2)
        for p in range(25):
            if n*p>nmax+1:break
            for k,old in enumerate(delta):
                if k+n*p<=nmax+1:new[k+n*p]+=math.comb(24,p)*(-1)**p*old
        delta=new
    inv=[0]*(nmax+2);inv[0]=1
    for n in range(1,nmax+2):inv[n]=-sum(delta[k]*inv[n-k] for k in range(1,n+1))
    return conv(e43,inv,nmax+1)

# Data stored with decimal strings before any plotting conversion.
t0=math.acos(c0)
surface_points=surface(np.array([t0,-t0]),u0).T
pent_angles=2*np.pi*np.arange(5)/5
pentagon=np.column_stack((np.cos(pent_angles),np.sin(pent_angles)))
raw=[]
for a in (-1,1):
    for b in (-phi,phi): raw.extend([(0,a,b),(a,b,0),(b,0,a)])
ico=np.array(raw,dtype=float)/math.sqrt(1+phi**2)
pairs=[]; distances=[]
for i,j in combinations(range(12),2): pairs.append([i,j]);distances.append(float(np.linalg.norm(ico[i]-ico[j])))
pairs=np.array(pairs);distances=np.array(distances)
short_d,long_d,anti_d=sorted(set(round(x,10) for x in distances))
pair_kind=np.array(["short" if abs(d-short_d)<1e-7 else "long" if abs(d-long_d)<1e-7 else "antipodal" for d in distances])
theta_t=np.logspace(-1,1,161);theta_vals=np.array([float(theta(x)) for x in theta_t]);theta_rec=np.array([float(theta(1/x)) for x in theta_t])
rr_y=np.linspace(.5,2,101);rr_vals=np.array([float(rr_iy(x)) for x in rr_y]);rr_recip_vals=np.array([float(rr_iy(1/x)) for x in rr_y])
sigma_grid=np.linspace(-.35,1.35,49);lambda_grid=np.array([complex(completed(mp.mpc(x,1.15))) for x in sigma_grid])
lambda_pairs=[]
for sr,si in [(0.25,.6),(.4,1.15),(.7,.35),(1.2,1.15)]:
    z=mp.mpc(sr,si);left,right=completed(z),completed(1-z)
    lambda_pairs.append({"s":mps(z),"one_minus_s":mps(1-z),"Lambda_s":mps(left),"Lambda_1_minus_s":mps(right),"difference":mps(left-right,40)})
jq=j_coefficients(10);assert jq[:3]==[1,744,196884]
R_m=mp.e**(mp.pi*mp.sqrt(163));N_int=640320**3+744;gap_m=mp.mpf(N_int)-R_m;qcm=-1/R_m
# q=-1/R, so q^n contributes alternating signs to N-R.
# Term n (starting at one) is jq[n+1](-1)^(n+1)/R^n; in particular 196884/R.
corr=[mp.mpf(jq[n+1])*(-1)**(n+1)/R_m**n for n in range(1,7)]
partial=[];run=mp.mpf(0)
for x in corr:run+=x;partial.append(run)
residuals=[gap_m-x for x in partial]
dft_m=np.arange(1,6);dft_n=np.arange(1,6);dft_input=np.array([1,kappa,-kappa,-1.,0.]);dft_raw=np.array([sum(dft_input[j]*np.exp(2j*np.pi*m*(j+1)/5) for j in range(5))/math.sqrt(5) for m in dft_m]);dft_output=-1j*dft_raw
np.savez(ROOT/"data"/"figure_arrays.npz",surface_reflected_points=surface_points,pentagon_vertices=pentagon,pentagon_side_length=np.array([np.linalg.norm(pentagon[1]-pentagon[0])]),pentagon_diagonal_length=np.array([np.linalg.norm(pentagon[2]-pentagon[0])]),icosahedron_vertices=ico,icosahedron_pairs=pairs,icosahedron_pair_distances=distances,theta_t=theta_t,theta_values=theta_vals,theta_reciprocal_values=theta_rec,rr_y=rr_y,rr_values=rr_vals,rr_reciprocal_values=rr_recip_vals,dft_m=dft_m,dft_n=dft_n,dft_input=dft_input,dft_output_real=dft_output.real,dft_output_imag=dft_output.imag,lambda_sigma=sigma_grid,lambda_real=lambda_grid.real,lambda_imag=lambda_grid.imag)
values={
 "precision":{"mpmath_decimal_digits":180,"rr_product_terms":180,"theta_symmetric_sum_cutoff":90,"j_q_series_order":10},
 "constants":{"phi":mps(phi_m),"c0":mps(c0_m),"gamma":mps(gamma_m),"u0":mps(u0_m),"kappa":mps(kappa_m),"t_lateral":mps(mp.acos(c0_m))},
 "matrices":{"M":M.tolist(),"J":J.tolist(),"A":A.tolist()},
 "surface":{"formula":"S(t,u)=(c+2u(1-c),(1-u)s,u sqrt(c(2-c))); c=cos(t), s=sin(t)","reflected_lateral_points":surface_points.tolist()},
 "pentagon":{"angles_degrees":[0,72,144,216,288],"unit_vertices":pentagon.tolist(),"projection_vertex_index":1,"horizontal_projection":mps(u0_m),"side_length":mps(mp.sqrt(2-2*mp.cos(2*mp.pi/5))),"diagonal_length":mps(mp.sqrt(2-2*mp.cos(4*mp.pi/5))),"side_over_diagonal":mps(1/phi_m),"squared_ratio":mps(c0_m)},
 "icosahedron":{"unit_vertices":ico.tolist(),"pairs":pairs.tolist(),"distances":[mps(mp.mpf(x),30) for x in distances],"counts":{"short":int(sum(pair_kind=="short")),"long":int(sum(pair_kind=="long")),"antipodal":int(sum(pair_kind=="antipodal"))},"squared_short_over_long":mps((2-2/mp.sqrt(5))/(2+2/mp.sqrt(5)))},
 "rr":{"formula":"r(iy) direct product; r(i/y) separately evaluated at 1/y","y_samples":[mps(mp.mpf(x),20) for x in rr_y[::10]],"r_iy_samples":[mps(rr_iy(x),45) for x in rr_y[::10]],"r_i_over_y_samples":[mps(rr_iy(1/x),45) for x in rr_y[::10]],"r_i":mps(rr_iy(1),70)},
 "dft":{"residue_order":[1,2,3,4,5],"input":[mps(mp.mpf(x),35) for x in dft_input],"output_minus_iF":[{"re":mps(mp.mpf(z.real),35),"im":mps(mp.mpf(z.imag),35)} for z in dft_output]},
 "theta":{"t_samples":[mps(mp.mpf(x),18) for x in theta_t[::20]],"values":[mps(theta(x),35) for x in theta_t[::20]],"reciprocal_values":[mps(theta(1/x),35) for x in theta_t[::20]]},
 "completed_function_samples":lambda_pairs,
 "cm":{"i":{"q":mps(mp.e**(-2*mp.pi)),"j":"1728"},"tau163":{"tau":{"re":"0.5","im":mps(mp.sqrt(163)/2)},"q":mps(qcm),"j":str(-640320**3)}},
 "hermite":{"R":mps(R_m,170),"N":str(N_int),"N_minus_R":mps(gap_m,170),"q":mps(qcm,120),"qj_coefficients":[str(x) for x in jq[:8]],"correction_power_rule":"term n = jq[n+1] * (-1)^(n+1) / R^n, n starts at 1","corrections":[mps(x,130) for x in corr],"partial_sums":[mps(x,130) for x in partial],"residuals":[mps(x,130) for x in residuals]}}
sample_vector=np.array([.82,.57]); sample_vector/=np.linalg.norm(sample_vector)
reflection_samples={"M_input":sample_vector,"M_output":M@sample_vector,
                    "A_input":J@sample_vector,"A_output":A@(J@sample_vector)}
values["reflection_samples"]={key:val.tolist() for key,val in reflection_samples.items()}
(ROOT/"data"/"figure_values.json").write_text(json.dumps(values,indent=2)+"\n")

def finish(fig,num,title):
    fig.suptitle(f"Figure {num:02d}. {title}",x=.055,ha="left",y=.985,color=NAVY,fontsize=22,fontweight="bold")
    fig.text(.055,.025,"Golden geometry = gold   |   Fourier / theta = teal   |   modular map = violet   |   CM / Hermite = blue",color=GRAY,fontsize=9.5)
    fig.subplots_adjust(left=.06,right=.965,bottom=.10,top=.88,wspace=.28,hspace=.34)
    for ext,dpi in (("pdf",None),("svg",None),("png",300)):
        opts={"dpi":dpi,"bbox_inches":"tight","pad_inches":.08}
        if ext=="pdf":opts["metadata"]=PDF_META
        fig.savefig(OUT/ext/f"figure_{num:02d}.{ext}",**opts)
    plt.close(fig)

def card(ax,xy,title,body,color,w=.37,h=.19):
    x,y=xy;ax.add_patch(patches.FancyBboxPatch((x,y),w,h,boxstyle="round,pad=.018,rounding_size=.02",fc="#fff",ec=color,lw=2));ax.text(x+.018,y+h-.05,title,color=color,weight="bold",fontsize=13,va="top");ax.text(x+.018,y+h-.085,body,color=NAVY,fontsize=10.5,va="top",linespacing=1.45)

def fig01():
    fig,ax=plt.subplots(figsize=(16,9));ax.set_axis_off();ax.set(xlim=(0,1),ylim=(0,1))
    card(ax,(.04,.64),"Surface coordinate","$c_0=\\phi^{-2}$\n$u_0=(1-c_0)/2=\\cos(2\\pi/5)$",GOLD,w=.25)
    card(ax,(.37,.64),"Plane reflection","$M=(1+c_0)^{-1/2}[[-1,\\gamma],[\\gamma,1]]$\n$\\gamma=1-c_0$",VIOLET,w=.25)
    card(ax,(.70,.64),"Coordinate exchange","$A=J M J$\n$J(x,y)=(y,x)$",VIOLET,w=.25)
    card(ax,(.22,.30),"Fourier eigenline","$a=(1,\\kappa,-\\kappa,-1,0)$\n$-i F a=a$",TEAL,w=.29)
    card(ax,(.58,.30),"Functional equation","$\\Theta(t)=t^{-3/2}\\Theta(1/t)$\n$\\Lambda(s)=\\Lambda(1-s)$",TEAL,w=.31)
    for p,q,label in [((.29,.73),(.37,.73),"form M"),((.62,.73),(.70,.73),"exchange by J"),((.82,.64),(.47,.51),"take +1 eigenline"),((.51,.39),(.58,.39),"Poisson + Mellin")]:
        ax.annotate("",q,p,arrowprops=dict(arrowstyle="->",lw=2,color=NAVY))
        label_y=.87 if p[1]==.73 else (.245 if label=="Poisson + Mellin" else (p[1]+q[1])/2+.035)
        ax.text((p[0]+q[0])/2,label_y,label,ha="center",fontsize=10,color=GRAY)
    ax.plot([.08,.91],[.13,.13],color=BLUE,lw=1.4,ls="--");ax.text(.06,.075,r"Distinct CM branch: $i$ is fixed by $S:\tau\mapsto-1/\tau$ and selects $\kappa=r(i)$.",color=BLUE,fontsize=12);ax.text(.06,.035,r"$\tau_{163}=(1+i\sqrt{163})/2$ instead supplies $j(\tau_{163})=-640320^3$ and a tiny negative nome.",color=BLUE,fontsize=12)
    finish(fig,1,"One scalar coordinate, an explicit involution, and its Fourier consequence")

def fig02():
    fig=plt.figure(figsize=(16,9))
    ax=fig.add_subplot(121,projection="3d",computed_zorder=False)
    az=fig.add_subplot(122,projection="3d",computed_zorder=False)
    T,U=np.meshgrid(np.linspace(-1.42,1.42,75),np.linspace(0,1,36))
    X,Y,Z=surface(T,U)
    ax.plot_surface(X,Y,Z,rstride=2,cstride=2,color=GOLD,alpha=.28,
                    linewidth=.25,edgecolor="#ad8119",zorder=1)
    for angle in (-t0,t0):
        ax.plot(*surface(np.full(60,angle),np.linspace(0,1,60)),color=GOLD,lw=3,zorder=2)
    ax.scatter(*surface(np.array([t0,-t0]),u0),s=95,color=CORAL,
               edgecolor=NAVY,depthshade=False,zorder=10)
    ax.set_box_aspect([np.ptp(ax.get_xlim3d()),np.ptp(ax.get_ylim3d()),np.ptp(ax.get_zlim3d())])
    ax.set_title("Actual ruled patch $S(t,u)$",loc="left",color=GOLD)
    ax.text2D(.02,.95,"Coral markers: the lateral pair",transform=ax.transAxes,color=NAVY)
    Lt,Lu=np.meshgrid(np.linspace(t0-.22,t0+.22,45),np.linspace(u0-.20,u0+.20,45))
    local=surface(Lt,Lu)
    az.plot_surface(*local,rstride=2,cstride=2,color=GOLD,alpha=.28,
                    linewidth=.3,edgecolor="#ad8119",zorder=1)
    az.plot(*surface(np.full(60,t0),np.linspace(u0-.20,u0+.20,60)),color=GOLD,lw=3,zorder=2)
    point=surface(np.array([t0]),u0).ravel()
    az.scatter(*point,s=110,color=CORAL,edgecolor=NAVY,depthshade=False,zorder=10)
    mins=local.reshape(3,-1).min(axis=1);maxs=local.reshape(3,-1).max(axis=1)
    center=(mins+maxs)/2;half=max(maxs-mins)/2+.04
    az.set(xlim=(center[0]-half,center[0]+half),ylim=(center[1]-half,center[1]+half),
           zlim=(center[2]-half,center[2]+half))
    az.set_box_aspect((1,1,1))
    az.set_title("Local patch at the positive-t lateral point",loc="left",color=CORAL)
    az.text2D(.02,.95,r"$p_+=S(\arccos c_0,u_0)$",transform=az.transAxes,color=CORAL)
    for panel in (ax,az):
        panel.set_xlabel("x",labelpad=8);panel.set_ylabel("y",labelpad=8)
        panel.set_zlabel("z",labelpad=8);panel.view_init(25,-58)
    finish(fig,2,"The orthogonal-circle ruled surface and its two lateral rank-loss points")

def fig03():
    fig,(ax,ap)=plt.subplots(1,2,figsize=(16,9),gridspec_kw={"width_ratios":[1.55,.8]});cc=np.linspace(.03,.97,260);uu=np.linspace(.02,.98,250);C,U=np.meshgrid(cc,uu);norm=cross_norm(C,U)
    im=ax.contourf(C,U,np.log10(norm+1e-8),levels=30,cmap=LinearSegmentedColormap.from_list("warm",["#fff9e9",GOLD,"#9c5d10"]));ax.contour(C,U,norm,levels=[.02,.08,.2,.5,1],colors=NAVY,linewidths=.65,alpha=.55);ax.plot(cc,(1-cc)/2,color=VIOLET,lw=2.5,ls="--",label=r"$u=(1-c)/2$");ax.scatter([c0],[u0],s=95,color=CORAL,edgecolor=NAVY,zorder=4,label=r"$(c_0,u_0)$")
    ax.set(xlim=(.03,.97),ylim=(.02,.98),xlabel=r"$c=\cos t$ (positive-sine branch)",ylabel="$u$");ax.set_title(r"$\log_{10}\|S_t\times S_u\|$",loc="left");ax.legend(frameon=False,loc="upper right");fig.colorbar(im,ax=ax,pad=.02).set_label("log norm")
    ap.axhline(0,color=NAVY,lw=1);ap.plot(cc,cc**2-3*cc+1,color=GOLD,lw=3);ap.axvline(c0,color=CORAL,ls="--");ap.scatter([c0],[0],color=CORAL,s=70);ap.set(xlim=(.03,.97),xlabel="$c$",ylabel="$P(c)$",title=r"$P(c)=c^2-3c+1$");ap.text(.08,.17,r"The interior root is $c_0$.",transform=ap.transAxes,color=NAVY)
    finish(fig,3,"Rank loss on the positive-sine branch: the lateral condition and its root")

def fig04():
    fig,(ax,bar)=plt.subplots(1,2,figsize=(16,9),gridspec_kw={"width_ratios":[1.25,.75]});ax.plot(*np.vstack((pentagon,pentagon[0])).T,color=GOLD,lw=3,marker="o",ms=7);ax.plot([pentagon[0,0],pentagon[2,0]],[pentagon[0,1],pentagon[2,1]],color=TEAL,lw=2.5,ls="--");ax.plot([0,pentagon[0,0]],[0,pentagon[0,1]],color=GRAY,lw=1.5);ax.plot([0,pentagon[1,0]],[0,pentagon[1,1]],color=GRAY,lw=1.5)
    ax.add_patch(patches.Arc((0,0),.52,.52,theta1=0,theta2=72,ec=VIOLET,lw=2));ax.text(.23,.18,r"$72^\circ$",color=VIOLET,fontsize=14);xproj=pentagon[1,0];ax.plot([xproj,xproj],[0,pentagon[1,1]],color=VIOLET,ls=":",lw=2);ax.plot([0,xproj],[0,0],color=VIOLET,lw=3);ax.text(xproj/2,-.14,r"$\cos72^\circ=u_0$",ha="center",color=VIOLET,fontsize=14)
    ax.text(*(pentagon[0]+pentagon[1])/2+np.array([.05,.09]),"side",color=GOLD,fontsize=13);ax.text(*(pentagon[0]+pentagon[2])/2+np.array([-.10,.07]),"diagonal",color=TEAL,fontsize=13);ax.set_aspect("equal");ax.set(xlim=(-1.35,1.35),ylim=(-1.28,1.28));ax.axis("off");ax.set_title("Unit pentagon: vertices 0, 72, 144, ... degrees",loc="left")
    bar.axis("off");bar.text(.03,.75,"actual length ratio",fontsize=16,weight="bold",color=NAVY);bar.text(.03,.61,r"side / diagonal $=\phi^{-1}=\gamma$",fontsize=15,color=GOLD);bar.text(.03,.44,r"squared ratio $=\phi^{-2}=c_0$",fontsize=15,color=GOLD);bar.text(.03,.22,"On this unit circle, the horizontal\nprojection has value $u_0=\\cos72^\\circ$.",fontsize=13,color=GRAY,linespacing=1.5)
    finish(fig,4,"The pentagonal coordinate: angle, projection, and the golden squared ratio")

def fig05():
    fig,(am,aa)=plt.subplots(1,2,figsize=(16,9))
    specs=[(am,M,np.array([kappa,1.]),"$M$ reflection",r"projective slope $z=x/y$","M",r"$v$",r"$Mv$"),
           (aa,A,np.array([1.,kappa]),"$A=JMJ$ reflection",r"mixing coordinate $y/x$","A",r"$Jv$",r"$A(Jv)$")]
    for ax,mat,vec,title,coord,key,source_label,image_label in specs:
        angles=np.linspace(0,2*np.pi,300)
        ax.plot(np.cos(angles),np.sin(angles),color=PALE,lw=2,label="unit circle")
        plus=vec/np.linalg.norm(vec);minus=np.array([-plus[1],plus[0]])
        ax.axline(-plus,plus,color=GOLD,lw=3,label="+1 eigenline")
        ax.axline(-minus,minus,color=GRAY,lw=1.5,ls="--",label="-1 eigenline")
        source=reflection_samples[key+"_input"];mapped=reflection_samples[key+"_output"]
        ax.quiver(0,0,*source,angles="xy",scale_units="xy",scale=1,color=TEAL,width=.012,label=source_label)
        ax.quiver(0,0,*mapped,angles="xy",scale_units="xy",scale=1,color=CORAL,width=.012,label=image_label)
        ax.plot([source[0],mapped[0]],[source[1],mapped[1]],color=GRAY,ls=":",lw=1)
        ax.text(*(source*1.08),source_label,color=TEAL,fontsize=13)
        ax.text(*(mapped*1.08),image_label,color=CORAL,fontsize=13)
        ax.text(*(plus*1.08),r"$(\kappa,1)$" if ax is am else r"$(1,\kappa)$",color=GOLD,fontsize=14)
        ax.set_aspect("equal")
        ax.set(xlim=(-1.35,1.35),ylim=(-1.35,1.35),xlabel="$x$",ylabel="$y$",title=title)
        ax.legend(fontsize=9,loc="lower left",framealpha=.94,facecolor=WARM)
        ax.text(.04,.95,coord,transform=ax.transAxes,color=GRAY,fontsize=11,va="top")
    fig.text(.5,.065,r"Coordinate exchange: $J(x,y)=(y,x)$",ha="center",color=VIOLET,fontsize=14)
    finish(fig,5,"Coordinate exchange carries one explicit reflection and eigenline to the other")

def fig06():
    fig,(ax,ay)=plt.subplots(1,2,figsize=(16,9));z=np.linspace(-.85,.85,500);rz=(gamma-z)/(1+gamma*z);ax.plot(z,rz,color=VIOLET,lw=3,label="$R(z)$");ax.plot(z,z,color=GRAY,lw=1.5,ls="--",label="$z$");ax.scatter([kappa],[kappa],s=95,color=GOLD,edgecolor=NAVY,zorder=4);ax.annotate(r"positive fixed point $\kappa$",(kappa,kappa),xytext=(.1,.57),arrowprops=dict(arrowstyle="->",color=NAVY),color=NAVY,fontsize=13);ax.set(xlim=(-.85,.85),ylim=(-.85,.85),xlabel="$z$",ylabel="$R(z)$",title=r"$R(z)=(\gamma-z)/(1+\gamma z)$");ax.legend(frameon=False)
    ay.plot(rr_y,rr_vals,color=BLUE,lw=2.8,label=r"direct product $r(iy)$");ay.plot(rr_y,rr_recip_vals,color=VIOLET,lw=2.3,ls="--",label=r"independent $r(i/y)$");ay.axvline(1,color=GRAY,ls=":");ay.axhline(kappa,color=GOLD,ls="--");ay.scatter([1],[kappa],color=GOLD,s=80,zorder=4);ay.set(xlim=(.5,2),xlabel="$y$",ylabel="product value",title=r"Direct inversion-paired product evaluations");ay.legend(frameon=False,fontsize=10);ay.text(.05,.05,r"At $y=1$, $-1/i=i$ selects $r(i)=\kappa>0$.",transform=ay.transAxes,color=NAVY);finish(fig,6,r"Why the inversion fixed point gives the positive value $r(i)=\kappa$")

def fig07():
    fig,(a1,a2)=plt.subplots(1,2,figsize=(16,9));n=np.arange(5);a1.bar(n-.16,dft_input,.32,color=TEAL,label=r"input $a$");a1.bar(n+.16,dft_output.real,.32,fill=False,edgecolor=NAVY,hatch="//",lw=2,label=r"$-i\mathcal{F}a$ (real)");a1.plot(n+.16,dft_output.imag,"o",color=CORAL,label="imaginary residual");a1.axhline(0,color=NAVY,lw=1);a1.set_xticks(n,["1","2","3","4","5 (=0)"]);a1.set(xlabel="residue m modulo 5",ylabel="coefficient",title="Actual DFT input and output in the same order");a1.legend(frameon=False,fontsize=10);a1.text(.05,.06,r"$a=(1,\kappa,-\kappa,-1,0)$",transform=a1.transAxes,color=TEAL,fontsize=14)
    a2.axis("off");a2.text(.06,.79,"Odd five-periodic coordinates",fontsize=19,weight="bold",color=NAVY);a2.text(.08,.61,r"$(a_1,a_2,a_3,a_4,a_0)=(x,y,-y,-x,0)$",fontsize=18,color=TEAL)
    for x,lab,val in zip(np.linspace(.13,.86,5),["1","2","3","4","5=0"],["$x$","$y$","$-y$","$-x$","$0$"]):a2.add_patch(patches.Circle((x,.36),.065,fc="#e8f5f4",ec=TEAL,lw=2));a2.text(x,.36,lab,ha="center",va="center",fontsize=14,color=NAVY);a2.text(x,.22,val,ha="center",fontsize=15,color=TEAL)
    a2.text(.08,.08,r"Positive-exponential normalized DFT; multiplication by $-i$ makes the odd subspace real.",fontsize=12,color=GRAY,wrap=True);finish(fig,7,"The odd five-periodic Fourier eigenvector, residue by residue")

def fig08():
    fig,(ax,ar)=plt.subplots(1,2,figsize=(16,9));x=np.log(theta_t);ax.plot(x,theta_t**.75*theta_vals,color=TEAL,lw=3,label=r"evaluated $t^{3/4}\Theta(t)$");ax.plot(x,(1/theta_t)**.75*theta_rec,color=VIOLET,ls="--",lw=2,label=r"independent $(1/t)^{3/4}\Theta(1/t)$");ax.axvline(0,color=GRAY,lw=1);ax.set(xlabel=r"$\log t$",ylabel="compensated theta",title="Numerical self-duality from both sides");ax.legend(frameon=False)
    ar.axis("off");ar.text(.04,.77,"Gaussian + periodic coefficients",fontsize=18,weight="bold");ar.text(.06,.56,r"$\Theta_a(t)=\sum_{n\in\mathrm{Z}}n a_n e^{-\pi n^2t/5}$",fontsize=18,color=TEAL);ar.text(.06,.35,r"$\Theta_a(t)=t^{-3/2}\Theta_a(1/t)$",fontsize=18,color=VIOLET);ar.text(.06,.16,"Both positive and negative n were summed\nindependently for every plotted t.",fontsize=13,color=GRAY,linespacing=1.5);finish(fig,8,"Theta self-duality: a directly evaluated compensated symmetric profile")

def fig09():
    fig=plt.figure(figsize=(16,9));gs=fig.add_gridspec(1,2,width_ratios=[1.05,1.15]);flow=fig.add_subplot(gs[0]);ax=fig.add_subplot(gs[1]);flow.axis("off")
    labels=[("Gaussian\nperiodic sum",TEAL),("theta\ntransformation",TEAL),("Mellin\nintegral",VIOLET),("completed\nseries",VIOLET)]
    for i,(lab,col) in enumerate(labels):
        x=.04+i*.24;flow.add_patch(patches.FancyBboxPatch((x,.48),.18,.16,boxstyle="round,pad=.015",fc="#fff",ec=col,lw=2));flow.text(x+.09,.56,lab,ha="center",va="center",color=NAVY,fontsize=13)
        if i<3:flow.annotate("",(x+.235,.56),(x+.19,.56),arrowprops=dict(arrowstyle="->",lw=2,color=NAVY))
    flow.text(.05,.27,r"$\Lambda(s)=(5/\pi)^{(s+1)/2}\Gamma((s+1)/2)\,5^{-s}\sum_{j=1}^4a_j\zeta(s,j/5)$",fontsize=15,color=NAVY);flow.text(.05,.13,r"For the Fourier eigenvector:  $\Lambda(s)=\Lambda(1-s)$",fontsize=15,color=TEAL)
    ax.plot(sigma_grid,lambda_grid.real,color=TEAL,lw=2.7,label=r"$\Re\Lambda(\sigma+1.15i)$");ax.plot(sigma_grid,lambda_grid.imag,color=VIOLET,lw=2.4,ls="--",label=r"$\Im\Lambda(\sigma+1.15i)$");ax.axvline(.5,color=GRAY,lw=1);ax.set(xlabel=r"$\sigma$",ylabel="numerical value",title="Paired functional-equation profile");ax.legend(frameon=False,fontsize=10);ax.text(.05,.55,r"Real part is even; imaginary part is odd about $\sigma=1/2$.",transform=ax.transAxes,color=GRAY);finish(fig,9,"From Gaussian sum to Mellin completion: a numerical functional-equation view")

def fig10():
    fig,(ax,bar)=plt.subplots(1,2,figsize=(16,9),gridspec_kw={"width_ratios":[1.2,.8]});xx=np.linspace(-.5,.5,300);ax.fill_between(xx,np.sqrt(np.maximum(1-xx*xx,0)),8,color="#edf1f5",alpha=.8,label="standard domain for $j$");ax.plot(xx,np.sqrt(1-xx*xx),color=GRAY,lw=1.3);ax.axvline(-.5,color=GRAY);ax.axvline(.5,color=GRAY);ax.scatter([0,.5],[1,math.sqrt(163)/2],s=[100,110],color=[VIOLET,BLUE],edgecolor=NAVY,zorder=4);ax.annotate(r"$i$: fixed by $S$",(0,1),xytext=(-.35,2.4),arrowprops=dict(arrowstyle="->",color=VIOLET),color=VIOLET,fontsize=14);ax.annotate(r"$\tau_{163}$",(.5,math.sqrt(163)/2),xytext=(-.36,6.7),arrowprops=dict(arrowstyle="->",color=BLUE),color=BLUE,fontsize=14);ax.set(xlim=(-.72,.72),ylim=(0,7.5),xlabel=r"$\Re\tau$",ylabel=r"$\Im\tau$",title="Two distinct upper-half-plane arguments");ax.legend(frameon=False,loc="upper left")
    bar.axis("off");bar.set(xlim=(0,1),ylim=(0,1));tr=bar.transAxes;bar.text(.04,.78,"i",transform=tr,fontsize=21,weight="bold",color=VIOLET);bar.text(.04,.65,r"$q=e^{-2\pi}$",transform=tr,fontsize=15);bar.text(.04,.56,r"$j(i)=1728$",transform=tr,fontsize=15);bar.text(.04,.47,r"fixed point selects $r(i)=\kappa$",transform=tr,fontsize=13,color=VIOLET);bar.plot([.04,.94],[.40,.40],transform=tr,color=PALE,lw=2);bar.text(.04,.29,r"$\tau_{163}=(1+i\sqrt{163})/2$",transform=tr,fontsize=17,weight="bold",color=BLUE);bar.text(.04,.17,r"$q=-e^{-\pi\sqrt{163}}$,  $j=-640320^3$",transform=tr,fontsize=14);bar.text(.04,.07,"integral j-value and tiny negative nome",transform=tr,fontsize=13,color=BLUE);finish(fig,10,"Two CM arguments, two roles: inversion fixed point versus Hermite’s small nome")

def fig11():
    fig,(top,ax)=plt.subplots(2,1,figsize=(16,9),gridspec_kw={"height_ratios":[.8,1.2]});top.axis("off");top.text(.02,.72,r"$R=e^{\pi\sqrt{163}}$",fontsize=19,color=BLUE,weight="bold");top.text(.28,.72,mps(R_m,35),fontsize=16,color=NAVY);top.text(.02,.39,r"$N=640320^3+744=$ "+str(N_int),fontsize=17,color=NAVY);top.text(.02,.08,r"$N-R=$ "+mps(gap_m,45),fontsize=16,color=CORAL)
    idx=np.arange(1,7);ax.semilogy(idx,[abs(float(x)) for x in residuals],"o-",color=BLUE,lw=2.7,label="absolute residual after correction");ax.semilogy(idx,[abs(float(x)) for x in corr],"s--",color=GOLD,lw=1.7,label="successive series term");ax.set(xticks=idx,xlabel="number of displayed $j$-series corrections",ylabel="magnitude (log scale)",title=r"$N-R=196884/R-21493760/R^2+864299970/R^3+\cdots$");ax.legend(frameon=False);ax.text(.04,.08,"Coefficients were derived as the exact q-series E4^3/Delta; R is one fixed number.",transform=ax.transAxes,color=GRAY);finish(fig,11,"Hermite’s near-integer: fixed high-precision gap and the $j$-series correction ladder")

def fig12():
    fig=plt.figure(figsize=(16,9));ax=fig.add_subplot(121,projection="3d");bar=fig.add_subplot(122)
    for kind,col,lw,alpha in [("short",GOLD,1.6,.85),("long",TEAL,.8,.38),("antipodal",VIOLET,1.2,.65)]:
        for (i,j),k in zip(pairs,pair_kind):
            if k==kind:ax.plot(*ico[[i,j]].T,color=col,lw=lw,alpha=alpha)
    ax.scatter(*ico.T,color=NAVY,s=28,depthshade=False);ax.set_box_aspect((1,1,1));ax.set(xlabel="x",ylabel="y",zlabel="z",title="Unit-radius marked icosahedron");ax.view_init(22,-52)
    bar.axis("off");bar.text(.04,.79,"All 66 unordered pairs",fontsize=19,weight="bold",color=NAVY)
    for y,txt,col in [(.62,"30 short chords",GOLD),(.49,"30 long chords",TEAL),(.36,"6 antipodal pairs",VIOLET)]:bar.text(.08,y,txt,fontsize=17,color=col)
    bar.text(.04,.18,r"$\dfrac{(\mathrm{short})^2}{(\mathrm{long})^2}=$",fontsize=16,color=NAVY);bar.text(.12,.07,r"$\dfrac{2-2/\sqrt{5}}{2+2/\sqrt{5}}=c_0=\phi^{-2}$",fontsize=19,color=GOLD);finish(fig,12,"Context: the marked icosahedral chord ratio realizes $c_0$")

for fn in (fig01,fig02,fig03,fig04,fig05,fig06,fig07,fig08,fig09,fig10,fig11,fig12):fn()
print("Rendered 12 figures; saved numerical inputs to data/figure_values.json and data/figure_arrays.npz")
