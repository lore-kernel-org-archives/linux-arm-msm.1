Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947883;
	b=gvhj4xGB2WZeONVeGnaBrQ4FGXy9T1gOvJkAbgdnhXGn3iGIKmzhbC+meaeUBS4tC6Ry
	 5Hl4AU6B8HyKsoRk8VOWjvpcO+GV82vGB15GaSfCkYoxMHvf0sQXdkB8URdQu00H1k1Wo
	 td3+L819DaealusCroekdxyuhPvV/H/4Hq9KiHGLFdnlO13ZBnOcS8T3hWP61EOKVhTUF
	 tWa/PazO1y5kiAOn2wT16KBjMyxQB00IP9QVeYUranhV0tY8d49nhNehJviUoFQZ+NF9S
	 dWKLx0PUCb1i+isxmisQAoTcU/rFLAchGFMKRQILGuaDdguRrJlwkIVVt5FOJfUvofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+XmRBF1G2nV6HTh370XPOgC5agas252AFp1kdywR08s=;
	b=NBvbHFs3ekoS6BKjQHjTYpF92HcLqbC+Bi658SztJmY2nFqgqYPVtinZQVLBin/9LVvb
	 iBM92eM0FYZHWUJ1uZ/YwqWxJO2bQgx805bKP/rH7LG9rtR9Y0QSBwG7jnUkIrjTuxNi5
	 BQhs23Ccp6gdtYec6OpHTDopprAqTjm2409FERUkZNA4Iesq722atXMxgPDLyCk0urV45
	 KR8+xwXgpFMOt1SOyvzjEqIVQaJ1z6F1qePLrBgcsF0v1rvDPCKwgGaa2Csgj6V5AFy27
	 XkmB13uQvBfy85WFabDNdz1Zcl7dF8W8E4nPdxAkpQgFpIm1O9QL/tYxVmuk946WWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US+3IwNM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZIano9+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93E606A330
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 06:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E93E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US+3IwNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZIano9+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6402l43856835
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 06:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XmRBF1G2nV6HTh370XPOgC5agas252AFp1kdywR08s=; b=US+3IwNMi0Ozhtgf
	TmJAdevSITF4sODFfk3SHQexCDhQ5/STvkSDZKSYb1WG89jTLu+TiB6mZjZkotrG
	P8w59UhjZ8VMWuVdXcq63sEdgRhAwPgWh6izM2pXSF5wIyA5QNEoBp4FqUxmPdWs
	RHs7r7YlMTeSPGuQ+E2U7s5VOmd0iu2YYY9d1hCkooIcwjieoe79U/aDXaukhLn0
	9n7npvUzOHEzpB890bCL7ybbz07Q2tZ8AqKD82jAkhQvooJMRs3vtpoZ1yw15FrH
	8H5NEGMTfzoc2Qim6ZhoesB+pt0S1/Fsab4Nk55hj0MO+3C0yvUp3kxBDPuihFn8
	8/JVUQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9seyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:51:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso381315a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947882; x=1794552682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XmRBF1G2nV6HTh370XPOgC5agas252AFp1kdywR08s=;
        b=gZIano9+x1Puf7paXqJaQUYLjsJ7JQ2MEnKMJGf3zYgQip6cVvMiGs6COhaym0Op3R
         To2z1eNuH0kogarUExH3XkmyG7FM8pYRnWBuGlqiPbkOAo1ED73sla2/L1qNDFqb0M1C
         mK9AZOwMIHc8Lkea+zjRMi/pevp1O8fMucvy4mUkQ3biVZ6nGFrQq3dSHfbEZ/Ref2OH
         HE6M/q19eNdYu5na8IZW7g9MDi/mLvOZngoKFreQuRXNdfQcFzOe+xZgup4cLuX/tS+j
         aQ+ugebftAIUzQTDhYmqy7gV/p8aPWBdQJeK4DuJRnHwD8/7pwmnQJQqHCej4eS21F8J
         jF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947882; x=1794552682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XmRBF1G2nV6HTh370XPOgC5agas252AFp1kdywR08s=;
        b=cIhswZJwzBMwU1/02JJbp0guW6TnPd6oeGU0kC4DAH3mzM8XLe37utQbwstxF3ncGb
         +WbOZl4j58L7xx87mWwlyaFQU/nOvdBcPc+Sih0zKaP0xdKwWxy8oVmWLMCt/o3wkykT
         y3amzzvg55rjJm6Hhq+f5z7/3MYdKmuiyW5L6Ad1SLwlbxH13qm1Kr5rG7FojXYizc6Z
         gK2TGZJigNXd5SIuqjnqY2r0zZLbrYNuDBFU7zT/z3tx2xC4rHnFJZ55aqK/kwggryTH
         IsMyA21Fk1aAGOWGuGNV/IJnfl6i2+xfAvWhEDk9/K/6PQYPMmnqNw4KE+9JD35x0Q1X
         mzbA==
X-Forwarded-Encrypted: i=1; AL+hErFrfu1831OovIZLAqA2GfOAruHd8xfHjcBfAtL11BPbrPinDoCpwHTKitExFUnId2P2+egp+zWZvXIy61JS@vger.kernel.org
X-Gm-Message-State: APuU4Z8uBuXKSS9iwe6epQgvSzMNEAt7jJjOuvemENcNm9TIku0aH9R+
	hC6/xrIw6NF4n/qw4/JUIefy3SYueV25+LxjUHHcrcNeWOrPAVtxGZpC2Ee2eCxk3WYtpebL9Iy
	vRIPSvI9yaV6QitFC0oTO+FWCVsSEc8l7zu4HWVWlrRY3ZOZed48N+m/Oj/26lkzPEpme
