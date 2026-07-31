Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF0545D5C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515202; cv=none; b=FZVbZrS9l3hOnQkBa293BBwBzEy8YxbxhpqAA2+zvSTd2UT5F9pcdKkE589T4Oj6dwxg0GXLqp0s87mjDFGLkO6MX5AEAbZL8iXarARXGT41i7nbkIx3KEmasUPWabVVIu9ZAVT5OhBrOdFT+Hd9Zk0awzvQRgxD3djr+bHAE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515202; c=relaxed/simple;
	bh=g4mCtkQKfSnP9v0/IAMpPjWNvIEkTyugT0raETCPgOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSGR1iAIivtvDcm6V0dUczuTZtRFJNCkgrSYwce3KSAsZ7ODseRA/yVOB0deYRYpzs/fK2R+uRR9/yplElZFVEni2KS8k/yieZXeN8rP8g2Sq2TUoImugb5iffhUWWskWnIYjPlY0oaW93fCJasc4LfTaHrbkSM0Mgrv6TbV6/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbcGgBPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPSubTuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbcGgBPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPSubTuI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOhDP3880510
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RlnVv0Va6Mv
	enaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=; b=bbcGgBPWJ42t34W+eKcSWjNY1o7
	5WlYqYoPdDIqV4CWY+EzGjE42vyIBFLmVo46vky6Ka9Liqs/gvfV3pERqAwj+qDa
	fuxPTlfoNaxyZtzhmUf+Z9anx+EhTZ+mYUpAxD1JpJmr8GxGjPEk6GOepxajeAGN
	KfAXb0SY2RKUZ3wqfs8nvmE/Jti+1+AjJz3u+2/kYfg9H+3enwv39bOFQSr4ZAEc
	nSOY4/w0KjbejWs6MVi4kEOsVloHqIBt7DVDUU9S5riLIQdJ1DtDXSP4Yk0I76M7
	cwaHp5ahwkrVAQj8GSLCb3uI4I3fh0nwUWnn66DJnXdbZBtd9YNpBPSMFdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y175k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso11102221cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515199; x=1786119999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlnVv0Va6MvenaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=;
        b=GPSubTuICVGCf9sSrv9m70OmQDaVpkSFfOdNr5lIThANxm0k7pvuIyI3XjZc06gA8Y
         +/GTuHShQhLe+rVaQYTXerVf0CMvEozIKzDHzgiPEgPAFley7lWeN5ccoxAkAXkcv0g1
         ib9HGZrSNsyIA1UH97+y7W+Ke3mdJs/+g2VnauWcdfJmQIakVkETBBEEFQhuBLAWKFdf
         /ZyOxp4ZBeUT6cCUZ7gQiIK/gzVawLSi5JI9MRzBaoMCYVeHIH1c9UexOBaa/OzapvOG
         PHtZWryehVw1X7VvMSUPLsB/1Y/ctrbziYtMLTBepzfkxgqb8xTqcj5ZGg6Vn1Neyyn2
         WpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515199; x=1786119999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlnVv0Va6MvenaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=;
        b=ZfZ6uuCd1gKEfpFlyIoymbqGlhb+nrkIVjCGJrbNhhXj+6IKgl/soyZf5Lc5eyCSpp
         pbDd7/Xejy6TnXd5Q8w9hCA2gyKt4NUvpbL85UF+ZdPaxVVYN82XktdpMi1AsDq1C8tR
         7xUjlrRiTFJ4GN0UC7yNFtJBaPEMJ28dpK7DArTKe4GUTIxmSn8VePRKKb5clcrk9o8K
         cJCT0dMlfK/7zcH/OYqoVMN+IkYxZ6qyWubtLfpwOuWQnQ8rHSbO6MaBfGpvd5OjkH39
         hhqSEz618awwbAnt2D3MVP+sUZrN3GTf823pTFuh1kHxLfGD8DkyRZ/66icU4nM1HFKb
         fC4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpqj6NpqvqhI8Mg7Z3u//sEg57nkmgcAR9xzebAZ9+JCdjO4klJihA5vq4uQ8ySR8TtPOLF9G5mFc81TG+x@vger.kernel.org
