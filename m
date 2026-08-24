Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A535FF5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583743; cv=none; b=XB9hCGeqsKIPcMtEgiG6oxC6Bc1/zq+Dub7QyRiExg+4aagC+uRK5pX+2pMP2sqGPptipxx8AE0P+1rI/jHNxf5AMURWT8PDuYefUFCJi+JPn7p3MUf2++uioQb3sSPBiu0L8fWXz4Q0W8zjUmFgYzL7JbNeET3OURKrOXd9u3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583743; c=relaxed/simple;
	bh=Ty0g4P4F7c+Qc5dUbLKGZwOoXgVcOPCAOWMPRmFgvFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx048FsoC/sZG2oJXGUim2181RC/A1MeQnBidEIouPGM3v8X3qwDxau+kcUTWZUgsFBlqcxwddM2yTHOti/db1lZYrOhLzPz5r4rRouHgAF9PaDRwEwx9F/r5bw08VsQwsFEIAJfs0WVfC4PAFnporIsd0KLT0+6kEfP5lHeoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji5eJioI; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji5eJioI"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4569e871502so3162374fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583741; x=1788188541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuO7/PraFPSbHMi7EyxWPZg5tO+DugLz4X8jMJoOXHs=;
        b=Ji5eJioI1+hfuihFbTVgwTol6EiFI51s/ShUsegWUUmbBtO7QqVnYLTQNRIStXghcy
         W7B0XSj1nFOxlOVLn+Zagj05GrcxmkCjxqVu0Ch59oecSGRXHOpe6M+dQmj/8Vh/MCvY
         LUN09uySSmXpgIlkL7raFwhXWf/JrevHCCF725srAUbP5nPVKDwCVGSuN0bRJ9pzv2qR
         S8cizALTtfVztnu+Ksnn8JRbfYsVM51gs17JoYN7WQegwXqgawRKgHCRA2FeL2hbcRJe
         IIokaULSW6wA1pQgKfeAB1tgnShmiIEEYjaxwRA+305usgd4Dko4CAduBEFSmqCk3FdN
         NMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583741; x=1788188541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuO7/PraFPSbHMi7EyxWPZg5tO+DugLz4X8jMJoOXHs=;
        b=jvXJSYN3Dza4KxIkk36qTerDtCNWNh3gPZqijamrm39jUVt6j2Tgu6Nwdxiq1wm8Mz
         OjRtGrf8OOVk75e7faWxv/eOz/FjdTWxp+5vCz4ywf8osZ+jElXgPgxW8hg+as5hN2MF
         h2UDFHzyzJwWl3YY0v30L1rb/qC38RM3oxtWSjZA7DjqbkRboNSh+h1BJo2Cp/ZE2Ceo
         OrORWNx26Z8U58u2fia7JFaKC7Cxr94QNxpW6OgpBc3cVRAz95ZVPMQFgFJiiD6MjFtF
         /Zt6uIqFxfWsRZNWAwE2vbtPkPD2l/gH+KmVkKuwoP2QEj88G0dMhqueFJ0ncyTA30np
         zw9A==
X-Forwarded-Encrypted: i=1; AHgh+RriAZZnJnjrmAqx6nSnMB1KYifdvBKpjmZg41R7MXfZJq5U3UfIxnDanZvxF2EcvyLwisbrgQKkmstbVqKM@vger.kernel.org
X-Gm-Message-State: AFuF++nw2vwUST4gEcrOp6xc4uB5vQsWUWWT2r/axPHMJmxiSPSSe+oW
	wUIPYtGeagfEufKAP5cwZ6b/St7vMYt6VQso2Y45wq/Uelcxy3f9/sUI
X-Gm-Gg: AR+sD10WYwxeG3XmO8x+KLkWh2fg6djmKtguFq+HZgGAL3M2xmBtUuJN6DEroXGHsDj
	htepDD53hKGGYDUhTpVA/x7GVuw3f1ZZfZGeMzTB+4ryjh+/hm3nmeCdOhqiSTqN51RnfnsQCRC
	AqUcfYaBUhzJxbL8Q9HwprxGlFkR4RV8b+t1pYnpS7MeUNRxvwW8lB/vjZ+5kfPxgHV52SFop4g
	hzGHeDVDiftw/9Tw8NB2Z37MIb8spQQgURupaOxXPk6oYF10BYLUXoROWPPkF3+ksLW3y+0qXtR
	mTVbeC+zCSoMANSWsTaTJFF3iHbqviMwlV55k49e3cbJki2UTlaD+Bc0rNGbfjOtNRBQp+n/3Or
	91ZMpX9TtTPEcmz7N3D6J3jPuW2G132n5i1WTaS9U74hUcOPQBn6wpxhMbQiWU9KlNZ9TqJW2nG
	uvnzMCDz481U31aRegODsZkYtasW19+eBuCWxDAzp7YSKKyc8W3C6C0Hhtb0lKQxm3BAQrpg7Ws
	aPK2pL7y5zv
X-Received: by 2002:a05:6820:151a:b0:6a1:47ad:d18e with SMTP id 006d021491bc7-6b159199686mr26114840eaf.2.1787583740856;
        Mon, 24 Aug 2026 08:02:20 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:18 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Mon, 24 Aug 2026 15:01:43 +0000
Message-ID: <20260824150156.1310-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t

[PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t

Changes in [PATCH v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Sreeshankar K (13):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2275 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3273 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

