Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364119;
	b=48ZWATcdxVYl4IP+ldBWGrjPL9dhnPgt9hL8N3cPyrbmniru7QkG4aSSRACFBn13sxDo
	 kHnaLpBvO8gBjEzwEmohGn0aby2XQ7SPJVd56JvaPmlD32/Q7pdaIy2zqjJdXaXDVa0+t
	 UucNcu/iezbTWLBjxGY0gOEpeHwKf677OyecPG2adFA4zwnTvzTVPWXNxe92gs5qs+ppu
	 NHx8/9E/T6UGgAZGaJH+nccqkGRoNwjMIHdup1rBh2rVruivw7koxblY2BngFc3rIl2/k
	 BeLS5m4XZf8dEvI+vVFzYPD+hGhOVKDEPXr6s8c87GSf1G3uc1/7wtwUKfBQrOfWqYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
	b=m3HHCzwh2ORorVk8A4VBqY+PNNKb8+dTCuVog7ti9XJCjyh5qEI1QX8usToCZdHnVKTl
	 zbB65irpk5Sb4j1PJs6BAmiEMQDrmfPM0E4Y9tsX2sUu2R7HcL5O3wZLGb54bEVquxs9W
	 zg4kU6NJUB7RSPKz6gGEDGIX6TVLNEcjYABu6ZLUwAIUps88hb3kvgx1lF4ekAMPjvUxm
	 mPlxk7S6PunTsVIKWKNmKNk1c6B6tx01E/lh6AuiwTbccOgw2JLVa46fQjGhnW+QnfELa
	 Wc2bALnE+DeP771WlslzcCICrttwVN74Fu5n5Mh2v6wm+qBh4j+TQTch5Fr2JONXNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB060A2626
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DB060A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQXeZ3382516
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJ/t3yJRSO/
	I8Krm7cGvb9xURXfceDUgpjT74EYPghA=; b=mnr3WYf0RMNGwAS1YNEC2qcMZvo
	ddz23yc/mN33i1IAq9VcyeneKk6iYtaqJnOUdLuit7biAar9ZasMSpxBpW2pGokO
	0XG9aHzZwcLo0cJi7R6VschHqq0Jn1/GHYLOXqRNY1a6XTB4ia9EAso4YFmflJXa
	wlyrCnlZV8CWnjtPrmuS8mvcRL2Pxj8bS4BTUxsvDemaDSllCnkjQ3qOohqsLmXW
	anqnPAl6hs6vlClARhyPZemiCf17uaNlALmvAdndWoe0u9zJ7BWXWsSpIqR8bIdr
	Az8ZPnjXOtWayd6XXWh4v508JaKRajOatkt7reQBhVMex0F7N9EOT0S1KIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso408760385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364116; x=1795968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=D3l2cn3LhL/fO+NgI2ydQfHPum2bBeFF6S6SzD0DuXBbPrrszCCsvWkJFEjiUjOxN1
         /+GUmZUO3UTcDYnQwkzweV5hcImxX+Et/zioQvouwnf/IkUdZQcccKkGfn6vPQ13SYMW
         S0YSlxSv4z39+8itLx6MPzmolh7b8XRRWb9Dbmiu2HjXZbdyb7t3MMzq+SuEWwId0hqk
         t00INT4qYNVbaZubFuiJprTpUgpZCarwiW4gPP88sj2OE/to/SU1B+42ma9iu+OyiblG
         4JStK4KTQooH/i5Y3O45OfJk+lx1D9PW6ink5BGI8+a77try5lSMYg+7DDT7+7NCp1cF
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364116; x=1795968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=YPA0rUvnFEE6aJ9SuYvb3MNIY/oyvpDc8PZrdd1TSVcNT0VyCw6JyZQz/w8VzzowqA
         n39VbGb+7eQAnzpuYvcc4OHNdTTn4UJOyIA7kjx2GTXcSWmLBWxgVBrEnG0tO8rIS/EF
         CziX3IWKZj8Cop8LUFMwNV0YQl4N3Zb35XHNoO78pOs+3E/VeSnf9Yr7dsxNAtClPD5h
         XkKcfHts6d/DTyhHHCC7xuWzqqi1HIRe3sKyW/hKFD+CEsKBgCMlwRhiW8KutTetvmzD
         HuIwCRO/5+davjmyqruZsmZvHBLRLVmvTmsakhJMSwMrC8Ob+MDdcIZDHeCGParacL2G
         DbcQ==
