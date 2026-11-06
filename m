Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943819;
	b=qBcv+3eylb9fgmvVU+uCBmv2A3oAwl9nMe9M6pDvyF5vm7l/mHEyfeAnO5cFDqPWG/3B
	 ogEiOUkN6H/laAgIbU4O0Fe1W4rXa4ft89xMGJlvz6yTa+pHNk3HuUnVaiWG4fa/8inlZ
	 HL8T0+bUDunYYModcF4UJNth/CHf2oB57UTCUv4UuaFsMGGIXhrtDm5qd232zgFsTPd2d
	 3keh9EpCUalKvVb1XdZKOKy6RKLtS1nbDArY9PGAZT40EC6sCnlTUa2NMwpFZPhqhyFG5
	 dLxNOZs5IiCLLnySGlq3S2TdBnviF2SiFW1pkkvVHFHehvXezgnT5cbUrgx1bjSNO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
	b=jYEAWf+sLT9yv+MJutVx60mZYvLO0Oj7A6s6ChPRHrupdnDENqCom5oGgtL2Vtz8bjNG
	 Sx2FKoqMvWm/eLmcIvxfBw6JdVoyuqztG8Eh+nIEI/+x2b7HzlKqEM52PXJu65E59U7TN
	 0cOKdCJG8SSIBxdCSgmQlZBPAUE5kMBP2DdqSYLNrsWQS7Qa9F9h/xSdiE6QMQOGg5guM
	 0HgD8Qynkc/j+uHMdRuqhPLdrappZWj1ZGiOCVpW77M8Uj7RTQbrakbTqwqmp2snVkioh
	 qUKSViAKtRc57VkfSQ9FsDEtfAKk3/eCwvaJupPbHZrtRGsy6rT8VxXwlpiqddvu1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ONuOYru/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EFF606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 05:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EFF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONuOYru/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQ9+HyqX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6400ms2264891
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 05:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0AYPyGhXJjP
	i7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=; b=ONuOYru/mlLgps54ZxIiXGxWDZ2
	Q7zKIOb7Tev3vHVwjaRLeSuOoyZcVUmrTtlp8/lwRHFkTQPTp22gE+iy4Q3pu8Jf
	8OBqJ3HQMvkjt2Jwh6WpEMZ0vlhNuOjIv+u9AtxwVVItPuq832JqvF49eL1jLQiv
	okduLc6DHLJKimzqxsz3xE00rhiv5tSwF5OVgJZKPBeVk2O4RvyI2rzLNlkQRXEC
	h/OiOeKMQb1neyPo/N7aLpSFtKPpaAfHlhJyeLgJOynJHvAnoJxFMvZ/ZUxfaR0m
	fawM5xqI6za2sf6IjxIQPH3TUB6evgfJVr/kcw66AYJGgBpIO5n7a/Ezd2g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9h3eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:43:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b347619fe7so2170287b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943817; x=1794548617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=QQ9+HyqXBkUtqeCFKopjSAIw5P12Xus/dId9lzrOZKAZRMGLVQ8vEdlUZsRhr+6C9l
         r5Tr4d8KlrUzETo3gcCAvjnaHYaiK/kb+APnKO/jyQKCaPjtWACJq13rR94ZEKJNmuHP
         TTbJBDSUMv91xLMqAJb0oNwrFFjLsX7Dt2RLC8u22vSM63PAvERey7PL5JjIDX7y0SZo
         1U9+cOJBOaDx/RbA8C+qbn+PQSMxvQrL+O0SCangDhYjPlURG7pVd4dRK54GUSOVCAMo
         fR/cFtqCTrdX58Mvcyj8a16v1zcws6bYomIVcOdCD3vKr+RuHCBB78jyXbDO31ArNmO8
         FfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943817; x=1794548617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AYPyGhXJjPi7yg7ckh4da4RrrkEkrMnuyzfOsMC3hY=;
        b=KOJINkqrxdgGWqL1/YID5C22EdytxPIMT0ansQhjVrDi+0gtwRwKp+BiKI2ufnq4FO
         g3lHxbv960ohQioCEgI67UxrOLkTN4sloBB8Pnq0nOl8QtO5r6wY5JYOlZmEGFMQdWZK
         1N7CxUvWOQYJB8/sMsUnw6iWuI9B7xIAVtDgCY03/fp1+sTDS9eYhq/j8b34+TxgPDOc
         7baq7zKSp1qGT6Bwa1Z3QTjFf7OYM7cc0lM4W5XCbZ2NkznQ9J7fYgEpiA1WbvdLcYrd
         15U30ATQFzZkPgelRZXUw8mQ38lsKv48s+RG7NVpMvnWEUyWI2rQXMOSqakFFSC1X7tb
         cXow==
X-Forwarded-Encrypted: i=1; AL+hErEQxWZUDaHauOzH+NqU+CeH2xatySURtxhCsMlM4WdiV2KimBVI5ZGtNh8s4+/unyYmmHYUTL/SciLvjTfe@vger.kernel.org
X-Gm-Message-State: APuU4Z+leGmjU6maTH9cPrZsTyxKOX7g3kGowhMLS+otdt6ib+ECBsmr
	1LZhkIxjhig/8MpROMdkQr8qKuhSLh4u8uFmanHIYjcEANMOLe/3K45KPP9WE68duyuYbdt7AiO
	GV4+hbOwUCJ9azw9044MSFJusb0xq2aOpZj77az6Ucw8ap93PmvpB0tQn9RuypcOsVik+
