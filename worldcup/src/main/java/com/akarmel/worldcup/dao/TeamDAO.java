package com.akarmel.worldcup.dao;

import java.util.List;

import com.akarmel.worldcup.entity.Team;

public interface TeamDAO {
	
	public void saveTeam(Team theTeam);
	
	public List<Team> getTeams();

	public Team getTeam(int theId);
}