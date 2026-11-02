Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616149;
	b=bZd6EOH5HzgNGxUJhW7bV/1zeBDyoPIHIYRBHNHyPCh5p5EVwu9hW5Q7pSONUQzOsQXp
	 IR1SFVNA6nFS22bA6jMg9uVPx2xMwrp2WVZMyhskQU5StHLAWHbP0cu/e0X0XWzlihqbV
	 6ra/4C0FN+EDD16qDb7yiOyReLI9oKLWM82zScSUlb+uVoqZcsKvGp3/ExeAsxk5bYnQ/
	 2DEPiiz2g2S5hjEjf547j3ef/0Ftis1SczyutABJyGzUwDMXtetmJBIoyRi5Fv9fgiL4n
	 XknfGCaHH8veAmGy44sVT1PpgJgdXq2gcNw63yQrgnXAqvN3TqeMBX2KLNMKfHpUPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
	b=sGv7UriVveyJ4xj1W9dwKcdW3KaUE5DL+PY0udm6k1lYqdf5j03QsOTPEC3Cv6B9G8t5
	 IVvv/VTP5w2IeMIoJzJLc9e8jczUKIQajnYlSc2l11HW+sohW/brwvGLKMO7U+ou7y9hA
	 6ANOvhBJZyICE/5bqo3h7QSUcNEYNgZOT/KmJBilyxrotw8h+RS1aM9b0vKXYfcrCJyFC
	 QrnqaOwSqu3GLNHXCs6nlz56Vp+mfC5iT36/XGNd9XVFCUOMyetur51ggdsGVTyhVhqxJ
	 HEO8oY1eAgj/4UqcEpI476S+IjVoDAYcKPCwp1zApfUTzOAhksZhgxZxj3w7O5PVAyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1460A380E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E1460A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMtt1821213
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=; b=jGc2JBXcHRzAaY2j
	M2zTSW1A8OQVIx7MOuSKUVYMzqUJfLubyC6g8QYIJ/sh3rfWfu8OU/MDQe0kIBrm
	2racFMZj/gcYDUov75XYNb9VLNfyYg/J7ESr3Lwk4eVQanGlnDCfhMrUalFP0ago
	sfGaKtvOmBHyE4NuYld4uzPkh6vHfL9sVIg+ns7HQbnV9DvjVgu2eTrzyB3UnpKf
	Qi0mnyiatnym4t2/yuxzMUHQjU3P3KyngNiOqxlMwKgFVsk8L4XzAKqaTmOvR2QR
	X0x5mOhKmPYxeRjN7ZbjhqNdWY18S0Zej3A4L6+xaVdYnCFRkhQ8a33vvkv/NARZ
	DY2Q7A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:28 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46dade0d7cdso2691052fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616148; x=1794220948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=KFGNo4B+DP4btSo7/2YReGJhFsHk073linvZ/GqiY41NhZpJCDt71j7KEiBhd8BTWW
         xK0E88ndYiCW1zN3t30sp5Os+qBPve771yJrvKVHyaRZG+0bb6sfe/xTGqei9pFrCsR6
         MAOy4qXZjyS/NZIX217vKNB/+vIHjINn5BAhoPXo6eu+GstpPGvZusZP1rm/RlAbH76F
         3nZ0EAVYBxO5TZFRaBx4d9Ffizac2lhlhrDY0djZnFgRkQaUUuSYKY9Ha/+oY9CaOvhs
         CTViqXZpRDR+ah0J/2jpCFUhL8QOUONz84oNu/NZqbAsRDlyV2jHlD+hF8A72y1MeOgf
         Pijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616148; x=1794220948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=uxefjRXvfHezcfkSWRVyQrA3dFamMmX2u61Ug8hntogspgPoHcB3XsrIJRQpnS1zuG
         i7NEZOGpIdN7KGrcc/5gBD3pLvcp6Fg57jzpiBox8geeUjogZYMXl9+ar8XbF27qcOcc
         H4eo5aAw5jyTOtiW6qqWarEhTjQ9isV+wxIeCh/wZ1kmLlhcFLambTgbP6ehW4ggt9kJ
         7xo3vgINHxX3PpGu79XLJFy/5kqk3KfKG0wm6lPTauvx87POwth7E6PkOsSj/mob3/ym
         YjcDQVHyt5gLRprDQXg0WUCEnFn6LoqNwTtZqPidXHA432h8BChmQDkOwBoHU1TXVdnf
         8m5w==
