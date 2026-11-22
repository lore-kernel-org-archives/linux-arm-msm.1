Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364098;
	b=QstRWw98Xs79kKwv9dJPF65U7DvrldqLWbqf+FgV2BqCZNr04sLpQz9aRHgArck3+eAR
	 l34NGIXN80zUgX4vnF8SqHgLXwV1SlmP/P8YNF++Wm6gzitqTuGSvNCwFev3NPP3g7HKA
	 Dsw5BPjxo8zqLKH3xkiX56aa0NoAUNMWqNM3a7NfNhreR+ezBj5CJwylw8PEYmqIYt/+c
	 JxfmXfdZZ5jCeAMzx2brkc1Pmz5cFuqPGzZ/6OnmSdKSBwvZodivA9V+me6BvDYGo5tyC
	 Mz++rvTorrn+5ZL5Sv/oyPHCq2bpLA+lZRu9ctfYcleXuZk9INagyLXUJT7ly/xx82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
	b=xZ2xuEz3EUuSzosVg+BkwSX2xYwCvqjQU+90E3oA5Y3zLq2kCUEmWSHM7onJCtajj5by
	 RHcHxbOZmV+067eu7KbjC8NmhS+qhHXO+11HdZ4v0B1xD9qfsoGIdY4/ZyUA7zfhuXXUa
	 pzEMX09ukxHXVxyLdL0TukPHuhRBEAlX15oDfGRuXwrb7IQ8YWX2fASFYqw/ueYTWuoPg
	 R7ZP/sf5jQAzVSOAIhSBXdbzuPP8v7bI6M3d5qMK38aixccSmQA/QfSupCiymapYYMi1T
	 S1UgytSiFdI+7bx03c2vO07UNIasiPl0293zkpHR9c/LE23zDLHJ1uaKcZMjm4fulGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609F60A2607
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B609F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFip3382271
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CK8GS13yu76
	IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=; b=iIQMXipOBXcfer219SBFft7VYCe
	+Id8znt7MekKPgySSZ14jJyWkBiB+MSVe3x2b4PRdilfmK0+IgS5NjQeW5WLHWM4
	pw94meLN0i77Ge0G5sD65LM/+PRC5zlPDZjQYpV/ymU8oCEdxkVPvSQ2JTZEZmNe
	6Qih8c4tpER5SUKDFs/Y6aL3PuRxPhhwuto9xMoKSfL4YtHZxTV2mG7r39/bUYQg
	cGsUXumqzR0vZrmPBgOfV/cKQP1Tgv0tofMnc7Fh0yX5TTSSgPtS9OJ8JT/A7GjM
	wNhcJSaiR9xZRL8aeB7DasFiPaZ2uyFgn5PkR0ztVroZzK3so6aN3+Hs/Sw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dcefso54541696d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364096; x=1795968896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=JRppqu18YH5PHHQEo+s0GZY99av/5p/zbgiMImgU1LvV2oR+Hqa5+9j4f/37ohGgwf
         4O0WchXPoebdpQBX+6wUBkl191k6O/Jwfp7RvYIk3e7u2fVqaTf94NKru8vrGm0ieawx
         Rz82+Nt4QedWm2GET/zWwZvkfLIxDDRAGQ9WOZyw9jHsz3LzL9EQ2Vmu+8g4YRsE+Dfa
         c+j2hRfuBbkJGQC+rBnpKpUy8DWplEg3bEbkg+AEJdCUIt3N7GL0TW3M7+mlbvBKbN4h
         FHBzC0ciL47GU9IgtXTfygXxkD6gl528ImhZbOvg0nhRIUsvOERzGtbDeLSV54DxFN/K
         bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364096; x=1795968896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=Q44L/WNdERBQDchDmJtQHRPgOlli2THUT1je5zbjcOGVggqxa1bYZpqywKsdQOqpUa
         xV9FUCQticfLAP62QpAn4u15NUIhCzwF7NXCAyHcuQPD76iJzwMjXZj9ahKu2FTrTL9q
         L8LJC3D2AJLrCup3iv7qbyf3RozhK7ZuGzmdDp4YAkuyRI3WE7LN8f4OeJpf8KNvYtab
         XFXgNtexo7I8ib/WmEOb05p48zrIu0kTA9MTOwBrrtD1LEstoLdulMuKBGh1XQNKkoip
         9COITKQedYMnnRFLba+JTRkuNMhccSwEAtSUBeUDAFvCyC9tGfBepcDiuCUYzNlUrP0y
         UtNg==
X-Forwarded-Encrypted: i=1; AL+hErEScAuH/vBCM8fvHpoZe4J9mlc4tuF0hURIIXoey6+LclijOF6T82MLAtwGTmeFNUxyqseCoV4xg4Clz5es@vger.kernel.org
X-Gm-Message-State: APuU4Z+N0NI82lSJKZmHGjFoj7uPJW5jJw2zH00ASC+Mrkr8GKFgJgFN
	dm4YYxBv+ZcT/G0OiVtZOEdHri6FExmX2lSAbYCA1u9CrecG4FSQ/EpHG8jknmAaj3dHxJ5Vh5/
	FQkCk0qg94R06l47UFu53kB4QSKmryStC4Qi0IDEnSna+4NQP3GBQ4Snp9i/I094X7VBo
