Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899E519DEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684758; cv=none; b=jtQ/yZq7mYLynE9nkIXnPiO13DYgVWi02cqJzwdXKL4E5Xax/cZ2Rb15NDseX6auvht2xt5M+dcpobvkdE9JceJfdm1tFyuLkFjE09w3G11+8cVfZcKgUPXBib8p/kwD2sev07qR57V+HccVl3TbqcO8o4rc5Re2U8eAOQ/rpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684758; c=relaxed/simple;
	bh=t16IXrQp1yANeK+b1ZtNgYp4/Gn5qoGrwHlCtrQMeg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p70IzBIUacEZXo78UQVQauIxGSCcXAnrRQVCY/95BIbw/Ohla+cEo+NSWy+SIKaz33SkecSVl6X8dOdOwaCOouOkal5dkNU0hdkw9DNMsWgSH+jiYY8onmIjJg/h47bssc8MCBsnu3bO6IYlq6qRSla7N7qwXmcKiOv8V3Pan6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/p1pA+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyBwQTkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/p1pA+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyBwQTkl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEC7l529143
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=; b=N/p1pA+dZ0sLby2X
	fAnORe1pcXYnOpqptK71vvQuRcZVvHfpCTVJ+NhXpnXXrPUCVG2scm+8IsXAyt/f
	goaBwY1yXemDDRL6tlCAoM4HGVNgC+SRMZW/JQXMKHAlMBtQ3yKcO6UC9VRDKiLF
	Q0B0Txg6U+cXvQX/RJsGdc7HHC2NDExKgzNBE01soaDQrZMBfyf4MvKvX/zL4UsG
	Co6+qgybQCnKnSy7Xo6gpCBqNWDjVweoaBr0smUZkVVJuzaiyDgf28b2g/i60ovk
	LpVbqmpbJbOLpjhFORBS2v5Ve7f4g8PEU6AgItzJPCLT45yFILjWZlImyAeNcUnc
	Gyacpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2d8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91431adf55eso74901906d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684755; x=1791289555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=;
        b=OyBwQTklqtfFR9LbukCEVvlHqg8LcxtSLzxr/DQ8SVBZzc4pUczdjhschr48JteIxL
         LoxiADmmRCiBS4hlEU3gJHyqLNJYBgC5OrkIVCUSJ9AcKm8PcZ3Ongj9Bv8cfDBQrZfk
         zRXWc4/nzX1lLoG1YGbACqP5svmzut37xNdWl0nz5SlXZHQUGkzcNul8+qOuZFFjXDBL
         BcYvF3+lxqWJTDxjiRsCp8avpY81Nbs75nAlLYPBWGA7tEiymT8iwibzrPjbNy3Kh8EW
         pcEmW4aTf1iFJVo+vFxse0ynPjvm4sUUHfdykdOXACBm80hFQrZ3RYWpH0g0WNJL4TLY
         I2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684755; x=1791289555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbrkTRyC3oc++L14v0v0sQRxQG12jGoR751GbRN2fLU=;
        b=bF3yeOI4QV7a/F35SQvKHP5YvaWZfRpCq3TdOSdAqV4MwKaFRKsoggyaFFQxU6M8zB
         PBqClJYbuVZh30xqsODo0D9AcLU5dDe6V0qbcMGBazSm069Tr8ByjyeOxlmiWj2PtvBt
         x0Jz2+OJvy68QL5ggU/agOe/VM/4+UWFJcMLBXiL3m5x5AeFyaPfe4nKi13PUoCPPULD
         Pd1bDpe17YNyKqehttLKhPtZEbKqwCG4/h3GLguqFlhr5ang4NUAYLnyjhE+6tp/zYbG
         Wqbn+Q7Ou7G5mk/VqJW0rZKMP/6Uht31dB7Nrpc0XNtWPvDpmdcD/6flTJVkWybv0tc0
         YvoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5K/2vkOdCmZN7OeLAYorGp0vfwQr7P/Bt7Xo0cEIQrt1d6SsZ50LniVBlhyije2L/pe2mPozgsPvXlRWo@vger.kernel.org
