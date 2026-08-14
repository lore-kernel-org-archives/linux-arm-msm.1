Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E734750B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685065; cv=none; b=QXif54Etk9b13+XV7CruMRO5cOIZKBuvBLLWP6kXTXxjfHyHn2CnpD1162pWN+ASmPMQKM6HLZWa5yG8SksAhbSBo8XcHQbhPZGplCK7piwYLI/s6iGCWZLYtsCDBHGTJM1cQxBijmrrN8ORt1nyFGNEG32RlJneaafoO0ytuFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685065; c=relaxed/simple;
	bh=ZbgBlD0ag7ccwIjYg2U14iWvz8GBI9uDDOaosXFzdaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a8SWf2ILhpj9G3kkLF8xg4SrGZ5bTu4mlOgEJ4QzcMjHrJTCcrPvHsx+jrRX/0bSxPI/WMBogRf1lJtWN7EnQOt9HQ5JkD7XYZQBUONHv8IGFi6A2h3WUMDrX1JvYdIhE9gbmt2fWAX6aHemqFx6l0xXy4HwBl+rTyzbqrl+4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Po1HLIfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=coQGrQnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Po1HLIfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="coQGrQnd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4iHZp292019
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0oBZFD9FaBmDgDNaPAqWu2
	VqrUsjvsuStxE2Kf0gTMg=; b=Po1HLIfimYL8g/VvpNxAM4HRWK4mIjRP1DITxF
	+1vB1ZSzoBzeSwmMuexDu85H+/u6tEsvHDC6Ouqmiy9KRK0X/SZCB4JOLfHZJ2ic
	waCdHxuNjqEW204Vq5mfeoFD5RB7Frf+LburcHpDmX10AcMO5IQCox5Yf5KN22Tc
	Wec6fTNm/x5ZXkXfShvu1htGUxn0jXfv26dbx5Nn5U1x9CbaWzIO0Ura95YrZa63
	iMOCjUbYrHSJvzlBuS5DLiV0EK7whVgpwn7+LcYI9FoGXqNO9g2UH1JFsX/wiGpp
	Xt3sTLFvKR5GM0XORmm8QQsFdKJogzOXXWBsus7/elBeGGNA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8pr4cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:24:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so383209a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 22:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786685063; x=1787289863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0oBZFD9FaBmDgDNaPAqWu2VqrUsjvsuStxE2Kf0gTMg=;
        b=coQGrQndpzb3R4SGzmJHTR8IY8sdE1G+XxlJNhIPXxC8E+EJCYm4roBYci0nMwkLnK
         OZ7ghknjleEw8I+uP1D6Z3Q3nkh5nMXb2zyHRf09BuVr3mFUsj2qFY8SiiRk9qO8E7JW
         OQ5Dvq/SelOiLJ17FMQqOHfm2vkoWQ5ATCerwSmX5iwzTRqLDotOV9CItbtbk+5yQrkX
         pgyPtf59tF8xhPBE2WIGmW91zPq1f+EppqQ1Oj22EzFMZWfvyhJhBYC420DvggVcUUi7
         Mvy5ntgCZEeuVvofV/uhz/FjsGasd8Fq21Z6dB4HVN/wHq/JGBAbEwOiaYUqX2pp2f6f
         nztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685063; x=1787289863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0oBZFD9FaBmDgDNaPAqWu2VqrUsjvsuStxE2Kf0gTMg=;
        b=EQlCQ2txmbU9UdPrT8BiZv1f0J7Tn6xA0WY9O06EcBTzGISQ6z6afRbgQM+o/5Gmqe
         QVYrOeTyFi3CEivorS+7AQrvxMp8hrUUuHZrKKtFiDT8g8zL2qJf4Gf4B8kW1CaIAWUm
         x+XmSasG5d/OjS/DVIrGFDVlyuso7WIRKnyMmBi2sfkTKTxN/CpnH0r2anIaA1GSat5C
         o9R3SVHDBGRXh7eTDFFODcBeWUHtKu90xmln7RmCbW0J5xZNsC9Y+A9ddEWLvAYgvNjF
         5Cs/N2/EzzkcXOuo3cblPd6GR0WbbCsExDkM+2zl3Gi9n2DMxFTyNLPQTm2WusqUOQTW
         8Zkg==
X-Gm-Message-State: AOJu0Yxzwmsxlv3aAOXrQaftGtzFtB+iulZBtgdQ1BQtGWf2tZq7sQlC
	jprtyPWAeGjN8rvpSZ7+pCjmNLLMB8dq5W3a6AXETNj1RrDZVENmq0hqwJ8e+VbPcVpp3EsPtWO
	/ALYUcZRZUbqbZpT2fMn88tcPEjlQT82u+prtc11RN8mcetyq33fzWgC26x/+Op8w/af9UR5AJO
	J/
