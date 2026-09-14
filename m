Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6154331EA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355672; cv=none; b=iOrM572hDD4kUniNa093sxrqi3fBoMEFvxFgbYsETLhVPyegl6Mnw8if7TubZ4Cij0wKcOSqqt6987yiyfGkfa85z8F9Tfju07Dw3kntVG+opGn9hQ3C1OqVKRLoYMI6hBd+TQMpSc/jq/JST9bbygrczSiH3iqpZ/r5NZdPzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355672; c=relaxed/simple;
	bh=snymw4TvmbaIkDH/GgtkuhtjJlGC7ZUr35xHtIZ6lN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/186MWdCUa68Lh6o6DSLVuQnul1vSbQgR8NIsO1QTx3Y0QpXfpC+13M6luv87GkCZDM0KmwSGOqlkP97eeIpYCI/2SRPEiJoTinkqJK8LViGOOTOlX5uieccFNPXULGy582T821XBdgxaCoZXYOR4ePOGNGU3nc2D+D3ihRia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwa5Yw+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2FcQ5An; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwa5Yw+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2FcQ5An"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2fU9R2243248
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/91o+3YiV14AczrUnuq6JE5YYHDhZE7Yseb
	LSsgmI9A=; b=bwa5Yw+rYsakBMkshHkL7vPavSliiEm56FxLZOZjz0/WO6+46xX
	o/tuombd0Yv1edNNbaCRtzx2Ai8Y8OZZt96HX2FCOy2vjRI54FYfHhH+TMwPan3X
	D/cGiYsKPqeSbwvdQnHlxd4ruylYTrKkdXkYylfoB4v6xT2NUSC9Vik3XCg8KEX4
	qmexZ4PV6IhgLDICr76VdkHDbycaCstczxKgK5PuiMfW/gAy4luluPcJ7r/orFDh
	6h4V+HJQ8J4iOT7jwTb22r3yU8RrtNiAp4B6yKQFUO73OYxCCgb7IeifNtrgscfb
	QTJVpGffDPkVIEGNuCIG/FIMxoOQrzAL1Ag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4p5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so770488a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355664; x=1789960464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/91o+3YiV14AczrUnuq6JE5YYHDhZE7YsebLSsgmI9A=;
        b=J2FcQ5AnmoGuLbxq98yoM5PjjFcCSDvO5ovlN61kkhtqGC77Y0WnYbPQAv5M9CPwXg
         b+KW/nBsHtfhX22zH98ncG+AIM/Vjt35fEdc/wZwNlh/ObG+g0nmtp5rqJCHbS1StLdM
         KTkGczrKNduAi+AF/F81swGuCjQ9RahCM5a1nz/taqcEWiMSkMk3+ChIQ+A4LPKi23Q/
         xgmTZM6McaLKyFQiWkaSd9g7myzBdaiBVxKWA+ECovOU7HzqQAcOEmdj2mZpo7IwoPQR
         twND+3zChFWqp0hFlXMlrAn4HdC9GGcxe9dY5dz/DpOX6dOQHWIQIwQo8jBQYh8sNlmT
         oD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355664; x=1789960464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/91o+3YiV14AczrUnuq6JE5YYHDhZE7YsebLSsgmI9A=;
        b=IjUfk3jscqiJFATOeKSOt3lnA5DgYI4MNvWFzcetYZ9G480RA/OcCggXx5bB0XDz3F
         8Mvf7sXoEsCxq8lFqW4v9QvqZclC5iVoi3e5D+PNjVT+ayjEJMPthBuswFyEVtBvf5Mb
         KTeRqMJ1BHXsu9Qby4U52vKrLOgJqOoE6+DCSknus0OpSy/FtwaFQpkgoss//Vrg3P+c
         gwwNp+zkFQ2wN7Fiiu2MLR/xB/WZaFJ5vrk6PVDDywebQaSEa7LWg+lx9pfjP+pd+ix7
         Y7t6mqvpw38FDiQQFV5kx21jYw2jAv8czAOO3jVNaoLEbnrM0b4Y7dOG47Lqg9hqw+Kd
         BSrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6LG6KQFTmDZwWJ0knzU2AULdCpVr0bqW0o77eh13XzbyYPpGJn8UxBinihWnVq3hKoeVf3Qiv+7oYMqcF@vger.kernel.org
X-Gm-Message-State: AFuF++n6DV0ONnGDxo6ysxL9cK+Der6Kjb4JMuSTVlrNmF+C4Nhl7TbV
	5mcTCKcwsrFAUXi8NyColuUZgKVqj8wj0v5z2tOIQIIbCsNZYXA6bh6Af5TbyNlU0ZLZsw9eWPV
	dKmIWlp+xXOTFnTwAFj5NP4S52U57oIEDFzb4wlZ9wsq3i7falsCyDanEC76pH8OqN6Q+
