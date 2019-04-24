class AllFruits extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            username: null,
            email: null,
            password: null
        };
    }

    componentDidMount() {
        fetch('/register')
            .then((response) => { return response.json() })
            .then((json) => { 
                // console.log(json);
                this.setState({ 
                    username: json.username,
                    email: json.email,
                    password: json.password
                }) 
                
            });
    }

    render() {
        return(
            <div>
                <div>
                <p>username: {this.state.username}</p>
                </div>
                
                <div>
                <p>email: {this.state.email}</p>
                </div>
                
                <div>
                <p>password: {this.state.password}</p>
                </div>
            </div>
        )
    }
}

