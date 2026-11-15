Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739570;
	b=0Zo7M9TqfOy/lElJS+zuz0Nm1f99rjaAI4M2X71byed4icd2ZC/qN2LxcHFHu0mMA+QJ
	 sMO8SkpLE00sHUc6NBh5A5Cd91RSeIg/dz9LL708oVn6rg9GPCWq9u3ANxHplxGRDaEn0
	 NKLdOevJRfhN4d0C5qH/o0V0MKj3Q2zukZevQ84kBFyInwV2Ybgwi+um7tztD0MK4XRqF
	 wi8613+htyjNnBssk4uUvZyYfu5rBNyrK1DoRuDc2sMcooI7FmitziZSHm35w+PEUrQYm
	 T2UFxId512WyN1VQ/2TitQPwBcTRgGyWqm9rMVsdbtr1ZtkvJ8cCSSSs0NBmBlmBA+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
	b=xyrIsZlJQoLgfaGqDzuFbm3zJDkHojkxs6SeXRnm78nMkPvr1TYOUesAsuxa4zVkKivM
	 8R5RysxLSId/FCEsRPEiAB8WrK6Dm3Enm+YnctoD8TZTG67mUs96LsyoRhjphlW78C+u+
	 gEmvalCC+gsL1EeWWRpWxjghPOLSVlPhVke5kDSX/wO7fa6dJbvT0Kw2QyoKWfVkhaYa2
	 Pe9iEQn+eSgQKJjVt2gL4Le8sGMlFy005VWn8dpkOynv3NZaPL81snC1qIF5OnqFgfxwi
	 acZN3+xM7CWBwa1IBysWCa/tUjDA8dixrRbxf6hMV7Fwug1xXzQuOPwJ7l+ymWpZ/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW8TVYri;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E0606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW8TVYri
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w6ob236090
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=; b=P2iEYOhoA2tNINKg
	8aTX61BSPTfyw+BiPDwHp0nP625gvjraAsP5qviHMpoWdIHYKZXV639cIqyZuZO5
	ZK3dllqGC1MGzubpk2iysopC1rAISiYobRF+GgU2PbzFVW6NCC9U4K0IshcFvazo
	ms1LYgSQzTsmImLt/SJBlRnYlKPwAhtz5RGoHkdzoj9aTcyLZ0hHHNrOqLqSMcT2
	5eph79ffTwrKqXGSAs4TIcmShiY5F6qK8zEFVu/NYBmgAK1zPR9kJvhgq8pTvvAl
	uNYzPUaY55h37+edRzbQxvc/bQB5EA1vge7RK0FQs+/fRYkyode2X1LwywKGXZsq
	xnoyow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj42tcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so232668185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739568; x=1795344368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=FW8TVYriYjlFLpPaUDlgP0MCrqUqvtfkf8Z+LuAlbvYhZWowOeWETHdjFgwCMnfUyd
         WBkQkKAwh+zBxhYD+PaFS18hkWEaAHeRU/Z1TFV16g64uDRczXhmW1GXTYnYzCGCx5N4
         L4hDNdSgZBbaJ8CDVSEsm6kJBSXPZdmZTvpLB3lOR/Le7JS05AnkqcMXt48SHzChUUJt
         rQ5zEJs9JBa7t3r7akU3N/QEit758kr7kD/SoV1bXMngNI42nI2e7Wz3LbLXbrewfBcT
         PD1MdoaCF+FQKw1PfhhbSo6cc6ygGSYhtpmYSnKdsz2qU1Bwl8w1wA5z9LUVkFNi0yw5
         XI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739568; x=1795344368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=W9AaY6TkFecum+8eYZPcwgB+tQUmSFfwBBJoXtjzK2oLBa/KrBX9dv/esJiof62d0e
         72sim6PqjK571RrGWuVt7XZtom+iyklhdn8I59U+T+P6H3eLZO9UnU7/ViGyOMAb5K7I
         rN6F3udPHzkVYEOEyqcI30RC3wE1sVm3YAkkKmrAH/GPTMgfqEGB5V7VqDFeQvEfB3Yk
         mXovuNEuJ7OV3+WB1LPRfIawWYrYa+f5xEuwMkXFVdhh6x5iRV3i7XB9dZr/NS2mZU12
         J1oAhxM5zlNXR4w5KuY696UjTVeUu1Ex/SQfPk1lHWO7oZwz2x5SGbCiFSxiZVP0nFfH
         q4dg==
X-Forwarded-Encrypted: i=1; AL+hErG2VnnGhR01+rjlRAC6gFAQSDSKXBH8qQlnovLplszDMSLTAJZpeXYRZSP1kydtS2rFfq3NXASSM7QVUSrK@vger.kernel.org
X-Gm-Message-State: APuU4Z83LjBKUviYMx0koSm4sh2ifMN8KCma0jN0inuZYIM6Cu7EKIjf
	hkfsZO7X2DnxfRWHOG/Zziaf6jFSCQoyORnMXQHUTKL4SNzgM5ysdHNR6nrsV1ig8WRFkm3iLm7
	VhutcE6SQB0J6ClCETeuIjjGz+2gj6aUnFiXkgv/4yfUXMG8w4Pl8eVfomKqHD3D7smeS
