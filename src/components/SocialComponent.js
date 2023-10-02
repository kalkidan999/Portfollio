export default function SocialComponent(props){
   
    return (
        <div className="circle">
           <img src={props.img} alt="social-logo" width= "30px"></img>
        </div>
    );
}