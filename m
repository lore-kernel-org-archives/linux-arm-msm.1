Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3E46A5E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763759; cv=none; b=b2Hlu9P/7cRBGykKMblbcYZQeQF0bG6723j/BrlOHuRZ8uwKY/mD1MFpasc8yF8/q4tbses1odjspIU9Ams92coSHnmowmKi3+k+Rl6+k7r4GCypBR/VUKnw6OCUWO1tLgUpTMccYj2qeag/C17CPvgegaqj+oGkSLFylaW1VrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763759; c=relaxed/simple;
	bh=I3HeKdoaqr6J677nN/TvvOWVijKfTEhqVjX9TUsnPn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRIO2VN/PkKuo0T1WBs+8lKv9UWxOzKaOYvzfd0IroJWEGmAOaY870sOGm3hopooSN7BWyCZI8CKEKMyyyhOXKCV6aIDO3QBmtiEdRykWjVUBOewSsZUaeNYPWlXjLmxA938VH6nZBFWeL+G8q1GXcPagLYBkvI/jLz/uoe+DV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FujzAj60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPDMkVIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FujzAj60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPDMkVIo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnwaL2176037
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ecc3MSmL7x
	fj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=; b=FujzAj60e2jkOlS+8OB5sOg8TcU
	qlYOzqB+wAK63ukMyu2p4ROybvLMGaPbkufkK/vTu+WbhK2O398il05kBVvqAmnt
	KmrI99ME9NbJx1Y5h0gKN0xCwFE1MqORwTikHX/NF/i5w99gJPmPu91sfhbVhUeU
	dQw4kqBkp98MTxIqIcd4nLepq5f66ROD5KR5qh7k6lxpHWlapd9JfVoZxBid0h96
	5YUzKN44DR4pAIesqkHQkoPfrZhM8RyxGHqJW/GUsgmHNqnPnG8t+EQJaQh4SB0/
	WzTkdUGMdAq9Y+tJk3uyNsHer7D2pEi0Ag9XXqCIkJG+Bz8fbHY0psXXtow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm12f0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so411681cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763756; x=1785368556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ecc3MSmL7xfj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=;
        b=QPDMkVIoRM5gQ8DWDNgAAAKmVmZUdzppAXRx14HUS8FpPPNRF2lMXOmYB7/oOi5AJ5
         9nuwlWRZoc6dOolfbOLlAV9nSUru7FasEMH9vLzBBDpBT8Hd96aVVN9709+R2UX2d6V3
         puSdvPv7YqHl0xyGQM6QhDChx/+/IskknNHNkOnHDsBiaPTCub6u0Xhhqrmp/gk8FqsV
         JrFmZw2npbU0VVkGEW7DtKdip1fWGCobP9K2W0sIj7tO/3lMXtcb9EcW68/oruhF5NPs
         C+GYAZtOAtqGGabOQRIc7Z3TiHKJBOQo/l1GC7W/frx7/mDlyOfb1QJAt3xpDyly2/h5
         r3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763756; x=1785368556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ecc3MSmL7xfj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=;
        b=DwHrQRydT3F2QFzY3MXbeCAXwTUtXgkc2AgY9tDdNekdXpR0ZwLO2uoCCRxpEmtVyX
         sa1pTiSp5uBemel6FwEXKiOBZD7+Xu0+N36QIv06L+bpZ/3SSoON6VGaTIXpfGeObfJc
         v5YPrC4ucJzrUzHt2Yz40zckhrbYnGkotu49iLDVknWHPFDKmbt1NRsx2uUvFdVplNTJ
         19BcXePYBOud7N+qX+Z4wusD1pDgZ5PJ5iVx4p42EsC5JhvzP+9MiL+g5q4R/eyEkLGr
         EMyacoDaV+mwBm429fZ7gFFwjExfWW9bY/Rq2aeZ3HgWwhM44x8/WWDf3w1X9HhHOgpx
         nBeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3rWZNzZx9Tco/Ln8ZY6yDmKzTJ9NoaT6nnBearj7ZevEDooGbVxni89WzDcJ8zL+dFEX7uLY/kBgNK2tN@vger.kernel.org
