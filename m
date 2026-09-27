Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA33F3277
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515803; cv=none; b=XcohnmC3AzyU5S6kKnf2WgYSNVwcjtdvjOPxwUH6OURJf+lrEOOq/uOUhjy54tSG/mNNsU8raP8rULP5y9uZhyfh80MUNhD4/cY0prsRlZ8eHb8MPuSG+1sCG98Nn7qL4bwRL+2gOaqeFsi1EtWx/T8zP4YG490OiLAcZS7o4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515803; c=relaxed/simple;
	bh=AiV+UgMZj/8Xbz75FJ/bRBCuJFbHFnWTyvBbyi9SIaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pH+rpGJ7un7Gd9teujg3HjMHUTYCM10kxpUm76XjbNz8DrmorYyYNGoHHxNovhFZ+076QkTrVRqNg6kCnjWHttcZPLI9FEihD9PcxLrcBl3F5IMbz1xNLxKFDZt8Y6XikIqmALEfKBNQtKdmdWA/km/1qbAwXwzWnySAOWpQWIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNoGM5u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFcg5ZFo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNoGM5u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFcg5ZFo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMnFQi945518
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=; b=HNoGM5u5/oUKnvLx
	P5MwcDL+ZdO+Y5HfOMr/uflKSOHqpmkn8QTMy0QLASSN9o6OtvCG0nhgv/Y8ZFRz
	Vm20jVnxj75SEKurrlaVhaODh9MR83oKviAJB9sNWg4KMSOlBAgBfyhMI/kmiLFj
	ZaQ99SOi0l5Z2wFa/YsaA+cZup0QXEGjpfsnbNxCyNlteETUpqZYfiyLZhvGHazo
	qNw/4p+xXdnuewivtIjTKwlA7rDymbOlmvXyTYVxr1kheoQiD/TELjbrJI+uyydk
	cGmo08cQWYZ/Uff8b9duxdNyVRGOqUFr+NRpxLd7ltQ/JDLD7e8hyQAdEK3JvfSH
	zwMBqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp3aq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:29:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso447872385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515798; x=1791120598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=;
        b=QFcg5ZFoho/zbdPRsqCeqhMaiGkKrUjaFDXhs1nVng/ZFg7UctFe/rKxYSafcRCk+J
         BBOJsHYoNWkg5uJWgpK0vjJV+hpdc4nRo6Q+seay5+i6aSp06pCN93A3U1Zh9QZ1T4IP
         guJKSStDt2TqXj+qKE25GEqvn3pQX6qXIKvxE5bDMn8yZwYvBQ1tr9YoBfTrtGOeoI8C
         7FgFJ+Gl1VAyG+eusJPO/IAX8FXtoxgMtjnvHoaaQT0Cw0LThZdSaiGpS1hu3RPbj0Gd
         dZ7GDqN1j+c3Al2BMpxoN4G31DInSSwIOHcSpj1VEU82rJFyhv1sFAg9MUzOwMeAP/cU
         m4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515798; x=1791120598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=;
        b=kzFecSdTMMQxDsZqjVVh7u8KBQNq2miOjod3v/q9pK8uXLP2qf33zw1myyd/behbt+
         R4aylPpmkl4T+xC8tOjjtYH5ynIz4xd3yHYQ6X0wOeWWHuAnzptc2zJeLzL0BZ0baUIE
         96+gAucdLd+1nn0d959S4Ec5W6b6GyNuNzkd2TGyyTrSy5dGyU4ZAyK9Y2YX2djhceUx
         eOze+1BJbDCNT8p0ThR5xNzOHyi03MsQyLO3pmRD4oJgXo6pm5FFce+C7GzElh6xA4Tm
         67IpQZ4ElZeY+pHIwdNi50MmscXf3twrphDgEAfpm1H0pauXC7ZM26JhLlaQxXYGrc3A
         qm8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2BqIsRw+YOs1NLGzrm55Sp/Xs9aFpJRcudGjP6VzMiYH6XAsZ0H65e4KA8v+gtd+BoUCFqlCSSkru0jbR@vger.kernel.org
X-Gm-Message-State: AFuF++m6dtvTh+rhooC+krxQi6BJ4kLZzsYh1tTS8CaGa6vcp0xI6fJ2
	RPSLYffurzA55/ICyvrWjwQNr5DVtl2w1K+1W3ubBLnXocd53kOwIqwLj9u7kNez9y+kbkg+xek
	zOzuh6W3wrKtnYcgXWL5AaXsRurbwhvWbf9qgmXGzx6o2vo7gu69wRieZgTDmrUj1Tdwh
