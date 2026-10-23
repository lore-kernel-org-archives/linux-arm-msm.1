Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775878;
	b=1u8r9/4t0I0Ll480d4eW5I+NSffLIGduwk3nAyH8m4/ikCwku/LgcErt566O6xpmNJOc
	 aatznEnIG+wpjrmZojlLrRtjvEFHDRvoGKJW2Xb7t6v6SqR6xsKBSe5mLnPnYg0J0xA3C
	 PFnYVVHQSpxLDUgRmpwzzh6Vb9PkfkHRrr8lMxxmiR+2nzipjwtCjYZwLf27HTiIsVnAP
	 ds7fsXOK/dngbqWuJ3AUvcLmyJoGGH0pMF7SrJpMSitOnnPVd0TB/fII/NAF12t/KJGiK
	 GoXM3Z/ODrXOZv6ga2CCOomfSkDgqErEWWG/kTDEbiuw/jlnux2zeRgfuQ1jW7PqJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
	b=BE4CbkVvb0bgkSbqtoFkeP+qA1MwsIFJzooWsztlNq46GGs4DPL5yXQ1eojgTMIxJf50
	 i7vrEWV8TWIu2JjFlTBMQ3pETFxZRpQwWqetHZfqd8WZPFS7efiAzOwt5VhG2chRiImG+
	 8Cq/owpFjlE073TVCUpLPYFxVxz5uAAc+brG+h7krHT4jGw48sGDw6I35GMcJRl85W3sO
	 8dR74b05eN8lpPrCoCj+5ktfi+ADlGAqbookl3spLNenAYQd68fWsT44TIdvBiAWCEasT
	 LIdwd9mM/zCiLN63/qRMxCSm7E2kxNP7qPf1viBRsF9oAG9muSv9W5uoBo6Ioewp8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjcSC9pM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb1w0+UQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E360A3810
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860E360A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjcSC9pM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb1w0+UQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67xM3019023
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mc65MQMw4xr
	GXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=; b=GjcSC9pMDmucMIlDQm4CwLvI/Im
	9Ruv90rqtgyPeAFpwO2CYepNJ05iPqgj6FPPbX8BukZ54UV7brYQV2nn6ggQqJc7
	eDjOefjfrzlRTPSzKjQrAr8YtzZlatWLQ3dYgfpf3YOVHWwDt4tdg5XnrhOD9WuW
	PluH4WCzm3CAkvjC65gzl2O2l4bXYIJ48oBuxgWvUISAA111x9HZaZmAwq09rOBj
	jA/Rud5DgDnw5W7cifRug9ziN7+ef3/ygYwBDaI1+XikwHIFI6tVAKO09d2xJBc5
	PNP8kWJbUJVribEgxYctNQRqyZatdwSrgm82cnNz85H4w9SC/esuvzmLRPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc5vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so373964685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775877; x=1793380677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
        b=hb1w0+UQ4dW0dCltJwkBtRTRmZZO/+EALSzK0FF7kIoRxeKv5mrbVDkQr2bJ9OKwou
         IRNB4M5LJ9k4Th/jscBldPVivobZZJf2ZMXzuonBz1BXqJhhign1QIHhrNhXjvg4PDqF
         zL8nd480dMSshJSic2fX5SzQy8ftg+e0ILo4v2ys4CMVLR8Cayo7GHMDkOGCoW17eCgh
         dBXdbLsYQ+YyHwc3430PZl+BxKO53SZ+eZR5I9X4EYuvdBTImp3lFqN8VCf4NRAqAksU
         umlesJisvhh3zZ4IXFylOHN2E3VH2APemZrY24pDx/3/v3QUSDQsknDOLzqE900E82WF
         UbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775877; x=1793380677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
        b=cA88kakpa8C5GRjlsSQBkE+xgBAcdcfKUphi6BAbI62RJPjwFBmr2ss9tLq5c6xoaG
         X7BwvkLdxjhraMZ1fN00s6O4E2PhE/+uw+m40Jfm3U//ld99vOA14zAo6ej7vk6ESLOR
         BbOOeWEPQuMp06bOaB4QGjPoB+eLtopjj/FD4MtnfNO/OFIWGxtz7y+Jf/lNG/kBCTb0
         Igjllz2GIQ8GpxEAcbkOvNQDqj6r+1kHRqlKkZGxvematzeXYnNFp0u0TP2D1iy2cf8C
         TdDXijGoX2PBZswC6ptyWvngTasL1XQW+3r5usMLnTF9rizMv0RkApRkpKe07bnYwrk+
         xbkw==
