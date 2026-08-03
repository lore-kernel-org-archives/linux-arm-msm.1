Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543A3451A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726941; cv=none; b=VkzteevDtIvlDFDaCftBYH79McvUNl/zUrAxPkQW19olKgDlN64JVzZDGMbumCs8lYCoURFddGAB3xQdqIc79jU6pPxt56GZ256S4xUUf2XBiYb4F0+WyXNX2KGxLYRSINyALtJjE1i+7BIEpgny7vuSZrhuWN59kbnG3M7rTak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726941; c=relaxed/simple;
	bh=mRhZd4ArISJcnX2zf7KSxh5RdZds15VDAFB7RXCaohs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lr6K6OJ5B+iDjD7a/ooyh0Si1qmfczBhsttH7q8UOd6LmQ2GnHrNyu9HwFoHiA8DNziuU5UwHL0ExTIt4R4F95ejPY78snkmVeR1swSYUqes9oQ2d4F+nAIOpoIY6oIiGL4eGsolcoQWY0R5dN+I/AnY4cXc+GlxprqfbywEtmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx/KdwQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqqaBEgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx/KdwQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqqaBEgf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWlB52878802
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=alsyKeVDpdyzB30QyLw4UE
	PQxiF/ylPHfRQqsBXzg/A=; b=Hx/KdwQauF0kK2wCv8Cm36GYYOu32RkZ9axIe2
	J0shmGc7+xcE85C+4EeJXfi4JyUwlmCYCTDw2GQMpCEuQbu9SMtRZcAVaEPUpEuC
	u3y9/XNK2YjS2xTrf1ELHZQV3sZWL15aYVyeJw1K5w37GCppiqLVtmk3cOX+xDTC
	cbRH9WsjrqA+y8cN9zBtPMZzmYIrVtJZGRMM6cG3g60ojpZQ0Ax9dSZGTEokgxem
	20Z4w+Hd3qoqTi/gco0WwQt5kY6yazAHka5Gt6fyhl6uNQjB8rxsCo09v9jBVINv
	XFrc7mwWiaF0ranM0cKPiZoE8hqBPMvmdYEha3Zckcubxm4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtcbyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3084034a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726937; x=1786331737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=UqqaBEgflxmQl5J39R/9lWTAQDeHOXTz2p77ROUsh9FiTXE42mf7MLIkOfngN09vwN
         1jTMVw4CTKc14QJyr4LTjjZM0Jvqx2Dub9rtm96tnQ1p2MOgnR1z4iLde5Ob/A3bb7Sz
         jGcpsL7/unnkZncugHdsyWpdrWFD37hnSfWBDHcxEK84HylDQ2PEhpuKNiCB4oGvSfKK
         ySqURzLkBbCgFoLr09vmWNGoMxxEFidO4uhaBvUyQUFpd3hzK1GfBB1Ne9D6dQ+nvEg4
         4azIalv2T9smk53/iPXKn96iKaJejJ8EDne3XReekCb7pM5kaem9KWEGns3neZOuxUbX
         FekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726937; x=1786331737;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=I7E3JZIrbd+nRN+jfDXnWOToKQclYg+RVjADtiBf3gzdTg6oqIV55ohfh9BQ4b7iEf
         U/ZkCvvJqjyfrkWDB2ppAlzHeMRu9w+tOqgTWGUW9aTMtmptaAUJg/ZaFkV7/0re8bbu
         gjo/UvfeILFdM4KfQThQi8eOGHLeyEOjMQLZmEgOoHWXcPblTk5+EgHvpFcEWS43QpSm
         ow6ASdyfu5ZEfACyquMARbiddE/G3Xarad4xNwN+0qhGOdITT1pIH4VDEEmhYCqGkRFv
         1HOyZUyRehIxPvrU+C2xenT5CTPJeL7l7lTg8Q0eQ3hURrdAV5S8OZkSSeBJ3RyVhtNb
         sN7Q==
X-Gm-Message-State: AOJu0YwnnN0bKzh9KsYx4cXa9ipID3rF6vp6x0NV/OMjhewwZ9KkYCJi
	f1mvQnx7RzhOpQPd03qSMOu7QHC/Lwu3E6sEsYpmZJRvLhFcCnMKeCIW3bQiq1ymSTzldYj06YJ
	i4ihXYyAn534k9b3BYvMcjFpdL1O4IzMrdExdvvy2vDy8XTVPRsu6izwu40kal33rWOhsKyrUqj
	Xd
