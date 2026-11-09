Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221377;
	b=2JGt6TawYUpZXQs5Fg1lprguglK51aU65r8J6jhSRpZsfkM6K+5lhItduedMxRs9eczP
	 VS6hNBL7TAvO9pwccN/wn/sOdz6ld3274B5S6DRyDt4gbBgiIN+lsB56b64bMHb85dH/Y
	 Wqn2n0f0Lucz/CL0qXdck87xgte/tB9fw04W6m5jgFmr2ZFCKnenXC5ZVc/WEoVP6kg3x
	 jPmEu5iqmO00A2ePZFhDHL7qjUGTxa9J1tfbFjTWxZhJBa/sAJD7z9L47DQL5RBq5/0/j
	 vMXPukuRXifPetMSsNJpfXwINYAXciH3QdvrlZEypt76mTUSY8i5M/gsZNm1MrZjAjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
	b=OGbkgj4ZcKvSTY9rj8qYzzvaqd5Rv4kO6S6OXsCWOL6YcUadhiNxsvFabU3NtbLKzebR
	 iqGwA3IrEiv1x14oCiCd4mdLyf1xWtF5164YrIHfTBeLqX0TslEzmWm95JhJRYcPDwJw0
	 36ws1kGyrAfvFKYsiJQcs3XoguwoHHSMtxTAFPlhVeO9UEwLmRUs6vIkennSO1NBwQmpI
	 2VicuoX7rKxPhC0Qf0sLApGFqIFuhH4NTyPDTSw2yQJfjLF52Huym9IJI3CbcfbaVTEcZ
	 emUlVNneWVr9rjxgJU+lWCeHw+AhkNUy+68Y731ZDYi+SK/9fL05BVYXJrAcUzIKxeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336B606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A336B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3240435ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221376; x=1794826176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=mhuvuvXX0rIaEIqZ3DzR1FBgAu21NuHPq7Q31T7dFQOqeblaWlH9D1o+q9ykUC+Z6D
         sfTUBtHFNuNKu/0W97XuHP23fA2bJkNE9yggNCNrR1M/vXLFuLRK/l+/fLLmYYPLiXSA
         d0xl8e8ZMlhvge/faXWUC8mqUhtRzeYCOJCc2xWMPAB5WHlH3Q9NzA6xDRWOgNpKRjds
         FZQXe5ciiNXD5CJBbKjeX9XJoKsKHtdSV3RKYWgG5adtQEhRNTl276P2PJ99JamMM5d8
         iHn8Z+3fmQOdLTzBDWrPh62ezoPUQumOtOcgdtc9VgPTxHf/U+cbZhNGnkiuuSsrDckI
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221376; x=1794826176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=v8bzCjvY14udcrjXM5iqz5lUu0rD+CEfkQQZ+VIsC/YNVT/zcGX2l4SDaGTYP/1nAF
         HccdEGN/CtjQ4PUgI4cJADMvYWs4gGAbQKNynyBFG3S+38FwIG1s5dFRVnPEx9/C3BI3
         S/CfpeqjDyJDpVvVargMxwiJSuCg9egQMqy3Bb+0xKckIbCmaeHLgjPVN4RJS3my7DWJ
         EkifQPZXt2V6m6o6y6v2vFWqS4yci3qBBFNAv3PF/h9sL6SsOSDTurqAfK1Jv0NxpvSI
         cflroyjG76QVdenyrL/F6RkhlC77uKJl1Ium144Li/h+CrqeXqQWngR6rs+mXhaObjGv
         Jf3w==
X-Forwarded-Encrypted: i=1; AL+hErH52vGRVSZvZ5rlCB9npHnEQV40gDDaSwZ8bWmvYZehQ98UhMisTwCr3Pl1JCU3TOBb1JKGlh/0GjjEJwSN@vger.kernel.org
X-Gm-Message-State: APuU4Z/aleqLd+R6yWRni7kBoul/lPKjitdOcauZd3slklYMt2WVIsVy
	SesxFz/Jkh4bwvYBj/VPeVJ+U0sPPWiIsMfasWdWtCJLSWIfL3S24R8D
X-Gm-Gg: AYBFou0Q69Xo8xfpfqIs2KGCEFaS0zFxwIeMk4kxOmxcvTcHmgFE6B2BQRsnXRtFZvp
	+kZye2MSRcAuXwbNYHbLRJSEZQuGEGk5cOiPcHX4qkVJZMHe0cIoV3XKfyfvJnPNCO2p51OEgSw
	KEuyc46yhmOxrkwj0IM9ilX6CswtxqSKjksCp7ULhnIxQIlQZz7mR7S1XqIOpXhMLWsylq49Smm
	LA+qM8y2Bp7yrq9jqCB0HP0m0zKzOR9vrwsSpJpIt9/XwP7Gk4tnzPLInxyEVa+7ru7Vo2oVJWM
	Dtu86e4QfvPIOviFmnHOsjlGHY/m0VVMm7hp/2WGLdtJGr6Gjm22g2LaWvCvs4ul4HvsYP/Eq91
	P1eMuTIjvjVXTGhyuowPtuvX0zI7ERw1Vq3aYKRVxLAA41jnav1Th0wGnVKRa7zBS/C59TdxUEh
	H4jOHUz96ReeYqJCJ9zHz+a3nfCiNsoR8ldqzcSADoAC10ikPU+aK2tLqwXnKJww+Dz+2yukfdb
	BxhJFU5bab/BMLEB/9aTlYfOac5flxqhXIBp+J/5zgiY7fAcxIZWij+gLKI6DAfN7XsqJ5LkTQo
	PYL0pDEMHgrnb95wsAul8eBcSOEEhwx2NxoF6fFfm3vxgF59rD2a1nkUmABB3MWKWpN0C4dlmT5
	MKjgHoV/1Nw5j/3Z2gkYKV7RtxHhJql6t2zIar/pjYQEBZoUZHnsR9S6bDSvaF39P6rM=
X-Received: by 2002:a17:902:d588:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2ed8375ffaamr41615415ad.19.1794221375807;
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform: arm64: HP OmniBook 5 16 embedded controller
Date: Mon,  9 Nov 2026 16:19:12 +0530
Message-ID: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a binding and a driver for the embedded controller of
the HP OmniBook 5 Laptop 16-bf1xxx, a laptop with the Snapdragon X2
Plus/Elite SoC.

The EC sits on I2C at 0x76 and takes commands through a mailbox. Its
protocol and its command and event codes follow HP's ACPI methods on
this laptop. The driver exposes the fan speed and four thermistors
through hwmon (the thermistors can also serve as thermal sensors for
skin temperature zones), the mute and mic mute LEDs, the keyboard
backlight timeout and level, and the F9 and F11 hotkeys, which only the
EC reports.

The board device tree that uses this binding will follow in a separate
series to the Qualcomm maintainers.

Testing: the driver has run on the laptop since late September, on
Qualcomm's qcom-next (7.3, latest qcom-next-7.3-20261031). On
next-20261105 the series builds with W=1 and passes dt_binding_check.

Rahul Pon (2):
  dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
  platform: arm64: Add HP OmniBook 5 16 embedded controller driver

 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           |  49 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.53.0

