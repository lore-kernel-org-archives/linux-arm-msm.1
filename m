Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627129;
	b=izeaqTgocdtbphuYrDArQE/yMBARMmPdM2chgvElEm6ZFHYp8A985CRdeo88WOqAdV7V
	 mOOqo/hSAKDRBcu14/YqGvi876Jog3puRlvLtEZFoei/8MgNvB5CDbZr9XeeUkHagcEml
	 qCh329YI8+a99Yqt+tb+klHPPsIRq6dELp7nMUEilL6GRWSNlBPTTug02XbOyh6q3wBXn
	 /6qdenS0B4QAOSGGIYaACuAEzm6SPSAcNXO7uigzSx6GkJX24B7KPR6Lxrwr1D6IbAkZF
	 hKSUe2P/f6hRwvxTXsDk+bxUHlPWVhdYtziRjbGwkyphNzK/Tpfh48PIPzpxHxMu6rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
	b=YvyDyxGOjEZeGCWHAUHJxX7ZQGXe8JS4r/qgUKFC09zbyXgVOqeDJnJJCKRWTaA5x5bp
	 Gby4YDvZcie8ttarj9PeKQScmmdhYUDJCHouxFCpZMLkIxRG+GMWr0tGMWUZW8DL5mm3x
	 6IuhF2vVNVSmKe95wMnY5ZKv51A9Q+ps8r6+AVbjgKfWIjF6Ae5pp53dZcbId3nFKiy34
	 YEK3kMMRMpkGtuXnyNbqXgGcIhGfi+QjJsI7LDQV5WbbQKf2Y7oobGe8ne1OaD2G1ak/g
	 juDkCicBWlVrh/FaKO8QirYuxjmGMeXl+rAzyRjdIkkBZsu0W7YiokFPx7wt5iJNwRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EC606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51EC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQYli1434757
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jaDldssiLH8
	yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=; b=h63YnrRUqhEJZoKuXYZ3r5Bxath
	h3/Fq8hWcUGRv1f7STKGPr1C3+acLo48wxLfgYbp/4MNbEMeS4GzCY4JXhG7RtV4
	SfhSN2EhxJ52dcE9xrXVMlASOPBFBUOs9GEuSeLiRxq+4pwUQESSPk6dFgQpxsuy
	Mo7zrRtdurFKjh5YYVVnYrhqsYDSEIxLY8sIMnA5XF3h2x23iMADbPyH0VtDZzFV
	w0HHPeaEX1tqK3E6Q0PRA1rVYd1gy4y6wIHbp0wD6G8dxU7nPgR1PLKwuB9x9EmB
	pq1J56cpnnVT0hS2cxRIYp4xQhRnq9pT16ieLCXq974z/J7uSZX8tg0LeBA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnsxyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4d9d2e261so91386157b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627127; x=1796231927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=PbRmn1os8HBDadEK1RWhU29c1VOgNVcrsrOSBGWhJklsnfUz253XCJ+YkvMbuYgeuE
         e0ZkwJn7h831ffM84BklshjenUta243oXDbZm19kFaGykc9gaU3Pd4vbsBSLkq0qn7Zu
         zr4eKvqnYvioVql9tHEV1IeALA4ykI2d94hS1LUUlJmG45+jz7gpVPHN0A2tK587ONeS
         5rUNWl2FjCQWRliZp+mC4ia/JOfW2K67VX2U2768Ncfx2I6+oTJ5wMjbYkwcLBJydoT3
         jRPCHENwEei5z+VtLFpv9rYhO957pU5leqO+a5EApjIg3klkOYVhhvcW4PByJ0urFOul
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627127; x=1796231927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=HXsoGGJHrN7y6A6CfW7Y2Vpg9R7lSNTaiPRTr1avP6/CHDqwTjeRvOT+BSbZRDpRZO
         wdxKn1wt368rrpqNF9jafRZbAsnFPEHSfucKNqCPwuc4VMFi8t4zooXezdl7gzkBlOvu
         +nNsRph37ltZBRUFLyiJhMOmkm+7xFc0Miv8R53itp/FoXHuxAVVe9Ehf2NBkH6qh4wX
         RHSzkUgHY9dwufbwTj/7M/+xdWN4hZQpt9xK6vf24wg1sjLfwuts3xfEIicN+7Cp69z4
         Xfhcteaso+5845Dg4APwB9t/u/eJKLA46mdo5lfIUeKF7g8KZUl6TIag1dLz5fUavG8u
         7KOw==
