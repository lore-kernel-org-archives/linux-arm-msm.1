Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF9385D98
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424269; cv=none; b=kWhXDRkmaR07N7uoSv+TUTtbS1po+x0sGH7uLDsM92P33Ed8arJMzgNRxPZu0Ac6xE3ewvEGSYTsWxUbnASJHcsdQJ18bY2FQe5zzFzJcnWMEmdVXWAGdZAK4ABNAXVbkVNrqQeptotjAy9lq7rsYDkxPDZX2DhriO3SgV5MYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424269; c=relaxed/simple;
	bh=HwlQ2Ae/9Q3MrPiMkpLKAOXBnuOZJb2psTbO3xR13eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYEb9bx/fXNxXZUHsne/xZef6dxqZIBTTQZokGHgH9RyV0SuBTMQwUh5WZlwDRwu4bFAN9Iqb7nK5ZUzTRMopS9APHOoEhH9GEm+RNuRlUMxeIvKV/FyJim84w/5mgMA8yG8rTrYkKRMhdEpXjUPUnZnlZbHZHEwyg/P+tK/nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OB8xtZ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iikQP8hY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OB8xtZ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iikQP8hY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981i9Mb4187634
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 01:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1DBGEvXjym/
	vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=; b=OB8xtZ7YejfTzMOJh+sDy1+BK/y
	W3KwDIkbGLcvHhrW9kg3FYcTqLip59ZG8ZMBVyIk3+P+VfVuWa86fkh99H4vAUx/
	DVL4tqalcVbthzve5yVeDX4lK4URGrSY+KCRNuVRujosLJghs5RxPzoUrUSICb8g
	SaHDjOEKWhy7TCCS2LnW2Mvgnzse1L9vSGf3NMrsrcHMjIH17fYF1aF5VSdZY0Jr
	MruqiQgq4A7rqbwksmJIxzK4/1c0kaRf7/tjr7DIhXvh3GK2iEnrSWjgx5h8dv8Y
	F1pbLOhJyJswgw9EGLCExAg99NIADZxh9bjf3TS3pj6/fQkuaElwpNNtrgg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe30j65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:51:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so8804243eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424267; x=1792029067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=iikQP8hYT5OG+gwrO8/wLL3YyLZ8OtXW3YnLd9jGDN2MRUrhR4tZO/97rFDP767dc3
         6Sf20ERVZeCS6kDCb0QxlnnWKZ5e8T5buFofYlYn7Cg09FQ9pY7xT7Psell1caWHO5jo
         5P5NAgl41X3GHvph9sIowKIOeKnSZUeZy47bGivzjnAwSSW+xDjNMNOUyRM+9vx8bzIx
         fHR8kOurvEXc08Jgdjp5eVP5oHLfdgqWhN60Twmh+QkfYmnOvEnmlk0+ZM+I/b0MRWmA
         44gi+0wIPrds2NCi0QB7l1/+JTCuANsLrWPMFs7W9arFcmE2BOpCSCiQVITJqBfg/iwI
         vK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424267; x=1792029067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=bRcT4s3tclRCVdnDs52UN04L8P+89zHjjaFIh2azCfUHNaMpoCdcQOPmH6mB3W7+Fw
         zKNrhBpAon6dxFsyen+83f43vvFV9+ZkZfLFVT8d2D+rUco1Qe6PK6td7xsc5pNDL8fL
         7ysz/pthv7x1wS3/Za94tvUqisWgpZKgvNAtiXVivGxj0/CkFTHyUdKsE8UK75kn4jrE
         YZG3KEBdFkV5WB4LNZhg6kOSRp6KUMCVBIwr74EJn5nPur5FuOSjgQ/KhaVUuOSJCXdq
         C0+diTZLsqDM59VxGbp5uak8eBQbcQGx7kZoYB8cw/G4i1C3hpiEyg9xOnpUxhSOKitL
         Fxmg==
