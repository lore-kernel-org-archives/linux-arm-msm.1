Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDE305047
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898511; cv=none; b=Ik3lUkGgm7gJH0aqTBeEwbqHPN4i2gDZyXYUulB9CoZK638xBC5Y3ybdjSnngMeBSUrheZ3jc9/IvClxelAAmgzHjui1E+KKq2xWJwbHITRj//fVDhhiqbSiCu3pjvIEH9yo0v1/DpJa9TAqzrxlHb8vhYK8zB1q9byZMFMUHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898511; c=relaxed/simple;
	bh=H5e5rzvT+XDlGrAuuM4HFYhvdOCaw3BI9INKwMISw7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB8/2SQYQ4/WeGp9bFf/48kdZD+ALTxmagzmEfECGGzGkbapPmfPc/V2rLR9I108hIEp9nrXunMjMYeklVwe9DCm7fkTex9DD0j0veFl94W9Bc9Y1hJfB4BEFGmkOoR4fxhdFJdfihX2G8K8amwDcwTdRPBySZQ1GfsZuV9kjU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezZY6l7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQIZv+Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezZY6l7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQIZv+Ep"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OClb3X3378001
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYKdRueXfvandbvoeWYOsKIse0WNyh1Z/arNPpEBDgw=; b=ezZY6l7Lq5I34diO
	dMsagjijZN3nZ2xHr6bcsLUd5pZAL72DZi393Pa5pStNYnKAcyY0tim3JDFDPaWr
	9TRgUMgHkUQkZ/uC2lrt91FENlf+Ox/Jx4go21vGE6zxCegzU7nZDmRZ0IX9w0Vb
	yYr2Z3qvP6oD/Nl8lxHUoaxzvPAEiUYgzoGyxht86eHehQHcKxKTB7hnNIGpfr0R
	ciBxnffagmwv78W8xsk1NIemzREkAbx9ChsWPnnfQNFbCLfz00Qs4g3eRGhrIb7u
	6y7ZdFuP9jGdyYM1m3hsiRiL2LeUzzSag1JtbzkBKT8O3UkpTJ9oWBjZ/dlpRQ79
	DAaEqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0bu76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso8136981cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898508; x=1785503308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYKdRueXfvandbvoeWYOsKIse0WNyh1Z/arNPpEBDgw=;
        b=jQIZv+EpBcsYsTwSOdJTm8Wt/8uyUvy8O4ZtJZn8kUxfw461GTCZASF+UsdxvRZ0n+
         4PDkMv2UtT1Xq1CJeRtfxc0pNs+S5p2axxmv8hLNOyqW2Ze+0dvz8cfiKEueS/1ZLxpO
         Hil/n4us/yUUSMfGoIhikYjMXUpvzxs/TCaxMJmwXuEVp3mv7um/Ji/6FlBLh6PRbNNo
         4858GIp/0PxecuirdJVKy514Vw+cwIEviJYkyTFsb13t9kl65cCSVc3WKIhyNOLAnJym
         Fc10EzYGXNWslIZmL4QhDdX9LB7arkOnPZsNlfElXKpwojpAnUyjvxyckNmePAVR6qIY
         +hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898508; x=1785503308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYKdRueXfvandbvoeWYOsKIse0WNyh1Z/arNPpEBDgw=;
        b=f3LBrnXcGgYL+nvhL3ytvRNVdFe6q0AK0ykrEXVMwu1PcOD8PtpgrU5NVgz6Pd0RoU
         91eS09/CUzUylrVPNTVZsMsu1HmqpHZ8t9idMDaXPx9oIwQFrt32GQFjZzvEhQheH3Ow
         gJ0ktm/hEGdWdtME13EBSElEUDdRUGChwF7QIdFecqDVRMOxwF7GummQ1fpP4vfZlmVi
         btSHr+6FyXBJ0XCrUQ+B6qSr/WR9ojXyicvqJhVBIzado/wPgBOL7MBoLyaH60m0CeSC
         zC6JLdxSUrl6y778DoMOoxF5zzoabevxSkiNUIsaVBjgqXrYZXL4K3JHDnyiDoWr1aIY
         96/A==
