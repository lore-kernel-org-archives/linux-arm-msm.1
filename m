Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D57C340281
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253587; cv=none; b=QYJNDmcxpaJu6RoD/SUzoYt+6qI1MMtXRIeyZNz0yKzHCeM28Zjvh1z8g0IAhsmMTX0y4G+HyjG3DL/qeomCCzPPRGnD+bIk4k3QBXD+qHJlTTWcePR1XEPnyDpMjPu65sW+WkdHktxrNxzCFkL9ZEH8j8vFkAS7Stx9M9dofEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253587; c=relaxed/simple;
	bh=Wso0gz6bbwnq27ZeZscVJdsCyRDUFP7337Y0n047Hwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CDS73nOfUC7z90iOj9NJM8NU150aEvCJUl5Nhnav2etQ3bJdxo6YPzgNO9fFHdGBCxL2P9yUgt85JT4cIqy25VTsY0U9qT63xTq4rCJZcSNldqLjWgmdNvCatXG1v40JECag7bwmHJlGSPL6YHNWZs96rVsGXA2DVG/Q/SXsZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSObUk0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAeaBLmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSObUk0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAeaBLmk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnqcY3673263
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qo/alJEy7vIo96KOTMJ7e6
	M3U3FLNM2uacOSRSZn/+Q=; b=PSObUk0TqW1tzBh+Il1+sgE39qxNWbRVcnW+nV
	98PXPfqV/3mOucWC90QaNdkMQgHuS6jMEOKubhDXX0ND3FuEX5c2UV9LdUf94nU4
	nAfibdP/HienL44bojmSfH+NaP7SZtOHE2Yq80l35T6S2l/eXQXe1gKrCMpnAlVE
	V/mEGuHtgX90bm1GBT9xYqfBWkoMOSdoo0gzt5LrLQwE76igY9cK6W0ZzuRoj4MZ
	3BOyV7xQjiIoc21OyS+SQaNdlMUwxZ0q/wLUE+709W0lSeGVU1mZwqcTfw0qvgTg
	P1oNyFsGiBuPSMtRgH8gJvKHaMNrzITLd91EDxIlYxSF1p2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd235u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3634222a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253585; x=1789858385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qo/alJEy7vIo96KOTMJ7e6M3U3FLNM2uacOSRSZn/+Q=;
        b=WAeaBLmktbG3HIJ/HF5TP5l2EMOoZvaL4OHoGE9lpE+Tq2DaNOqOkEWjCuibPzMZH0
         p4aZGyyw7DBnobb8k7AN1Qx0MLRHxii/jXQVl0sXkdtCqbQOJKOXJPxB3fhYpqODGmxg
         L73+snq2C5Ctz79uJzBdP6bI0ETZF0McqJ1ObmIi05qhAVKYfzp35zi8i/4GtYzTkvVC
         I7HEB6IMrpinIL3FuaAwT+C2Z5ewRceEKSLCW3n22Ag2rplApE4kmvYWh57t/KIhOBum
         yx80VwQMqTnlIFX3ZvPEdVDXsrb8bpzdxAB8jahe1U69FBkdVIaWgqDMKf8nwzX8v0dy
         BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253585; x=1789858385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qo/alJEy7vIo96KOTMJ7e6M3U3FLNM2uacOSRSZn/+Q=;
        b=mJGcJ/7BuK3jFKwtdpCmgvHq4nkYeM9QsdOs8QNW2MyKofQA9YA9KXDkVnaMUyi5iG
         7iTCLVl/UiYqLg9/kMC5UuuLAAQO/MsnkcIQwWR/3BhWjnFpXtWuQT3A2QZ9PqgcYZPq
         bIn0oO+kMsYGklSktwJvuprW5zp4O3G0f9I0+ugUfVB/igai8wfJFaogv+en0RHtsqPU
         NAtQmnP5IQNawTtxeFixp/qUbHkJZoyYtIKVxLPV0bFZQt5xVWm1h46//tjbtlFF0a36
         R6BIs/bA2Ywl2O/O7fouZWU8zAmKdg3FfqmsatoSrxPhav+Scybjp8kf6ZcE37/FnyNH
         kSBg==
X-Gm-Message-State: AFuF++l+Lg563fohZc3PX/zKN/QUramx8hnBdiwpyhf/ou7k/GNwHN5/
	WVQlypdswXaL8gRbWu64cLBquPu5BdWyx8+Z5enyEwmE92XlIlR1H8/0zwcz5gz65oHF3KlElll
	APQh3tmsAoCJxUggrxJakMCTM/Fqonx2glkCS7LIhs5+NIcLnvvytCP5+RsCExtlXqMKz
