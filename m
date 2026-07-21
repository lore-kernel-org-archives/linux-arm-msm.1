Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295D2E7BD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608827; cv=none; b=ralkf8ppBZ8YyVEuGJDgwVjARG7QnVIXWg4C+jVTpCJWDCQPAVAY5u3v0bI+vUEdNfZyK9U6KpD/xToiRcVCgS2vtc24DxB++u+EX1TeTXM+Gp0QGXYyu6HpcTCDd96KSx8zlGuvNbhj+uVdiwqtJEonvqgX0U0uktpIhYlDJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608827; c=relaxed/simple;
	bh=9dDDWzd9UQKDXolx5PvZvmKh/x2OYKtsP8CYvPLVb6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJUsPMeEB++NQ1m2WMFzDTM7IuRgVNjXMOR3weWSx4b5Gu29rJx1F3cLpbyJMQKFwgmAiMyWil4QtrN+w/LnyG8C+5YeIOlHkpr2HFWHufLc48JsnY9qZqoKMgXaEoAjXExmzfJh7x6vcpUQKi/A3W4IY1ymkaexrulIAhFTWpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDaqMXGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6k13Xys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDaqMXGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6k13Xys"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND1vh3884920
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VCRcRqxQprX0Lq8nrawfn5tq9ZAYq0oc5r
	TQmSQ38c=; b=eDaqMXGiahFCzRzwjCZqIaCNLyf6xYpwxaE/CGTHQFdgExIAPdr
	JoDfNr4GpZd9BkVnSIaXBJ3Y3z+6ufnO2dGGAGEtKUxYrKDeaZ5HRcCpqmjXjjvb
	KZr57//BVtrJVzTEPYzODVGQikGP1Ytvjjs/webiJ3eD48EkKD3E5LIunPNVdXv2
	VHaOH5yzg8quCKT/JBWBCTDyek264m8iCuh/9rtJkjnaGrmX7W1dpAmFTJMpiPSj
	7DPb1FY70UkhsHu6SYENXIYNo9skm5qenZrJnhyaLl/bAslTSRPA4jo7H0PWqQDc
	p0DJvnoYreR1OF1Kw9d1yrUivA7zVdPUD4g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcab44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so18476815a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784608823; x=1785213623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VCRcRqxQprX0Lq8nrawfn5tq9ZAYq0oc5rTQmSQ38c=;
        b=B6k13XyskSxE90BxFALBDvWaAZWXmHH8fPtc/PigDjad5AA6oGyeH+e9aM1UiC4+BN
         Ii8lHlT9FskRkXjGG3RzK2fRMpnrr00YvytanGFJ2W/Vx1nY9RQmSgZxBk6xR2NkI0Nb
         Haae7nhorzk9CPCy9E7QvpDZcanW2i/fnlbotFtmcnCCO014ZQzI1VjPNpr2r5B4H64i
         iRAqajPDib/s+aN0X2Q4IppDZ6Mi0yZqoI0fHsC8SB1BVuRkBSSXlKIvgTVrpkNboobm
         C8Kd/7LHPjXAt2ds912ApFEzmnAnCCOpY1tjwJcikqT56xQC6DDtdpAC5cI30Se9L1do
         MYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784608823; x=1785213623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VCRcRqxQprX0Lq8nrawfn5tq9ZAYq0oc5rTQmSQ38c=;
        b=s7nlrEfuITeEhMGQ8XJx0L6nGVuSMJ8UrrgSs36r41oklFHYoBKKzZRxt7cumKf82O
         M/lKWpz/LOaUiRfCxrJMMgzblow9Rv5xoOvQ1YqCeFnr+717Ggw4QpVTPPjGsC7BobHw
         GYYpAukihRXsqyMmTR5JgQlNP9ZjcUJ+1mvCeBAgvvU9sWHpPNifOcrWRyXY472WsLMk
         1iC5DM6I/oSm1sT7IZ04nyFUnOA/VVZ5sOrRfULP4RyERZzK7RrRGRISNn4FQW3Wqwub
         wh9IZuYhnBbdQ5th4aypKK/wr+euOx9Mugckke7IOBhTgMyEu25YccAHWMkKkqyj17s2
         azyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj9JRRAotUGaIXAbqvVEsAvmuPIlCRqqJ8c/t1SVRAryTdV01eM0H/1hQe8qJIGLMaYOYiMnp0SvohiRls@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuB3QfkKbJYt7vlHXWfxFFVTlToIZ8hqwsqvFLOpgkO01DlzL
	aNN/aQhpJv3WohN+SiQjM2gE9G8MAW7Yqundy89VU/m+/IcT2Ngb8MlTS/TvEDjU4lznn3E2+us
	3Za/YOjEyYkDzLwFPlT9rOQvnIwh113r7ZPMa8iGWg8rrBwmWOPPMOTdIifO7wscxgR5C
