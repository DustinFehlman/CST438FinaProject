
import { Link } from 'react-router';

const Main = (props) => {
    return(
      <div>
        <div class="pure-menu pure-menu-horizontal">
            <a href="#" class="pure-menu-heading pure-menu-link">B.T.T </a>
            <ul class="pure-menu-list">
                <li class="pure-menu-item"><Link to="/" className="pure-menu-link">Sign In</Link></li>
                {/* <li class="pure-menu-item"><a href="#" class="pure-menu-link">Login</a></li> */}
            </ul>
        </div>
        
        <h1>Better Transportation Transparency (B.T.T)</h1>
        
        <Login />
      
      </div>
    )
}