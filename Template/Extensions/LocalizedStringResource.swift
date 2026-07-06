import Foundation

extension LocalizedStringResource {
    static var delete: LocalizedStringResource {
        .init("Delete", comment: "Button label to \"Delete\" some part of data or functionality in an app. Keep brief.")
    }

    static var save: LocalizedStringResource {
        .init("Save", comment: "Button label to \"Save\" some part of data or functionality in an app. Keep brief.")
    }

    static var cancel: LocalizedStringResource {
        .init("Cancel", comment: "Button label to stop or \"Cancel\" some app action or functionality. Keep brief.")
    }

    static var edit: LocalizedStringResource {
        .init("Edit", comment: "Button label to \"Edit\" as in change or modify some app functionality. Keep brief.")
    }

    static var confirm: LocalizedStringResource {
        .init("Confirm", comment: "Affirmative button, for example, confirming a selection. Keep brief.")
    }

    static var back: LocalizedStringResource {
        .init("Back", comment: "Button label to go back to the previous step or screen. Keep brief.")
    }

    static var next: LocalizedStringResource {
        .init("Next", comment: "Button label, usually used in a series of steps that need to be completed, for example during onboarding. Keep brief.")
    }

    static var `continue`: LocalizedStringResource {
        .init("Continue", comment: "Button label for an app action to proceed to the next step. Keep brief.")
    }

    static var submit: LocalizedStringResource {
        .init("Submit", comment: "Button label to submit an entered value, for example a referral code. Keep brief.")
    }

    static var skip: LocalizedStringResource {
        .init("Skip", comment: "Button label to skip some part of data or functionality in an app. Keep brief.")
    }

    static var somethingWentWrong: LocalizedStringResource {
        .init("Something went wrong, please try again.",
              comment: "A generalised alert message shown to the user when something went wrong. Usually after an error occured making a network request.")
    }

    static var ok: LocalizedStringResource {
        .init("OK", comment: "Button label.")
    }

    static var openSettings: LocalizedStringResource {
        .init("Open settings", comment: "Button label. Usually on a button that when tapped opens the iOS app settings for the app.")
    }

    static var checkOutApp: LocalizedStringResource {
        .init("Check out \(Bundle.displayName ?? "this app") - I think you'll love it!",
              comment: "Share sheet message showcasing the app for users the App Store link was shared with. Placeholder becomes the app name.")
    }
}
