Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560354;
	b=gPdAqPHbC10G7x5eIncKJu+RChG05kXkUqqZg49BV839pN4r3ETLm+R6gQAs7LOtGfcO
	 4+E6aYMMXDEzrUjgNSVr06KFPTfw6kr7n4sYGmtZYJIDyuQsWpTxmsOudVaCwp1KEaoxH
	 zROr/eKWW66VQs8P/fuIFoLvT+z0STO07E4M04NxoKRoZk1OaqPTWF2WlZ0VAXrIlhWut
	 YU1Ii34P/SLUMkwF4OOH7rcjA5QtOs7IjrMsGbZUXKC3LbUu3fnqDwMRHucXbTCvo1kfH
	 SPkcFpoH2PlNERLzTu9DZCdIEnLyP+uYUjjQWr/wiFJLqRpdEg+extMAufEMpntNdqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
	b=LQlwgd1qJOccgWkgaK7R26rQazcl4I7MCagPAGiG6TFtSuZdU0pCbLa7n8GEDIuc5vvm
	 Fu1PMuqC4jScEZpcTwZ807e6pmE5nobkExberId9VLoaaQCe0x5ixPVI+M8qLMBcdNyni
	 Y3pxRj/4R4uVbnyxoPyshQngdF/hJAY1ZAl+0Vjd799ttZQ7ByQ6p3u2OtP0nRt6iJhpi
	 7gY0NNbJRD60snjzw2oWwCSF12A6/XIKqDk1hjVM4NToAt8okYNAyGPRYti5Vf3sVM4bo
	 TDHG4LRtGIyz9N4xOCcICHoR6tJBTyyrTh6O6YAW3W35kT9hUONPkU32kST+8PwoNqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVOnp7bB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS4lcm5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEE606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AEE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVOnp7bB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS4lcm5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FD2K2392487
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=; b=EVOnp7bBUf1rZMNP
	0jeIi8Fr8Qn5/E7KxbJiAVyg84IqFPoqZwv5eBWnbJtvtnp7P8CvI0GdhPL8pXuf
	Rlwaaoou13zTlN/p+ijDCmum/VUMD+a+oS4kzeIcpLhcVrQA3DIQ/mlsNRWAZCvk
	wDXEGMN29GuWTQBeFkxasgEC9H7UeZGLv33dWTr3ij8R5Jc+3URmbkTlakTDE1wZ
	MFl2N0wyffF0g4ZhIQWxg6vGThagumIhZj9EgbhBRJ8ti8n+KXKmK1MX9m7KKn+K
	7CjkPcSKdKhO+CytpC3FjHpJT4EyFapbDfgeE+FAWVDukwxr4s0m3OOsnHMO4kF8
	Uar4cg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99w7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:25:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c902e0da2so1814019eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560351; x=1793165151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
        b=VsS4lcm5fJUkp1aX876czzvu1wmKTPkf0es/svn+71IPEYRbqWptdmjKWHkLo0B+68
         C5Dku2t4Blx6qkwYIKE46m022mKPVs8NdL4WxxF3iBQuD/ocvMK3wtjl7dWMrzsN1aFI
         TGVN+mFtYDz6VeykYSD9i73m2PT/HJ8rTvKnCPokm7MnPTsnwtmjHqFnLlyI+arwvaKT
         Q3jBwnF5UqE/VEcuTpr5a/nha1NWBqFNplNACKleMHAu5RVJYbCfX/nfaIMI8DPghyig
         3iA8rm4dHiBoPiHPr0xBROPPZheiTJ3TDSDa7dIYVMa1qVNt8RxkLxcQT+f//QNFBoIZ
         6yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560351; x=1793165151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
        b=Q8ig76+TQZtlytLrScsq773U9fRljtmuto6yhk+1ElKO6eTQbkPZ6a18/Bu5eh8jbq
         rtQBmCS8sGjAerGUIoQEoLAOk4Lot3fK68qrjvFcDITf4EziEECVn2PHcEzWtymcxuzq
         g0oi95mo5B33xLzsYdeQKqXfBmVvksOSGPsAIfVrUCq2JZ3FFcfycBeqjC13tHGw7Djd
         P2mx0mv/T2eeB1Mgjnla3pm+UJ7oV0OvLlAZOWvC+1Eat4vA+8CBwdRv+kHYNOv8A3LA
         IqWxOemjjCbzKbWOmyxFxrUwVXrqUq+y0uJLgZBy4/aIuib0TmOGlLrcL8KUfOt/UorD
         0wzA==
X-Forwarded-Encrypted: i=1; AKwUvByHYuSWixzz5uQYCketrGJo2WzALK/CIRNqF+rqufDNoFW5arVtQgv6ZsIA7qybmIqycOU23Y76FxAg3/mj@vger.kernel.org
X-Gm-Message-State: AFq9FYIgzGxpYZPOTdgDfvQRCN1jW4HKAWU9SrvE1Kka5I8OlNwavb55
	u8IaPEjjx0hsQHXGd+eDmfLjomcDCcMhZedwks4bnVzqGwQX8vHe/swS4A5ELc1e0qHfWkTq1M2
	TNP8jh34CmuzV+gjI3c3eX87gg8yNBz8peSvFVskSsWoiD+ijcsS+rJRJcm4NUG16iVtrl7gvsM
	E6
