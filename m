Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F970432BE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785309; cv=none; b=pp8ZF1LSgZ1VvAT4O3ym3ASFpjc/3VFTUxrqjb/VVnTWydHxIEgQWnsTU2vvgQlddUECHOBjlMIiyz0549e5f/uhRJfm/NuK0p6e3Dis+mvMymfPtRiWIi49ovsuSvhxcnUesOqn9FH0JI3W3qwDrr9uSZdTdOlVtxIHevi4MZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785309; c=relaxed/simple;
	bh=kcWOMlj/WAm/ZutVbNkBx+4jW+1Soq90wUY0HzJezuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=udKjtB4X2PSUKgw6qyAmoJ1EjDtD5Zo11d84QPflzIYLSKLzBupJDdPNGhzL1pn2WoVROVMPcNNg3dK2qqX0nCLLueZXmUDLx2XWOJ5uB41f/gOcxNs2CY0qNWRXuK1/mCCrNzThvKgPFvlklUoWgtnuEB5sPk39aQp+kXnMyEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEfETHIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtntpGtL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEfETHIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtntpGtL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwCOU1017805
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N3tFl8kBLYf1uAtp7p/G52
	iZLQ+hHS93kntf/l2tBFU=; b=EEfETHIitGq1Z2YOhAte/3UKJPoXSlwVJxDou5
	f9LctNIp0pabbaFaxyANYCCuTvocp9Vd+HEnGQnMmTFBIWgjABie9gSJdwaViXQS
	ce7v9pyWRnhtUEqEhOgixaGUvfGBdNcqi79yy2Y6K1BuAYAKZ2xUziOfRyy3bK22
	2hzt8NuY5DTw2RTVkXqdoyIDQS7+zbIQGykoRgMPLr8Tpq9aAKS+aKu4FT5nuvok
	zAp7kSsECitZ6vL/Wcw+pZYK9ILHR1bp0O0XwfbJg2vnOtKScUTxE1MvaF4QvATx
	BbaTJWLrXO+SGbC2eOPHnsX0oPUOELNHgpJH650KI8fMcGrQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r381j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:28:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2781419a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785304; x=1786390104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N3tFl8kBLYf1uAtp7p/G52iZLQ+hHS93kntf/l2tBFU=;
        b=OtntpGtLngpdrGSoKmsScxxPEIj+C0MD8gmv+orGm9GPlSU+qDlz9CRSFHcLAZxeKe
         RYmEmPkmSoM3exoDNsE/pk6VRjAImbgwPUoNJ25KuilfIZKG2roQ5sZtf39bIS72iCe0
         mS5tO6mlPBQ2wXLn5vo4xXbk2YGHf0+3KWj+5tLPxZXyl5u8cxMHkHOwT+hv4tRKfNcX
         CbuV4R20t76pOuoHrbd0g4zyKFbLG7mrUqbPXrWuK67TGlvYy2Ncp8hKX4OFUdQbW1Ka
         Lh4hUHVIIazjtj9yqEoM8Z7fuqi5oQrNJvy7OXgkxSyOWAL1toMRpNy+LEXWGYCl1fVy
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785304; x=1786390104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N3tFl8kBLYf1uAtp7p/G52iZLQ+hHS93kntf/l2tBFU=;
        b=Dcbvbaxe+3NFr+D/WqnsKzYCP0/xFB24QDz4oVnGxjO0rfxydlpXHdQmHdSZcewVWl
         v+8aj0Zn4CsLc15fDDRPWbGMBaNwZAZo79F2jSsOsh7cX7+kMWAznI2yv2+7f4AIyEY0
         fi6W18FG+86CMiPIqDVfYwm1w4br2SPcQ0ouJUmCUacwq96UKlAbAEGgCYsekDJzhVcY
         wie/4TmTco6rzsGJSz9hriBOVDTRy9nlvOUYntnGUk9g9BjW5lDVCV4RppiAzOnEscdu
         hDG6qexbkeI+UFmbvagWVN30mIY6c1TvqeWt4ZAcS41W0f6eiI3NLKcPtF8znHACsp8R
         Q7WQ==
