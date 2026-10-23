Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775898;
	b=ZanQz1I2XYOT+6gDwjs6yaYFQbAnkKLC8qpIpf+RN3TFrwJ4jrX0A2rcWAXSMUIil+bs
	 xTxA3oanJ9YAbrriHrh27K/IqtuSolJLzq7uY49JLij+OLIaReA532NTzFXf993MDOtsm
	 VtcjmaLmyCNeOomsiGc/JzFBh91CWC9YRHiHlLR63f3NGCrzObO3t8n3RYQp4+tVdHrgi
	 TELPQFwgE8Fk9Q5s4We/9hWQXdQ3HG862Wyz1vVKh+VR222whRYYVyiG+jGs5raaOp2Hy
	 VwVDWAcjpclQeui07IvNwml2JYsjABAjminMP1ej/iOn0AeGg9f40gWh7ioom9Cr28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
	b=n04+c+m8663fqOZrPW4kRU3W1eC4mwUkwRbW0PLZFFVmVneFKCDQmAd8pAoMs23if8Yw
	 5sKVAIoqe1Y/9QH1nCXcr4onl4TNn/cMfWAOWq5N88MhsvG9NifV68V1I/ZnCNKJAoaBU
	 f7I4bMACPHUN+uzmhCLGGs7fTozTQBvm5mbBSgOWzj+mxGyK3u9pw5sfx4+PldHB8cZ/o
	 d7wc6+zFE08lqOcgEWwIa6VE3IP7Rl5v4VyEzNaDWUPpOVmHfVwlGZYBO8kyxDVlXKFPP
	 L1rvN/1/6TBBiWgnGq2xMDoC1UBtbL/GWPyehatGDl9WP4FHHCZL4QiMzhEYvfHTNRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C59606A97E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C59606A97E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE60ZJ4063556
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DZfg246TfQN
	Ytunz0I9gt0EsxySLDi22L36IzvOxp2U=; b=c9XFIlA28Y73lvz+5dq2//1lUGL
	VKgarBj45iMCPHAYBwkiMulg82OsyJ+MY7u20+5VgBmWCLyVn9tb0yWrNYLAkfiW
	4jMCWR41NOS87rNOvQj0atc8nyzqcaDNwz3zKbW7L0iPyBG/xkWNTXnd81hIK87l
	62gzZQhuVlCRXz+HMGm6bQB/HX6mf3KGHQVrRbBHzY3O4zIoS0THO2ijS+AvvQlq
	FGZ+8P15fL3T0Y8YEgz/uQY1B24zCJLQ7k0kv9UBbXQylJEcen3OezjNB4vHeRVO
	QvDyEaxTPqxF8BSbUhBdA0qOyFBcZgRb5euXhA1BYJrCPH3TggDpGCcTx5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcrbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so178629285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=GT6jvuoU9QS3+S74DLDt6SKuUfyyWPUc3Pkov4dOw8QuSXxfY/sDXMliyC1YI4X3tp
         TO+8e8tcuK+UMNsxbC/mvFmhioFu9MrJwm3hXSZzkT+GGLW5f+3E7eDHnRWU3n2NDCvr
         DXuV4A9YHWPgcwVoklcUIzQdOIPDvamOS4IHKuiqN/S0QNUlsGuMEIGB5KDgNILVmPY9
         JJNqaDbUuHGFEZ7MZHnOq9xtASCOSCsAtrBhgBYRtTZ7xSeg9t+n+wpVyqCelJkA1/DV
         mOEr/E85rknnG5yOAo0uen0d3Z6shpxKB9yZI80FHW62ljL0vxtUpnYkKiD2+a0dCNQU
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=wfhiGUlGF5KSy/0mNeQUo+dP8To3dvT4J7IXunfh0g0Jh7YQwYWeZmboDEYKqY2VHt
         92G8Nwu++SRYA3zg7qfACXR7agN5J6bqALv18/Y/3cmlMQqNXLfjRe8DqfpITHIH62DA
         TkPR5PVz8HKw8BUelN71H0QxpDZePISHfhpIvdTGW0yg6B8zrnMTcdE/H323tu02psY/
         +fWb6VOuhl92xAZIwxIJ0RLtvvtf7YRo36OYV4YN+xpWXvX21+Ao3SGdoJJBOa9dHgJe
         EkldanVJU4aLA5uUIPn1H6ZqNrbJVvWpidl+KPOIJj/XiKvgHJ1E8beMdbsq8bXjMYAH
         FU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmSzh1bwisDx8RAZwWAzORehBxXdAX4fQQtaNqk0VBQTtmPnT0FO2U0OipXkB5koIBvm6YtAq4jbaWEBF4@vger.kernel.org