X-Gm-Message-State: AOJu0YwRS2Z3rJUww2GjIHpVJ+Skgsxcah0LXksLezoM4KAMizZqSFW8
	tTbGij0YSKn6vZbzzmw+HZUJdMi9FbDekJmWdQFhRjWwXtEWITrQ5Dytqei6YfpYyaHQ6Az5dr0
	4peCzepGeDpqY23a6B6FeX932vgKK+gY7hxkW57/oxJzuuHbcBw2shWYMPkVOL0RS8faI
X-Gm-Gg: AR+sD10+JaRkqXjVf5oJ1q9qx1sIUC2XRFbRBsp2DC4cHRJGwWdPEgTCZ3TxtZ2Co7t
	2pBxUJtCUAAOoMZS77AOe5VypNvZ3+9eZTc//apxsDQ8F3rNcUKhcflnV4mz94qLjCJ5058+yiO
	+SrYSG9Ai454+7e4ugov8hx/jDriKAI7U1s9w79Xv6jSzibXaotCxc1S/uh8k0yQn19VyZ1kxwI
	MHZcoeo76XUd49f2TUzXC9hghOa4MJE543cBf4sdJNPZHUm1K1O3PJFJe7BUeV5735Th8JSDa38
	AQWWycSPDqg6Ry54q/KFcjMKuHuPgK/H7nr7DcrSM825VrgeCA06cRDg14Z9O8wBQxtcGlWIKgR
	3atMTphnYfOAErQ==
X-Received: by 2002:ac8:5d49:0:b0:51c:7b12:5ff6 with SMTP id d75a77b69052e-5283dff0b9dmr6908831cf.82.1784763755792;
        Wed, 22 Jul 2026 16:42:35 -0700 (PDT)
X-Received: by 2002:ac8:5d49:0:b0:51c:7b12:5ff6 with SMTP id d75a77b69052e-5283dff0b9dmr6908501cf.82.1784763755268;
        Wed, 22 Jul 2026 16:42:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 4/8] ASoC: SDCA: add PDE pre/post-pmu hooks to hw_ops
Date: Thu, 23 Jul 2026 00:42:14 +0100
Message-ID: <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX7rXu1Xdxu8BJ
 ap2kvpe0U8zEGAN9uQyUYHvjIHjfwF0emLsKREBfY6sKl7haeSHVbVK8Vg9NjTgo+SJcLNUkeca
 +eSB7Lay5WQ+VBNYDcpU9WnxQY1DJpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX9c6I32NYkSn8
 pPU57kd6dxUo27sG+aWgpQ1M2CHVvekHszrXjlN5Omc8060b1jlQlVetYX3Ul3apSU7IPcCW9Cs
 mKKhZH6c2Mnk+tKc1TIcUHz2xpXAXSOm+MnUj2WDgwXKbSteH+ERBVxPshmOIS2hjrOO1wrqdWC
 NYiIkSaWjfC0qQkrBms/Ro7tG+djJfRjViV09cYhyW0yIjia98B8jkGV/fIg2UOz7D+FYxSRvjH
 lNBVq7FTzIOO07DweOtKTuoOEnc8FiCaUJIEaHHvOZ3SZgxOF4GG+267x5f/nBMLJAUaamwUeh0
 Vo9ftGtHS58eO2DSkJ9BOivWYnd3lssJCd91B8I00tp2dXri5V9OoUGfQkfMlxWlhqvEygJK8+1
 hUDgxVSwekm97wpd9/sXhRlh0La4GkeOEA1kxTFt7p/5KOnQ20H65sbauPFD+gPPTqc1ecTJzzv
 BQJyPB801GjMDg/4h7Q==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a61556c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=L7SaaVQrovU1Y9o8N14A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 55ud4zRfn23LQKUR3rWG7_-PLuhjHET5
X-Proofpoint-ORIG-GUID: 55ud4zRfn23LQKUR3rWG7_-PLuhjHET5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

Add pde_pre_pmu and pde_post_pmu callbacks to struct sdca_class_hw_ops
so codec drivers can hook into DAPM PDE power-domain transitions.

pde_pre_pmu is called before REQUESTED_PS=PS0 is written, allowing
the driver to stage state (e.g. IT_USAGE, MIC_BIAS) that must be valid
before the PDE sequencer runs.

pde_post_pmu is called after REQUESTED_PS=PS0 and before ACTUAL_PS
polling begins, allowing the driver to commit pending writes (e.g.
FU mute/volume via SCP_COMMIT) that the sequencer needs to see.

