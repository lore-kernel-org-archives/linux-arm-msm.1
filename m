Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F83403EB
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310970; cv=none; b=c3F8++Mr6UYYTw1SAkZGJ7EHqciWl+L7eke66+4voU+E1m9x2onvdMuK5qZ6ehWKepXfxnUWhQNwHA4EXsuEwqfBmivQKFbzjADdvQArZVJgUzuKaonk3TT2MrHsB/Bj87FWBd816MwWHGRrNCaIx36apyIBRqW6ya3hG0V7LS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310970; c=relaxed/simple;
	bh=uk998/66ZhJEP8npAHhETVS/AoVjpt5dHoWqpClPnjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bGBh6JT9sQ54O1nrcA9MPWIbZMBsdGDfulqlMKm13+0y/hc0il3hjwuGe1goknTWVExZkW+qTI/S6z6pz4w8DYG2frAM2WtU1/h+QEwNkXQRmHPSB4qnVpN6JfgeTz0qb4M9yMgl/M9ydm29KyTGMRrEo1eUYrg6+zaOpXPcBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4TdSWkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj/IVERE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4TdSWkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj/IVERE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LD2WJ4103103
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 21:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f+n4Rcg+Pp/LYqaRT7CKmn
	gjyiocpVFdAjf5CZAA7cw=; b=M4TdSWkMV3zrQE2WIpws/CitxwV055aH5RTLSe
	+BjPR1B6GmbtKXBYRAKWizBvg5FduyXQfXtUUfhqkBvwJMjA+Z30dFsZbHs6yU6O
	t0WfM7RMUDR/dXNLAE6xOpPaVM2C5VgeXSeGW6iDoB1dF0X+JtaRgHFIGNB00NaJ
	bXDW4ZK6N5NWG69yU2Pj6WU3zuzrRq31c7ZQGWkaZ94QJvk96aVXxMQpzojY7AYx
	0t7l9DDCO7V2IbnklqNOHQqpDhKRs+NbMNRDCBVLCJiRfkfIU6sl94v7HOeF0Ov6
	l9IQEDr2OXBrluIH6KT9NCTBKNQ75E1erbvtcTrdmb+d8X0Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xr0jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 21:29:26 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-821167f53cfso42366197b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310966; x=1786915766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f+n4Rcg+Pp/LYqaRT7CKmngjyiocpVFdAjf5CZAA7cw=;
        b=Dj/IVEREz8sIThWHSJWPPZTWR660Aq6k8kpXB+/UYc/Rl/bgvFRENhOzhskk/wJOdO
         dyInYwLos1YRFTHMT9Q58I2oLave1zOCA0lQXojK9lI4dVpgNDOm+wfrdPmKg5K6aTMK
         48NxMbe4ux/l1HdzBknhSRVokdoG0hqIOCgBOxVeqkCr/Hh8sAYPuiYrD7J7d3Pt+3nq
         JtvszpIkKoBPBMEGPwWm0Riiiacmr3cjIjjYFjdyuETGd/ox4vhF46vVjG5UmZWYikph
         F/O3ppFyp3bJ/R0EkIHk23gRW4Yzg0SUshgQkaKzOaH8Wcw1gFhemA6fQ3g+nSmf0B1b
         jnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310966; x=1786915766;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+n4Rcg+Pp/LYqaRT7CKmngjyiocpVFdAjf5CZAA7cw=;
        b=Ix56ncgMAU8GhrywISUUKAnNg28IMBk7hACHSRfbO162aRPi1cAzWoGDeewiG4BYx2
         Tl63jW3P7lc1B7s1p7/bpxFjmU/0AWq/rJTdW6x9nmXYR7wXF2sfZX1cIxX8TsCUHHC0
         3jnLq0rcI975YCGZmLx8blaxcAn3Kb4ID+zIMXRHXqWPvNaXy52+h+uIEEiqSRdZGtwj
         /rKSrgqknhPaGUbXHOYa4QQOLasxekZETxd7FawmFyIdcBXInPa+yKSds5YsYrZHfwtY
         W8sen8lNHCoA/hfcwdHc1GujhLnbMRfo+DRoMY4ImZ+bmjf4TC/Vj5HzoIkT4rtWJ5eM
         8HHA==
X-Gm-Message-State: AOJu0YzoKq/hJaQZBPRb2c2va4CL3k6f2L0Tx6AbJZ7I8jYwnlibyF9w
	DdCC9dDOdUh28tgsHD6uy82zWLSfXAGTKIXb9rHh3pltbcQChwWPUnXl7LmUZXemKyadJBx4O3v
	ncsSeabbfxoRxnDg5D8w3r6KFP5Sj6d86pra1dkgNva4oF+//19/G1YbCUzM9CwaI/bYiV1Keoc
	94
