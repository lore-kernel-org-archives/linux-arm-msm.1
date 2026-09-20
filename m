Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32464446BF8
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912768; cv=none; b=eZqeTuDNhOhTGKiB/qEWmc/x3kjuILW2Z9Jp6DDLkh4imUIfn/ugEfhJ7BDSTv2kw8f/Y3t28hN4Svr1Z/vO3FOaIbR6lC1Qkbfi7zOnsWjOrexSy6lpBogZdXlYgOSxTxDKAEWNDgF0IwMKiZVUBV4kTK36833bsJE3j+MA/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912768; c=relaxed/simple;
	bh=OvXsXZhyh0/V75JFh9+1ibNWyaPWqSxRuFIu0OMPcCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bfjfx8mnMloBSOBkRyhOkb1F6cbqgnfjfb5hj58srSqHC5b0BxdJM5KO9jvyuB+oGh7SCgHZ25yafLpGQjLwNpo6dJA+ZxKVRd+IKCTF0I0g5H2IEG7NuccZ6E5+IEjzn+jgOXzfsAkkHRp8tU11dh6oeq9xqoWk5s5K0/ke+NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGV94iwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcV6FTyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGV94iwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcV6FTyu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnkKU2421703
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=; b=QGV94iwo+m0cN4bL
	q/uqxjesHP7fpkwH2mGB5hdU2oDYA47rl1mGDx5MT9wfDbOjNBbbWOwTOC8BCRIC
	Jq1EurStiCGYFwEn/DSlWmA4SlOEvz4CSWhx5kG11MSJESyOgJ/0ctYmlo76rZAq
	KMJhdM/XBruw/Qh3K7MBfqlBsBXpkgBPL9/A3KazuffsEj+B5xcokT2NbD5GmQZ3
	enHAowOZ/CCeC3rfoYm3kzHfiRjxRnq1lt3ciAnekEhkl7+DnazQ+LvASWRHwt8E
	Xs65cHL9imKY+7XvFTBT/nr0jSePuMwSw4wjsT14prN1Ue5XqsSe7C2kxP/itiyH
	o5KUww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm332xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc0097865so64365131cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789912764; x=1790517564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=;
        b=KcV6FTyuP2bKvPdSr8vgsV9XAlaDTnvMaqeWO5dpP5UgqZiyjZ5gwbuQrIGkU/bMbQ
         tdgCcwTKf4r7lVRDwgLpRv83ovAXaCL+wuJoDIpRZNpm2VNnEddu0PZUVdT1b4J3mPUy
         8WNIUx7mbfSJ6oponn8PJva6ORDkQJe5yzo9l2nplsM4nNqXIkJAB731uuLzcHtj7umN
         2DKSWC5aZHY6R+sTYbCImixENtRoNajCJh2XhDvZ6+oTcwHScgIJ8rPuQ7ReCggsxL8Z
         bLTRlElpXDfksrbwDES0al4f0k4RvvqqtZkd0VzVgYI0SZtMlxtBbtj1NQVqJf2pA7kK
         ZRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912764; x=1790517564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT9+9SmHl3R1pvP+/NDecvgfBs1FIr4vjxEaFWXcIJE=;
        b=DVj4ysujGT2BhT3W9OB1ti6HelswXpQVrDizVLHMsArH6cZ9wgvi3qXGDKYnbA5kEM
         zT2fDv/GQ5YGc5jyIpgXjf1Qil6MMvEiNabXyQVuT0m2TbI38sp5uT9/IUT6PnDj6lAw
         MLMazC3Bz8LFixd1yRedajI8SthfvwpAX9XOLRAlWHdXmBPmYEYnw694IPKVvcbuPyjj
         UE7Qa5KFLXn3gcfwx6jc9t2EhTygFcI3ARrwxp2NeLhIdq9mkwoQICnwn2ddkrndnbaz
         ZVwtQ2dZYVBraf6ZyiG1tOui9anoPMH8H0RI9TBwFGPTD6WZeGtaRaduWJ/3xCA/j9T1
         uGMQ==
X-Gm-Message-State: AFuF++knvyActUuhz3p0+R8jYhBSc3kBuAmMxmrErn6CONwoGX1tN3Gg
	c5UXP2VWipDc2dqMYWlU5HB+iWesU9bOXuNcZtjDzrf8k/vOrYoCgUzKs8QwUieLKdpcXy2x/w4
	P46TgKcD6vfzTcy1biHsFjwT5JwiuCdKtGRp6Clq4ObPYgc3cV+Tm9722/323zGcdzapq
X-Gm-Gg: AYBFou3Zk3i8Kn0ZRSQQPhs22ijwXfDVXNetoIbGtCIzrgYS6f/QiJaVVM289GcwFCW
	HnGKhUIeZlI3UhfEsl8musK0RT3fKk96dJHjv12/YZeYIp64Arl9WUDTXcUrvhJ1IJ7ZoH54847
	0IrjK+qf44Vsa/+leG0Lvy5VMOiqO4OfMBrBWODlVigMjfJ4KS1BB9uoi5wpiTW40RPVkL6CYxi
	3bAheW1qx197REVjGorfY01FC7J9L5DbytKS8pSDfY6gGfRENQB9hGOoffLui6y54SOGNVb57wh
	h1EFZXMRGSizaDGtitQ1L2WmPNOKTtyDpORscvo13qIAAGhat7/jDlY9GxCh/crhII3eSD5y+9Q
	TnGqnTgWxDOqdDyOSynw/HoqH0sKWg+s/RV0+K7tbCBp4WHCpJgG96T3UL/Xouv1OzUn3rdqjci
	biUarbsnDK8Rk/
