package Runnable

import AppModel.LoginAppModel
import Vista.Login
import org.uqbar.arena.Application

class RunAplication extends Application {
	
	new(BuildBootstrap bootstrap) {
		super(bootstrap)
	}
	
	override protected createMainWindow() {
		new Login(this, new LoginAppModel())
	}
	
	static def void main(String[] args) {
		new RunAplication(new BuildBootstrap).start()
	}
}
