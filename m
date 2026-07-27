Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C43EC6B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144101; cv=none; b=RqPPcSIoELJxRHdOjLK4YbC9AbYEmvjWB8OIx+ODnk4AmLoEj+Vr/fCGkB+wiHOJ10Im5tEoEVxSfePKox0lpE485PiQo7lpqud8Rs7dpGWXZuR0AcxORlO0wvkWChuvgSkXcnAEFr2ILIojX80tqF15cnmP+z91uk2ugzlEETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144101; c=relaxed/simple;
	bh=XibWOFYzL7NFRYf/IFZlMjx/SLzb9MhUUvP0QCnS3/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qE/rIhjpRMxr/wcHyRqb0L7B6t261NIDkx53EhDYIlmkDE2VO6UxxsG1J48et1+U/ftaG7Wy86wDqg/PeKVzeJ/6Nv5M/koo8C0ksD1z5S0CNK9TgFZ7pVEBRQ96M2fc6q6SVWyn/m36s9ehZXA099G47qMqsrubhuGSFEEtreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqB5fpm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6yVKZsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqB5fpm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6yVKZsS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8fx2p3342852
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh8+gNQVycVqYf+GLM/MIdlS2XrJGv+NSL9vs+oSJNc=; b=iqB5fpm80dVFZQsy
	IvRJL5CpRqphQ4UagYGTDeR78/WB/5ch7GJzC4+7R/iUTgLqvIIPJbS2WRYy9/Qg
	oOepWsx5PNg0eQ89LMivQhNMfvPqvsGDyIJEmc6Tx6atWANTP4fYk2swvy06RPHN
	BFo2iZh0Svmv0Shb2SB3vOZ1ZOoZK1WLmwPCedj4WWpjF6EuWUzXzeq2UY6fnUrK
	ebNK1j61zv+2VD7aOQX2RDZnYLwt5Ful+3z4M4wDOKWrQIBKcygxv9GsmGnpD+i9
	R8It7UR9bf0ECzR79VQY6VWCnq7aDC20+TVSScvdj8TJ3h2u6Ip3j9liNPgt3A/e
	RD22MQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g0gmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so24922541cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144097; x=1785748897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qh8+gNQVycVqYf+GLM/MIdlS2XrJGv+NSL9vs+oSJNc=;
        b=N6yVKZsSMkGVnmiRpzwKGZMS1q+Yse0dciBYg4ASPwqEV/iZ0s48+lRG/y01w8gAAm
         7sF2kL5L/1pHcOULG7SCV7Ys6mn+R1MMD3OrVWxZtebkIGWtRtv456HJNpsFtDnvuSJv
         v5O6oExBPLJ7wDlgPc7tjnaMGyV6BJUHALfeoML9jriQHwOaHYWvoqpAj+Gao9JNl6NQ
         x8Q57K0OJxK1mINH48WI5sL6sZvzxWrDZZ2DWWOVzmWkUrK0zm0+RqNfX2QxSeQAt2tu
         37O0jf2OOF6d4crGF2RFxvEZ7/hTPTzL5NY1XXpK90vMApN0fQu5FBzigBEqCHmVbs3V
         tkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144097; x=1785748897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh8+gNQVycVqYf+GLM/MIdlS2XrJGv+NSL9vs+oSJNc=;
        b=GmofkvHlm9njWU/SxpHI5KJiJq9TmapUPYjUKGP4YBzFS/OXd1THKVT32FE21qzbo7
         QpK0tvFW6DxEh2ZRMoAFC4OxGmV4fBry/eN7jvYqHtHGtUPBa72izaCLvVyVHJwZhStJ
         tUps7mLYjwB2TMVDqtCD9KkJl+SYXfnN4++IhokIAi5VeJgiWtSt2tB+KzZvw8L6qPMR
         J9extuiyB5sGYeTz/fs6cOmq9pMGfARCSqvHbd1X87xhyHjlBgEE5yrhLH6qYhh0SOFZ
         4VzQxYHNohUjVP8bQ3trEbnFMlJyTq2HEdT8XcCfQnFs05S4NQhu3KHTxNEtkdvvjZTH
         ec6g==
X-Forwarded-Encrypted: i=1; AHgh+RpjS/J9Yq9uUt16ko598moqMzPldS1a7PRx16aasLu0NdliCXQflVUbqUHiXgmogXVZIQWz7RA53Y4Rn2lv@vger.kernel.org
X-Gm-Message-State: AOJu0YzNcwHm3s/hF3aGol7zyCbrfVDpR9KU4f3Hsl6EUmnwC8Ls3SP8
	h2qDRVcSynAcO1+VbWiy21mUWH892nm5qc/hmswZlmeFFP+QazLn0v7wftmKg528qdQffqSNvzJ
	kxYq0APNbq8Pk6fuqOKuk0SIMzQYEcoVTpw8x3OaOezMXDJZP6so1nj/mokhMi84rms4N1az+cv
	eIxdw=
