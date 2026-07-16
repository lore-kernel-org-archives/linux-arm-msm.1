Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90132424D75
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211999; cv=none; b=IZX834TXBeIEEl6X5Y6NuFs/ySN664RzlY/flph6NL7ZrZhYLuauMR5zMH2y2+vJPKcUysFdPWM5Xk/nKFK3uAtlIGsTGq0HGF6DctTRGZab7uvJsm8tK9TfLLao0NP+A2/IdeDgIDL36vuUUSkWjxZ4vfnH8B5m3wChpXRkMvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211999; c=relaxed/simple;
	bh=S7fpr3OXJiC9hT6kjY/96Bc/I1lo5ks9tED3YRO/kKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AiMWLjBFKqts55pgD7YG7qObleet1Aap1xs6nspHCZ/nwUDYNFkzpCh+NSxEsO9jhdQ4HwYo5bjv1JID3JkbfL7bQWEzCsHAm+QoXR/r9EcsW/BZqL+kMUYrBDXbbS5yBk0of0H4ZkhBY11ZuymGFctTkEo1IqUR5yGbaG9RjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geYvBDiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/NPQjRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geYvBDiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/NPQjRa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwtl2569619
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokU
	YHIq8vus=; b=geYvBDiXmrZa1lnE6LglnHjD2YKbjMsALXA8X5IdAs4GBKebgDJ
	QQYzQOhyjgbPO9bndMhyjDsEzpKsPqzV5z8frpdbpuTPMrELNqXwvldf4jazAQ2A
	aHcdIH9SgJLO7OL/+YC2bkdenvlaeIcHpBJ+dLQ0CY++XhDxC9yEvVE1C1QpxvTa
	fMB1tEPFPkpQzrqRRYIIYdOHv+H+61xWmFmcTAyEPYo8NDHpAUbCtkwX5/56dwOD
	xQRxBoQLfjyH85Tv2wqqrQAGIQLp1PaDhCxpGoxIC7KA0RZpBEUI2AFjTreTyxMx
	Dly6xjUXuqOAnizSGzLv0KTYOrmrzllk3Ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064w0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so1217201cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211995; x=1784816795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokUYHIq8vus=;
        b=W/NPQjRaAFd//SouLpx+HIN+Ptrch8GWVDscsnTuYaS6V+mJ/F9FBd4rpGPos5aG3q
         2TELk6XLkzBjpa0M6RG2BIiuoAu591fvmoODzPwae0jifuiKbL75iZTdbiggHlNaLS05
         VveELGjQ+KYt6KlrBGpWXPzIO71nSF0ffX5iN2uD1pTYmI0vBTlDReMAo09JEcrsx/db
         /KdWgVEDwzd9qpFplc4QtPSm0KZ30YuaNzubj42gH30FaxKWDdr8D7ix+te8UgniQlHH
         if6hUb2oyzgrBQEdZP4LUwXQNCRj10OYMU9sMSO8Ba0FfVM0uVJGkpxztZ4v73Gx+isR
         FkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211995; x=1784816795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokUYHIq8vus=;
        b=etrGkJrztes4yPg9YDgQIMa4NOAg6iGQJP3BRsP75Quqf/s4zHVjWpaf/YYOCkEwfr
         BqtizN5XBJts9xLuTa2g/aipagFiCfgN0mFtgrVSkrwl3zcqcRA+SMqRlcu5DdwfZjOH
         JWzcJw2um8S8ZFXcq+VyBo4tmPfHlT6EZS+BDR3DhOd0wIxYeF6HGLG6ke3DJY4kz4ug
         wle5Zc5IqKy7xgJmzW9fJzQ2wqeBAJ7P2ukqsBqtZqWU8I6PBhXahSGQPvlk6gH7UTgE
         fXfjjoPzvWW0qsJHMTGZkR4o3M318NqoDCks7TixLWVwRr0sHfTZaJv+WAqlFui7y9GD
         EbaA==
