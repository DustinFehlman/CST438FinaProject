class CurrentUser extends React.Component {

    constructor(props) {
        super(props);
        username: null;
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

