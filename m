Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9839A4B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289552; cv=none; b=Ibi94ptBrpgJpbc4YMwMDMw0FISGTMCWjCrEGSVcKuKWT+t8i9GU1Fd6EcX4UoY/3v9OLt9Gs8oOGgeSDYQbMq0kV5IMCQJ13iNdypnQnQ9C6c/vaFhB8JoYPPrD5YL9CBdrwxS1jYQebP35eNYViC4BGWNV8LFyG4BxqJY2IHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289552; c=relaxed/simple;
	bh=FPBsW820CeWFoLJbCqNPwCtkFAEbh1ofOnZn8TqQL/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dSKqO3tY7ynOPUOAE8H8x+UPPRrPlpcKC1HGLOkk7FyMJ4EzpeM8jGvKjsDtkrVEJcKsRG7KL+ePFgprwieKWUaeL5PbwGei7CyW3OxE2JsCdCiqxCFXxsYhJb7fl38RhL8umrAe9mUGMAWew5GbY1kGfoIXwvMAKtAMgntMi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB0Gq/IA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pmv/M7B9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB0Gq/IA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pmv/M7B9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASX6i1190966
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xes8Cy71ORalvIfmXPB0kd
	rGN78Wio+6Kk7MyjYm4fA=; b=LB0Gq/IA8ZrQDs0fSPCEnxSjsBXudzfuSbOD+s
	sfny7B5c2IcsAbD17oSMxxXY/lAYB2SbDqKOW7AA1ZBvklIt2lKZlcVC8mxjCYnU
	3I1ccHNwMhOxXAugkX+qlEQ+m7OXviNiGXRILltcIoeoZ6HKWvFoHpxCYN6V3dAk
	yU0ej7Ht57BHxaZzm0HRLstxUqzAcIKZLSlBcjBDKC4jyc9cGAzUtZlmnO3twrYZ
	pGC00syedcBs73rh5zNINJixWaSxRKj/AFmOS/Fv7fXzEYfaN+Ar5xNm+Tt8rl6R
	beL25mN1czR8nIO9yFoBcpmnBGO/SisG4+Q3sgwu1k1ZZLaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78rcur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:59:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso183463465ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289550; x=1784894350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xes8Cy71ORalvIfmXPB0kdrGN78Wio+6Kk7MyjYm4fA=;
        b=Pmv/M7B9gwt9j0rYzOeWTuH5KcWyQmr4zsTw127JFFDCWMQ7gw0jqa/BBLfQjulJ4K
         n+07IGw//SEQgT5zcaUnE0qcIuYYQKp6ysGx1UsoQbbwWO38+/qQaRxgVF/GiFuLAh0o
         RZfb1l7AT2lFVwLqAZZpKdjFc4CxUFds8kmdv8MUNa7rdz+gBk2aZFDz/xbpWNa5hQkd
         VsI3s298XdNpJ9T/iQuIJxmKZVFTjTH4ixUPhq9lm0KIRV9umfErI96r1H4H8nRUi23h
         QfaqEKzbKE7FMw2x0azR13iTg5kDvNYgvxWxuWGaCJPWkNQRs3OSREKufXuCBv1g+NI3
         K50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289550; x=1784894350;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xes8Cy71ORalvIfmXPB0kdrGN78Wio+6Kk7MyjYm4fA=;
        b=BDSbZ//P1ENJ4d9ak1z77Vo0Kfwh3J3r40kc+BVgVtZL9ZB4ZoVnctlPmtKC1GfVbf
         xBoKRJh5ktYbOF+fNpVfyZQWSIuytnuXPhau6pkGVIgPKfoE+8R9s62HfXBT9JgIknbu
         7iTXj9vdMYNocKozYQnmx6NRScylqYWz7flp/JHRqp5SfxP7uubTW6fNzIVbtdb/sTlT
         xXuZMJXoQirgKPhIoDtrP2ySlX/fMs2YnEE46LpEWe2VuqgY0lszKT7OM9IMLO1h6GXP
         UKpNMIXjpKcPt4biySIQY1fbWvbDkOVBw4qZGXiD6wp2Tu1MLGsmwdOlQXCU0Dgj7KPg
         jTAQ==
X-Gm-Message-State: AOJu0Yx0tNBjhi6YKA5QYZPyti7PX2a8i4SgaxSSku9p4Vc1EcrHVnII
	nf1fDA8EOu+4h3AeUwnIJ6h2ozeD97kd1CopSZg7s2ytyvk1Cxr6mM4PTtsOWA72UXEvSkDrFX/
	3N1NhkyFU9eTv7xtkBSvYREc0+njrQLs8i8wyjdPiHIsXSNT/ay6/Ehox0EFzCS0NeNMl
X-Gm-Gg: AfdE7cl+/k+IFe+DOS051udtQc2UQrNh2VMHVUvUTbpZweII8eJk0a0HL7zeTo+cAFU
	JXEKTYmAdNmR0SUbHzAsj76FudxdfHqpEJ1lk+lQKVPOZYHPUvzN7eHQotyau4O75GIGC/A1HKu
	A4i1YB84I01UJL8yq1DJC7M2LEFvFoZvbRH3ERhIMyWcolSobpdZnfKRIBDDFFI86jE34FMwQZF
	nWL2F6DzCQWI3x/5Kfs6lT90YDkIXDTFPFT9CBjCgHOoqixUul7kfx5wkKm46CBKmAtLGJDEPUH
	zIpWjONpPmZ5HhfDVTj3+hxogXNjaQLrKADbkdOqyZpyKZE3sfo7WkQr1mpQUWxW6KBh8aFSoM4
	gvCstXpwCSCfT3ODS
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr28109105ad.26.1784289549528;
        Fri, 17 Jul 2026 04:59:09 -0700 (PDT)
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr28108575ad.26.1784289549081;
        Fri, 17 Jul 2026 04:59:09 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm9444305ad.52.2026.07.17.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:59:08 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Subject: [PATCH v4 0/2] cover: arm64: dts: qcom: glymur-crd: Add
 touchscreen node for ft3d81
