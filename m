Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAFF44BCAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116549; cv=none; b=Lw/BcZLzCKPm1RTcvULh6WuL/hFQQkSno8bNlZmUJAKxUY/2BanVo3JW5/Ip1Mg4UCo4aHIT5tUWVlHd6eJ7FXTRs0jMDrcX8s1g3DcHZooHEykhYfwEa5+BzHRsgxqYK9JwzNPzoib5oos36rujyuubkCTipUwJTP0vBfPnR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116549; c=relaxed/simple;
	bh=tlrqHG6Scd8WESdDMOGUbRo9WK+K8RvG+IkQ0ktjTFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQF3tThki6BToCQ9IJACOA8ndGQpGAiOohlSXjx/0FGXQm5PQu1jNjMoiffWYB2Oq6GalHCcLSwWf1lCUHeLQM1NXkBY/Y9BdnTVyq4iCBbDGWmEzQjv52nnRtcI1q/avm2V1/knz65CukOa5jX17Ye4zDMyABvfsP/qoR2AKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQDUitUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiireASH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQDUitUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiireASH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcdJ03479982
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=; b=jQDUitUqiuof4D1t
	efOaOKn4ORCsNMSD/LAUWzVaUIfRHppQtbWa2m6W6lHkjbuK6kd8uD7cdon5hCq6
	t+0ytCIlX4vhLDGq8XdEhWhrerlzTDKQxdPZGUY7k/NcD/5tbbAOPEfPSThchq2H
	/cQfe4T7EzeRImBn/w6v/+0h3+haRtHWM9ipXaoaR+hQ3a/SOdd3CbOQH08aB3dO
	qUgw+4pPVu51Y/HjGvbtI25NRxP5Im3MyhmO9pkv4XkyKg70X1jFR0h+OqyYuxSC
	3P/LH6L3ngbc5Ssr1+ovOz6zIoQZMlAOPZNyguHb/kI18IUhF7VMwYx5OWYw58Zl
	9MN1BA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h96q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so7593224a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116544; x=1784721344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=;
        b=YiireASH3rkxLaBZ8KzCjLsLuOLSzQqsqKJRkt+CBdNqx8UoNT5wTTJLnOUl58GUV/
         m+XXn7YWAIE2HJ3PervZc4O0ZMZAiJw78UqO/ZolbAaG8LJOcLp52febYlSmYNmyw196
         PX8TyjHYlX8paPDa1bkQp50nSkUmFybctIJ7DM9Ydo3BkZGUwcT8lzWGcZb0c/jgNKx7
         M3CTe0Pqho1m8y8Jj6wYWW0wN6F0HBzJkzfrl68c7t7AGWAIZKvo9WtldzryQmvEgMOy
         pbry69QFH1K92Mnkz8U2eYl9NgcCPa4vO9mAfjQbiBRDBEBJl/BRfZJmUK2+JmkiOgEW
         G85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116544; x=1784721344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=;
        b=dA8MqIe1jbV9qoxfXKwZQiAryWPbHvN8PD9NmUGb+E02c31n1oV6e1uolt5+FSLB6L
         lMTHtZCHwIyeVCCZocUoXJ+tj/3BzhHLCJL29ORoMU66W/04sK5Z+ZyyJ48rH4gdte5b
         KfxsncgjWosvi3dVpHjNeK2+1pIIQ6E7utGEzPyIgdbSHP8FHiYqHLJqzkGV8BMAj/LO
         kis4VV0bYVv7lOKa92r2SwLrLicSZEmv2tf7/wQGgXe5/ZT9v2LTtSwNBrVxR8V0JjZl
         ZeSifO0YZ8kYKjd+o427MmsWHXXi9kk5Lgsuoi1lr0r6i5jfBY/Ro+WFFOb4ITkZXp5D
         5ozg==