X-Forwarded-Encrypted: i=1; AHgh+RqB1ri9O76YlXr+pKVp9jgPbBXMv4wC8NWCdf9+Gzdkgucp0XpCd5vVxldGQ/IDxqtU2H2qBeIXffoZoqm2@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMv0d41KwQMGwtAh4YnsBa5WMZJovZmtxJTnox0gES7wE2hAS
	Lze3+nl6x4+hCwfLcPx+67/7YMjMqrWIa7BksUAlue8IV3GGXDddaGY90Yej5b+z+6oyqccCVRN
	uA4sVX1Gk3k/5cn1cEO1wRR2idmLOUJouRU23oEJnMYS9MUADbwICZLfmUZMSgauTGRpK
X-Gm-Gg: AR+sD121m2m+ZUnV03Oy5ZDkkXRXc+mVSK0AiG28tcm+gcDkezNpp3cYWLEfU6jZRbi
	Z7IvyiJWsVdzVseOj1V5vR8ywUR9T55h/zCD5xpEfXRxpdeuzqk2QzKuwuWOrkceJLlrLcVaTRc
	LWVOqpJPZBkSMKZnm5+k6Yu806vHbP3aL2GnWgmUGFcZz4a8A82YN17+4gb/iH9BRtYL0MSi+6H
	NeGQItcUMbGN+gdyP1gSKIyyJDvE9/dvZ/YsWquNvrqAXKs00W2Juzsp+pKPa9g3yuUREEgo3sZ
	y5tgw5ZRddAytuHm8rgYrmsei/80+GMsx6Vs3a3K49JN3cm5E1ZL77wSfLfeGeQZasTWV3G4Ziw
	Eo3XESFMN
X-Received: by 2002:a05:622a:4c1b:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-5283df9c8f0mr75839311cf.76.1784898507991;
        Fri, 24 Jul 2026 06:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4c1b:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-5283df9c8f0mr75838631cf.76.1784898507362;
        Fri, 24 Jul 2026 06:08:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm64921045e9.10.2026.07.24.06.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:08:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:08:18 +0300
Subject: [PATCH v2 1/2] ASoC: qcom: common: Add SNDRV channel map to Q6
 slot helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-1-2ca3c1250018@oss.qualcomm.com>
References: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
In-Reply-To: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H5e5rzvT+XDlGrAuuM4HFYhvdOCaw3BI9INKwMISw7o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqY2PFUc1X1WybQyAhcMxS/8hmDUV3MwI4T5PGF
 25zrAlUv4WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamNjxQAKCRAbX0TJAJUV
 VpbTEAC8QzcSJSODCtqY3ntDsOuWglN+ddtA/MGqKxYXLRl63sXblKHTBnKuKrpiBVRFqy9KxsO
 knZK1UouWmxprFIoMTPGizCS3wXZRvih/E8hs6m4C/sb089P5SZnYoFPrQ+PY2p8Rn1XaZSYuqY
 UBBQD2C7avwAc4FrevjgNkIYvXRzpnUuxGbIlCpQacRqYNmJWqdcn3+1vdKL9S+biqsw/rnVgkv
 M8KtYZaT7RAZwCmailxUknsrL4sc7G4oYF8x/Mq7CpeDPGo60v5k/moBtv34vsyot8sPCQx/d5b
 aWrdBpFnuaWvrWUVpJR5ejXPIrvRDMnIkjt9IfxAYFYrmtENnmTxvlPsoP0+SZJGAdOUW/0Ug8m
 zqv3wOiIxBLBDeP+98i/Z/EBuNy5tWl+pQDUlN18j9T8vD9vanNK5BXVJf3krzQ7PG+uUKf3VoP
 9N+OfwCPHAMPjFtpF/OJ/yPCtEdp1tckjdW1E8k6ylb+v2SjZSxDPOr4203Pgy78hTFxzxhR50B
 XUjjtBmy6lQTcarrHfAAuyzFJLv2wIfaE71EW5Ju2yaCuRj3hqIGUlGkPZGtigaK53e4bGeysM+
 Sw1fwcKXmNARv3LxS17uOqVKkP0vBDC14QB8LivCoHGp6zJitIdOat6lSiXCaJ3HsQw4M1Ioy28
 RoqBRT9UB76IVrg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: QJ7C_6xrbRyrJSytiMOcCDrB5o8gzoWX
