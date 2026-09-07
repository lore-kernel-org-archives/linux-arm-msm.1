Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFFE3CCFA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788912; cv=none; b=Wysf2khwxNgC2tBfObx13LVU9gEqf2E2+z88JczbByuHQAaiq2GTlAqFOsLQZ4dBUghCt7fcxi0CZCTzyiglElKyZSfY+87CAvtRUoLp9qfSDvNTzr6bOhXTAoxWZwdxj8jojkBOZmBGnGpPcFUYBSdddGsmrzP52ikCD6eWgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788912; c=relaxed/simple;
	bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2SAFA6v0EFWsAWgnMiMCG6JkI0bepSotprg8U/c6JlejqtS5qSbeOldBBBJnmbS3QBcGet4QNcdjNJA3wpMn+m6a7KUCzfXx3QSNeYJsYgsGHop8tkK57J5MT450UA0tqw8Xn+kKwNotzx/CB7gnbjKV2nAzTwR+PVedBhxhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crK+A/ob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ka52B+2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crK+A/ob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ka52B+2p"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKs2244073
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=; b=crK+A/obJiCvunnL
	/dEIHDtFGk+mYdItTiuU14BWtI7levmQ3a4DbVt3EA8uDL2IqAaXW3kH2GYuwL6j
	HRfNBtLL6JHXYyK7zbm3nvTIwxAO7tsnIOWr6D9T3GXG4xDp/wSWwEpt5mgavr1P
	y49nuF0ZBXIGg/JGcySY6AmwElgu9ZJJRwba9S5ZwZwsmJed0rhIAZeTB+dEYu1W
	N1npiKjDB6yMiY7cOITIu6ZOFRy58n6iRiUEJLu9v6MXw6BI+NFMVMpXZj6Qs6mQ
	mQfwtgGxd593toYYSEXzjFMbH1r9uMe8qCZ0Z4LqyUnLDxfH+/sSMHGxO8FEYST8
	e5VfSA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86sf30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:48:19 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b34d7f21d0so3092160eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788899; x=1789393699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=ka52B+2pG/AOhLX9/3yjFrcnfvfKeSo/yMwq9ttIZJ1foqtJUrYWR4vyiKd0b32O78
         yQjEHyfgeXjHEW3UkbPG/XjmKqjYBuRvtuIpdDceeaJ3ZEEnsZ6JrdswSGmdfQ981QdI
         Nc+ataR948DskRhNOAvLrw0LRTf51UMYlbd1aATBkG4UUQzTKuUaNLhC2UyztFabVMSW
         2o4owfix0sCyp0qPvaqqCvgKy0uZKzeeukNqoysTRjtVxFwt+KxS4xK4WPJsdoEV9xuj
         ZMcRJImV1lSJ7jgaP0ynTQBO0rd6KyY5rQlKWn0K1I/UyNHLBKWKX+7wf5elhOXxoKx+
         iUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788899; x=1789393699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=Do7vB+yBnlQAougR9saI5LUpTjos3futsG5FUuBDhrn/QZaiaU8K+hWTSNV9zKrLsV
         Bvru06SyTZ9O3B+FxvPP1p7obdcHqhPbAR198/2mpd41jlyu+v1Ly4teisYGFfXIvF/F
         Q19NadA7tcO2YtJv1ZGoDm4oKz5enOMZBNko0LzIZv+be9QRvGkBeXJLa+oiyKjDVjhb
         GGM5QhLJfPHOjkY+4ow41ZekTFMHQZvJ1URavPukgFQ522OCQyvtfFWl8TEyqaYxeokP
         VQD4X3aiqgVFCfWJi38vW85/7gGfIt1Tajunr3J8+p6gibcZIXRQ6v/HYL9CYNGrBfRC
         L8nQ==
