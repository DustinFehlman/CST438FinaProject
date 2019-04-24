class Login extends React.Component {

    constructor(props) {
        super(props);
        
        this.state = {
                username: "",
                email: "",
                password: ""
        };
        
        this.onChange = this.onChange.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
    }
    
    onChange(e){
        this.setState({ [e.target.name]: e.target.value});
    }
        
    onSubmit(e){
        e.preventDefault();
        // console.log(this.state)
        fetch('/register', {
            method: 'POST',
            body: JSON.stringify({
                username:this.state.username, 
                email:this.state.email,
                password: this.state.password
            }),
            headers:{
                'Content-Type': 'application/json'
            }
        })
        .then((response) => {return response.json()})
        .then(response => console.log('Success:', JSON.stringify(response)))
        .catch(error => console.error('Error:', error));
        console.log(this.state);
    }

    render() {
        return(
            <form onSubmit={this.onSubmit}>
                <h2>Join our community!</h2>
                
                
                <div className="form-group">
                    <label className="control-label">Username</label>
                    <input
                        value={this.state.username}
                        onChange={this.onChange}
                        type="text"
                        name="username"
                        className="form-control"
                    />
                    
                    <br/>
                    <br/>
                    
                    <label className="control-label">Email</label>
                    <input
                        value={this.state.email}
                        onChange={this.onChange}
                        type="text"
                        name="email"
                        className="form-control"
                    />
                    
                    <br/>
                    <br/>
                    
                    <label className="control-label">Password</label>
                    <input
                        value={this.state.password}
                        onChange={this.onChange}
                        type="password"
                        name="password"
                        className="form-control"
                    />
                    
                    <br/>
                    <br/>
                    
                    <div className="form-group">
                        <button className="btn btn-primary btn-lg">
                        Sign Up
                        </button>
                    </div>
                    
                    <div className="form-group">
                        <button className="btn btn-primary btn-lg">
                        Sign Up
                        </button>
                    </div>
                    
                </div>
            </form>
                );
    }

}