Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943820;
	b=iK9J9go0tKK1QlzAFwIpAaqMjiyuYMV15AXSYgugfvogjgiHwsSEubEAugZW7oyLNnZJ
	 /voSCeJqpVjxyHp6o/AQrBNiE6dPiAW5hAt9pnQPKStgGzTXoCo7Kq9OA9pdmjedX3d28
	 sDx4/EqSmly1Qu6dfZDupxUy6JyMCzIRRmBBXvLYxav+lW1pScQxlYtGSBVGmdbI49E6W
	 KDXvj1ASvMQT2Sou3qNxEKryw9smTukgE2DPhhyhDQsVa+EGMdJmNx/tSYRmBlj0ALyOV
	 AKzdGb5cNr41vs5wFb1lj8b+0WAOnoGNR4UJHc3jXV05o09v8Vx669ZXAgFlj5nQ2Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
	b=Es4amMI8nemclC95XLU1tWrxW2IJaLmRPeGECC2GcXf/nKTmq2ALgy30Ah6APQkvIgse
	 vohbbEbz4mcz7pckfm0s1khmVxLJJgaHV5GgKZOIkQfB0GXaT6Y6ATIpZU4h2wv0D4Uxe
	 xs5DUuvWjTnKAmwMgw2yWGXUH1Yy2uMmpmUMDcqhO3YBrtSGpIsUEjzCfjq0W3KgzkiZH
	 8+7XQObB/lep9+Or3BVINJjNXQqKTLnhuhUWV0uLku6WG/Ct6KNAirXM7qZDUZIJKmNGu
	 vM6hO8juQsPUo4DtVah2zBGRefxaU3cWy/4A/s0BOGu3HBflO3coHGwpo6zlkGiV/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Edn52LW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fESWYjUz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33527606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 05:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33527606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edn52LW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fESWYjUz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640Cjr3857022
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 05:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9kJ0x7eMcYt
	kQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=; b=Edn52LW/y0B71f+2G3rcVBZpq+p
	ijeg2VIvzJvvHUAI7zhMiGf2ZHGCpqzjJa2mQDvRPE0iOWMgJ7Ji1Hhblokc6uqc
	EMtfKVEaghutBCsCFnJ7HcT03VGgUy3kTDwMkzpS5Nns4mWm+tSYTtvSAwdbOdx6
	V1ZvHMCldS3pjeHePGC8l38tbKUKWaQSSC6iNMs7BrbeNSk2AnmA/eA7h9BIXrg9
	RInJ5ZwenDI/Y5sSuWNxdoOlsIY7YujyoWf9TA9NCAz/8iUWcgryVilsrlG5PrNl
	NSUMmy7QUqxh+HPn7MKHrbAY9fozsrdLUVhxTiKlvXx9HOTpxOsvEbQdjIQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9s4sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:43:39 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso3076657b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943818; x=1794548618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
        b=fESWYjUzc3lzHWOqk3i/rSYbHTv8HllAvB5c8UVoxZPrn9x6eEHY7Tdc3LiDp17Vku
         +JaXef+WB3lm5oM0cG4srRlXN1uy+AihgLzOx9krP2DmqkbTl/NNQA4krFFPD3NexkWj
         ugvv8ybcY9TkEyqKPFhKRd2JOQjcup30R6LvvZBmVCEK15eaa9ZcMrXjFb6BoN66zqkl
         1XpPnosOtSa22e51BrfUcGIwKgJ9LUpgqnuVhmljt9krEwyvC7SgbslVXa2Ag5o6HPyM
         c0EjbPJVKYotWm1eMoSxperGSNk/bykK+pN4TUrBF8kxGy8Hq7rdkS8n7nm8iqXiDZb2
         YauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943818; x=1794548618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
        b=OK6ed1XaMZE54t3h/RTJJVFqU5rWLUGfEh1oo++uLgw6Nm6+MvXDeDZ84vJfDfqT+J
         5Al4gNM8ectms9lxp/4X1Si5XwIenoDWprUDxkSvregdmjkK+GU/KcotYrej44SJhN2Z
         JiGyh9vHxERUPEGwddU+1xqJe5NGDLqo/DneTwfBtJS5Nw0YrwSeNcuYh8jv3UqdeF05
         /1JkgtNTq9IyR9YpzuLgptuu2/XV6w0mqA+LSY26D8S1hyuXPcPumthNPa7FJIfFOKca
         JbOhoJTY6yEYA4FOWjcuUKnyKUNZJ20/W6GdAJJiUpSxcwOA8vk+cWbbUI+rZn4ftVqc
         3VfA==
