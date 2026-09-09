Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AA35E1A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936064; cv=none; b=exDxQfrSDhRXV/dpl7WGcGZWnKHmj7bhBU/wkVexqp4TACabTjro/nz58a5bFztPgArzE8LXpB4G45dkSLCUWH9SfCP4YFDHLYgzpWrHz2TMMjCeO+MpgJRZIPolHQZdtEEiVA52sXJMc8P0/8pn93vg5AVxG8jZeVJ9uJkAwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936064; c=relaxed/simple;
	bh=ds4eWBvPCrweP4Fb8r8NtlV+3o8YiZUPMnyIIVFzDJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RiVXIj/JL8fe43Efqtzi1DaKe7+s2DmoSrb0+D7kphWiIBsIFbapXh4YofbDpbVaYSZnxlh7u/if9Q1uXXjfuOaD3yUsB12YsLtn5zRxaqMbYSwnUhFl+8pdOAoNdJMaHGktnOu7DMSjhfDMG8J/vqL4nPxMtl0vsUmXuSprO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRud9QuV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2O+oz1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRud9QuV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2O+oz1X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PEBp1274625
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O7JhDSt8rTXrZoSLKAtI07
	K2VlsYQB1Zhvc7cO8q8ig=; b=PRud9QuVNSMu5zjN+URhgfdQINXoxBWgAoTAwI
	l7yVIyVyHYn5WyWdjKek9Mw3MMqpLea9M4nfZ81BsCvpreymdotKQhipdIazicMF
	RaAPFHRC9RpS8wMRVJuGOMsPSWZWVfrdMNC18bswI1ICqzLY9lzwTXYxxTAIfFWG
	HR0GSRuUSXR8xpuQ3PQVtzRrY6RJkvSWmwCwFSzYMsiK8MqNaGed+LHIGnO/FV6Z
	h6CbShaDEk6aFN54Rr9qPzIiTb4g+fErdtv/ZZ1bUHQrlvYi6BzAmIE53e2fZFvD
	p0DohWIjGLAlegynMnF5AxDawBkF2ypchYikn12Z3SGmDldQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2npt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:41:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9089632a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936061; x=1789540861; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O7JhDSt8rTXrZoSLKAtI07K2VlsYQB1Zhvc7cO8q8ig=;
        b=G2O+oz1XKRtJj/gsbDqiXx/r47idJBMzdRSkii35v9LHU1GPr1ArYlUDEnJQRH+Ln5
         /cUHZwJ++TOR02Dwm9D0+OcZmeeKE87UKWHpQgGmveb8nZX6RDxtJi7+WlGrOxiWQqxE
         8BtEcKjE2CnByC/tkO7NTeBAQvw1g0pvPct6dqG9EFLgDlaSmtdviXBDXQ5i5HNnhMCE
         xv4T9qA3YQUUyewIjR1+s7xLbiIvT5i2WlSVumYzQannrNY0f/gpJQOI0WjUug33V+x6
         KKAIa00Lk9HziQbBPApC2O5KKSuZdw7pAqvlB88oBZZ5tSFAipsjC5eRzVeEzq9Fo405
         sEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936061; x=1789540861;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O7JhDSt8rTXrZoSLKAtI07K2VlsYQB1Zhvc7cO8q8ig=;
        b=TQRasH7rUW1pqhgaok5DKJGiUw/3IAPGcoWUglPkC7syD3vPAAVEAmVnVQZ3O7RrMw
         ymCZRyJUfkbY1T6EVFEaGeAl+kFffsQBniX7989lBROi7EKxrn+TiqkAlyq0KAP64BrB
         WL3CU8tZm9/UmKjZVU0BRObehBb01DZkoZEQ0mtwzR9FI4VeCRDYVkbTuN4l5jzI2IPD
         nrH5FKUdWCJFgp/NEcneACkKgR3G289Ly9uVznAUfpL2XaaHkdeDKScAyNSryDlWZ8Fj
         AxN+T+czinT0OyAu1Np540v9Hc2uHL/JKiiAEoDa04ijRHw3gLVhMKqVjGEd5aK11geb
         sdRQ==
X-Forwarded-Encrypted: i=1; AKwUvBymSaqXGwN86a2lfKvRPYUJwFRgh6DhUB6k5K8TH8jqiRKAIT/CNK7GR9jdJkf3w8CFx1QDGuoSKSGcU5wh@vger.kernel.org
X-Gm-Message-State: AFuF++k3vo95G0yvxbABvHRTJFvOYjuL2F1B+Em6vVktKPWBqD6YTITS
	nxNA9twV7coC019ecj+i/c691uAHOVbfKfQ7sNdDlVjO/cAFBhW+cNYL+a1nIml1ZCtZjA9n5vi
	F3vYOnjWUr91CJ3xlkTR8kLDOKhNVHnudHSZr7AFKf18FPDahl0UgSJRuhM/mM0OVW5cU
