class AllComplaints extends React.Component {

    constructor(props) {
        super(props);
        text: '';
    }

    componentDidMount() {
        fetch('/allComplaints')
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
                <p>current user: {this.state.text}</p>
                </div>
            </form>
        )
    }
}