Date: Fri, 17 Jul 2026 17:28:33 +0530
Message-Id: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkYWmoC/x3NQQrDIBBA0auEWVcwRqLtVUoRo2MVispoSiHk7
 pUs3+b/AxpSwgaP6QDCb2qp5AF5m8BFm9/Ikh8GwcXK1ayY9d6E4uyno4sm9MXr2fSyu9gcIWb
 T9loLdSbWRfK71XJTGkauEob0u1bP13n+AUdXVJF6AAAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289543; l=2798;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=FPBsW820CeWFoLJbCqNPwCtkFAEbh1ofOnZn8TqQL/0=;
 b=50FB2tiH0WcofsphCftqFpdYMVw6XXcLZV5OEb4CEcUmmXxCZlEtOZhL4upP5K12am9PfXb+V
 26yx5Vw51BJBnbCWLzoP5kh4HpySDEA8d3wYguo9ASzLg/TQoyEJDm5
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX6o8d8Rjc6Kj8
 W8GgEojZkBQDLUIxT+cvv11nzi/LcXILr2zd18pkuWtNTqA1A99f9A1i3nyrqnO6RbI/ew/Zj2F
 FahUQoiPPj2drQjhgfYQbIEB/KzlSaj4vMP3YQrE8l220D9vF6/48ruIjaC30yAZ+RhuE+BIul8
 lJdBH6EQV2Mp5rhHr6OywEvAKzSZEcdvCxL6IC+F5x/D3FhiOsnEwrsVV7Jcaz7QKVTWMuIumFj
 15MDogOr3COW74mzLPLvpQqTqRp1AH5Pr9Ll9BuoiHxRtY0nPjar+ZMkDahZsZwRiBib8/gvg4b
 9zX2ECyz7olV5b5RMWY9N5RvhwGy6pLsrfMIS8cwRtGY/cfRC0TazeOtLI+GYRwCdZd07rEMJVu
 273XGlkPk4x4BNOQdVRJcKNUAoRkflzvwLT5kQ8UEISrG7dysDyfTKvhwsZ0qCgJC//h+GRlGfq
 ezLZToy3KQwISeDWR3A==
X-Proofpoint-ORIG-GUID: lss4uMn5_qrQnXqLdwwyA6iejMoUPVTg
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a190e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mZh00jpdjR3KdUHqnqAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lss4uMn5_qrQnXqLdwwyA6iejMoUPVTg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX/lVXrZ4uSzWk
 eXKfxDw42UBuOkSHvAAtnmu9VP4Kw1U3NDUcj46mWjl8t+dNP0cjpPxLMQz543rn3zQWAlOlcIe
 s9oEmivTE5LYiowSmYFIPHlSwStsskM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170121

The touchscreen module on Glymur/Mahua CRDs is a ft3d81 chip which, while
hardware-compatible with the ft8112 (same I2C-HID protocol, same
power-on/reset sequencing), requires the reset-gpios line to be
explicitly wired up in the DT. Without it the reset line remains
permanently asserted after a suspend/resume cycle and all subsequent
I2C transactions fail with -ENXIO.

V2 incorrectly used the generic hid-over-i2c binding. V3
takes a cleaner approach: extend the chip-specific focaltech,ft8112
binding to cover the ft3d81 (they share the same driver) and switch
the glymur-crd node to that binding. This removes the dependency on
the hid-over-i2c properties (hid-descr-addr) and aligns the supply
property names (vcc33-supply / vccio-supply) with the binding schema.

V3 was not picked up; instead V1 was accidentally merged by the maintainer.
V4 corrects this by superseding the partial V1 fix, and moves the DT change
from glymur-crd.dts to glymur-crd.dtsi where the shared board nodes belong.

v1: https://lore.kernel.org/linux-arm-msm/20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com/
Changes in v1:
  - Initial submission: add reset-gpios to touchscreen node in glymur-crd.dtsi

v2: https://lore.kernel.org/linux-arm-msm/20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com/
Changes in v2:
  - Add dt-bindings patch to document reset-gpios in hid-over-i2c schema
    (flagged by dtbs_check on v1)
  - No change to the DTS patch itself

v3: https://lore.kernel.org/linux-arm-msm/20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com/
Changes in v3:
  - Drop prerequisite-message-id; series is now self-contained
  - Patch 1 (new): add focaltech,ft3d81 to the focaltech,ft8112
    binding compatible enum
  - Patch 2: Added focaltech,ft3d81 DT support which is hardware-compatible with the ft8112

Changes in v4:
  - v1 was accidentally merged by the maintainer instead of v3; raising
    v4 to correct this
  - Move DT change from glymur-crd.dts to glymur-crd.dtsi as the
    touchscreen node belongs to the shared board DTSI

---
Pradyot Kumar Nayak (2):
      dt-bindings: input: focaltech,ft8112: Add focaltech,ft3d81 compatible
      arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81 touchscreen support

 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml | 9 +++++++--
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                      | 7 +++----
 2 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-add_focaltech_ft3d81_touchscreen_support-263409a84b78

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

