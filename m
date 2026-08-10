Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3093DC871
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367034; cv=none; b=RoWhRMrUh93tVRn9CBkcKRAu5nG3HM6+zyUqdcIpNkPhPVthHw25Gy0x+7A1glFSv3u9BPQMNxGSznTmeX88neH7L6wOXLgnk2wGyJCzSiR4/HTrb2ds2epJHM0WUT7wE/+D+9oigxChYj5ipGpeYdv0mBG9b4gZ0n1ouEjWz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367034; c=relaxed/simple;
	bh=m40Rp3I81B1eyjB2LkQVrAzrBYtU4DsPF+9Y780JXW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CcgKXmsalOwzGWiJvYm38q5+dz14rMy4ck5oVqaYwQgR9RUlJmt8x6sJPvaF1nArvdd8hefYtUlvHViHpKu3Og2Rz8oSmT5BzoX2saSW4f2FLr96D+vgWBjkDJvpj9fdz8JfXefTsGu499sMhssv511lUeq9g2//lQ+uvebc1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/wQidsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5isy55x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/wQidsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5isy55x"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj5b61343233
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EOgm7v/K3P/qkisr1KlAsK
	ge9khjyZ+MY1UshzBCdM0=; b=G/wQidsP/zRdjI61YVOxBpyx/B2YBw2H/9cVZ0
	RiuwhAJ0lc9Q+mwO4M/XJektG275F2PY+GnnD8HnatNlywwcwrqnE+uRjCB4qT/a
	gqCoc563eOxzzQlMIH1H9b8FNhqX8P8uxZWy+ZjdYuH6mz4rTjCS9P1GaRHPokE6
	LsixI++IIPyuS8uEGWqI3E1eoJ3Uc3roJQxqQFFyUE6P2ZUD0oQCtwj/2+zD+KaL
	5FiTj1cAXc3nbDOl7ZN9sg2lr+0yEuLHRkJdDcztmHH3dhuSC7oTpFkjEiGeyJVM
	qT33PyZLqwPP+utYmO7HHK8OWveHyCDEqQv1bMP3d9ls+Ntg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v59jmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:51 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6ae35c7b9a9so353584eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367030; x=1786971830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EOgm7v/K3P/qkisr1KlAsKge9khjyZ+MY1UshzBCdM0=;
        b=G5isy55xjPYk2GtLisxL//TcI7/VoVUuU2R0L+4pUeHg/5wlPR0hCkLkuDnhKZBy4V
         /kYETdeJrdnEnbXHwdEOoCKOifNqhFYHSWYVXkPn7f6AXqBKRbIF3Y7LK0KsVT+AV2WU
         9/hjNLgGqIuCSPg8F3xpFzj+E+pb5qgZyaqL0vt0CZ+1BVZbLxaCblOhesYWIvVKDwhJ
         oFEyRN94VK9RGVgAJZxIBcyTQ5JAz75ifNs6t0KdIpfnaaucP7qe5pyM/thzrjnkVlQj
         x3/XUZNO/Ugd4wZiZz1ih9p5UeYwQqbUpO40Ws0/LU+JNiRUBrTs237e3phOE4XPmJNo
         SucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367030; x=1786971830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EOgm7v/K3P/qkisr1KlAsKge9khjyZ+MY1UshzBCdM0=;
        b=k8D/ihwza6z/GMWPtS4hL9D1FjAdX3GSjiw28rnvcwVG0qgmL5aKlo+OgYDV+l5kgK
         jrIgaMdxKjk6mKzyme4WfCyioqaTM7u8IsGpLOsTjfL5Lwij1ZapGVcPQlfnkrIZkFby
         W9r6fVndWuj9l5k3Xr2pcn4lVBhpBw/6uIuN1vKgNJz28tGfqm2UM+89O4I+75B0+PZ1
         R+50boh2ckWmo8ezzkU5UfwCHVx9hH4vAhp6lYaQ66e+1DZqOOxx+SI7bslbtOjZMyK/
         F9SY62tYlCBDJxNfigHiwp7y/Na8smOmFu/u+dao6dXQEcuWprFC5SFnu9R1ZUANrh1z
         hKTw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0QPkJiDkAj2lprfzXKgaMWDpVpD6w9J9rQhcUUXvha4GKP5mQ/wOSy2lVilARVrzLPD4BFtJalnLwpHj2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2NeFndnDEnpAMjJAm9WoccvPjPLmOgCtOq/0DH/6Umn2z/BZg
	ZcQaYrlLs8F3aVlSyWunfbXMLxq0VQjXeUVFpUVgSrS8fKWlBtykgmoH4R/2RIkLpowDy7xAIE0
	DmdehZ1X02JPTWKTup7iPklf4FWTd6f0uueAXXrLjLK0DEXT6Y39l5kEdqsyawUMQ0fHlyzovQP
	lr21k=
