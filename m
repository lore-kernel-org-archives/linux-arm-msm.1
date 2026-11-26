Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691861;
	b=woNUc865l9CRSJRmnpJYEd+rdc9O0b2+zvgp4pJpTgJF0LiWl9drJqRo9Xh7w7h8XqTS
	 X4tmHFIj7DDR/xoG/gZ9M1FlObDcHRUpjEw2pNQVHQwYNjb8Ee2CitBzJ0HCWoxPsrZ0r
	 1pMN1bvtqmyActcg+pcXxCu4t47yuXs71UIEGHvtqgwIuGJcJ07KVtmk7uLZgN/lkKemB
	 BAtmwJmq/Tr2D0UuZm0rSVAV5LDxaD9pWb/FHmy6eMvjNp3wwImqeOmv71y+lYUkQrc1N
	 +s3Hz2zOEqy8WbmeBZrIyPXqR4e+4Lk0tNG7AUcO4ZgRWehnlUGKPHROv/R7Q2ttDmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
	b=vgTQv91aj8oDe5CPOH+KMUSRZRBSHpaIcuyeLWT/qE0vm5bel+wAAUE+CSSo7UwYW5Jn
	 WlTv4MSpe2EbvivssV68DYD/f/Fi19VRkAVfvDjfjIsX2F3kHegDVAJJjIhf9FoA6GnrD
	 Ag76rRRnWh01DJJJcVulR2x/4RlziKfPK8WX7PjBPY/4Cc32SR5utrXdiuBldbcPLDm6R
	 fsa864Dp81O5uNzLjliDFX+TSEEJtyzenhnsDeii33OWfkX6HliuW8hFZfSkgZW4mVjmZ
	 DfHCPMMFXW54sajtYsPsVWp5jrnSiL0FAVrvMe2B5mIDUHpvDadYS+cdbhfqyd8SMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CxpqRk/D";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCWV91at;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214EC606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214EC606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxpqRk/D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCWV91at
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHdxS4097166
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=; b=CxpqRk/D45zjdi3N
	B/5cog9e6PBZBn1QgojXHKuk2XeByoJoyzb0qC7Oo7yS9OtKcfJSpSKG0sadg+VU
	dV8j/BNUuryikZPmNA/To8M9iyyCk4agV3BmkrnARdb3JKK/hL/7N6TBi+X3+fmG
	qAVO0tJIpBjrTYf2xohYKSlW4MPNfvwbKtmhd/iSjvOqdp7QwM+mC5Auvd3Dah9O
	x/QVqeYreTYpAJl36Xq3xfbkRK+LTIAE8G9UPkl7VuvIK0QgK8sCLqFRlYsXh0kR
	t8hNJmXCdBNJqbOlSb07g90tgRDuXG+tVFgM0oaLzwGfBShT+65zdUtHsVCvmdpw
	7go1KA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaup7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363b06bcb2so129480861cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691850; x=1796296650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
        b=OCWV91atIc4DCLHeT4FqHvAGwge8ckydA2PYu5lcZbr2qmOPnHmyEtzhJGB+8OLUzR
         8h9KTYdO+gM/BTtDjBLUSXsiVZV7kWK1VQc5wOneFhnBH4EPTGfcE6slSPPn9LfK13F+
         dkF6SjgKzEtyJyxh+AEs81DTFRGzuveqsRixYAC0SM+0X+VQUpjsQHGeD2NPiv4Tx2bV
         JS08Ri6ZKvH4hkVE9vkWjF5jcxC0lQAOFRMev1qA5H9tVUH7t53dRsOaWwRF6HG6ozSc
         1euLffYT+ih/r20DhaW6yvJn6xJ2kP4ZTFD4wSrd+0XdVwGa2ZZm1MYk0bZQRq/JfyIO
         B8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691850; x=1796296650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
        b=L0s4ye9R9EHfJYAHtHLHG748a1fvOEuHiBQgjnWi3iyGWEsJqvmdhW1LvuSU2waP+V
         g2sMufr8J1jxx2FPGHVOtOCrThm0jFGCwwAvytVTSregw3ogjwCmbVw53hdic80XZ6h/
         UOxo946o5ibD7E3KW8vpKSl0Lsp8IPYG8KYu3zEIrVx2nfVIymLPIOhqoEs2cbQYVZ1o
         w3hYHXiPXp0OUDmtzPZOM9kbenR2SuZg0FuOYKs2fQ4cSs19FcifrCxDCOjOf5/1kGwK
         gicl0l5GJ0ChHom7gaa8+9FFFGsiOvu3cHe11nFtXediRuCmu+atEtIXOafPrn2XA9YH
         g0gg==
X-Forwarded-Encrypted: i=1; AL+hErGsTnK93rnxHCMnkla3ek2/IDy7LvlnneSnoMu7ptW6Z1FG7/Herbw6yQs45YL1MeK1exffP2+84+HAzdcd@vger.kernel.org
X-Gm-Message-State: APuU4Z/16Ofwn8CSolgKC6lwcuV+jgCQMBUHsyJOLJaT6D5xT5xo4GfM
	gsyu9byZ8iFnJponRIT/EGScl91ITIrmFEGce3Dk4IEtkhiHMnRZ29/Sx+D7ev8Nx7rO6Ga/8GJ
	fQ4Pi4lmzi4hZispc8AChS2yEsqySQJburRO7Y3gHniZXolqX1v4kCQl9CMmF6vEj7U8u
