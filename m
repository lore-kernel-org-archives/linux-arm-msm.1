Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4393EDE6C
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515799; cv=none; b=ZQ9n824KCCAnoU36wKhZYU9hkEHxBw9yx973tfMo+RsejfYWpfqnGZ3/GjWV3HgjvXnkU5f5IWqDlywfLgjPdmsWw34TixSvpgS+FVdYoERU29NcGhLlnN5XuQclxAlOxTQKnEi+nGaILCuApdrY0Sx9K9njE0RNVxwRzfSIE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515799; c=relaxed/simple;
	bh=t16IXrQp1yANeK+b1ZtNgYp4/Gn5qoGrwHlCtrQMeg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUGA0n1HTnQqleLchPeBcWIzkuBoMUEdYAo8ZmZSMga5tL0lkNx0BnGxUNaagKTAT7+Q4ZcGtycuXvFoU/YApFQKi6+4FKBruyY4z833viKmb8nZ4BL0lh1yZtlVgyCZQbEq+I34WH1uDA8vUqmjQq6HgblCHPmk4a7Tlmzukks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ6dO106; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ek6c0uVG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ6dO106";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ek6c0uVG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QLSElM1992304
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=; b=aZ6dO106AfZ3YFXH
	FnHfoJBJf6YdaKieFmPKB6e0zkTh9qzIzl/pDPdEn1YzovH++2X2QotCOFyW/EL8
	GJ5ZOS0m+OqaWBsoH5rwh5N1NdrZlFaP2Cu5nwM20rZZBTuA0x4OYjH/F1DJjo8f
	0NT08KCb0ZSN9ajwcY/eY6u6cTa/lAWLnYgP4VrKEmyc66SXBh+uJP2dVbljYBRk
	e2NJ2CRXaB+dljpu5gn7s0jmaPlRH40zObqMVo5oHjLQmgCWy3Kos26qqqgWpQk8
	C14Z6t1vLaIqcoa5agAJLHP/kYFyF3EbPiIlgxQ8kIdUgJPPt5vNiSU9WTHXoIR5
	p69LKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfuarp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 13:29:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91578e96164so6285056d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515795; x=1791120595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=;
        b=ek6c0uVGyG8XSTazaB4RIzWoE5pTbh6IMve3l1OZAnlxShZzqoXznjCBWuMedskQnp
         mOKXmfBx2k11rA6RdY/9rOmFvo01ZuPL0qHiGu66dUzd0+AGjO3pMrPwqRYUj+bAlnmb
         QhCGX7z0a2TtGP/634FbwiM7CLmBSX7brdlne4/1tXWiZqcumaIHXgCgDVnjqTMKdmsJ
         Azr7qZvK0DQ1msyxkhPRqHdXYspJge2IEo2xD6ZPltyLPc3Lfd2L1CnQ4FClVnUlLQTC
         SPl44icf4hxqItRWnd9yDaueer4On418nnf1JLGfge3gZYs85Bmcq/MVZdICKeoLPn+s
         QvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515795; x=1791120595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=;
        b=n8tmu+tsdrkkMXvD/mUnqUdE+mHizJC87HIOZoVKSEscfdvGqC1bcLyxkPx7d2lLT5
         kii7pdthI/7lLSSTQytypNi4VduK2EjjShY/JYN2vpKQUvily7+ZdjuX+d10hTW89fYL
         VUy7sLJHMgYl6VPiB6ubY84PopFdHahbiL+aCbAcAcbL/hEizXdxRW+5kIBSlWyTfSGa
         vFHrWM/cIetLDMYXDFt8RY05OlxHVInx4knuEA0We3N2wAGu1CHzEfrDFrprmdpCR+Fq
         gm1Z9c+IjpIre1YNGO3lNg6tjOO73sWM93rIESKz2+YuQ0d5siS6agYD4fEc10Ag5tPP
         x64A==
X-Forwarded-Encrypted: i=1; AKwUvBztSChYgx4nKzENNh8VwwP1/LQitaYshC1HAcvwN4lr9KW2RieUlWzwEI0m1YOj53aXeAcNppDdCDaWDblz@vger.kernel.org
X-Gm-Message-State: AFuF++kCfTGfI376ftnSesLxDk49ummpqe3rOK1syvnYJ068qCyiVmi3
	GLE5NXA/9BqJRVmYpP35XXyDEUO+03IpmOnGi8pwO8w+jof8CVm5/oJXTGQ8hXKuVCH6OW9aT5t
	XjoL/cxJsy1YTQukxFjQLVKiZ4uoEVkefpOG38aoJPLjRUUPUqdGehewhm3uRPvMlRGhe
