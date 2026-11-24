Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508597;
	b=xHSUoT5rP5uYx1yJtzx7PReK8Wv2j04TDPiZDv63rQPmWafaPF5s0543Xx3bOKQpUhZQ
	 eqLHlYkYBTex3k4OoXZLV21pYFXXemmwvo7ATWA4B3nlQwbzlY8TSEBdNV0oo/xg/9CGn
	 zemfCHCT0kO3yWfKRzXRyfXQft8XmS6B6i7Q0Tk72BDlqmUHINSZvIIvcJeiGD2J2fjHz
	 xbjOFikWqSYz7N8ffLPA8GYNHCbmqb8kx7azz2xstgggD99wqpahd5BJF9XF9KtDaz0x9
	 SKrjsOPcVC//vyDzJzH2NiqU6l0cPYGvdWHQEJ33l42N2aiGpQ5Y8+3WsYA9uxDnQdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
	b=rEa6HouU9IDVP7D0ISFSwfBiXWide2vde5j3qJ9T7EDLQEMVWaTq0WC3csXoJkerZDEf
	 tdCRTCX88os9FejYv2hvG5KroH9sdNEj6NRS7eUoip/438s9ehX9Dbhm9hAt5SywzpU9C
	 P8GNRqFXtBnO9Q3s4yDz/xF5GsXuLxoSmvOEc1dHthgwYWz+3/KlsVs/NVEYp1x3g69Mf
	 H9+NBbf4vieKkIwHoGkbKZ5fNACCL4/CbNQyjSs/85JS9GgZKqX3u5HXIz7/KLCCM6JiX
	 XO4zQWN2TMdM4buRC3SH93r4fLE+UiyCnz0oOtHsHBDXPN/nTilMwCglBBCYSUsJCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXYJVFJI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FF606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXYJVFJI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mDrf4136037
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=; b=foqaj1qz8J/gqF0O
	BbRV3/+X65rWPWn2hI4Agb2czxq+zKzpoUsFnJqmYaCO7ClMvM4PG3OWsZ4Ni1cu
	Peq2aJXiDlxpT0rMA0AmYRQpml6SXSJqqI10EHFzpxo4oxQPWKq/DgpFrFjYPGOY
	gWwhUG8hVXBuW9l20zzdedN7L0wBrwpUkRoSrqKJtrGguafdkTueH6UfTHM42s45
	347306+T7J0QUFDpvzd5bmO6fUSVkwog0u33F7OhJx4DhVj6w2e6Ry0IiZrxNdPa
	wo1+J5uJueTu5Gx9gzf+Q5n4LRCtDm1fMOx8rFn4sJFdoETxnys2L84LHsMa+aab
	4AxSWA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgjnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so5073104c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508595; x=1796113395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=WXYJVFJIeB3i291UdN9BU94S5scZUNvhPRiM+HyFMvqAVoD6cePYvlL27LIavs9azc
         /H9tZjk/mdev4jQUKIGJxp5bZQKVTjpk9WLIlLluUppFFpC7/XjRuo9TE8li59cPmGrY
         /cA7brncGsR8ZIdGFyX2aW54hHkstfR3LvjQnIxKdi88N+lUcYMr4W3aeb4jxip7xSMv
         wb2g8g5rZ6lNNg/sKOMc/vc95cahu7U+Q/gyNE6wjdzGRQNCHuvbn3fS1+HUqphABvyK
         U3KT8C4E4BASVYLlnb9Ivlok0Cb5hCSaOZsUZDAQxh9lwxSC7DUobj2YD/nT0qdnDJYq
         wR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508595; x=1796113395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=G4x2dnLM8VQ/B+b65SDPzGC4nfkVPNax+LKie3UXUte53WNURn2ENWaHBxWwXTm2GC
         1sRHWRhKVPeXbzBYSuPFFPAkYiWQjASioJWLupQtuzkeKNzZQjuQMBum8+6wc1A9U1VE
         hV9bqdl0dc7K4JHQfUHdukPg68XVHU9Z+l57CWxJMneEIwarKvqzNJaBpkaK6Cqj8X6a
         QNpkUM6IOdZ68uP7jh6mKggm5083RppcRJAWkG94DG0FR60sYez1/1XNenIC+0P8vZRJ
         ErVXz8f1WysZqoGDrryT6/PiXrpa1MDZpr4yt4N8qNIkLWvqytZjmYmLOLY9h4OfqZyP
         2qIg==
X-Forwarded-Encrypted: i=1; AL+hErGIP7YsQUmgeDVYoAvFH5SCyXu8ciQhtWxrFPvg2+pGVh6UkIE+ENnbcmcMfLUUf9DFw413V7MfBxkyMrQM@vger.kernel.org
X-Gm-Message-State: APuU4Z96NEDKkdjkTd7R2TEg4vb5CTm5icMpgM+vP5HWi98GFU6LS5c8
	cZzmI4esL2xueivM+5NmMyCxYZSYFHjygDmxqVLyHTBy7ja9FhVT8wq8ePolJwHGZX+BFHE+VYm
	o2mnkwtMl+B5EHRm3TVAII4D3KnXJZBj4NcwNKz2f/JVXRxxrXuGpEfZ3ppeFI6FFCAxy