X-Gm-Gg: AYBFou3y/xKgyGkM3vgRU1PzFO6Zckp6aHF6aikF0EMKhipc+yc4/RsuvcQ4X24Hpa0
	7JQcQiuEfrlTfa6OIJ80sB89K7s3oGbJYINB3QSK4cpIwA/GVTtC1g4XXESANHPv4rEFxL4eaLy
	wza4yosPHG0RK8jYrimSsARw6YOQDQeH1cVT3jwsT4rBOTF/VRfSc4zsvf4qGv1cJTvForIEloW
	S1Gro0aigR+pykUA/3oag7a3bbz6lTiTGOeCGlS5VnW/beL0ylMOxrM8xPJXo3EoPPbF64ao8db
	uM/BmZ4x8dSn88yxJdJ8e+6Td2wgQ8bTBpiQewDj2zMYwt5nKJfN0Cr+92vn1OMvBZkcemG2kWM
	hnv2w9MQdz82MD8O85u6smNl1DtYt23hGNkrmHp2DUHD3C2vRjeqLL+MhuZui2ZC9ER5qybXTPI
	2t3YomI6fl+UYSRVzEpg==
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229212385a.28.1794739567459;
        Sun, 15 Nov 2026 02:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229210985a.28.1794739566963;
        Sun, 15 Nov 2026 02:46:06 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm3069071a12.4.2026.11.15.02.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:46:05 -0800 (PST)
Message-ID: <f172af7b-f5a1-4375-a62f-6e389b1a2508@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:46:02 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: audioreach: apply volume changes to a running
 graph
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX3Sj5nFiR+E+B
 zrc4F2vmoKJ489vtrlvs9mFMZ/vKfILLelbwjktFqJjtiFy/oDIwQTTD+lH9fp2maaoa/Mt7XI+
 p03ORaDVQYWRV6/QOYeozdrgqCywMjTi3tRXeY6QsRhlvjd9NVnoYjydFEzECtO5faxsksjMSAw
 t+bhBGNEnLbSJIUyj9FAyA42LsF9oAmyjC43Z03nsoMb5mqL+6yPzzrsJSPuhIwrrTdngP6lti+
 P9U7D84vViwmwteOprp7EleYcRVgdeCv5nppsCPk1c5WY0ujUK7c6WJ7JfxICkpEQsO57tTVoDd
 vK+dR3yUOZhNEGX31uhtU+rLR+75Y6EbfA84W+Gt3CN/K7ZBGXhscOT8mPZWU9bEf6FkWlzBWEn
 vfHTGeDMLkBnTgdQyIsPMHMfFio3eJ3niZT23dVFlyB4hWweKDYaLirMXNGOtPcmDdoTzI/emEI
 QJvBKeAxjEE4noO5uyQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af98d70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=fBJCkzpva8F84h5TpLsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qzMmFc2ZF8EXZaMklcTgYYcBZBvAmxt8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX7t4PtXK66Voo
 17B/EAtJ5nNZMXwoqrmGj34BLWalxt2Kll8vp31xZd6oomWMihZgL7yWfITVdagBClpCfdq7/8N
 xT9H8Vop76grg6vAQ3VgoiLbho1tP5U=
X-Proofpoint-ORIG-GUID: qzMmFc2ZF8EXZaMklcTgYYcBZBvAmxt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150042

On 11/11/26 1:49 PM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> audioreach_put_vol_ctrl_audio_mixer() only stores the new gain in the
> module. The gain reaches the DSP from audioreach_pga_event() on
> SND_SOC_DAPM_POST_PMU, that is when a stream starts, so changing the
> "<stream> Playback Volume" control while playing has no effect until the
> next stream.
> 
> On QCS6490 (Radxa Dragon Q6A) shairport-sync uses this control as its
> hardware volume: the volume set when an AirPlay session starts is
> applied, but every later change from the phone is ignored.
> 
> Send the gain to the DSP right away when the widget is powered, and
> report no change when the value is the same.
> 
> Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---
> Found on the Radxa Dragon Q6A together with the two fixes in
> "[PATCH 0/2] ASoC: qcom: audioreach: fix S24_LE playback and route mixer
> disconnects", sent earlier today. This one is independent of them.
> 
> Tested on 7.2.9: with the patch, moving the AirPlay volume while
> playing changes the output immediately; without it nothing changes
> until the next stream. Builds on asoc/for-next.
> ---
>  sound/soc/qcom/qdsp6/topology.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 612d8f03e6e9..5b3378fd29fc 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1323,8 +1323,19 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>  {
>  	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
>  	struct audioreach_module *mod = dw->dobj.private;
> +	long gain = ucontrol->value.integer.value[0];
>  
> -	mod->gain = ucontrol->value.integer.value[0];

We should make sure that the graph is started before applying this, if
not you would get dsp errors.

--srini
> +	if (mod->gain == gain)
> +		return 0;
> +
> +	mod->gain = gain;
> +
> +	/* The PGA event only applies the gain when the widget powers up */
> +	if (dw->power) {
> +		struct snd_soc_component *c = snd_soc_dapm_to_component(dw->dapm);
> +
> +		audioreach_gain_set_vol_ctrl(dev_get_drvdata(c->dev), mod, gain);
> +	}
>  
>  	return 1;
>  }
> 
> ---
> base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
> change-id: 20261111-q6apm-vol-live-d6bb1dbec7c9
> 
> Best regards,