X-Gm-Gg: AR+sD11q94/ht6ATrarGxaSuOkBmNEK2HnS2MyLUuu5svSIwzUlXWhVXqgU1fX5HIpb
	l7AcgoKwuiN1Mp23pjaxlU33k4Ybrr6m2YwzE7MDXXUTHA9YRBKdxzxsV2sHrAbLx+BD+0mC5Yr
	55QL0SR4qhM0k9VMchc/lNJ7I8fNsLcqQ86tWiB1LvFko1YCb3b0T0oJNV7BN8tsLBUVeofQl4X
	tYVU2TUzGU65S8ASN76VC1VeAvpx69Si3rwxgSjKfmRf3AcauSfgThTj6k0lWwFTChEBR+/2IHV
	pwFoPkAfUOLV4WiKNysdb8qxI2wypKWY7urgTrslIBAy+ed/xMLI3/EcZdQ10QDw/xd2+42X4rQ
	85Vv8FKvESGzuIN0l1zldmQUx8chWXyJu7oXgx2KYUwhjARrwp2cSMOz1uJ2Y
X-Received: by 2002:a17:90b:3dce:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38e4b5d3ec4mr17303047a91.38.1784608823017;
        Mon, 20 Jul 2026 21:40:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3dce:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38e4b5d3ec4mr17303015a91.38.1784608822372;
        Mon, 20 Jul 2026 21:40:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm36532895c88.6.2026.07.20.21.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:40:21 -0700 (PDT)
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
Subject: [PATCH v7 0/6] Add initial device trees for Nord platform
Date: Tue, 21 Jul 2026 12:39:59 +0800
Message-ID: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfXzn4jY6rp0D88
 gkp8ueF14YF8w1fi3G8qO9Dkd2QU9uibPVYJsyRvtjEd8CSGUJkTRS0dL+bG8CoELCQrnGpzvPF
 Elr1jY80K9Bf169DQsa9nqcdeMM20ok=
X-Proofpoint-GUID: UysKssBI4M8psRj-Wq6jWD4rAMb1kx2C
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5ef838 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ezZJ2SQG6veOboB-108A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: UysKssBI4M8psRj-Wq6jWD4rAMb1kx2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX6IiAptSwHj/4
 s7SAkynaYJpiokWBZQsDB1cSop4gIH7T1p53LUGnvpWHT6m8B4u3wd3dzmAcuJx4FgYrytqBMUL
 Ql4HPWjLui5rahbCjGQHm8x/OnjDLyCsdusqIsVJJYexTLWx2WNKwKiyjjdn3DoxvOG7eGtfaIw
 Vty+yGIy682vm6ogq7r1zh5QVcgYNbkEenJrV/QUYf8xxwQYRZcw/HQmaOz7DFmdvzALatpibxe
 GtVC65tfzVf/UES15K/RCSa7fC7a7G6Dd1bYiovd05AwSTZdbMJzl29OnsdrOWlEyEuQ1fYo6X3
 yfDj+oSn/gIZT0fPwm78hlwFyfRMbXuZS0zUPMdrGOi2d2ulfdtBRRwsFyeNsjBmpLhEEvyYY+/
 4ip1vQTvclIbimU1I84ZSR8w55m3BO8dXDnHfUbpK6Dyrp0u4GVG562LBeJwlpEK3oTWuLvugMX
 F5YAKkAFscoVDJri7iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210045

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260713

Binding Dependencies:
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/
- SPI: https://lore.kernel.org/all/20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com/
- UFS: https://lore.kernel.org/all/20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 9971 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