X-Forwarded-Encrypted: i=1; AKwUvBzY+aw2jLi8jOVMPaF5rdTHzJJDsColzslyZH+zIOVZn95kccRvm/9Xlw8m39iLIxr1O7oMN7n+hPW89XG1@vger.kernel.org
X-Gm-Message-State: AFq9FYIsVr/fJouSt6Uvzo9XMpxaGIU+dGqUr2sP8ZJbVAUE0QFEHv9Z
	QBG6a0KCPB56EBCegQpII6ePKetavXfEFNJjsLKUtk7XA1u/q1Lz88wtC7KwiMu/Y3udzPMBWNq
	CyQ7EngcdjKJEk4Yo4auO1pVDVh4nurVzNyvQ8/t74+4q14Kef6x6l4fKyiO3Q+XfuOKk
X-Gm-Gg: AYBFou37iJdQPzOWyab+T+XqhcIknPA/AUCN6TVAGURmEZkWP/5eUHysh0TPz9d2+Mh
	rAwN8x4FVoMCPAlH2HWgth5L8vE4+baqccKgq6XPMR1uG3TWxSqwIYJxiAQeRkCPHJ5Ktl2e99V
	qd2r6m7qi6UpUP+KkQ9nLriK2zo3g4WmmjeMbxxL/cnYmfKwZ+n1sF+NHsUZ8ALCcng+ZDKNpnM
	HeOSsCN+Yx95nzcFuADWRJx/f/2IuC1gaAl/hxmyodz47Nr9zWyxDUhUJq7/RM3d2WNkPyU0sq+
	8Ngkjtn0V2bbB1hFPbKU+oFSuYI/N3jLHtaD0KD7iasdtEQEQmQ7Uk+orL4aiTqF73xGnrq1wKV
	WQC3fzP4Eh5gal9/eEcE43GGUqtqISXmLaQlVH+H/ersmUlX9D+nabbyE4Uw=
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700852eec.22.1791424266642;
        Wed, 07 Oct 2026 18:51:06 -0700 (PDT)
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700816eec.22.1791424265898;
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
Date: Thu,  8 Oct 2026 09:50:17 +0800
Message-ID: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfXzj+VhhMZ1tRb
 1HR+s0WJCdCI9Pk9nuM5RFDId/en1vAjLT2N2GI+O8Rp34U7Ncr9CqSPa7gXEd5IhpxxrhhrN3k
 7zvFd+yFBopOq3AYYYCPTosCp6HHpxm+Br0bPWHbI0p8lpXKE0JOZVX6Zg0berV6mGPHeo1me4v
 8u5lylsFKZbufwCBz9omYSVzpmEZUdKxqGXTiypIf5ceRE5KVDzTalqcYH19hEh1JRvjWMpM+yC
 il5QB1A0m56lWOwLu+vT8jnE+j77m4/j8s5YPOddOdzDPzgs259ALnqjFRA0j22vmA4E0NtlLjt
 cSdxldaGx+K6Fpfz7u4APFeV3WqfdMwk0QjPuFP37WE/gIa1jjZM/hEuaA153aZJJRZXaMTPVfR
 knrNAL+7XESsKXQYX21vpR147QLZI+7bEGfK94prBicRejLbyy3lQ69R/UTCJyxK0pUU2wVqUJo
 b4UBOiz/kCq9dUVAF3Q==
X-Proofpoint-ORIG-GUID: tvPJLxVBH1TgBXdvGb098k9Gz23ZXnd0
X-Proofpoint-GUID: tvPJLxVBH1TgBXdvGb098k9Gz23ZXnd0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX4dNsfyRtC4Gb
 ToZdCDjHY7d4OwTjzya2rylK0bajNBr6oA5OGBbRVdZZNUQ9BQpct4V1fleRJt9NZFCop9azKeA
 /fwdoCkFdl2z8gNk3NNUWIrtGKdIoEw=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac6f70b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-9G34wqzeZZRMG-dpk0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
fallback, which only requests the "ref" clock, so the bridge clock is
never enabled by the PHY. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..8429599f428b 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -608,6 +618,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {
-- 
2.43.0

