package com.kay87.team.vo;

public class Hobby {
		private String hobby;

		public Hobby(String hobby) {
			super();
			this.hobby = hobby;
		}

		public Hobby() {
			super();
		}

		public String getHobby() {
			return hobby;
		}

		public void setHobby(String hobby) {
			this.hobby = hobby;
		}

		@Override
		public String toString() {
			return "Hobby [hobby=" + hobby + "]";
		}
		
		
}
