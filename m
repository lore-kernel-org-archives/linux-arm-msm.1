Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DAA22AE65
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286843; cv=none; b=sbEsfb9/mriReEDTDhgGYT3bh7wrOMYlw4P2MxQiaL3YIByhwDFhVBvMNIsnV1+K1otNULKazy2BUQXPTSeJGqQFsJWICl5gVnv/cM+jdgMVTqqjM8LYwQC4YELVuvlZZxtVHjnI21BCLSl7/++TZiplDr5SESU8YuLdnRijxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286843; c=relaxed/simple;
	bh=pNkOGzAuW+AjCB+izF3yqPvkbuGXMifHd88ZV0z4YPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C93qPOlWRNLlZQ8z9m2EO+YeWP2F0wSB95XYnHr8Ff2KcM2xuRGka/yrUTIdO/0W85YXC1KH3x96hug/ZpybCfG5s1eK6aLn/cDwpOH2PJ/DV+Z14/PXWjbAqyWxdHS782QrnXWGvn/hUdazZHN1UrL9jCfan/KFlrXu5ET0yYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9VqK0BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFGLWajr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9VqK0BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFGLWajr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL36LU3469145
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SN
	w+oDBoII=; b=E9VqK0BQ4AhBZfX15SWi8N2xd/kPP1PWnVVx9YBXihD9Wo/NfVH
	dr+02+crc5MDz+BPsRHEt58tKRl+0SUk9rQBJ7KvJ4MvK8A+zFrfPO5UwZQ0XNo6
	rPeWsINXf6rE66Mv4ckzn1XDka1PFGEeIrhJSKxeSfLh7QR121nkDGyFGqkAlYJM
	Hm5IkrqhemXBA8sL8CfpQsZF2VYAKdg7W1OeKjS8/sUPHjgSPART/Px79j6MkLp4
	j2qrX/wnibyNfHWuyIyxmaINYke8B67GDqOGgmiRd0GpSum4vP3UlEy69xPOR4p7
	0uUOitIZMPX6hpxC772Ik/7kH34Bw1TiqVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hhr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:00:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso6133765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286841; x=1785891641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SNw+oDBoII=;
        b=QFGLWajrirtoYqDjT54Bm8nwIjoBOGW46CI+i35pFg7Ate2SDCWMWnT6YIvoGxwrfU
         wMYTJs68ZjswTvWDTb+XbIa60H66/Etay8R1BDikkkG8Hoh/9/tJA7/7Uj/PZiI863yc
         tNvcCMWx1q7xYz0geP7vUTaSveXmy3R9zlAzfJi3l+cjSEm0zn7H477RtFW95XqbdJLS
         rdGtw2MSug5hVtA0hGU9fYLl0GT0NzqPLs7d8xw3VrM8o7TTBu5K8G2mlnpAlgAE1V/Y
         GEgjjoi3lD3Smz8QYZkE5GdORG5xntiI7MmCS8Z7QgijPanPyozvnyS8263oSG9vHDWc
         RXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286841; x=1785891641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SNw+oDBoII=;
        b=cf1T+5vAdemUJU28quSlrLmwEIgnV9Vs2hMkahheQk8I7JHFVWM2iD76LLP8shmZNL
         tnGmYgWTdXS0JLLipKVoKTHfIF5SVncrGVqzDzmprRk1SVR0yDanXlyF7MBj6F6Hmr6u
         E/PZtygoAQJisZE/Uack75/HPquxsoopYKa9qHtiWwPWepxvyWeSitGxAfzXowCVTdHZ
         qE4Y/MYVYYF1wiMCi1stmBMrqQ5m61KsFucgAyfPHNpUxBujSfz3crR+Xc7wOUm9d9to
         K6UTG251s3T5I646BzVqKHi3mSVacXnaSbL1vOKK58d3lGQ9JAuWxv4r8z/ZEe4O/532
         4LAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsHStnz98URLe+dZKnhV0/ui5S49YvPukKfJGLttMwJo+rNnF2FiEYcnEn0b4zROL4iMsiUoX1UcQCK1yO@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOP7mpqWIQIpDiJ04ggwdYwIcxoQlxwHjuFj2P0F6jUHCyRWg
	LXvXFdkUZDeBc+OTxQmzuf8jIjApFVK2JDd/Bz5ovSLSm51v+DiBHXzn/MSAXYC5uJkY7QSt7tF
	xsyGbRKgCk1JTfTGnJL6jLyK3yYhLSh/HOhkn5A/+MuayyHiH0OVGRGJT30hYjJP3vmYN
