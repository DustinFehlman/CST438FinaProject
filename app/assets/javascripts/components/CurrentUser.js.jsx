class CurrentUser extends React.Component {

    constructor(props) {
        super(props);
        username: '';
    }

    componentDidMount() {
        fetch('/getCurrentUser')
            .then((response) => { return response.json() })
            .then((json) => { 
                // console.log(json);
                this.setState({ 
                    username: json.username,
                }) 
                
            });
            console.log(this.state.username)
    }

    render() {
        return(
            <form className="pure-form">
                <div>
                <p>current user: {this.state.username}</p>
                </div>
            </form>
        )
    }
}