X-Forwarded-Encrypted: i=1; AHgh+RqqPPeGA+67n4+siSbv76qBF8AtUSSg5fNLHvMN4KGOCnissptmw2MTp3ijG76dv9Tn0C3kExCjoU1n52wj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xZ6s0Ipki5xSka5Md0BQe5nFb5ZS5toezFxWKZohPjjvuVXb
	5PhGncHwcQBMye9RgGUH96q1oQpNRbhesuunwhxBnz5X8/1AyCJrjKpCzesA/7rJBfkyiY4ainn
	Ic7mOtnIerdlmAdnxhWXIkjgBLITVPbJOUvMZZCPesvkhzNC6n9um2HYdZ2+VmTXkZK8d
X-Gm-Gg: AfdE7cko+ERcjA2HEuLbUFTFYbWoKBPrPrIlIapIqLLKMPFoFWe/vp7Jlk0y5RBpk7E
	fAYZVole49L3X7lVN3Hju0U4XTddZMFgIV1ObIv0w5t0Y+Vp9JaUiAgqY2UAGDoZrH4DyurCKQ2
	znwqqt/7XSViCdifvzoMpJrTzKTkb/stodBh4S8MM7VyMiBK8yIXs2KJVJCdYYWWmPo0rFaObeJ
	EgSetkit1f0Dw58+8STIUjaEwDbRKu1ipkHrJzCXU6uaZ4eirc7sZ9oGcnDU7smewjJactSBd4w
	093aSysh02Owy4M7/U1dMl0v4VrYTYQzfeo7rp+/m5/UeNTzug/p6kXdnuZveIP5/o3+zWTLYxT
	lMUfiyIDOToCNNnLSKdvAUNZikjKbKR8plLZbp50=
X-Received: by 2002:a17:90b:1c81:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38e2a01cbf9mr2556126a91.26.1784116543819;
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1c81:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38e2a01cbf9mr2556085a91.26.1784116543321;
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:25:14 +0530
Subject: [PATCH v2 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-2-16ca64c2b929@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfXxvZXmgBMiQk7
 rThBjvwDiLrpq0eLjebhUUTRuGMY2TSwC8KdhslTYHyG1hcHmI2g7WRodoxUJMPBEv66EV+LidN
 5RjZYoGD45jj+Fspiq5iNKU8RHV/LQM=
X-Proofpoint-ORIG-GUID: SNo0PxRcpp4UXjUOm563eH7j3nBjLNFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfXztvGloIz6dg5
 XD2CjMkYp51Kx/KzuThmaEFXIjiaxRL5QC+9/Ti6mfZx01MElZfjTR7PvUc0GLFKRAM/7fg1Qkc
 WxxHcj6FDnabmimiJUJDfk7AOKDgzKN1/1m20KCeu6G30tkqjNPCM0NydbgxRJ29coY3Fy+/OAk
 3lbDgQdN4o3abgx2Zo1GnHjFhggLjozShs0O+S6gbMzWsPJnC7PuNq9O6Qp/GyJ4iEj95q0+7c+
 50znLl4MErS6AG1ycf8SM3SkfOqgFhZGcAb1XAHRscocmrieOhFEFKXXkvGq0OoF+ImymYBS32j
 nfIlmncb3JhXqv9ztYU5rqM89ryC2if7I1dB+4JAHVNuydi+hSbYZ3JQ/L0TgB3/+vI2ejJRcpn
 q+DzYHO5clc8MMLldOcEe2RIqXGvfgz5W5AbbRehfy4Chzieu55NAj1ETP8NCLgVq0DSCwZzyjG
 Wqo99fEawDle2K+Lbtg==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a577540 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Rw-3s851JbwrW9yZSY0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SNo0PxRcpp4UXjUOm563eH7j3nBjLNFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150118

clk_set_rate() returns 0 on success or a negative errno on failure but
the VA macro probe function is ignoring it. Check the return value and
bail out of probe on failure.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 946051698420..dbc5795b9273 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1605,7 +1605,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	va->has_npl_clk = data->has_npl_clk;
 
 	/* mclk rate */
-	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	if (ret)
+		goto err;
 
 	if (va->has_npl_clk) {
 		va->npl = devm_clk_get(dev, "npl");
@@ -1614,7 +1616,9 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err;
 		}
 
-		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		ret = clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		if (ret)
+			goto err;
 	}
 
 	ret = devm_pm_clk_create(dev);

-- 
2.34.1

