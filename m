Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775905;
	b=hTVqNHtndbm/nu+HZe9sJmTkfa4WbOEBs/qcQzTNSzb77k82ARkhi2Lai3ptzWszdWgq
	 S+JXAyxX97aO/XdmHRL2a9GyjeWb/y4hJpL1CeT9eVqv78UKWGXVAB746fMrHkn3qx5YJ
	 aERQgSkmCaH5sHDRBsjW5ICSiRjBZ3WcifrmI8w2FJk5nsbHObk9LFPseqvzX6vO7K6Xa
	 5GR+cFm7U/z+HSDAN7/4jAKk1vcpJHNnuJS2VR1rpdDq6PPTU0NNDbQ+RWl5Yj4A9Z8Fx
	 tw2XtFif5Z31Bwyi9NkZ2KSShyonGQ+7rnQWDzyYT4G6Vh0P67RHE8QczEKTiBrXSuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
	b=anXvteUsjnrt5FkNmWgr6+kRfk1Ek+klTg/q1/z3xga8E/wJXa1udC+vuUjan424v55z
	 hTkk0Z2+roQWfmCz74QOdHExOjpkIyH5KiCxAwcEi8pMD/0mIAMfsyqr8qpVZpjnXPy3r
	 0gAR4jh1T98aXB2FlxOmL+VrHsdjLeXMU87ruIskK7fW6KpT5Cx3FSVfNacTcxbBf+f9x
	 ns8SrghENz3rHZT0LwOquQz6dMOrGFOtsH5mccZpQaGKchs+TvSuKGh9caTKx7PANLD/z
	 dJK6Yfq2P1HJD08G49lJFc5pyvGAmbfPCMxyy/NeNmj44h+nt2RR9/YPCY+k/ik/8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C5606DC59
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 549C5606DC59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3hoe2931009
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2AxabcwP1wd
	LQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=; b=eLEwDo0Y9THbq+Cv2a8kMWTVYFZ
	ffKuUL0fxL/g4CesQIjb6FWgd8miI8Te0TYsTJAufQ75f5lxf8FB7wF2U4/XpGH5
	LIoOFKaJRz1E26vatvfUB37GUpftBICkEywphBNIjf611Z/noua54FbxeBo8hgUf
	jJpyPyqJtmv5LkfjxdMheuLowvdK0OL65eJPY81D6eJxynwxG+rQMAZw5fWHXZap
	1R0aTO/5JqGRs+lRtZtWMEpiFeCNymOjIKvTZB1N/zaipbqJRN9Q7KOol+uzUPWy
	7Tu4sRKR81Ax8k/Ii7itQavDXhZARedmb72llQE+zzGFK41OR9svCnyjqpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6r8x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so151597385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775903; x=1793380703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=GgVMQG5dcObUSFXg5F8eY4fTgFCJrOqqhSSEPvhlIOopBrY8eZk2bWM+drxhpm5jSs
         wCQPWNW/DtTizX7YelbutBIzGEpbLDSpYfieUgFwkk3j4EdctdStLdB2qnILzqXnS9rS
         r9HlXun0YUL893imMWUyiAoD27NRiUhAYF+yU1gmTe5GVTnFyCESU6YKKB6JVEPt3SFv
         noTjc9GlNg0EVd/6bVZupVkLf0g6N1gFNSlcmhOgd50iGqs7wqFkIHWrRMJBwyI5Hbk9
         A5ay1crxCi4vXBHAhiFrFdF+7RC2JBEYWQ77WTj655RO0mmo1XG76/rurosVrgdKkFXt
         ncZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775903; x=1793380703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=z4QnKD3LhmMQMKjjw5Q+xlzUTpvupIGfwA8ZUIT8u/2roYF6cUsc/6vd0zXLVWCDjx
         o7FxA7SnI4811yxQBXrPXWP6hiTD9mqAbDoE8lz81q27VhWbBuhLqK4w0QrZVtiXpwKZ
         Ap+cXm+3PIylbCco8PzIe6DA7rgGpGGzJCONhog9peq/TgxRFDczVVUuUVQDae4HHOL8
         0PbqpQFWLjSpfvh4yqFayxxLGM6sGOXby6dyqH3In9ujmKe+KeUkcv+euUyBPoHkPdV9
         gOputWOewRNrhbr14IOguZD40XYKbFnR7jqA2ZWVbUvfPDUPo3qDgYucyvbXT4GajVMs
         lgWw==
