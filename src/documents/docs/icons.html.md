---
layout: docs
title: Icons
slug: basic
lead: "SVG icon sprite"
styles: ['/styles/bootstrap-theme.css','/styles/bossrevolution.css']
---

# Icon System

## Usage

There are two methods of using icons in the project:

1. inline svg icons (preffered)
2. icons with background images



### Inline SVG icons

Using inline SVG icons is preffered.

Their advantages:

* Scalable
* Resolution independent
* Can be recolored with CSS
* Can be animated

Disadvantages:

* Pixel-perfect icons can be blurred

To insert SVG icon place `svg` tag with classnames and link to icon shape:

```html
<svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
    <use xlink:href="#i--inter-calling"></use>
</svg>
```

Classnames: `i` means «icon», `i--inter-calling` — name of the icon.

`xlink:href="#i--inter-calling"` — here `i--inter-calling` is a link to corresponding vector shape. Same as name of the icon.

`xmlns="http://www.w3.org/2000/svg"` — XML namespace required for IE.


### Background-image icons

To insert background-image icon in HTML-markup use the following code:

```html
<span class="i i--inter-calling"></span>
```

Where classname `i` means «icon», `i--inter-calling` — name of the icon.

Icon classes can be applied to any tag (`span`, `div`, `i`) but that tag should be empty.

Background-image icons also uses SVG as background.

### Degradation to PNG

Both inline SVG and background-image icons has PNG degradation for browsers that don't support SVG

## How to add new icon

1. Put svg icon in `src/files/icons/svg/`.
2. Run in console `grunt makesprites`.

# Icons

## Services

<table class="demo-list">
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">International Calling</td>
        <td class="demo-var"><code>i--inter-calling</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--call-me">
                    <use xlink:href="#i--call-me"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Call Me</td>
        <td class="demo-var"><code>i--call-me</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-airtime-top-up">
                    <use xlink:href="#i--inter-airtime-top-up"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">International Mobile Top Up</td>
        <td class="demo-var"><code>i--inter-airtime-top-up</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--domestic-airtime-top-up">
                    <use xlink:href="#i--domestic-airtime-top-up"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Domestec Mobile Top Up</td>
        <td class="demo-var"><code>i--domestic-airtime-top-up</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--money-transfer">
                    <use xlink:href="#i--money-transfer"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Money Transfer</td>
        <td class="demo-var"><code>i--money-transfer</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--visa-virtual">
                    <use xlink:href="#i--visa-virtual"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Visa<sup>&reg;</sup> Virtual</td>
        <td class="demo-var"><code>i--visa-virtual</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--prepaid-visa-card">
                    <use xlink:href="#i--prepaid-visa-card"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Prepaid Visa<sup>&reg;</sup> Card</td>
        <td class="demo-var"><code>i--prepaid-visa-card</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--bill-pay">
                    <use xlink:href="#i--bill-pay"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Bill Pay</td>
        <td class="demo-var"><code>i--bill-pay</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--friends-forever">
                    <use xlink:href="#i--friends-forever"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Friends Forever</td>
        <td class="demo-var"><code>i--friends-forever</code></td>
    </tr>
</table>

## Services as background

<table class="demo-list">
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <span class="i i--inter-calling-large"></span>
            </div>
        </td>
        <td class="demo-name">International Calling</td>
        <td class="demo-var"><code>i--inter-calling</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <span class="i i--call-me-large"></span>
            </div>
        </td>
        <td class="demo-name">Call Me</td>
        <td class="demo-var"><code>i--call-me</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <span class="i i--inter-airtime-top-up-large"></span>
            </div>
        </td>
        <td class="demo-name">International Mobile Top Up</td>
        <td class="demo-var"><code>i--inter-airtime-top-up</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <span class="i i--domestic-airtime-top-up-large"></span>
            </div>
        </td>
        <td class="demo-name">Domestec Mobile Top Up</td>
        <td class="demo-var"><code>i--domestic-airtime-top-up</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <span class="i i--money-transfer"></span>
            </div>
        </td>
        <td class="demo-name">Money Transfer</td>
        <td class="demo-var"><code>i--money-transfer</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <span class="i i--visa-virtual"></span>
            </div>
        </td>
        <td class="demo-name">Visa<sup>&reg;</sup> Virtual</td>
        <td class="demo-var"><code>i--visa-virtual</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <span class="i i--prepaid-visa-card">
                    <use xlink:href="#i--prepaid-visa-card"></use>
                </span>
            </div>
        </td>
        <td class="demo-name">Prepaid Visa<sup>&reg;</sup> Card</td>
        <td class="demo-var"><code>i--prepaid-visa-card</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <span class="i i--bill-pay"></span>
            </div>
        </td>
        <td class="demo-name">Bill Pay</td>
        <td class="demo-var"><code>i--bill-pay</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default">
                <span class="i i--friends-forever"></span>
            </div>
        </td>
        <td class="demo-name">Friends Forever</td>
        <td class="demo-var"><code>i--friends-forever</code></td>
    </tr>
</table>

## Service Features