X-Forwarded-Encrypted: i=1; AHgh+RrlqX2xisUEef+XaO+Mgsy0I7PCe8UhAN3ESqnraBNE0VQy+piRc7kwo3W7MP6Zc7l7NgeRbvArgnsc7R6U@vger.kernel.org
X-Gm-Message-State: AOJu0YwhW+WErQkz7F61FlY6FJXUAw9TJfhXD9o1Yfu3XE/3ABMOUo9E
	B8s06f9CP4e1TcxB2I9Cpwn/8MOTFx2Gpao2rpT3szbJrvMToTkoWKcuAIt76D92ERCBSHe6b83
	wQ1NoBZwaacby5SLE/1wMU0kmTVvNfZcU11tC2WmVHs+8CiTT3wlkwqOp1QxWRkLNHNQs
X-Gm-Gg: AfdE7cmThbD9eJ9CdParmyfh87hjx1f5mnEmYKXeS3E/ZOslV/2z98mV/lCZI8erbrn
	VVv7CuK1yQ+nBP4HVYSPjRRKdzxEE4xt1dQOI3I+kp5qZ44YdH0fH2nUCf/6qbAy15QufNgU8Cu
	/xuwsjHn2SPRhBS45E7bS8hQqEfE9yhDQ5/aSluLQxhz7Xcf4gpJRXTt34JieJzGl9qgoQA/rwP
	dm0KBQhdgv+Upf8CCdGnuxRdmP71iP5mFLtyI+PJyeHG5yyiAMuQT7uAtr+PexDTlmjJY0JOdi3
	h23OBI/SN0rPlBNCaxmiGTi2lsNMnJ8g2iRgEeD5Cn9JRjIfoG5UQDIr0G84i96I51/i4NJnXoF
	kaz7pjkIEHbB7IqjVK0JisDkNeMDL4JLgXWMBYFNabwnfOIjqUv7LffN4d6gA
X-Received: by 2002:a05:622a:11d3:b0:51b:60f1:689a with SMTP id d75a77b69052e-51e4ede2408mr78943561cf.7.1784211995407;
        Thu, 16 Jul 2026 07:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:11d3:b0:51b:60f1:689a with SMTP id d75a77b69052e-51e4ede2408mr78942901cf.7.1784211994566;
        Thu, 16 Jul 2026 07:26:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm152869121cf.4.2026.07.16.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:26:34 -0700 (PDT)
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
Subject: [PATCH v6 0/6] Add initial device trees for Nord platform
Date: Thu, 16 Jul 2026 22:25:55 +0800
Message-ID: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX6yftUZ2AtZRJ
 g5tXbqvfOio+eAwQ483mhzYsdNxZoMVGVaBuOtd9upvsVAWOaa/VpeqDVGj+9ZNKrcu63KzXUJP
 8ds8F9Cqsr/nVSTTdsxLZmnMOOIfTFw=
X-Proofpoint-GUID: xx9QsQVvsO-AffBdTHuDN3QUC84wvnSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX4pqsYe5tyyUr
 mBGNy0vNl88f5rt9Dgh/FYnuBzlPt+XuudaPLXiEwEfdLVJ7Y08FSc4jXCsMsExCaX8K7fiXVnv
 6Cw3xDz5GnpQ/Vg5jeqr2R12CEpbh+tmpirF5zXCmPo7b7GPGzXC4upbMKwtMKjq7Wju5MEUi1u
 /oVknNEQGvYAJAtV2fmzQHX6ewjP4xHNZQsRZggn/c6QkVbqf4ZJX0iix+8SloSEeEYVwSXGLkK
 cER/bvy0yWPUcAta1hhz2EIPtprOkJW3VH5cuWn1VLN8dt23/np7cdM07JksAUH4KWCZWFGmJ0c
 PK+rRRdhgvnBs9z3SUlI7QX5ThJdt/8Z0AfHPqixKMa9dmaLBraSK3I6VVNKVXQ9XzoDMccRn2l
 emI6Chdk/FkewMkBr9D4PK8L7lZ3tiTCHhfWarwSF9jqbtYSV/P3i5iNyh7O3fUxN/bxYW1psoD
 uA09iUvynwgAbg36hXA==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58ea1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=avSFmSnnVhJmRsJhiZ0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xx9QsQVvsO-AffBdTHuDN3QUC84wvnSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

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
- UFS: https://lore.kernel.org/all/20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2911 +++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  240 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  612 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 10102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

