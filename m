Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364124;
	b=djlRk3uYywYj1t895+BwOrgTW/+806VSD5d/ZeRzlRCAV9e+gfU6WxqfDQU17D8JZfIs
	 7v1lzEDB6ffdlcP4NcVkZRkNPr6mk3MRybcZpe5KRL0OOdrZqneGih8msRsshXEPfSDgI
	 p9d7pERiQxuVwU3A7S4BiNGwxyzWT45lDHB0qSEELgKEVV9eGpwu4YtqHWtrK/i9O8xYA
	 AoO0G9rhaZfeiSJNWdyb3UFGjy0Vrl6s+7YwErGjp8ytQYoPS1YUFuT+dgV/dD0krkYeZ
	 Y/psjylInfh95Cq2eEAEBWSRdHJhBZuIl8cNAMUZho1+j+04bRyQAAa+YfSeIsdtxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
	b=IEX38bfpeepJQpEnsMyPOy5wHEF178/TG768oDywbqZ+KqSI93fS0J45CDnq6tbj/70l
	 GvJKhrjjUYLPDqx0LcVUjSsfkutwA26s7vjhj4b7UENnws3cnSx9P0hfQPs9u2uB+OGEM
	 xflACQe6z66vZKU9YxQsd+FDabxaYtU9inktjHrVN+pgCrtWn66ntEv7bEDLsb9UJq9jK
	 8++oPdLfQXbjFM3Vqk892wymaZoH6DBWbmg5pbYyqiN5pqiLCQRw+QmEC5NWSoLqzaj/M
	 HZYEu/kADUOUeGvafKkFafhTMOqT+bb6gprJI4LrlEkTTwfh4Twv80feCvMGsaoUv+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFB606DA01
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BFB606DA01
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIw23852905
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgX1SDVgjT+
	JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=; b=e5FllKDRh9NXn6q0XQCwIuN8PWV
	fPdccPI43ldZ5vvSs2zXxfzLttSwLndRyw3JJERT6uBmHVNTKZIofj2lsOruFM0q
	oRd8dj7TtATwpvn7pQwMWzDlufbjKzB+z0lB6Vh7X/kUNZ0RLNhuGazOxVKhdblZ
	ypt/adxxFtKrAe0WlDXO53UacH5Ow5nUnRSV9ZoxPHhPnKLc1pAT3WjgtKxGBi5l
	Qf5+xpVPzNFWO9cKpXjZDOTVqaizUsK46CmxW0LNH91latgSBFPnRF9IpO8PH/CM
	lMNjqh8ql80tLqA4W+3Sb9NOZUhPLZW6cP18JeqGgn/ceEC8qoRh8Ifq+6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fbso389107085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364122; x=1795968922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=Blm1qv8gFYAPhTPUUGnqyYb0UaB9xTTs668mtHHON9gl9be+YpvDWn40lQjZLh5fJk
         XcTMD3v7I7VsZZZHaP/l2RM2mKrLrI65CyTwcfQGxOPX0nGk6lzFYOZdd8CzridqdH4T
         I5t1bIU9GsGzE2kTws8hKYuQIfwol9qrLKIn5f/Wn3fkpfbiEk9DITzwK8yWXcGwDMxA
         6YdTtzLHD4/FerRF+u3byUIKx536Fh4+s/0JrbXnK1tUp/hSUwXhRBs80+Bsg7+DX692
         rULKj6p42hBD3dHjQfNr5NYW4dTfVDJKixKWvGijsF7suv2YRlpwRSDc0QvuIz/aBXri
         Nm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364122; x=1795968922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=BDDG8mi78YzfMzF6KhdidgVe0IdxTSTsSSRkqYlTc5ouGEVzpaZd8DBggMUuPy/0D/
         +s7Zf9kH+LqK+7uWpjupy+PfYJvWqYc/otHK55sgfLFJde8R5SuG7ntqMaOIUaVGiuNU
         dMUR9H6t8JmXpwkbm5vY44LrP+YnnXRjRvuZdw5rIXCoIfFk5xeg6FgyGXD0mPwTuEiy
         d4azbE45/Gs185fKfmUUVVyTJco+jy3ikrYuh4Kj5Tv9TucUXXrW0HODLv0M3hkfz7vF
         6CIaYEbqpiUl50Q1DgUI6TE6MrqxkqJfwFM59PtoQp3lNKghJmSFWML6D9Lta+dJI4gA
         vmeg==