X-Forwarded-Encrypted: i=1; AKwUvBw9zE9fwY3UZKusMdkIAj3ubyBQpicw7RGedRnZVLisZHd3GbIStasXwOFIhcdJ7SkGdeNwS78VEinvVj0l@vger.kernel.org
X-Gm-Message-State: AFq9FYK1VH81Z28lJcR3paYZ4ICV+cbj2SCF/ZCaX40Obfhl35hovc41
	N2txXSlh6yvekKdSl6WMHG2P3Ydrc3CoQCxNLzT7EF9kk8Ni8x7dYYewkNnyg9McQTy8fobz98H
	bJhWQQe/mj8PyCItxTrcs9c5iOubIWsZkAt9HlHlLzfTbOhdSWLsYPZ81KR3LykCcBmrBI0B0cH
	2a4hA=
X-Gm-Gg: AYBFou3ci8KSYu34tdDW/HV0biYoyzY9gLQBH9hf+zQbJLpzK3exkM0grGtAYlq9kji
	FQH7ZTTI9HJAaK1+WYVfM2WnLr5YSCZaxx4cvxrr8m3ZIVrdliAZqxhs7dADvUO9rAorxAxJWT1
	DZ/dGjcYP+UmEMZNf/7RxZzJE7nJKRRnJzroMK/wqEilF1XnLITW2mwkDNNU1PZ+Qx3q0yZm35A
	VeppkZpY52hfgXslWoG8i3TX2ZAGPHIeyR4Ial+jlxa4iZ+kI5p7RKDS1GcHAPjJz6q0whfS+bz
	Y9H2sz0BPMu31y+aXFo2cXuMMXwUl/JTGy0Qr3BmHNzmx1E7CCdpGSOJyo+fjJB7ACbdfb6uDk5
	X6xABaxqCw5hphRLBT7qygrYtnIGKHFuzsTfHUgcGzZKnUILN0RH+rYDI9I8OYgRzQnfTDUAcD9
	4mR2yKf4u41aZCr4YkHc/NhNoQFs3v/9WkXf7RJ8ijsGpguq96j4sZu8XDh3g=
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068872b6e.56.1793616147950;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068846b6e.56.1793616147534;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:14 -0800
Subject: [PATCH v24 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261102-kaanapali-camss-v24-6-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gA2F4twc3zU9hU3zzYK2OSO_90rDcav4
X-Proofpoint-GUID: gA2F4twc3zU9hU3zzYK2OSO_90rDcav4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/O6YJyt4rRnP
 q6wwEwz06OXj2pTJLeieMBa6p1sCDIYzCDd8Du6coQnHRpVHw4nCd3A0eamaB8y7qNvLG8LDI2K
 aJhxQpvlGZZatGSx1oIwDAfNROwOv/8=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86914 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX4x3XlJjI4HNH
 bFViLzQYZi5Ts1Vuj31W9CciIBdaJadbBTxSSEXyH/ycbltTiZLcKDgJDycgpc6f5JqO2GuCbKN
 MBIh6q5R4Vz9fR7Xmlf0oR15mFCEQjxYTFJ6vYU+Se4iyh8OvdgZEUhXfa1gIskyr6TudrcTfSC
 DaoAhoTneYVbQxGN9lN7pyVu/rmQmE6TVqT2W+5dRdyym7xI/fFNLeqcRrzu4agYBs5Q1kBGWiX
 ZugTRTQoDe5zWQAsCv1K0EVxcAuZRi1Btw08DdyYWM82FIMu3UBeUsbYmkWO5b4o4KSUQ+tKJev
 MWgI2/QP1ZbrHsqNBsTctSWNBEfudWY2jjhWIVp/y8KuUY+iZ/LWgORN0l/ysU2OV75OseAqU0Q
 vrBaMe3fxhGRSOoR15ZW1bgbUJr3UKfE+RtGzXlqhAlG9MgwHR3R8Om/nn3GP601E30GNXcCzHF
 nNW8G6J9/EfMBSfafqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..385be682e8b9 100644
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
@@ -5589,6 +5603,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5847,7 @@ static const struct camss_resources x1e80100_resources = {
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

