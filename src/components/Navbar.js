import { Link } from 'react-router-dom'

import kalLogo from '../assets/kal-logo.png'
export default function Navbar() {
    return (
            <nav>
              <img src={kalLogo}  alt="kal-logo"/>
              <ul>
                  <li className='nav-links'>
                    <Link to={"/"}>Home</Link>
                  </li>
                  
                  <li className='nav-links'>
                  <Link to={"/skills"}>Skills</Link>
                  </li>
                  <li className='nav-links'>
                    <Link to={"/experience"}>Experience</Link>
                  </li>
              </ul>            
            </nav>
       
        
    )
}