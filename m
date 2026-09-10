Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC614A5C4C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052612; cv=none; b=a60SrhZjLiIEyEL0Uwdci57nOTvoZWh3giiMiEm8g8VB2ys1RLvdGt0Abrn46uBlU0j+TJER0ygTIi9ESPnIHywbWVQDNW7ixK6U8M5VHmljV4J6Omf0dLSPIKn6nYBvsPwl7WY8AWu0S26eFaOrU1s1Na+t2CVz7yS0Mbla0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052612; c=relaxed/simple;
	bh=4FjFToH5ffcBDgAlLURcYX7T87RMUw59JYFGuJWakQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KE/dY0w7A+ydjxjUYVDBsd40v75Ty/XVN0xvTvtE4WprXLuUYKLqiSpZ8n9xxgQ18WnvGzL27zugmyJrVxeFSZLSI/z8vK4s+ZlYX4QanPzsU6y4GLw6l9mVn4NqmsZm2CrFiGCAxvTsFYpw6ERLCBml0l/MFed3qJjR/H22bwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsMg3swu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Whp0wMgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsMg3swu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Whp0wMgE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7eWR216121
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=; b=jsMg3swurpE0kiZI
	vbVOYBfJuSJKpDRYV9c1EAEUrgwouKO2KAka4jOLEWQJJn2o2/qWic2aOvMfBraM
	UZr3WR7eBtbLK4fP8L4+ZmRWZkm59IK82ivgW5NYQdbeLzOLdCb4rScoUMUW3EYW
	NHNPZDHj+4tdq6PryoNvzaCzT2D6lvGY3YyLvQuIXVWSdu9rclniEShDCuUyw5U2
	mRA/AoE3UtCGYo9v48S+wgb8YLgxm8NfPsYY2D13vlwu4szjD8dVLBpBQB9a2nOD
	6k+lvQAq79fnVFb+ok2kIaQP2iGuOR9GkOhs+MTuYGjuNG0cZuA0BL4bO0wtTUTD
	xDpvOA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9u1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-869b8d63e28so807826b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052608; x=1789657408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=Whp0wMgEXna+MzjvHE/cqOmnzJm9VSo0/2TsL+yfXBeDLfacIPxsiR21XwGrUYhfcy
         5JSNkBS38cf8IWJz/L5HtJ6TRV23m8n3ziQuLtv1gRtYE4ei4I+gO2vXVYE5qBlUBXM9
         ttMfUiXyrhlovbEfTH78f8ETKjpK/Um3m7/wjikjL6pRuSn4/RFJbht7V2+eB4r9eplo
         ltAJ13/XffNd0Y4go1QuzIyEqCLwQsE6P64BEa0t/TBP1bXbzCYvvz+ZHKXO5D4w4dwo
         Ve0NhxXwB9Xs3p2rasoDj+qrFdMNmMnssBP9zqX9Hlh6ed+0DGMcXLgB6KVvY91d8IYw
         6lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052608; x=1789657408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=NMI9d7/rsJNETvLNA9Ze0b3Z3+g5bY7KBf9jxUM7c1q65pm5GER5t9RzsISGJOo0PH
         rXucNWlL2Nb7xBDIucx22aUeDfmR4d8OX7L8T+kHzg6FMSHZfAqwubFJ4dSkFKKRdSq9
         rnIs/5AwinEEVXjTrDm9ORWN+8jzFUh37u/HEza2yH+B+W5U+kkTOfNzUbPnWV4yVu77
         T4l/bR33X4qzNeU23AwbApSnbY5vSuQfOyLt12vzzqY08TZCAI28XwDi+dCM/0CNVCOK
         r1XI4uw/QaBskwXGHs/gOt1Wiuebn5+JNKUP6KQICh2zzpcU6e24AVwmhdp1Gx52udih
         jT+Q==
