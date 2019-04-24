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

