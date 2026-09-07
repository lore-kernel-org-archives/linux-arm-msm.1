Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A4443E2F
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770321; cv=none; b=SZML8VkC7lXiVbnKsVFaFRr911zl3emMUl3CB3wuuZDuyOQhhEQyqezyLQl/Grdu4/oPc5/+JuUsC+rOmZpBwHhb9rrMKI9R0ggUbklqdiigri28nF+OJYxXgFwOfdlkdQHuKp5CFyM6V03K4fTwpGn+p+ylaFFmHhlvzdSat5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770321; c=relaxed/simple;
	bh=KSMNo8g9EzvzwyGzuw9rT37GzWc3bg5wEFNUMeWd3m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGP93SNyJWZijxQ/kmQq5+YdfMsmG8VTSy7zSC2tnhwEa8bQeKIXqDdvDfTcCukL+jlVGjqZJZ33dIxgtMwJqSRaGQN3SirJ4HpAr3JapLsE6YD3vIGXSfgIV/B2q7SAkZJXWy7DeWFlcN9qS+m3IIgk4UVtLs5gY+TWY22w1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5Xu8pKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKjnsxOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5Xu8pKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKjnsxOp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777f2G2146290
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ip+eqAI2Rmw
	ja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=; b=V5Xu8pKfscCanne5RdqZbZbv202
	ETrilp+J6RiBrhsE6t8prwrm9uPVAUL5WMoGIcsPXThNk0zh1xoFpbXldBW1wJNt
	wrOR0PORIlees9NixTlZ7jOT6DFkOjGkxB8Zi9+mZViE80XZHVucKyalIrQ7i0S7
	HDBF2BhbAb3gqqciPNfbD5qhIei/ZSXoErEZO/0HpPifloasjh5kY+B2szIlLrJd
	HIuZn4nZ+lMLfo/NYTudOA548nRtIqUYQoX6HYSxT2OB3tej2Tgw7AsbzoEVj87y
	3HPm6S1+biQww5SOcUV8kyPnp9b8KkU0bcOEHiZeSzvHo/q0zTPVLmz8ZkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdvxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:38:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so449601085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770317; x=1789375117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=gKjnsxOpiHXM5tUTgXzj3U5s1N7LS2oPP/SUZgUuEzhyzG7p56PJcEMsRsmR83ChQ+
         hOkXhxxmEYJL9NARhvRtrQDdY3KgJ3cHi7iuRC8O3SRor0tQbCi+cjE4H6wubfeUqLG5
         m/0QWW+MhsAwNtgy8Nb00+jNZTN3FvVETigT+SH0K0dqkT+Vs8YLfEj1ZUAqJ68yKDnR
         IEHkhFQEdNXgGhcS+6d6+OI4LiCZpGCVxi1cwiMEhw3w7gXTtvlzpco10VQheUzjFq9x
         eMgjIhObOROa0lO3WRSpPjZGi1GJF9am/4zHsl4KRDYXP4rskFBm0PrIv1pNgBubsYCh
         PtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770317; x=1789375117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=o5MqZZto8n9REA3Tcmzz0tL8LxK4BsfBT9LVzB9DobL0Tkb4WAQ7A80gdcWf4Ry6+x
         qJbMd29U4yBip+PQSD5onN2IaF1gN42dze26KLvFtR/zUu1kTu2ax4N3AgPK6ouBFRnD
         i4uVp4b7J+LwgEH22PN/MfdCqv9O9bnHWTQHaA+1cp0HYdzZSX8SPePIUTBsAxD2Gr5f
         iwkX/pwXNScgTmcUL3kSeLmxcU9GpyZClX9/xpCCoOAnIbHVotMhZ0wFp9n2AOpZjI0l
         528S4jNw0Lt+td5Ty3J+wP4ejoq0Q8Y8TtGlk1TDA2EV4sPuDf6Sqn/tbA3/FF0Cs6vw
         lEng==
