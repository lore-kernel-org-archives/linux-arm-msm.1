Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA103770B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645909; cv=none; b=Mvf7Q2Za4MU7pFb7Xc9Q5wI4Z+9zWHHELUP9elevvevJV0tS9WlXV9vzn7TMqc1CUwWyeYI6QfBvbX3DGT/si52XVwE2VyCIp40DryC2HkdLaZHg92zB0d3C/WGN8KA00gtBAx2Im/Q/gn/LqQeJLviVSzyjBIucF5plB5rq6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645909; c=relaxed/simple;
	bh=wyuCd0m2Tf6gslltmhzVm2PYWYg/TizbC8o2RujD6Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvhn0vj9UOcSuIUXcb8d1m5wDlCo2aHa6Kg8IpqtYZXo1ughbbm004iviHJyUIDeTvAGgLELbn8NHJVwysug8RzCkfzmGQ9Ir7c1N9J6Z1HjiJ/gwmuBGl6PYAacnA2keVfXQustFCKqG+DdbfikVdMdl+ouU61vHuRHp+HSDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT4n0Y2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2OvGJCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT4n0Y2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2OvGJCX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0vp1841254
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKmjy7alDb+dpOY/O60rS4xgw0LLuCjkEI8V9VvwZ3k=; b=pT4n0Y2FY2mikl8r
	mbThfQJ6GaIN1Xyd0013B0mcX1IR+FqXwAE9TvHaXQSg9c7VWRxPM+BU99BBI5a6
	wysRY01xt1OYgHWlqX9TMb2Kk9/g/VLwBrrBdFpFu6YD5sIpXVrKN+SudwGZXBv3
	S/QYU8JBdwtrdqmf9txP/ctLhCzw20JAgAiw0MP+JPa5NLvsptI5bqaeTb9LONyV
	pklcqdWY4fCN/Zqlh5pGl/SQHBQawU245KL3BQWnXrTwTzAtVKwcSxOeaDikiuiO
	UmwP4+/ap4ySuGo5sC0T91kiQe2B+g15PrKIzffSUW4V/cuPlkc1oIUI3CV1mBd8
	Ij7CMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2van-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso90547111cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645907; x=1785250707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKmjy7alDb+dpOY/O60rS4xgw0LLuCjkEI8V9VvwZ3k=;
        b=W2OvGJCX7SmL5P7HTK+W3uW21A+swUR8k1gvtfTlFtV+biEiZkFlW+1oU2UmXV6Tho
         X0YeOmkuYpV6VimNAMNfgArVtl3z9ZcwZ6P+1ztQnGxRBpwEIWfedMa/D21VUGJxDY4v
         ybJkovlkRIhR9rfsBKQX1peCDfZxyX9utAIMCPkXE0Pi1A38NcyOWblpvj+PDwJ+Rr9j
         UXklXG1FUv/a5R1VpO6KF891HKdAdrDejMviCxhGN1FN9/XQQcbe5fl7nv6TXNEca45Q
         3ykYstFrGpdJ+JTsTUBxVR2hiyIPr+s3VibFTqj81bOVvF3L6rVmSEQBK1iLiorjdcmJ
         vqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645907; x=1785250707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKmjy7alDb+dpOY/O60rS4xgw0LLuCjkEI8V9VvwZ3k=;
        b=PEaVfNesMm/NVpdboUDSOnmupXvK7d20JatJuEzC0Hq5mCOI3lQdFwqEuXDvBq7pCV
         pOXEPLEPq5Pv77bHzCq4rOeg1C29Hhdq/3RGsvDWcrEpNJGGaYi/HctTwcO5lu0820dL
         DPwS23VAxqChRKCCh8PdJQ6QUg6Zc7hfbAiMX9a2+QDgWw6Qr2/kDxc6HARqFl6WXi7+
         P9WqY++uPkmZjCt/+cVv0XVVUNvltxte8jhrRlWiKB5U0Fffu78i5uyGxyJ10rWd6GHN
         cld4hJxAhDkLmhyxeVsxPAxfoGgcM8omp3p4S0wXqWCXpDC0IKG7Pvxa6Ydl7oowvcC3
         DfiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGTs9qf6mKy3dlFJRLf9Vc6H8hnRQDARumE3+1K6EFkeZXUR44wlmyyc5e86e3UkYDjPc89meYMIpTe8jt@vger.kernel.org
X-Gm-Message-State: AOJu0YwqF8ueKxRWWA149+5n6oYUK8iFu6gDK1BJVSE2641ynz5KyMSZ
	2wK3syk8OVs2iRnZuR59Bj4On8gDcqUAkpZ6CIeav8okLmSwS3NTnvAn1R0K2/zBltFc0O7BIrN
	tU7Wk8J0rhO93RtU30wX2hLyLBepbmmT3mv2agp1aAITc7EGYVm6Xj5LImaRSSwL22NHiEFwgpZ
	/z
