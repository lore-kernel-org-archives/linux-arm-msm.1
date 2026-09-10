Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA04A340E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052601; cv=none; b=dZbM2jjtS9dwLFBc0n4iQqrTHNwBxNf1noH+E6fOV0UMVGVlREFh3wSbtLBZclWe7kDm60zTbn91yznuHQTFNDYnJ9NQKm1SbieeX/AgSa6+nuMOZY4tdRQohUSN6C5I35mI0M9n9QQCYK604z3cbv9EKpEvuRB+nNkqGyIswYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052601; c=relaxed/simple;
	bh=gavmw53/qKFkQUKWZaxHaEfUpbny4/RhZrJskrOqgK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP0lUaJkFukc6THkQsw+3ps3mpChZCjxyuLEfdlitaoy0iSgEfwBnNSLKJTgQDF++dPGboEGc/CVB8JlZVkuXHr7k9NNu2ho6oApWvJwbZmOl7qh+m0yPSq5CbrY5Llm5WyZT+BBgmxWIOWSyPkquFI9O7DcxQStuVxqH8CXaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egHYRjQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/+c9sva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egHYRjQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/+c9sva"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7XRS215989
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=; b=egHYRjQ5c9dk857m
	1GVsrFIPz3quNeTzgIqXmil0cUdFvf7h7n9PmetE3uefTLfiZPRN3UwklzVkwzFL
	MJyVdxyR9ofchopekrSUBEqHUnwpawuVdx/t+MpdGZQGUqndTKTF5+Iw0BjW0Vj6
	gH3/fNsBmWLWdVWYDFjmSntqLFtrbrtVih45lrTNNRcKJFNFyy+kngVPRSQhWCwP
	gayKOtNztwUhJ92JinuAAqQC9cNO698N925d6z+DvgZXU8T6HIVXYrmh/1wzciZK
	Tq6ZB+WZ9ajDzN/NZzmINDsJivCFEBzn0Va1/ntIfb/xEEAkJajHdZby0XSGz9ya
	DWZA8A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9tym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso164909a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052598; x=1789657398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=S/+c9svaWmqDuL2zsRlHmSo/lQxmcKKygEA4iqQ1VpukJdxmqoxKMtjdDGYW3gkp3v
         m+Z9vpQ9118uI2tFdWp+7xvvv9iYM5505+VZE/LgosJ9gAQWamkoNMhR3iOmEKD1p5dm
         CEwRQ5JL3ZhND2VPrNXwGNxSmWtjb4GoQvD1Altpk+90dHjl9kbJr0MpRFb2V5l8VUKF
         q0Eykh7G+1OTjBLC6TLdck6hJZrUR8jHwjZ4WBweudGY5JwV0Q0NQkhjeGPXmfzJqjG8
         877LbtnXS8M7olAq/g9e/LlVmIQEcY7bUtiXni8MnYi/FAhp1v7J1ap6OLBIcASgPf49
         PCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052598; x=1789657398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=Ia8jmUB+/au/CXTHUxHvdWDzrHvetO6TiTO80RaUDCrC/TdbhPUQFTpNdWECv0ya8v
         tbaVY99uM6+ylDAs/zEd0m3OMIlVveR9l3NrwV3hRHtEzS0AaSGfYWaOz7AC8QaIi6VT
         NjFnMnDTgroZLod3l7oL3PwHjIZG7jkJ+T3rketMVb5y66pVeJtAIGc8GLGH3tzp+wPm
         zIox1SWxIe/SIZ5qGb14Pfv5jhWjxar7ld1Ub4ea7/K1TWOzK7qI704Wkxfl72TFJE5Z
         XEVR6ToNgNysCROSr7FzFEQSN6xhhcyLTalNlkkaGbMwXxEJo3Dzcuk/efyuYeQAD1X6
         SS/g==
X-Gm-Message-State: AFuF++l7KIsUAg3+/gJVgTyns8Wfn1LwBUc6B0dYuES16vl7PEN2R8Ex
	4eZVhTcQMa8aFNALuUFN2BENIrOZ6pd1F92uQN4sGHfGcCEyDYTuiVz+KD7ARM9eKRJvrlCsOmb
	FYAi6RBmfM7DhsRGMDnmWZp2ylitAOLf+Yp09jzC6VPDkougbUtJTkyAgrKk58XLT/Nv8
X-Gm-Gg: AYBFou0S9kDgSMN47Awgduc4jjOsRAN/M+EjDzsoi1MuzJjZ4daEQ3OjX/Er74SgHTL
	2ef6dXXnxyA7EJV8yklBbJv0jVyZxKv73zN8EcB3tQExbpmk9VSMP6GG5PoyTB4F3O3K8DttxP9
	G6sr8phhOHkE/C60j62UQ8UrQT2sDKggXR5nL65Mkkm5rksTwh4Zwjx5i4QcU4/vzzgYB7G6HbE
	x2Vt5PHK5AWB9jWJto1WwJTbG7pN+luSYrfsnU9XieUsjDsReFS2ZdpBjb2dgU0+97asyrkwdsq
	0M/s+t2hYK72S9w+Yuaww8ysjfStIRcDgUThnyXczKWLHW5tyGEweOoYrMElqwrBugbFtQ10e2A
	nHoWtahj2DAW8emzW5TuhN9FleAEf
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70721092637.8.1789052597867;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70720959637.8.1789052597255;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:16 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:40 +0530
Subject: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX6U4MQuYXX1I+
 GwDJTvcBQ9HYNjRvb+JcKaCaALToMt1w4sy6fQI2zEWJI32jHse/+2f+X8w57uypcLxkpjanPzV
 Su4Dvcc+ZD2C0v4itYRYhjrUcV3i+YJgQESdRPLm3kmq1HC/KJ7SKeaoSaAvrVJWuprsScK5j93
 jqUQLCKlW6qsRkMOcotYZqcfYa7S9oDqG4fGFBIvaAbDD3KdNwKckwl4ac/bBqDpFx7sXR3PuaO
 ltX3xpIwiM/6QXtJ8CZVTe1RnwNHCseddxn94kYJ9AC4b/quFj0CivYOeG8nn//LNlPDbRDsLA/
 nnfp08g6A+S3nTvBoP5WZNuSxroXwkGQLbVm3OQOokUKlo6IgVOJd76Rd+VpLM/xRN7DNajAGdO
 xI9oSo3fQKGSYHCJgEdqX4yx56kptNMa0PzqFJeFosJFMEk70nh5VWmV55gsauPSyYOqUknbCwi
 5RyMym4HIAMbtxfLrYg==
X-Proofpoint-GUID: EZeLJX8Rg8elEdAUvIxx9rs0obscdjMt
X-Proofpoint-ORIG-GUID: EZeLJX8Rg8elEdAUvIxx9rs0obscdjMt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX+iA1H8Y2/KDF
 z5gqn4fZCo+0ANmzdcrYVriZv2pbjXQr8uwIqr1YrFApz/NST2oEgEPJ/Zss1kpBef6g5hKNZMH
 ku1gPqxLxoDN98ZWPx7GA1Y9SazIEo8=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2c6b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6P8UuP444nAwg2htitIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra CQM EVK board.
The Shikra CQM platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components.

The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
via the cpu_dai_fmt field introduced in the preceding patch.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 452296a9e67d..f9fed5c37c7f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -58,6 +58,11 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -521,6 +526,15 @@ static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.cpu_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP,
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -587,6 +601,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

