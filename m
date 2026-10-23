Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775876;
	b=SN610X9rQHqxTcXv1G56s91kw9+ZTgG4uzZ9YLCYwbK0h/dvN62GLjEve2feQnPGunpe
	 PVgwML5rb9fHmjE5lGKoQb+uajU2Mmm55XIJhVpshF4bCCY5aHNWD6P/3kUCpKFcdl9JL
	 33coqxz0Y5GiUiKNHFBs+4cw0mj/BNXf55hejOq0ze7uKobt/KSu14zsEStxnayeE7KCl
	 hB67X1346QSEPf1ji5nMVecuPI6dAmEPKBr8sZFT2qrNcuiAwsdOsTXdLwrX5e4LH6uy1
	 4qFSHHLskCwWzt52BMXUeRGQhqu2m98b5w52y5r2HpRXiguZAhSUgGy52q9QfBShCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
	b=EIsb8Lk204f/BHMnKweWkERwBbKYT0Py1z3UtnFnKOkLWypIfGVlJgQXz1kHZE5+j8FQ
	 rxHzLH3tU3EefDM97y8KgsveWNxi93MYF+RlGYDvseuwz/z0sLa8kKfR1s+3HlL5UzyTj
	 3rrZ/2ezvASxKk3DGi1gP6XpMPgMhcJwmUoGxZtp+q7RAHNy0NTLJZCg+ei1zTARfS9GZ
	 Gof/6vA1AccXmkiDwtyUwh6gQtFOYk8U8ZvmLSmG0da+jUmwZLV6O6dzf17AULmsbmZrP
	 yF7e/tAAC/lyl8nJu7IUryHyorhTMR3seQnx2iOVexp2wrthuQNheSAfxKmA+Ftq0Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006160A2610
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B006160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3rCR3812282
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y96nUAhjj5t
	w9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=; b=MYtFqQgIRtsZ0dkJlz26pnr2M3N
	WkEJI+rVKFuTa9hN/JI76SlNG2Eo5cSKmLuRlMop/O+4mD8w25ClYTwrrAOzuTPM
	+2ztBDL1gcrm2PCL0zmBy525SEXZ2v1VLCSbmsYykeCgEQ7us50gSt4o4l5/aDPE
	aVZLGCjjtFHSXwpwD5479O+yz0i6wfyAzWOSUZSylccNNlsDDt7J97Kt6TsewMMo
	3QvrI5G4oxnKmxGVWqdUz/7pmmMSnLMXDT1JvXbPedcM0I+aI8W5dEj6YzY+oPlO
	0M6Ckid6xaWnCgdX2QDSD3JXTp9KUwXLyV/L/K2VhAXF8Uq11UmTm/qO8ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas88955-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so222369785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775874; x=1793380674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=aCKEpEInDZPh4M3t+WJ/sUdbK8puztE3Aut2QY6pJDfdpEcAu6zKyB8nr6YUP0MtHw
         Jn8Z9oddus9TI07UgKy9gLqtE230uSzTRUP5TwJA4T8i1QkSkCBPh8zYmIkyfMKyDmy/
         uyR70CsUhe9uLT7v2FpUJPKnwRTYBqYAPFpXpYEkIpxXjNVF3qGUPW++5cvpuNwGXLh2
         2D19NFrnuw6Y18LJwV4iQgALxdm/pwYEiQJL3txx6oMylrLWUqX0i28YrbxI3KByxoEz
         I5awWQVcfFXAH8hpHS6jt1Xxv+04M8ZgHEttnklRl6KdtPTIVm7SCSYOs0VJH5YDRrYN
         9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775874; x=1793380674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=v39Ek5zuI2FPhHR+UFaF6g90WOqUsa2BeCZk/CwPMmnNJhjA9iWDfxCUJJIxpnXdS6
         LLzZTvQLsN9jLnIuNnQF/nD+NkpvqiXAxaOR8zXrwrMqE2SNv0kyIZEnaelcjO0noJEv
         aKN09Cs3salqepDSZDyvnxeNe+1Xy2NsKelWgGibUUoc7Z59Can3U1gRAIO57efYuu2x
         hPKVD7+y1xU3RC5MrdSi+o9O43c2Ymxpw2TW+iAdkPOv20iem/1sityefueiY6a9KDST
         epQKi6rB5n90a/Po07XVnH+UdhXJyZPuNMOgf23smS8c5SaivlcJqjgUs7bIy3z8h8IQ
         ANWg==
