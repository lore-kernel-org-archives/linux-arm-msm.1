Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778F33F5A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994506; cv=none; b=Wx1WQknhc8zanyfmMAYu6e6r4p5Mp/mTSzALashtOl9wSHVRZYA9Lej0kiryLJ0kpycvoj83kRMIXGLXXJmh1jW6ucm3XFqKA00ZmSVNJnF0zgGlKYDjoHdvIf7GwbPkoWe6n4L4z1JqqFlH7QnTDUjZV+7S0gzfT2QnxllDQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994506; c=relaxed/simple;
	bh=v9+RVNO5ATYQGW2SKKj122IvyxW6rpiyCy6+FAKY+o4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WJLE4MF4K3xsF0zonymoCK4zS2ZKSzSN6a7xgY2CV64yVKSvM6nsDmuhgiWzuZoJB8rw7XCl9uHmFo3fV2oii78ha26I5wYMsmmHLk6B9rdQDXfTY04yhrADcrYygW4342Xl9BjPKRxgG3nRRfiTEPFNc5nGZuwqM5/UKOJ22ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOTf3a9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M73WV7j3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOTf3a9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M73WV7j3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wxsY1071058
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 05:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=03WiTxy55cg9ahq7Xd/QQL
	2gXl1BS1EpXPfEN+Ymhr8=; b=DOTf3a9b3dWlceHcJYaYFYBMhn2OrozbJABsRU
	6gO9qLwHWCQZhpEtUlL2pn5YjnP6O+/nykf+zJ/ZFXbNd3ghhzai+9EDQfQuTIA1
	LMBamx37LM3/YVGNhzaQBCHUVkVoN8AiyuyMHggvIBMg4N7gpCC+5IUXRBHI2QjF
	yOxlMdb4763s28W6OgEuGR8yS55XnYkmrOf9YUk0u3Xm9ODT28P98uJs+dXuayq2
	I+drtEIP7KtWldUQQVRv2uisVNtOeC0ciJq+UufrBGjR2HvzAOXcichKjoy4+LyC
	JFB7m6gXzyXI7dhb5v879AKrbUkR3p+X7KTm29TpclywQpXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud09ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:35:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so39008505ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 22:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785994502; x=1786599302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=03WiTxy55cg9ahq7Xd/QQL2gXl1BS1EpXPfEN+Ymhr8=;
        b=M73WV7j315WEhqsady4mRoQBu9t9gJ2Gz1FD9DQIJ4LMz57UrmGkbCs1Jh6wXfBSrD
         mgMQ4bx5fcr3pG/qyaFLRZbNryeQRAdJ6w6Kg1ILRyWR566ewGuPyiFvqL2VPj8QMlVW
         EtBihlTjjJpN0KuqmdrcSb3aQ5H4Lx7x99bDJno2crJAI9ZncpA0cTd5NHRF5P/eSqd3
         3Q0pbW3hdk+aPvrnn9NFQj19HYFJyUV2toitSI75xNLZpEAQzNgncs61kiMNQd8ocUMV
         0tomDSUZ1605IJI0LIuoOVnqVDfB5Kj/eB2g7ofTpNDMXuUlKr5ok0xmny3rZ3tEXOic
         4wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994502; x=1786599302;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=03WiTxy55cg9ahq7Xd/QQL2gXl1BS1EpXPfEN+Ymhr8=;
        b=tHk/nSn59jdiGt6IWzwpYroBDdjuHgM1z5f8MElRK4oEQzXo64RxNNirF6066hFc9V
         0ct/OcaK1IlYvsOV2nIuOHVgKmqljnoFOc6J6fquUk9hHXaQRIjMcUv1n+iZfB2o23e/
         bWpfanzb0o8YTU8POlMZVpY7zw8+HI9X3ev27Qoc1gJYp8eyfD7tCjkKVR+nRcGr2XX4
         /jdxJlnOR7sGqSAiM+K+srjnv2KNqZudhvNrffvIrqpDiKbYBc4q/lfymDgcghruM1K6
         EMZZPY1nuKcLgAZ4/H5SYkpXNytIOUwSmNzKdgBfTSl45eq5EfuwsR3QBKFfFyjfJZyI
         bCeQ==
X-Gm-Message-State: AOJu0YxjXFdav9CEBNJ1+2EL1HaCn57ezgp1su9QLgn9UafD4YSb506J
	9WCJ2g9RqMr8e2CwlxmZwqoLfWMRMdd2V+9u+HJAsFVcTaJK+YOwW2BfeAN7EQ03tib0x5D8E0P
	1RLR+ZnObXnROu3R/fauNpbw5wNyaJZ0bRoRlDYPc5EcSgJMna+hNRSOelpfzhrvON9TE