X-Gm-Message-State: AFuF++miy8QZfHpMltT0vFUuQs7Ffbq8CqojAMR0QCrfKJkt7Ua8qGRL
	Ht6dwJ6+tUGkk1PdWKRuMKtVJbdJQCoYmeNXnhGs2EA3+6BupfRltFTGGcWGUhrZ+lRMImxd7He
	YvvTi5FeJKfGl/oQMlzJbaV7OuHcEIHBsudzZE/78XZfDCMuEhFUahwTD/iNNmAMTExt9
X-Gm-Gg: AYBFou3iEUAqK5V4tSKF3ozU703BWOWWxbZwF20dXfUhVuwMmdSz43rZ+DmJmxqlw3X
	d08dfBswvTWKVqmJSHdqnYPCjOTpjsiPJDnoKW9HZ/W+ZUQdPT2YJpp+qJqtNMYIevQfpF9yKZg
	/cLhZNTMBReycrkaZEAAkGpwuPpOif7AssF/PdNyyGv0/zwjyhXHs/kcFedgYXxyTgO2SC7lr04
	PTNNffmLeoxY7yGATjNAH1QjwVaPPacFVO/z8XfOrwJaVwCfztfW1OjuirkUqRWork1hdpOM+9q
	fZtOdMEEO8Gt+1J0EA52gAQmzYbDXb6jmXmSIFnGjeqIG0sEXpFooOn8ehLrGei7AkmOxmXcULy
	RScZ98cxjxRHslEn9wY6hxcI9tQY80Q==
X-Received: by 2002:a05:6820:f034:b0:6b7:46fc:1ce with SMTP id 006d021491bc7-6b746fc039amr11408967eaf.45.1788788898749;
        Mon, 07 Sep 2026 06:48:18 -0700 (PDT)
X-Received: by 2002:a05:6820:f034:b0:6b7:46fc:1ce with SMTP id 006d021491bc7-6b746fc039amr11408940eaf.45.1788788898250;
        Mon, 07 Sep 2026 06:48:18 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:54 +0530
Subject: [PATCH v4 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=3195;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
 b=N384EkrvkFfhqKfz+TYMQh1EEt1S7yH8QTl2Cxsct6KXY3/ws4kStxEMeVrAqolgeXtrjW+WN
 KzWKywB677iCESUGbxHhdZRwPE9Cnr9wFuGs6biIHIFgkKfODCBF8eR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: whde-LLdtiC84X86w26Xg8U4eQeXPHU3
X-Proofpoint-ORIG-GUID: whde-LLdtiC84X86w26Xg8U4eQeXPHU3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX2KUPoVt4qEi3
 ZZORm1BPL6HftyHGxvRxnQewcDqaqm50Lhghcn7qzsJmZyje4KqNXeyCtS++U0l4D1Sd+mZ/19o
 96EmarpWWlccRXmEVJ6PDb+PNHPRyus=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ec0a3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX/P27kiRCdw4V
 DywOueOzEYW3MTJVeiO5CG1PYOnkNH/ubWuQAS/8UG4fqyuP/qFGznr9evtIvVEfCVy4ng0CZUM
 wbqsN7oo5QSaxl8ZUiy3uusOi3eCWBNt5B9DrZw6X2ABd5mm8nfdnU4tr9NayeHEwg0HRJfmkBK
 MH1JEpC6GnO5zOz4PFipRc5XRfKbSVsuLIOQVkeHNr8DL7/TM2z5PW+qaPGn5r8po0tpV0O2uza
 EZG0D/sLo3b/gPOtJMEmaI1nWE4qAmHjk4H1yiczdul0AFaYkUmb/UbodzGqz6BsGEHh7H1KAl5
 PyCYYiHmF5W+oIrqYfrjYBfvzMuzdUJQVKtuQndUl2nAhSVK6tAKuxAv5sjAUhhaZCWMm1eCugk
 TVP0s2+SxtC1BkBABNjhN/PbPvj8X4sJPBBF24qsvqkZyRE6eHYAftGZIw8iXpHTSTh7txXG3Tj
 c1qXmXG7w5lgxTljqDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
used for subsystem LPM stats since those stats were populated in RPM
MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1

