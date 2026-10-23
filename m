Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775907;
	b=rcdQXfVFABD6Xt5mszlaZnEYSmyhhwj7ufbYGUHNAl5cbQqF+lW+FP968LB9dbCjE/lI
	 tKJediGi8SeKXvyCPRu0jCCDzIZKfjKstqLXKfyVKBV3pKdIg4JPpbxc8yxOONiibsxwe
	 89WeIC0nybV4iSZaJOSs7pq1UYwA6k09YxgcHgop+I6UUgGBYetl+iwnMshkALKGPzna9
	 XdvNTH5jOJ6ZTF5n6p1vllVj6pzufZ/JYU5PoNFOIYhqEWsirzZy8WtRXjikOMMwMzmE1
	 iyMzUpu4d4YPb0PG3P/by5U8rCLWvff76LFJeIzLbsEsCVY5FVVN+fWZmOAzuT1jDWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
	b=iE3kwsep1iFVTxWpl2MWYRyRB8wBnJzZB30uJs4HfdTKL3esW7nyjlrmrGdXL2ykwHIn
	 xMNQu4074s2Ivt788vWtQjPUR2sr84j8pKwJAOGG7heYrRP80nbkRUragcbYlYkLHpjo6
	 z8PEcuRaZBh7RqGTIN59qsHwBB2PxVvan+GlX2VCwzsOw+t1Jj56GMmQ9QkLuJLZ5wgPI
	 1XClYGyI5duVxOX7VxYa9sOIUmfjao9/DsYjXNsfIhBCnleUcmjhQxT4PGS/F17KEq0cC
	 IAKCWV1JSVYjxm3BOaXz91pFXou/XcAbSjRROpNOHetSyg7SSbb9KdjROkh8m8RDQgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/lk/pa1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE8Ac3mH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC250606DC72
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC250606DC72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/lk/pa1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE8Ac3mH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6NT73000254
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7MeUmGzDc3
	1SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=; b=h/lk/pa10xaS0W9NPAlVXuIeZy4
	nsospPMSTOXpvfI3Jws8BB8UyU7LWi03hBshcp6IGyida/0d+NaErNFwDga4ZaoI
	mzRR6EC8hGj1TMTCnBuQ0q36x8PqNH8v4KLhQsiHVcK8dDIs1CYNNtB+mlFetMNA
	X+NkLlH1DLqn7VaJ3jhogzi8m6vS2KUwoyBz9LQIOJtdt/zGQ5UmRfVzy0LAQn4T
	4O+WRUqBgUvfLgYWdM6OHSrU8maY1gLgaYNoKECXdMnMIhG4ovPCZiqX4UxqZPE5
	9BlLqSUmo5k10ToscXZiOwOgbe338CNpTysrtbZGC2v2I5vubGFiNMj79UQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b529a8610so24788946d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775905; x=1793380705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=EE8Ac3mHJr6uB1KYgk3L6WOhoXv0tq43n9ZdmqxU0UOCUohgqclzj1dpO6+Bl1rRsu
         wIotEGBHcgvLQZJ2lzQfPpDb6E9RW4QhZtNS/xuL+uowd4Sk06a6p0yV50pjHmw6vhgV
         ySucElvQFFA2m7x1djfyMk69mxMY+5Z9Uv/2U35RV7w+VtyGUcOPc3pLaI0wHb/fmWYF
         xahTK08O0jRcos0eTsd7Z1JVOujslR3zKeWGQW16LRNaoj8EEAmdAKrrRYBQA3s1gpFU
         su+4FCiK4VlMOTRbJE4zZXC3kPbWY3HpOWVKB1je4SyFQv6qGZsU84A25kA3QxjuELn7
         8ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775905; x=1793380705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=Sb60vbU2GQ4rFh9Utp+0CmlAeMf2lllX+amQPiNYgqg7tLh5qGJq0kP+UdPyo+vA6m
         AJKPQpCoxH7BsHAKNsf+aPmMwbbXKFKnRNcF2kmp/RcCz/OWdSxbgjxNUdbSCSIM6gaK
         Wyzpog6godrXIdU3TUNq50VdIlgywrO621HA3G0XLDcTXYEUtfXoshXOw9kPem8uHJHD
         CgTCO5meh1qtl7H6i9wjSoqGPExuDzFtNPSyqvOSL0O+M18lnKRacI9by0+YnZe9ygPN
         ZiB8LQB3873cSgWUc3cORzCs9rqCs+Lc4iVzLSqTjB6rjXPmWid+QycdWUWjBEzL5j0F
         hcBA==
X-Forwarded-Encrypted: i=1; AKwUvBxPuUlbAoooEYSWfDFwpt7T0m+o01WxLis+6GOZ40x6rmJ+q3yf6pzFcVuoRcaNaG+4aVo7DLovArrjEijV@vger.kernel.org
X-Gm-Message-State: AFq9FYKSyuZQ06eD8ptPdZac5VoVWyTnbr01g8LAPByhQZUoscIzHri5
	pFqR91xeLwufSMldXpp3wVa/aKgqoLpaosMNYuaLfy9JxWnRak9DDQ8d8cQNdB1/QIgFRDP4wQc
	vKGKODrfqX1tqchJhIzN+BmueY39XNfW0OWm7btTeTnpG9JoG6TDsl79I5byWhqbtV+Zg
