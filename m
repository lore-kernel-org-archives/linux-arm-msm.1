Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898253;
	b=Rrx2V2UQ400+6dSBu3s/6gMuipouNXHfPKv7CAfZYQhv7qLaX7dKwQ5aXCtXIpma2Gk1
	 BGF+eNIBPoGtr+/GV2FzdXH8WXCyWQG0stLRUMFemmms/3wR1mdtlNOVO/uoeyIE6nPmy
	 p6XDU6nnSAGsl5yda20UVdJnLzE+ZrxP2yzkRB6PdNNvYQDlOk0FcTfePVAOUkWRN+aC+
	 p8FSkYUTwXDK7DGAWuXW/J4KEUJZaTY2pV/e25xl99XloI94bWKKGr2hggl9LwGmM9pkU
	 UnJvoWxfzCJTrV71kYe60b8rxtsQ2fE6EU/oOReEMBgOFZEDk+OwIOYQMWLwSdOZf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=jfsavzcku/TzCEy3WZRI2MeWn0C/4zSJCvSgYJmHp1hSOE9s6/OiafCp07AJnVQEnnO1
	 bAVjiqIElRt7/14zpK46b7M3olB0S61r5BHA/7/SvOlkowjJk3pZ6tLeC+PUk1dOjulr1
	 s9KXVWkeBhX/TxjtO3r3cMb2VCRlI+bHPgVLsitvOLV+n3Po7+WiJqmRbDSPOkbkdIdpT
	 g7fekehcwJeANN6QGze0BkgXkTZx8iJro/X/yYYB+NYhnce0GPkGbaSvc/W4NoBb72dUZ
	 v1nocvBU860cMWyYzFfHbrJabmFIAEJqdXckn0EZCxfPlJx5lNtPXd2+QXK622vjgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5660A3826
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC5660A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16LXe2207985
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=OZKWQNWT4TkvCQXu
	+v6UTayRUYUaMkXQmkbSbDWqK+TNtKBbvvsftYBZvd/c/CTbbzSxEDxo8ovKVgTw
	GQAUIjbvYpkRUdvhGanyv2HWgZyr/kihXxSzGKbAQEhY0y5k2o7FLs9gB4oEnhJw
	xgDx+Adf6Bzhs8D25EVRZmTlTPETsx0JGBpfEdv6Tf2rKEt/Tdp8a5cD35OyZusm
	hB3PXvaCOYxTGZKhHD1woYoV8NZ527iXj/r2xLFMH3U3ZZCcURSCXPh6W2cKzioY
	5A1Zvnu/dSBMN0HM9+tAtwD+nRTeJ0NpBN/mZMJXSzHQh0MLQ1IMCx5NcjZZlA7a
	1tu0rg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9t5g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so5507887eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898252; x=1793503052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=Bz1GBPXIjmW3XY6ajfoVctbb/tI91wsS/DkzodrC3ab9Il6wO2fQvwtuInPiAK5Ej0
         QI+uUUfe0eGLcDXEISHb4kk3dPoRS6mDMPyEjplXfotYtVWw//vc5/goXZQH7ewPcTLA
         h5wjsD+ohzSr+nFZafsUGTOO4pJ3fSoBwe/uAlyqfbKJ4UU7vFq/HGuwMU6ErBLQFAZ0
         ox51ZNZJ7+XE2lnVt0yCVV/Pt/rJGnUs5EHsSF1ltHjP/iS+P6y1BbzDVeU89jS/pkF9
         XAkbbS3OFXFQJKhM+6JhLJMbLUPCqhIFeXsq8zrUJ4SlWqq5NpniCAfrTsQKgBxg4mzD
         v+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898252; x=1793503052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=UT56r0tR7suPOMfuawUCb5l2nPFVC4MIpA+vQ27mCPSF5afywCObrW7aKzzA6vGOCZ
         Hmh+gOnLT9c317DMQr+OrzFKQ3Bcw55SoV8Gcv0oxZgbZwIghbcuqbLR77ScBGdsAXxR
         2sSYGYazj1HGYuIbFOc64lt9N9VkrKpjkPAl0Yi4J5Z7LBrGMHL4jIAMg+/cQ20cE+/G
         W9GtKuRC8I06UJxgOu/zKqtNqJ8Nc6loEn9m7WHWDiBNjSxOLz5HC7Quy+aDOQtOS2gG
         7TO855+cyqbVb81XYlsm6CR2jXw5x+9heuErbXVyoIhoBBFQoSp/TUZuivC0njip2hs0
         sVOw==