X-Gm-Gg: AYBFou3lH+J+0jopWiC0lKnf04Qmz0FSSqUd4psh3zkkHuVuRUDOmzP7lObyxWnk9ZR
	VmJW9awpTxRpyiUbz4NNT32Ru5Qx/od/fYB/rBDRaicfE+U5Uyq4I0trSRpnUUUt6B5EZPpnaXs
	ATxaHHW8OVHxM+/RBou+jQG+xhZVpxHm5duqc76Up6OmIQ3lFqIqjobnFgPa5HNZ1WfP9DjjKeO
	YlYXUQq6DvTRLcV8r2Fwry2nOZyyjLaRlCusPIa4fY01bWkWCB3a5818KFm0Jg2TJyIp6wZdRzQ
	6K0+6v4GhRaoG4VCQxIYbqxhQtIrWY0TW8QfJWVPzf0dmeT/u+GLVoNhb1EPjsubbzVpixdh8eu
	ccir0vThCglnuB5pWwspdnPmfRj/BGKWuD5jTE5PSGrwSvC1PLM5/XxFEoteI
X-Received: by 2002:a17:90b:44:b0:39d:e478:b263 with SMTP id 98e67ed59e1d1-39dec0d6bf6mr1715960a91.23.1789355664308;
        Sun, 13 Sep 2026 20:14:24 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:39d:e478:b263 with SMTP id 98e67ed59e1d1-39dec0d6bf6mr1715886a91.23.1789355663720;
        Sun, 13 Sep 2026 20:14:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v15 0/6] Add initial device trees for Nord platform
Date: Mon, 14 Sep 2026 11:14:05 +0800
Message-ID: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Uf0N257ae1FgQQX8r1zjVeStb9YsZCtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX4VIs3xNsjs1H
 gA5DAI3NHzGqruONV5aAVoQDk2/rgTSMFIV+R/TC6shxpKgGfwYKC2R7uce3sHBMQ0m++y7dBfZ
 WWxpTBpNQkYnegZ/EhFEkGCglcstlwFE84i8Jf+Vafb6Xe1HoM62aqxB1KqPOQRq8EiF7OQcB1d
 uQjOE8R+jT11Y0GFzxH+M8iCA7ZNqPvtbmKosZapEcCzqZDgzZpEA7oLIqmzVUiGyQEm1LQA3gy
 djq6/OLC1tdK4xYoAp+ImvzcRFGOo+l40NUBhXBvzLkopbK8I3ADMK5/SNdEcce+39YJSdqnkY+
 NQdvn3VX7ulHt6eivueoCph+7deHQfRMGinGNCqZGdZ88gF0eW02u+vAY+xIyDIThSlAax0CAj5
 UZBcQsseuy+Z8GL/a6pFYRlvWHAUNiS7PJDl1VuFs4yh31ehv7Qu98Onhx6hTe1tF78kjiWrmCP
 FAVvFZxTP1YKGl1MjaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX7D7d00O5BqGk
 72Tic2k8bSS16+JSbsLPCCcux7QcVqjzyHd+pM+qMmr9+Tj2Fvu9w27OiEs41ybEt+vrSHTEsFd
 K4ynkJ/OjYyl56EWGrv1DtU4+yN7nus=
X-Proofpoint-ORIG-GUID: Uf0N257ae1FgQQX8r1zjVeStb9YsZCtB
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa76691 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zn26RzM0P8J-Jt8AhNEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260911.

Changes for v15:
- Fix i2c9/i2c10 pin functions in nord-embedded.dtsi as the pinctrl
  driver fix has landed on linux-next
- Link to v14: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/

Changes for v14:
- Drop SMPS regulators from from nord-rrd.dts, as the resources are
  already managed as RPMh power domains (Thanks Konrad!)
- Link to v13: https://lore.kernel.org/all/20260828034958.3165-1-shengchao.guo@oss.qualcomm.com/

Changes for v13:
- Update commit log of patch 2/6 to reflect SCMI channels for I2C/SPI/UART
- Include qcom,rpmhpd.h instead of qcom-rpmpd.h in nord-embedded.dtsi
- Link to v12: https://lore.kernel.org/all/20260826041200.528588-1-shengchao.guo@oss.qualcomm.com/

Changes for v12:
- Update interconnect-names to be one-line-per-string style in
  nord-embedded.dtsi
- Fix SCMI channel for I2C and SPI in nord-gearvm.dtsi
- Correct cpu_perf node in nord.dtsi to be a power-domain provider
- Link to v11: https://lore.kernel.org/all/20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com/

Changes for v11:
- Use hyphen in rpmhpd OPP node names (opp2/opp3 - copy & paste from
  lemans.dtsi)
- Link to v10: https://lore.kernel.org/all/20260810114313.776563-1-shengchao.guo@oss.qualcomm.com/

Changes for v10:
- Fix reg size for ICE to match hardware specification (Thanks Kuldeep!)
- Link to v9: https://lore.kernel.org/all/20260806081554.448531-1-shengchao.guo@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1820 +++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2848 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  254 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  424 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 9959 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

