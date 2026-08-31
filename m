Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3BA20E030
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157514; cv=none; b=Lue97p92eZ2ST6b5Yc4ZN6S45xiVy1gf9Tjz/ocu+SdPZvbEtEZ/WGQ1Ch+X+41D8uWMZ0ZE7RF8ghgAYHI6SiKl2zBJOm7tdCR0Cc5VTD+Z9VxspyEQAnZb83a9JvZzVE3Sn3K79cfPcjDW4dtspVvDVxNv3VTXGuibxq6sar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157514; c=relaxed/simple;
	bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GqknV7msn2G0SRQK3FCtN7pKnEIVLIVvRuSwOIMEbKu1iPopf2NtiYA3RTTjV5VgCWM5IUtMCqanuch9FdQ9UhAhSDM8yFFTvFVh7WkryhGRBTLCN57piPGq5n97xPz0J70/xpr/RckPrgmv47Qq19S8W9rtGNaAUu7uAd0AVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjSUdQM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/kmaEkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjSUdQM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/kmaEkk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52agb3678937
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6juFQN7B89zvS8ijt0JeAa
	HNdtu+E0yqcKN77EHc6FA=; b=YjSUdQM4vCA96F6RyNPJZmnb5OgUX1VwtHf4Ie
	DLptRa9hhKKl77OVdL2AYWo2jrf1hrng3lG9pfBIuyT+dQOFZ3VS1SuM98V41Fee
	IZ5gkZcuQZvxPQAQEoB6Q14z54XSeyC43ciJSxh5zeA4wrhjRdo3hUArLJUpef66
	fn/o13UiN1DDnzUdsCC75I12YFkzIAmO1WAKrl22niUSOU+1RfS3RELbAQRsnKK1
	ivMey+Ws/FQFTEY/EFezEZvsozTNiFM5j4oop7WO/E/5eQ9OiQaNlVZhAbIUdNiD
	sEqsZbnw3UWgGvT65WyAjqKzq5V8OPxGRjMcJa/gT2JnPkzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1553-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:25:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so36584155ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788157512; x=1788762312; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=O/kmaEkksiYdv3zAUGr5ldGb/a/hlFmmGyHsvDq3cb1xg4+/aC86atyTJoW6ef86Rx
         JKHHFaIwAilpLSAuFOs+LBSFy+NQMO988NtSVZfYeOn0t80N+VWDjerp22ybUpWSOMwD
         U5Bifqy/E3qGjFB3yA18KhpQyBL9cWxHSXW3COl5YSODjNqS+dS4HaN6Xahdo5TSQd7E
         kLZnUouo1rKwCo0tB0jUbiFbgBBU2UBG219ySvN/f4hwROr9iXWttT/V0m/ljf2DPTf4
         QkS3K5u/bLb3ZSRzXQjVsjywIJcu2OCxowfH1aJ+kUio31Ks//On13mlee6kpW9ow2Iz
         S5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788157512; x=1788762312;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=rICie683x6TNNBOfYk27wVEy+aVNR+Go8bSG6bHp00ATiFdQLYwCYJvB/Og1eI8VNi
         6lOfFG0x1AV4b6/oXi4gyAdHjPPt2ow9ghxy09srv13jTHH0BcZCgeRNIyznz6iyCGHv
         GL4KaC6wB1BL4HCA9zNRmLjOpxrhC+YYiGqCSCkZkUhF9Ezx+rzbZhR6QkNpbJGQkRXU
         EzL4VgV+tM6oiuHQKcpL37zPDFc7oCXufLxqhnGLMQp7xtfLqm635GD8v1e7N+1xv7Vi
         rL/jIU1z5F5l0ylc1nGfjugnAiXbVsH58YEgMDM7O1iT3HzS4xTxpWDVlRq12m3YVqqm
         f8pg==
X-Gm-Message-State: AFuF++mGmti01NoBRs+2D8kKbCLH0f07btWfhcLWcr/gVRQuizQDwaqC
	KrVdLMZkrNG74XO8lfdMRO51rV8qZoNfTuLCLKg1J9OQCNEkzjMkmY43Xf7srGofwepUdOKLqxi
	UDoXn7e+18GMTF+4M7XXlKzbhfOlYSne3Y4MEYcK8axarUXskVEEu9bHMaoba4wpE3TOA
