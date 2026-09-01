Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA633C0A0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246457; cv=none; b=cJyXmYQ+Lq1b3LbR7bkIvSksqwwiorglelVoK8XlHjBGJWx8jtCMWhQoDCsUKMsThVdFuVwkqyPQPaXGCLobx2OE3ZReBF6NPL4X9TV2c7pcj/2vOrwfd0izozXMdFdcCJhNg3lgxFvVxYFotsQ4SWXNaGrOGra0cUF4NmF2cLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246457; c=relaxed/simple;
	bh=mRflIR4GNpbeRJMF8YlfXq8NOTxbRGqwlZzrSpH9ooE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3CC0KmRfYFZkDu4j1PShBUyJHoOILriorH+58XEoOB/asfmMWxiD8Nvro8ePF0BfyuKhPtYFpDsfHLre6BK6H7NHRr0kYDSc4hBoQnK8fKvQybNVrWdmnP7YGBYpRpkrH4MvXdrvyyC0dYidV7VClBgI0LjIe9LjrsNcBNATVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWfhbHUN; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWfhbHUN"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso4675710a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246453; x=1788851253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNTRLtdnuOjHKMo/0X9tnXkw4tLD7Gg1xY1MJ7AsLHM=;
        b=nWfhbHUNRfqrSl6u/ff3JWZg4NfbMA59alAkmqGX0ZRSFWJ4vy/wAybUs1mAffVfU6
         vW4dAOn8GA0VNRMZD0/y2ak8y9G6ek9otTH9jJqd2PCC6wmY+kq8NNPYmxCj4kcRcTxk
         WURdqOF88jeTBimJSkcn873dtnn9dfMz5wr6WxkjvtKA8i5Uy1aapCs2A9vWbs2yGEtZ
         NIwdHF+xxuUF6shbWjRltGrvOD5k8qXcP5DEXndkYwEZERj8xpHyQ4DTttjc5eSL6JfN
         vDtp5LDmE5QK5uFe0pA7nVYTLwTV0ua109ZtqSFN4sjVyb9UO3i5Xn26kQ9FyCJ2BKP1
         wjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246453; x=1788851253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNTRLtdnuOjHKMo/0X9tnXkw4tLD7Gg1xY1MJ7AsLHM=;
        b=QSp+LTsf+6o+74sa/2PbQOigbvLzjcaP4aNofb4bp3K4g3DyRRsPSMhtDDsfR8Er6/
         VJ1XK3DYM9GgyKwhbumb0ZbL4YiaCGUQIlWItREuVSXvO8w79gv8pnThAgxE1pCBZE2X
         6W6zuqiwrmkXLFr5c0G04bkVbLvFdEVAH32B6BwnUMAMx9vneCDyyGyXTlJnx9TDOgYH
         bd+pOoVuZ90ngJPA5w+bXsaNlwl+NBPNFxVpJT2TpSv9V9cs8yH6QODn+XjUpNZGsLYy
         nt2f8tYniovKwHynWKiYS/XEYYcVzebcRDXW6ib6hY/HA4lTg/LYSEf39plyPOnP9iOn
         ECIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoVAvIEQghT5r5AY0reYvRwxuHTtPkbHg4qVUpqfO24iuV8LAmuPvY5T86/UgFBY3yyI7nT8TXOCOdUyK6@vger.kernel.org
X-Gm-Message-State: AFuF++kn54PY1CLdO2Z6NghLix6Kvhl8l9YKN4KWPhhtuVevHyXSZIAw
	NASBERgWv4ySxj8aWyE58SRMOeXzQhsgFV0QBFmIgiyQ8hoUJ+SRSbGC
X-Gm-Gg: AYBFou1waSDjs6QgSOYl6r4faFEKq89dmrXm5/Hors7XrQ1Jch85/YKipEFesjvoTln
	PPUx175oNefZ0f12od7eUqrtsmxd8/DcexcXNxd0G1AleEULmq0epvfqXH910LXEE5IyuWmQ0IK
	j6uyKdH/7Wdz6XBTn4elx/W3mUX1Bz3HIwUk5XlC01jPqKlF9HRHs9sbSn0ShV9BLEkfOYnQcDd
	VRE5v1J1A2L5+9gnKpyMdlbvGU9mbZp2rg4esVI1Rl/L9DT/JNTd/EOOi/mjDbG4ea+rfOxvUHq
	QiWipvlei3MAsNlzJ0yg2VAjdfxDTw8TTavCqZqfQ3FTJE39TmthkCDlVh2OmIDVOGdK9AmBzVo
	UP7lNQNP/MWCZwS1rDzlujPSpCtgXEZ2ip9UJQTzMsL/8L8skLmf0Ybkmc1Xr3GVyTJwwUaqKei
	j3YUx43azPr5UWOTnnUQSUrwKm6q1nqRdsdn26Ln82kzpD3ZeDPGt415pZC8faE0YpKNFdB1b4B
	6RfeNWNXhKd
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr33933621a91.22.1788246452953;
        Tue, 01 Sep 2026 00:07:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:31 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v8 00/12] Add initial support for Qualcomm SM7250 SoC
Date: Tue,  1 Sep 2026 07:07:05 +0000
Message-ID: <20260901070717.20513-1-sreeshankar0910@gmail.com>
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

Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.
Some patches failed to send.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
Added missing (struct device *dev) in gcc_sm7250_clk_regs_configure
Fixes: https://lore.kernel.org/linux-arm-msm/apYNXZ9TJEC6rVVf@baldur
> Drop applied patches
1) [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs (commit: 1c8fe8863780705aba77893fade65f728e82b67a)
Link: https://lore.kernel.org/linux-arm-msm/178822856275.1835959.3848131517961346933.b4-ty@kernel.org

Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
Changelog [v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
Changelog [v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
Changelog [v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
Changelog [v3]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Updated the way of registering critical clocks.
> Made some more clock critical.
        GCC_VIDEO_XO_CLK
        GCC_CAMERA_XO_CLK
        GCC_DISP_XO_CLK
        GCC_NPU_CFG_AHB_CLK
        GCC_CPUSS_AHB_CLK
        GCC_NPU_BWMON_CFG_AHB_CLK
These clocks are flagged as critical in gcc-lito.c

Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
Changelog [v2]:
[PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
[PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added SM7250 cpufreq hardware

Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t

Sreeshankar K (12):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

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
 15 files changed, 3272 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