Both callbacks receive function_id and entity_id so the driver can act
selectively per power domain.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c  | 33 ++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_class.h | 11 +++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ac688cd62970..795498b9a314 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -32,6 +32,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
+#include "sdca_class.h"
 
 static bool exported_control(struct sdca_entity *entity, struct sdca_control *control)
 {
@@ -432,6 +433,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct sdca_entity *entity = widget->priv;
+	struct sdca_class_drv *core;
+	unsigned int fn;
 	int from, to;
 	int ret;
 
@@ -439,6 +442,19 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return -EIO;
 
 	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		core = dev_get_drvdata(component->dev->parent);
+		if (core && core->hw_ops && core->hw_ops->pde_pre_pmu) {
+			fn = SDW_SDCA_CTL_FUNC(widget->reg);
+			ret = core->hw_ops->pde_pre_pmu(core->sdw,
+							component->regmap, fn,
+							SDW_SDCA_CTL_ENT(widget->reg));
+			if (ret)
+				dev_warn(component->dev,
+					 "%s: pde_pre_pmu failed: %d\n",
+					 entity->label, ret);
+		}
+		return 0;
 	case SND_SOC_DAPM_POST_PMD:
 		from = widget->on_val;
 		to = widget->off_val;
@@ -451,6 +467,20 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return 0;
 	}
 
+	if (event == SND_SOC_DAPM_POST_PMU) {
+		core = dev_get_drvdata(component->dev->parent);
+		if (core && core->hw_ops && core->hw_ops->pde_post_pmu) {
+			fn = SDW_SDCA_CTL_FUNC(widget->reg);
+			ret = core->hw_ops->pde_post_pmu(core->sdw,
+							 component->regmap, fn,
+							 SDW_SDCA_CTL_ENT(widget->reg));
+			if (ret)
+				dev_warn(component->dev,
+					 "%s: pde_post_pmu failed: %d\n",
+					 entity->label, ret);
+		}
+	}
+
 	ret = sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
 					   SDW_SDCA_CTL_FUNC(widget->reg),
 					   SDW_SDCA_CTL_ENT(widget->reg),
@@ -502,7 +532,8 @@ static int entity_parse_pde(struct device *dev,
 	(*widget)->mask = GENMASK(control->nbits - 1, 0);
 	(*widget)->on_val = SDCA_PDE_PS0;
 	(*widget)->off_val = SDCA_PDE_PS3;
-	(*widget)->event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD;
+	(*widget)->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				 SND_SOC_DAPM_POST_PMD;
 	(*widget)->event = entity_pde_event;
 	(*widget)->priv = entity;
 	(*widget)++;
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 74db9d4ce4a2..1278159ea61b 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -29,6 +29,13 @@ struct sdca_function_data;
  *             an array of struct sdca_function_data and stores the number
  *             of entries in @num (must be > 0 and <= SDCA_MAX_FUNCTION_COUNT).
  *             May be NULL.
+ * @pde_pre_pmu: called before DAPM writes REQUESTED_PS=PS0; use to
+ *             prepare device state that must be valid before the PDE
+ *             sequencer runs (e.g. IT_USAGE); may be NULL
+ * @pde_post_pmu: called after DAPM writes REQUESTED_PS=PS0 and before
+ *             ACTUAL_PS polling begins; use to commit pending register
+ *             writes (e.g. FUNCTION_ACTION) on devices that require an
+ *             explicit commit trigger for PDE power-up; may be NULL
  *
  * Codec-specific SoundWire drivers pass a pointer to this struct to
  * sdca_class_probe() from their sdw_driver.probe.  Codec-specific
@@ -39,6 +46,10 @@ struct sdca_function_data;
 struct sdca_class_hw_ops {
 	int  (*hw_init)(struct sdw_slave *slave);
 	struct sdca_function_data *(*get_function_data)(unsigned int *num);
+	int  (*pde_pre_pmu)(struct sdw_slave *slave, struct regmap *regmap,
+			    unsigned int function_id, unsigned int entity_id);
+	int  (*pde_post_pmu)(struct sdw_slave *slave, struct regmap *regmap,
+			     unsigned int function_id, unsigned int entity_id);
 };
 
 struct sdca_class_drv {
-- 
2.53.0