X-Gm-Gg: AR+sD13j7K684w2+6ssnmxRFKRi6p2GFRN+0YmA++r+CFP6dQEwC45bcKG9B88qUPv3
	J7zdsWZhJj4blJlzeqK1tZq7V7Xei/XwXsMwqIGmnQm/CdVNXNsj32SF9nadKCy8SrtxGFOrzuf
	n4PuQyIS+ghMl76Ag7ijj5VnSpEfDW4A8eGmIdO4NEmzUxNlzZdIGHMVAw06ZlSwIl3b9bv8EPl
	J3qKZ7ad2LUZH+O5wOPUl7ZD2xwWcEOkdiAjg5nTa+8gyurmEG/F2ndB+e4oC0S7WYnYmovE2T+
	LzSZvYRje2/5qSNitTgpt4YKxK6W8SGUeVfc5WKeX39YrqttnYOC475g6ZFKXFO+KsJLQy6RAfp
	hgXVpwu3AX7Uh6h0UsN/WuFvJLY1hYxzuBj7bq1eP/dmeoJOnSwPr5Q==
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753186a91.32.1785726936826;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753155a91.32.1785726936288;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:35 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Improve Qualcomm EUD driver and platform support
Date: Sun,  2 Aug 2026 20:15:25 -0700
Message-Id: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXzbXPYO7RmZAu
 YbWhkBRNaCc1wLB16FIkKyfinhJpc1BXQBy2PlS0EqDQapgJHDMn6OX3trzgejdTeZoVq1eJlA+
 Uo6SBPPmVb15ttJm0BBvaPDovgT3Y4Q=
X-Proofpoint-ORIG-GUID: dvsx0cmJt0uOw1RwSPcKi2IqIOBieWZX
X-Proofpoint-GUID: dvsx0cmJt0uOw1RwSPcKi2IqIOBieWZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX46nqZcOtFd/W
 tMSRSNQs2nXW1dLZfbSTVL4/Y4ZzUZ60VuG/kP//2ttnpcrbnn8Bxn58hUL7YGVSX0mCEWk32r/
 WxbxPO5GnrsJJ8p0nKA92/i6vbLVh/4SRkx7YVZAyW7FOyvrnRUMhS371hFSU8IfOGqDKQOez7g
 zBUlGZT0NhkVlL8xos8IhXANXern5LlyiuHsxx7B4+mjYTiCQZ35twFzcAzTY+v0/fn//AlmXrl
 AjhJ7fwH9xeDVe7L1JtLlRiq01QPAyoqBP+Rdp5U088fgbc1z8N38ZKsUTNJj03943JtazO9uY5
 PmUVRcKozpq/taXRKF2DRCkaebQTFTJFfCPwD+60X6pKCSq8W/LP2cRup3rofFzzF2fmH7yNkRp
 txQpH69Sitkv9gEWe1yOUKOhg4U5DuHd5LpTp5DVhWTCWMuloAq30hCLxS+yWLNL+zhTHx5Vh/9
 k+jpKs3TUSjy4I7cN2w==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a7007d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eIg1vlXWje1Bm5DpEBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Testing feedback:
 - Konrad Dybcio reported running a slightly modified version of this
   series on Agatti with no obvious issues:
   https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/

---
Changes in v5:
 - [Patch 0001] Add a compatible for a SoC that supports EUD over two
   ports, restrict paths based on SoC hardware, and improve the commit
   message [Krzysztof/Dmitry]
 - [Patch 0002/0003] Document error codes in ABI doc.
 - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
   Add a dr_mode check to handle cases where the USB controller
   operates in a fixed role without role-switch support (based on
   internal testing).
 - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
   device role entry/exit [Peter]. Allow EUD to be powered on only in
   device role and defer enablement in other roles until the port
   switches to device role.
 - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/

Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (9):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
  arm64: dts: qcom: Map USB connector to EUD on Kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 332 ++++++++++++++++--
 12 files changed, 513 insertions(+), 69 deletions(-)

-- 
2.34.1

