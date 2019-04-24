class Login extends React.Component {
    
    constructor(props) {
        super(props);
        
        this.state = {
                username: "",
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
                password: this.state.password
            }),
            headers:{
                'Content-Type': 'application/json'
            }
        })
        .then((response) => {return response.json()})
        .then(response => console.log('Success:', JSON.stringify(response)))
        .catch(error => console.error('Error:', error));
        
        try {
            this.props.history.push("/#");
          } catch (e) {
            alert(e.message);
          }
    }    

    render() {
        return(
            <form className="pure-form pure-form-stacked" onSubmit={this.onSubmit}>
                <h2>Login</h2>
                    <label>Username</label>
                    <span htmlFor="pure-form-message"/>
                    <input 
                        value={this.state.username}
                        onChange={this.onChange}
                        name="username"
                        type="text"
                        required
                    />
                    
    
                    <br/>
    
                    <label>Password</label>
                    <span htmlFor="pure-form-message"/>
                    <input 
                        value={this.state.password}
                        onChange={this.onChange}
                        name="password"
                        type="password"
                        required
                    />
                    
                    <br/>
                    
                    <button className="pure-button">
                        Login
                    </button>
            </form>
            );
    }
}