X-Forwarded-Encrypted: i=1; AHgh+RozflESWW+R9mw4HWmi2bC6+3VEBFjtia1mfq26bWtRHMr+zRimMDT9T1siWfYX8tf/Ed1zHiYValjgVqpB@vger.kernel.org
X-Gm-Message-State: AOJu0YxkyH6iH+4OCOH4XR0JHml53BLTcCTdfblIeM6+zmKAByvKXU5R
	0gskkJwPLtnTqUyMMZ7g2e9KzUjFs0Ax7sDx8WSXtoFkpSQBlqNOWPUgwyPhASJ4BSz05M/vb3Z
	1Mt+BGDNwafejP110uQI5Z5miNT95nS5pxxudV3VAm3u+d22N/GEP87V0vRS0W25zgkFj
X-Gm-Gg: AR+sD12omZnu2XANxP92d6AbZYu4OhZJS602wQNRiR/S1cq8U0l6HEzymGuOwCbqQ0p
	ZPVi4bAiS0r2QhVU7bpDbwFZM5ltsBav68O0wbyKPthGZWZYmbYtCnioGRy99R7xHPX6Q2xnCvy
	KiU2uxhNZKlGwpZHHF5zX/9PSBfmMd9jZcmb07khIt2VsLd/kY/SBxOK0VvFUdA65joXpdi8Oh0
	QPMpcupLbOTeWEGuUpsLQwuNbFC7NZk0pe1nhaNG9MmwZQl/QaSU7u9QFqqtP2sAXD8NsNw3m0R
	caBPb3YVnEqKzXDsBnYc32bKh2ULjFx7R2yvCqneMVh26lfnR+eC5nxb9rGC8wDKC4BIgIjNvqH
	t+/57S1BVQ9iIRGX5MxAZzczNzjCh+w==
X-Received: by 2002:a05:6a21:498:b0:3c4:3672:ba2 with SMTP id adf61e73a8af0-3c92a98d45bmr11342911637.71.1785785303671;
        Mon, 03 Aug 2026 12:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:498:b0:3c4:3672:ba2 with SMTP id adf61e73a8af0-3c92a98d45bmr11342878637.71.1785785303153;
        Mon, 03 Aug 2026 12:28:23 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:22 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Fix regulator voting for the Qualcomm SGMII SerDes
 PHY
Date: Tue, 04 Aug 2026 00:57:56 +0530
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzrcGoC/x3MWwqDMBBG4a3IPDcQoy3WrZQixvzGgXphxoog7
 t3g4/dwzkEKYSjV2UGCjZXnKcE9MuqGdoowHJLJWfeylS2ML43GkRnr0KQ2QBtB/P/adRZju/6
 NZxW8zx2lxSLoeb/3n+95XmFl44puAAAA
X-Change-ID: 20260803-b4-sgmiieth_serdes_regulator-0cf9e58dbb12
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=4211;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=kcWOMlj/WAm/ZutVbNkBx+4jW+1Soq90wUY0HzJezuw=;
 b=avz68rJMCtL0b+QIapBwZbqEwAuODhVGmCfme0SBOB7pYtKXFDnmQlcE15wQ3sK8wemigAtOI
 nESIZTZM4mrD9rKCPoYPfueKFGzuVvoBV2yjmd0/KwJtTeZB+qz0UcM
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70ebd8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t6hOiKbQElhDP0ySfcYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: G2gsEeSoyj6lRLR-39cNtANh3dBufaPl
X-Proofpoint-GUID: G2gsEeSoyj6lRLR-39cNtANh3dBufaPl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXwjHreIQujHYt
 zLcfTT3U7dVsHNyU0MriQorP2UPa4DPUriWdiWoUWQ33EwUELYVOyXTYbVQ/w+DafJtTTlQHOgq
 MMoX2qBZdnIJrWST2pbJkkNbv+iv46c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXyMRYb/TyWtbQ
 8MR7+oYkBOMr4P8Ib5T++Vz42AwO07hdQVh19SetfSUEA1lspe3Idnj5tbYUPBMAa5ZzwRWzGe8
 sAGqy9AGQe2Eo68Ur4s/kk2QrHzp57p1bmKo8op2dv7rImzkKySmViCK4Qm8rGoTakM/J/PDKNH
 SaQdk/vK0GhHY2/f7j/E3edRnxJ8NEA8T2NnU6N8gWnhQzVVgZEQZFYPwbPhXzJIbHKpw4CHR6r
 /HdAmxm3TJff/A/q8xijF3Dt0637DMZwQEPgLp0w1Rb4DYxVGeUgUS0OnkoVEK9Mqwd4YS9FWk+
 DNZwCsmmTxcy6b58kAMTclcDOES6y1KG2/6+f+Uuk+DlHZw5AKVYtoWDrXL41qqoC5QlMe7ZZCN
 Sfrk1FwjxeYmmx45Jwd/l35ZXR3+ve59S8s8JmSn9Kwj4cU47wBzo1ysjw6zmFktXMgi4sG7vfn
 JqnPJHOpHoLerErO9Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