X-Gm-Message-State: AFuF++m+djG1FGnDbdAK+wJ5l1KQFgMFu8l5+p8GVvDD9ugGjg9eF/M5
	4Uj9qxAeQoy58uL1JUp22rPLw8ah0A8iWAC1MizXLtCU3eO6DGOqaMEaDPwOgpD3raNWXFW2SCn
	ywkXMaHbIfIXD4JbAD2jPmszFk+aDX2bN5fi3eFDpaprdJvE/jZRojPx+2lFzq7A6GKBa
X-Gm-Gg: AYBFou3EIlvtqgIqt8NF/0QoXk/GE2CUm9ZfXZpdhlc0gzUqA45CB91RQ2+FjMjZelk
	lRjUQN1cKgzXW3g1tuRcAIEzMdZsjSeQVVTPv4aZWTXVIR7puz1uJeAto8p0hicGQ3bEUYibL+l
	adF4W/cbngOYXUhBzql1C3kNmI9XZXoDcPhykmAmgWw51+Fo/hkwSpArfBy9FnTwOlk4tv9qozW
	i8AaH/RGeCKi6fyj+fPEAg6WxEA3x1bywjIoG4qVGv6PF7BMJQsW6V+G3yGgBY2O4TKmdrNReGz
	3MAZLEF9qd7j3yazeGoWT8opGjP0A4T0YKWQLnkIZGftb1GFwsFZlc0xih77VRbjiD1KhvjSEqt
	9FVKK0f6Jm1/gOmAfg2BUZbmm4wC3n24lBy+GR2GhSurVm2YDI9n2DvNVXLHc8QEYTDwP6RMWuA
	MAyYq0vAYDjwAcr+CpFfXjUsFVblPKHKzGvTtARbAOJ12f7/pkax0=
X-Received: by 2002:a05:6214:400b:b0:917:911c:74bf with SMTP id 6a1803df08f44-917911c78bbmr13631996d6.30.1790684754538;
        Tue, 29 Sep 2026 05:25:54 -0700 (PDT)
X-Received: by 2002:a05:6214:400b:b0:917:911c:74bf with SMTP id 6a1803df08f44-917911c78bbmr13631176d6.30.1790684753815;
        Tue, 29 Sep 2026 05:25:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:45 +0200
Subject: [PATCH v6 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cci-clk-fix-v6-1-62a268cccb0f@oss.qualcomm.com>
References: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
In-Reply-To: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX4tAa8OLCzsi/
 nReq2lvl73JTiFxO+6WQK7a/AIx64ZE47vvNoWB5aZ9RN7JlYEMa/imKUG70PJ99uPn/ZrOhg4H
 VkwpKx7G2Ccg8dFJJaEFbvoZ2EKOUsE=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbae53 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Y4CGMd7wAM7EkgizcVsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX94uIjjwdwfse
 Q5c/OsqPcFqc/y/uZTRFJyq0Fc1FxKhzHp69W5b+2pX2P4Rcj9QS20hHf0/aJ2f0tkDbvshmGlg
 Nx0kIVUS8lt8MkB+jAD5oXh3mjH1Dy02BAAJpEwOkhBjx4LHuO7Fs2B9LhS+KZ87O/9noU98P3P
 fyS8e9QySGmIlyMZkog00ldN2wUFT3MLo3eekbFikqgZwnIZzx7qRUUukgHTEgxocus/ZpeaNIp
 NSvoivBPdSCZj7tGHsR1RM96r0y/HKU6NLCwayDR71vj69NAFENSayhh9v8j09tZCYniOL23o6C
 1PvcPZe7RHZSj540SzFKaQyISN2ASpV36qJpAneRwvqBHbYb9vCpJ1dTilaHtt9PaBref/IIHkr
 ejrMk2qrHI9TlxMEufQFhHTdsHIKkqBfCAEJ7eA8Ie3oohPxas5srL6VYASVZlKghrs8hrJYrEk
 NJwg1sozDNmS53SZR6Q==
X-Proofpoint-GUID: EAunKb5p7PSJszkhisDwe-B0F3iSa_fO
X-Proofpoint-ORIG-GUID: EAunKb5p7PSJszkhisDwe-B0F3iSa_fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049

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

