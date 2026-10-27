Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793066153;
	b=bcs4Us7XJnMeD9yyvTzT6VDl5r9KKIm1T4XX9KUSYr+e7CufPcM77a8643xGi304V79i
	 QcSA0evkffhOwtawBjoZ5CrqZ6Fc0P3eV81XTsZv47c+ta3ZJzLLQ9fmVy6ub4+1A8IjG
	 OzSbSAWX5mnEZHC07+jkI7Ynk07SOZs27ReGLVlnJBGn8KGqwKW2SmVt1S0Q6AJO+MHnW
	 A3NJiJfiUwrYG3kplr64THfR0CgicwKi0SanLsPPozncFC1aq23FgiZLbVQtYqGIjUMyb
	 2jqduhYEvPFAPBkFIcJ79E6xnocX6Z9Y+teIuOCrOhpAmv1NwlSjcVsP2ED9V37kwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793066153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
	b=Q3qdbPX2nuW2AhNCiPtS8yKCc/HZEqL9M6IxNZPMKrVpetSHebaxKfA/UyhP0YV0bpOW
	 9toXuX/EJpNuVdkoVjSP76PWAQCK7P35mIcKAsXex49EF/TTNq4EMZMMm0udmQktIVKD2
	 PlGKsd6T52WFegSIeTTXEdg6kFQ/ATSSJU24uVE77McwWVJtRGLut/YIncYwElfzUskpz
	 Bdx+lAj63Go5cHHIhlMvdS7GCGc/C7MijWOnbhBrJE8N+pde6MOzl9UuANZiGEI5Wo2Xe
	 bhzYiRjhFNAPaSlgqEbcG1jNV91sX+bkpOXoi4vidWaZ1zxqbPcvTPZ9/wgmhuWVDAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhAuELVj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H85I+goA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC70E606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC70E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhAuELVj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H85I+goA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R0G8RX1672269
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7
	ZNIXUHgA=; b=LhAuELVjKnhasKoO/qkllfXtOesRveW5Yp3ido/P4vVOOwrgm2h
	oamqO93pnWLgsAUBkFL5EtoKpgF60k/k+ON4IALTCDFxAbeZwGjQgy0TqijihDN1
	uk571MLu4lWSYwDcujo0KRYnRwA6s6sbrsCuG+nLfmILIfEhv8ym9wmTFNsoHKmh
	V+r6SHeCleMgNiIapOBBgfb2pezzWWr2xEN1+5Vvu5qTdZjSyLhu8uU5FVerlvkB
	iR7KrsZ7i+qkI13bm/mMIFAWoYQFmx97Mb6Hbwh26ELdSgDRWyoqYC9vRN4lx2xq
	VqKwk/VvIW7nd4UOdZNLq1Jl+TMp853JXPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91884p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:55:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so5826329eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793066151; x=1793670951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
        b=H85I+goAWA4ZTFBQC0Hpg87UlefGyXaW6pc2yKVVWb38WPrcpTjgnv04lb1s79XwgZ
         BPzmiOnNHlKrk/+MMnOm2gBS79YFm1i02Fgu2g8a5SPl0cIEfgsaSblnGU/VjE6abzNd
         T0Fu+x8H0c03BIx12mWcBrb2VQ5L2boAsajEE68M2f5+FgPw5+SUQLUjp6Yzqz16wG7Y
         FSItW+dm+AO+aZ3f4pkKcOl/3pkawBaM/1vGpN4BRJijJrabpHkQUKR5J1w7DcQuvA0G
         42cYkyf2PaNf1kQCMjbnk3lR5edK1qm2vr0/96drYuxCLOcmzr/7LozUUyUmSsw4O+T1
         wesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793066151; x=1793670951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVOw01N8f93qaNHdsyiTHTU8YU7N7ALu4F7ZNIXUHgA=;
        b=ansAMjiE8ARBFMnMozhL+ghQToK6RaQUAWoOplcdtlSrRPo6JonLwCJazHXPj2PB71
         Sm7Go75koYZIvESg7X6wRNNe0HbeqEfVu2RIe4TCQLjE0+OkettmCAhrTcThYak754sI
         96rhgYdbMBTBCQJx829jIxb16qruf+eecWHnQ6uUnlkpsiiOlJbgxNONC0whJtLRO/2w
         XhdpDKL0o/dsgkg7P9/ezzScm1XjDDs1dQhOIj7JCvaprImvhuXlcBCIrHiiXwoytE0F
         iUhMeGckEDxHl5LobZzFMJDWjmARAuUcnXr6kJmKUiXay/HmQY6+sJfungiCmZNH0HIK
         SGPA==