X-Gm-Gg: AYBFou2TQryM3hg7szUteYZKPxByiPjEd8hcb9velvAXmW3RCXwSuzG7uD1VtKVDvuw
	dAtO9Np3P1SLi1o359bXrJ2PQ9NdVhMDfbkNwxthUsxi+kqVTy7+qq7PEdZk3SX2ys1L4wV4tjr
	tyW3HBLRTA4j4WgBPFuX1NOIMlZ0QIgqllKhNGp5g+5j1LSwVrTv5lQ8ne/qiXB0IsMVTwFpUQU
	cckNRoMH6aoux8gHHZe+dT5t+I4PIVq2PVWsbKq5b15Euuz+ZLu45klopeWCsnwGMokjRj2JEUi
	lg63p26GXF0HR7EDw4ODwnLRgd0uBg0EtAs1JgmqiBPMkCzDoxQLevwEsh7uylrg1Kb2uKvXfsJ
	ydpxlo5Am3acN5eJermT9MXLygcuyBliKu+cUSmE2JligKb8Tk4Ps6g==
X-Received: by 2002:a17:90b:3807:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39dbc6a018amr8215146a91.12.1789253584625;
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39dbc6a018amr8215106a91.12.1789253584121;
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:03 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/8] Improve Qualcomm EUD driver and platform support
Date: Sat, 12 Sep 2026 15:52:53 -0700
Message-Id: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wYpSvYA4TNd1uGNCPEsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX5lSo3ryD+Tlr
 kY3HmuEksLJ+CVGWYUmup+uSwWmv0v48Z8wNZ6iluxsYlj5BGZKPW/5wLIsZR+fgNcjpPi1px9s
 nmouYLItYa56TAOTxfvpniFyenI2zv9AJdf4xHJMhAiJyTDbNiqMNj1I4ff+JKRrz/+sciXg2i2
 I4jc5e6M95oGxgOXDJwHzBfb8sEeO/69mGNBrOSYG8be/fGuq/b2BEsPg85GTUUcEOXVy6UIQxa
 J92k/AbQ67jyvDmkpfFOQmHUNSMZWlFPU4yZ9vfr8uOZTHB4ikC9BBUu7hzLHGm4hyDobgUjLrZ
 LHSSgtR2PMPlEMS9AMkujgT6tzArm1O7mza5za2Y0jgJ+ksp4LiQhjBY34WIvAM21oWrFG/bykm
 tvwoOFUa71g8jT7XsgtfnAKz3UZBe78EPaUJvJ6gDfbktuo0m1L9Q+ZhVSDyg9rPDfoEBF0Cc/z
 KBRVVm3Ob9OOiWHcjcg==
X-Proofpoint-ORIG-GUID: inHBbaxCOnSNodW_MrzLU1UKvs0H0rHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4S2RP+o8knek
 e8GMNwnv7aUhSWoI9UkqfmANOCGddkE4cIy5hVzwuxEYcaHng3AtCTuO6WI9FxolaRfl3/ZiPyo
 aR2EY71F+8bCAwFFxvgAec1RnysLj7M=
X-Proofpoint-GUID: inHBbaxCOnSNodW_MrzLU1UKvs0H0rHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

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

Regards,
Elson

---
Changes in v8:
 - [Patch 0001] Require '#address-cells' and '#size-cells' for eud-path
   nodes to address Sashiko bot feedback. 
 - [Patch 0004] Set path->curr_role before forwarding the role request to
   the controller, as it reflects EUD's view of the role rather than the
   controller's outcome. This also addresses Sashiko feedback regarding
   EUD hardware potentially remaining enabled when the controller fails
   to complete the role switch. 
 - [Patch 0006] Acquire the lock in different execution paths to avoid
   potential races.
 - Link to v7: https://lore.kernel.org/all/20260831030147.1500616-1-elson.serrao@oss.qualcomm.com/

Changes in v7:
 - [Patch 0001] Explicitly disallow the legacy ports representation for
   SM8350, as pointed out by sashiko bot.
 - [Patch 0004] Simplify fixed-role handling by relying on dr_mode directly
   instead of an indirect USB_ROLE_NONE check (Konrad).
 - [Patch 0008] Squash the Kodiak EUD board endpoint remap into this patch,
   as applying it separately leaves the OF graph bidirectionality broken.
 - Link to v6: https://lore.kernel.org/all/20260811213610.2956147-1-elson.serrao@oss.qualcomm.com/

Changes in v6:
 - [Patch 0001] Fix oneOf schema to properly enforce mutual exclusivity
   between 'ports' and 'eud-path@N' (sashiko-bot).
 - [Patch 0009] Extend the eud_con remote-endpoint fix to
   sm7325-motorola-dubai-common.dtsi and sm7325-xiaomi-taoyao.dts to fix
   "not bidirectional" DT graph warning.
 - Link to v5: https://lore.kernel.org/all/20260803031534.2942628-1-elson.serrao@oss.qualcomm.com/

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

Elson Serrao (8):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector
    mapping

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  37 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../qcom/sm7325-motorola-dubai-common.dtsi    |   4 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |   4 +-
 drivers/usb/misc/qcom_eud.c                   | 350 ++++++++++++++++--
 14 files changed, 545 insertions(+), 75 deletions(-)

-- 
2.34.1

