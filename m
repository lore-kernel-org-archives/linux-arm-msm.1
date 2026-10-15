Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1D4FD788
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061563; cv=none; b=heItBIK1btegEz7FAjlEzRWSqIqzrqk2rOMztkWW7BuNzRuWW6hE/6fAmBMyogYxUeQ6zfBchACdr/lVc6hnxZSP40pfYOd+0oQ03o9aXtzVr1Wpu8ayCzp/zFLLmggA05ChTsn34HxVZkPvmOUOfHf7d8/zssErJRNZOfldPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061563; c=relaxed/simple;
	bh=sVgpnLeu8qKcaimXEVH3dwit4Sjz3mpkqpxC79rDFXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G2pL+7aCT3I/snv+kf5kuW69ahIDzH3kxvkiGor5vRzmk/A2OSyu9IP3YFplS612/kPMOfmMw8Ttz3WmtKsHJ50kfGrBCVAuiJ3NUbg3N2n/XYi9SHkYCSxnwOW53c8sMMfeqh44TDCfEW9lwilLk4LslvV/humPyNcvcwZ4514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmBgMZWr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/1EsjkL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmBgMZWr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/1EsjkL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHP94077449
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbOJrqM1Ojo/79aAYHIn6B
	axFRBvvbOhA2QLp7tLQrA=; b=MmBgMZWrt2WwhQwGEIZRGhb3wykXXh3UPmuHuS
	mrdUJoYTwNZ9s92huU9Pv/KZfZL8PZm2DMTMsJgozTlaHmBerVFkqYtb/Ovzc16n
	BSmR38dTDta8uUNrtZQc1SszfPkfGnjkwVnNclGyEPUd92NW/5Wf97wB529liS1I
	NDVxiS9f6/RnT8juudzP4ngYjpmWD95D/woMxZKeZZobCkXXOGrcBjBye+/fb+X4
	qXjBUMmaTBg4BWiSaoUCi7OzFEsXT5/qygAtKPNhowHAruI1wFrcy1edVqXaPRfg
	OJ3FsWjgZDpqJzJVT6CMH4Rqnn+EJXJrmAE7PrWA9PCk7G7A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0aj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so59741855ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061557; x=1792666357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FbOJrqM1Ojo/79aAYHIn6BaxFRBvvbOhA2QLp7tLQrA=;
        b=I/1EsjkLfysyS1sD5oSIlJS0pLfJQVp8vICE3KMFMiL/WZxUpMvm6AB+d1h6M3Ppoj
         TWlM1g/nwoNvM3nqXksLWNZk6J3ljpnMb4VoJb0fBkokxAdd5BNP1D9TX1uZLlS35P48
         r9dhiD3Fbdp7lCT8My/d4SwsgO1ziPgV3KeJQR9vP9HfaG/ZANO/3Gt2Bz3+PIqQHnlE
         cKJU9zT06Q6WqOLUmnPrKipNZGTgp8W8idR5YU/FdAjVfcTF6xR7d251wczeWAjcOGOe
         +O5KbMTTeDYLNBP9zvdReDWD+Qj1Nx92IpFy0CdxU3VcUrwtn2zOVT1DGsJErIzafIvG
         x8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061557; x=1792666357;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FbOJrqM1Ojo/79aAYHIn6BaxFRBvvbOhA2QLp7tLQrA=;
        b=pvpLflLqobY7pd7hKfvWilqgNnlgXfxH2+W/ThotuAQ/RUp+e+bcV/SysuNjJIAwiG
         EnTiHWKIivrDRwNgYn0ScOUsfLBqOfs0hadIYon6iqisRujtcbxOk96OmY6DKeHMhWh/
         ZND3I1BRjOnSHYWOu4HuWmqOZGLe4K3rbNMylpE5xG9BIUU9LNHc+LglJhcfpmKhe3Xm
         HknL/Nb+Af+bTHR9jfOuQf1QPSUN5P88URCvLGLf1uMqjSbaglavU12Og+Qq/ZeH9GHA
         qvLYv4RxKpJJuCuyE9CHlrdyr07npRG4c0coTRFC6LTuHXfqUu2dC8bNNtGeicAhyS89
         o6vw==
X-Gm-Message-State: AFq9FYLBoNN8k3CSp36z4PppoRMmgXXxjV23ZBYv29nS6tlFtwjAMW/L
	uu9Ee8F/P2Gq5RrqX+APdmaKSmH9fUiYYpu8BuwfpMPeoGf7yUdAlMPAfT3FPOik9poCNpoDQzt
	1XnQaXgVIL3srn/DKCkUrYtGn/yiwuLp7SIvZfYB0ynMazdxuSdSstaojCP0M0+zG29tV
X-Gm-Gg: AYBFou07X1NQM5og/NbLp2qoWXj6D618tZ+HV0kil2sPaxYrKygDZTO4orxpyhyjTE9
	rF0ABqSkI8TuVZ9H/6c+ImgA9QItnUm74GPFcUl0vgi9JUjVt/e2QBGK6F3llMuWjx4CdO8mp40
	aFM3gwhQ0mOYfjIdgFeXVm9kjwvxdiG/x6JMLnVlTdefe/+uAlFrRcxSPKdoVDM0X4NuxAhVU3X
	Jnpo3qsE4iVvN1Q/vVHvzZMOVoT5yVnHxW1aVbEjNB3/sGw5G6FgQPpoXfNIgW6/nn63G9/caUm
	4aMh1rFz1vfOVpjrVF6GgwDny1ATudFRzA1ciuybjOjgjJhFBGCQlYx5/Cyf97Iymt5qWoB97lI
	gvLC7+yxt26s57R/Vf3ETBmqdbPnsYg==