<table class="demo-list">
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--quick-call">
                <use xlink:href="#i--quick-call"></use>
            </svg>
        </td>
        <td class="demo-name">Quick Call</td>
        <td class="demo-var"><code>i--quick-call</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--speed-dial">
                <use xlink:href="#i--speed-dial"></use>
            </svg>
        </td>
        <td class="demo-name">Speed Dial</td>
        <td class="demo-var"><code>i--speed-dial</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--move-service">
                <use xlink:href="#i--move-service"></use>
            </svg>
        </td>
        <td class="demo-name">Move Service</td>
        <td class="demo-var"><code>i--move-service</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--security-code">
                <use xlink:href="#i--security-code"></use>
            </svg>
        </td>
        <td class="demo-name">Security Code</td>
        <td class="demo-var"><code>i--security-code</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--print-virtual-card">
                <use xlink:href="#i--print-virtual-card"></use>
            </svg>
        </td>
        <td class="demo-name">Print Virtual Card</td>
        <td class="demo-var"><code>i--print-virtual-card</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--add-numbers">
                <use xlink:href="#i--add-numbers"></use>
            </svg>
        </td>
        <td class="demo-name">Add Numbers</td>
        <td class="demo-var"><code>i--add-numbers</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--change-us-number">
                <use xlink:href="#i--change-us-number"></use>
            </svg>
        </td>
        <td class="demo-name">Change US Number</td>
        <td class="demo-var"><code>i--change-us-number</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--change-notification-number">
                <use xlink:href="#i--change-notification-number"></use>
            </svg>
        </td>
        <td class="demo-name">Change Notification Number</td>
        <td class="demo-var"><code>i--change-notification-number</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <svg xmlns="http://www.w3.org/2000/svg" class="i i--share-your-number">
                <use xlink:href="#i--share-your-number"></use>
            </svg>
        </td>
        <td class="demo-name">Share Your Number</td>
        <td class="demo-var"><code>i--share-your-number</code></td>
    </tr>
</table>

## Page icons 

<table class="demo-list">
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--terms-conditions">
                    <use xlink:href="#i--terms-conditions"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Terms &amp; Conditions</td>
        <td class="demo-var"><code>i--terms-conditions</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--privacy-policy">
                    <use xlink:href="#i--privacy-policy"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Privacy Policy</td>
        <td class="demo-var"><code>i--privacy-policy</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--faqs">
                    <use xlink:href="#i--faqs"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Frequently Asked Questions</td>
        <td class="demo-var"><code>i--faqs</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-default plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--download-the-app">
                    <use xlink:href="#i--download-the-app"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Download the App</td>
        <td class="demo-var"><code>i--download-the-app</code></td>
    </tr>
</table>

## My account

<table class="demo-list">
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--phone-number">
                    <use xlink:href="#i--phone-number"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Phone Number</td>
        <td class="demo-var"><code>i--phone-number</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--unlim">
                    <use xlink:href="#i--unlim"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Unlimited Plan</td>
        <td class="demo-var"><code>i--unlim</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--recent-transactions">
                    <use xlink:href="#i--recent-transactions"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Recent Transactions</td>
        <td class="demo-var"><code>i--recent-transactions</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--balance">
                    <use xlink:href="#i--balance"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Balance</td>
        <td class="demo-var"><code>i--balance</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--time">
                    <use xlink:href="#i--time"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Time</td>
        <td class="demo-var"><code>i--time</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--number-to-top-up">
                    <use xlink:href="#i--number-to-top-up"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Number to Top Up</td>
        <td class="demo-var"><code>i--number-to-top-up</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt-highlight plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--call-history">
                    <use xlink:href="#i--call-history"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Call History</td>
        <td class="demo-var"><code>i--call-history</code></td>
    </tr>
    <tr>
        <td class="demo-preview">
            <div class="plate plate-alt-highlight plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--redeem-br-card">
                    <use xlink:href="#i--redeem-br-card"></use>
                </svg>
            </div>
        </td>
        <td class="demo-name">Redeem BR Card</td>
        <td class="demo-var"><code>i--redeem-br-card</code></td>
    </tr>
</table>

# Icon plate

<table class="demo-list">
    <tr>
        <th class="demo-var"><code>.plate</code> + style [ + size ]</th>
        <th class="demo-var"><code>.plate-large</code></th>
        <th class="demo-var">default</th>
        <th class="demo-var"><code>.plate-small</code></th>
    </tr>
    <tr>
        <th class="demo-var"><code>.plate-default</code></th>
        <td class="demo-preview">
            <div class="plate plate-default plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-default">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-default plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
    </tr>
    <tr>
        <th class="demo-var"><code>.plate-default-inset</code></th>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-default-inset">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-default-inset plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
    </tr>
    <tr>
        <th class="demo-var"><code>.plate-alt</code></th>
        <td class="demo-preview">
            <div class="plate plate-alt plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-alt">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-alt plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
    </tr>
    <tr>
        <th class="demo-var"><code>.plate-alt-highlight</code></th>
        <td class="demo-preview">
            <div class="plate plate-alt-highlight plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-alt-highlight">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-alt-highlight plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
    </tr>
    <tr style="background-color: #EBF0F5;">
        <td class="demo-preview"><code>.plate-white</code></td>
        <td class="demo-preview">
            <div class="plate plate-white plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-white">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <th class="demo-preview">
            <div class="plate plate-white plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </th>
    </tr>
    <tr style="background-image: url('../../img/bg-small.jpg')">
        <td class="demo-preview"><code>.plate-transp</code></td>
        <td class="demo-preview">
            <div class="plate plate-transp plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-transp">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <th class="demo-preview">
            <div class="plate plate-transp plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </th>
    </tr>
    <tr style="background-image: url('../../img/bg-small.jpg')">
        <td class="demo-preview"><code>.plate-transp-white</code></td>
        <td class="demo-preview">
            <div class="plate plate-transp-white plate-large">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <td class="demo-preview">
            <div class="plate plate-transp-white">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </td>
        <th class="demo-preview">
            <div class="plate plate-transp-white plate-small">
                <svg xmlns="http://www.w3.org/2000/svg" class="i i--inter-calling">
                    <use xlink:href="#i--inter-calling"></use>
                </svg>
            </div>
        </th>
    </tr>
</table>