X-Gm-Message-State: AFq9FYLj0lm+11Tri1k9XZEyGH3A2bTxNaQKBNDmv6HM7+7lu71htPUW
	U2steKQbyqDJZUz6LGeybM3yDs5EVaCbOfzcZkHMaXDK5gn152eUWC+lpMjYr+saFLqt/80aMwr
	E15UGgEqu0naGP2C7g9OsIRemrPvkPmkZOWQrzCyZw0uT9zMygWSbT/2288g7z2VnMUiQ
X-Gm-Gg: AYBFou0WgYFZOYTst/zMA1/rXER/4PqflgdeCN8pgHbJuB4MhTB5Cq0dWOFCbND8IUg
	sCGIfiR7Dm5LeqTtHMXMP912NQrz+Qv+2NbeFTy1nmvjdpvQUWbEGFpz1abmgfBOcKN11exC+0A
	Eqagsp0x9Uavx3wR6bhSMNXhSy8x6e5pY6bdAj/u6O8lbbLNpv9DRGysCkeLUHvKaq1qu4Qr4xF
	d6a6NVN/OX+s79YAIGubwPN5aAADJ4V3vB3kKR+oQDA4aN0gX2muyYZ0OwY9P/FJGeVI4+NhCs8
	RoDujdxSOjq+j/u4lQxcVOmHRDOXMIrK0ta3rrLiM04eo6WbRXg/9cX82oxcmqdXZ3zgbQeiUfJ
	hQWsl1BvuDYdH
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513759885a.33.1792775896691;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513755185a.33.1792775896248;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
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
Subject: [RFC PATCH 16/23] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Fri, 23 Oct 2026 18:14:26 +0100
Message-ID: <20261023171433.820092-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: AJfG7L7GqfQLVcL9yrpGUoks84NaoBjz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXx0Rq0Uj6ZR1R
 mLk+AJ2/GHEZd8vt9xV+KxArfeHRmt9gL2tGLuJI6Xo1zTpHhmF1wUG5asiI8OFRa7uHJDXAwo9
 VNpDjrA2WQANIKDQ37k2mfQTElVyRG8=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXx147ieWnJH81
 3vcEisarNWNCJiOJMzVCpKE398NtZcQJVXSo2lIOYG7l50hPD0bwG6hEg4H/7gIKoXKSaW5kXm2
 BlqEVHEhy0XNuwXlCHSvUOKQgNlrKDoErqZQRsUuoCCgWGujnHQvxsVuHwoOkhA0rcABoBECWCQ
 aXsQzpfRpk3+BUk7+AJtVw5N3TrlaQvQDXBDyqXqgDFm20pwP2/Qr3BxPqLBSBoDIkB42t/bFH4
 eoSLpovDg/A33QoFAmW5lXKwWZ3h9Wu2padAl6uIqEkE8u040YdAUGEyrDtyqmT6rbJHFe4OfHJ
 iN5g0aWLYp/SO0R2YrJzy5BH4JBSNGi5oXokIiAKGTPZC2L3pj2Ux7SLXrwjDICNdP3Y48svLOv
 ZZvSJGvvTTXcP0YErQcRQ5HDqRUMIMxL0EJk7uXRxqqEK4ow7fSrQDziTD3VZqVYOu/z1qiE0PY
 eriL2MWt2XhffO1PL+A==
X-Proofpoint-ORIG-GUID: AJfG7L7GqfQLVcL9yrpGUoks84NaoBjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 089cc9dd76fc..d027c763eb25 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2033,12 +2033,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.47.3

