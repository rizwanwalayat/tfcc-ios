//
//  Coordinator.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func welcomeScreen() {
        let vc = WelcomeViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func welcomeSignupScreen(){
        let vc = WelcomeSignUpViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func signUpScreen() {
        let vc = SignUpViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func signUp2Screen() {
        let vc = SignUp2ViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func signUp3TOSScreen() {
        let vc = SignUp3TOSViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.coordinator = self
        navigationController.present(vc, animated: true)
    }
    
    func signInScreen() {
        let vc = SignInViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func forgotPasswordScreen() {
        let vc = ForgotPasswordViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func verificationCodeScreen() {
        let vc = VerificationCodeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func confirmPasswordScreen() {
        let vc = ConfirmPasswordViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func searchSpecialistScreen(){
        let vc = SearchSpecialistViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func patientSubCategoryScreen(){
        let vc = PatientSubCategoryViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func physicianListingScreen(){
        let vc = PhysicianListingViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func fAQsSupportPrivacyScreen(){
        let vc = FAQsSupportPrivacyViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func patientProfileScreen(){
        let vc = PatientProfileViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func physicianProfileScreen(){
        let vc = PhysicianProfileViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func bookingDateTimeScreen(){
        let vc = BookingDateTimeViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func editPatientProfileScreen() {
        let vc = EditPatientProfileViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func patientPastAppointmentScreen() {
        let vc = PatientPastAppointmentDetailViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func patientAppointmentScreen() {
        let vc = PatientAppointmentDetailsViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    func upcomingPastAppointmentScreen() {
        let vc = PatientUpcomingPastAppointmentViewController()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
}
