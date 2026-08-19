Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178A476079
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153174; cv=none; b=BviEWje733N+n/Aq8V4vHD9shYsQw+fDjqPNcHEIj8Zjba6R7n1bpqUruHjuSbB0JghfsOKXXjrnL+ah4EoNmx/u9yWMYSyIxI0qAs9S0mb08kkNFVUDhxDvgG8wCsnj1dyYpJ5VRItTgqNadx9kRP5qXGa4XjVcasLqonrPwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153174; c=relaxed/simple;
	bh=KUroni8tprXlojD0kzaT0KYlWx9yyDY5qyk+iWcuTGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bO2l4wz2KiCS0UoX2gj07VIb+LkrF+QZHYKa62R7/vhejp4exq97FQlmH1CRuyq+HHnI5J5c7lhJz+cqe7PaMUBQy5CdiKXjaFwlrWacrQzjskoUPmUqOU39LCKwKKHYBx2+dVhg/rrTL4vTZD/fAKx+KGTIqg/lgortPZzY3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl7B98TI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl7B98TI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d58efc7356so12559215ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153172; x=1787757972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SALXsfEo0CULtkLcwdzPbmcj9OnpSD+IDtXd+njUb7A=;
        b=Gl7B98TIZ90G50kk5+NJ5mMB/ZWWQbEPSmtpp/rGIBXOCwP6tt+kJiyeKBR40YSF0w
         IyWlkaaR5Q84Lw+o6BN36b6ki8Ap3cFpVv1m9/UQn0FCzWUDwoHx/VLrx6KLaT1bX9Mu
         kOvd7pe27WleG3ODGIjuMua9nMueJVj3GHdw2Z2nKNH/NIXAHBUEE9+Rkf6FkdP1pow0
         14sncdu2rwyxskxFRDgYjFtZXZS3u8zjaJjrblln1IHfr9Co7yBZG+Hr4MKv/mowCRTx
         NlNIi8WZKLa29vWSNCFaOMCsE6aQ+0lPPqioBwrwn5AA7oD0EdUCuYFJJ+eUhfPafEno
         x7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153172; x=1787757972;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SALXsfEo0CULtkLcwdzPbmcj9OnpSD+IDtXd+njUb7A=;
        b=qKFGdFhembb1UuHsrPZI2vdma1A9K9fI8W2BkmRGRHnHetMg3+Sf1ARd1cnzhim02X
         AkIKVURx37SeVcqoSE3OT1PMmaYmiw4icmCU3RS4g+zAgOgbRhBQsgzDi2qRhCs5BVlp
         19/t3fW1aKs8kM1wMhFxPfUQYwa/DarKeziZlORII2RjX6XEWHAEe5LHhqZZtDLAFDe8
         7ws5Mba6YZdtUolOsxp8oa9bSoomkxG8uHULoU0dl1azkzfqTWo3f9nr2i9+YJXNX/Gu
         LsHgAmlm+fai7Hsb6w1mjVFwjpvuTyfAekWkOhG5JhG/7IKrjcf0WHdMXt+hEjXBG3hy
         UGnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCGRmJU9pwOMJfuH4kCTwu7pWOK9s29NQP76VvuSNWYT9h5rwO/t0lISVqQn6CCL4f94T0P4uU7VV14u8n@vger.kernel.org
X-Gm-Message-State: AFuF++k9/17k4SDCCyme0mfl6duIf4iUt98YfTZ4I7gfb0Mx1Gtoxwfn
	rgHaYY1hTbOI6+bkMov1gAgI0/9nZP1swZslo0B1Gc3Ypf0BwczH0M4R
X-Gm-Gg: AR+sD11Hkx56gs721E0KCrywhIIasZJgE/w3cCpgVCsKDf3pD3Nm2MRUmh/PgWEgMTU
	N7iD4qf6ypmlHN5sffnLgl6fx1mdls/M/cooNJsYOXZhdz+aFGdt6M9tkW25WmDuDswXfSVArfA
	Pgzk9GASRCj134aIo1o03hocMapLBDykSlzwhgnejGcCLFJ6g1Kza1k2pkPryTSPgqd3fxYd+1P
	A5PCnofGvayW64pNNIAC5qmQ20f8M611uEkYiXubPxPWlepJ/f3Kh0FmWoqpUPNxl1rWHTvaxKt
	jgNsSCDBiC2nXqCcncE9U1UDtj0XZmU2r+2zihKmADl5gcimgW/34UPEiKBYbhijaCXRuwEH0nl
	NGOSj+7FuO1m/wsuu41o5+f4JwljiMK/ZYao7meSANJ/JHSWkyWldFbzFxwwXL9OLY55egPuD20
	SfqlSFmTcHzJk5iR1qjOYPGsOCLPkRsWpYzRWYqraO/trmVqEIyulnUE7MTXqHN6Z3IblMXpCZS
	lfGeHrgdPA=
X-Received: by 2002:a17:90b:2c8f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-39580f119d1mr10377347a91.8.1787153172547;
        Wed, 19 Aug 2026 08:26:12 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:11 -0700 (PDT)
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
Subject: [PATCH v2 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 19 Aug 2026 15:25:29 +0000
Message-ID: <20260819152545.3934-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v2:
1. Added SM7250 cpufreq hardware
2. Added the tags from previous patches
3. Fixed commit title as per the suggestion

Apologies for the noise in v1 — I am new and still learning the
kernel submission workflow and missed collecting the tags from
the previous patches.

Thanks,
Sreeshankar K

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
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  612 +++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3186 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