X-Gm-Gg: AR+sD108e4+56svbHZOddewjMestUhKSTAtufaHFXr87vAXwoaf8io/Ah6do8pHnAT7
	Jt4afGoDDbI3sbdiLGX1wrTWev3iC50WxHvhkz7I3TK3Uv+R1x9Nmbhkbd7RWQBEnKbePxOSy/i
	Ap0ce9UVIYSB0n2y+Ttezp6YP4xCdQw6UKhan69lN3alcC5igDKG9mqO5YY1PkwRtsNzIHIL+QX
	N9RizrVD+piI6gsVM/Y+cXSO6MHUcn1xQe5vGhsPjekkdy45/abLQQlST8v0VxeFxGdP/6ILCC1
	eqP9m85PPNg+momDFjbzsboqleWLrWFoZhmg6qUBc+ctQsOM9zyykUZCGRgXEj+b5hxWA/3M/Fr
	QwI7+flluJ+9hUTOMHXg0MO0fyvZm0Lu3GRtQaQ==
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30661125ad.15.1788157512235;
        Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30660215ad.15.1788157511696;
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm26745643eec.18.2026.08.30.23.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:55:01 +0530
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili
 PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADwelWoC/yWMTQqAIBQGrxJvnVD2Q3SViDD7rLex0BAjuntSy
 xmYucnDMTz12U0OgT3vNoHMM9KbsisEL4lJFrItuqoUYUGYju2aLOIpfi07oQy0MnMDPdeU4sP
 BcPzGw/g8L3EblA9oAAAA
X-Change-ID: 20260831-vdev_phy_next-20260828-afecafb5ecb4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788157507; l=2568;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
 b=BlNjYw6tI2YPK+8dyV1JS/ecPHek3XVMzy34tt3S0kuQdZO3C/RKtVepS51A6mNhriCcthGsk
 AYPBkMuNPe9D9ud8HYeUg1ELdm+VrpPyGcWvf/yiWemC1aDVdCEM7nG
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a951e48 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IvnoF98jkOSEO0IU3sIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfX77gQlsgHFAfy
 vEq+/4M/ajkDFeB92oQoEjTOQZmg5HmFxF5Vw2MSVYk9Jhqdb5Z3iZV7VNKfQuqjrO2iqcj+B5u
 QWORppJFft/LF3uCBH+BfB6baflD7qoFvWxAqwgjgBqFPUWvj0sKoD0o3p+Q90D1WzaGxSyM5dM
 twqf6kPaJBYuXot+b9roSj/Jz9jjJZSBDq9Uct56Iv1ohBkd2ZhDSlsJK9ocV7Wv+mf4r2C64V6
 CVtjAg6o+EyPceNTe0TAg4KQbL57/4SaiUitwryW20r6CwDk3n4Wm0WVmp+dUNIzGOqqlFIXfjm
 bpyzGXwwQ8htGpq1/W8jXrLTHuqcyNP/C5FkgJIgPD3P88opa3d2IZJo2lhDuWjPpcJxJzfaTVF
 tmqo2x+6VXd3xebVAMZ6FIIvLw38GTOPeiy6yIWaK9M9I0l0jSF+g5TONSnV4O2tHtCAxgUwgrt
 yKMHJIIOvA1GVYSRQcg==
X-Proofpoint-ORIG-GUID: PnFisGjgwf8V-ecE1c7MPoIrhu2NqyjM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfX6NBoradXW8uM
 el6DOAxiU06wG4g0X2nMg6Zl0z7EQAhuLRU9sU+r9XulAqmmT2hNr0s64UxhGl8Bf7I0bq9bDXo
 N5vfPXalB7Ufx/0glekzGH9Qzx7CfW8=
X-Proofpoint-GUID: PnFisGjgwf8V-ecE1c7MPoIrhu2NqyjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310053

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Changes in V2:
- Rebases to the latest code.
- PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
  change is already merged, so dropping change
V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
---

---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,hawi-qmp-gen3x2-pcie-phy
       - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen4x1-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -202,6 +204,8 @@ allOf:
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -232,6 +236,8 @@ allOf:
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

