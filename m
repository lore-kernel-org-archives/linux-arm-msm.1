Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E67265620
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108198; cv=none; b=CP2T3F7lB2JxhTNiswB3DiCLkGHXasSMiighQdmPaYmhjLwf3YlLK5uIgPiunvE8m0PAxMj4lnpUMtp9p45MjgdN/4D6dxehLhuRNhFXHO7umt7GLCRmazS1R7cKXiNskQg1i5cewR/6IGmapErJVBxoMZUwxH4CFd9PqudmOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108198; c=relaxed/simple;
	bh=krVcrnUB6KdgrT4QdORU7xJGIRgPXzCI6lY9RG0qL5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFVFrd9X9DFj5cgGMlwZyrJKHpHyzTD69UZdEgBZOx/RnIPinXftbWtB1yrNQbuhZY73sr6jB2dmp3qT8chNB7o72rp46NYgOU+fpx7kHFQgGogu5QlEu1JfZFcgKTgIrpI13wKhNkgM6CwQmMJ+8SQIWVNOcG3FjRa84bJJgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGBoFG5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PL5AgDzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGBoFG5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PL5AgDzf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiRUQ546647
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 19:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJAbH4l7aN3
	5pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=; b=PGBoFG5DKTfPJnwZmVs2dz9ZnWv
	A+19hdpiagXyD5IP+W8yCom0V+lFNNvDsvfT+c5hir8OgjtSN7GPw0oJ6p10UJHl
	Nbw7+UKC2U+0WYQL1qrudE7yNEn82i7T8GgUFpBkjWoCIvapKzamKbpq7UgBQW/J
	9Kq9VyNW4T+XauqcHK6IhKgNPypOAG3bm61xHYCdQXOz+3urQQj/Pkp894O+sKp5
	/h3FrFuq4Rg8zTy4U9mCR0AE/2hZ0DdkWlKhnNyO0v+/ezVOQjGWV0d8xJJhd9P4
	bALVJYPyqGtV+hgg6qfMBXmlZHev5jqQwlVn/HrQAckPuakW/p4cYJgbT8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02w9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 19:49:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380b630c505so1143691a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108195; x=1783712995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAbH4l7aN35pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=;
        b=PL5AgDzf6S1hsORXXIh+2Teud3F7LuDq4MAvcsl+w0EBWzXQayLmAfw8otGJs3eDTl
         qF5u0cK20cHBd8U9vPyp/4uvpbX16UoStVnTDLWy89Ea38+oA1wQqGACPBKIJPfsvDay
         opUdCLaTzgAKBd3YwrdTN17HcshTUexqDUII6BaWGP08udXXmUA6ZzetXEuj5m7jGxgP
         LUqFqdaDqvXpE+GuQBC9OIAw9DD3FACrggSyxiSiozWWLh7PO0Up1Lr71qi0SDzdKbTy
         yBwy97neTrpJtSX0dkgml9hud2kbDsP3UbMkZtzae+Y5WwWDL52ocjKc5h06IprfiUx4
         t5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108195; x=1783712995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAbH4l7aN35pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=;
        b=dTGoJoAmVWg2PoSmXx4hyvxgr1xEe94uIe8yP08SODh/qxEKxH5Weujqq9jUHAwd1h
         00RaZK+dm9NjyAVRKZrJ1sAHqcFycaE+ErWCeU2x7rNbtLytUGAePLnLFgLZpcddqB74
         9nWKuua+hZxDkFYbRlCI/FBJ3oXX47SBDkGCrDKry1zqCPz1PBLytaQsx7bRBMMQEqUx
         1w3GVUZh/OYTdld19r12dMQyatDiWCk1Ircr9P3uAGTTSzmArGnVEE0t1AzGuONctKKL
         F73ju5I4gax91U+nt9imHB6T8vAv304PuIO+LgygQWae00LdxQa1baLQ4V/WJRkj3DJh
         nREA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2883twhgzOnOh0RtJYCoH9F89dQ0NR6wERTZ3+TQT1/dTt8mnkpOr/ijLTxTrW1Pk58PoVgPhxwMhoLSm@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqEb6YF9R68jhPYNqr+8Uq2//8tOnfv6IJuziMBtwgTs3pX/3
	j2s6jn3kdJ6Rs41PPtOON+PywCTEyYv5cm2aCatpBg/TOts/XZVhUsq+XfpYpJL6xBspLSveQel
	E9ZqDErjvuljTTPHrNK2mo9l+SHEG6qEHdlj8ymzCQg4YPcxjVcbFiyLHnUwrTEtQyUY8
X-Gm-Gg: AfdE7ckUe8vB0DWKnuTbo/ke2LUxkYFLIud71/Sedg5zSWyoEtRHp4irKol3ns5AjHT
	FqSM+3XPbSSWPWovZqv5KVvOPcGa+aqWYVNDB1HICgJ5gavBo3i+h0dWBPhZFnHD+HhRhSrUiJ4
	lPszFmwDJcv6y/9JHrtismozkxiW4TU4+1PbrUJUqEYr0+fZWpVdiCrLkf1W8J2WBPZ4qrhxYxi
	95bcCJv0IxFylaU9oKKHO0Jw7DryRaUf7YNEmXijGOmQL4UOphwMrwyUVuQK3U/ai/IwoYPQEKW
	aRdToELuSsuxEyr5J4qnHBGoXbWm3grDMEnU1oO3QOiS9sEw5gcJa3HXxa+ISMO0PpkPuvCxh/H
	KvUMyicjvmyZkNCFY5HTPR6d5JBxMlspHy0vZFQ==
X-Received: by 2002:a17:90b:51:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-382808b3569mr806773a91.8.1783108195228;
        Fri, 03 Jul 2026 12:49:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-382808b3569mr806672a91.8.1783108194599;
        Fri, 03 Jul 2026 12:49:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 26/42] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:39 +0530
Message-ID: <20260703193855.110619-27-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4Xa2eFGaurgZ__4QNrHA1I5yR6DoY29V
X-Proofpoint-ORIG-GUID: 4Xa2eFGaurgZ__4QNrHA1I5yR6DoY29V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX0lO/dfvspuvk
 g5fdLzsc+/G0eTDKlOx0eASJpEN/1y/R0JN8fT2QSJ+HsvFE0B0QsU90Lo2pKTJrahHRh9kLB03
 swy5b5hwFz5tgUX+5y5AlsFORWL40p0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481264 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2Epw-RBMujpMcR55kOQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXxQu8Eo6wULYk
 nntYonefzwZyLgpX9NpKaUk/AmfXiKfQu/gJOXuUvlZg5uaJxW79EZpZ2T3WR43Skgb6leCdx+A
 EIPaVUSUFvxuysUtdsQgFiT1BF2U/NQC2tb4m3tZ9pUIaQw/B9SKh+hmZ28WrkCWYF6OHb5fSOv
 mULCYTF4qiQZZXj6/1XQcCuEOHZmXz4HxUHEh2MFTXrrkYp3mwdNHacxCUlN+wapEH61w4IhQ8o
 8/gkx5Lgdl6Xj/NnPrqFLv3g/HqbjzahyD8B0nTWv2jx8CjZ6G1zX92LZ3Z4jyZdSpjJnKtpAgx
 grghqtPkcJVnbWTzenIsrUD3YB5LKywsOr0qcKzP+6Jj3O7yJR2Iu93VinGqvK7vjrY/LFw2ZAp
 zypSHg4KfYjFQFXck8biXoAUTvLxXEcar710P8AihhWxOWA+ep80BiUmkelXYcv8IwIKTIWjzxE
 oxhh+efedVXRV6S0Vbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.53.0