X-Gm-Gg: AYBFou2pP8POQoPzyDihLW5I7cvuvRjTkr41h4U0cZ/PH2BCbW8FarfcSIOYRWytBsl
	rkjUdgL7zuTFzvpLXwOqyX3VtjB9y4z0EkjpzrKRrcaVLrskpKhnu4Ksx4TPeKPgqjEQ3fHz286
	oAn7WaUavn/feRUUuKa/ibRQoF/arS8rCOzINvbY+8OHEcCl8sJNJX+OdGOcv+mdJwLYKinSIPJ
	p+RXScapOKNYNMl+IEUTlfx3gzJuwLPWfugFjQn1NpbLJ5G+C7Qa712NDVxyR0FB+qYuGuqxluf
	VeYoN3cqvl7X/nDmC312weLi/81vPO3IyCPrfJOaRKC0L8yin6unTwaHn+ba2m8wi7oBr447ZN9
	OfecRB+YCJW49
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537787285a.41.1792775905079;
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537781485a.41.1792775904509;
        Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
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
Subject: [RFC PATCH 21/23] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Fri, 23 Oct 2026 18:14:31 +0100
Message-ID: <20261023171433.820092-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/F0gpTnO5UmU
 XHHkD7xPSQ6bwkp+HNtjTksUow3RqnceZcUnGm08Bx0CCbAcbOW40wYGyconBuv5azVLTFZJTKB
 4gh4vVM2+KPgZiGiPvrmTrEhgc+HVNZxHMjG0PC3Nm4is8ff2CIn5MiwGVjg53JcZS4V9H9h8rK
 ca3GCuS9ctKxZV8Hu14DslYIXHt5x72mfQqZhjK4omAlZTxYiJF4+HtlXZn+7CC1PARRvSpjd3x
 FzSDpSHlUWJH1rrdLIYIg/dGHz48Sjvjhj/DfMWkpECNROVtdM2caotHgjO2N6CLbD/eSikpnzJ
 sU+uOARlkyld0do9tDQ24VeOxIDRCe1/d+eff20YatgkK4a5ZT07+E99slWRTLTKbNMs+kuK0yq
 9nDyqyrg7GalMh7JGULLP30NuE8UaaTQG29iilr5ZRml1mYUdSbWiE4uUSzr2sw3BIZUTzE5Oav
 DAwa6mkjVWP5Zpy6BJA==
X-Proofpoint-GUID: FiKh8WLcbabWDJJ7I0ijhS3Nb4LnplpZ
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=CEpVYLg39VmosHVYFFMA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: FiKh8WLcbabWDJJ7I0ijhS3Nb4LnplpZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9enjF39Ja7zy
 8jYAuarzP3I2FrKEFZsTyprNLR9/m0/9sG26w94n110epx5BlHlHoCj0iUZg5LYE8+d2bjK2EmK
 /OUdDZ4jKlraAsoVo7Whjpyc7Vo+eaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 23a28c60bfb7..8cf7dad37c7f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/thermal.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
@@ -12,6 +13,7 @@
 #include <sound/soc-dapm.h>
 
 #include "common.h"
+#include "qdsp6/audioreach.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
@@ -24,6 +26,55 @@ struct x1e80100_snd_data {
 	bool jack_setup;
 };
 
+/*
+ * Register the thermal zones of the link's wsa884x VI DAIs, in DT order,
+ * which is the VI channel order.
+ */
+static void x1e80100_register_sp_speakers(struct snd_soc_pcm_runtime *rtd)
+{
+	struct thermal_zone_device *tzs[MAX_SP_VI_SPEAKERS];
+	struct snd_soc_dai *codec_dai;
+	unsigned int num = 0;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		struct snd_soc_component *component = codec_dai->component;
+		struct thermal_zone_device *tz;
+		struct sdw_slave *slave;
+		char tz_name[THERMAL_NAME_LENGTH];
+
+		if (strcmp(codec_dai->name, "VI"))
+			continue;
+		if (!component || !component->dev)
+			continue;
+		if (num >= ARRAY_SIZE(tzs))
+			break;
+
+		/* The name wsa884x registers its thermal zone under */
+		slave = dev_to_sdw_dev(component->dev);
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  slave->bus->id, slave->id.unique_id);
+		tz = thermal_zone_get_zone_by_name(tz_name);
+		if (IS_ERR(tz)) {
+			dev_warn(rtd->dev,
+				 "no thermal zone '%s' for %s (%ld); SP T0 kcontrol will read 0 for this slot\n",
+				 tz_name, dev_name(component->dev),
+				 PTR_ERR(tz));
+			tz = NULL;
+		}
+		tzs[num++] = tz;
+	}
+
+	/* Also drops the zones of a previous bind when none are found */
+	audioreach_sp_register_speaker_map(tzs, num);
+}
+
+static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	if (snd_soc_rtd_to_cpu(rtd, 0)->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +85,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -192,6 +245,7 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = x1e80100_snd_init;
+			link->exit = x1e80100_snd_exit;
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
-- 
2.47.3

