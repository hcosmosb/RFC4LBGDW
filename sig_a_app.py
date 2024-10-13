import numpy as np

def sig_a_app(dl_a_Angst, T_in):
    # Constants
    c_sl = 2.99792e10  # speed of light in cm/s
    k_boltz = 1.380648e-16  # Boltzmann constant in erg/K
    m_p = 1.6726219e-24  # proton mass in g
    pi = np.pi
    l_a_Angst = 1216.0  # Lyman-alpha wavelength in Angstroms

    # Calculations
    a_V = 4.7e-4 * (T_in / 1e4)**(-0.5)
    dnu_a = c_sl / ((dl_a_Angst + l_a_Angst) * 1e-8) - c_sl / (l_a_Angst * 1e-8)
    Delnu_D = 2.46e15 * np.sqrt(2.0 * k_boltz * T_in / (m_p * c_sl**2))
    
    x = np.abs(dnu_a / Delnu_D)
    x2 = x**2
    z = (x2 - 0.855) / (x2 + 3.42)

    if z <= 0:
        q = 0.0
    else:
        q = z * (1 + 21 / x2) * a_V / pi / (x2 + 1) * (0.1117 + z * (4.421 + z * (-9.207 + 5.674 * z)))
    
    phi_app = (q + np.exp(-x2) / np.sqrt(pi))
    
    # Final result
    sig_a_app = phi_app * 5.889e-14 * (T_in / 1e4)**(-0.5)
    
    return sig_a_app
