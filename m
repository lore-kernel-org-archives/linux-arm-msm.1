Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898259;
	b=hxUF6yhkonkuHz91d6KrYDgHmsZ0z996+CV0EnSHUWZ/Rd0d3YisscnPc+C5Q6M3UUif
	 i/hp34nfzRZ0PSCkguZbvs9b5E0lJLAKPvI7e/Tp3KBG6ataAI31+j21rZZ+ohiCmYLQx
	 hKtEPbO5g/AWQe0YpwCS2rqmK0G/FrMWonNe5QHgdwFxJIM5LpR58jnh7E+TS4ZI+o7x/
	 TaLFNIBTkd7AjBsCC2Owva/r7flGIJoymCmfmL1BZovBEpDXhisjCTMVtO2r+7jeOLXwE
	 zIgh5rcEHzFE52JNW5F7bG5Lz2hc/LwPAYAa1lUV9rrrQVNV/5LxOTtl47DcGmIBs+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
	b=li/bfLqCw5i9Sy/AfiwYWynN8/DuDITPQIGL+Wm1JNju3YyRXjlxiN8NntBU+dz2MtPa
	 bRcJpGMZA43deFRkqLurLIB8k4KcItHX1qzLKPaDXK29HUHFxsn8eKE0Z9wyK8zPmRBzT
	 m5LnPSEbca5HwvO4lIXmT+kdonD+GYLzl7OrlCMeM11aISNmc6Acvp0JF5tGNGD3v1xos
	 P4msaMaQfrdoP0voLlLOGN91W16zseRZO8FI4SN0zsujNDBWA0ikpWzN3Rb3VvWpKkPf5
	 6Blw9YMOZChtLsnGAsFgIsZK9T6CLNPMmqgvd2temalMX5dq8zQkApV3moAch9Vmotg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58300606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58300606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17LMW2572101
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=; b=hrC9ZTPcSZxqR+y/
	4egwq1okUI0CHBzrb847IFersUjlMVzc1DISsIkVwC7W+5XRNnTRAbtGBAstQWph
	AWgFgMvdIC6FkU4gQnGJTFU3I/64bId9CfwFcuiq+rkPxEnmILavMhsUL9hlntwV
	+wqg8MNYwGCM7FX0qBLGnlhNKSWc0JZXgRN+STp8Sp/RJ5Ss1o1LvOl0RpgnWVlI
	5a2yWTbRDVjeb8ejK/KzkRqZW+gsyNlhG7vhJqsoBLX3Z7T5CV5qllobI7ejJMP4
	X4roh+FYMJ/RzJ1l3RztXKjFSPQhRveVHztGwFEtVPpV6KTlntSGOiqL4gRWGEUk
	Iim45w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehj7je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3512052eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898253; x=1793503053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=DxoRpq24VmtVI/8yBMiKHgMHq1dIg3+ueWcByz15O/fkp7QQhL/0vODNAXG2KV4Bm8
         78OfE8ktO+mVKaeSajJG5gBd6Tv1i8RS3JdPvEFYcXEScrGqUoOsqFsR8dxycafc7Oyu
         Aduz5od8v4v5+xiCMy2cKb9Uq6Le2YYwHIzr6iwmD9kIJqkcrBH4kbCVsasdyk4fEySC
         EGJHaQIBMKBeGs7+iC1dkwV8fqY5Af6CLnllOhCrGgAKghzDdJ3RNWCmfnBEUdvnsPah
         35e4F7pwMIdoDBItN8r0CfS2nv+XRfnLbjyviyAo3qu/2NE+1YMRCKYXID+ABoGk44YK
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898253; x=1793503053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=vaazRPOjStIbqA5HFCJVBJSa6lsoy2NlT1RDcoUyPsYdZmmvkDq8CalWH+0gJ7WgC5
         WnX6DVsP236ApxkEWierbpiEwNEkhL/oKGgKnp5K9nQq8XoDRT80jTF5E4Gf0PLlwSvN
         Er2U0s8L4bk0USfBJOr9pmDlJIHvWK4d7gKPpua1c9+pnlZb+7MAI0Y0HFdHz/bDqlMC
         m6UdCSEYV5VPuH89wgoUJ9P3mYaYOJ1ti7aDOwODq77U/oTZ2PhJbmh6KxK6iKlxIBf5
         NnXP76BYCQxYllx/bjb6Bg4NbAIP8DB4ZDt64NS3ajaSlD41JQhxxdQxxGrW6YWAAQIu
         JILg==
