// import Button from '@mui/material/Button';
// import {  purple,  } from '@mui/material/colors';
// import { createTheme,ThemeProvider } from '@mui/material/styles';
import { useNavigate } from "react-router-dom"
export default function Home() {
    const navigate = useNavigate();

    // const theme = createTheme({
    //     palette: {
    //       primary: {
    //         main : '#FFFFFF'
    //       },
    //       secondary: purple,
    //     },
    //   });
    return (
        // <ThemeProvider theme={theme}>
        <div className="main-content">
                <p className="main-greeting">Hi, my name is </p>
                <h1 className='main--title'>Kalkidan Demes</h1>
              <h3 className='main--subtitle'>A Software engineer with experience in designing, developing and testing scalable mobile and web applications across different platforms. </h3>
              <button className="chat-box" type="button"
              onClick={()=> navigate('portfolio')}
              ><p  >Get in Touch</p></button>
        </div>
        // </ThemeProvider>
      
    
    )
}