X-Gm-Gg: AYBFou3zsnyhskHvMQgL0D9Sy1OAkyAfdbYAuQOwMjB8lJAe2TFoV4gNFzQtmcd79ga
	I18WYzds4Yfo8yI+qOx3Q4GtYQgYdRGMsQcZm8Xf5Y58wsImE4FlmjrOataDTkoby8qBr64EytH
	PFngo24nwmeRccPmGw+hsSQNK+bVSr7ZLGygBHAU5D4fDrs/r0rppnRFY6Wjyf8cLy3xzEF51na
	gLFDxN7/ixCwwfWPaT18wubbBM8xgNZ5u/axU4377Ms4jfoDvz895uYg9XPKZ6mgvoe0ijIjntR
	zDvoLZthyLPKVvmECG1KqVcmGZaRFqCUJUB3JdZvohFchHSucPmHStfeME3GL9mQ8IsAo7SGv9B
	cNMY0/GXnCo+rSMd9rbBipCw4Po1QgD4H9f+BsZY=
X-Received: by 2002:a05:7022:121:b0:146:84fd:7b58 with SMTP id a92af1059eb24-18dbe2af657mr7294191c88.9.1792560350908;
        Tue, 20 Oct 2026 22:25:50 -0700 (PDT)
X-Received: by 2002:a05:7022:121:b0:146:84fd:7b58 with SMTP id a92af1059eb24-18dbe2af657mr7294155c88.9.1792560350341;
        Tue, 20 Oct 2026 22:25:50 -0700 (PDT)
Received: from [10.253.160.36] ([106.192.14.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm7184384eec.26.2026.10.20.22.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:25:49 -0700 (PDT)
Message-ID: <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:55:42 +0530
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
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX/vz/zBan8Ryl
 CQgyKgfpUdhy2L2VOPYVhtJZMrSo8Ibv3mRq/7juAlG1ZdudB9MpTd1syx6VtuS9YFXtY5vceEX
 Tb/GDDEIihLpn3J+6HZ+fiTsehxm3/c=
X-Proofpoint-GUID: oAEogrd_xl8szZpkFKiPV8HVCWB-1W8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX1BYn8cHJJZPK
 UcTWrpXB2LJgbqt/xcSXNeMMvSuMqBnuCYaloyBcSLMcsVIdSI36zk8tVPJpGpa5mpfbKuAIMFE
 lHkw4Wki9e2VIYlhIkaXdKfwFwHNoytDOhXm4LpN5I6PYJXGK0tDG0sZbrlz1ggsov9Qsgf7ZCf
 TZ0Tob4MxeoMlGWenYUf5qoVOBjAV9YtCBD8PJ8LeDfc6di+VyJ7YlmNTdS1dghlblWCpUBWWUg
 Pm0sjK9fzfoD796ABQePrqWOBvLZYyuZCKNtcM0xofZ4VKTejrEQKCxQDtEtKIjZ8OWWZv+U3mG
 HYRTMyyfnvm9YsHWe/LTT0gjGHkxBijiWHcwK1uqTvWe1jF1aTtP3OM0Ndem4IknEAS3cIl75vK
 Su6lyTI0qbqjRTK7R4CN1/XxIc/faBCDZwhRoMzZoDfGD+MdSWwZM1hq9xzvVbrpDkuzFPb3Dks
 QVc4068OzwMg6UhVMuQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84cdf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IUwO3uqH19SZaseHF7nCgw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iFd55WBnZZna6GIBd50A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: oAEogrd_xl8szZpkFKiPV8HVCWB-1W8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/21/2026 8:23 AM, Shawn Guo wrote:
> Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
> the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
> selection as q6tdm_set_tdm_slot(). Each board then gets the channel
> count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
> Keep the default of two when the link has no TDM slot description.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9aae6aadd43d..f3fb13145b3b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
> +	case AIF_TDM_RX_8:
> +	case AIF_TDM_TX_8: {

This should not be limited to AIF_TDM_RX_8/AIF_TDM_TX_8.

Enable it for all TDM DAI IDs.

case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
case AIF_TDM_RX_0 ... AIF_TDM_TX_12:


Best Regards,
Rafi


> +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> +		unsigned int mask;
> +
> +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
> +			break;
> +
> +		/* Same slot mask selection as q6tdm_set_tdm_slot() */
> +		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
> +		if (mask) {
> +			channels->min = hweight32(mask);
> +			channels->max = channels->min;
> +		}
> +		break;
> +	}
>   	case TX_CODEC_DMA_TX_0:
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:

