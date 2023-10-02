import SocialComponent from "./SocialComponent";
import linkedIn from "../assets/linkedIn.png"
import github from "../assets/github.png"
import twitter from "../assets/twitter.jpeg"
import email from "../assets/email.png"
export default function SocialLinks(){
    return (
        <div className="social-links">
                <SocialComponent 
                    id="1"
                    img={linkedIn}
                />
                <SocialComponent 
                    id="2"
                    img={github}
                />
                <SocialComponent 
                    id="3"
                    img={twitter}
                />
                <SocialComponent 
                    id="4"
                    img={email}
                />
                <div className="vertcal-line">

                </div>
              </div>
    );
}