X-Forwarded-Encrypted: i=1; AKwUvBwvlzE6YA/VxVnRvx2yRxna4ePy31dHGipt6h37yQ4E5CBQlhctczTiMp5shJtSyBDw2LzJJfk3hKYkwWfW@vger.kernel.org
X-Gm-Message-State: AFq9FYLVD86rYPQvYWvXkJ7srCzvoS4mDJZYv13VL6QDI9KLGrwIgQ5f
	V8DRtM69ggmRt1pAj8xrUQdhvKy9w/X97j2zT/6lo9Y0+BOQSlQAcJ83iq5UuOnelDeJBEaJoyU
	vlQyMpSstVOL7qKAnJO6HI3TY0k03Zvh2rtYyAQZoO9dUZlHL4NvScKpE5R7w9bKyHpz0
X-Gm-Gg: AYBFou0UKZkkLytGECVcR0kRQetsy8gw0xq+XzhkPIdRAPMMoOlKlChcxiUVWTPqORO
	Lw36xJ+N+v/7/AiveAGvS9ACkc3ejqrJb8y0P41nvAdwEQVH0WR4RLDe9JA/wAIsdoUAe+YYi0k
	+A0cHoDAaOfc9TZjOq+OXXuOTnT5XPlG7wcLAfmKkiWLa1u+03GVwsB0Wpxd1S7CAsURysyz9wj
	0kKj85joFf5dztgjzk5xgzjCy4Y5+Q/bq8aYo9trGXhq/Ut7b+R/BzYFZhxGZpvFq7K/7lyKim1
	uJP7/jckIL6BN7De0MlIlgMn2yTsQ+CMjfb7Dj3f4PVnhlYn7/dj9S/glp8IyXKKlvGdyH5g+xF
	4iX0dSfSKq/UApYP2cRSAC3kHYoG1uNc+KXl4BTMAzsVjOXhQDEZzik9fkDfe5PaEbbjaJCmJMF
	sOgh5GBYoO/g==
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734830eec.38.1792898251821;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734782eec.38.1792898251122;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:25 -0700
Subject: [PATCH v22 06/14] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261024-kaanapali-camss-v22-6-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: rxsS2NjKwKvE01mjw7BqlKjufZXHXBMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX7ICO5JSgvoCs
 ORTq/Q2+r4nY4UCbSZ6Qz1YVubJcw27YrlHeKU5S4n8rFN8pQP83GiGpQldXNoaD2an5frJTLTL
 GFUgQniEWggMWkyE13quguXh6N/uDI26plqjzOVKoBjR6ffTbvAHPXwtCof9uOnDub/a1jbQqsv
 SUT2e/zAWIF0j+H/7S5XhamvqP7BRfv2vuai4+JafsnRKm4l0C5VDO8v3tE4SJKPC2NVz9w02Zq
 p7dtAiubhozPJO6f00VzD2CRxDZb/+CbY1ediBFLFKSYvQSioq3PtavioX7DZoZSkw+X5qMK1z9
 0e2lCpUVnvAnhHIYoDSpKp+13cycTRyHReMl+EgTqK4MiiU3XvHuLj4204sKm3gFaVS0/Lw2Q92
 at5nb3wpGxfRdBZufTYvu7XwocUcGUobR8J6ns4QzMJdNwHRfjCz/NpgyveCXwETotHnJLBsOqD
 GC8qCCoCUc0SZXgrrVQ==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add74cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rxsS2NjKwKvE01mjw7BqlKjufZXHXBMB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3+lAxK9wdr70
 teJy0N6o4UjG++lqMxkYQpfVwcPmAWmnJTqIpn4A4QI6IIvBNF6cPKgLGGfgAZMP8hc9pU7zdNc
 rYs+s8Cvz0Hyv1a/vKtjbzW6bFBwhA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