X-Gm-Gg: AfdE7cmAlbKLhSrV/j8ouys/4XJcJOGXEmF73cG+C7XA9uiMTyRQ0w0WJmyjw+YwQkW
	YBy5CMaSiHEscQlricu2SrazE0z9HGirm8WZZsn6GqaOorzQZYAFm01ptGP1Umc2WbqDuU2bcPe
	DOL0p6IWFnRdTbNT845b5MQ8TLERhCYV8EOix5PS16GPqbOjyf2O9O7PvFllxsGEap7FeN710k3
	MCTvK8+Rbs2lA0F24PKnvpMBZ+J0m6MIV9T3031qcvjdfGlc5NetmMI7sDXsffHBmhTfxF+8UsF
	emnZYjdhwbFe2NYefe51Aahmxo/+sLvC1oc3DKzMeg4490CgXsvulGcASRYkF4Z6IuxfdrY/r4D
	X7wCiaYTK4hznSVZo+dUv3WqyUxLJkAZ3Icwf4UvpgYfVjMosz9FhMAlKKV/uboLKX97ymVyMPK
	buri5nJKwkDtrE8cbMG6KL0or52jmYTcVuhn4OpziFrw4s8f+jX14=
X-Received: by 2002:a05:622a:83:b0:519:51b1:e764 with SMTP id d75a77b69052e-5213e48be91mr169175951cf.47.1784645905920;
        Tue, 21 Jul 2026 07:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:83:b0:519:51b1:e764 with SMTP id d75a77b69052e-5213e48be91mr169175331cf.47.1784645904830;
        Tue, 21 Jul 2026 07:58:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm5875369a12.17.2026.07.21.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:58:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:58:19 +0200
Subject: [PATCH 1/3] Revert "i2c: qcom-cci: Remove unused struct member
 cci_clk_rate"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-cci-clk-fix-v1-1-5eae78700da8@oss.qualcomm.com>
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
In-Reply-To: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: jj88nJjtchXEmqJBDBmlCySjzzTVRzQ4
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f8913 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wn_r6Zk-WEjAk6jVh9gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfXwp9dC0lh4o7S
 aPs0qNcDzhvy6/xQ0S7yyk0mpxrCJ3c8qus/J0M+xqnnO9uc84rCMbEaDmb++kWq6nDKuR6AOs4
 GC5PKsJKCStXXS2AHc+o2QVo9X9Mkro=
X-Proofpoint-GUID: jj88nJjtchXEmqJBDBmlCySjzzTVRzQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX70YvPs3pq7bG
 ndaP1y1UuiM7TeUrL0FwLqQBZWq6OrI+ml00ulJOJD6Xqqp9KN67L7MUUdPrw/iPVeqSk2fwj4U
 1nUBzk6i0AAxLZVvndeeFgWI/uLUfUzgXGEgqharpLKuVgIFbnTq2/g6GleZB8+wP2a1W0jDE9D
 Nz+QfLryq7tpYgjx65tUNQmSp86ZJaBwHf00u0UZF0IXUFxFwGW+RwbQEIYT7wJpyGQDOialEjo
 3n/mfhAC3F+hWDFrYOuCvATJ5yFt/dFNd0Cxy0Zqdko67x3baHP08oXUKAoEOe/xh0Xxy0VixcF
 yBz1V9l7YEsp+/Jj9xcms6MKO8r/s5GF/QUgnPsRs2Jqhk2EiOyzbVeSLRk83KGtAiBkr3A8oCq
 3jjwIZl8g9PkjyJX0tb2pyv9t1x7hQd8Si14CgGujYJGIgrLpzDdM+hwYAc+HajShCymGBUBuGB
 HIxUlM91WWa2I0SHLNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210158

This reverts commit b641af684fc28a07bee9c808eb6c433f9d9bcec6.

The cci_clk_rate field is needed to enforce the correct CCI clock rate
at probe time. The hw_params timing values are in clock ticks and were
calibrated for a specific frequency per hardware variant, so running at
the wrong rate would violate I2C timing specifications.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 4d64895a9e9e4e0bd5e0ccb5c3cc04b282b1e4d5..19e4719f13b29b2cf60e113565b1b63f19d0e669 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -117,6 +117,7 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
+	unsigned long cci_clk_rate;
 	struct hw_params params[3];
 };
 
@@ -668,6 +669,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -701,6 +703,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -734,6 +737,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  37500000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,

-- 
2.34.1