X-Gm-Gg: AYBFou2HujBF7u3ukxqpuVlFxeyFtgijkN1GDbdKZQNwYo8XAycvApXvx7w8gJ/W6hG
	4H0miRoddHng92mx1sru1hSyGOzTsadPcjwP260wnm+c08Ht5/7vJMlEtqnveJ6Z/DkFVf4WcF7
	ssejM7CHEWPOHWAgd1MwE3UyPUQy0dSHS26q8eNzsE0FtuefV5iJ39bdB0mHVhiv8LJuPU14DeF
	yc9ImNwdB6X5LeDvuv/a0Z0irtMiWWsLxTV6RZxpJE0vyadRKmD3Tt1gCAiKGyFaS9kaS2eyS6d
	a0FRDFHwJ7oyjBf9HnqmicR0MnwyTLsa9ew2AJFs/kAczNAVCo5a7Dox3gC9BInP/gTx+4yE5V3
	vGGhi1R/Bq/Et7gF6f8WtCDM+Q7cnNpcHrWsDT8eNakc+oyae10Nsictu+5iQ6rcoDn6cE+Ayg6
	i8gOfF
X-Received: by 2002:a17:90b:3f8c:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b0db702a89mr1418113a91.44.1793947881301;
        Thu, 05 Nov 2026 22:51:21 -0800 (PST)
X-Received: by 2002:a17:90b:3f8c:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b0db702a89mr1418089a91.44.1793947880782;
        Thu, 05 Nov 2026 22:51:20 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:51:20 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:45 +0530
Subject: [PATCH v4 4/6] phy: qcom-mipi-csi2: Add Hawi support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-hawi-maili-camss-v4-4-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=12271;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=OBybeqxYn1Kxj38jzsZk9P3UviYy072AOQeaH4rT5Nc=;
 b=N3UlMC16MQt2sPyheEIvYxy4cQyEhOFjf7G2RWGfz4v1xmM9trTt7cZGj4oGoDQTJ6IhF779i
 YDYGXQCdG6dBlRl4GmQ2ZWR6oLjp7xXwHzdegOkIqYuk81r8YkWuiN3
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXxNqwEwjfyXaK
 m3rh7KAheUr3G0CkRfvMy0AVfLbu4NR9sA+xzsXAnHNjm+SrWKhwh03lUwBamS8ErZBwRECGeAv
 9tPQN+8OrltSjfD/G8mep7okBVnX0b4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX3hFptCVBPZlL
 5qFK0ijYHX+ARXrQADw6AzdsB8waqPeL7K46rnctZFImokl9wK2lZK1VdLkIXeGbJEmNF31OaEX
 j1rgZmn9Uq9DPof4pV5lyI9v9DK2ggHxBZ/4fMPkDE8bhFh+Bwburxd4F9sAz3aRIOic+poIXi8
 /W99D2XJxzN7BGKPUKunopfA8uTccJ6o2RsTOgEOJ+i+uO7Max3n6UEbu+o07w5h5nZI1APJjoS
 iCnr/m41pFV0DQk21f+LPjHSM4n+AWuKpiLA+KIpCaVnq1k44dRzp+iCS4SsHx6avPOpJqs+lew
 rmmXupq8dD6YPpi+sAbrz2OlRk9Ot/2r3zDx9oY6J403R0hobIvlY8uVjLt2umH3yPNT9QOEdbg
 SQK3I35lDFU9j/u86ofhzXwMJ5DnlhpjLFxgL70CEkhDogM8VmVmPTIdUm2dyitsOnrSY/9D0Kl
 65VHZ5eN/D+wQGw3Waw==
X-Proofpoint-ORIG-GUID: di0LBroxtTPeIblIxD2lGlhR8h9Wuf4p
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed78ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6ymyJ60z4rMmK2kQ-iQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: di0LBroxtTPeIblIxD2lGlhR8h9Wuf4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Hawi 2nm CSI-2 D-PHY.

Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
stream stalls and SMMU faults.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
 	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
 };
 
+/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
+static const struct mipi_csi2phy_lane_regs lane_regs_hawi[] = {
+	/* Power up lanes in 2ph mode. */
+	{ .reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x00a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0000, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0060, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0e94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ea0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e0c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e38, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0e10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x04a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0400, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0460, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x08a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0800, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0838, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x082c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0834, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x081c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x083c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0804, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x085c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0860, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0864, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0c94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ca0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c00, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c38, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0c10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c5c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c60, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+};
+
 static inline const struct mipi_csi2phy_device_regs *
 csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
 {
@@ -374,6 +494,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_hawi,
+		.lane_array_size = ARRAY_SIZE(lane_regs_hawi),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 941f8b920b1d632edfc4c35d1f9e22bdc1811d18..54e3135cec5c3b534aa081d790ffae480a6675d4 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,hawi-csi2-phy", .data = &mipi_csi2_dphy_2nm_hawi },
 	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 832c8d048b77f6c821180244220904815be756d5..01636df3c07dda9ca9c7e37c0bfd892bbb6a1304 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 

-- 
2.34.1

