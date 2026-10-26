Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034522;
	b=4VIBTzBnVB91CQuGXk7hUw+befD035qTo6EAMCgPFqhGQNmWc1rfiYSBACQAjh9TCtQS
	 JPuuL8oJxPw7BhlY4NxMwrfzrsh0gWGNrFqQ4U+A020kD/tLNiJIHELW/WaKuQthgi6B+
	 QjWlLLyj1gonSGSh2s+4zakJBAPpj9Zc4409waZ9mjiIyoucen4CaLHixsQv0K9I2yrm5
	 Q37fV0CnNgiE+NeeEfqS9tqyMnqDV45V0yt5/3FFA/BcdAXSJlW0J9jl1nPH9zTOBG0p7
	 3Bnl0VfS5S0aPxRLlwsG3RNVafXxSj60EVIfYP2pAhMzj02cZILWEszjj1PYK0igodw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
	b=eZbBvuq4ztMOsPJuhBRs4Hk0SgdyhbyKNRoz5lATG20Qn9J0IkSM6E+l7gK5pnw8j1x4
	 7GBH9YdeL9/5h2AQMUjiwuQOmnPEaborcpSz3+uTMDeHo6Cq5+dW/UDAf4lIRpe3vSSuI
	 SR+fPqPIBMgwPxK9CVkTvlqxYxfw8lrtLPEHXRobYpLIotPW5xLp8lBRmFkcsD37MZyhb
	 cV2SYy/Eioz+phiPPW6V92Yzga4P7VNfccxBWdXCWFqcyMd1JeMBRi4+VUaVeLExSBA7H
	 umKg8XgkPaUQ+ju8Q+G/CvRgVJndVyT7GRhJEfAgPpzqznTyttYNbpdwOws0Q62V0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C508606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 17:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C508606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so31157935e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793034520; x=1793639320; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=Imn2WVeJmrsTcniPIqa5MczKk/j0HQLC5R50ZsdY0tt/KPGgosIRsrOYx5CjSAKpCg
         sUBCaMHuKHtTEabCxW/nZHVbwkoUsi7CiUzDGWAppSDFZW/Rqi/35XGKmoO4C22uCRTs
         dNOmXiy12f46t/57YuL9TTcLH4h1BJnkQMeMp6zIdvLE2Vh3uwvwI2GxuU6YRQzem5TN
         Bxk/CojGBw8QhkB0nnalb+Fn8e3oifdszHpxNFWH7CoOgjH8lS1TQDpYKy8b2F4aypXO
         aRWt0jL6SoxN0Wn78lEPFZmBCaMtN11bbCphCxe0QfWvSKr3kuYrD6VvG5GifU/KGxvh
         0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034520; x=1793639320;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=jRTDvDi3kDAdiXAzOlPuHQC2/w9/CgngX7eBiepwWAtfsS8BPLkMYDl16u6UeKEVhf
         N31btd6mB3ehqsBaSOhwQ8yQFsrsq1tF1jJfUbXJyHvSABd4gxlEe7v7S43mY/Wkar6x
         c2pgBG5GMnJGA9KBXbNyX8kB0dUKxKEE7bjM4asFhhbzGZAnVIhQAznc4jdpT3s9voxb
         Ln8RB0dEkpw7qv6NrbD8F6Uuom4TBZ4PhBuN+57+A5nS9SZcfNcSBvykIyFUbc5k32Gw
         oSbbGZMfMCsZBU72UUF9RIdKByUj1WkeV4vqW0ZYXxuST8tEwC3rY3GklsIZ8NmNpLXX
         lo0g==
X-Gm-Message-State: AFq9FYKbrgtj5HB1Z9zpyqlW+gV0KAQ3mrMASF4KmyMON5Zpczw7d16R
	17Ocw9S8pTWq5PP0fFWds8dhfI3LEDlO0VpzTn6X/2L6QRceWJuyDv4g2EZThgtUxIw=
X-Gm-Gg: AYBFou32vH70xDmQYVUJ5PEgMf7+HQcCGApyZDeYXRjGyOpM8hB4GpNbiKqR/MB06uL
	muv0Q/QoCuOqBa7VgyWdl3HoXfYaU/J9ZMeOlLCRVJlDcWJL6JtyzvjJ7x+8O/D7IjE82h9wYTc
	VFribC25l6okWQ+taxcNEE9P35QQwSa9zFmwErb2hR1TJoZaQ3goJ38QsYRcbrcVYVoVeA5H/Nr
	u3PXf1cDFUOsML/sVV5/V3uRQE0DzS7Dv4FaZ8c+hh8+5xv8llK/ijRUUdDd1KOI7Vg0fVOFMF0
	llR0PM8PFKDcJPbu+PxjY8RPU8jT8eG9zuTnNUKHqcbyFB2vTLQYDNesfzXorq/eb/jLzNUS8/u
	Gsx1rSgnYyYygz03L770Q6TBGCxAspavnYitO3PLPlsAKfbrsETjNek1NkyEe5087z8o2zhMQ6S
	izfkRb8qmUFvujKr7+hMhWFjoWOkQhdYnKVbHyA7jDeibdHqUU5UP12oQEW3CK8yLPRiJF7cgm+
	MI6AFo77yMZExnB2NVBlTJI81zmP+rbOo5GuMIj5Kpk82CmxYHOktDB5T7RsJlIQIxfjgn+aMEK
	5dZPpv1rOedcJ1xJMJBio36cCHVzZoUzuIvKmyN9SGmu/D1h
X-Received: by 2002:a05:600c:3f07:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4a35acb3e77mr124957225e9.27.1793034520264;
        Mon, 26 Oct 2026 10:08:40 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm17070976f8f.2.2026.10.26.10.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:08:39 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 18:08:38 +0100
Message-Id: <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: <ferreira@se-rg.io>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>

Hi S=C3=A9rgio,

On Sun Oct 25, 2026 at 8:51 AM CET, S=C3=A9rgio Ferreira via B4 Relay wrote=
:
> From: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
>
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
>
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
>
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
>
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
>
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
>
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
>
> Assisted-by: LLM
> Signed-off-by: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
> ---

I tested this on a Medion SPRCHRGD 14 S1, but the controls are inverted.
When increasing the backlight lightness it actually decreases it, and
vice versa.

```
% cat /sys/class/backlight/backlight/max_brightness
4095

% echo 1 | sudo tee /sys/class/backlight/backlight/brightness
1 # BRIGHT

% echo 2000 | sudo tee /sys/class/backlight/backlight/brightness
2000 # LESS BRIGHT

% echo 4095 | sudo tee /sys/class/backlight/backlight/brightness
4095 # OFF

% echo 0 | sudo tee /sys/class/backlight/backlight/brightness
0 # OFF
```

Moreover, I see that from `/sys/kernel/debug/pwm` the period
request differs from the actual:

```
 pwm-3   (backlight           ): requested
    requested configuration:  enabled, 498418/500000 ns, normal polarity
    # with brightness set at 4090:
    actual configuration:     enabled, 425834/425834 ns, normal polarity
    # with brightness set at 2:
                                            0/425834 ns, normal polarity
```

This probably causes the top 250 values to be all at the same
brightness. Not a big deal probably.

Do you have the same behavior? Can you send the EDID of your panel?=20

Thanks,
Ettore