X-Gm-Gg: AR+sD11rHoR+KgpigH8vxaGZ2u7B1wVn0+5EKz3ifehe54/OJCu49Mr78ORJaHVTWwu
	SMh1PY+Y3WK9XAq0GGfqKwWzeX3NO7eaTyLgkPbTHrNuJfei1OIkxDFU7kSR1cYSV/1N0owrN5i
	rZjaxcrhEuR0hk24KmAVSaHTw5mNKygei0YgC784mhV/ywYm24LN8AvsAbkSaILY5Fhj1O9kMKc
	OVMG2chOn6erRQ3ONzaPz9JCwk7ixkCXgvODpp561SXgcNYsQrOHZxM+0NjFJTh/5ujmdrqFnM3
	s/zXTRiAPzXtTUxLNlnvYwUl+SHge5fi0GZQe98KwAyKbCVPfFGrtzsUEP+/f6ZpXMlhk2B/5uj
	NwkWqRS9ckTaWAvM9R+osMJtn+Ghr7FZmrFz4VYOA9Xm/E2Xf/cZZNEaxlPyh
X-Received: by 2002:a17:903:19f0:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2d015b15bcbmr51873425ad.1.1785286840664;
        Tue, 28 Jul 2026 18:00:40 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2d015b15bcbmr51871935ad.1.1785286839055;
        Tue, 28 Jul 2026 18:00:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:00:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v8 0/6] Add initial device trees for Nord platform
Date: Wed, 29 Jul 2026 09:00:16 +0800
Message-ID: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX+5tbfz8ZazLp
 i5jjCm5ytgDtgb6Aqzj/MFh6DD2Ias59aBdjW+PVEm8uFpP0jO0vsWYpC9fz/n0swJ5j9vstWSk
 2lTjBhdaywsvAJYOm2GuWcmhxYBsjF9blqxnwd7xcuenhOBbgDBVUBbGlvvrPki+PGKhb6aYp1N
 JpW1yFpIVkRnxP4uDgexXH8jYaYTltbPWS6Dk07sjZqGgg0FYD0q4N92Pqo0ypw0RoJRJBHSbGS
 nJdN5MTIAJVddIZ46X2u/AJvF2cn7xx08xxeUsYreOqRglML/6VM4cKAv50hrPDnP0Ge5HXy5L7
 ctpx0l8Peuw2MO5OEHh/8vmw2xWLFag1kB/73Hkmoa+PGCOf12PqLF2MOkXwUEHhQ6VEFaUtINa
 7KmbqDYHuvpf0vhDBTJ75eLGmN9K7XQNK2q+WwvVOy4mfmSO0BQcCxBWvNl0g78R7U44BlHfOqH
 RpL5gAsrkKOZbTiR2ng==
X-Proofpoint-ORIG-GUID: 9hqzje927UJk7RPXxVBWBFmYCLrgpxni
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXx3OUNhezYjRx
 AWm9/wvsTZnhsrKVmYYUJF1LSIeyTwa956UxWb9nCa83JXpQavatl4Ce+4NPidIib5ky1r6HA1k
 S5e+0Fpv4EfZn6PBwZGMcdjjHUwoLdc=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6950b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ezZJ2SQG6veOboB-108A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9hqzje927UJk7RPXxVBWBFmYCLrgpxni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260728.

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
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2842 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  232 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  548 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 9961 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

