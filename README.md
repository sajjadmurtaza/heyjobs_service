# Heyjobs Service  

Detect discrepancies between local and remote state.
***
### Workflow - How does it work?

**Setup**
* first clone the directory  ``` git clone git@github.com:sajjadmurtaza/heyjobs_service.git'
                      ```
 *  ```cd heyjobs_service```
 *  ```bundle install ```
 * There is two way to test it.
    * rake
        * ```rake get_discrepancies```
    * direct run
        * ```ruby lib/discrepancy_detect.rb```
        
It will return out in array of hash format
    
The following diagram show the process/workflow of the application. e.g

```ruby
  [
    {
       :remote_reference=>"1",
       :discrepancies=>{
                        :status=>{
                                    :remote=>"enabled", 
                                    :local=>"paused"
                                  }
                        }
    }
  ]
```
***
**Calling methods workflow**

                                
 
    │    1. DiscrepancyDetect.call                │
    │ mehods use to get diff b/w local & remote   │ 
    ├────────────────────────────────────────────>│     
    │                                             ├ 2. Load data by using ComaignData class
    │                                             │ and load local & remote data 
    │                                             ├ 3. call get_discrepancies method by pass local and remote compaigns
    │                                             ├ 4. itterate eeach local compaign, first find remote compaign by using find_remote_campaign method
    │                                             │ and then get difference and save in hash and then push differenc e into array
    │                                             │ if there will no remote compaign found then  error message will be pushed      
    │    4. get diff b/w local and remote         │               
    │<────────────────────────────────────────────│
    

***

### Specs

run ``` bundle exe rspec   ``` to run the tests


![alt text](https://raw.githubusercontent.com/sajjadmurtaza/heyjobs_service/master/heyjobs.png "heyjobs Screenshot")