X-Gm-Gg: AYBFou3zpkgh5OEjh20n02qL+NGjVFWTycelwIds2WFjqWjVdTGypWVgSHZjg3027rB
	w2iBDKneg6vCSg++/yg4UdQkIdfEwmA/McjEOD1u9ZjK0LRqNSndneRrc5BajOIby6E0N7fkSFJ
	N35nb1/oHLYrJzW5wNw6UAp6Rm8U9QuNxN8LXjVMpsWF6sADa8RvKLqq/io6SCdqFu38jUIrIxX
	alDgxzXez38gelbF0KH34eNpxwRnzF2UJCzU53p6KWTx5lcfkrJfMiv+rxs8crTKJcc+vdYRPZb
	JstkUPgNglcNNuRhxxUoFEIGqArAXfhS0X2U43S8L5I5DMLVM5yfYwJhXFrIhCH/W6dZmQJ1Jq2
	Q6aJ7DBsmrLC5EvhIZ1AuYSu111xz32s7rkIcvf6RVe8xg3Tia+CP494WtX4vQTx3wPcy8igWqd
	9G6HRgfDvRwfwQU1Wn7/YLsrgSuhhLqfjA7ZSvQHLO5iw+77S/Elc=
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1409431385a.16.1790515795429;
        Sun, 27 Sep 2026 06:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1409428385a.16.1790515794999;
        Sun, 27 Sep 2026 06:29:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:29:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 15:29:50 +0200
Subject: [PATCH v5 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cci-clk-fix-v5-1-4cd498559ae5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX+Grx6QcN7Lqz
 sUttvi0pY0vvLj8nItCrpLUbuqqZbwnjpQYMRtlA+nQkhXUyUrnTwpgH1czE5UyGE2mnCsB08L6
 jQDG9ohx95uv6YPB9RGnHRzu1RTtvcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX2/4mmZja1nKh
 zuFCkLg3lkOjsKiLE4etjoLBRa7fGA2gkB580iaV4Egemo9pV2XBsSdBU3YHQxU//WsT8dEsM9o
 67AVAZGHTbGAb9yQidmPRe/chTRHhjA5FnxlyE47gOS8TdS7yRwDIfFRSTdFKo11PeecWDkjfSI
 2nsXJrM/+XHAh9uGVNz7ScUIUt/zBJJKsP+cBuYqr9XYwEnD3i2UupQQRiZhXBTm6aZ+5Tald0c
 89FbSRZaJ5xKuxj7A6wCDOhfFOfDd3hHBUCpNo0hfCR7Jk04uoS5ILmDpiM8MBci1dBJ2VhXyvD
 QGsw/ImnecuUd/3nH/ULgRzA7+vAcv86+KREwZ1VAr4Wd/hXgC0TneTXV/RRuOPlNquNg/2YU67
 8T1AMpFmOFxzOYY27z6uWhrJdB2JGyZwaiu48TtRUoUNx4iAAaexNTfcy1DIHXa7t5ROW7zhCGN
 BfINqeiCoACR+i8DStA==
X-Proofpoint-GUID: RkK8w_lOl4oV3oUe1TFDtsGLoWyL8Ier
X-Proofpoint-ORIG-GUID: RkK8w_lOl4oV3oUe1TFDtsGLoWyL8Ier
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab91a54 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Y4CGMd7wAM7EkgizcVsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The msm8953 CCI timing table is internally inconsistent. Its Standard
and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
clock, but its Fast+ timings are essentially the 'v2' values, which are
calibrated for 37.5 MHz. Since all masters share a single CCI clock,
no single rate can satisfy all three modes with the current table, and
the DT assigns 19.2 MHz, so Fast+ timings are wrong.

The msm8953 CCI is the same hardware version as msm8996/sdm630, which
already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
the redundant, inconsistent standalone table. This makes all three I2C
modes self-consistent under a single clock rate.

Note this requires the CCI clock to run at 37.5 MHz, the driver selects
and enforces the proper rate in following patches.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 47 +--------------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index bdeda3979c4814b5cdb463734b8361da7fffa879..0a216c4d08114f267c8441925e8811ca64f1a909 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -756,54 +756,9 @@ static const struct cci_data cci_v2_data = {
 	},
 };
 
-static const struct cci_data cci_msm8953_data = {
-	.num_masters = 2,
-	.queue_size = { 64, 16 },
-	.quirks = {
-		.max_write_len = 11,
-		.max_read_len = 12,
-	},
-	.params[I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[I2C_MODE_FAST_PLUS] = {
-		.thigh = 16,
-		.tlow = 22,
-		.tsu_sto = 17,
-		.tsu_sta = 18,
-		.thd_dat = 16,
-		.thd_sta = 15,
-		.tbuf = 19,
-		.scl_stretch_en = 1,
-		.trdhld = 3,
-		.tsp = 3
-	},
-};
-
 static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
-	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
+	{ .compatible = "qcom,msm8953-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 

-- 
2.34.1

