Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7033C9429
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615056; cv=none; b=jZM0fLcqQvVxiLEIM6fkG78pe/TpDhdH308Q2mrNOVm1spkF6zHc0IutKyNRFE9AdiJluzCFgmAiveDi/2gaC7KwT0yNzy/lbJ6yCzJCD1aWJAGh3QRDczu42oc9KvKa+MiyJV+Ox7KVfb6bMy8+Tfh+o/LErfZF4fyTuV9SdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615056; c=relaxed/simple;
	bh=+aNMaCFajVHZevzqhvBUxV3A4RHGDEwQsfVeD6cIr00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTrys1OFeBJF9SbKKFgCM6WkMOfLkYwp9jsptKiztuWaxHp+ZahBHf08pFk9AEyc110Gaguhc/BxA48dWT7FcUK0BeAD7gOao10jVLvdI+mdlHFgKya64iNrWA6j0Rx9KUc0f6gQ/SNmtL/Y9N63coGsizri7y/7NsbQX/feHkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=br0TjjGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auCa9N2f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="br0TjjGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auCa9N2f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0EFE3848001
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 20:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APSHC1pcT6h1M0mEivj1xdJzv1oxGETs2NGnJFu+bB8=; b=br0TjjGOj+MNqfnE
	vHGSHlqIkgoKeAAF5cNq7914o1S74gyT4ze4QlnqmIg3hnw00j9F3Kw76EZJjvK3
	a3VwWqMzDLS1eZpiqXJ3B8APKEqqzYgf6gvu37k/7aYARCulHkHPi9HXPPPLbDpl
	bUifAms8qWtQUDWICslYT39j994SLIua2Opq3zeEiSyKEtug4WYTtqKFdvUKeddH
	DOQeZ8iNVe8xxGPCEyAbjd4nZfSLUHp1y4F7+RaTENc0aNt75SQLWxjBhIGkNTsI
	riC7IiL6mNNKSglnDT+0FtkbKUj/dt+eHT932SLkf+CJwrLC9UV2dWEL2OOKrYcu
	yEzCVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt9pc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 20:10:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4f6ac06aso29344741cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 13:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785615053; x=1786219853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APSHC1pcT6h1M0mEivj1xdJzv1oxGETs2NGnJFu+bB8=;
        b=auCa9N2fxqxOPJHyUj7NzGz1kkLK6hQ54cCmnHQmz09BW3Li6GuzUJNlJU8fInzQBZ
         Cv+dE1EmkkM8XwgagSkaSmYf74GKkf0vceVuFMtfjiD9yjXiGzN1n/gnExZX/N/Yrl3x
         w8ADxP5W9jYfMAZpJo+nXcz5s2ks1cSiHt72sycCNqrrsmxJdzNp00j25gmjLulOnUAl
         0FiEKLsu5Lgmz9c1uO6UfdtoQolQNOSTSXyPsayG0aT2kUKkS7TBrYzw2hqBuyJH4amN
         raOHf5DAsEl2EMbUpAdrTIbGEqmSrSB9Z/iPrSwf1xcnxcp5h0f9fME7N2hdxqZ2Y90h
         4sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615053; x=1786219853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APSHC1pcT6h1M0mEivj1xdJzv1oxGETs2NGnJFu+bB8=;
        b=auROQd/4Ajy69q3qnyPOnfHUjhaXh0XbDNzoNRB0ruTrobWr6d1DHQLnImlZl7lm29
         xMHeDYyHeROuDArO5L5MCwwt8aXIqHSY5Eg+t2ijmiS9TM0KdVcSMfRVXPZmmSnPEvcd
         9Q6yt/Wmwco/Kcf1WO8R9h52fRMsy6YQLF+DK6XLw255c3Rn7NbJXNIDI9XUmFQ0L/nF
         sLS20pg73LD22LFsZElM0rhdQ/BGfSJvVJCFnZGk4kguunCrWIf01XgCEf10JRykZE8n
         N3pHQsaVb9SV/PIaXuYN3y7p5hB41o4whb8neuJFcnBfNzKJ4Sq8doywusRIG9NLRIN5
         Y2qg==
