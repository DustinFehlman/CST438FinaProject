class SubmitComplaints extends React.Component {
    
    constructor(props) {
        super(props);
        
        this.state = {
                username: "",
                text: "",
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
        fetch('/submitComplaint', {
            method: 'POST',
            body: JSON.stringify({
                username:this.state.username, 
                password: this.state.text
            }),
            headers:{
                'Content-Type': 'application/json'
            }
        })
        .then((response) => {return response.json()})
        .then(response => console.log('Success:', JSON.stringify(response)))
        .catch(error => console.error('Error:', error));
    }    

    render() {
        return(
            <form className="pure-form pure-form-stacked" onSubmit={this.onSubmit}>
                <h2>Submit Complaint</h2>
                    <label>Username: <b>{this.state.username}</b></label>
                    <span htmlFor="pure-form-message"/>
                    
                    <br/>
    

                    <label>User Complaint</label>
                    <span htmlFor="pure-form-message"/>
                    <textarea 
                        value={this.state.text}
                        onChange={this.onChange}
                        rows="10"
                        cols="60"
                        name="text"
                        type="text"
                        placeholder="Enter complaint here..."
                        required
                    />
                    
                    <br/>
                    
                    <button className="pure-button">
                        Submit
                    </button>
            </form>
            );
    }
}