X-Gm-Message-State: AOJu0YzlrvJwpqQpln1JF3MX8dyMJlfwytHJR3nsMoyoT+kcWQ3mEH/s
	dtdfVn/PGKdtYAmvPH4Eso+KExjC82Lg7RtXvV7A2dRKwm32d47fYDbEe7D8R3HN22m4sXykQNy
	FCrE/75z/53itHeebqllfFNhOd2UvaD3IuapxTrLyCXdklJz/T3WdybWkft1H4BtOC9KU
X-Gm-Gg: AR+sD11PgE5e8t5kotob5aeHTA//dB8a7YQIlT35mRkXN2jIVvBYAIuvZFoldKliYNw
	LkHdHlLbJd0Iow+/td3Zv7+Prc4QFHu9QfIHh/5c4mb5VGCIh3EUUe5g4b3jhIxuqyf86/fmAWP
	EGJTsYzCF79adIjcfVVn8ac5GX4Yc3eBFpOZjVHpoQB3Z4mSd4hEPzj4vJzruyYyiz/7lpEdIgV
	ARK0ozvLZFBpb3FzXFVlvu12jLxrD/T110xfMV3hNEuyQizCcnaXnLcGAWpo7iJ87kyQq2swKgT
	uk9mqKyqCs5avVt7ZEE4gRWSXTEzLpVgrFZpDjVs3VsIahhJ1EE/PuJ0CrBpkRsn0J4KLNFbmYl
	Y8MzYYxt5OZRxDQ==
X-Received: by 2002:a05:622a:250e:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b56795b87mr18816291cf.33.1785515198538;
        Fri, 31 Jul 2026 09:26:38 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b56795b87mr18815121cf.33.1785515197820;
        Fri, 31 Jul 2026 09:26:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: qcom: sc8280xp: rename snd_soc_common to qcom_snd_soc_common
Date: Fri, 31 Jul 2026 17:26:25 +0100
Message-ID: <20260731162626.1588561-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfXzlZYWdcZVF/e
 foMsc3MOlKvuhepHxcC3YcqwAjqKfZbCYOnhTPVdCltPduUJZz2lSbuSWWfyx4iaB06pu5NOSfP
 KNilcrDwD8xJvRLwZ/tZtnQbwjubK0U=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6cccc0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=a_TC-L_1r3bpA-kJg4EA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfXwhV1JIn1RWM6
 2oDPVXj/nOyE0PeW3GuCThgsfA3lS+0MBhCKa1h4TjaAUGoFxNc8N1Uq6wX1oEnmwTzmRynu/sH
 lWCDeHE55dXLYthZqBu+yWKF5OUwmesUoQPY8dwRRBNUyARdBtthEX90Vfo8C0793zOhh0on+WX
 EK/yucbkyQ/NZw1FGh5WazzWJQzVTPxYA/2c18NR4r7qPIELCKp7dgoj8iic26fPkVTAaejAYTZ
 YYkTSPpuAsIH6Vo0049/kn4LErUsxlOLSGBkoEnvo1Tlzxayy2QRMVrs+OlyCZ7lGpgmKPcBE3H
 9j649c+TF5rg0A7JlzZ9HBA1bTKbV2996LUYrNaGTGFGO3fS6f6oxX2lHjOkYlV98f49Zv/3M6G
 ItGrj/MOKq60sn7AiQAjQiuWlWvwc1+azTQZ1oEMndZqfmEkyk4wAt97cUkrWlcXtZSoCumV9uY
 jDpmDpLUVbMcw4eMl+g==
X-Proofpoint-ORIG-GUID: fdNI7JtauNzZtonmPWpheOvn01h_Hjt_
X-Proofpoint-GUID: fdNI7JtauNzZtonmPWpheOvn01h_Hjt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

