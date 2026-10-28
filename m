Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215130;
	b=43TFmqVJYaxoWceFxwITCCkMs5FrLKEPXtXnkYV8YNQ6eQmdXdbO9AWwJ46ByOQmv73L
	 anNqmZDYIs+KrvaOTAhf6oq5uoBAnQHEigmiHECiSvhxwfCh9ly/a8jHCmpUYgJAXpjt3
	 MYriy5k08WLOJflEMFvSYTYkMFPnSwgxbZS7vQZVximwEmFX3c+fShGQDRi+ZaxyaLedL
	 ztwJKqN0JdlDhK0Dc0ZSRvNu3Ju1tts8wR4GcULC1y2PbQelJE/gjxR5YsQTtFDbfT1z9
	 wWAlDjPURprV8iR94alfqxfjWEkT/4OV12ZTTppL/sHJqVgjYf901HuXDZgAoFUAdCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
	b=2Skfg0xXEcTqaw5ehC3e+hV0RTPEOG3iXoe2MhnNdusBphyStWX0b41ZbhvVH6V764X0
	 NZXy0ATw24GThkoNoT+JPKX939gEKkjY7KEV1XgVdYP7NrnxEYTBi0M3U0R45oJyfmLmG
	 srP3dHsfg/eisXm09xFPhiVW05beD0KhEkpNu26wA1HtS1S5Ih3YJts73Z6fQUs92dtGV
	 Jxa6zaxjMxYbwGxRMxP5youX+gQYE1QZhQ1uO03Joku219c5wfOb3BKqg9hnd3HxAALoM
	 q4znL6Gr18D52bM6mJf5IATI/Cc/RtmqNn7JZl+pBm7zHwJ5CY81WVMvgtLGBK04u8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B48606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-49de8ea072cso554203fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215129; x=1793819929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=poYg7JtDStt715lgpaSNPRhqcRR/NCASHkbcxI2Vh3WH2m/+ObY04VAI5Z4kMq00Xf
         aOwkqLh2V8bQ5JwX/uKoAmPenhlTKmqwzs+xLW3WJlma2HME4vwPyG1bFOa+HmC9Lk1X
         ronkRHLgtqngw5ofLvaduIOv2lH/58Ljm7LV+eGbqq5z5j9WjZYutZ4atQiahIllJSSz
         ZH+FdBpfgetva2PC/KgR5P5L+X7/dW/Td8nbwT9jP9VlVyZps4ePAwX9ksPgpBJMz4od
         8lXmG5M8XBXTzFPMleYn2OrdsIeq/ipbW8fmobG44F0scnJsrxuAHRJcuPDTPtB/caT8
         SDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215129; x=1793819929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=EGMEulDY90ikb4JVQ35SUeB/VtDlSngms8f4qQKuGiNDGrhXRgtEIL1bwh1STLzhlg
         ZRuyQhMTOVxqn2EFIHH5FGgbhW6VUAwYQhwLEoaDd3q80in4FnZy9TDrOswhOWSWL+Dm
         gIXj4Kz3Z1vmuu+BbmPxw+GcdXW7vQe7Wk59s0wdEh6RKuI/7rFmrzBvzxdxPWWWE27n
         euk6/oT3wwTxYOBgFlxYcSv9mDOMWYIv07uMUnTF2ORPYurvl0DphRZRAVoF4z8ANIP/
         Y7C64DY2n5Mnh9kLTBQ20e1EFcFFAGqi5DrF33WUB1e03VA+G1L2lftL/kbcVANPXwrY
         bRxA==
X-Forwarded-Encrypted: i=1; AKwUvBx2T9/pHiJOJ6pO5xOfIBeU8ekny/B93+fMoTg7/6qAnRiNkcBnoTrqGNvV+OzxS2ulhZ1dSTikLZyDwOmZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLlsrpU0SLqGiwmnmrmOk9UKEqi5BOWOb9yzmeu9K9tRIaTzlIU
	puMpSYWWKNvmA4g3rMC0wZsEALcncyVlAHfJPkWlrI7WyU6NIbwCUUma4M+9oejd
X-Gm-Gg: AYBFou19ZBvy0UrsYWT30KoUtAmx0ivpt1JGzGlFSe4BiN8UQfyPEH4xsInzM/vxpcj
	4TgKQgZuRYf01fNl4HTHviRgK5dblV7/VNRoigf1i1Gh5aopU+fZTCxpN1WrWWujtP2+iwOXXtg
	ZPHe7Nh9VmL+77MfZvAbb2l3rKZDZG11ulBD2TvCFKoNclipn6QuIWp7gbF1jExMY3hge0hWx/H
	sCiK2U3mOKgV4pllp87DeKILNL3AumPoKMF+znqjKaMirIKPCMUY/m4/8baW8H33LCtDwmUMJR2
	WsyvXUedgxLmwN/JCMnpwfNSEiZT/PfeMBs6mclrWW+4800q7u6+MfbbJ5v3/bRsMqmBi82huVD
	nxv5TwlTYlxdEy379IkO6lVaje7y2/7Mm94oO6aAeWF/ASuqC97dkgKzTHpCKAOaFxLyt00tIty
	bBNW3JJKZRS61DCJgj9379vF6b856p8WTOG/mvRPPjygDLNf55DKsVpwiuFAhl81oA66BL7XfXG
	stBVuDVZK8GLc5e6lkour+LzwwiHuoLMbYkRe9XwS8k5vF7N3JxK6t10nMrfmKs8/MONVkA6NxC
	M2ozqoN7PUEyNPIqBepDK9mtNs+dKc9KLexEhrrVScWMW4w1BU8OvdqTSA==
X-Received: by 2002:a05:6870:569e:b0:49d:cac9:28ca with SMTP id 586e51a60fabf-4a8bb21d55fmr2619589fac.2.1793215128834;
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:58 -0500
Message-ID: <20261028191800.27829-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