X-Received: by 2002:a05:622a:1e19:b0:530:e2cd:3826 with SMTP id d75a77b69052e-532b73a6116mr58891581cf.62.1789912763693;
        Sun, 20 Sep 2026 06:59:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:530:e2cd:3826 with SMTP id d75a77b69052e-532b73a6116mr58891231cf.62.1789912763288;
        Sun, 20 Sep 2026 06:59:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607678223sm13620541fa.39.2026.09.20.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:59:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 16:59:14 +0300
Subject: [PATCH v3 2/3] phy: qcom-qusb2: correst PHY description for
 IPQ6018
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-qusb2-v3-2-c273e75c9fb7@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OvXsXZhyh0/V75JFh9+1ibNWyaPWqSxRuFIu0OMPcCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+aySroGXCWsSjrOInlYIIc6Gv1IlHZGBWy4a
 qBy/cnYjWmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/msgAKCRCLPIo+Aiko
 1a19B/9Io+G3tt274CadXBHOXyHdfeVCXgmou32sL+P4eQ593Z9ggaA4RiL4qYli5SORXPibv7j
 LF5TEJuU2LdSZCcgkK7cw7jqZy9ZSd94Sn6EGB52bMhRctfQYvpjsTWCHJO3LOX0tuqseXxOHuK
 8PtxbT8e9Dvtr0XsHnS+kKcRIvEz686KkNNw0iip9w4dAgE+22vad3IRMRiWWceorE0gSyBUxBH
 zLqQkuAoDosXXsVZNyZYMczXS6s3W4217zTs2OilMkadQLGnCZDNaLpjnV911enKpHE4t7dQjBz
 Gqt1UyHrQ1MVhH2CbhwPBpUgUBJ//Ih61UtHun6Dz6f6s8w9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hQZazXDpa3PV_gmkGumpmUZ8Y-4PU2pX
X-Proofpoint-GUID: hQZazXDpa3PV_gmkGumpmUZ8Y-4PU2pX
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aafe6bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rLpG3bFX5iBGt7CpEVUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX1k2WNAsrpJgA
 DXpFbZmZ6HT7tTKGLsLiR+T+Z+PT0rVR5styUI6uS5GVPve+xc39UOG8J0HMxqmPKOoF9hsFLVV
 TzOSYRkYH75zifhUlyPEw/Fg2va9zvYgN/zpKLEz8CKdPVqJHD96whYdh7Cy5YOSzfKhEQgLYpN
 SlBFTNpJJwla9EMupGTHConxQWUOHOTjAV0yYsKTPeq8ROU6WcmUfkJiWQe65cQ4Es6Ha7Id9to
 xAOfv7UkL7UmF2BfDKfB+gIfPl1S9QOlXeeYo/gwTfootUdv+gBCWUcVuCpWJmTlXB/cDaWaSRm
 8zsgAVHsRBa77EQHwgTZIvO9OlNe9zeYOm4UD7MUmnLOMLBGGBn3tRfcUebCs3GSVF9UBVj5rwV
 MH7/29g3C/CB/FZ2RiivYdg2G/UXiz++fLatik7ugwGbn1Zsq5Ns2dPpNnUXBO7V7D6vtKMTmrT
 OAGSYdl1e6jkNcwrk4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX4atM/CXBZzrW
 9wiQFDMZPDZd2vgt/5W3SKHUK5zgGsa+XbFruIfhDQE95MAZcLDz2HYiGHdZuec87Qh21TtzUpC
 aCnP/zypKdBGDN5J/5VKaKxXmynbcx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200204

Qualcomm IPQ6018 doesn't need to reach power collapse or retention of
the USB voltage rails, so autoresume is not used on that platform.
Instead of programming a fake register bit (BIT(0) of TEST1, while the
QUSB2 platforms on that platform should use BIT(3) of TEST_CTRL),
explicitly disable autoresume programming on these devices via the flag
in the platform data.

Fixes: 2cfbe6765b7a ("phy: qcom-qusb2: add QUSB2 support for IPQ6018")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index fc516b7cf5fa..a1de05a83128 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -294,6 +294,7 @@ struct qusb2_phy_cfg {
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
 	unsigned int autoresume_en;
+	bool autoresume_disable;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
 	bool has_pll_test;
@@ -341,6 +342,7 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
+	.autoresume_disable = true,
 	.autoresume_en   = BIT(0),
 };
 
@@ -687,7 +689,7 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 	}
 
 	/* enable phy auto-resume only if device is connected on bus */
-	if (qphy->mode != PHY_MODE_INVALID) {
+	if (qphy->mode != PHY_MODE_INVALID && !cfg->autoresume_disable) {
 		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
 			      cfg->autoresume_en);
 		/* Autoresume bit has to be toggled in order to enable it */

-- 
2.47.3

