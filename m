Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B2318BA6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004210; cv=none; b=PENluoyYUB1vJtwaNvz8AwcdOGjHZ44aFIybSXMFPttmKJoRGWAzhhqul/XWKBtTUjh8mYvF+iIPfxo1JbomXalPCCPG8fCrspf1X0FbX/R+aT4rNp6IbPmQczaf4S08q9IKS8G1yN6d247iKalf0amTWx08MkXMM59LybzfTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004210; c=relaxed/simple;
	bh=fdCLCsEBXW42w4R+XGmUCGBtdb4T2RgDYntrQNHfjJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CGktJz/OeAiKHSEV5YYhIJvu5sRdxGySQGION5gDVzFE83HlqCSp2zQdNNGJjsLa1Km+jpLwk4sWBbo/zMRz07ADG/MmiqSGehnd5BI07kZCmCdHyfuqoGif3Et1wgCIPDeDnSc9wkDbogu3e2I1MbhbaxhzbyJe+o4slhcVdp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T11BoRgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcE3o2/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T11BoRgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcE3o2/T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767O3eo1354803
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=26NRoRzwiVWotGmaj874A5SOPi+McmmFg5E
	qHAlBJqg=; b=T11BoRgZLAknEDg49nRyWWtpB9L26pfsDDO4/OahXUp22w9XNIt
	aG1320r2CQC1HhWAUivia2RdUvAh4fuIjou6L8JmiEBEWt+Bxa2Kb649BilPLkO0
	wX+bIE0VoBnOSqZiqmwD0oAfbsO+19Vq63znw/JOZdyPu6S10YbZMRUVU4pWl9BW
	ewxWJGmvpTrcDq9xEQ9TvYrGXnJHYhlRvwOYx2U270hAiF2zsA6ANs4yLc4ZLcGb
	lUE8MK16ZuHUmczRkL66MmD/80ABnilAE5MOMmXz4mg5hGe+U3UY7n8ksmdcVySE
	YWVm83Y0DVyKzIuCD+vGx/FCAHYO9IQEqmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmk4tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:16:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e04598adeso1698407b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004207; x=1786609007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26NRoRzwiVWotGmaj874A5SOPi+McmmFg5EqHAlBJqg=;
        b=QcE3o2/T8jpkhQilvVeLcN9BptgiGcS4mDl8pS6cQq1uRXjqDbLroG10iyxflpUpA/
         FC3XAYHihXKR+x3/PdOh2CXqVIdvSl07JqHVGSSPoPS/HQGynrwn3f4HiLunxi/NaN4p
         qY6Fh4HsIBHurAZej7hqyHGcxmcoLoYmMC5R2vd1Kdf+hcmsdGa4ZjEoDBVSXiddHoHI
         dWQKBLhaKBHGGX6O3C1wNhu45Hze2/oa7QqhQdC4i4+UfTGwyufuZotO3X/id4hrd6FE
         6ANsN6qVDtPw6bk31WUjJjgD0O7iO1L4SYMcYIzn6w5htK9xtoxbXmqx1yXtoLThSTYx
         rQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004207; x=1786609007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26NRoRzwiVWotGmaj874A5SOPi+McmmFg5EqHAlBJqg=;
        b=a6qKqVIOKLwOnyV1R6e1zKZ1uiAzJeFB6Atj8Y4wkWFcRDTJ8JRrY76hoNKJOCHZi5
         1iKMA0FUeZOtYfDGYkH6xFAxI8S92hy5gduX6bjFcuhAmscz3feJWSQc/sMutcETMQHa
         FVSVZ/ZIX++46BACc4rv7bE0ALLCj6I7MDqdrU/Q0o33bEywNkm+30R2JceuVn/MpX4s
         OnLPC5RsZkmm2OeXwe1amZdSWJ5+daqQq5sstnepd0uO2DJwWQ6Lpn7UWxA32Pz9E4z9
         3N5S7sygHCT8dxWdqxfbw8jaYTB6FL0C35+prAwAoxbgqLVuQq8Kt3QvOqgkFqZMFEP3
         sDlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZvAdMO+yCM9qd6t6NFbHZzYFjU4LHcQsWBn2g6FKhQYdoWiWvTQV3EzQ1ei92661V3DC6e41s28hxttVs@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyKixxTlitHqdd4RN+fh04d5ioVkV/YG6LPVsFQefWYiLc8sF
	TDJq7Y4h2sxj/KCEj9j/5Zf1xRfj0b8BSakopBgENGT0lkS/bziBiBC0r7G9llatNHyvOHfl64G
	a6NAasthX13KQ8XJNgOUwn8fzENY3ERxUAJ4Tn9j9fDLR04MwY+wNNk1H4vx5Btc6/xqF
X-Gm-Gg: AR+sD11OvdDhj8dDtpTNG1Y2dAB/YXoYZHvsFFY8na3uvbjiMHLiv/L2ilRcjSVG0yj
	4jV7pQVBzcDoQb7zfDXaF7gs/swutB2PdGsufcFpSpSS2r8w1HVo9GHQPSAP7ARe5LEVwp2v9rc
	5j98G8P+ZxDN8WrfQWrGBi8l0yU6aj/yeWGuiz0/LCpp+4AcuIwVrko7822MHWC8O553NG53JjY
	OpT5ThXeCg8DoW/8zZl1ow64iFuAnnq8gkNWDSi6qmJHyzaxvjZqezTv96RytQ0Jw7QrjbvE84Q
	eeEk+zv00PVblNSP5hbJ7i6dmF7Vl1l2KZAGmmceZ2FC8I8bahSNux2bK9edYtU+aB491zw4za3
	jQy/k3O5o4s7qJdKTfcP/5RtMpIfs8nwLatsNMH7qDXmW5KaAM143JIF7Wjsr
