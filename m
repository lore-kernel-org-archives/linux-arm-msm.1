Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3493630AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326857; cv=none; b=FnYbYfFnmuPGtrl2n8NBOSS2/XucrhsMoE70f0qORvv/T1jVHaQVzU6SDB6c6StgxDNbHNaxgx+3b+4Om9punrTxYY37SiCXJryLiZUx8N7NFNwL2UFCm5CW9jLB7k8tqHyZsOA3okdKwWEoArJxLFbpOExG1zUJf43q7JKXfAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326857; c=relaxed/simple;
	bh=EBIEK0ctGOLIdYheYSYQ42aVp8zZOSvUXK4M6hrlV7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJnouXhiJtpCIdZ8+/l283HSWV3eAXfD2lwbpCYnmF2KZzLbF79npihlUmUARduY+wX3HcG16n4bU7Lkn9LNdo5EkYHqrqC2QI5tAfMrXezy2w56tlFp+sz9l7i0wZjie7SK2QVAypX3LDwV31XiWZdLuqUfIPyMjHiPrjJ7OvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVobMYnT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVobMYnT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39266382df6so893927a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326853; x=1787931653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLDe0BKAQgmPczIiGwzPyNkfTByg7ztvmyU32QDSeyo=;
        b=HVobMYnTCwDn4VkLjP7zZl7PNvI/+35PNl7vsWxe5fcAD4RyXEn0Q6KeCJT/Yldwx8
         lWnZU8Pbj4NUAi76M6Pg8i+2vgxeJh1/a1bIDxInpVhJ9d++F+6hb8Wb/8BjXudqCAPP
         El/2JNbjwXOY9aYKq72kJUnEvJfUyhJ23m8pe/4Tjm7XY1W5qZc+qX+iaTexN7UcTbl4
         cJl/HaZyQ3STEi5S/AvGeo9biFl80Wq6+Z2TXog2FpfGZ48ABcep+jpsbHh3Ua+FJmbk
         Xpu4+gzKgyFUg0wUpNIoxZnT92/m8Y3sRIvjTTQxhA5tfAG5isGMxOZBuVI1K03Gdjl2
         oOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326853; x=1787931653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLDe0BKAQgmPczIiGwzPyNkfTByg7ztvmyU32QDSeyo=;
        b=VMrp9BPbhnvz1XOLIYwxvk0G0yZfxD5nalaNzUA1rrhJvtSf1wMP6yes6PkVqmuNaj
         djxOW6f5/sp8vl7qIMDXn3zATcrwpwPYtyN5DbvJbL4MLQ0v0h342FRSXRSCLY0+U0Dw
         vkM9j+Mk+Ma13SbvO3FT65BDc7jShmiUfo/IXkwcYipnSDclEinRDp5wKjT76VEd/fpL
         jQE7PeztxiOS3RiSvvifKd6BAI9dQlVL/P4yrVHl01UgtNZfZnmOnDpsTIH1sfeArZj2
         2CXGD5oEQezWTbxPj17xOBOVM8xEZQrYOn1LRirCRD8QEns5DitZoW8e5jgA/M5k6fUJ
         BZhA==
X-Forwarded-Encrypted: i=1; AHgh+RqI6JBbaqLvGhRwf7xfULInXxWtW1V2qO4S9e8eJfb0PzgZUOsP3EayJF6zONJwJVuXEDWyIvuXBfj+qe7G@vger.kernel.org
X-Gm-Message-State: AFuF++kH+c5jaZuvLC3ggBv5eJCp+DR1dbLx1epYvHKbFraWVnliUgm9
	4lwzC8YybyQmlyPKJI4TFY2Qaq1h0ho7Q3U9LYPJb13PXQmZP22vzRjk
X-Gm-Gg: AR+sD120fsLCWgnymeo2JG8ppl/Eq81JjU24/iPIPThGdc5bU1m0KyL4/kmag3TSqmp
	bUAF2sz3v9YKitxopLBkbA0azl02qxZ+C3cnfjUEBgaKXG79MJnmz2ViThimSJLumDzPiu0kqrC
	4XoXl27dXNparqjYk1MsDzx7aZ8TAU4DSTmPleRhbJY+Ylm4zRkljMfeJl3c0blGOWeWEJQO/3j
	MwS9F9wwxv6HRV8rB2CsfmQ/CRiC+eALn9m2Y6M3fRVgnYO8YU94bdsfvY+7Xaz7c8CI3usH5W2
	/psT6ht8jHF4JlD+AY5WqtnN5k80VQtQ3HaBM8WZnz+3pSn7GZgqVrpr2/V5rmVcw/HKCqdynLT
	UvuzIK2yj22ZAOqxsXZL85Gy/B+WuZB2nnjpdmzvdGo1/VoSdzZgvFf8eenCSX/ARvZ252qh/8J
	jNvi0+djPUF+wGPB2w/GZWHsLmN0uQXGmiNA3l/Z8ysW9+Ln5mMhOZBaPhrB89+Uxzc6euTd/kt
	a+D0QuHQOHu
X-Received: by 2002:a17:90b:3902:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-395c333710emr12421375a91.3.1787326853054;
        Fri, 21 Aug 2026 08:40:53 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:40:52 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v4 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 21 Aug 2026 15:40:17 +0000
Message-ID: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A77, 1x Gold Cortex-A77,
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
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com

[PATCH v3] Link: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com

Changes in [PATCH v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Sreeshankar K (13):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
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
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  756 ++++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2274 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3257 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