X-Forwarded-Encrypted: i=1; AL+hErEwKte3cvbKKJm+cRvKBUxOxNagpyb3BLLPzbXM/r7JREKwmaViLZW+wxnCzeFPqdy+vUkSOik0/0V5B/mw@vger.kernel.org
X-Gm-Message-State: APuU4Z98uDmFsJkXmCSFKVmr+CsoliisvpPROcbjoxY6vEVjqlShe/7p
	eGFe913jry4C+A3XKD59Pj44X3CrxcBGGntstvs8Hf/ybNVFWxWarZJYFiM2MBQX/QiatGG3ReF
	jVVupVu2LykVF5kwgCTU8gaNE8cYuRbF4WXXxJm8LLphQ542EypCgnSpJay2u5e4huIncp4sDZG
	zG
X-Gm-Gg: AZFdTZe/TYwahc15T4Mx3ZkKPgHEHxs7wU75LeacAnJwHLnZRYw6QWfCV6HwtCpMK7M
	eGanZICLM+IwD7KmNlPRf17beyjBEvZiybywaXh8P8u2SsrVB36TluAO32sj4yYk6WfU/xX9QYU
	dsN0Rt5KmZStr54vppjT9hFbbhzIDqQxZRQQIV8fd+o4y183UOZwHZto+zm+YBccrV0fUm50za8
	fKSJvWVEb9kEGGPp8CP74KDEeX54Ju9HtGYDzdayhF4SNwhjEt6HLBIrVagm9X1coqhreHvSbCY
	3nof5B7E33GNtVvHLQ2yICqAPtyUEbTdOimKu3JJ0HT7Yhhg1z4eptyAu6wLQDtQWjJkY02ge2Q
	vDnHcItb0XW0ohn+1hkfrEZxxGfTYJB0Sy0gQuhJ7tU7eWcvWWq4nkKnEdVhfENjN
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530302385a.68.1795364122089;
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530291085a.68.1795364121358;
        Sun, 22 Nov 2026 08:15:21 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:20 -0800 (PST)
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
Subject: [PATCH v2 21/24] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Sun, 22 Nov 2026 16:14:34 +0000
Message-ID: <20261122161437.5994-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: XgbYkfIFtVHpflNKSNpHmoHS4h3jlYN_
X-Proofpoint-ORIG-GUID: XgbYkfIFtVHpflNKSNpHmoHS4h3jlYN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6ft20y7JttZQ
 RcdpWeQfQM7GxDL1g9VRfA8FWekb7u0Im6HNNRAkWQE3jpPZxiouAUoLcARQU0KZSKWjAYQFmHM
 wO0X0TGNVjS8hcjsKUzS2BMYVPyTlXPHusC2h46D5ErlKIdcKF1jflQ22m+jmdUnnAFeGhvveAO
 ZYbvXWT9i9Fxo5ewXDX6HBF/Ul2cKN6hGrMxdSHSLGYDq7KrgO4SitGO8fRwKmbtz2hAGRe7c6o
 DE3mQXPI/36prjiqk3MBOuzcek2NQNrsdIigLchCWDDsufqzbWnAStXp+fMiM7r+63AfYUs8ODh
 Hi/XalsSnx7goGlVyfx987VYLvVB1a2W78Cldl2eRLvxCcXt6XOGa5nROq816Qki+/6gFpFe1yA
 EXhoq139ZdXHG7N+gWh7aR7wFaJQZopqXwPhgb8zUHqy1w1vSwIx3DrIofRSQSRpWPsiTaGf9R0
 FjYwhQvGQ3AyiBnFxwg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03151a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OvuEwESikzyZ2nAUfTIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7RO9u+EjZ38h
 t9OUR7w9j8HWg8JfB/mp0DhPSwt9bRaUajAjr8L/aKUUg5wE84SUrgqO1HdPzA1Oncgg34gA35U
 x9pr81JHjq7BWHqHLV2jtL0z8UaVzPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 3262fa39ceb9..9401d4702432 100644
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
@@ -24,6 +26,49 @@ struct x1e80100_snd_data {
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
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +79,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -82,6 +129,9 @@ static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
 		break;
 	}
 
+	if (cpu_dai->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+
 	qcom_snd_headset_jack_cleanup(rtd);
 	data->jack_setup = false;
 }
-- 
2.53.0