X-Forwarded-Encrypted: i=1; AKwUvByqoVv3x1wVNUILdYxuQmhiKWPGDXamABurmOhPNmT3zFd54UgneavCMfm21lKYgv2gvvq842XKzYhy095B@vger.kernel.org
X-Gm-Message-State: AFq9FYLmRNde8lZ16xTrbJPc/BKjb3t4ZMk5ArUM6+8M8VTWCddIS/yH
	pUhsHhL58xE0WF4DI2WaMHNalMBnF8xmd6AFBDimIzrHNCHgBGkzgOGmBujYGhcGSyOa78md3Yo
	8WvSlZ5L5qZROVzpAtP3d+d6UKKb12tMeNyaQwNeckJRIzz2TF8Abh2nOkMOxfDTDJ2EK
X-Gm-Gg: AYBFou24aiqHEWiBeOt6lRlSbVVVydOffNXhkl8J4XsmqVmohapXArPB9u1buB+jpEs
	S26bKqX/oepaEvrgkKTcqSPc26aGsI+Vn4xnzIJOhMi7jz/8VRjjbyBz6Kl/AxxhZrDhCZEFL/l
	Rti4HKy2cP12fYQyty4LWy6d5YXcNk4LGV4xwQiLdsz8STyYhp/14Ro+MACUDMlVCS33/96RAIy
	VKdnLejkbX8UypgQZZLYngZz60UnKCo2dZ/qSLDWp6/axUpqeo3WfGvI4XbwS/A3neEenv2WwXc
	a+NQgF/9/DMyQIYb9t9wcDVLqtasZybu2xjB2bqV2BS3aht+LJBPYEdgA+Le70Weoq2RQq0yboH
	/Cv3u08ICwRCI
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520783685a.34.1792775903412;
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520777785a.34.1792775902790;
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Fri, 23 Oct 2026 18:14:30 +0100
Message-ID: <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/SFl4KR4gsVS
 HEtQmegqpOZprBRmHaAa9sotM6W6kAqOZgGhKLOuH/uCYR0xDG9HQnqHG/A6nxMbYbPBtOZ1ciX
 WxSNv3p/JxviPpyGWThIwZuIXeiOTeqy6KomHFcTJtSiv9qWHoVKTARWcXsQLxLW6CbheHlvraL
 /CC7uWERAmX3N+eSdLZ2z1Oa6KgPoetzgVXe7I8JjViIY2oLi2c/Ej7uctKmChTGCTCKbwfuJi0
 maRYyvNMA36xHfrQ6vxeBsyVAml+s7QUwgVkZhq5jMHPbumXDVGIDHz4NVzxqyHBnsb9zACYgI9
 afVi0r1xbZJf/FNkryoNcj4AneWBXT150ZwtDGf+qX0tn6M32ZCMBx3WI3f3pxUGOuONEDzC4/s
 WipNsTiwi84nv8nQM9GFbU+3y0/wuyH8m+kTF++Xapy6pwDUSImaVsuDsDeT8ExctbApKRz8o2N
 N4Vglv28Xbhr6uIO0+A==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adb96e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UI3T6_Nygtay_5UDmqkA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HcF0ZJHLr8kuAdo-ZGXokYbHkGerBH0N
X-Proofpoint-ORIG-GUID: HcF0ZJHLr8kuAdo-ZGXokYbHkGerBH0N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyt3sOvXwgCDf
 XKBMI2zr1PwXSYcLkfE9X7kRMEGhICJ2OQAya6oULPeNDNocOLMoxHOR9uyLKk1lD2nJABaPdaF
 h/Hih7+3j3RFZFVQBmvDiQuGIMRXOcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..23a28c60bfb7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -68,6 +69,25 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -175,6 +195,13 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/* The WSA playback link also carries the VI codec DAIs */
+		if (link->id == WSA_CODEC_DMA_RX_0) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.47.3

