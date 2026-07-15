Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9BC425879
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138898; cv=none; b=cSXYOcaJHuQF7x5n1zISASy3CwYx5XdiCZV8UDPw61yMB93VxUXu8eUUKOOBxOgpvCdSUEF7pcf/REVQwMQL3CWUkEWD1vrfn31iHGew8Mys3MjT77/7yxuBRdHVpl3WBzOgtR7MGQ+KPQIrosYrpoRZmSpqxRR0uDLMZZTypQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138898; c=relaxed/simple;
	bh=mKIBs623jp9oil6dkw2OIDAx86ckyTenDNJ6awWuF0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eemZtKst/bfnzhq0QYfyKnB4w8SEskh0FE5lPA6RBOgPqMZM2IGRawCzwab2kSWdEgMWspRC6NzvgGgsddtx8/8VwEDneS3PGn/1ZiILkouEr7rNvPwXfEAlvUZwxqzihWpaboqDo03UxbNzOex/8VeOsu4Y2fkiFp+UKqIwVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT0pazKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwckjlRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT0pazKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwckjlRo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FHLtfx073993
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 18:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=; b=NT0pazKg/IrAxKtL
	WvtsmjqL56BHpjsAj+ReAUtkZiCixk3zbwdhsaqhSgdAUMUahOFWfDSzvDJBuKh+
	BPd4ZYaKRWW0wkUXU6DcWOrYw6ElM6CW6Z49AY6cm5Vd1Nzf5PcZIwRcjMyo46PZ
	6eC8pjZmP5Au4xOeHH7LdVgcU6Bt6frj5PuDr0sI8N/HJhScpKvONW06CYsow1Zi
	9HcbhuFjQAOO7UDpmWKPFYydgAkPmohtGqPbiNgbSZvUDedZ5cH3gmfKZU5ZuzIw
	FoLmLCTxyydI7kxZ0ODnQ/v1LK86h9Vrit3RE7h1VyPQYSxAV+WEXVpXRpQ+MnK2
	X5y57g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehv85sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 18:08:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2258359a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784138890; x=1784743690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=;
        b=TwckjlRocGqHIvbkCmJZYVamVzNezfsV3GFqFfLiWn//rxpS4Nv2JoeIYUYYGqui26
         UkZTJz7usWjDleYlDJFAPqA/CeHV69R7fvSvz107djc1eo8UyPV/hPD2Ug+uTeAWVqAa
         05Wg9qyCkFBvXiY9gToN+jpBavsgYYfAyId/IIp1lRS2piRSvdjxUVa7w3cNjGzxMs3C
         MYlPLuMKql3dOEA7r+5aWlv/rLsZKpyJzgbdW6vY+42azPlFtINRHhskCmydQyZ/1iST
         2O5zDpeaKBSpaRJzswA6QAy8NlmEQLevKKTTKqZgzs/tNAmINSAD2NmCG+GAAxQMe5dG
         UdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138890; x=1784743690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EnkQlStKJrYtpsK0JQwA93q3Oyoc0ORGYNf/iLoitY=;
        b=pf3PjP5cSDFi51gMyTpaLxJOiY7cPlDD8UnzlYqXR/14tyh+SwwVWOqSObRIEMwzZz
         BTaeWz5ICFGjBgII5H8Maq//piXqFujl8oALWBWQ/G/IaB2cMW9RyWskD4VvDca/iUZZ
         iw6i5DIZR+0Xx1z5pDDYzhLAMVPiUH4rQ8juEo4t6cvndNY3ydc92p1Y/yXeVNIubrYz
         1cK476KI3dI4qY6HNyRz4uBa1b2jL5I7VQCbM/m3ujP7YwaCGPL5drr+/ubycgzlrvFN
         9wZW2G+z0EMZ/UmomlhzaA+9ZtrTws7OsrLwSgUJyedPDMi1Sjgo474ggM8h2QG9Mtji
         VFdg==
X-Forwarded-Encrypted: i=1; AHgh+RoAHywYmvC+OgeWC77MCau//lAdvSS+f8w5igOuW/4wF0PdbL52EFwUnT2xGtaOHXywYPjRd7J/ku2EdWfk@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOQQQ6zPGXjwfwhLPqtwOYOrqUHFBfADEWj17p9gtBolsJ/i6
	LI0Mv3ZqnVGFx3Lgb9XLHDMa6J9+1HNcfiifVApCXNlELKqOR12OnkaefJnYc5RbY3PAbsOgh6B
	cnxbR0t/rVAduXwP+Sq7HaR0TvMegpQejozsJ0UDEaGZhoGWizRsZPItEeejFZIksMeCu
X-Gm-Gg: AfdE7cnnYyuIdahuIF+rc1kXWxCPW+qkZpAt/YpONUwXQHq4orgJEebia+zvCkbY3z7
	cSNgADS/JR0AnJd4rMNhApIYgYLPStHcd0m2GlwGSDZY6nU/3KPFW52aH6yqf771lq+89ghwzHj
	8iZOUwwnaewm+3Z/Tyk0AnKv37anYJUyCAt6pvYmH6IvTavxFLfg3vBsFd1ZgLRo4IX9KJXoM1l
	GUxysSytxBMEQaofdZe35gEvtsDPZcy+FOLHqdjB7t1oPFcnys6KUgt1ybFw2nu8UWMDFtQ97Rf
	h5DHalqdXd01P6EJFFCOYcrn+iTvgW1wuNqi0k0oBiOM8hIbdDXBN2x+tAKaardeUSEDui00cCq
	0nGBEJbGX66wNUoaEXnkNgN9Ddpz1IqQU2tpfclYPAuNL3MH0QQ==