X-Gm-Gg: AR+sD104QWsijuakI+UzrKgdnIKboah3hYIpoTRrs9rpIR4gAy8MgarZFsQ1Z31SU/k
	16BLv2xoPFs8fqmO3Db//MxN9p4BUomCE55VFsq+BvUpowzusRp12dhpMBrd2TO4PRHsdDsOLIE
	dSyBX5ZPreSjs61s3s/KB0N/mdQI1gEoR0WypHRIn6lz4N7bDeEBeog5H8PHDPLOUxFEl7CmZrn
	+QV/Wi1agBZ4Gp7Lg3ZNLa8oZvgQIV64mBGURAmI9SCRkB8LFfkcmRG1qnDCHWD+XSyhPRqAABN
	yE2nI0kfdaVk2rdIqcjGrlqjGtKy+A3XVwLEfZuTO7avXl6Bc9ASc2aimf1kWAtz9WQzoDauS5t
	uGkNL6Vv0BITlDpYS0P0FeLkI+iTaihqpkogZnb1TgobEryezWgdZzxyaO81ru0KJDUpZleqMG+
	26x7TQQBll5yfVuYSsCq0rGV0VojTNtpDJimlHRzrL2RLR9xCwmc7v
X-Received: by 2002:a05:622a:4d98:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-529a865ef39mr80908701cf.50.1785144097233;
        Mon, 27 Jul 2026 02:21:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4d98:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-529a865ef39mr80908511cf.50.1785144096761;
        Mon, 27 Jul 2026 02:21:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9babsm2265326a12.12.2026.07.27.02.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:21:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:21:32 +0200
Subject: [PATCH v2 1/3] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-cci-clk-fix-v2-1-c3958f28b045@oss.qualcomm.com>
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
In-Reply-To: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a672321 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Y4CGMd7wAM7EkgizcVsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MiBTYWx0ZWRfX5pK20GzPyYaz
 F477PDsL8Htv0JlmW4hLITpWs52Ru5MuJ5n4k0AJ1fTmTkjaxGqkmzcglBSzL9swSNJn8QCfLhS
 1MhuL+N+CmYIiiZpMU/AHKxkcUh1WYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MiBTYWx0ZWRfXwPf/ZFuLmbG5
 RUCBZxhIchVuA13uKufuSBUMAlsooJa6KcqYmDPu9lK1MnBsIiXSrWNOVKZyriNoak15TpebjT0
 YVBX0LhbEAdFqaKDvc9gRa9si8P8zfpVO/qEIr/D34gFCrZ2Ra7oNFDsKhisk7YIiH54AkPpPha
 juFMa+8ZsuwxEBhB4BRyVf2DX03H4+iLyZ9VcW/BrodLZllGw/KCfv065ObGisWxPgx+Pk+2r4N
 vWD/OF9wei/4g2bM9PHXa/7ndEhmgH3EXZ5csZ6NwAAHq7PutgINARM0FBcDuWJcAHENb+UHqlq
 Mbiqjm9Wf++23kdih9BmjpVw0ravBepBpCevDIwUX9/zmql+K1DMneUaXX8U+g57oGa9chYkw6n
 6D21IzyxmwK1/XXTOliOp81CkfHaX7Pf9WRsg2QacgQAppcjZG+14s68ZHPHwizp4kakjtoN94G
 pSzhliMPTxw3r0obCsg==
X-Proofpoint-GUID: HDJI__4Z9Qh-poghfH90zS5fwHi5ZKGC
X-Proofpoint-ORIG-GUID: HDJI__4Z9Qh-poghfH90zS5fwHi5ZKGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270092

The msm8953 CCI timing table is internally inconsistent. Its Standard
and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
clock, but its Fast+ timings are essentially the v2 values, which are
calibrated for 37.5 MHz. Since all masters share a single CCI clock,
no single rate can satisfy all three modes with the current table, and
the DT assigns 19.2 MHz, so Fast+ timings are wrong.

The msm8953 CCI is the same hardware version as msm8996/sdm630, which
already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
the redundant, inconsistent standalone table. This makes all three I2C
modes self-consistent under a single clock rate.

Note this requires the CCI clock to run at 37.5 MHz, the proper clock
rate will be set in an upcoming CCI patch.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 47 +--------------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 4d64895a9e9e4e0bd5e0ccb5c3cc04b282b1e4d5..23cef922351ce44d71f1691cd7e4aab274fdd196 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -772,54 +772,9 @@ static const struct cci_data cci_v2_data = {
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