X-Gm-Gg: AYBFou1vYovulXTeq7xQRnlKayp0/xGIv3xAczuIrvBdxQ1hR0FzLajEu6rvM1Safjh
	Qeo+1ZBm2bd/bU8grtztEqRcr3m8QyVXc2YCwPCSEu7tjr3u7VFHdjLnUQ2Ex4IUuNJjqLPgFDk
	79huIXrD/mBk61sSjgeTeRDdassPaPFCZ1/X5PZ0vdF1VTFk72dK7+G3bIpTvN6cT86G7uXUFPL
	BFzXEMssagZXdu9asR/I/zEAfIVzlHkyyBNexLc3GoNzcobgWhka6ls9M6JNBIuKPn646BwEca4
	/WoPYnp+AR7plEk+CO3Duqa3sxFHs4S6SsRWZ9l/oLPaI4uQhFfO3yJodlP/iHhhgMkwJ6Q87PC
	5H7FTwKcvfLlal+sbExCeR8ZARQKzc/1AiERk9PjcymEDZ3TpwZyDiG+t2GUZdIRxbm+/wMUnpl
	sroZ5YAFOKVM1V6XfIb9RmY8RTOSIlUZGS0W94g+H0z86InYzLO8Q=
X-Received: by 2002:a05:620a:284a:b0:93b:d79a:c460 with SMTP id af79cd13be357-93c43e0ef20mr1570232785a.56.1790515798342;
        Sun, 27 Sep 2026 06:29:58 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:93b:d79a:c460 with SMTP id af79cd13be357-93c43e0ef20mr1570228385a.56.1790515797866;
        Sun, 27 Sep 2026 06:29:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:29:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 15:29:52 +0200
Subject: [PATCH v5 3/5] i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cci-clk-fix-v5-3-4cd498559ae5@oss.qualcomm.com>
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
In-Reply-To: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX2BWR8Iz4Ibmu
 vfYDEarc3bOw+BlzD0ChAz3hjOJiGLAlyE6HMZFU9CzsMJ76icS7tnV5M4xmiJZV0B+WqVQVINj
 ZsMXUjQNodVu9Mv7Eji5hs7lDuZocClufl2iOClqEhjq0UQLZzHOqifd15LCYzopIMySuyqVTz6
 RrSGp92xA8qMo6D+C0QHwQm23ew+2/cSFCKfoEFh8XQgIUTKWHYsBpYf2EK4LK+ymRn3F95gkM1
 aBHC9xSRlA243Jt5naHEnrlB4G2GojW8YeRubcPaIYkGrmhzIDmOMwHACbQIs/JpemL+4SWWWKA
 LEOKJh0ufFa1leuf6ozmG51phAlF8KgPPENNxyED+ZHbZVLVszjKRikK4qSTrxpkeXKzRlZDrcL
 sqVdR+G5f4AukCXCZUX2louD4TxC88HMYxKL7IA328Rfyyr1NNgNrHSU8cFccKp+oT9Iv3K1ahR
 3QTz4D4EFLs+9JPTctw==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab91a57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pm0r8gooax6G_kfoEgSqVFFlx4j0cqlj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfXwNX7+DeF9uIl
 Eq7QrfVZamPVXfVLUqEk14kDY51OGbdoYXKh1Zg8zbkBIruP2wQJbJYD6Df3Pwm7LKOA2PzQvVV
 KWgpN6205+PNH/2bkkXqH4ronKbs/CQ=
X-Proofpoint-ORIG-GUID: pm0r8gooax6G_kfoEgSqVFFlx4j0cqlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The v2 CCI (msm8996/sdm630/msm8953/...) is normally clocked at 37.5 MHz,
but its CCI clock can also be configured and run at 19.2 MHz. Add the
Standard and Fast timing sets calibrated for 19.2 MHz so that a v2
controller left at that rate still has valid timings for those modes
(Fast+ requires 37.5 MHz).

The values mirror the v1/v1.5 19.2 MHz Standard/Fast timings, which
share the same CCI clock rate.

Note the "v1"/"v1.5"/"v2" labels are arbitrary driver-internal names for
the cci_data configs, not actual CCI hardware version numbers (the real
hw versions are e.g. v1.0.7 on msm8974, v1.4.0 on msm8996, v1.6.3 on
sdm630/660, ...). They only distinguish the timing/mode configurations
used by the driver, and will be subsequently removed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 1092ce0371429ef64c7cc44cc23a42ba4c135af5..b6fa37a306758ec33ede6fcc39ce4412b86d9a84 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -762,6 +762,30 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
 	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,

-- 
2.34.1