X-Gm-Gg: AZFdTZcGGXLe4wUwzMgFpJIv0VeuHUY96mcUIC0xI4sLP8c1IKDuhL+SwHHTB9/9jMU
	8Wv4pPqcRVz9ZdmMXeWo/W63C0BLtdQsE4Y+Z4jQXvqYpe+MeCEegnJpHFOV2otx3eMvwGEjFxZ
	36z/j6WFAuTGeJPGUAw9wao05KriSsaqwmEsfhs0sNAsdIBzIJGWuApj/NzBNNjIw9B2Ee1xoim
	4aWMpwlvD3crRZzG6IUnupenVVunmsKI2KKWHh7ZuEc+TjOI81u8HdugRq/CbvfnacRBjZVUlKE
	/KFDek/h7cmcaZGE+1PmgWAajFhgO1719BA6lZjgS0+esxb5utjBrJzGm8SP/Nb6oX03w0ReBPt
	VnkhgzFHMz//tnyT+CUc8267c5c//XMrdX8+fx3ztSrd/RUM+5ODVRVsKVgOVwqDZETnTBFAdzr
	niW3E/Q6Fd+exl
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603401c88.28.1795508594448;
        Tue, 24 Nov 2026 00:23:14 -0800 (PST)
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603360c88.28.1795508593798;
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50686826eec.10.2026.11.24.00.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Message-ID: <808bb7ca-ecb0-4594-900e-3114fd26eb97@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:53:08 +0530
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
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sc8280xp: Add support for
 lemans-draco-evk
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
 <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX0fxI4wUgzaCv
 fAYspn7umDQk+b/uH7nBzdqKuF98BJ3Yh0qR3l47pJYtRLjJaWZoHMvmZyCQ0Fai8VIAaU/31Xh
 Y2SDPBxZkaWj4S5grM6abnbGhaRoOMGZzJgr7mkBQWlA0iGzy3qj9CsMj49JM108+f7mZhqxBR6
 2uLw5swDGCKKbhYOgOyOGICehTAn1nibmWYCeFG2+R8snmdxDKEHxVDmhyBaPZdS0+gIcIdFt7Q
 YAsvfXX+yEf3c2EYJZM6H5lsH9mxJBbBuIeXndQBvR+JlEkFVQSkSpuBgXqRuEDj+wFfbThrxid
 uFhJKoCAV/a2T0YQ2nlh28MyKaMCYNMcg69tPPqNLXI31BLq8Wj7XmNFJaI3frgmh/7f/a/aaZj
 VP2V+En+69p3k9SW55Sgg6CSzY1rlSftzxW6yMdT3fQkoG+a8kyi6oOxBmKcohqdaJNFyjm+S/e
 JVaxZdQ4p8wqjgA0CPw==
X-Proofpoint-GUID: ZvN6n1KtudYTFOC9Eh58skd1UpEBRFs7
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b054973 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=K-guWxSE8BY5skIoOz8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXxidNwILf8rA4
 Y0N613+6rMI0vJeY1MZcC5kccBopnWO9VZo6I2NUDDSVv4hTlK6Nkzu83A1VEOAiONGXTnHOdtD
 bLAPb3Evu1aundcd5TIiYyUuXFOVJGI=
X-Proofpoint-ORIG-GUID: ZvN6n1KtudYTFOC9Eh58skd1UpEBRFs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032



On 11/23/2026 12:55 PM, Karthik S wrote:
> Add routes and controls for max98091 and va_macro for playback
> and capture. Add mclk enablement and codec dai format enablement
> for playback support on lemans-draco-evk.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e136407c56bf..2a542699a51b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -44,18 +44,41 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>   
>   static const struct snd_kcontrol_new max98090_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
> -	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
>   	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>   	SOC_DAPM_PIN_SWITCH("Speaker"),
>   	SOC_DAPM_PIN_SWITCH("Receiver"),
>   	SOC_DAPM_PIN_SWITCH("Int Mic"),
>   };
>   
> +static const struct snd_soc_dapm_route draco_lemans_dapm_routes[] = {

Move the audio routes to the Device Tree.

Best Regards,
Rafi.

> +	{"IN12", NULL, "Headset Mic12"},
> +	{"Headset Mic12", NULL, "MICBIAS"},
> +	{"IN34", NULL, "Headset Mic34"},
> +	{"Headset Mic34", NULL, "MICBIAS"},
> +	{"IN56", NULL, "Headset Mic56"},
> +	{"Headset Mic56", NULL, "MICBIAS"},
> +	{"Headphone", NULL, "HPL"},
> +	{"Headphone", NULL, "HPR"},
> +	{"Receiver", NULL, "RCVL"},
> +	{"Receiver", NULL, "RCVR"},
> +	{"Speaker", NULL, "SPKL"},
> +	{"Speaker", NULL, "SPKR"},
> +	{"VA DMIC0", NULL, "vdd-micb"},
> +	{"VA DMIC1", NULL, "vdd-micb"},
> +	{"VA DMIC2", NULL, "vdd-micb"},
> +	{"VA DMIC3", NULL, "vdd-micb"},
> +	{"VA DMIC4", NULL, "vdd-micb"},
> +	{"VA DMIC5", NULL, "vdd-micb"},
> +};
> +
>   static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>   	SND_SOC_DAPM_HP("Headphone", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
>   	SND_SOC_DAPM_MIC("Int Mic", NULL),
>   	SND_SOC_DAPM_SPK("Receiver", NULL),
> @@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>   };
>   
> +static const struct qcom_snd_soc_common draco_lemans_priv_data = {
> +	.driver_name = "sa8775p",
> +	.dapm_widgets = max98090_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
> +	.dapm_routes = draco_lemans_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(draco_lemans_dapm_routes),
> +	.controls = max98090_controls,
> +	.num_controls = ARRAY_SIZE(max98090_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
> +	.codec_sysclk_set = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -743,6 +778,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
>   	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
>   	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
> +	{ .compatible = "qcom,qcs9100-draco-sndcard", .data = &draco_lemans_priv_data },
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

