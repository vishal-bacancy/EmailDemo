class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy update_important_emails ]
  before_action :authenticate_user!

  # GET /emails or /emails.json
  def index
    @q = Email.ransack(params[:q])
    @emails = @q.result(distinct: true).includes(:receivers).where(receivers: { id: current_user.id}).order(:subject)
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(email_params)
    @email.sent_by = current_user

    respond_to do |format|
      if @email.save
        @email.receiver_ids = params[:email][:receiver_ids]
        format.html { redirect_to email_url(@email), notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_important_emails
    @email.update_attribute(:important, !@email.important)

    redirect_to root_path
  end
  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to email_url(@email), notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def important_emails
    @emails = Email.includes(:receivers).where(receivers: { id: current_user.id}).where(important:"true")
  end
  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:subject,:description,:sent_by,:important,group_ids:[])
    end
end
