import {Routes, Route} from 'react-router-dom';
import Skills from './Screens/Skills';
import Experience from './Screens/Experience';
import Navbar from "./components/Navbar";
import Home from "./Screens/Home";
import NoMatch from './components/NoMatch';
import SocialLinks from "./components/SocialLinks";
import Footer from './components/Footer.js';
import "./styles/App.css"

function App() {
  return (
   
    <div className="app">
       <Navbar />
       <Routes>
      <Route className="app--page" path='/' element={<Home />}/>
      <Route className="app--page" path='/skills' element={<Skills/>}/>
      <Route className="app--page" path='/experience' element={<Experience/>}/>
      <Route className="app--page" path="*" element={<NoMatch />} />
    </Routes>
    <SocialLinks />
    <Footer />
    </div>
    
  );
}

export default App;
