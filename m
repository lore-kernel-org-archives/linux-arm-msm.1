Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298239D6F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352084; cv=none; b=Y6/k4IEe+7FBUV45SbPr2OaCufAxQIqawp3dmWv5BzcyJUzXFhNXooYjAmz+ojityWvmcLoGOiAMHSpmPGsw5bHcKf9cgvvFrKVtZhzp3Cc7PysauyYZ5I0/J0K61gUPnVAc9c781yVVWlDeJ9xZUU/oyqySgm14RpKjcSPYCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352084; c=relaxed/simple;
	bh=JTisnAlTOPOah10iR4MWE1cZuuTKDnuMbq0vBz4Tju4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LNqvHaGOI+OGU0o3lIozzT4M3fBmhhLm2qFRp5Z/j1bm6cKeNi4ycD40kZ41J0mCY0R+K4xhsoFAKNa07hJeXXMmbDpYDtP74gyPwZhZKmFu77HfL0x7OiWq7vytCy1LplCF8MCMHlDprq1W9eviM6rDfjISF5/1HpnTZUcJRy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvRRSP49; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZOq0VO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvRRSP49";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZOq0VO+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pITY1239980
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VdQZmvsBGatDT5TZd/S0L0
	Jah5sVDAaL6cZJeYlicxo=; b=JvRRSP49XwFk5Z0mK0aEWQJVopMWSCr2AXNctL
	TDRRYTDtEuv3Bun4Nq1TdLtH123IXReQnVulECmAdUV7bng11gbzYi1r3R/taMz7
	X9EeAmKDpF1+GWdXNa9lTwjOTCqMPpUABGJ0ewOZim6IcmyxP1b5m5Xh5SxNPY+r
	QIaTBAe9sMP6s2KTNLWrful3zH7suxTKbcF0PHYGIT/4vBahJLMKhEM/h+WTb5aT
	C7sWsa/5E0nIXwR8wjXSiPvwqw3J5mDi/ycMDacSIkUS9uHuGVr6ySHUAv6HHfoV
	JtNK142Ol21ziFIn3zNooPAarroqm6gashb8qJCt7Xkh4Bxw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3rj6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1963179a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352081; x=1786956881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VdQZmvsBGatDT5TZd/S0L0Jah5sVDAaL6cZJeYlicxo=;
        b=MZOq0VO+anJBw6ZTw+AYauM6Q+0CEC21kxWuRuW0gc62MuR9QUkeuC/zXp19Z/dDk5
         yZvMdeJxVW2FYXMNOmmnuzRsJwSVTAG5X8M+2pVPNodxygwG1F7hyHztJHHDW+oJuRoT
         BN8Ido7sXuUf8zi8G7a2lJJJ3LfeLDdapbP4csq+v9DSZa65YcO658rThmnCDP54es3v
         QOYLxt9zQf5yCl+yAj04jB94iEUGvcSi+wEMuK4txBKUI7RwKUP/7y4OZrUGjp9Mr59a
         N+ol8Hy98Fxaik+D7zJdpsucFTLUSBqP+exb1ZJfmM3EeCx1OYBq0UECWQ0U90bbKcew
         87MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352081; x=1786956881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VdQZmvsBGatDT5TZd/S0L0Jah5sVDAaL6cZJeYlicxo=;
        b=VJj3O1/o7KJ5pSk/zmcviq2X0P3bZxJtRKlq5bG7pWocfBKDkFoGjEUYRmbB8uxWyA
         93+/4/ekg4K+he0+WwIMgZTaB8abv1GcI+i3icPE2flCY0MK+QJRwa7IXab1GPpRNnmP
         PYn18TqT+H41E1aKycaVc79p2jbNox6OZl5gwKmRG7rlIvUEtdX45ecwQ4gzx6WahYtT
         gxBiFPCZMAI8jzYHAAo3Sd4Iqc4enNZMUh18sHCpd+98wcc35qlc0BFjSPMbIAu1VmuS
         9BkmsaZ0M4Qzt5lEuK7fDuAEJaOSW4ZC2Jsi6d9+dLvPDhdJcrJ4Xz1zMwfAPpkXQeFa
         sgxA==
X-Forwarded-Encrypted: i=1; AHgh+RrCMqvzPd90POeI/FuCeam4vRCy2HogSvmOhSFlzLo99fXN81GrP7aL4M9TfBFMrR+CY2iuCT86KtL315Pc@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrCrBTpVIqrzC1pcAaw+DDrDbb/le2yGM4kBnz7JDZi/7+X4R
	sgxf6g/FzEyS1jgTgPts1jRQzRmW2Xpf96xJ7Fhp/a79TCbksP8tkBCX7axU+RB6i98LXFnDKpA
	a3xFJCYJwkRHf2M6+F7FgdJQX6ERuCJjWQ2dFusAd4SXMlJkk/0v+Dhw0maBDVo6XNuas2YfPaj
	zYGi8=