X-Forwarded-Encrypted: i=1; AL+hErGZXT8SqRotYzpmNg873gtmsDjt1RcSa+gwmrE/2S+MaAkxCgbaY7idGGCDQcP+1m/2EcyGw9vxD1HXvFVX@vger.kernel.org
X-Gm-Message-State: APuU4Z8n4C6Bgd/iL5udqBeMyotvystx4AZ/hBAfy58AIDceF6Ox6BTB
	lGCwgj0p7tT+mf9Sb7Kkr3YKusLHZ0AedJcuHIObV4eaig7MuTpSRFjXs9RAOgrDaHniJB3hfJ4
	1NbXlJ5SxIQgWy1Dpmed8djzRWk3F3tYbhVHbKSWo9piZWjkt2LcByRIoy21+AFexxqMV
X-Gm-Gg: AYBFou1+zD3Mm93VOMX5kU66WDOc226WVox9zzxKIYXif6uN+OYiP2Fzs+IDm4/6Syc
	jx443X6V3uj569HcXPUeBkMgPQnbBbFcsG7MlXy9SE4jIm85l8hJQCEy90TqnxvUjxEQNEQ4uuD
	5UJaP6ZYEEZa6AlWlMQp+I7LgTmUlLL/tpkc2zEcwTcVz1rwv3XXjscISfQ0anIaRHaLXBwcrvp
	jLAPXkCqrHrFr0PS1NLvMfp+ukXY5i+lxuxjyI4EkN5E/Y/iZQQdjT/zz5yLyVpt3XCbuhol7li
	SuWJfmOK5zy4PTVEC2p5ajQVq9wxAbQm+jlbxr2xy2FJ/yw2KLpf+0tlcoMkXnAmxImTx0DuWm2
	zWq4NpM/FW7H3A6gMCDg5ZVnMqexxpkPqziB83XiJ8PWQu/r+hyqqQd+VRmjaJh/wvZcC+M+u88
	VepMr5/O9joItqs29TBIBFs42L8BM8qkigBw==
X-Received: by 2002:a05:690c:e7:b0:8ac:c329:67e6 with SMTP id 00721157ae682-8b341947fb6mr6285997b3.16.1793943818544;
        Thu, 05 Nov 2026 21:43:38 -0800 (PST)
X-Received: by 2002:a05:690c:e7:b0:8ac:c329:67e6 with SMTP id 00721157ae682-8b341947fb6mr6285827b3.16.1793943818131;
        Thu, 05 Nov 2026 21:43:38 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:37 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: x1e80100: recreate the headset jack on card rebind
Date: Fri,  6 Nov 2026 00:43:33 -0500
Message-ID: <20261106054333.2748248-3-tyler.baker@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX30j29Eqw2IFR
 BVFje6qTG6xRWcTOiEsGLcbXOh8nVXddmztqgFDJ9IvLgi2vrVID2ndY6WNNENIkATvawUVoJrJ
 CAfH8f14ttnmXUFA0pwmyQYpdH++OhU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX4ugvlnWXKd73
 DQak/BMTXx9pT3mG2jeiYCcK8vTW4QnXxuPwFJfjNhqXgxXRGUKPQA+lpc3Z0VZvenzxM+OSyfX
 2NdWISqwx2OCPnQQdeOCD2KuEjDITMMsZ+89TUv25uT3xr4FCTTMYsmCXaOIICem952J9qe32kN
 fO+xtxJG//71fo78TCo6X2gWrp9e1tCNxtRRUeDB1r0hPDhUXxlhZVC642lmkHKKvHw7d8j94nJ
 BUQXoiyR/d4xQgV0TbAn2Ma+BwMRPI2A/rUU1/qluJvJUHS8HEtx0AWTt2FbVe9pvLOG0gBqdCW
 XBnDOOtHhVyLSkTPL6xLnj40w+wkeZhiM92ep9FaeonbcD2xN4IufqNLVuJE0ufcgmp9uYMZ4Tf
 PNydQLlI6EJfki9lDI+WUSZcXQjl3SOaK5k4xLEzFA9n7Oh6G5JMo69ihOKyLkpSwy6Osijge7D
 ioPeUhe31eMkS1IxpiQ==
X-Proofpoint-ORIG-GUID: RjFkjjCKg8CATbJ7HujuGwcrBXhKOpWv
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed690b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=m1qxARyD-z_RnXRpdr8A:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: RjFkjjCKg8CATbJ7HujuGwcrBXhKOpWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

The headset jack is only created while jack_setup is false and nothing
clears it, so after a card rebind it is not created again and the
codecs keep a pointer to the freed jack.

Clear it on link exit, as sc8280xp does.

Fixes: 6b9dc2da6657 ("ASoC: qcom: Add x1e80100 sound machine driver")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace883..213d7f45198cb 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -68,6 +68,23 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX_0:
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		return;
+	default:
+		break;
+	}
+
+	qcom_snd_headset_jack_cleanup(rtd);
+	data->jack_setup = false;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -172,6 +189,7 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = x1e80100_snd_init;
+			link->exit = x1e80100_snd_exit;
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
-- 
2.47.3