X-Gm-Gg: AR+sD12+wuyOCmpAMk7f7eQIfaolcADOyJVLNz3D4x9Z5EVTjCdtBesAqYVHYHr3scA
	1ucCOKqDXoaVBhfzBH4EtUvs4P98aLDX/NY7vIWqfQBtHyoUBriCKSmGGPbBNPGqk8KRcs3TI1O
	DHq8ocr5Rz77SRLhhn4ryV4Kude9TMr4AcQa8hZb7tx+c5Ah9Y5CjqGYo9ZbrraOsjo85uJ6Ci3
	EQid0Z7lhPYkYNiN/D/w4uwX4o6DCIvFjU28p4dEUcyRnvpbITR68uDMhHFXVBjw+e1SK0BNUlM
	2h1r0RJEmLxzumSiUdMSEct52/GIaWLxwwWCsi4BGkMjdPj8643+cC37POsW2xC02MB3dlzDmtg
	dqlJt601P5p1Roc09Gj5M8NTzG818nOWg/nlwTziCpc0V89Ga/kiTifHk9MBs8mcq
X-Received: by 2002:a05:6820:2013:b0:6ae:a9e4:3d25 with SMTP id 006d021491bc7-6b041ee0698mr9998676eaf.3.1786367030492;
        Mon, 10 Aug 2026 06:03:50 -0700 (PDT)
X-Received: by 2002:a05:6820:2013:b0:6ae:a9e4:3d25 with SMTP id 006d021491bc7-6b041ee0698mr9998618eaf.3.1786367029818;
        Mon, 10 Aug 2026 06:03:49 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:49 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Mon, 10 Aug 2026 06:03:26 -0700
Message-Id: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7MeWoC/2WP0YrCMBBFf6XMsyNJ7DZaRPyPxYc0nWjANjbTF
 kX675u2Lizsy8C9w5w79w1M0RNDmb0h0ujZhzYJtcnA3kx7JfR10qCEKoSWEq/3VzNE7GyFklS
 tKnuQO1dDOnhEcv65wL4vq47UDYnZryY0xGwWZpkdV6Q4/CI5WPvAscAcZeG0UEp/5bo+B+ZtN
 5i7DU2zTeM0Z1WGCWfH92XW0rPHz4cFzNE3z32Ir6XWKJfsz17/bTBKFGiMk9a5fW5M9S8MLtM
 0/QDTa5bYJgEAAA==
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=2440;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=m40Rp3I81B1eyjB2LkQVrAzrBYtU4DsPF+9Y780JXW0=;
 b=lQ+MLSuIQP/2wQ6sSk3eXBL+2yfF/r7V5mKL+TBq8Vnr+0eu2EQnz0IfHMJb8ocx9xYWBrRmR
 GwohVYglmtvCHMNZWzznTl07PePpFSDnGRDuDf1EKkdvV9NDAprATZf
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX98TLXMuYDpvw
 tbAPB610aK7MFA9SD5dOWUEY6aJrxhDEenMcZJoiekMm5AMvKkAvry6XUzNxVswG/rV8uL90lQd
 lE1tdrvxoheKUh1zvifZFwo8mwC/kOc=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79cc37 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=emiPwNz2bb0dLlisEjwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: iY-tQXY_qbiTRHnSym4sSzMF5t1yJzgJ
X-Proofpoint-ORIG-GUID: iY-tQXY_qbiTRHnSym4sSzMF5t1yJzgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX0hSQz6q5nyM7
 cJDQWdMWcrvJsuMnsBrlsK2kefiEgAY0hDXgKwK8EbVmCQG47wovFq3S6/8daO1E9U1bA6+Jnic
 iCT+gm+79o1CdrBFAmdDxtZfWoeF1Vs9SUFiHLt8nKgfGoCNAfVBnNF+JqT2dBTz7qrsoax9oSU
 hwyEttpxdeAerfoPSjpMTTfql3b0tI3aqkL584JGNKEySIgNWe1h7XmghEh0hNOT5NDsQmIbRTS
 OUJGltidGe6rW6eBPN5aGMHQM2AqMwQRQA+ANCyzys+K3UD8lHx7G3zF0bSIvtVlrx8ku2c39xD
 snaJntDabXyYhP8Swp/eV8+Ic/se5rnmoyQ+MKs0IhSEw6biOcasddbxXVZMGwAhlcSZ65LNgbp
 OGJJUtGZKI3R6sr+pWbp4lS9TR+Y9wmoyZS+g9UqQPH3scB6JK7bnwx8HQ679tPogS9fWmzrSK+
 +GQ/tWqQsuVeT4g76QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

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
base-commit: ce28329fef089fc63dbaadcc4c1fbf9c287e57e0
change-id: 20260711-glymur-qcb-1e2d2bc913fd
prerequisite-message-id: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
prerequisite-patch-id: 26f384ecfe96620007cab0ae3dd01db6e2314bc8
prerequisite-patch-id: 711fb836c2a609ad2f1f07f8785df3e8b72e97a5
prerequisite-patch-id: e9fe3e572292afc1ea6f98dba6c2176a28183dc7
prerequisite-patch-id: 5b78db9f6345733d9dce683ec231fa93859a1a0e

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