X-Forwarded-Encrypted: i=1; AKwUvBxlBap6PooYHyFMh4gOLB1HC617V4fXXXZ3rXzFlOHIvUcQa5fYR86ZUI8kqyL9Wp+wXQYMTfIwST0V4llz@vger.kernel.org
X-Gm-Message-State: AFq9FYJJAoi0rrQyaMMLsba5d37FMyBjGfRpxSwJ0xD8lQyn3PpU71Al
	aNMZo/O0SmmrY0h+Emckdp9ltoTz7bbTZNNKOZxtoe8FyLK2wj+87Xh8AQ/EqbdLm3vJ7alX5cW
	6ko0DA4p1Kx+ZtPRoC9TDrFy7eQ4LsmFlhKNGeomgCtzM8vkr5Qk0IfbcO+GlNqSpzVtL
X-Gm-Gg: AYBFou1dAfNi105PrL6tBtaDpgDazG13OyIO8CQzKyPyFMmOBr0kOVuqj6VAB2kC343
	Ydnez4+mxxQiXWx0Cnl63YZt5qhj8NEF6lH0/QfVTPPC2cJS0eW4bMY9X6EgvKHTyd6BWtIaN+B
	4fLo9OPhw1SD7ZN01tm2LpAYKq0FcWtWqOrq+GEV7JoGHgUJTUDiTc4PKYRQ2tveXdeFe9hRK6w
	UlZoAyetFyhg7CQKR6K06yNnvSiGfhzXTE+z9Iugsl45Pu8jhOYAq2yhJSi6QhXqU/vytJH3kFm
	llwhfcGW7ItQn3KveMw1S+QB7kc3sgkses1R6uKWTNZm7Dp2U2nKtRifuyRBXTv7Z8z+/ZV06mA
	ahcjYL7uerucwvYXt4yNocrY4ubzg19Xb6Jl49D5WoRVYztDYAdfjShzANoT6Pn4Rei7Kqfa511
	EW54+5HmT3Uw==
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169622eec.2.1792898252810;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169583eec.2.1792898252247;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:26 -0700
Subject: [PATCH v22 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
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
Message-Id: <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3DqlaXcG0SIH
 g557ZXFe54Xd6fwP6Us0AjTIUj2XMImJ2Z30YTzvIniyJ0o9q5dFudMrVkB/n9qrLI2vmmxwoH+
 o6NgrhvYfwpEqvxLz0LNIX/6Isnu0dw=
X-Proofpoint-ORIG-GUID: 5ztTi4UhJZM-Jb5s_jauwRpaGxvezssS
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6add74cd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX03RD0chmDJU6
 FuMJdxR7ULErorZuvgH85R8xp1qKRWw4xKQ1L85YisYv1lCLFlBD4G5RW9gGmboiUApSa6SK12K
 tWQictN/1/N6uCQiYc45bq5/+FSQIt3b4lKMCU9out+K7snO6hP0/BWDsB/tlJ7hiyi+eE8EBYE
 4HizZNQsTwGB9EsprwhgmV1X4Cb0GAG129T9mgrHjzJuyXLXtKaZHnKw1Ih6loR+azxGzCz0jRB
 L09JlfjfeWxDdZ1KqSIMC40rwF32QkXDMTBmjNPyiBadEfoEudX/SevoX0SrHdMopJL3YoEDkpz
 nzJYBb8rDRJm8aY2qWKsUPZoR98A+yzjOBQeVdNrnoFaicWOhU5rTD9QmK9RWF2vAp0nLD+OGcd
 hG0FiG0S0TS4H9/FzEaETIYxg5KDpS9xUIq1ZZ2Ih5wcEX8ONQNi38mH/kLzVvMAxtQvXkR9xRR
 xgdDshQzMNBF7eiENOA==
X-Proofpoint-GUID: 5ztTi4UhJZM-Jb5s_jauwRpaGxvezssS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..0358ee384012 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5606,8 +5651,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