X-Received: by 2002:a17:902:ecd1:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e842ab6a1cmr133166605ad.22.1792061556815;
        Thu, 15 Oct 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a17:902:ecd1:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e842ab6a1cmr133166425ad.22.1792061556273;
        Thu, 15 Oct 2026 03:52:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
Date: Thu, 15 Oct 2026 16:22:25 +0530
Message-Id: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmw0GoC/32NywqDMBREf0XuupEYGh9d9T+KSEiuGjCm5qpUx
 H9vahfddTNwBmbODoTBIsEt2SHgasn6MYK4JKB7NXbIrIkMgoucV7xg3bC5JTRaOaLGzMQKkXE
 pNC+vZQ5x9gzY2td5+ai/HHBa4vP8K3tLsw/bqV2zT/vHsGaMs1wLjUaikm1190TptKhBe+fSG
 FAfx/EGTd6RV8wAAAA=
X-Change-ID: 20260907-glymur_camss_dts-721052c08486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=2800;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sVgpnLeu8qKcaimXEVH3dwit4Sjz3mpkqpxC79rDFXQ=;
 b=impTvaDflBT+ZbHySaYioQoKy7Yv5CtMh7ax7WCjUcQq/rNkdTR2Ye1CpQruauUgzLw4EQzcq
 BkDPTJ+dr5GA+TVV8q8oeFjKEGWbsF+SJz/LYFVsJwC6EVDAACG3fsL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0b075 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6dqO1sxPLyHYMyURGwUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX3GhNbdzX/j7z
 rPl6pFinuPGoelX7JcMUq2ljPTTh1djstGxaCQvCloJs6dRv4/ErRwPGIBBNsOYoEuu455RCnzA
 JIkQPhEh8+7v/KuaKH3zAzSmxEgMNZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8Y2k9uYouQCb
 lkdgwsPgFbvdzm+SLX+l55krom1n/+BnY83C5NU2oQng12HIiL82pbjLi5dO/rd5NrpHoJYI/mG
 EG3UsaBOJdWvcUlEFnU9hoKtK3XjQ/ziS9BcD2l0Q68oKf1SAORO2Wwtd84fhwTBdCb+N8pDjei
 V+BOYS6wUB/EsyRsmmrFl4oCtYaHfLRPcfb+mpunUzzz7gp3Pvy/WBdchuCaLiJMuOj1j9A7rjc
 vAhjg3R+9IpzkL/42y+FlZURhT5IrSlBVbhZMRONFqnPQa7Y+YNZC777YNyr0PJ84AizFdEnpr9
 bHWvXMXa/cTzXrQoqmdyB/RP1XOKRXEMBAjEeIDwQED1Dpl3m1tSTXxzIzgiB9o49Noh8Umfk8C
 Wx/KlaMIDSzulvoFSd9BY7T8fON2gQVQg5g4UGKH6CGLdIt9WK0UY2gzGW+sbahRWkWs/sUO3oQ
 /ROOe/kBMPg0wbSgwAQ==
X-Proofpoint-ORIG-GUID: oAKHBUxkS-Blla2r9IOJRQYywNXT9-Lg
X-Proofpoint-GUID: oAKHBUxkS-Blla2r9IOJRQYywNXT9-Lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150043

This series adds the camera device tree support for the Qualcomm
Glymur SoC and enables it on the Glymur CRD board, which adds CCI
support and enables the OV08X40 sensor via CSIPHY4.

This series has been tested using the following commands with OV08X40 sensor.
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"ov08x40 6-0036":0[fmt:SGRBG10_1X10/3856x2416 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy4":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -l '"msm_csiphy4":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video0

Depends-on: https://lore.kernel.org/all/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com/
---
Changes in v2:
- Glymur CAMSS dt-bindings and driver merged into linux-next.
- Rebased on next-20261014
- Nodes without a unit address should be sorted alphabetically - Konrad
- CAMSS node need to be sorted based on address - Konrad
- Moved operating-points-v2 to before status - Konrad
- Collect RB's and Tested-By tags from Konrad, Abel
- Link to v1: https://lore.kernel.org/r/20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com

Chnages in v1:
Internally reviewed by Konrad Dybcio:
1. [patch 1] Remove stray blank line above CAMSS node; keep blank line
   between last property and first subnode
2. [patch 2] Use preferred phandle list format for CCI: foo = <&bar>, <&xyz>
3. [patch 4] Replace qcom,pm8008 with correct qcom,pm8010-i2c compatible;
4. [patch 5] Move csiphy4 port@0 endpoint to SoC DTSI; reference by
   label in board DTSI
5. [patch 5] Reference camss_csiphy4_ep by label instead of redefining inline.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Jishnu Prakash (1):
      arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

Nihal Kumar Gupta (5):
      arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes for Glymur
      arm64: dts: qcom: glymur: Add CCI definitions for Glymur
      arm64: dts: qcom: glymur: Add camera MCLK pinctrl
      arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: defconfig: Enable OV08X40 camera sensor driver

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 139 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 557 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig             |   1 +
 3 files changed, 697 insertions(+)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260907-glymur_camss_dts-721052c08486

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