X-Received: by 2002:a05:6a20:cc0e:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c36c44c6f2mr3864085637.72.1784138890301;
        Wed, 15 Jul 2026 11:08:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0e:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c36c44c6f2mr3864037637.72.1784138889706;
        Wed, 15 Jul 2026 11:08:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.226.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm3411187c88.9.2026.07.15.11.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:08:09 -0700 (PDT)
Message-ID: <847396bb-2cc1-4f45-bd81-33ab55d3af6f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 23:38:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-5-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-5-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a57cc8b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=n9TYrBAzqQq97mF55NlG6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Wdb1h0LgAAAA:8 a=0ecicO8UAopkaP5Vd3UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfX+4mL4gnPqn8V
 MVwArdfUPWjaL2pIKk/ghymIaIxD9TC5MT7mYbhUpV+GJeYsAFCklhERlZNFdDViEoGuxOuvE2H
 X8AiVBVl9z+XthxmNB8PWdmR69UsTGnJftdFkgF3FsnzNJZ0eddRTVXHKOA4XQeAAJst26xUBy1
 H6p2Crsf+Kpcueen9MEfAEhuBEDlgaeJD4c4/tVkPrU5NWVAT8Bpu7dcWoghTzfaeeOHSZqthHT
 ThrC+SCqBDoohJlyS9vpRO/BqNqd9M3EronkpdLgH6ST6i1/2Jv6qmvZ3+C1F0xrFaMJu+h4x2y
 4XSOZ3hw/tFueXbAu9tzYl5b0bNrTbjv+B40HLzxYJ6ZEBJzjELp9YuJGlEkB7XEgmGck2aCmnG
 bIR51IflungKGT/OQ//E+LoiUQ9Gftx/hUqWwIvHo/g4tppw9i3Kxcm+FpXIJeJSJSDFeIjA3I6
 je3spFA+yASHxamxoGw==
X-Proofpoint-GUID: TIgzMXBjzS1ZxdVC84wMSqT2La-BTVvF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfX2qwA01DIoG1v
 x+KikkCy4Ap9XPq9iBYtcYP4VnNvSSs9BI2RnHAviArVljqx1wRxiw94EDslzJwirjq2KvkdcoW
 qskJTpoy57i2eXEdEtCMRzwJU3H5RVQ=
X-Proofpoint-ORIG-GUID: TIgzMXBjzS1ZxdVC84wMSqT2La-BTVvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150180



On 7/15/2026 7:32 PM, Hongyang Zhao wrote:
> RubikPi 3 connects an ES8316 codec to the primary MI2S interface for
> headset playback and capture, and an LT9611 bridge to the quaternary
> MI2S interface for HDMI audio.
> 
> Add board-specific DAI data for these links. Configure both directions
> of the primary interface for I2S with normal clock polarity and the
> codec as bit and frame clock consumer. Program the LPASS MCLK and BCLK,
> drive the ES8316 with its required 19.2 MHz MCLK, and enable the generic
> codec jack-detection setup on the playback link.
> 
> Configure the quaternary playback link with the same I2S clock format.
> Do not request a codec sysclk for this link because the LT9611 HDMI
> codec DAI does not implement set_sysclk().
> 
> Select this configuration through the RubikPi 3 sound-card compatible.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 885ec1e3e575..1354eecb56c9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -410,6 +410,41 @@ static const struct snd_soc_common qcs6490_priv_data = {
>   	}),
>   };
>   
> +static const struct snd_soc_common qcs6490_rubikpi3_priv_data = {
> +	.driver_name = "qcs6490",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	SC8280XP_DAI_DATA(

Where is SC8280XP_DAI_DATA() defined?

> +		{
> +			.id = PRIMARY_MI2S_RX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,

codec_dai_fmt appears to be identical for all MI2S DAIs. Can this be 
moved into the common initialization path instead of being specified per 
DAI.

> +			.mclk_rate = 19200000,

Is this mclk frequency fixed ?

Typically, audio MCLK is expected to be 12.288 MHz or 24.576 MHz.

> +			.codec_sysclk_set = true,
> +			.mi2s_mclk_enable = true,

Drop this mclk_enable flag; your already enabled from the codec node.

is not ?

+&i2c0 {
+	status = "okay";
+
+	es8316: audio-codec@11 {
+		compatible = "everest,es8316";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+

> +			.mi2s_bclk_enable = true,
> +			.jack_setup = SC8280XP_JACK_SETUP_CODEC,

.jack_setup is not part of snd_soc_common

Best regards,
Rafi

> +		},
> +		{
> +			.id = PRIMARY_MI2S_TX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,
> +			.mclk_rate = 19200000,
> +			.codec_sysclk_set = true,
> +			.mi2s_mclk_enable = true,
> +			.mi2s_bclk_enable = true,
> +		},
> +		{
> +			.id = QUATERNARY_MI2S_RX,
> +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> +					 SND_SOC_DAIFMT_NB_NF |
> +					 SND_SOC_DAIFMT_BC_FC,
> +		}
> +	),
> +};
> +
>   static const struct snd_soc_common qcs8275_priv_data = {
>   	.driver_name = "qcs8300",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -480,6 +515,10 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>   	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
>   	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> +	{
> +		.compatible = "thundercomm,qcs6490-rubikpi3-sndcard",
> +		.data = &qcs6490_rubikpi3_priv_data,
> +	},
>   	{}
>   };
>   
> 

