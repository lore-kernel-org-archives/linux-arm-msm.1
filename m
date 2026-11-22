Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364109;
	b=TFbM+ZPJ5KFXLPFWB7r/uHyaXXTsjpIcKFU5bdYXDHV99WT0imGkH0H2htaIPXCObvDU
	 rdk9yolVPonGIjS/RCgunP6kukMfm0o28Fzwq9kGjhRHj+iJeIR9gcFnWmda/JFkHSJm3
	 g88Ess1Tr4j7nWHgyv3GTMaOl/DZZ99K+vzVcq/BGn7tinoOyR/S58Lt/FVd1BrZq5C0w
	 k0BXYkZe7ft8OPb4hVBJlM6pBmHIVP/X1V+arXwONrxzNa1pv84AgNa+LWpwuzJr6QyKu
	 lHmYRMKxGbrTCXCQOGPLv8E99+4DvRVP5n+I/qRsDWxUvxb3Ht0IgvjR8+a9GrteXFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
	b=iDbk+i0uS6IMK62Q2AOsKftcv3VyNpn0Mu6rCs17rAauZQmV3OcoQlzdk21PGipDh6bt
	 MMkrEQXfbQhvX1V2wgyLgxyKt+z1Tl7xl7piwQJEFNiT0crdai91ncU9+yrG8i5bw278D
	 Fo1/G5f36Qpn0jjwi6KPiuLJnycyuB1twYD/cqQeT5XVlZZwnKzZ5+pEQvCKBcY1WHNsl
	 7IiKcgVzV2vI8WU5WXYG1CiC4UTTvNI41dVcDJwgSwYXHXcVmtkerMIENIdlC/TbaDHjh
	 ht9P9OpWArdfvgNouzkCGRSiYCEfur3+FQkNLT8YWJBDncS5egfTCAS1ZWH8pmCWiKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7A60A2605
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A7A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFj03382271
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7yG2kXY4Jn
	+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=; b=Xi9h5i9bgGoE4JL5X8INRZkm2m8
	RnEGRn3wCA8EYxnsv6G26qZ4nHkFtowVLEEyeJqOHYMjyIB6AECNbsyVrldAshwJ
	3dRjCnmSGFQzENLynWfWK85ZpzWUNYzMeZSLVPWGBvd9N3fteopX7+sW0Uu6oNXG
	St/T3tX302/jQIA1Ij59xF9tUEXiuDDlD+E7e5JtTCvVvnV/2+OYKBSYjj+LfMth
	7YtyZISbGmhxMqkWqSJTsovTPutdD3sNOqjy8py14gvXoFAZN/u4qFob5OsESlHO
	bE6S57ruJAT3faqtq93hX7IWhBydWEQLOwXRm/OWaE0s1no+jgZYaK7R5rQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so549116085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364107; x=1795968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=LLDu41YZ5P7YFZzHnNeGbdTg4ztt8cJ7KSa8Qz3RCbSEQq9pb0ap///GcKmGnn02FP
         ej/je7EaUOuEe4AXS2Y/0hIuqSkVjaJuJ0k1KSm26zfgMCNQH9BzgHTZsNXhywHLXABP
         DLfU2D2+lvMXLhpXn05wt8i721rUVdZTN5OGHh650GpF/fABJ8tneObrJJChxtneZkuA
         VyxziWipfeFjBvww1Qquacg9n+aRnb89fUP3/oZm3gTcVUykMmlv2C3eQMAdOVJJzCVt
         ralzTEGc7/z1GbF4pA9UdPedhZZBLbUAvMP+BvYTMTTKejIKu5JRIaaJiRg66afmdhyv
         Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364107; x=1795968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=hbeWcdzSQ1ymd9J6nz74RbaeAb9C4B9liKkcCyTWHlUoApzelcyqU6YVrzK3xkXmp+
         z1e7xG5xTaIQpYHIPGG3CfhBqkUsjAQuSXgoBmxruA6vGOMDAiIZU9DPRZiO+ZXWViFy
         lFXd+EdAVu3R4Sxw54/gup6R3epiwKI92KwhMXPtSO/2CzLygAttFDZaLytfmQH4/z2o
         9FMGe+ikgO0GPee74KvadC49NHTreUOiWOY7DiicJq+EdcD26JHfCM5zybGfX6+eMbXh
         Rxlc+Rsoi9w09PFvk5JZFXo+/JxSe+s3AmmzuU0+ArupYe7qmLMPASARh0eizNuDZuQ4
         IKYA==