X-Forwarded-Encrypted: i=1; AKwUvBw7JPyji89sFGAYq7O+XnUcgsOh4ap9hfjNWYmQPi64/j9d0C4Rgqxw0T6IDE6Jlp/j3NlHbOskGYrVsKLg@vger.kernel.org
X-Gm-Message-State: AFq9FYL1t7A1oxrcsC+K7BJsuTlc24lFyW2dN8FXERLksXasCfnyv6bG
	41G6lBsmTOCjUUOtuCAbX6y9Fj/nuuXxHxWqpCayMaSyfsZobJdKKRURoTQQ2TbReavwKLi8Pbu
	O5en9qq6L9VYL+L6PY45NtXEgDE3kZkrbemKSkOgxKdT2I9FsPKS///gm93LzZ1BgeftA
X-Gm-Gg: AYBFou2+x63GkgJ9RRWBwJBGK4nyahU0f3s0sK68idEUMYC8WX6v1FkxPSQLT0MbwY2
	wZVPlC9zV6WgAzT/QW816Ulkfg+0MqS/mpaD4uhh28ZzAUyIMFOe5qnH1k9n0udWwXxRti0FmeB
	LEHnbYrCIGuhXdnoTroeOQViMPSzO7nRXKEAQd9jccqAFzgwVqLlc8pEYV2ipgde+gaHOvJswA0
	ztZNDywtqI2WRH3pcyv2x3gHHz/JOjycSc+pMiKITQ1ybUgSUR4GNq0u1eccbc1JPUObN+8vn2s
	5di9C98Nr/uaN+1s9kHX7LVRQB+joZ6OJ7B2TORi/EkkmswehKFMv3s32Ccu3Cj3gX9eGy9GLPo
	MlhYUajPYx5bXUGQ9EJxfoARgVH0JTxkgeopVN0RL5Yj7WL4m
X-Received: by 2002:a05:7301:1a01:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-369e834e226mr13349433eec.3.1793066151121;
        Mon, 26 Oct 2026 18:55:51 -0700 (PDT)
X-Received: by 2002:a05:7301:1a01:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-369e834e226mr13349386eec.3.1793066150420;
        Mon, 26 Oct 2026 18:55:50 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm33542534eec.13.2026.10.26.18.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:55:49 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Mon, 26 Oct 2026 18:55:45 -0700
Message-ID: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JYceDztOa2EAX-IiNE_78sKO07QwN8Vs
X-Proofpoint-GUID: JYceDztOa2EAX-IiNE_78sKO07QwN8Vs
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae004a7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fkmqLtjFOitS6APqvyEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwNyBTYWx0ZWRfX3F754NpoFqK0
 sdsgcSFwXSRyv5weJyG72wXj2bl0/mDrnF7FfeMI+G7rVFbWlnaRPaJ2EgLhXVcLZWe0s895yiO
 Rv2Avo0UAGgQw8ASKynyELx3AY/mLqXxZrx34D3i6pZvhCyhf1p20Xy+pZJC9Qp1AbS8B/IMUGb
 HgMWb8W02wRIZ0/GarcgRzwGiEw8w+8VvAnkvJmZO3d9dtzV3t7ygcwBcwA9kr0nje/IZ9PYZv5
 yrY2GsjFjKP4tQvKUDF7Ex3fg9b4Xt9cJ0d33r9xTOAwv3zMl+a2gYbjNQ+7Z/K5bLx57tMhw+3
 y68hwn9nBxjswUwsejbw72JPnK2wprX89ljVPhryukudnJN85wcBeXSq953XRFDRmyJhUKvbaSW
 Zhay9/2UtF8vj1JClO2PVE72SGWs+Rr59tSW53yfws1g2qzf8C7VD4MOu86gLAGY8qHlfM0jw8A
 1fUXXOVk7NPGd9ThznA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwNyBTYWx0ZWRfX9OzcKySI6UeY
 xEQTptgNXZ9ykOeyuUBZWYgKL58T6tvERhy6X4JfkKQL7o1FE5VpcW6/WetR2LE+YJQSFBRxspG
 k4U7c5bnAlAgl4qCtOZ4uyTIdxmjXco=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270007

From: Elson Serrao <elson.serrao@oss.qualcomm.com>

This patch introduces support for the XCFGI_159_152 register to enable a
hardware-based SE0 recovery mechanism in the M31 PHY when operating in
host mode.

During PHY initialization, spurious pulses from external devices can
interfere with speed negotiation, potentially leading to abnormal
behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
controlled by bit 159 of the XCFGI register.

When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
before entering L0 mode, the PHY interprets this as bus inactivity and
resets the state machine to its default state. After transitioning to
L0, the PHY resumes normal operation in accordance with the eUSB
specification.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
Changes for v2:
- Add Fixes and Reviewed-by tags
- Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/

 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..8d954e772585 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_159_152		(0x1a8)
+#define SE0_TIMEOUT_EN			BIT(7)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 };
 
 static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	/*
+	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
+	 * This enables a counter which will assume bus inactive if
+	 * SE0 is more than 2.5ms and reset the state machine to default
+	 * state.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
-- 
2.43.0

