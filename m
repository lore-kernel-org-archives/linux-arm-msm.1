Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694273;
	b=ko6NS/p2AEHlJMiZP88ZvPoyB3KSRBWWZ6jg0XGL0F/58jPnQiKJEm6wegqX+j2x0gDC
	 hl8TMLqw1cdCSf9YbI4qO0YnUeMamXseZjKpqsDehX5mOtH+qLJqQRXzjXl6rs2pvReQ5
	 8iD8dV10U7A0/hGP8gS88KYYmEf70ZankDJFWeq/vJ5jqaubzee5hM/xpKUk+4OowOj4g
	 O8bi6k+IZQ5sA5NpOkLxNWdCI543PqtoqEFPRyycnpl9MR9lHrjkyll+UHhD8+QvMfEFM
	 J9LahuXwIWlrNPk3lk3PV5knim6rPKot1wfzR9xCLo8/L9nf4dyvCwb3DYc5ypLQP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
	b=GQuuQQmNRjADFNkxeqPVfY8IQ0rVFDdVnOBwAC0LM16glV18abcuTiO69MxpFgnu8gYL
	 xIk1yg8DzrW/b2uN04MVL64ypstvDS2BCHGV8qOA7cGb5BWqfpAWIRfWRmRqaavcUavCS
	 vQKxkl/T5qxhwWvQiy6Z+dzpeSN5eceugx5umHU6QgqooKTGoX9Ua1wSNh2aRAI/8WRNV
	 0V0e1daffFu4YkKlKzKCqtDwafmLWpCw736L8aBQ6xhI5GIC0WHycy8gWgSuhr8e2sJWD
	 5C/dDg+s7/lOVQfIJ+JzjMuJHSLJPEg1ll9qCYThP+DM67WRPRXv10IKhP85PhG2xLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D98606A681
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D98606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVVRd1275444
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCR
	uMEXVRYM=; b=F8sOxO0AnlWIWVoyxuxc1a0y6ka3xj8a2lFBTi8Y8XAWfGkqEaL
	7xyddG8pM5+v2BrzXrH4DOp5+DfF0og7QkwFth1gW9pWphGNG6stvcIp8IM6QhTy
	XIbNmKewXtPELG8nLqtZaz1p/AC3xiAq6w93TT1jRnLrju5sAa8PadpSnFR6V2DO
	2LqGOZIcJ1sIP2+7XJOBiiHulJ5oGs7NJYr21+aL8F7IacqY3HLh0araOHCvkP07
	qySkF3Ci1EpiggKLnHb4dWwitY7ESXj6AjEdhzX/L3tmpHNisb+i6yiYzRb0SaTG
	b1zWnu2iWweLB/FP5Fik1rsn5NdUS1IawzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7s53s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso1269616685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694271; x=1796299071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=IemUFAfCrNX9Nbrc/WD0J6k9sDWyxbPyy2nDZxYIjmxT5BQJAF0QZgTLtuQzW2iGVD
         SZBU/yP+sANMO1CKV8lLv+r/pgJ1Tt3N3WLMg1h3FAHQz606AKYNYUf9mbXxr+DHogKt
         BDfUiPQnI64PyKD1RDZXhznRJqgKNqgrv41TFaBSRQHpnJYoJqW5z3eFMPmxzAkuCyY/
         98KZW8Y1fPb51vaREyas8wphQOArhOb7D/Lb17Y6vCve/QXcmTdyc2hllFezNrGUETpB
         VOj3lked/50zsrc657GQW4NALNAGk/ZNmqh/xPGnJ5Euh/+F3mVCReJuvZ5IGVZdSFCG
         0VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694271; x=1796299071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=pVBsxMrYt7e3Gmu3udtN4lg4kK6f+riLMlGSrAS5dqaK7vFB9rPbyjQ22S9kCTZ0pp
         fW64Er2fSNltAuScv/PXUAPCRbPlSWgmoF+9x7h28d3e1C2Z+Ei81OZPH5DvF9W7O06p
         7yFUjxBlDGwily7U1nUSx7mA9arn2EqBpVHTf8s/j0ijYFmn29r2fUbocVr6MqX7vd8B
         BRiabM9w2gtspleu4EjDbszo7qjvCMV3dc2bhz5F5kCKae5wyyN+OgQo4oEp+Ny+ig2r
         UylqE0QinWBWo8BN6CY0xvOOIS1a2GeX3X5N+no+2dNXFnn7EHAmd1QHMRlFDO7q3o0s
         +8Ow==