X-Forwarded-Encrypted: i=1; AHgh+RprZFDKO9G2z1lA5sFK0BZSWR7bFk/5a7gDqMNG5vSY88ueAJfE+5nZrQxhYahu9GaSoXHLszdB3Sb09+ka@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf41ZuXAGC3xH7RHX4saNo/ImglYI8UujLVp45cHAXaODfYnKK
	UV5ZTu1C3P59CD2Sf2JokGh6ovuBL/5HPqiNYA6H7aeTpHtxawLoWV83xdjH/otRxqaEW58TsAW
	+u68Za7Xuz7JMxJMVMJPZRpVinVyYkbMsQSCqUn1fGXyC5Yz16XQR3jENofYfZaL6bvOf
X-Gm-Gg: AR+sD11LMZuUEkLBLrwlPt3M3aECjMo32w47MTS1Qh4eBkxUBgOkiudx+Grms8m80Db
	AUnGHxzIj4rEBTS6hMJE1cM7F/S61TUy6U+bMca3xDoDog4yCCDgLh6CCNZsS+uexXEHW39iU9D
	yYxOmdCHtJk2yYbvSBRKtTV37T6cI3gHUvyz+PdptHgZY0OzxzKXxGIRswYtBmq+atfRldReHOo
	RWf66C01B9Xkfpn4XkCKCrnTHeeclE2N6zNkbI+xGdkhsTZmCX2jFrEHEaFEesB/3mn+M8ubJpv
	fXO+eSRVPIZhs/JZCoOYQ2ebZckzuZDV04levGndfhHPx1qtpILAWsQfLrMrqlVn5XcImXwoFwJ
	zVddmwewD9vZHa+kPjZwBXe//sgDpA8dqpswLR3B/klL+Vv/mk3jXbzPt4Esaw1dtpyFo7YlXzP
	JNw9JHMF+93Z881jayo5fQFKk0ASdotipp9kKxeMzy05wKvTwTCzo+
X-Received: by 2002:ac8:7fc1:0:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52b566aa6c8mr90783681cf.11.1785615053217;
        Sat, 01 Aug 2026 13:10:53 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52b566aa6c8mr90783291cf.11.1785615052863;
        Sat, 01 Aug 2026 13:10:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm358499066b.54.2026.08.01.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:10:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 22:10:43 +0200
Subject: [PATCH v4 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cci-clk-fix-v4-1-e1d80da54e01@oss.qualcomm.com>
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfX1AhymViOaj7n
 0F9b1/uELk6o8An0mEjinIpRRkIzRHHsna9nB9fD2m5Uc2CKpz5+bNmQzttqeyxIgudxevuw2g5
 hGccdawLD93l2JOP3ZdHbPizTGAE7Jo=
X-Proofpoint-ORIG-GUID: YJXjf5sgRR-g_53F8_BZ90IuFCmK9MgC
X-Proofpoint-GUID: YJXjf5sgRR-g_53F8_BZ90IuFCmK9MgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfX1E7HgbFpj4ff
 FbkraRuyaNt9PKcw1KuF9oTXRSvetBlCy9bzU1KSj5dE7PcDVlM99nXvRQErdFB8PQ9+hsmMxuH
 0bSHSFrrYsaj5BLxVw9SFlFUeyHbtGzbraI6L8ajlHNmVFxAIi5pbum8+W392aWBszM5/tXjuVe
 z4aa40BOJ7Bil7GWCoBUYbCeIo7l7nzVdbYdoNrkO/ZXAYdhM5k8NN3yJxsR0/ybxKuJZmCKJZx
 y0kpdcEw8tsBv4rEl28ooIfAqEEnopE98r/vZMWK9EntmoSZ7Xs6NSCHmaiGP6SwgX2/y4IAb/Z
 4aeB32AdCDVB94eYH0k60MLjsNChAL/3/zd+AIgBb8dIi7VHGBBAVTlXcuF5Yoml8XONcv6EKIt
 BpaZpRiTJZMN64NWElmfalZ4hhVEwWW9LS6e3qPXZeKCpsIuUmhvFTne6c07wKcBtQ0N/mIIVyn
 lwpLg8evijP65DPPaHQ==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6e52cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Y4CGMd7wAM7EkgizcVsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010162

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

Note this requires the CCI clock to run at 37.5 MHz, the driver selects
and enforces the proper rate in following patches.

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

