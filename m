Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817296;
	b=mlHe23IMwQ3miar9u/QoBlETDzFoc8Y/wrYVxjUNamCrPpRo5PvwcMU0DTeA+K3+sY+q
	 LEagMMSmMJufFcYVI0hLoRmzEmXl2fTyQQRY1GNbiuGC9Ipc3T0p9JK54KZ8f9lv4z48p
	 uIWANat/gYTVcWJLcmHzCu3Qs8RQWP6zZe52OoSZOP5ur8bqWWTl+7l20f0jJubO4+HCb
	 l2rxlhp+8JK6V5j8Ax8X8eiaUTcrno5V066YJ08XR9hbhgG7fn0rJZXA9h3TcSlBV0dlR
	 F0iLaq6V/GQvdOdMf9rZQ0OJIuVtBtjBh3gDSCwv5ZjtU0fGB2JxjlDhPybIoiTA66g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
	b=CGjl4uxCkdOqfZjvXIEKAWRAK5cRKa2iGAET70ucfhOPmkTcy49oHsZsbFMyKCf/Yz4V
	 CcpWGACny/nQMHYW1Ov+NEkRvIosqOXPBsjqksklNFqM8EH0eEMFv39CRtvVSz+beEZ81
	 BzrsuVOATUDhNFB+DIeRjtAgC04iocDndsTEiKgjDFcmA4TCNSbw+vR1JyMrSjoNvEofc
	 rbt7hLNRFr0diZFg+D2Uu3T6spMxjAQzCb1czeoQ+6DqgRwGXuO4+fdTSp9X/Qx8vxDI1
	 Nfc6e7EZht60MQEKw6ybbnkexI2yf+s4bvnEqRG3BH9/BY4UHNmqjO2pNOoI6z0gF/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1D606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 04:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D1D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-844a8bf7e25so1082567a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817295; x=1793422095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=bn5HdHFoht3tPfTohGv771TsC0f2WPm59gfEoeVqoK9EN+61yvh9pXgdDwhlmUAYKy
         ku3Hepd2tRo1Fq5Q7oiTAzmTEMfsid3EOBABukgTAr16DlRlj/ui1VTKVFQMfc9IFMjP
         xrCT0Ek9YwWW9xXLlfjm6hJfrFtsybjhi57keSrGMNV6Ejin6ivL9ffnip0ajxivBs0C
         pccD41tB66oSuQo/dJlEqJ6BiAQkmoqdQ+b9FJGjUCBXEnRSvBQqN9eIWH6NcE6tTbfR
         znT26lvkKnAFYRh4NsKe0xjJ2iWkrzltczFAmtcLjzsE9cP/VoeGtVRbW9lvfjJQcWTz
         hMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817295; x=1793422095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=jvCxmyethBD+gOmd90hzGs0RJ6aTCknSFE6RKESH5t+vlLV+HUFPNUwzWkvEU0bgSp
         QWLjCv/hsLDMQx0uVQqO0MRgQCAG+p95gLS2/Q9pXoFAT0AtwY0bTiP8cpXC94lixEok
         /1JYJsUWallvclZyc+Fy+oMDqAw1NAtLxe6V9uLuB3AwcnwUDsh0LlsORfmsXtcwVsHb
         mXj9yR49jqDjjWkMt6v7xfcKR2V7egeBtIxE/uSNRFGW/S77QqyMEEuS07BHzbmYVM6I
         1Gf/P3n3jJgymFKOVlHt2QKIwIrkeP/t8JZ+F3OyTVxPzGyTEM+kQhP5mp0v5uYnWdxl
         PeyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZowuD8MQW+zdzTlK+zW9rKCILtJSWybTVyjEDjEaOX2IBx/Xbhw+KyKzNP2JKKRqGlDH+UG0qUavQHt7P@vger.kernel.org
X-Gm-Message-State: AFq9FYKZUgcuDYYx5wHSo2r6UxIu9CTcjmoGWBR1NGWp/h+Uw3ECaJe+
	Ux+Mo6XskVU3pcZ55QcY3iItjt0SoJ23Mc7uULvMOSE/r0/UcMZUYPW9
X-Gm-Gg: AYBFou1FrOy/t9hKtpf2LMJ/6DOmzxvrfJWgoiZd689G59H/uXwIP+Hr4evL7ijYd7P
	zUUjZBil6ewkh8m02fnPw/Xbggr/TFHSeeUHm2vQKGjbzKXYSXrmSFKRksR5j1jcqg3ZrDN2Xdj
	v0Gjy3rXFchXtdqjHhPGNw5XNeWcg5Eq8pLBGWJMVitybAMl4f7HMryenmR7y6UU3butqBxSVH+
	hOmyrMdgMnzC57yUqdkr34xDylm1UQXgFLlj8hkeFZOHX4AqXaX8xSziwr/kO0RtHvBmc27080W
	zYRIuJc+sg+XqPk9+K4hJVEx2/APVYqdmFd2YFsFdn9aCzNl1dPgWS9cZFObPhI0JWbRwhcSBa6
	TrLf56fXvIIBRg4V5pcDEYCvgBpnLX1HKzl6YFclWjVV2SgaKZRwoeyCnovOXML8mBfAIR719lx
	cgG5+6AdQRgq0qQoNyRaxW2OvojwMTWfFFd+r9OTZjr7Zrc7TV0YD6zuCOHW64wI60PvMA4Yz0S
	HopGLy+93Q+OY4QPs12ezkQW4YJErAkUtVb47ZwfBuTHoviKM0ks7zApW7yrruAGGBN1eBPQgYr
	BNVY
X-Received: by 2002:a05:6830:4489:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-850fb0769cfmr1141196a34.1.1792817294879;
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
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
Subject: [PATCH 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:48 -0500
Message-ID: <20261024044650.9936-1-jeff.roach0@gmail.com>
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
  programming on Glymur" v5 [1]. Without it the stream runs at half rate
  and the monitor shows no picture. With it, about 1 in 4 plug-ins still
  gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

Earlier bring-up report: [3]

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 840 ++++++++++++++++++
 3 files changed, 842 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

