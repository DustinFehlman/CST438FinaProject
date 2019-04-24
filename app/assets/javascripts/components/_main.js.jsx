
const Main = (props) => {
    return(
        <div>
        <div name="topbar">
            <h1>Better Transportation Transparency (B.T.T)</h1>

            <nav>
              <li><a className="active" href="#home">Better Transportation Transparency (B.T.T)</a></li>
              <li><a href="#news">Sign Up</a></li>
              <li><a href="#">Login</a></li>
            </nav>
        </div>

        
        {/*<Signup/>*/}
        <Login/>
        {/*<CurrentUser/>*/}
        {/*<SubmitComplaints/>*/}

      </div>
    )
}