X-Gm-Gg: AR+sD10rlBmMf866kvrWCAbEsR364djEm8cXCrzKm+ViDz70GgkZFqAIQjoGb3T58P/
	AjXwtPufi5SQ7ns3+9aR0CAmBlzy6o36djCznFpvHMETr9XKR6hVCq+qZY5o1wZJ7K+vlU6L7bC
	AzVbr9pMQ3IrkYSl7JRnFmVzWk6Ig84w3LOIjK5sd1Wt+SkY9o4J0Kb3rONW8k5xGg7Pibt6XQP
	YgLpce7wetU1eKDjOlaN7qMJd6YP3z4Uf8hcBho5LZ4WrAi4D8LqETjlJY4033E0hP893nP6PNM
	RHfKkFQ/0cT0yhex53KIYROPdtU1XMYTYqlFAWO0SOVgPl3Qu1MpjZRXWdYn+OLdY3nRWx9KnZM
	Igw3HyC/BqwSsOtM8l5McyU76QxsQPoSNB2lxxagOT/IS9p/F1Y1ZZh7q0NEZbuxP
X-Received: by 2002:a17:90b:3950:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-392822afd23mr20716243a91.7.1786352081190;
        Mon, 10 Aug 2026 01:54:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3950:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-392822afd23mr20716195a91.7.1786352080663;
        Mon, 10 Aug 2026 01:54:40 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:40 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v6 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Mon, 10 Aug 2026 01:54:31 -0700
Message-Id: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiReWoC/3XO20rEMBCA4VdZcm2WyeTQ1CvfQ7yYHOoGtxtNt
 ChL3910QSzW3gz8A/MxV1ZjSbGy+8OVlTilmvKlhbk7MH+iy3PkKbRmCGigE5o7xV/oTKPL3Jf
 ArekFEkjnArJ29FrikD5v4ONT61Oq77l83fxJLNsfyv6lJsGBkwDTO03Y6e4h13p8+6Czz+N4b
 IMt4oQrBXGjYFMkBkUheEG+31HkWuk2imwKarQwkI/Rxx1FrRQJG0U1JSptB+vACqF2FP2rWBA
 bRS+/oDBAjvwgwz/KPM/fCLRTd8sBAAA=
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=2904;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=JTisnAlTOPOah10iR4MWE1cZuuTKDnuMbq0vBz4Tju4=;
 b=MeCbB5dbGkRJWOWlWj7oni3RF1UGtk2HbSaUI1kmNfY8wDnzus2ls3zLDoIyyq1pET9lq1+mu
 2ExDNaD0MmvASS10Ole4C+tMolKyRw4/5oy6nAd30ZZfKW3dtSOSznI
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: YLWkvQBdHvrzIDhEPkGU1xjJXHcp_Mfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX0gzi0Ndz2ocb
 5H5q0DTNYJU9OSdqaVlt9k2/eC+IrPZDaKLLFDOxDVqz7zdsI4Eo2ISyRpHmp/JEUxUqPGQevAq
 AGu1gm6TIQ8PNMteqGiErA1kuU8GrZUwOMKVUhhdNHd+ulAxqQwjGDjbckYLu2mPwf63WnsUcwv
 3hIVGzXRhqS/3fSbOoKqsPbjs70ka0CzJ9otDaMpGGJ3nhHBD1eNz1TNlghjZntE7KQ0xT+c7Q0
 otJ5CDG87rJMi8F+/zC9xCMhEadGZlf/JGepdNv7ovrJkqBzU3kzi4EBd73grLtwDM7e1dBCZei
 L3knGCoZIU6T24TcgyOX/MnXL5oeqGJvOBfE1pflsAAAXXOJwJQYm04CvbDvsTUolZ9I0L2focf
 okRMafFcQOpNMXMwrDq4Rt9g0xt8AH0ma+KR090CgbK5+2AbhWKNN3E1pLIbtJLSY4CvdYAIXY3
 foc9Z+2+VxllHjM/nIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfXy3G7xT38bjW+
 4FVQh0F8pfseim9ApT6/ciie8nU00RXwMW09i70QytRok1gfuwpuMUV9AIoY8Rv4EZ0PCEhy+0W
 0qt0zIwo+CM4iIK6/64kskJgZLn/pHo=
X-Proofpoint-GUID: YLWkvQBdHvrzIDhEPkGU1xjJXHcp_Mfy
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a7991d1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lMHH7xqUNCQZAqxxBscA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v6:
- Add the QREF and refgen regulator supplies to the Kalambo CRD TCSR node.
- Drop Konrad Dybcio's Reviewed-by tag because the patch has changed.
- Rebased on next-20260807.
- Link to v5: https://patch.msgid.link/20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com

Changes in v5:
- Split PDC ranges at 130, 147 and 171 to skip pins 134, 138, 156, 158,
  172, 181 and 202, which carry gp_irq_hvm inputs with nothing wired to
  them on Kalambo. Reported by Konrad.
- Reword the commit message to describe the PDC difference.
- Picked up R-b tags.
- Link to v4: https://patch.msgid.link/20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com

Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        |  37 ++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 119 ++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 drivers/soc/qcom/ubwc_config.c                  |   1 +
 7 files changed, 166 insertions(+), 2 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

