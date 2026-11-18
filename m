Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012455;
	b=zNUZBExRWu99THVEaSUokR+5WxehZRXodK9WzueYZsfWwFaFUeOqUEkQ2m0Q1XXgehim
	 kpvbKWolcG2SBNGIpdZRV5XV05q83d8xZ86R2X/00ywr79Cb7NwXgV7D3uCzWop/yNBm5
	 j25xLeY87Ztf8HtJKvpcwwYT/xOoQY5qgaM3cFsyHuInW5fGKPbRhMKiqW8HfWVX9VKNJ
	 ftYOjmm5xE5x1s9lGJOMcGIpzC5jNBH6YYp6q/MReSrduwx2mlZp2Lt5patud6Dz1d+BQ
	 z+jNKIL7IWZ4xG4Na6sktJ0FZrl80TaGNMWZGb1KnUzqJS1lrubNk7lbXQCR3H/ahrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
	b=IHK31cln9loKyBDSm7OI0fDsbcMNCj4rooDui//Of/SGLsvDrKoDBQQFSHXtoK6706Y4
	 pO+wwnJw71DtDGCCEsWrCZ54J9d5A+jllEd4zRwRbS2KE6Xmze+hZsJnK9s70Pk6H+zAM
	 jhtEBcMlo6nGCC08ImP5LGydkTZEhhKowAf8NPWAj/5uwnojzS2VGAIhP1bWJsJ8egtmo
	 QeszSuF/AKtERSS9mmp/b/OIyLhISSJDc2EX+FSgE6EJTHO/QYQnVFpwJlGDj8YrpeOfE
	 Jx+PxBKFKM5UZ2YlTTA1ajCo41BxGFVDZzMZqRNSt9+uwWR6ZO1zSJL36aUFxHN0+Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPUPpxr3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUvxuxd1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F4606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPUPpxr3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUvxuxd1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIE4jZ33648498
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI
	3P8bc7KM=; b=WPUPpxr3uQL+rRWpzEY7sSkIS710GUkyTcc8ApwZZ639QTSYTck
	ErtIYqdtzVAahItynOuZD+UwokgG/nQUldGvvA0tRJTi8Efleyt3a9PRdEHDJY76
	tTkSabUHUtcKrhi8KyF2jyP/qBDQ+PW9vNSaRReBFz8ST3aqTb83kJmxvHcJqNiO
	r/4eh0uaA+RQIcq//7mDeumIBdhwk24rLg9ymuCG1oqVBTyCn3VdFYb1ooPw9gZF
	IrgF6piCE1rCpcLEPCrQ3vZbc8IFmw1DYJO8AZ/PNMjdRalZ0LhSqIAWrT4Hx5v+
	nEdasrlzWs6Q/Pt152SRwLKV2O+6fZOt30w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcr4ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:34:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so11014755ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795012453; x=1795617253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
        b=fUvxuxd1eWme5/TavmVlNpqp1AaKL8rtZRysGzGusf1QbsVvjDBUwqNoeQRl/fSmPn
         HFJSGt2i+fuCvsUo5TRE9moGZZfBP/mx8WibFP4WB4Z0qD1esbCUv7htVM83h4+fykCY
         Rqu8FTON4tazROpjpNLWzqY/vi5AvYhUo++8rVyDQYTUoekCwoFxWkZXWNHGAvlDtVyc
         /WZPmcOobLJINN95UQDSvdVOl27V/WaJtAObr5vzPzKG7CxM6hlIkQjXt0xnDmcnXBr9
         JlZN7rMlZ2ZeBh3LCUNCJlX89lRlwLMluQKURUQZ2Bbm9CNl4W4Plam1Hiiub6y1EUzH
         czUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012453; x=1795617253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
        b=KHd8IMDzx2LkWXtyQO43FZgAr8fjjQDlkXGhKNr64OIBDjHJbZgf6dcRnEIepfmio8
         ht7dg3SRZoGgKZx+aHbyCc8ZMPl8IYz7aTwTdY/H1neF6l1p6Syz30FvinT0gsCiAd4Q
         Xp1+aMe3Upk/xBUa6JqtXsxcuvqUW7wQ5hEGfphQcLe86UUh64KcxSjnPD4ZQDO9Letf
         p90ty0hJi6xzpooofC6bQPESpl/uwEetfLVH+//+iRKUYvZ8Zo72YEH0aR0IYJNFxefm
         Gnv11zFCZydCq5Zh5wy630AZdvqBmvtIb3DCaqAkHGVw0miEe7GUKoDYYwFckm67xIci
         3YFg==
X-Forwarded-Encrypted: i=1; AL+hErHhkc4KGQUtCQSpxke3Z8GVlh47nvPlkp5OV6Pfy9aMih1hZJ5aBnpwTyvF+ciTDO4NUXSbW2HaVyLRCZY1@vger.kernel.org
X-Gm-Message-State: APuU4Z+0//bCgwRSL+gXR7nGX3R22ZC81PfErcfHs8vpodikQPBwdlk/
	b7MU0ZIjGaubFPjaCW2tl6La4lmRLEFSEv3g01Htw/rgNScZJ323swWfsJvRUIBRX06UlMBxFrh
	temcDJcxylEJLw+wzh0uZ4Ew2P+MzmsJzOKvilzl1hVqnVJH60XvnYkfXCxgP4VYT/R+f