This is a long overdue v2 of the original patch series which tried to
address a SerDes power-up failure observed on the QCS8300 Ride board
using the phy-qcom-sgmii-eth driver. After going through a rabbit hole
of hardware schematics and power data, I now have a fuller picture of
this IP.

The Qualcomm SGMII SerDes PHY (used in Lemans and Monaco SoCs) is
powered by two voltage rails. The schematics call them vdda-0p9 and
vdda-1p2, so that's what we follow in the series. Additionally, the
0.9V regulator draws a peak current of 46 mA and the 1.2V regulator
draws a peak current of 15 mA.

If both rails are not enabled, we see the original issue where the
SerDes calibration times out:

  qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
  qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed

Currently, the DT nodes across affected boards incorrectly describe
only a single regulator via the generic 'phy-supply' property (and in
some cases point to the wrong rail entirely). Moreover, the driver does
not set the proper current loads and just relies on an enable vote.

This series corrects this by:

  1. Fixing the DT binding to describe both named supplies.
  2. Fixing all affected board DTS to use the correct vdda-0p9-supply
     and vdda-1p2-supply properties.
  3. Adding bulk regulator support to the PHY driver so it enables both
     supplies and sets the proper current loads.

The patches are sequenced to maintain bisectability. With the driver
change, the PHY framework will continue to vote for the regulator
described by 'phy-supply'. The DT changes which follow then remove
'phy-supply' in favour of 'vdda-0p9' and 'vdda-1p2'.

Testing:
This series was tested on the following Lemans and Monaco based boards.
  1. Lemans IQ-9075 EVK with the IFP+ Mezzanine attach (dual GMAC +
 QCOM SGMII SerDes + QCA8081 PHY)
  2. Lemans QCS9100 Ride (dual GMAC + QCOM SGMII SerDes + AQR115C PHY)
  3. Monaco IQ-8275 EVK (single GMAC + QCOM SGMII SerDes + QCA8081 PHY)
  4. Monaco QCS8300 Ride (dual GMAC + QCOM SGMII SerDes + AQR115C PHY)
To conclusively test the new regulator voting, I tested builds with all
the other consumers of the regulators disabled from the DTS to ensure
that the phy-qcom-sgmii-eth driver held the only vote.

Changes since v1:
  - Fixed the DT bindings to describe the actual SerDes PHY hardware,
    which actually has two supplies rather than only one - Krzysztof.
  - Use regulator_bulk_* APIs to properly set the current loads of the
    two supplies - Konrad.
  - Fixed Lemans board DTS files that incorrectly voted for vreg_l5a;
    the correct rails per the power diagram are vreg_l4a (0.9V) and
    vreg_l1c (1.2V).
  - Link to v1: https://lore.kernel.org/linux-arm-msm/20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com/T/#m0b93e06a0d6a09c4c1b65c500b475958ed5e288d.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

---
Mohd Ayaan Anwar (6):
      dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add named voltage rails and deprecate phy-supply
      phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads
      arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: lemans-ride-common: fix SerDes PHY regulator supplies
      arm64: dts: qcom: monaco-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: qcs8300-ride: fix SerDes PHY regulator supplies

 .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 11 +++++++
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |  3 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  3 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  8 +++--
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  4 ++-
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 37 +++++++++++++++++++---
 7 files changed, 59 insertions(+), 10 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-b4-sgmiieth_serdes_regulator-0cf9e58dbb12

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