X-Gm-Gg: AR+sD125r3CjmZgi+BWioeBrZtPhLsXXZ0RKLrQXXT7uGRrxLldJE5r/NUMVfvwLEDi
	cUyzzJKg4d/V76ZHXJ9SLfejJBnLb3IxzK/uddQKs5on1AsGpg+UOVJXpDdbV4jwdS0FqpyZjC4
	bDfaEzvwJFIAlcPnHcEgKu+uDW3iF5qtgKdO0KrzhAm4pItIHNUjYyFiv0PmBWaQRKSBKz1DsWL
	AlTSL6d2op+Enurid2n9ny7T9r5ErvqmES6+VUgkdg0B8zApD56WGDYfI7Vq3OALDdpCQ7z+cRB
	hLuh2PVQh+i0af+ZBTzVOQBj6NW3CGAElMwsx+Shc/LBO12XMWC24b+0JD4V2vh6YfzEjNi0Oge
	aWoYd1kjB0WsB5N0nZ4amrPCkMzLhm3frwwvCJI4h637PFeoN6W1tzWYBtbBW5Uk0btpw7gS3ly
	lSrvH1VKtTqiMhe+Yp0RoSuS+sORXlKRBwFLk+yKzJNraK
X-Received: by 2002:a05:690c:4a05:b0:809:9422:8c47 with SMTP id 00721157ae682-82576533cf6mr89277837b3.22.1786310965841;
        Sun, 09 Aug 2026 14:29:25 -0700 (PDT)
X-Received: by 2002:a05:690c:4a05:b0:809:9422:8c47 with SMTP id 00721157ae682-82576533cf6mr89277547b3.22.1786310965444;
        Sun, 09 Aug 2026 14:29:25 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:24 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v3 0/3] X2 Elite HP EliteBook X G2q support
Date: Sun, 09 Aug 2026 14:29:20 -0700
Message-Id: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDxeGoC/22Py26DMBBFfwV53YnG5hVQVPU/qi6MGQdXwSQ2o
 KCIf68xrdSo3Yx0R+NzfB/MkzPkWZ08mKPZeDPYENKXhKlO2jOBaUNmAkWBBa/gfFn6yYEn2wL
 nadGKLJVcIAsvro60uUfa+8ee/dR8kho3xPeFo9sUNON+xnryXkZNnZyipRT8x3LtFlCD1TBz4
 FCqY4VVnguV09vg/eE2yYsa+v4QxuuGb6Qn2DZmrBNL9xEi8Ygl2/7TGT8ObollZx71ey+BT72
 CDUGrTAqlW46l+mOLuFn8RuTPCBEQiBXmqci0bvQ/iHVdvwDMk52/gAEAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX69dBCzYL3zJW
 atmWg6coqahnMriu2SJ4ESrAobfu6wYoJd5ca8ZLLbQ6C6fOezTzYvkSBk5Wu2x1rLmyI3N6L71
 tZHbFWmcExsIhFWoax88TSZJewq8Efg=
X-Proofpoint-ORIG-GUID: YD7g0-_3hesGduGZly1mJOw7qPZEsBQm
X-Proofpoint-GUID: YD7g0-_3hesGduGZly1mJOw7qPZEsBQm
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a78f136 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e0PlQuoavrcFzCkabjgA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfXyVF4fKZzqM2I
 NyRyjeUWJTjCoK3n+yVplAmQjO8XT/Gex/XqFbsjVq3Qzz0cJgLvQTj+A0WfSElrtpqgJ4yySIt
 PL/oNJXGIfy9yxmv1JF2EM5gNlPJfmWTVel78HB1WHoPGuTLfIlci+AGyeP9YRD8pvHp2iCwetU
 aTVnC/QMLZAH/02azGRSLo8z72EmJoBa9UUhpzr3cJ+MW0lmAXugAukejIw1PeQjC74g59vOYSr
 qGWJlX+/4t77y6E56vHfQ1U5wm8ba5FXcHaXvxsSdTMTCFYC7WxbUzUI0qXAGGBL4fe22+mpDO0
 IImxOM6VEpkM+h8YFDVvQD1hh+jr+AunI02B/fymt9vgh9LEhMeg/wW/JLNT8iQwI/MRDA28WLF
 SmLqt9vTN60wVul7DoigjgXrGnGALEv22XFIERFJbYz4A958vZvqDkl2Bhtn5WuZn4MsbbpURVc
 PL/1KYawbsCPz6X/SSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

The audio, GPU and SoCCP series this board previously depended on have
since merged. The one remaining dependency is the Glymur combo-PHY
configuration patch (prerequisite message-id below). Until it lands, the
board patch trips the expected "Label or path ... not found" dtc error on
the DP PHY node.

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v3:
- Rebased onto next-20260807; the audio, GPU and SoCCP prerequisites have
  merged, leaving only the combo-PHY configuration patch.
- Added the TCSR reference-generator supplies (vdda-qref*/vdda-refgen*) and
  the vreg_l1f_e1_0p88 LDO they reference.
- Set dr_mode = "host" on usb_hs; glymur.dtsi dropped it from that node.
- Reworded the usb_2 and smb2370_l override comments.
- Link to v2: https://patch.msgid.link/20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com

Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1039 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1042 insertions(+)
---
base-commit: 115cd2ef86146afa47f363fedf97890575abcca4
change-id: 20260619-glymur-send-1136d243a120
prerequisite-message-id: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
prerequisite-patch-id: eb10b682f1419fa6bbb45943afca62a8250cb68b

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