X-Proofpoint-GUID: QJ7C_6xrbRyrJSytiMOcCDrB5o8gzoWX
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6363cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LT42eKIa1owrfrf17d8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX0ScnKx2n+k74
 Ex79vUFNHA4Vv9jJC1omSFVK/8mjbROQQgteuS9yBgue0aGLkIx1n3U4ihhv+K9MaMp44XgMOrX
 lo8hiry/3yd7nbWxgUkW1m+HJywsept5u/a1HBkp5ihS9ZeVtjz4GO3y/TF7E83KUHQWLwXFA0k
 gMXb1d1XggFvGXXHQ6tf0MdDdJ0mAdIsZIjSCg3jyhmqFzu1M3rubmort3e5aRyNZe98jFsqsls
 2ifPHlnkGVWqbJk/Y5vAUQaOEG5RLVfmGm38WPyyXnk8e3LD4QuwL/pBP5D+fFgRlP5WH2oe+yn
 21Qi/qqE/Hn74Apq9Bh9jMeRQ4mWlS2d9decmX51FHaPnV5bDR2qIETteuc2tbtOtoRHwPlDaGU
 z9ZwhZGeraVVI3uQsyC5tO56PesW0dPfo9MPVfPUpzKQTtNksLCI2vouR4XwXHm7qZ7rcKIvsxp
 AgDyuZSUa0fUpskXxpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX6uBqP0Apu2YU
 vdFgDsDNu8bXXieNj+BgzoM6H8NyVCmN8oUS3uEHGX+Yw31NDZTlDH4AS0YLY86WguHWfQfV91o
 W1FBSC5nSIAeXMiaIjZGpDeAYPPE/FI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240119

Add a small helper that converts ALSA channel map positions to the Q6 PCM
channel identifiers used by Qualcomm machine drivers.

The mapping is useful beyond a single machine driver when exposing
writable channel-map controls.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e4ff247ea47f..bba0cff6f4cd 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -6,7 +6,9 @@
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
+#include <sound/pcm.h>
 #include "common.h"
+#include "qdsp6/q6dsp-common.h"
 
 #define NAME_SIZE	32
 
@@ -172,6 +174,34 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+int qcom_snd_chmap_to_q6(unsigned int pos)
+{
+	switch (pos) {
+	case SNDRV_CHMAP_FL:
+		return PCM_CHANNEL_FL;
+	case SNDRV_CHMAP_FR:
+		return PCM_CHANNEL_FR;
+	case SNDRV_CHMAP_MONO:
+	case SNDRV_CHMAP_FC:
+		return PCM_CHANNEL_FC;
+	case SNDRV_CHMAP_LFE:
+		return PCM_CHANNEL_LFE;
+	case SNDRV_CHMAP_RL:
+		return PCM_CHANNEL_LB;
+	case SNDRV_CHMAP_RR:
+		return PCM_CHANNEL_RB;
+	case SNDRV_CHMAP_SL:
+		return PCM_CHANNEL_LS;
+	case SNDRV_CHMAP_SR:
+		return PCM_CHANNEL_RS;
+	case SNDRV_CHMAP_RC:
+		return PCM_CHANNEL_CS;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_snd_chmap_to_q6);
+
 static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	/* Headset */
 	{
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..1e8edc7e1b87 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -14,6 +14,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
+int qcom_snd_chmap_to_q6(unsigned int pos);
 
 
 #endif

-- 
2.54.0