X-Forwarded-Encrypted: i=1; AL+hErE56va1fXUwU2Df+JXcA6QlHKpvdG67IS5A2OyQeEQ0Cd7QSqHu1a9C1xn6j8u8ZKrt4b+vX3xQR8+FbQ6J@vger.kernel.org
X-Gm-Message-State: APuU4Z/qVrFMVNC0xY+xThEhzcG5dha8XERoqcXhDS5rvFNfUAvYUpjq
	HVsVylIcahByiO7+yjRrqJyiE+KK1GOlkxx800zbFwklJzNDJSoycHxz4WS1MCjGUMPnu51nnRb
	JBkiaE6Nk0E+3cVgH3cODHa+6aisAlxS5k/Jzu1AexTklVnNv6drsZWZXYCvhLEgP2HVE
X-Gm-Gg: AZFdTZejTN4VNQ1z2gJDBjAZFrlSUu/lmwKLbxNskdntoRB0FW/zEWZbqzcw/RCcqxW
	kt0ACQdE/sLWD/2jfinC+Au0a97VeoZkT0kxxm0vsN140hwgGFUKwCJ39+2BMPG86rRM93aSvpm
	vduZyrMgF+4FqZkflKCVcbEOjVyHMsnbYvAgEaEJPYpIBPpML7BsNMvjlceHNfL8rM7HOABJrbY
	uGeoFMxaYl53cfj2jzu9jR1zPnwj68FI78jhAvJ2chLHDzbUFfKB8kISVMcdL8h8Z3KYoLdCZhA
	QTrtlFEO/sYb2XcbowkA3BS0SP9VWgnbfHVCPsIbzV1gicq/S05K2dd9f6dvPPxgBLurQoFVqYz
	hJ4lS7t1LQn0jCkGVtCkIPQbxexK49C1AOQWAt3tug/UJp5ZktDl5fnYEWuC/8Oom
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58945177b3.87.1795627127341;
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58944987b3.87.1795627126791;
        Wed, 25 Nov 2026 09:18:46 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
Date: Wed, 25 Nov 2026 17:18:30 +0000
Message-ID: <20261125171831.1458954-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX2UnqCxeIgRDl
 VldkgivlsceDw3/wpujZT8gzzezBRocYZtzX6Mcdod4fcHfzmSQ0kxNoZb9JcXske9ojgZ9a4SJ
 ZqwAAZGnjmrq4LWv57KUH8Ch6pFcAV3Bb2b+zcM55/CH5w3eTCL6r3d97GK/3fhdUtIzb5BTZx4
 R3+5t4XXYNbsdUhRi3PZcvhI1ffXNMgq4vcGmjbCO5QjgXgp6Pq5zPdjplR4EQNAzEM0IVG0XaV
 idnC0AUS6qXnwmM3E9Tyqfk4QQxHq6b6iC4E9VbQYjMNk8KqbIFRczfYf91zc3Mfz8AsQHBflmN
 KJvKfWoyMeWzn8GKVC79c4wWn4nafnm0ETZI1IRSmlFv1yAP6eoZ4kmuJ8QszvQBK7ceXFUIIui
 0exGj1whEUAsUtK0ka8nkfUB9exsjqRsBBKQa4nhyLlBYlvTbMkg8VEtF6/gvsFyRqt6ByeYuQs
 W1I4M8SnBU5Nod5d+ew==
X-Proofpoint-ORIG-GUID: IOb9VZwOFvXit5PfHDZTIkkrLuDiB78n
X-Proofpoint-GUID: IOb9VZwOFvXit5PfHDZTIkkrLuDiB78n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX3rSkURqeX56O
 f+aJtrygPT+5hPTl8JgbpTozQuCLNK4BdZ/1jFASvGnqWfrEnhgQe2S99SmjqLwB4Lsg27fhbf4
 8BPIZ9Lh4Z78XjJp2MpcPsyesupgN2c=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b071877 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OjCvDKFjsN1F9Zy31NAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

LPASS_CODEC_VERSION_2_9 is reported by va-macro on Glymur-class SoCs,
but the rx-macro probe path, component probe and read-write register
check still fall through to the "Unsupported Codec version" default
arm. Version 2.9 is register-layout compatible with 2.8 (and the rest
of the 2.5 family), so add it to the same switch arms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index eadd52ea2630..94a272916ece 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1659,6 +1659,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -3698,6 +3699,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3883,6 +3885,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-- 
2.53.0

