class EventApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_convention
  def index
    @panels = EventApplication.where(user_id: current_user.id)
  end
  def new
    @panel = EventApplication.new
    @timeslots = {
      'Friday': [
        {
          'time': '8AM to 10AM', 'className': 'non-adult'
        },
        {
          'time': '10AM to 12PM', 'className': 'non-adult'
        },
        {
          'time': '12PM to 2PM', 'className': 'non-adult'
        },
        {
          'time': '2PM to 4PM', 'className': 'non-adult'
        },
        {
          'time': '4PM to 6PM', 'className': 'non-adult'
        },
        {
          'time': '6PM to 8PM', 'className': 'non-adult'
        },
        {
          'time': '8PM to 10PM', 'className': 'all-ages'
        },
        {
          'time': '10PM to 12AM', 'className': 'all-ages'
        },
        {
          'time': '12AM to 2AM', 'className': 'all-ages'
        }
      ],
      "Saturday": [
        {
          'time': '8AM to 10AM', 'className': 'non-adult'
        },
        {
          'time': '10AM to 12PM', 'className': 'non-adult'
        },
        {
          'time': '12PM to 2PM', 'className': 'non-adult'
        },
        {
          'time': '2PM to 4PM', 'className': 'non-adult'
        },
        {
          'time': '4PM to 6PM', 'className': 'non-adult'
        },
        {
          'time': '6PM to 8PM', 'className': 'non-adult'
        },
        {
          'time': '8PM to 10PM', 'className': 'all-ages'
        },
        {
          'time': '10PM to 12AM', 'className': 'all-ages'
        },
        {
          'time': '12AM to 2AM', 'className': 'all-ages'
        }
      ],
      'Sunday': [
        {
          'time': '8AM to 10AM', 'className': 'non-adult'
        },
        {
          'time': '10AM to 12PM', 'className': 'non-adult'
        },
        {
          'time': '12PM to 2PM', 'className': 'non-adult'
        },
        {
          'time': '2PM to 4PM', 'className': 'non-adult'
        }
      ]
      }
  end

  def create
    @panel = EventApplication.create(panel_params)
    
  end
  

  private

  def set_convention
    @convention = Convention.where(status: 'active').first
  end

  def panel_params
    params.require(:event_application).permit(
      :event_name,
      :external_desc,
      :internal_desc,
      :host_stage_name,
      :age_rating,
      :agreed_to_terms,
      :first_choice,
      :second_choice,
      :third_choice,
      :event_length,
      :previous_convention,
      :user_id,
      :convention_id
    )
  end
  
  
  
  
end
