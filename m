Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920793F54B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886635; cv=none; b=jzwKZ07o9QVRWJPhA9W8FM+ksnv6xx2TuliHTqQ+cHQ/QkGYKWmRwtqcf0PDzgaL5GjXjJIp9fuGpydXl4Mk3lhxga+nkp61kb5laY1JYGcC2aRCeNGTs7F6+qwNgszMK5mDuuzn/42lswLWKar7OI9TwW9Q/Ir6s3AeaSEjyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886635; c=relaxed/simple;
	bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gjT60imCQCBUkgSEYUGb8Kr+UJ17BPbcuKabaFlVsZF/HBoH2DEH6G6cTzB5wrC7nd+F8kHzVL0OmoHufR0FjCLwiWjJIcu5l1EKniz5CuqCR/nF4NWrOCUrN1PT8BcS7aw5EgIpdAd87CQWqOD8CGoopJDyD+mWLZxACdeFTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QikgHeQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp6eRoNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QikgHeQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp6eRoNV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9tRe53475857
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iyghy8MFwYNuGQDyF9Cj/p
	HPGN/MU2WtXwUAR2dYSmc=; b=QikgHeQHbc3tpD0I1eJEHI6jgE680Fty8o73dP
	pSqipWE74RRKYLhGr99uOKiS2zpUS+Ydr7t9oClXyHGQ/wgNkUXkHan2eK39ZEEb
	4MvW1mKBUW2q3ki9GsVEMu3uLA8a9ffVBSqcVvkjICBTPWTyHWzpK/3XpgEdda2F
	xq+EcpiXBv+8Q6/UO1vy9IvEFBMJfIc5wzzXUY8Rn/UT2jCdnCTsKj3lfJU7w5Sv
	FWnWPAkBDmPawYww+3wmEg/xIQQ5YMyJiQk5aNWQMGdtx/Df+K3M0f30fYpzbGnK
	sCrGz/yePcqVMZG/OmpDhw0BXzMW92NjSvYchicDKjBvX1cA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9g2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so2821053a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886631; x=1792491431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=Bp6eRoNV3UejleBdBd57nH5paTlWeW8KnGSb4eSYSvMMqpxK8H5XI7YhsFRVFZ+K+w
         6Yb7Nr1nezeujS4bNcR7S9RGqsYvgsnOyEViGJQnQXo55VWyjsTPJotUFq1DaZbcs70Z
         a0ilBZUa5zNEMMdvPYTwxIOTz3Kfbgis36GHeetBob71bmv/Rq5z12UWNhs3X/LQ2TRn
         DPA9yJz3eYD8U6KwO8C5XvA44F3LY09dGrmLrmqHDXRqz17bVzCI750oERRw7X0fUYIo
         ouxxeGtb2o7g/ou9NnJuV8CEp0SMlJFbTqjFa+fe1rPdEChQ2lY+V9Dzz4ZLTcE8PXaF
         2Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886631; x=1792491431;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=Vo0BWzijtketdUwnPzB4OcBOLlAjiAMysGVf5Yrp3FzmoYLmMkAj/LM4EQ/F+O2tns
         K+HwvPgsbXoTIueZjIsRW4VxFJ35d9BeZ7JvdBu/yQWUBCq3VcokPq8hmJovcOeq8ivX
         rYW4PIaeJF2Nz2ozRhCqN5dl9Rynqo8v7XlhYT1XRBOsVZwDBH91ft4fgHcZLnpcHvDL
         cDYpsgXsdIEzZai6yl2w7kfKNRcCbvXgfQh6LX9yMnonr+eNP+aOA9SOE/fFeHaAyrbM
         5jT8IeAdOOj5vIUsieF8Q6190kd6Q30l7tzDXe5LyQAoV/Jh0nIwvhtmtP1AgjWMdH9l
         kTvA==
X-Gm-Message-State: AFq9FYJvcCxKmd/4sLVugMYfjtEMpmKg1IlQ8wpJq4OxKj8cvP7nmm+o
	a+O6/HSX/j4GEZcZthakiadhIWMsO2p04F69reWW3RowTbPO87YpTgZYoerAFicD2aJikqFSBTz
	rSusqqJPCVbXpuOTFt6J2suBxsfuccWJmTwnmHjG5Fu3438/dfiPcyHj4rdcKuSz5+eWattNPzS
	g+