X-Gm-Gg: AR+sD13BLHTaTIuttK4VdcnyIhHcWB/VJtKrO2LCVZsfRElFMs5NLgykqTZ32h3DEZ9
	qeSKIttFZmRIiCf4RVoCL0+3XgOWantB5mYB85ekMm0nGJdPKvIeDR4H5Tgd6nMljCbL5SdWcYE
	lxT/SfxjE5shjYgBuLQVc/aZCxCYpvwK/557wVw2wX8s9dlYwNS/owwc8IWbAagXZumgiC5Slz3
	f4s3rJdW6Ju1DtlU0seS90QnEUH1QIJbCKngLX2IBghyL6a50o0+jjiDpEzhPFszLNheAj6ATYk
	8LOCLLQHqQljJwrBkOvI3dGtufPiEKTs9+VkR4jA+26M/FJRlKhH+yGrKxC0LlxDdxRZ9FKuV9V
	flrsRCz8OpVTXZpcyPOoBciR+eWy1D3RDaQmODur/6Kt8hTQ=
X-Received: by 2002:a17:902:e842:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d0ca70eb30mr128246205ad.7.1785994502023;
        Wed, 05 Aug 2026 22:35:02 -0700 (PDT)
X-Received: by 2002:a17:902:e842:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d0ca70eb30mr128245635ad.7.1785994501559;
        Wed, 05 Aug 2026 22:35:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm25780085ad.16.2026.08.05.22.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:01 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Wed, 05 Aug 2026 22:34:54 -0700
Message-Id: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4cdGoC/yWMUQqEMAwFryL5XiEWtMWryFJqjRpB3W1UBPHuV
 v2c95g5QCgwCZTJAYE2Fp6nCOqTgO/d1FHKTWRQqAo0mKe9G2dnFy/B/gO19hlN4Z3OELU2DUT
 1Fx/en2z1fVnWeiC/3C04zwsoP87geAAAAA==
X-Change-ID: 20260805-hamoa_tcsr_qref_0805-86ca7100778d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785994500; l=3675;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=v9+RVNO5ATYQGW2SKKj122IvyxW6rpiyCy6+FAKY+o4=;
 b=zF1HUOY30kPlvTK/QLV6dvtA9LanNYeY/dfge7lhv6tpBGjyvRlh/gzMBFUNmpPqAPi8ut0A7
 CZR2qjwFu/ZCS9tR00orepZk7XVwsz/Y/rJUgL/AmygrtX56YfUeYpz
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX5jiKgLfj+x6V
 jn9CoSXW+GpV+3jix9wGo09dnkTrv5nGqS1fum6HBvgHrby4tFZO6ksJYlOvYronJtn5z87lIAY
 To3yzgwzDko2Y/RG527AUmS7LH8qCVC3YdVmr4pI08WIo2oH8aM5wkL8SIeosxck/9Ze9nog90u
 MmZJR3roXYWHz+pws55ORSmumxiKNkGNfSn4csuiwFd6FL8+ovx6UpMoZf8v/GkZKECe9WPv2Vb
 SjHl3Oc6lzWvwbVk24nAfiLrrnHWPQnvh4H9TnbrTmobf4pLEBrovU16j2ODU/9mHhBGzhbGvi3
 6DJUpLPXbjmnQoKWs48s3hchbYDwsIb9JlthUkztPj99oVkBI6bZYRq93D5qIvEQioR9FgIarnb
 WSpotuS16af8f7jYLRbDA+HRr89G7JhgDV7lny41V1VvBoWFAsMwMBzUSYZuGHNwiGFAooU1vvz
 cJ25PV7bN7aFfFjBNzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfXy3rlvenTVRYd
 YbkfKbyKDmZIYiKNABUJyY83WATQys+O1e0LIC2crB+4WedcdtJasySnstgSREK2KGGee7cNF2O
 gZAjN9P8cVGU64UFrkfqZyFRTOWVMJ4=
X-Proofpoint-GUID: TJEH7Y5EKuWB8HQqCw7bosjdzkib9x9P
X-Proofpoint-ORIG-GUID: TJEH7Y5EKuWB8HQqCw7bosjdzkib9x9P
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a741d07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=eDrWBMRqIGSfgiUSBJUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060040

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

---
Changes in v2:
- Patch 1: Explain in the commit message about the ABI break.
- Link to v1: https://lore.kernel.org/all/20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

---
Qiang Yu (3):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 22 files changed, 630 insertions(+), 223 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-hamoa_tcsr_qref_0805-86ca7100778d

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

