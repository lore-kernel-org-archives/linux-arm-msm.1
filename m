Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281026;
	b=Y1FpuyHoUZ79k8kPSVltr9eJDOMmDixiVYoCDZRiA0Os/810KvLAiIZ0oxI6rIyQpjHP
	 Sao7S9bm+OsfFJ/dCMF7DycTcwK/Yad0IrSsLtyoUufKYy1S3Rjrer9MCnkR4MGhEMMdj
	 ZwTnSDbgT/5PS11RyO5ANUdVnARbzQO2t9NLpAv4Q75FCAYLLNMdYOyRs3rB89Ms+XoUF
	 yKNInY1BTdlTfqdcuIOFvUoYUdL9D5e0M5G350Y9db93I0LRF1ZAmL0AjbCWmk//mmbFT
	 hm0M8vh72VbEsZDzOn6aMDNQgiD9j2CmxVsm3Y4CHgu0a8XtK7DwxfwGQi+IKXBreTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
	b=dtmCZE2J/TVV8mk/PBrCyzw2+HykPHR7XMWg7uHFGc8Hiyyexy7MDQ1lDD1K+uKsDo85
	 bNs1OTduDjAfrsfncvspfBV5U1F2JuDiUyR0/p39TyrcZPpLCjskvD5avKL3O7MSnP+/0
	 8+Ki+j2hYQ1mkDPBVMQJQ8c8MqPbibMe9uTcy5UVfvF/mnsi7eXvhZcRribUy0yqPHavW
	 GPT/JRMOsxukp+GYHNVvJEbUP23AlN6kvlBEeY0ZewRZhoZZwqRGB0iLh/3qRotYvXq1d
	 M+uWOesSNkSfCpk+59kDh5YWRUnSRXOoBDKhudaQQwjRIxomWk8lOvBMsv7OxrqLRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D01606C33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D01606C33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so930253eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281025; x=1793885825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=GT+0KNJdIkRJdE8W4Gio2ibuEXT3n7impA3mxO3geWU8aZlinEeYdYdy07gFbSHHCX
         KhbsyXizO5+wfp7iifVvfkHhh/lLE8+fuhcdhWWY14Nvyv18Q2O5KBBNzRRaBblX1v5J
         zJqXETqUCazmqOkDpGVAY6Qng9fgVzLmLkAHYwB/Ba5TWDAEK0LZd16davtplEtlgsYB
         LcRi+7GxtepHatbRTZRFix6ZKSTeOQJqXRafyHg0BjKLWIMJJc0PGdzx8jXd78dDH9YX
         XIK9uJNHwM8wQ64A4R1HnVfKztxcFDHed7qbpgCh437XokySgXHWdN9bI2Xe1DUUff6z
         lovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281025; x=1793885825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=h0TbpIPxtgIgv+k4ewf0VinAmMMkwE99eF7goRQ7GHv3eieZKjQVd+vxukyu3FzHTy
         YEaXdNl1iPiGjPsx3VtefY5YaJZ56eHfN535VthbgGbcXcmL3Z9u12bt0xItvp0Gu9/m
         r4s2BaUsFJWnJROu2aOOjFHCw0IwOXkKS0+d/18lPsE6BYhQ+A0wSQNO28X+tvC9KAk7
         z47R4x2WSwE0qUEoqa8bFvV1VDNahf3srz9J9dlfmTRviaU367FNIau7G3IzLYKwSVm2
         cq2a8Tgu5GEtCHDLS9IJKoAopMjMQy53UgHz9EiIMnd5hRxCiWwuCV4hWT5AyA6AtmL6
         V/QQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4VkS3OCuJ0U9eYFFt1DBjlC4r9uylTwfFmcecQyMxz0ZIHSW1TQPMJdQhQOFSXIJsAPbplbcvnXtLyiNf@vger.kernel.org
X-Gm-Message-State: AFq9FYIHeF4nRqw5ASLWCeS1Emwz+c4P3vv89fDF5NDIrGKicnbhPTuZ
	BdY09YRE8pjnu8iXb8VALWPC+rhFe6tRK/xaRkM77QfeeaDHZzz2YlN1
X-Gm-Gg: AYBFou3zxUqdITAOfDKl1dvKQFXgh/GnTp6BeTcf+uE1WPpDlnunxMpHwCb5z8Dl0qa
	su8yTBa/si7aeZUyT9M5Oi7AdquLskjq8r6BRBPriDn6owtW9ev27xa6ksQNeMI2kelMCuqNGeC
	NmlbsdGPLLTrDl7j+ySOnCdSi1UeJpT/xaW/wZVpyNr9u2p0ljyh87Y+hPhvOePSoGOZJWHfSEy
	eHgMxGTHtzzdIYLxLdotnk4OVWmWFsc3g8xBH5JrKhH0WKrFDHwnnCNUqMvYhAGcztUiMaJcNoM
	z2vUKSFzyAT6GslYB6x664jWjbe3IhdhgsNp1CBDfLKioMLafZpbgwzy388fiw/WU8z8GLHGDWS
	zrlpw272rV/c/P/Y6vK7OrDTJCJBnXnmhbMAggoHiSwVPYHZkszx91vrVM7fvt1i3KLbeekJU0Y
	SOfmxb/VCgQIcUAv/E1GPuJNsohRzpNGIKvATixyjkqedsw9Izm+JvmmgTEh+spApfUvJ51xl5k
	oUQycHm5tq2Qhwwf+2PrCCDjP9YI/DWzMFvkntWM/oW7QXlhftA0h9hdTN78X1ovg6tz9eNX4Fj
	kYUlmzEKdwdiG5OBxMqhT92w5rfXPS96vGBiwKZka9/eTJGgaCS1zg==
X-Received: by 2002:a05:701b:4559:20b0:192:a481:361 with SMTP id a92af1059eb24-1a942c60314mr3416088c88.7.1793281024734;
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:52 +0530
Message-ID: <20261029133654.6585-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add devicetree support for the Vicharak Axon Pro single-board computer,
based on the Qualcomm QCS9075 platform and using the QCS9100/SA8775P
compatible fallback.

The board description includes its PMIC regulators, debug UART, UFS,
USB 2.0 host with an onboard hub, PCIe, SGMII Ethernet with an RTL8221B
PHY, GPIO LEDs, GPU, DSPs, and audio through an ES8388 codec and two
digital microphones.

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: qcs9100: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 848 ++++++++++++++++++
 3 files changed, 850 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