X-Gm-Gg: AZFdTZfYjZRwM47bzImeQo9N84pwxPD2TXI3iXk+mrq2Q+VZKzuguL6+NHL5EvIUEng
	mfI5QYUH7t4moLK7m9kdR1J2odCGsUWD1Z2lZdzme6fHNlxiuLti4rPXC3a4ZpoBQagxbhtRXXm
	OfYUZ10f1yosSUSATI+2i/sSq4Ku5P3P73orS/ynLM5/QtC6O5kPCnzBHnroL4vn3E2aX43RTKq
	CCTiJYjqBeaxgxKF2KjrFN1BltOTyf1rFXG3+LjQXrshVblY1A+ZERFNxB15vYO7fzMVm0/QAlL
	tyvl/WQi0CSqGlk4C7oIGAZ/wP3rRZlZHRuhF/Tr5o9jTRUAmPEyuXjmiCLSj427RGva8bw76jC
	DKkxkwysAYGjTheajNKBicRLatucAKv7Z9MNifcpEG5X79WnQ6LOjO5tBinWfiKqyGIo59emFHj
	h9Dw==
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr28398735ad.1.1795012452791;
        Wed, 18 Nov 2026 06:34:12 -0800 (PST)
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr28398475ad.1.1795012452346;
        Wed, 18 Nov 2026 06:34:12 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed0d2esm15326095ad.10.2026.11.18.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:34:11 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: m31-eusb2: Add register XCFGI_199_192 for HS disconnect mask
Date: Wed, 18 Nov 2026 20:04:05 +0530
Message-ID: <20261118143406.2351999-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dgbhw1SYNajIv8QopiHqnP4utnFiSLhc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX6yYTU9QEXGe0
 GLrOthFxXfhdKi5f4lrALpL5pec7lOOl67HPUn50XzZ0G7YOg7PcCVwxBMJno7i0k1cP9CEnCU2
 eRwrvzJfsSSLt484YqlCl+ft7t4Vans=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdb766 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LxLwC_4Rt_vGV6uIXdcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dgbhw1SYNajIv8QopiHqnP4utnFiSLhc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX1UsGVZ2UF1eh
 AKfPQzGDFpZUuawSS79wNjFMqjsQ0s86fyWups3V8V+VrHKzaEO+5uOjkvuUVsIZsa5ap0PmSuh
 4hgt8JZJnGJA18TpASx8RppE3ACJZKBvts3JtCaGfHcO4MlB+qZTIjU5sJEz8y70iKQNInx0cgi
 SLXrgQKno37tqA3g70jJymnKGWerej1zOyTc1e+DQv2qkq7R+QRkmaZtgXQky2FdsCwOQ1vzMPB
 ZUt6u+a+s5Pj/zszW+7BU6mxzC8Fk70OUxW4hwwc4oZ3Pru1DsVuCILsAx07oKG1r7zya6lVauH
 CWNrAUytqUTWu/UCgrKo34RVFHrdCUDYf9/7I6AG/C+mCEtymV9KSnu1JTJ2tDzmDhksoE1LCq6
 yAlmtTE0BuKu7bGrYlPYlGPgHeVjoDlZVNAdbFW8I3L3W/VzyNvehdXYIcXgMsQw2wGlZEYKXMv
 3a0R3HOKPKawxq2weOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180057

In USB 2.0 High-Speed, a device disconnect is detected by the host PHY's
analog HS disconnect envelope detector: it watches the differential line
amplitude and flags a disconnect when the amplitude exceeds a threshold
during the bus idle/EOP window (a disconnected cable reflects the host's
own drive back, roughly doubling the observed amplitude).

While the host itself is transmitting, the line is already driven hard,
and trace reflections / signal-integrity overshoot can momentarily push
the measured amplitude above that threshold even though the device is
still attached. With the detector honoured during TX, the M31 PHY latches
a spurious HS disconnect mid-transfer, showing up as false
disconnect/reconnect events, re-enumeration and transfer stalls under
host-TX-heavy load (e.g. bulk OUT to mass storage). The failure is
signal-integrity dependent, so it is intermittent and board/cable
specific.

Program the XCFGI_199_192 register to set XCFG_HS_DISCONNECT_EN_TX
(bit 196), which makes the PHY ignore the host disconnect status while in
TX mode; disconnect detection continues to work normally when the host is
not transmitting, which is when a real disconnect must be observed. This
register was not programmed previously, leaving the envelope detector
active during TX. Add this bit to the reset sequence to suppress the
spurious TX-time disconnects.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..4e7ea41720d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_199_192		(0x1bc)
+#define HS_DISCONNECT_EN_TX		BIT(4)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -100,6 +103,15 @@ static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, SLEEPM, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ_SEL, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0),
+	/*
+	 * Set XCFGI[196] to make M31 ignore the HS disconnect status
+	 * while the host is transmitting. This prevents trace reflections
+	 * and signal-integrity overshoot during TX from being latched as a
+	 * spurious HS disconnect. Disconnect detection stays active while
+	 * the host is not transmitting, which is when a real disconnect
+	 * must be observed.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_199_192, HS_DISCONNECT_EN_TX, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0),
-- 
2.43.0

