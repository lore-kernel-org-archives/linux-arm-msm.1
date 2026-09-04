Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CA252121A
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547871; cv=none; b=NtFdYI3Y/Caz8RawT2P014L6eY+i/ri1DgSQKx6lzeMiFdpF4WJT6kM4MIjSVeia3EWTY3RGkeun8P2esJskK+g4o/JTBYzom/yGwHgCAZva5aOe0J54LM+yu/DvtLWYHFj6Ezfy35R58s4j3rz233HAuxOr8T1NbBtKp0gig/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547871; c=relaxed/simple;
	bh=aaiDp08wzVTG6QAhHolSezVwUSY3moqF09bwcCevu9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmwsMNLPqNaeq0jzB3xCnbFNuvTPt200iwlEGzxEJWDfFO8/HJz3m/MOAo4qLq7NwNEXfgDW/y46umaEBidMHZh7Psqv1CWyUkj8dXt1ayipb63mulDLSQTO7wCTZwhUtYz3Auk7ctqrslmuqMzc7lGTOEG0oR5w0u4uV3SCzns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGMSDfJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZa37lLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGMSDfJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZa37lLF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIEb3015992
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 18:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=; b=bGMSDfJGRl/waEDd
	VyDGTXmcSydQtDAbgI18fCKz+gg5FCE3SZRMPZRMyHRxgDuzG1myzyfzlPTj2hth
	hb9paaopP1b4FSjB/e2F9fVFMtZ+hvnQ7zUUbdvK2fzZVpR+7/et3QGHelZOhG5o
	m2gkApQtmvzrZZiTbWiThRXS2yZ0X/gmlXvdozyGLRiUG0DhCvLAJHULDMlsFhHq
	gy3jiXx1KIksJQ+GGiP+Ki5OSxiO7X7LGnwgmpb3mXIRO6871UZHaJstVHb0piqt
	uZvkNJ75wGN5MViBio8gtARVvnM0pQvaa22JEReORJ76Sl9bpfvme5nBp9woZwrS
	s0K1UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd3qv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:51:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2381830a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547867; x=1789152667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=fZa37lLF91ZWeNL2H9QR6sUIwQbH8K+WZqRSjGavSzszCBm5ZxxeuvrEh5hPuOHpdm
         IMzpTgbMmeTouXa5DQ/6VIXYnW3/8AswB7TO+Cx8/1M2adqApPsqZk0CK7cDkxNl5C08
         DZFu+OGkp1Ll/CMF2aSq7x/yywTsGh1HMcqxNTlFat4kn13TRa3LkkhkZ2lk2qX5WJ37
         jEsjZBmny2Z4r3/RUuLin1iHsJ5sBi3K4yoBvOHG+W+z8QG84Qpc84h7JOgdm6lvPKx3
         ORTKRVbUyk2TTaDUyrfZ2Zog7LJAuY3HbdNLwnk2eiBJ5yDqYp3dzyARzM2nvYchArPk
         dXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547867; x=1789152667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=PTC2nYOZ5sLHN8r4ISfVJfWUhoSIlgVinNzXw7nddfpStJTVa8mQgCdCFz6gMZ/1y7
         WEIpZwVHpsDhYeJh1tXJCKZwTHcEPtPtFmSQObueGp/XReytPd9t6vFEUHGFYFoxsH3h
         7rkozah2uQ9lbI6/sa3bjqUKrH8Hashd1WbjbVEyRAJgDhO6f6v51vukPYMetiNYD7eo
         HUu8DmRdebEyTLgImrGoI1aWFg+raIJG21/qWqW95L0o/bWmjvZw9a8/vZD5E5813Itw
         7xA1ozPjeUg/pVZxHL2qIX6+YMFXr6aPrkLck7uPYd2oCCcVXuQU2P8NkV57J11x5EDM
         4jfQ==
X-Gm-Message-State: AFuF++m9oH7s8aY2Ei0/npZH4gq/WozBIZRbhlHCaTl6BEb/T//TwX4s
	CtdV/vdmqS/LNsI6R9PMD/qyBl+CJUxJImbbr/RyZ3YnTRV4NHAWSexRzsEn45h/oVSjpttfAyc
	SguuR/W683oDfKlnRrL13ICZ/K/aMZNX/Dhdzk+1So9AYiu8JaSmi5GLlsgbMTd5sEMoA
X-Gm-Gg: AYBFou00jcTGT81pxm2yPgDlVBZ2JuSEVfDns5l9RNJECv3bNNzeMZ7ddjSMNenNqIH
	8v1/Jt8dOtcIjJ/VonG/V/Q/Um4wHH2pvzlJUhYiSltVtfp7VMr7L9rK2mt/SdGiWNdyMSWc4b1
	EDqUWucgo4hiMjXWbxin9A3P5x2C8KdrOs1ix80NAjJfo4BJBrmH8wXVYbjwcxUicVnBJTNqjcE
	B3mLvmtBc8fBjjh6A5N1xW5LTi38eEfRCn77Yvu8yETL5nLZP41xm0Y5MjN2T8JLlZCthgRQ+Iw
	ZcR+hyFFGqPhrX9pY6jDyoIq7A9uIRS6aChjIrMVpM9OkxLJn6HO1MEIH4V/PYhNj3xbtxGG0+e
	QyxIy8eq0COoPeSF9kfDRPe/O2yF+JQs=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140330a91.20.1788547867093;
        Fri, 04 Sep 2026 11:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140259a91.20.1788547866683;
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:43 +0530
Subject: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: vmKTs8dUHJVF1S8kkHBbamOxwcAfXe65
X-Proofpoint-ORIG-GUID: vmKTs8dUHJVF1S8kkHBbamOxwcAfXe65
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX3s1XNMjyqfga
 USuwxOmWd33roDUr/+DDXcoq/RtQ2ReD2rkQ4adLvM/DPqTedeOd2Nwkyq+/UdrErob+8pQO1q7
 aOHZg7gUnyab62vKbznkOYI7YRFAJV8=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9b131c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXzAwVNLSHaF3b
 km/1j4162LbfoJiNzRhmyMS++Flv9ptySD3bcfKvZqrUmApEujZJ70V08uU62AQStphGxcal9VQ
 NBVlO0j8W2D9CdGmWYOqnc9mqTUi28OYTKGWpxMXySCUviFYZNmsKBvnEVU3pumW67Sujo5JPUF
 ZxsyTirdlGN6CsTb9vyHo1sPFo6Z9lb8fHXj2tDDTBH9SfCvALPG+yQhC1YCky0kr2o5aJ1u0MI
 oImt1+B2V8mOSNB0+A9fptypRF39Qe9aYR+OqD1cFmXJG7o6S5P5azBa+jOGmUcgvjkPXVYs7q1
 Na/C3fAQKu+SDYDeCnvRZFPVq0AC3pY+EEVlx+9cbzj6U8e/H5kaUMRMkFede5gsPwJPar4WdH8
 /arRbHfji/GjPZUYWQGAdC4y4EDtXoPy7f8YpXGEHVdcc5g3w7MehkTrsyf6MFUUgQpwwlJhSfO
 DEPVx8C+QMXeExilOdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040172

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