X-Gm-Gg: AZFdTZfB2B9YUwMb4LdV/3+6wSqVvnC0WBMvf0cBGaoZJybXqPYHj/eZXHe5G4nXige
	oD4k5DV4R8oSMg7L+BwosusW0g40IIaqAAVh139FmJEtHkv223jVKx/+L9x7cg4/DfQhxc/qSs2
	YBBUHTYXelT/Xp7+CG6KJsgM4qe+0EpZRK/cdVJz0d/BX1GaKERArn1F+2y7pfv9MrlMNa2V45z
	ceneuyqKOHdaPsTFMKgM99daXW0ATjfoeEH4BXrv8O0LDIK9EL9jdeUdktMwXZMaI5JQYi5WFPN
	rtwD0I+gksWLbFPUZLrNOrn0Lpq057b93iU8KgCN97wJ6K69EhkyAmTzqqLFYsuoBddBKAQESbK
	BScUEMA8dgY0HNneKmmZi/CftgscBFqw8Lp7hgsp3acATYb4ZThuPUrlSWQwlGfExPXmj4tYQoe
	d79tVolM4J/MOgNArZ0XZQZEgPqOFGgf9zMC53H5p0HA==
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr406491391cf.27.1795691849645;
        Thu, 26 Nov 2026 03:17:29 -0800 (PST)
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr406491031cf.27.1795691849222;
        Thu, 26 Nov 2026 03:17:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:58 +0800
Subject: [PATCH v6 2/3] media: qcom: camss: csid-680: Use HW CSID index for
 wrapper IO path config
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
Message-Id: <20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691836; l=3368;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=cFP3oByRlNEvJ4WuYhMgjt1hIZU55nr8Q9ZzJSGpZ10=;
 b=z2oM+YCxk1m/xk9mMEZOoRltNNTdAFMtq3R0kctAdoa2ramonY5VQbd3hKwu/s6M2h7rXl1FR
 q0WzqpcDhtiDnX4yyhJKVTnF4UEsLip5X6eIX0+vLGLFQYwy5Ns92gN
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfXxo6TIddf+Th3
 LI0x3GEiVJlgaioVBjHgC7/9aodMUy0hSrMVZCfLZlLZHGncm4F/yfqRL2Bt5x0lUKNoNoySIud
 hb/N1tRAlFP3HQuJmloX+VO3U+X5BCk=
X-Proofpoint-ORIG-GUID: UT_x_4seZG2BsxVprLBLos26PnMpmzZm
X-Proofpoint-GUID: UT_x_4seZG2BsxVprLBLos26PnMpmzZm
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b081554 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XpKL2tnkMV65FrNsgdYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX68WaeCqwBy5M
 Om58vmNqepfZucCWnm4gwz/rDhO9UTDwyXeZrimxi/MBS/XutUzRcOA+M/nJsT7BgXOfzEggOpc
 3mwFcX6U4augrYFtF7bP3W9a7vSoIs+a5lNQXNh/ujmWUp6qYO0Tgw48+qfBo4m6W1W5BHuXkvs
 T4FZ3OdQh63q78ek3trROkBz5dQbwiVVbUUiZPvREia3G99nlQI4gsOd1ym7381qwIscKu72cWn
 abKPjLgJcwbOTyWNMhq2nrmJDRkBm6yR6BLnZh3+gWqVxWXWsJdXfTJNA1ose9yfMiCFcKNOZnx
 k/6fStdn1tGF6nlh5NATsIjS0l0t2rg939peRaNCuX+FAtJjidG5Oj669m+wqw+dcb89UjzKFSr
 zi650amqnczB5+c9tV1t41OPQ8UCmjPG5+cVhYBq3BQxkvdbXCMcljVftMEaLRpAy+afT1mUrnv
 nHq51LtKgb+pi5qCpsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

The CSID_TOP_IO_PATH_CFG0 registers are per hardware CSID, but they are
indexed with csid->id, which is the index into csid_res[]. On X1E80100
the two no longer match since CSID2 was removed from the resources, so
the lite CSIDs program the wrong register and never output to the IFE.

Add a hw_id to the CSID resources and use it to index the wrapper
registers.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid.h     | 1 +
 drivers/media/platform/qcom/camss/camss.c          | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5f5e2271945d97764c62b630da6c..383032f8f4e785b8390fd8856bce4628fafc20a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -228,7 +228,7 @@ static void __csid_configure_top(struct csid_device *csid)
 
 	val = CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN | CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID;
 	writel(val, csid->camss->csid_wrapper_base +
-	    CSID_TOP_IO_PATH_CFG0(csid->id));
+	    CSID_TOP_IO_PATH_CFG0(csid->res->hw_id));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..dd75c8c0cf3da7bea2c4de589dcd64a099a3a724 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -150,6 +150,7 @@ struct csid_hw_ops {
 struct csid_subdev_resources {
 	bool is_lite;
 	bool frame_sync_en;
+	u8 hw_id;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d3d27205af0dd49599fe0717dc8dde68a9afa638..fbf7be44d8fa2947f3c68c6d467ce0aeaebc39ff 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4536,6 +4536,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.hw_id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4557,6 +4558,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.hw_id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4578,6 +4580,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.hw_id = 3,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
@@ -4601,6 +4604,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.hw_id = 4,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,

-- 
2.34.1

