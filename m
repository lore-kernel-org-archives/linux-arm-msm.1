Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07CC45D5D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515203; cv=none; b=RIiJhssb4ADEGYjEvfW1mn4K7MzngN4f+3w043RqckSmGDquAzZ5RmOLvHtgfj24Il+6M1zFp/lVZTCAx7LC4T0X4tsCsdPUOlgRnnldl+uc9TkVCD5P6Rv3QSC5BFCzFJtgpzaOPIarQdutehJkCQKcpyE4frPz48dE6S4pASw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515203; c=relaxed/simple;
	bh=mMHxPAE1jm3JrAg+hfP32KMIZpGBfbu9t6UZdx2Ok7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlLWUnzWV/wnTN84FH+A34dqPO+7VTrbRSjdF21hb9rTnnPdQlk2pEYxye2/4BLdRoQs8PkBcWHp/QtfqhypExK1xSXu9cazGVH+29noRujypQesDngqfeVzUghF9jqwIO4kZlr1ClEXVfNwIDS6PUbjew3IHiWt3Eoy/2iYfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mB65o3gD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOq3yC9W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mB65o3gD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOq3yC9W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOKYU489190
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rftxYfSFV7d
	hjLGbMD+mpfrombvfWl4noqwjbZDunWo=; b=mB65o3gDAig6JSeIlgvjW4xAhNU
	4ODUzKR5f11jLHzcSxAlyuTl+pcG9ibD3bBuM59aYn2GEm767FJnjAh5ZtZYuTPO
	zJo1b5jA+pSahnpyVi+Qm0BSHLBWJEW8G+OwHp7ORHyu970r+OJ13Srt4ctHHxzx
	y+GrgxxriCkoRdIqwoGELoXyIYcIKEjK8UJJ42ilCjDEXILV8lLzE4g7aUyOJfKW
	c2fR8Prky8CU8yaE7cqeEov3a6p0MVjl0dyVdsliDGeg3477aaMN6Ll0LDT8Vxjv
	58bwRMIsQXG+Z7E8OQszU1aytE4o1zqPCzAB8jGhZ+jYdU0bMfcJXOimV/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8s5kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so159707785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515200; x=1786120000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rftxYfSFV7dhjLGbMD+mpfrombvfWl4noqwjbZDunWo=;
        b=GOq3yC9Wz8+PpnMZEXaL0PiPHmipGMTYlLCKWhCdCU9Vf1N642ENNg7tpJJmJUiN7V
         aFp3ZqXs9uy5B91VNOOYklL6yjcm8z2lXJ8P/6XTCzgXIOH3T+8N7HTQmmPqbewJvuMy
         kgYFWrh319pXnTZ+QXtGmAMKYa8MK8z77sT6/E+X6uwRe28hXQXMWsUwSz8vyHeqnWNy
         KrOsn0CE6uC0slCO3/NmujKoqT5nkLma9b7QYve89VbdlETX3Jgwig4v8bheoCevkfOJ
         7J2MoMmw1XFGEtZ5rYqiVW320n19BH2URS88bsNXhvHNLglpQim3dZIU39lp3+FwlS4B
         ARVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515200; x=1786120000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rftxYfSFV7dhjLGbMD+mpfrombvfWl4noqwjbZDunWo=;
        b=KuSZ4tt3iAwW2txKmhFhNfcxz0bri6d51sCzl4iOkHtDRpvGc2s6pd2QGWCsMz4ggn
         +6EqSS9/9IvCROCVTwHXjQvTxnA4uAsGxWijY0st+JAj5h/7MaVlMLjUcmFVusIqkEZT
         9nEby3csPt8UDBnw0PF1xpL4QzNmM/JyrobeMtfKRfVolAU5t47EKH4eMcC/zA3BxpR4
         fcQpZVd0/akjNgH6Z4+P9VPAEIrMP3fC0R3xWH7gKmg1qsaOieCsz5V7k5sIJPG9cFV3
         LcB5aEwy5A4DigGVYRUtz1vHsgwpXLFmjyMwe1VRtg+BUI+0kMr1RDmvv44Bek7FjMGh
         I8qQ==