X-Forwarded-Encrypted: i=1; AL+hErFh/vtd/Yly4SwDExdbi/PaUPW3Dm7x+mxnB8wxWTn9cA/LbhGVA4rN5KvOO5SFaLWZ0J5rrqfl675MC8Io@vger.kernel.org
X-Gm-Message-State: APuU4Z+g2vsmAfOkZC9WH0Kneq0w7s9yoGXWBlcOlcwd7oqRJ7PVih/D
	IVX7pkbWJmneB2eyNAGfx8r49EPMb+GvqwjelpgJdAdqinEkFIsKR/nqKWd0MeUHzSxw1YcHzZz
	eQPLVvCWlmyInCY0IB6IrmxuX9N9K4U4lKZ3hxRZhZ0K8K+C9HDBVDY7nEtfpuBSKJMG+
X-Gm-Gg: AZFdTZePKt4xNHpoRkQupez7Tz1cXSHD/z4WqHGizrK7kHL22CmK0WPOGpU0e3qPQtb
	9rarcanR9Ac3R6EpAOaN2wJQIeNL6TIYSOdwdeposROF3RgMDhiMd4UWBdK4nM8O7tORdnldPnW
	BQeA3LVF49wUWnWsDTeRT9/IK8pQ0IAYxoqSytC5iTrquO8eQ0Ti0UNLmmcXqsTTdYrZ6wAjhul
	QiUXoUhty7qq1l2YbFdbwGe726edrSAjU6jE+TDoB1tI6VyFaGwXO7ACDfrFH7uyoMRbikYKxCm
	OBBdZCRdhmKxFK36w+YnMDS82epVkM+QkJhVOJBhX6EdHgKPUXHNZLO6oWdOQhGUupNFsnOnhgk
	GqUV2lTzGkQolBFXAYTl8w28s0ryjS1UjjqxnebL5J0L0PScKadF+/Tt/sSYKDXGJ
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506517885a.40.1795364115996;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506511485a.40.1795364115542;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
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
Subject: [PATCH v2 17/24] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Sun, 22 Nov 2026 16:14:30 +0000
Message-ID: <20261122161437.5994-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031515 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/oUX65r0dgxA
 B4Muc4KF/TWVWeol+gzT5w3ED1P5ggokihJOgeejNvTRAN4Hoe6Fj8OdkfDulXLNkiYSP7PVhZA
 l4JIIeS3R6/L14sXSj8ndAzoNCT34NU=
X-Proofpoint-GUID: wgZk0MZZz39clPa37NX18Fs1y8ix7GXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX83oKtM7eBSu8
 Vm/mGJed0iXUGzRE9YW7N8BS+22C9/ZpNWICyqPuk9dTPz/um+Y1CcHRv0VnpBJSA0Epsxgkrpk
 CnkeHImmQr6FY8SuWM40k7TwDoD3CyUiggLTeBi83S57o2fzAuKmeNedP+cJHB0vzxQ11O3rmYg
 fzp+oFuBEKxyN6wLOpnJ+0MpkXYQpX+m+EGyVl4VeBpa6ueBGkbrW0tBV4CMkRwPeluFvjwOh1c
 DaFozZ1Ryj9DSg9yGxP30HEsAGrjFoewUNdDFQ6fFWmY7UgSJ3zboM3POV6je+SvHErZJw4QCTO
 OgzUxJC7SkHGj3DAar7SDjHtmizOGfgS458h4mJ0xyYwh9RiB7/ZjImL8iIgElFXnt4Wexi0ZRg
 skGLdCW/91EsCMRv77adF2jY6VoI4yoDuUvfQ3RAiTgZsO2ikDdEEZswWe4fnlsF76mJtd1Dmd0
 y1hn3JCVpd5cV0oIzvQ==
X-Proofpoint-ORIG-GUID: wgZk0MZZz39clPa37NX18Fs1y8ix7GXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

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
index 436d33ea568e..97d8585a287b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2084,12 +2084,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
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
2.53.0