X-Gm-Gg: AYBFou1RDO1f5Zpa3tkd1XbKeR/09EbOW5IuQ3o4Q6lLeXIjMX4cM9a1iXd7skbn7ky
	nrjORraLZf/mYujq2UGeZNnulQmOPo8kr9gtR8O+rs9ku7XKTjBTHa9DGX2L6aX+ZDzLfERUx3P
	mLAdEYpKqypoLSxdpM0G9STnCP2TKmZb9Z33CpKA72A3hWj0wNzjd6o79KjqQsH8bJ6mBzIFzSB
	SBUL9qhpTFOr73OwhCUsVD2lxn9yOrvx3UtST6bHIm0XoRKXKGPjE/sUXKWPY9hz0oaDRWyGSRC
	FWN/lpl2ZYxq46b7N5ALueVGCh05TPiHmjajVhJsw2K9rBveEN88VQsnlI5ms7107y7nIWfImLR
	hroVYL+vG1EdFxdFONZS5iPKeI3onbMnBILhgaE9sGoodc2GXcgQdrie9CBpZOpmU5BM8v5fOGO
	zri2KY/LqVv30LGV9+qvWGY6nurzKb3McLrA==
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126747b3.58.1793943817252;
        Thu, 05 Nov 2026 21:43:37 -0800 (PST)
X-Received: by 2002:a05:690c:6210:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b3419b7e4emr7126607b3.58.1793943816751;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: soc-core: copy the DAI link names into the card
Date: Fri,  6 Nov 2026 00:43:32 -0500
Message-ID: <20261106054333.2748248-2-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: SSn4wO6jpXbJN9o7ciFM-d3TyxENQRkb
X-Proofpoint-GUID: SSn4wO6jpXbJN9o7ciFM-d3TyxENQRkb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX8AXWL8ID4G+N
 F7qmy0mfzqMcqror0iHH2OYvyIy05QLrk4shHZv3C7MzdmZnQmewIfUjJYEqwtgph9S9WtcsXef
 z5w701RKozuK0Euz5xydDFcauxGQFUQ=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed690a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UCKFswv1oFZCIU6oLeUA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX14WCpdN5jjy8
 +XZz0ETNWmH6loDLck953vSRHsb+15K5GuI0dhEkuflW8w7FKBkgougXC6H8xryS4NqCbevO2Og
 EWXDOuySKScu2gQxxmANuXjqmD4RbE5Sd29RLCjrrRXh8fm6ZE/hWSq6yP0eaUyyX1LUJU3b/OT
 w8xF+FhE0muoazTTIm3T7BhwJP+4hG1n7PE4u0HN6r6q3VUOf0rCd9nlruFZtNPUbUFcDOSMBL4
 kCjYPTrhfDLzq2TaGu6ZSsE5BET1d7pF6RDZ8+YG9STV+UbvM74zMImcLdiPfrJzA5T8I3SWAJW
 81YoHICvEd2DmNBrdibVzg33OZbspqPuE7dpTG8t1/8ZMCdpcMU9i+EzJc7HNGvw0nozgY0RPss
 WpVaRh84lcwfSDuDi8YYsqebA6mWb9Oyt/IVFzwMGpZLIfwpJ13BuDJh8KylZ9O/Sf/NnH2WGWE
 k0e5xuYCJ7JCXVY3oKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

snd_soc_of_get_dai_link_codecs() and snd_soc_of_get_dai_link_cpus()
keep a DAI name owned by the component, which is freed when the
component unbinds, so the card cannot bind again afterwards.

Copy the name onto the card device, as simple-card and audio-graph-card
do since commit aa173b70d372 ("ASoC: generic: keep fallback dai_name
stable across rebind").

Fixes: e894efef9ac7 ("ASoC: core: add support to card rebind")
Fixes: 900dedd7e47c ("ASoC: Introduce snd_soc_of_get_dai_link_cpus")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b61..0e62965e35aaa 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3253,6 +3253,18 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
 
+/* dai_name belongs to the component, which can unbind before the card. */
+static int snd_soc_of_dup_dai_name(struct device *dev,
+				   struct snd_soc_dai_link_component *dlc)
+{
+	if (!dlc->dai_name)
+		return 0;
+
+	dlc->dai_name = devm_kstrdup_const(dev, dlc->dai_name, GFP_KERNEL);
+
+	return dlc->dai_name ? 0 : -ENOMEM;
+}
+
 /*
  * snd_soc_of_get_dai_link_codecs - Parse a list of CODECs in the devicetree
  * @dev: Card device
@@ -3282,6 +3294,8 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
@@ -3337,6 +3351,8 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
 		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
+		if (!ret)
+			ret = snd_soc_of_dup_dai_name(dev, component);
 		if (ret)
 			goto err;
 	}
-- 
2.47.3