X-Forwarded-Encrypted: i=1; AHgh+RpC2LjFWMCtkm2UZQPg6V5pZkip9TlZ7oC1aPFP81lmZzjWQhxMWll2kqmEWaGpoiBLY0QE/PaqxqG1YB4N@vger.kernel.org
X-Gm-Message-State: AOJu0YwyExPked4B3vg3U7jEnD1gPZ3oKLrfrJumy4ifh7wzUvLxHAeG
	Uz0esBUst2ib1VfVUrtAZ7h0/U23ovIJDpbkw9mqlU60+WjlnuAPJcTDPFJOc53tw89mRACuwDC
	IBH/HDVOHHoyn/FJE/vNntS9rtQZTfS/9S/HcS8nO+fypmwFj+4aeFDG/vtJjIE/BwmhH
X-Gm-Gg: AR+sD13EDt9JkCeXcFW2X+RN8NE9weWnOg2gqHKQBiURjRRY/I2M2lfRduFFOB9kRl/
	RwO17eUqbETFGnLiBxnLLCwBIgxNAAXl+kwqwN1RnZ46SouJ0B7ZbFGVRQ2Q+5fq2QdDDLKwaq5
	omXi/zHH37Y7LwKwuknXVkpZRiwFOP14Bs3nYJVORgsvuktiIblIUpvxT3aJqlFAC7vyujkLRDK
	EdZMLrwsGhpqFZaLLfREPut7Nw58QZDdj8QVvBbFEOCg7sapeuDMpyIiNTINdrxa1PCzjeaLCs9
	VvPmGvB1WJ6HS/+6VVyAXf+Bn9NhK/qYac9vBqH57gkJbCAZ8T2xrf14tDAcGn9E2NGpd+c67Sk
	z45uNWjHZSBe0ig==
X-Received: by 2002:ac8:7dce:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52b5674bea7mr15950201cf.27.1785515199885;
        Fri, 31 Jul 2026 09:26:39 -0700 (PDT)
X-Received: by 2002:ac8:7dce:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52b5674bea7mr15949421cf.27.1785515199302;
        Fri, 31 Jul 2026 09:26:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: qcom: sc8280xp: add monaco/monza controls for qcs8275
Date: Fri, 31 Jul 2026 17:26:26 +0100
Message-ID: <20260731162626.1588561-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cccc0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JiAvD5goPHFw67PJ7v0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX56bjByM4zicG
 8DYc9APLRvl12gNL9ptixv1xRABRP+v2JcLBPFBSSbKxXfkVO5sX5mHJ0TK5cNLoczoG8qV7R0t
 as9q4GWmRoExKA++LcljEAWrdiGUYzs=
X-Proofpoint-ORIG-GUID: d2-8I_zOT1yPSvpk1S56zM8g_iEDiQiu
X-Proofpoint-GUID: d2-8I_zOT1yPSvpk1S56zM8g_iEDiQiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX3ZqpU8l4kAeC
 6dtp06m4aDo6UpVRYkiKT8N8qq+Y2b56hzww2H4CEh6dxEfrGK1m/oXfpQRkH1A7jUVUXQSoZWx
 l5FJy9nGR0w9DsTdV4KYc4ApHuTdj2BLYIZaENyfxWvn9tXFsW06tOvuuZj5zyvaPtmTjSR0XHV
 aXp4l6hWNjo8eFWwRuo9EM6BdrCGxEU5MXQKCTw0b+0JRepLQhI3/9hl/4rjQpwiDdeaf+9FKuJ
 PT/0Op7JpDtqVw+w1t2s3bBVylC6GwdRKFFtdXEpe+Rbck70dQgYWABuKCIaFq2H+ycoHIvCPkV
 Uj6424xspb95u0tb8IRENSY+2RZ45Y9eN5/Ysv9tWKf7b8ueslfaTMDmTJJSA3XE64GjZEI5mYf
 rUwAyyLCFTWfq95xZdyNRfA96iFIs/cq0Oev4dY5YtIWsuOD0AOhXb8fhN+dTlLf8w+6RqxVvfa
 Wd9MaeE8Est1Z2/X/eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

Update dai-ids and add DAPM widgets, sysclk and controls required
for the VENTUNO-Q platform which uses MAX98090 codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index d938eeda64bf..912137566f94 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,6 +37,26 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static const struct snd_kcontrol_new max98090_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Receiver"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+};
+
+static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Receiver", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -171,6 +191,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
@@ -344,8 +365,12 @@ static const struct qcom_snd_soc_common qcs6490_priv_data = {
 
 static const struct qcom_snd_soc_common qcs8275_priv_data = {
 	.driver_name = "qcs8300",
-	.dapm_widgets = sc8280xp_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_sysclk_set = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
 };
 
 static const struct qcom_snd_soc_common sc8280xp_priv_data = {
-- 
2.53.0