The driver-local structure was named 'snd_soc_common', which occupies
the generic snd_soc_ ASoC namespace even though it is specific to the
Qualcomm sc8280xp machine driver.

Rename the type to qcom_snd_soc_common so the identifier is properly
scoped to this driver, and rename the pointer field in
sc8280xp_snd_data from 'snd_soc_common_priv' to 'priv' so the shorter
name doesn't repeat the type name at every use.

No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 60 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ce2b0633688c..d938eeda64bf 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,7 +37,7 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
-struct snd_soc_common {
+struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	int num_dapm_widgets;
@@ -57,7 +57,7 @@ struct sc8280xp_snd_data {
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
-	const struct snd_soc_common *snd_soc_common_priv;
+	const struct qcom_snd_soc_common *priv;
 	bool jack_setup;
 };
 
@@ -121,7 +121,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	if (data->snd_soc_common_priv->wcd_jack)
+	if (data->priv->wcd_jack)
 		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 
 	return 0;
@@ -175,14 +175,14 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		if (ret && ret != -ENOTSUPP)
 			return ret;
 
-		if (data->snd_soc_common_priv->codec_dai_fmt) {
+		if (data->priv->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
-						  data->snd_soc_common_priv->codec_dai_fmt);
+						  data->priv->codec_dai_fmt);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+		if (data->priv->mi2s_mclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_MCLK, mclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -190,7 +190,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		if (data->priv->mi2s_bclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_BCLK, bclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -198,7 +198,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->codec_sysclk_set) {
+		if (data->priv->codec_sysclk_set) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
@@ -269,38 +269,38 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->snd_soc_common_priv = of_device_get_match_data(dev);
-	if (!data->snd_soc_common_priv)
+	data->priv = of_device_get_match_data(dev);
+	if (!data->priv)
 		return -ENODEV;
 
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
-	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
-	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
-	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
-	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
-	card->controls = data->snd_soc_common_priv->controls;
-	card->num_controls = data->snd_soc_common_priv->num_controls;
+	card->dapm_widgets = data->priv->dapm_widgets;
+	card->num_dapm_widgets = data->priv->num_dapm_widgets;
+	card->dapm_routes = data->priv->dapm_routes;
+	card->num_dapm_routes = data->priv->num_dapm_routes;
+	card->controls = data->priv->controls;
+	card->num_controls = data->priv->num_controls;
 
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = data->snd_soc_common_priv->driver_name;
+	card->driver_name = data->priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
-static const struct snd_soc_common eliza_priv_data = {
+static const struct qcom_snd_soc_common eliza_priv_data = {
 	.driver_name = "eliza",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common hawi_priv_data = {
+static const struct qcom_snd_soc_common hawi_priv_data = {
 	.driver_name = "hawi",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
@@ -309,74 +309,74 @@ static const struct snd_soc_common hawi_priv_data = {
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common kaanapali_priv_data = {
+static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs9100_priv_data = {
+static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common qcs615_priv_data = {
+static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common qcm6490_priv_data = {
+static const struct qcom_snd_soc_common qcm6490_priv_data = {
 	.driver_name = "qcm6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs6490_priv_data = {
+static const struct qcom_snd_soc_common qcs6490_priv_data = {
 	.driver_name = "qcs6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs8275_priv_data = {
+static const struct qcom_snd_soc_common qcs8275_priv_data = {
 	.driver_name = "qcs8300",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common sc8280xp_priv_data = {
+static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.driver_name = "sc8280xp",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8450_priv_data = {
+static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8550_priv_data = {
+static const struct qcom_snd_soc_common sm8550_priv_data = {
 	.driver_name = "sm8550",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8650_priv_data = {
+static const struct qcom_snd_soc_common sm8650_priv_data = {
 	.driver_name = "sm8650",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8750_priv_data = {
+static const struct qcom_snd_soc_common sm8750_priv_data = {
 	.driver_name = "sm8750",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-- 
2.53.0