X-Forwarded-Encrypted: i=1; AKwUvBzr2qHqPg4gPPhJ+BrGIxwaUHsr+hCbQdAPApTaDT4utlcuTtOjAjlIz+tCQhxwfAGve4puGRSRsrXKeZkb@vger.kernel.org
X-Gm-Message-State: AFuF++lIkZXSZ899b/kPJmZC7nPnAIchOoG2J+bO12BBNe40MuenlMGo
	w2AM3TH/IAZFMAg8SZmPpmKWDIyUcCDfduygB58+vuy4zzgDHjkJtt10IS91f3YBmEKIklWjPjs
	ImH6ipA1sKOppyr8fg+hRYSHGikfQ2W7lgPpt4AK4pn3R7iMD1XoVDQg+cx5YROF9iWM8
X-Gm-Gg: AYBFou1yqSj7DJomo8WYyPLCJ2D8as6T7i3j6w1/ePDkom5/ia+w0S3KgIpDyamLvJg
	4L+fD+7HW2m9aXPWFe4PmQy7sOYk0P/3QEf4L8hR6pTeLuICdYoRsnD8DX57phzxqhsxJLCHJgw
	pU7EIOB0LVbQ6R6rs0HeF/4BAHhxUOVA/68SNu5/yKF7t284RKFz+NTrOxgf3jZ1k5wXyKh8VHs
	hFqruCjjFfkuywSh5J36cgaQKa8Db9ehRY4ShuMsX4bGSouWTmGh0waWQPaqv8VZM+AtBe6vUcv
	QFS7mr/IiHMjRt/bJTmBGy7fqqepUgxscAJh/H1n7bOPX3PwPm6olkUR0KGhnyPLuP5G5McY6//
	+qbmt5K+yyNPD6A==
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382138685a.20.1788770316943;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382134685a.20.1788770316450;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 07/11] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Mon,  7 Sep 2026 09:37:21 +0100
Message-ID: <20260907083727.733705-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K_8xX035VdS1nySf4bw2EeobpK4QvsTP
X-Proofpoint-ORIG-GUID: K_8xX035VdS1nySf4bw2EeobpK4QvsTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX5rGHjtj4FECo
 8O2Fiq3PbN3cG0oe9akeiAURVDBPj3Idm2LN65EnmIeWRVAZiiZf+7f47Z/anPSeq24VnzW4iCK
 46R1SYqhRxVnEZNB1Kbrva/PFRJV5+SX3nrJSYKpii97Wx3Nlq01ZT2EF8io+EFb5znntR6w0HR
 kHnXYMcScPiONWqEvc/vnsb+T3B3OdJVQYuu8VYReWfe5D/zl4JXYV1Ig5jDnsYTm9l4h6xiGDT
 EKFWaFU5o7rcJTntAumQA1fV0NC+eaJd7jpwuEeU1C6D8lul0JD9lKS42MPftEGGeGfj9r+KPtO
 3hQ8GRhoImxNaoBqREPpzBsXRxjrDADWCEwIeXNpOCYMkUy4TWkbgQkqPa4/rRuS4QtjEJh5zvl
 BpUNtTw/1przhp4BUqImlR5RQH7bUeO/IEIX24SLZBKcxWSmKwo7x4LT0/y3df8skrzyfABl4xO
 hSJ0oqCwNNQPXyv/H8w==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e780d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=w1d2syhTAAAA:8 a=IEwj7ntJ1M3WgPGe5dsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX594ChkGKtQ+R
 e+Qo/HAEx7EMT7vVKRSCmd298o7hP4RlyDj0sUWCx8Qu+NyNQswZ+0lGpGWApwdQA4Z+zpyuzJw
 6amK/X1I45OB8as5ixduCQW6mYLf1YY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 sound/soc/sdca/sdca_functions.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index ab043e23878e..713a34d5954a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -408,6 +408,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -593,6 +594,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 47dedb62c24c..25f95575c731 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -79,6 +79,8 @@ static const char *get_sdca_function_name(u32 function_type)
 		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
 		return SDCA_FUNCTION_TYPE_RJ_NAME;
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		return SDCA_FUNCTION_TYPE_SIMPLE_NAME;
 	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
 		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-- 
2.53.0