X-Forwarded-Encrypted: i=1; AKwUvBwBK37d5GZveqbGv2sfuhkbOpaENRI6JjKhyBusyf8vQWLAslgjZOvzEsVJOCPSD2P1ZkOTO3xYmAbeVyiA@vger.kernel.org
X-Gm-Message-State: AFq9FYK8ew168l83lmldvCDJXrjIoqyfmCGHJh8A8t/26aDtUNIsQ6AU
	q+u1qFnbvt6Wf1k9KtR5+eWJoR7Lh3Vuu6Z60s5rZxAtBrnXed1vrUSi0I/XbKkR2WNzb+0wzz5
	XGzfzzwdlyQDXRJLl/10TWPbfJ93cTsE3KjggD36/+zDoIPEEZ/GctLSDR1ZFpt2dy+jt
X-Gm-Gg: AYBFou2cdooGycqod+SsdDV9tmYGG9JIXaExGDILs4MNF/PLdiqej0Ra1Kr38BKngji
	pwN8cGMTd/Ux8gnzcda0W7qxWcMYmQQYb7iZWr6E3CjLvz/G+0QmNLYHB2vHlQQjIQw9CdwQMQJ
	qD95RnFpk/i+M7/3sB4DfmUHA5wztZU2OHzEyjBatxhX+nTzWA2Aig5Bq6dxMOhvsW19JUZf2S8
	JApJLAY8tjisNfGKs74VROl78K5dgc7LtDfovgLDedFXAnhX+3iyykWXzr+ERLYsP2Ho6BcicCj
	bZ+9NnpgfCVoqyIN/2I/g0ySNZD2WT22LLk0WEzuMEV++qiAklrA060+9Lje7kVPxrdKfoYHE3E
	x6Wh4MJGzXzbL
X-Received: by 2002:a05:620a:4542:b0:93d:e031:5ad with SMTP id af79cd13be357-93f6f91e7cfmr459110485a.17.1792775876740;
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93d:e031:5ad with SMTP id af79cd13be357-93f6f91e7cfmr459105885a.17.1792775876111;
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
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
Subject: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
Date: Fri, 23 Oct 2026 18:14:15 +0100
Message-ID: <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6MxEFGeU7cPr
 av5APKS6jhI04YshUaL7qYqeYVvUpikB8bhAd0DTyLNi//tUQStWgWYFHv9EyfQvr9SgI10omPL
 zgcpBrLnyVzVZdJQrDJbDDzGq7gz8E2opVGQz+MyRk9GoB+Yx2xL3qAwYB8hW/22Jk0mfxixu5V
 eoQb0YqJRvxuTh1SE4M28zU8wBlifdu2shZjQinfAJRUaTVwzC/KWuJt3aWw+6RK/ak9Yft3lS0
 w5npfM2XWHK0WX8ZaOpljk+gZhjpg9yDm23prVIBB43C8+h4ULw1k1AIPoubJkToEysjqEAvMib
 Rdbx3PHCmX33FZwMoZv+eBcOOKjbsyP0iiz0HrvSn2lcHPqRVrRmNf0D/HEnyUGlb33i8GPuri/
 SEn2k2Z4gqvbXQmJSC28ettF6s0iilXvbXb199D6LQ3ZFPo+ouVmWrFFOyUWcP2az7R97E5xTYz
 EIhqQrCVikPpj3kqp6w==