X-Gm-Gg: AYBFou2fX7y63fSzYAkWK58UdI29I+I5BVfu7/Qpxf4/00gCBIFCa3Rca8o/zDBgo4a
	93P6tKeHxwdB3FeM4yMXhkJb9d9p9OCZZIyX7aUbZx4UkCeNaTPR+Ugw6edgvKA0tgQ5Tl2HHJk
	lEWuei3lev8mgzsVx/LsRI9YClCieIngjbpdIifcmGP1zgqm70ybxyvBHkps+xI8XGuQNonruYv
	kcoNmOAAQILnLAilec3J2QJDmDg1iWKaR9J8hzsJ2YxqZR33gG5QNfwRLncW7w2B/dqmDD584NQ
	n0ZmYWH5MJ/GayLvGKkHZwcOmCK2Hy02Gz3w5Yzhvq7cm0kpvLJ4RsmEfWzp1eGn4yM0rTh5WyJ
	soZ+da/rsDJaN0ByfOHYDDjIkh33VJfQt3X5FU0NMtL9mB7E=
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018306a91.10.1791886631075;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018281a91.10.1791886630551;
        Tue, 13 Oct 2026 03:17:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:09 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Tue, 13 Oct 2026 03:16:44 -0700
Message-Id: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwFzmoC/yXMyw5AMBCF4VeRWWvS1i3xKiKiTBmLkhYh4t0Nl
 l9Ozn9BQE8YoIwu8LhToNkxkjiCbmzdgIJ6NmipcyWVEst4Nh7tgK5ha6GkLXJrZJb2CPxaeKT
 jK1b177CZCbv1zcB9Px6p+5JzAAAA
X-Change-ID: 20261011-phy_refgen_1012-10f76fb054de
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1971;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
 b=6frf+yFXAaqyaPmdIMAnDHUDfI1y1k+enC6eYkVgkgwXK+bAtirq4hJ2csHaAqmIn+syIomZF
 29mOtBxSC7pAmRLvlxvB1iL5wicGJueQVPw9Dj+sFldDwnqxrF2p8l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: l1zz5sENvROoJCujhGiVYJVW9LNWa-HW
X-Proofpoint-ORIG-GUID: l1zz5sENvROoJCujhGiVYJVW9LNWa-HW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX0ahJkuDXxoIl
 AFC8bRVrymojFvw/Iany283Y7F9iwgxR/ED9nCbrzbWdlhH9amVBrKHBmCZkAkSWmNGrJaAXJfz
 HYWYvtS5ZPnB8NMMsaxtqiTqaLin1YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX5dGMxOKcSYIe
 UD0OdZYBuMHrmBqDyKNk8r+enR4ZctFCMEDb7ZSOzq7g8V6J42O5+zTKxfttJDamSwoqVngiUzg
 6CQ5ORHi7GvdJLYluYP8f36Bm02dPtPMvguRa4J2AjJ4DD/Li8uOPW23Tpobc+YCq8l2AbWO/Ax
 i1TGoNrlM4Q5cB+8Wa1nOxC28cyws0Pv6tSNJ7uP5FeZPxvnFuapYI8cL2NxwhA7n1CxRQiIUc9
 TOTCHTBXQdY43mIY2egry0arrFbqN8yXPMW1D3NHWZDUgwBp4Mrl6W9Y+mWr/N/rjsOURJi4hKj
 rezpiXphO7pez6FXoVWiYxuG4jnFjAvo3w8zmOerrOG1OHIWu40drSvgUjASGQOBCVf9tIAJ0VF
 YmjNGeCoi8Fx3JMZZKALAFTelS4XKB6fx0eXcZh8V1g9AS/PCgtRJaMCqjqzcfnrfRUPSFD8Xke
 hJzD0fK3Qftk7Sbe8qQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0527 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IXTrTkLk_8iMRye1LOkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040

he PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v3:
- Add vdda-refgen-* porperty in all glymur and mahua board.dts.
- Reword commit msg.
- Link to v2: https://lore.kernel.org/all/20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com/

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: Add refgen supplies for PCIe PHY on Glymur and Mahua boards

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 .../boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts   |  2 ++
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                  |  6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                   |  2 ++
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 10 files changed, 60 insertions(+), 4 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-phy_refgen_1012-10f76fb054de

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

