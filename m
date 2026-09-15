Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6297E4BA1C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491453; cv=none; b=Uy9ec1r25Grvq8Nxe8X/BJT+MPwRbn9TjTk/RTebfuM3eIXEdcl6Z8lfhT4mM+aRzZOFLMmR5QtSlj3dNXixDoQRbeqEyubdyWdBbtezlg23CqzWgvL263BKrZQMMYUKz1MpanxNWV57r3/ifqEojT/qpz4fUWztjXBSD6Czfh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491453; c=relaxed/simple;
	bh=3JoZslnkrMsaU3dbbMDWnwmTMC8zQq0qdN+qFoCdvA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLy382BD/4T0a9JgUyM2rFXbGrmircUMS2N7kfNztvDqmRn5/GM+I/EhVvQEROrhRNWBmGSL3r5jbPCVucLFK7+tie14hasbxug1kQ2URBFyviMqxaqW0ACdXOPeBlk2yrjDVz2uX4clBfUTyrqzDfPCGHOeFA7jfJPwOTd87Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsL1mDSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSCqDkca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsL1mDSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSCqDkca"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAOUu813396
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fN1FhCnQZY6
	7jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=; b=OsL1mDSjgBPzJZYXh04KiJq8jq0
	NY5vFWNH5KAJiAhaQifGCJ9uFu2aKlWT9QuZfM36taAYBMR2LioCszAmGH1/qYuz
	hDoJwBvfQqAdhz/NBGo4EtE/FwXyzp7SNO9UCzyyXW+ih7JV31LwKw7YsgeUdC3x
	l81nMT7xjH5QeS4U6rfGbtU6S80IlAbDiLohTvZfDwDMjBGLcWHBkp3NgFejSCLw
	4VQbEAVE72OF5khGrt2/xHvOu6cVfqY+AxbM47lNpy3AoDul6eDnn6Jm4MOBrO7Z
	BNeuJmigzksxfHPLq5RVYs8VFyfhK1cMYYDPvo2s8BDnfOVGh+b/d/fVLig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc1bht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f2fe53829so4020604137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491440; x=1790096240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=DSCqDkca5giWlQXbanOaARaFmbbKWgjA7bKneDkKGXN/ZguLPViBTYnnGin3CrYXW2
         /H+hPaLZlrPQXL+08XhvveXTajPJsDQo5/0hZ29GEpg67yB0Scb0FVql3RUhwDeLqY0V
         1r2tMzH/Qv1VeItSGrPkYiYhLan/iHcymKqrMmZhS6wMFNu9/ISf1daBXYj6l0oqiQsG
         FfHY816rF/iAovwL3Lz/Q/UoMcuADGFU05ZovwYX+4TkdqsAqpisTz9RTKFtQUEcJZ4O
         tf2tJM5yYav3+RDD7uHcD04yBt1BbLzLseVw+MoCUAQ9W1koo3e8885+LZ5VQxRDJdcn
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491440; x=1790096240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=uv3JyelCZ32AiQkP26jfjUXTohjxqeMEI/Gal4QV7y4CyUJsqCVIndj2AuqmOsI81/
         F9PkBxCDnH3ubRxgKy1yhNGc7kEYWg/1DcT9IQ5OwNn2/Li5SrsCh67zOS24Wm7l1zFG
         YOvSLh84pbQO000XXnfMUrPeDj/hIdxKnHnkSo/L9s6yGt++i7wp4ZkpDON+hKMjFjtb
         IdxSANajn4u7NG36tamDuVcTqW3xBSmk682bBDCZScKfkP5vUfvCe7IoIlPgvJFzW/Jr
         zxi+yxKqs0D6gbqS7Al1wVMAjNyEX7kmi1AZU1F34klRgpKMh9VThhyVx7owgqqNk3Jh
         D51A==
X-Forwarded-Encrypted: i=1; AKwUvBzm4jFwaY03bj8prWNMGcXCVIIuPIS2Vd3rvHnEFrGD3+uYC0L54YjXr3PzZjzlUElCMW+qmol0tUQYMILn@vger.kernel.org
X-Gm-Message-State: AFuF++kERgrcYn7yMQ2gihi8eYWrXPzLyHzRlJR7SDlPTFotl+SmO27k
	13wIi9QeBzf/r03BP4ey3NUsjOFpEbp3Cre5ThdtFkfqfE6F/5BQAANYTRw1eLvy2qg0GSY5gnj
	623dxuKS/3q488Tr7d0YSSiKE8uOYAJEz9QTRze/omSb1EmGPnbR/0o8+3NZ8ZFqv/8Sj
X-Gm-Gg: AYBFou1gc1NG4UwYJtPfnujZ/uiXEtf/vnLoWqciLO0yzohJXreHeuZdRK2OOeI6cbC
	Iol59+emVNjcIK3SuvFFIeM7kSHF/sZN0TCgebnamB1UfE3ZMZYZ+I9k/iE+ARohDFHeS3Md142
	ZoVhNLqNwezGCRJPQ+vG06TZLIUEHZINd5AUohtO7ex6chrpSt53OZF0j7jTkabKsLL8iXve+I1
	M1QQyCi+fjQuOFvmGwU+Wsv2H8sBAR9DNArVbTXU5daPzlnIO1vAqVXebzTJfeLVpR+aGEcTqx/
	lZsajgDfX6coZVNLWs6QMMEmkpR7xB4lb+vW0NJ3hZ/qjYl44unhXYEE1OyFwfkqw2prQHh3KC8
	s2a1Q//u5CAzKLA==
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876350137.5.1789491440432;
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876292137.5.1789491439960;
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/8] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Tue, 15 Sep 2026 17:56:47 +0100
Message-ID: <20260915165652.914893-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX44iUkuxd1YJZ
 t5h/cE1iicSU9xFyE4EfplQr+mPUmQ20dW9BvUGfC+tmBh4GdECYn6ssaAaeSWSZ6ycW0qo68lf
 JVq45exTsYPgfEiSbgb96WogiKGpoT4=
X-Proofpoint-GUID: Ha4L-Z0VdRuwKoJNtJ1MCljUYabKCd3N
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa978f1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Ha4L-Z0VdRuwKoJNtJ1MCljUYabKCd3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX/bCyOhBGFBjM
 uX0ct0wzJAGho6G/2uPm8TRWcMmBphft5lijyVGLvFundKf/kNKsls7IFujzQnGQvYdTEWBl+Vu
 jDfHgUaO/KvmZu6wcnyiI+RCIAltVAfrYWRcU05mH7c4emZIuAOrX7sPVyz/9X9jLajxADVgHOO
 O5sXvL2bkqYPQQwNoh+MBGs/EVduWO1sGhySzLylK5prmcc6LW5Rqg2k79tROgfbwlJRZinRkI3
 kznWCW0N+Gwd9ajLqOu4Wr7jvGksHmQIraLnVCVMMcVpiAWYpW350vq7q81zSEPjnUz36YHkyQa
 3IgFailjC7A3QJZn3BGB4UFIy4Yug+Sp1R9aqQpFzJDPLknxYEt4N3IVPGDJbA2A0PqsXpZ/mG+
 iEBs4ZEoK+3yX6sfErJ6rxEPX575p7h4XDEKk1W9m+f2kts8ggLqdwhVlqw5fyxDOsswViFqfsT
 gm7hUhI9O0g7bV5l9pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index. ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index d83be8474e7b..328c667edfd9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