X-Forwarded-Encrypted: i=1; AKwUvBxfWHCaTWxOuraqWM/3E0QiK6r7lxaHciS7er3GhImD2iltYC/PF2926UNxaQ4ybRNHPRBa3XlfUPKiO1Zb@vger.kernel.org
X-Gm-Message-State: AFq9FYKjUe9HvFWLqR5qJOUcAjhHtgiwgWt8wRCynxwW47nyP92wgKuK
	QQLXhuP1rsCWB8/Jj5bFc8MiSma3ap7xDl2BudcBnz2MXI8M6+FRA/0Srs1gY6s1O6k8CkxzH/a
	XDyAZlLRD1wLB5BhJdbVTLHffveYrT1to73fw2pKFPOUc8LweR5SBfjB/CmdfSdVILpX/
X-Gm-Gg: AYBFou0ztEGibNubDNfs/AxonpVWlhfzs/pDeNX5wI+7vaiy734Na7Dg2VGe+4deSmC
	mJBIWylFISJzd/RC8usqiJVeHitmD3FJDbwiHZmq6Y7YosIItugnvkZm2qwNplXW/Ndl9rfKcmQ
	F+6E8YgJCh0pdxqhqe9IAbOwnoycCjoZuKKJHUVT2rjiQOH1m8iOVzUPEYlAh5j46C98dGRTyox
	UeG/xhib9EDrHMm8scUjn9OxkOT7o7hPoSBmLCNw9wHTiXADjp8fup5aWWiovQGxTOO0zvNUXfe
	axGLiQIeLkISJ/XtDW9ifkDy93jP4k+HopF0H/R9USBVfh7zJWZ7Temk+IQlwEn+BAEtL5MRx+r
	FxfQpWS66ngx4
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506244585a.10.1792775873670;
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506235785a.10.1792775872870;
        Fri, 23 Oct 2026 10:17:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:51 -0700 (PDT)
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
Subject: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Fri, 23 Oct 2026 18:14:13 +0100
Message-ID: <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwaIDlPBY8774
 LWT6g3w8KWsd9U5a0gY9KMxBCOSTwh0HaCyZJ4wEo/lN0eFn9hQmTZZD3urdRck/3Z9IYTEddhw
 OjUNmlXR//zLpkckoPO1aETAk4dcsYw=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb96c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3gksVG7zvlp-C0s-nSsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX29wSPeoteGJt
 RMMuD360jOQUayuc0dIDLfMLaYEA3/rK4olUNJt42LS1sT8cbNxld5JmGcsfQ2PXMlQ5c/8aWC+
 T7U0InAMyZK2KGOfzanPIR2IAH0qFRl0NJAzun55nOuT9IJrdhmv8z8nlaWsusSdz0WHVfARmJU
 E5dj7xEl6iXyVjVautaC3TSl/wUZbWCtM8heCEuIGwB/oiu3ROZ1ue9t7RIJyBBZQNjTDBMKO37
 3yW0l8q0h8/PKOItuHXbUkw/D/wI3nXUHPfjcBJNv7Ve6XtnINku9IAOMdHJUyITgwBJF5roh0F
 9Egrn53Lc7SML9b5IbmWhzSyC1alMwNtsFpsIyO8eXBlXzAsew1427xmBCMWDSWOfy3yIcHijpI
 wAmlCVpD4FbVd/6teWE2d6OkflsisvHSDfQSNLdL+4Igb2la2lrz4lMfylNNt/IcUo5AQTwKmBz
 Fl2Zh9+GHtMEsuBSY5A==
X-Proofpoint-GUID: HGfwuvF-1ouCMj81hlwUwrdZhc5BCmLR
X-Proofpoint-ORIG-GUID: HGfwuvF-1ouCMj81hlwUwrdZhc5BCmLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 236 +++++++++++++++++++++++++++++++++----------
 1 file changed, 183 insertions(+), 53 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e72424ce5cb0 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -8,6 +8,15 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/*
+ * Inline direction check that doesn't require snd_soc_dai_stream_valid
+ * to be exported for module use.
+ */
+static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
+{
+	return snd_soc_dai_pcm_stream_get_i(dai, dir)->channels_min != 0;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +58,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
+				  int dir, const char *cpu_name)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (sdw_dai_has_dir(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +101,125 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!sdw_dai_has_dir(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
+err:
 	sdw_release_stream(sruntime);
-
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream, cpu_dai->name);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1,
+					     cpu_dai->name);
+		if (ret) {
+			struct sdw_stream_runtime *sr;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR_OR_NULL(sr)) {
+					sdw_release_stream(sr);
+					break;
+				}
+			}
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime = NULL;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sruntime = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sruntime) && sruntime)
+			break;
+	}
+	if (!sruntime || IS_ERR(sruntime))
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +227,34 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr = NULL;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR(sr) && sr)
+					break;
+			}
+			if (sr && !IS_ERR(sr)) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -185,11 +278,37 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sr;
 
-	sdw_release_stream(sruntime);
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr)
+		sdw_release_stream(sr);
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr)
+			sdw_release_stream(sr);
+	}
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +316,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.47.3