X-Gm-Gg: AZFdTZfYfo7kHVKX/pIX7MurjOwFMi8ieWXwichd4eNUv8N3PHv/8wfyfgOHHiMuoOv
	bVUBsa9E5zvxBoUTnipAxZJ/U4nQvpbXKdB3Aoh4Uuajn3qwP9gK51TgiNVGrBjpUK8hzMvs5L/
	lenO8qz8HxGuUyISYkZ09PLk8+U/AzlyO2NjFuduWCtXfmkAx8Ynk8GY2j4s9CWYf32VSHtiCkc
	Ic1eLo9ZC5llNybdieUzBd5pZaCAYP4UAHUYWRARMIfe8DDJc7NwSr0RFzTSjnR4HLGJysfsjdW
	Qdun1fQKo304WdqOoyqDNJKLfKDcFmlGoxJvIPqcYcyex1eImSQM1FkDxI9sY+74cC3iyGAJXcH
	DlYZIYfj2lWBHm9l8f3i/6oO8CqSEaSVCkwL9qg7CLEtqFHvoqf3r1vxgK8PpPEPv
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738825885a.72.1795364095916;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738820485a.72.1795364095325;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Sun, 22 Nov 2026 16:14:17 +0000
Message-ID: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031500 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NbmS5_GTq9OgXFR-vLoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxncY0oMjpxPd
 vBxCFSjEhZP4yXbklAd838QN5Ul/Ovy+pLUnza6hS8T5iMI5P5h5yqz33A+KegNf/23Q9x0O+aX
 Zy1uUYgSPiRSh5NxH94WlbBYAUz3uZY=
X-Proofpoint-GUID: 20KNyXV7oUAq-XShx0TFGCxxyekdHix9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6o9oWEYR8VS7
 E1AVnN+agVg73N2BtmoKYsrVaPW4pucmoXWYp8jxA7dq9aR1GhauA+2OoYokaYu5BFyydJuAn5Y
 Ez8wNWPu5PVP1fr0khqoiMbG3bBQhigdSKphxeCa0m0Rfz2KQL4nFdMovwKcoiN1C/AwvaHlMHc
 eLKu1qWrMBY7XD2sV3qQx6NogMDuWt5pN80PlQLf9qp4BqWWaeoJ0siAq6zZ5MRcrgqH6Ww3RL3
 qcke+M6SWtyIuBaCUFcXZsZFLznGAxU1rlmduu+qLtgNe3SMtWiVdCPIIPpbcopkBNNtHYtOIUG
 BE1Rfoq992wahLgA5oeYHS/WbzopvYnTml1cMGK1I506Ol+1PXgoNnygJ/Ia99kGkrXZGi0rXtC
 BUAt48CMSs7W1xTwuAvOnaxZT764tIIYZAzcN8TmfBoYCe1SmR7BfXJE1NbI+v5/aSGcL85BP6V
 cre8uAQfeDStSPOC+sg==
X-Proofpoint-ORIG-GUID: 20KNyXV7oUAq-XShx0TFGCxxyekdHix9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links. Stream runtime names
are suffixed with "-Playback" / "-Capture" to keep debug output
unambiguous. A small sdw_find_dir_stream() helper centralises the
"find the stream for this direction" lookup that was previously
open-coded in each callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 225 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 54 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..953a6eaae127 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,9 +5,55 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
+static struct sdw_stream_runtime *
+qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
+{
+	const char *suffix = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+			     "Playback" : "Capture";
+	struct sdw_stream_runtime *sr;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
+	if (!name)
+		return NULL;
+
+	sr = sdw_alloc_stream(name, SDW_STREAM_PCM);
+	if (!sr) {
+		kfree(name);
+		return NULL;
+	}
+	return sr;
+}
+
+static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
+{
+	if (!sr)
+		return;
+	kfree(sr->name);
+	sdw_release_stream(sr);
+}
+
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
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
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	const char *cpu_name = snd_soc_rtd_to_cpu(rtd, 0)->name;
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = qcom_snd_sdw_alloc_stream(cpu_name, dir);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
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
 
@@ -93,59 +138,106 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
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
+				if (!snd_soc_dai_stream_valid(codec_dai, dir))
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
-	sdw_release_stream(sruntime);
-
+err:
+	qcom_snd_sdw_release_stream(sruntime);
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
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			qcom_snd_sdw_release_stream(
+				sdw_find_dir_stream(rtd, substream->stream));
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
+	struct sdw_stream_runtime *sruntime;
+	int ret;
+
+	sruntime = sdw_find_dir_stream(rtd, dir);
+	if (!sruntime)
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
@@ -153,15 +245,25 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
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
+			struct sdw_stream_runtime *sr =
+				sdw_find_dir_stream(rtd, substream->stream);
+			if (sr) {
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
 
@@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+
+	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream));
 
-	sdw_release_stream(sruntime);
+	if (rtd->dai_link->multi_direction_codecs)
+		qcom_snd_sdw_release_stream(
+			sdw_find_dir_stream(rtd, substream->stream ^ 1));
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +303,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
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
2.53.0