X-Gm-Gg: AR+sD110ogzIKhv3j+PAfsEfMi9jqDLuXNO5jM4JZmZ48vUXg6USGezRQIamnbjfvv4
	Lrs71Ro05+s/wS+TKPSZM3ZHjlDHpdaCLipVSiy8BJFdeYskdfYaFGajfXfX8da5DRlMfbD7JIP
	Pqqm9dMXNTHledqmrlUE6KBHNiXhQZpSFWEoGY9bc84R31o2r+2HhFDF8zXl91YjlxMttD7oabH
	h6BY8y+b7c78ZUa7/Q1E38zlV0lSmIoffmZr84QaCjJVZhmZRcSVPJ1JkLx8HPQKJx4qwn/l30l
	LaZHLepjmkZIQ0NNWsJBaPCRgggaztXzJdiWoou/BlPJ69GQberroNHN5ithj31+cZILK8DvkXD
	ncsObo9CeMRaebrcXutshOtMw3d9+KM5gsljPeZMkPDlz27g=
X-Received: by 2002:a05:6a21:3294:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3cc707a2a58mr2538922637.11.1786685062973;
        Thu, 13 Aug 2026 22:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3cc707a2a58mr2538902637.11.1786685062555;
        Thu, 13 Aug 2026 22:24:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef7109658sm1893923a12.16.2026.08.13.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:24:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 22:24:13 -0700
Subject: [PATCH v2] arm64: defconfig: Enable QMP PCIe Multi-PHY driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-enable_multiphy_0807-v2-1-ec2a63f87874@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHymfmoC/4WNWwqDMBBFtyLzXcWkPvvVfRSRqGOdYozNqFTEv
 TfaBZQLA2e4jw0YLSHDzdvA4kJMZnAgLx7UnRqe6FPjGGQokzALUx8HVfVY6rmfaOzW8nyKvMm
 SOGpTVDG46Gixpc9Z+yh+zHP1wno6ug5HRzwZu567izh8fyYW4TtFss2FaK5xou6GOXjPqq+N1
 oE7UOz7/gWTyrCr0QAAAA==
X-Change-ID: 20260807-enable_multiphy_0807-19d8654f7ea5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786685060; l=1031;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ZbgBlD0ag7ccwIjYg2U14iWvz8GBI9uDDOaosXFzdaw=;
 b=U7HOCXN6sSmDBhpAW/PGxuzYnAeWNOdI9bEJ0mFNaAfcVWfKkG0exZmdMGhL1RaeHaHcNPw9j
 9ouJ9DFD1TvC672Isn2QOL1Dm74XS4lsvQrIP7Fh3OKSZdn4d6ZZhNG
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ea687 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VM4cYrm8JDUZXJ7KupMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfXxSR4yNirqYQv
 z7bM/HWRAJLsKvYvtqiDqIVnL8/uHTvwKv8Px6woXXOFY3HOS9ueul2pVhETCuufth0kvLjsy7o
 TJoeTa7xLI+GiodK1qe8lwbVtAq3mC/fkRY/S7cYSuNXJkLssWISthsyJ/1R38pqUOvhVk432am
 qUOFk0x0UA10B8CEDgEyTVq3Hm6Uj/DlSC2vfAB5MQmQ/VWDrEIwpL3vwNnWCwmpSJKuEjY6/8A
 o2RGsUadAYbGH7YA1eTgYOj1YuQ14jdlpiwB47tKFDLJ+dc+sFY5wbPAP15XNE5wxVIGz6m0i2Z
 aAsiic8tuLEwY/KfqqtmqNLOKn142ZjhP9OpZuyOvVSqSQFmoZtaQrHhLP5+C3nlpAAftokp1AS
 nEzsWw/F6EtkqUSeKnORSLvFJ5+8rtkpmr+NtiUJmqB2dL4HqeWVN5s59q8hhSvNzi1c1EnDIno
 JO33UcRUUfkkDV4m+zg==
X-Proofpoint-GUID: ghXciowoMgG51pl5acefjiRQiUoRVsZc
X-Proofpoint-ORIG-GUID: ghXciowoMgG51pl5acefjiRQiUoRVsZc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfX2TTU3vL41Ymw
 MUymjCtAEdk/Tj43o5mq515krsNV/+8fw0S3BX0yJnSQkDvnQH3hCJ5lZms7j0jEiNLTzfFCus9
 MSn6fUal43e7vgyAxJiUTGSued3E8FM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140039

Enable CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY as a module to support the
shared PCIe3 PHY used by PCIe3a and PCIe3b on the Qualcomm Glymur
SoC.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v2:
- Reword commit msg.
- Link to v1: https://patch.msgid.link/20260807-enable_multiphy_0807-v1-1-142f911d356a@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..3f3e68de35f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1778,6 +1778,7 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m

---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260807-enable_multiphy_0807-19d8654f7ea5

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

