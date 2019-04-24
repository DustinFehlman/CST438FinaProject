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
                <p>username:</p>
                {this.state.username}
                </div>
                
                <div>
                <p>email:</p>
                {this.state.email}
                </div>
                
                <div>
                <p>password:</p>
                {this.state.password}
                </div>
            </div>
        )
    }
}