X-Proofpoint-ORIG-GUID: UULilR_xm8BWu7q55tjWYnDQVq8lHFxL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+JDp5C6OsRA4
 viiqZGEI4/8mf6tc1kzxDG3HnKxMRmT3T2hxcKNlRlzjMbTfxSYNy2qlprAd+F296S5AcOR0zpt
 K7VqCWI6VY3wTTImzXOiXfNFFogIJl0=
X-Proofpoint-GUID: UULilR_xm8BWu7q55tjWYnDQVq8lHFxL
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb96c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mD6ITISG3cOiDhduhQgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries the voltage and current sense data that DSP
speaker protection needs, but it is described as a sink port next to
the playback ports and has no DAI, so nothing can capture from it.

Make it a source port with its own capture DAI, ops and stream runtime,
and leave it out of the playback port list. sdw_get_slave_dpn_prop()
searches the sink port properties by count, so pack that array densely
now that VI sense is no longer in it.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 90 +++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index acf32af5aae3..fbb9c5773aa5 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -732,8 +732,11 @@ struct wsa884x_priv {
 	struct regulator_bulk_data supplies[WSA884X_SUPPLIES_NUM];
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
@@ -822,8 +825,8 @@ enum wsa884x_mode {
 static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
-static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	[WSA884X_PORT_DAC] = {
+static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS - 1] = {
+	{
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -831,7 +834,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_COMP] = {
+	{
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -839,7 +842,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_BOOST] = {
+	{
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -847,7 +850,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_PBR] = {
+	{
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -855,22 +858,25 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_VISENSE] = {
-		.num = WSA884X_PORT_VISENSE + 1,
+	{
+		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 2,
+		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	},
-	[WSA884X_PORT_CPS] = {
-		.num = WSA884X_PORT_CPS + 1,
+	}
+};
+
+static struct sdw_dpn_prop wsa884x_src_dpn_prop[] = {
+	{
+		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
@@ -892,6 +898,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
+		/* V and I sense pair */
 		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
@@ -1767,6 +1774,27 @@ static const struct snd_soc_component_driver wsa884x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa884x_audio_map),
 };
 
+static int wsa884x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	if (!wsa884x->port_enable[WSA884X_PORT_VISENSE])
+		return 0;
+
+	wsa884x->vi_port_config = wsa884x_pconfig[WSA884X_PORT_VISENSE];
+	wsa884x->vi_sconfig.frame_rate = params_rate(params);
+	wsa884x->vi_sconfig.ch_count = 2;
+	wsa884x->vi_sconfig.bps = 1;
+	wsa884x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa884x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa884x->slave, &wsa884x->vi_sconfig,
+				    &wsa884x->vi_port_config, 1,
+				    wsa884x->vi_sruntime);
+}
+
 static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1776,6 +1804,9 @@ static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa884x->active_ports = 0;
 	for (i = 0; i < WSA884X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA884X_PORT_VISENSE)
+			continue;
 		if (!wsa884x->port_enable[i])
 			continue;
 
@@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		sdw_stream_remove_slave(wsa884x->slave, wsa884x->vi_sruntime);
+	else
+		sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
 
 	return 0;
 }
@@ -1829,11 +1863,20 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	wsa884x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa884x->vi_sruntime = stream;
+	else
+		wsa884x->sruntime = stream;
 
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa884x_vi_dai_ops = {
+	.hw_params = wsa884x_vi_hw_params,
+	.hw_free = wsa884x_hw_free,
+	.set_stream = wsa884x_set_stream,
+};
+
 static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_params = wsa884x_hw_params,
 	.hw_free = wsa884x_hw_free,
@@ -1856,6 +1899,19 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 		},
 		.ops = &wsa884x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA884X_RATES | WSA884X_FRAC_RATES,
+			.formats = WSA884X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa884x_vi_dai_ops,
+	},
 };
 
 static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
@@ -2091,9 +2147,11 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0) & ~BIT(WSA884X_PORT_VISENSE);
+	pdev->prop.source_ports = BIT(WSA884X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa884x_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa884x_reset_deassert(wsa884x);
-- 
2.47.3