X-Gm-Message-State: AFuF++kbWWfL5781ZXcuNVj5dBFSMVnBLj38DxxdMjWzXBKrZAnW5X6A
	2THmzbxLP4J9MaKn5cU68Y1g6DzHkdbMO/n0f9jNqSvlMOxPHoqjDFNAVGc5iBVoIrxHG2K6qki
	ct5lzCCmmrV8bbCvMo9cWpQnt93Ne2oIjexsSV/rkA/o9i3Jgmhe5vm+9KGklHoO772gd
X-Gm-Gg: AYBFou1RQNTGsud7L0Gn+FLjuWeaFCdbF9BhGmbogmJGpdId7S+2jJMZ4DviX2WiMWs
	3STGMkS0YslTXDeiTGgHDBiPOo3uCkYa/8ITzRlVaJQRBANy9mkVC2wEGlpGCNnl2HrpzTuMTZ4
	eJkgrz+KH8cYsDHy87Gm5K9LRJvI56ufkxgcvgDsKwBHoR8snyzxI2B9/6alVjNT+/tAifp3Lex
	SoMpUsPeW7IK9w1XGo5anYvKXF12u8A5G6Lq0zsLL2e4n516J9H8C3xdLP2LtTRbnc5PErjCu8S
	ZH9zc9qHjrxxs8Xkmj2xmuOocfLsSrNrdAzX9nTzwz55mwciQAqXSi2pEWRZK9MiNGTFLwPWpUf
	Hhc0nD00VLBFd11YVqpBP6JFzdn5m
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728494b3a.13.1789052607784;
        Thu, 10 Sep 2026 08:03:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728368b3a.13.1789052606931;
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:42 +0530
Subject: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX2LSvs4ungkSs
 jZJO6lJomAsHDVTb1oYaYDaASpG8C/hI8ByCWjE0iz4flwwDU7gCtWmxcHrYVDgA0lNx1NBPHFH
 3+SulQxeWgio2Vz6Zw7HfdYoN++kDSqf7HvtNVJqthJAKQPUclYflUoNpDX+6ZZcGREqOnd5A99
 yOk7KN+du7Ptye8oHDox288PfBBEb/bqVetjhxJX05PN3qsTD2vSZLQmhybW/eVcvX3XMNykfGn
 dEVRbNU+k1ya0+E9cpZg5ioax+AVh/nLYjBmBnrCgbbwwTutJeKyoOK0ca4pkXh4MWfkjD/Exm/
 9xGrJgRja8OTvDPhv3nQa8WocO5R/1roHbfrN9ArKY2owkMZ+gZhIc9kr9Pr7C2ZoStXkRjwS5a
 DZmQLipnd2uSzG6k8EY/fvJvo0Bk5pP+24EdnrjjaTO+pRREhp3RZQcQoekskyRyLBom0hs19z+
 mlCyhkmLUgOLsfL/nxg==
X-Proofpoint-GUID: WWjQIlrqiE-zSmorMviC-mUdsz6EEll4
X-Proofpoint-ORIG-GUID: WWjQIlrqiE-zSmorMviC-mUdsz6EEll4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX+biY+DcvlJQ+
 aIi0x2m11RHruqFP0+3Zvu+EuC81NurXLL1lQB7Fb+tYyOH9OSRJHQfMzwpxP3wwuWG1zmtOT8W
 UyX8fa365gf53Zb7Qf4Wn7UgDwqF4M4=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2c6c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W2XY7Ad4WFpPBbQoNBUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra IQS EVK board.
The Shikra IQS platform uses a third-party MAX98091 codec with
modem-DSP support.

IQS requires board-level DAPM widgets and pin-switch kcontrols
because the MAX98091 codec driver does not expose its own endpoint
topology, unlike the Qualcomm WSA885x/Rouleur codecs used on the
CQM/CQS variants.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 5bcdaa192704..0551110a685f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -63,6 +63,20 @@ static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
+static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new shikra_iqs_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_iqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
+	.controls = shikra_iqs_controls,
+	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