X-Gm-Gg: AYBFou3r8/xWhrPA4Oow+vGvlwWz17d0j8t7myMedjH5UaPHs7h7bT/4WY/v1wuVBEx
	7Sea2sztlijHK0h+aV0FopWLCqGgxmZd5LiKQ+cf9xUHJMDNgzVaxiQs/fp5sZUl/RN5c4fJuMZ
	BFfy6jPE5UfiGbZgq1ZC0Hr9oy+inv3ODJ6scKU5h7g6pFsFhLaUGrh31cwrrTq13wPqeEl8+rd
	/Utp7onjbeGbRmkiRasV80DW4Xxap0tXl6aADF36tJvdH3JyjavB13iAw+SK28tJW0aQ+6ikjyL
	B+Q+wfm/KZZIqwTavin4qTkhlDMug9IgG4K8JMTYWsylbHniSb+B0JaOd7M8zLaCxhU80xkejAi
	jkO1mqllPtlKptMCE9X1zwPGMXXBAjFICSgLBwb0wQPq4IWeoMgoirisJCgBFmcRV
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr47728874a91.15.1788936060560;
        Tue, 08 Sep 2026 23:41:00 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr47728810a91.15.1788936060048;
        Tue, 08 Sep 2026 23:41:00 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:40:59 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Tue, 08 Sep 2026 23:40:51 -0700
Message-Id: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHP/oGoC/23MTQrCMBCG4atI1qZkUmkaV95DXCTppA30xyY2W
 ErvbloQFdwMvAPfs5CA3mEg58NCPEYX3NCnyI8HYhrV10hdlZpwxgsmAGjdzt3k6Wg0BeQV10Z
 CbiuSBneP1j137HpL3bjwGPy82xG275sR30wEyqhSFoy15UkpfRlCyMZJtWbouiwdsmmRf4QS2
 I/AkyCxQCVkKbTEP8K6ri9YzgTk7QAAAA==
X-Change-ID: 20260711-glymur-qcb-1e2d2bc913fd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=2402;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=ds4eWBvPCrweP4Fb8r8NtlV+3o8YiZUPMnyIIVFzDJE=;
 b=Hl8RU7n/KtbI16MDrn0jR42e7/34qWFWpwzuPKsw2XA05p4czi0G0CqzgzFTjvoVpvAmU7q2L
 g8A1+l/n72WCQDwk1hPHOTwoUJxSAJVu39hugD5iBSPgJrV7sQQoxWr
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: BFyJ8vYjpmmpkfLGbxzFg3gn31gGBlcu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX/PnC6UU/t/45
 Y0GiaWnc83X0F7mUL7wy9XoAtlZ9ZcAQdkXcjRHbMirD4aMsw9ZjQlpHRCLMgyEqzqEb6kl0JBx
 nyzDqDJEFRoQNXqfXTF5PqCLUYX9+9k=
X-Proofpoint-GUID: BFyJ8vYjpmmpkfLGbxzFg3gn31gGBlcu
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0ff7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=emiPwNz2bb0dLlisEjwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfXzkrTpga1YWNd
 rp8Q4OKSyT6Jkdk9jdm0FnxNXaVSnhsq3OeruEpNp82jxkGCHq8PjAEHPfJeXGhfSn3dclW9hNf
 vUA59L6DER15PHdW4HUOTX9ldhc1FLp2LHFmNlQzYhs0fv5kkCzedFyb4mf6rWR9hqG6Rs3k4gI
 PauqsbQ8emG2x9OCbUT6TNzA8CtDHurfDALbO7F1Yr9EScaKD+VZve+Z/VTq4ejt0UzHlPM/IMG
 Oj9x3MzX7C1Al0J6jQB3/0TauWtRyxRsMN641QWebmXkaTmoLpeWUvqhFBScY/lVRgIgRR64tH5
 S9++5WQWJWIj0Atq11ntC79dThCi5fr09bv+T0OqpNVP2Xy/0vuK9Ubp4PW4lEwBS91r0pnXurr
 qxVdLOP1prFECbe87BiWqyn8Mrigqay07LyUROqTipWANQmwP8ZgiId1Dqj/rj1A/BY48aYflSB
 RzE5PXNhpksO/ngC6bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090073

Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
built on Qualcomm's Glymur SoC.

Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
for bring-up and power, signal measurement.

The base support boots to shell with rootfs on NVMe.

This series adds the bindings the board relies on before enabling the
device tree itself:
- Document the qcom,glymur-qcb board compatible.
- Document the qcom,glymur-qcb-ec embedded controller compatible.
- Allow QSEECOM on the Glymur QCB so efivars and the UEFI-backed RTC work.

Features enabled in the device tree:
1. Board and sleep clocks
2. Volume up/down keys
3. PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
4. PCIe4/5/6 controllers and PHYs
5. WCN7850 WiFi on PCIe4 and Bluetooth on UART14
6. Embedded controller on I2C9
7. ADSP and CDSP remote processors, with a firmware path for SoCCP
8. TCSR refgen and QREF reference supplies

---
Changes in v3:
- Drop the prerequisite patch IDs and message-ID since the prerequisite series has landed in linux-next. 
- Rebase on top of the latest linux-next(next-20260908)
- Picked up Reviewed-by tags
- Link to v2: https://patch.msgid.link/20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com

Changes in v2:
- Add TCSR refgen and QREF reference supplies to the Glymur QCB device tree
- Rebase on top of the latest linux-next tag
- Picked up Reviewed-by tags
- Drop Konrad Dybcio's Reviewed-by tag because the patch has changed
- Link to v1: https://patch.msgid.link/20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com

---
Gopikrishna Garmidi (4):
      dt-bindings: arm: qcom: Add Glymur QCB
      dt-bindings: embedded-controller: Add Glymur QCB EC
      firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      arm64: dts: qcom: Add Glymur QCB

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 699 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 5 files changed, 703 insertions(+)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260711-glymur-qcb-1e2d2bc913fd

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