X-Forwarded-Encrypted: i=1; AL+hErGihc7XyQVQs+ZqChJJrKz9u0PCh7cx/cWGy7rqSjpM0bTuVo+e5tZmfE+tYMI/AdAXWNq/ZGW8DRh/Igr/@vger.kernel.org
X-Gm-Message-State: APuU4Z8+FVAREJt0KafRrDxWVLLYhY2GlTwV2Xh7mThL33CHZlyjeKHR
	205I6DgMVOmqJV9ubgqyyMwPb3kOQuQeWgWSnAN+0QIOkq78oLOWTMDXmuMYZgmHG29Mh8Dklb7
	BfefP6a1YjLiT79GWSfsMyWW8+5VbXSLvArOH17TSSdFOgzBJMBOthIgjJ6Drv7CBgMwE
X-Gm-Gg: AZFdTZdvFU7TJyoadvVdDm7muUjbIP4NRP4VWgh8i4foEul5QoG3ISHuIaKvo4HS+qZ
	qlws/HZcNv/F5BfJcgfZWXRYHTG7dbyy2TlS4snckXb+Ij9Z2rv4E5zWIVzd3DcBfB0bMw2F5mL
	oOddBQ4KqAWOC03Ep41wG7RJWwlbEQsttGAKKW1AzIzk8XY23u54WB5JcosWgOLE3aUgCeF5nIv
	bbzGzkWagNgMjNWrSvo6D8wknOOba978hXG/mw0H2LNv/fivSK8SUF1ltAg3CIB9ZD7Unoevyr6
	BJA0KYQvSh9YmhkaHei+k2i4v8PZW2oxRLvYnfvzJtuZjq2VrxSd6LsX7R0Ps25EW+sQ3suCpER
	8ViEnM2XkN+j9+sGTyDwVNRuFG1ZeacTJyoTHrYCBzW1gjfstkKDKPajLrztr1R6Z
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581395285a.46.1795364107015;
        Sun, 22 Nov 2026 08:15:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581389385a.46.1795364106613;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/24] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Sun, 22 Nov 2026 16:14:24 +0000
Message-ID: <20261122161437.5994-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03150b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/GJSaHgt+dJf
 AKKCOIwlc3adrlIGO9L7gO8a6DCi4h1LAcA8R3r5/eWVvItTQYmt2jeNCY0ef+2J9xF8wkey0ps
 MkoM0Xm0JFevcs59qRRvQ2dpxZTM9SU=
X-Proofpoint-GUID: AOko2b91DBtNs2dwt5A-mfFliDCpZW6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxVcbfZ0N9W6M
 m+xSx8CHB1sZ0OcPQLySNpQxHTqxvom3/Ya5fkNVY2Vcd+fqOsf0nH+6JiI83AUBcrMuKnDGBy4
 xtPkyhugDmmaanQqwydyd34XPW6z7aR8F5XTI+V9NVwW5/G80+A8NwVId7btuyXLVJsqtzcG8EV
 xUWTByuYto1/hK55hjPilPdOAAF29/8FxQRI82EDa2FMShBOylNtvRIG5lAFfNeYBoYfCUOfGIo
 u77/m7U2v6tkI0uG3pK+Ahy3VtM5pYY+J685V9o0NVCFnm44sFZeNksg7i4VjV0kkN+j0oU4EV8
 fQS5p1b87ga8skam/VczU+lEvhPVtCD074Cs+tcWjjYyFIvkaq5omwBtJ4sFlwBXrJkzCUQARTS
 y0T2p6HsJAlQ79kPOncmkfmenxi2LP6eLxnagzbc2YEKOb/63Ny7gfqr2IFI79j1dY2EJat0vsA
 BGoc2kqWtuEgxki00+w==
X-Proofpoint-ORIG-GUID: AOko2b91DBtNs2dwt5A-mfFliDCpZW6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..4a86e7dd48e8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -643,6 +645,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.53.0