X-Forwarded-Encrypted: i=1; AL+hErHNSbYV1hV2uRtSuSVJpO8GNiuJRpol/1u0G/vVN+DawISpojsSwKRCT5Ccbs97yie9cQL39XmMUF7D2+Ce@vger.kernel.org
X-Gm-Message-State: APuU4Z9UN2J4hJ0vtSMkHvCAKPkSCk1lhtW00667YlD8DAtD6Pba0IlU
	0OED4x1Vw7LUB6/mEVFHqk2pyb8ICfVD89eZtXtW1TfophgLiqnF/SaIvtvq6dDOiAnN60o3A47
	PHo+FRDXs6oRTuP19FHG+iow2zShpK0VLvxXhsqEWVjYN1NqGDd1PHWo4kf/MDxGhGLk1
X-Gm-Gg: AZFdTZc1eeVuMYjjUB/lXZCjpI1gOnq5qnXpjqbQD2MeODqlgdfrY4zaPjjizOrzGDi
	zlnf4HQNwf73UCMIgQFhFGuFxDzhCO2TbfF8eYF+zX1HVmNTl5THWgo33SfmNq4lk+i++dRVuWs
	nsPJPi/izpcp6eNiMm96LQjpWwzJ1CrWUeU75w4L43u2BsYNeowodUImQmPmCWYx14tyHhu/GD6
	DoHBgmgKY2QKl7QLRjPgYOjvah26CMgCrDF4zLX9pQjAT3Y3j5QM6u9m9jziuBgnJ3kST54IY5Q
	UmlfKpHtwRcxh+MSAViFSRtIAz/wg1ldPDMkCMl89VAotvHpQ/Xz36GuEV9dojyRaaGDJ2zMuGl
	dx+6/DQ7pkwts+jwl8XTz0BUalu0qFyDIE/Qt6bDU7gpDtB5mNvn+6pn6qkfsoRAp
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685688785a.35.1795694270782;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685686485a.35.1795694270343;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs
Date: Thu, 26 Nov 2026 11:57:38 +0000
Message-ID: <20261126115738.1765949-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXz4XAlrHFwiTE
 KymUdm7akobRyn0FmgI3ikDlqodKL7B3yiCoGbNHfgXFapB3ln6o/xjCV946kuHGrBQ0Rmnk9bf
 Fr/HdQRFZ33qpcfwnKMNjQ+CpzRYNwA=
X-Proofpoint-GUID: vtNF8NMQA1fC_QTcZYpVVlnvDKhLsuWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX0VIQxOGn7Ml5
 ERFfsB82C0KzUjcBOjH2EXAymXESw5mdFK837dV1MIKKgGY+PSSQ/PO7l+UMEoWIzsyizah+mT9
 iWtySiSMf/kpaWMhBvPPBVf9vF9PrQPH8Q1Xy4Ljs/LzbIrYuBozr4+//VypuNzQxHVzvkuMIcR
 iSVoj1Cixqw0QAKfc4IsEAZL6gdfsuRJSLCkmZ7wF1TxMV7yuRtObpmUUIojF9Jbdz+RErflII4
 OnMuAZ6D+AF5wLBa6OJPHUADACUkC/CpBCNgrmzo2+2RGPvyMbtyhdVgjceZlV89j0kFIjhbDDw
 8F2ucJj6RF1LEjWgYanHnIN7nVwXOdl9q7T0GKkbSD4C/KQ/hRVIey2+qxQlAV3qjQTTYUsXlJd
 o8piYNbIesfrFiQ1PIOHjS8CKWF550OK+tVSj7TeAv+dGyxFWDV2ETEflQIv6MKt7JguwYhbBuy
 5W/8yTxXhiAA5NN8G7g==
X-Proofpoint-ORIG-GUID: vtNF8NMQA1fC_QTcZYpVVlnvDKhLsuWS
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b081ebf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mYXs2Ah8ihme7N4CQtEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260046

The DSP supports 24 and 32-bit samples on the MI2S ports. However, the
Primary through Quinary MI2S playback DAIs only list S16_LE, except
Primary, which also lists S24_LE. This stops the machine driver from
running these backends with 32-bit slots, which some I2S sinks need,
like the ANX7625 DP bridge.

Add S24_LE and S32_LE to these DAIs. That matches the Senary and LPI
MI2S DAIs. Also have q6routing pass 32 bits per sample to the ADM for
S32_LE. Without that, the session would keep the default 16 bits.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
[riccardo: rebase onto the reworked lpass-ports, fix indentation,
 add commit description]
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 19 ++++++++++++++-----
 sound/soc/qcom/qdsp6/q6routing.c         |  3 +++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index f422346a50c6..49902abf8d2d 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -389,7 +389,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -416,7 +417,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -443,7 +446,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Tertiary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -470,7 +475,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Quaternary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -498,7 +505,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
 			SNDRV_PCM_RATE_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 0a55d1f384d4..5e532b8336df 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1170,6 +1170,9 @@ static int routing_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 			session->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		session->bits_per_sample = 32;
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

