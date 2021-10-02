(	try(closeRolloutFloater Floater01) catch()


	rollout Floater02 "Freeze Transform"
		(
			label type01 "Select the object first then press the buttons"
			label type02 "to freeze or unfreeze the transforms"
			
			button button01 "FREEZE"  pos:[50,50] width:130 height:25
			on button01 pressed do
				(
					for obj in selection do if superClassOf obj == camera then
					( 
						setTransformLockFlags obj #all
						setTransformLockFlags obj.target #all
					)
					
					else
					(
						setTransformLockFlags selection #all
					)
				)
				
			button button02 "UNFREEZE" pos:[50,90] width:130 height:25
			on button02 pressed do
				(
					for obj in selection do if superClassOf obj == camera then
					( 
						setTransformLockFlags obj #none
						setTransformLockFlags obj.target #none
					)
					
					else
					(
						setTransformLockFlags selection #none
					)
				)
		)
	
	Floater01 = newRolloutFloater "Title" 250 145
	addRollout Floater02 Floater01
)
