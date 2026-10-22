Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704050;
	b=uh8WD5vlu3qSWWELOaDWodkGywLIq8IhXiseQN7cAewDVKGVwc3oR4c7ruIHlaG07eNL
	 /6lefKkUkJnXDulH9XdVRgRTJrSuNSqw7v6e+X2DzrICdhkGn97SXdzTdBcUf/5Ff7le2
	 KBUeBVUuv8TJBPDW1IWQLAG/bL96k8lU2Lsi0/THMh5J5chLB7tikvVacHtX1HNRKcw44
	 GKRZCqOpz8OA+R5JQNKP3CAvh+bpbjHnABbPcmYs2XB3qCKdmJCvtiqDKenUoS0KZITQb
	 QHHFaPD93zmjzDC8CCZi9yzxkPRs/h7jdmY5IT/wnkh8eZYbdpIpo5QBCUP7StnGiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704050;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=kl33B2f2rp7Tzl8du7UR+tDLcQcMWlQpWD02vzFm6xc=;
	b=Q55q0R7aiNggP13GJQYVSDdCVjr6AdEZ1kYt5Q7ZrH2ywOCPqEu5BgsqPlz/lgD2DyRX
	 ekbKPXZjDss7uCzwzdQyJhvIEtx55lc7HfrBkp4MOJEyh2hYbByahylUiK/HeyVaQfiSw
	 fv01dUDTlPmpsMvTqxt7uYtygj7AvlD10vx81MIkqgsbyqzINy7xKX+KVDBpbaD53wnpb
	 i4ERGjfeUYD7qqC/5std9NwW41pRjPJSN7KFHb4hBefG29P1yHM13t6RtZsBdPbjcfuV6
	 7HJm8HYYjcbxrifgDXUntxgp3Dfw/YXdsJd3yubaez6q1OsiGWlt1e1/1g1lLIC63hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5047606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5047606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792704041; x=1792963241;
	bh=kl33B2f2rp7Tzl8du7UR+tDLcQcMWlQpWD02vzFm6xc=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ASeIvtUd3xRbafUVythv9TzuMap+jlyDt2X+8cKoEp+pJrwIyLp5fxKTJnOw3t66U
	 oKd+/EXOOPYiE6hBsyrcYnxYysS6th2vNGC8t9v/UWLxBzUyajQW/JJYODmutYr9r5
	 M0io2S2RUcSCEx5GRV1uPpbWkLjEvJ1oM77eZV/j4S1YZ+cxrX0CtOxgCXprcGskmM
	 2c0Ibn5Z+0H/zEFW9Y7Zk0S+WNovGaTIBtSJrAbf5rfguDrtKtrMCaLCj4EFTG9Uqn
	 1x3Ey0dWbApkjxRvGrfHRYH2dlOF76iMHMS78geiaPqgvp/7Tf6QgA3CB74fb5k6AV
	 0u+CWcALnUooA==
X-Pm-Submission-Id: 4j9fFf59zjz1DFG7
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 22:18:23 +0100
Subject: [PATCH 0/2] arm64: dts: qcom: Add initial Motorola Moto G10 support
Message-ID: <cover.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This series adds an initial device tree for the Motorola Moto G10
(capri), based on the Qualcomm Snapdragon 460 (SM4250). It adds the board
compatible and describes eMMC, USB-C, power and volume keys, the firmware
framebuffer, regulators, GPU, Wi-Fi, Bluetooth and remote processors.

The board uses the shared PM6125 and PMI632 definitions, with its own
reserved-memory layout and firmware PSCI state IDs. Modem, ADSP and GPU
firmware paths are namespaced under qcom/motorola/capri/.

Native panel, touchscreen, speaker and battery support need separate
driver and binding submissions and are outside this series.

Based on Qualcomm arm64-for-7.4 (Linux 7.3-rc1). Binding and full DT schema
checks pass. The W=1 DTB build reports an inherited unused DSI address/size-
cells warning in sm6115.dtsi, also reproduced with OnePlus Billie2.

Runtime checks covered booting with all eight CPUs, read-only eMMC access
and USB ECM transfers. simpledrm and the power/volume input devices
registered. Thermal readings and an active watchdog were observed.
Physical button events and visible framebuffer output remain unconfirmed.
GPU, Wi-Fi, Bluetooth, remote processors and suspend were not exercised;
the minimal RAM image contained no wireless/DSP firmware or modules.

The test ran without a panic or warning backtrace. A PSCI PC-mode firmware
warning also occurs with the phone's installed kernel; suspend and deeper
idle states remain untested.

For the stock Android bootloader, testing used out-of-tree handoff code
to select this DTB while retaining the firmware RAM map, initramfs and
factory Wi-Fi address, plus an arm64 Image alignment wrapper. That code
is not included here. No other device-specific driver patches were used.

Michael McAllister (2):
  dt-bindings: arm: qcom: Add Motorola Moto G10
  arm64: dts: qcom: Add Motorola Moto G10

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-motorola-capri.dts   | 452 ++++++++++++++++++
 3 files changed, 454 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
