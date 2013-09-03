class ContestsController < ApplicationController

  def show
    @contest = Contest.find_by_slug(params[:id])
    @contest_votes = @contest.contest_entries.collect{|c| {title: c.title, vote: c.votes.count}}.sort_by{|e| -e[:vote]}

  end

  def vote
    @contest_entry = ContestEntry.find(params[:id])
    @vote = @contest_entry.votes.create(ip: request.remote_ip.to_s )
    flash[:notice] = "Your Vote for #{@contest_entry.title} has been submitted ." if @vote
    redirect_to contest_path(@contest_entry.contest.slug)
  end

end