X-Received: by 2002:a05:6a00:12c9:b0:848:4a48:9f9f with SMTP id d2e1a72fcca58-84f2e0c9c9bmr13330896b3a.34.1786004207164;
        Thu, 06 Aug 2026 01:16:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c9:b0:848:4a48:9f9f with SMTP id d2e1a72fcca58-84f2e0c9c9bmr13330825b3a.34.1786004206687;
        Thu, 06 Aug 2026 01:16:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc9bsm921225b3a.11.2026.08.06.01.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:16:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Add initial device trees for Nord platform
Date: Thu,  6 Aug 2026 16:15:48 +0800
Message-ID: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a7442ef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ezZJ2SQG6veOboB-108A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: W75dIZZAypdXf1UKV9klPSslDjy6WmfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX+auMAgDIc4NI
 1wKf4G1NPG9wN9cKBMMpgO/SpQsnWUFyYOBKCIG9KEWVMS2Q5Av2LDZfwc+viUxcIdpgZ5FgQhh
 Ae4mAQfANY8tD5QDjyQ7KKmUNqGilyw=
X-Proofpoint-ORIG-GUID: W75dIZZAypdXf1UKV9klPSslDjy6WmfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX01WbbBKMu36g
 XbRlOI25TsVoplvCgAf+JYOshkPfs/vqMbo+OnP6iqy61kcBYLeXw+mVXWMtxiRGeBhne63SRya
 0/KKFhxuUFBRVoow5iXICNt8X2UNiFC3VAJvsiIACnsVE3dsXNoPJKbALXBpDFQYVVVnB5tPV4m
 UWioKaMigb9wgVJyh7/+zUc66nuTkhKIknpLnP/AdivoCnwxrs6RTrIh8nNKeIszR5ozacOR0Sx
 8Ox8p4e7mP69q8E8a3Ac3nkEJCWHNYdMwLn5raLp4iiA2YPsODy2ildbetAZ2LwJLJe4/YazZ+2
 E2jH2F1edzKTevL0W2FCoADtZwZwP4p+oiX+MjTdVf4y4qF+7gQljcQJtB8tLDAYbMcSLwe/8Zu
 O3WJytjVJS3mb8QSlIsPlWyMj/v+bDDIXYlxIlfaGfLcLPdX/AQC5rzW4peFOpcIwOhuU2hBsn6
 txN7x1n2iubYqcyTOHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060063

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260803.

Changes for v9:
- Re-add UFS support for gearvm variant as the binding dependency is
  resolved on linux-next
- Add #cooling-cells for cpus to make cpu cooling devices available for
  userspace to control
- Include CTS/RTS into UART17 pinctrl state to ease the Bluetooth
  enabling
- Link to v8: https://lore.kernel.org/all/20260729010022.875799-1-shengchao.guo@oss.qualcomm.com/

Changes for v8:
- Drop UFS support from gearvm variant to clear binding dependency
- Link to v7: https://lore.kernel.org/all/20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com/

Changes for v7:
- Do not paste the comment of bootloader updating IRQ number for each of
  the 64 SCMI instances
- Correct crypto status to be "okay" in nord-embedded.dtsi
- Drop scmi15 from nord-ride.dts as there is no consumers
- Drop unneeded LDO/SMPS regulators comment from nord-rrd.dts
- Drop regulator ufs_vdd_hba and ufs_vccq2 which do not exist on RRD
- Drop always-on/boot-on flag for vreg_l3e_1p8 and vreg_l2i_1p2 in
  nord-rrd.dts
- Drop untested I2C device and add tested EPSON RX8900 RTC for
  nord-rrd
- Restrict nord-rrd UFS PHY regulators as HPM only to avoid potential
  intermittent failures
- Link to v6: https://lore.kernel.org/all/20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com/

Changes for v6:
- Move ufs_mem_hc reg/reg-names from nord-embedded.dtsi into nord.dtsi
- Enable crypto by default only for nord-embedded variant 
- Add a comment above each SCMI 'interrupts' property to clarify that
  the IRQ number is expected to be updated by the bootloader
- Improve commit log of Embedded variant patch to be "directly controlled
  by the operating system"
- Merge two board binding patches into one
- Rename sa8797p-ride.dts to nord-ride.dts, iq10-rrd.dts to nord-rrd.dts
- Expand RRD acronym in DTS patch commit log
- Fix copyright in RRD DTS file
- Add firmware path for qupv3 nodes
- Link to v5: https://lore.kernel.org/all/20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com/

Changes for v5:
- Rename nord-sa8797p.dtsi to nord-gearvm.dtsi
- Merge scmi-common.dtsi to nord-gearvm.dtsi
- Drop "qcom,sa8797p" compatible
- Add Nord Embedded variant and IQ10 RRD board support
- Link to v4: https://lore.kernel.org/all/20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop useless comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones
- Link to v3: https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord GearVM variant
  arm64: dts: qcom: Add device tree for Nord Ride board

Shawn Guo (4):
  arm64: dts: qcom: Add device tree for Nord SoC series
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord reference boards
  arm64: dts: qcom: Add device tree for Nord RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1726 ++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2848 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  236 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  548 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4623 +++++++++++++++++
 7 files changed, 9989 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

