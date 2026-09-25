Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447B43DEA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334167; cv=none; b=hPUXKn+6I/0NlTgddnUEMaQWPOoTX52i3PDTE6DvngVJIzyLijITI2lA9HoqBG0re+Dx3FRK31WKxpBVw0w/xKzC0fHL2ADAxabzoXqI2pQhgcVH5KHMM8bOwDi30iJfoa/QfUeF/d1GaHmeef9Fzy674BlNe4BMuFYThrsfyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334167; c=relaxed/simple;
	bh=LNOMjLy6wAcR7Zrv2JQzDuQOs+io2+5LVXSdmKnrQY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCz6ny2aR5Em8ARFxBuPzuWT7d2ItibVm7LlN+2HmnPlBJIFult7MLlz2bsFYxI6OCPiFMWC9UcOwXs11tKCCv5iDf8f/k9Elhxh6To0AoNKFq0sx1do1LGUPiGPkGSvXOqz/hWpxt0YmH8U8cMJXloRW/BiE13Nk4pROBj/pRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvFh2CFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bisctOx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvFh2CFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bisctOx5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YeOF1193864
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=; b=KvFh2CFL0Ck4gOAb
	oI26+pbdmpqxQbPkecyHre41ejQiajPuhGGBInHpPGWQbdFySia5lL6pZ5F1B3Ma
	GIockcThtNcuuiBI1f0w7/fjjcsAu1GKzdpEgeYCTdOwzYWn4AQvrqeIl0GOA4w/
	5ZS7CAxkvhO5O/KFIuMTcE4xBxWRVDpewgKusJ0S1g5Gslp1tBg8Y1AC91ZVC16C
	I6bTOYJ5eJKQPjb/oE/8dHv85aGJ0OzjRfDTgppuAkWjFdZhjbFrN/W6MERqqKLF
	psjK+AiB+jJ2oD2ZC+/XHxzz7dYFhRGuLavtAkQLoPzyd2yvcW8iY/4TnOJUScbC
	MXKhrw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k4s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so1556506eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334162; x=1790938962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=bisctOx57CevOHI2baXrK83xChr3w0N3tdNDy232PBOtzftVnfyal2lpgJKvVt19yf
         XrIUHUm01XO0G+Kn4trf2YWcDtOgX05UqtsqlxK0kzxraXnXtG0MTWTnLF7uGfvFptZj
         U/SDWkKdFnUHh+8gpoU1xMh/vAlJAwbHHbPKhgS+6bHXhSJ8H6sr/FqZzvUJBduynveI
         8+FxgxSOghK0xwNaiiPNfxpdCsidFv9oRnbTh4PhoDc0gJRY1ihP84BHCWUyLj6GdaB3
         7lkQw53qvXE0xq6/0aQv49Vx48l5f5btY7jXYJdkWs51XD7EyNigrtKhbF3OkUoZDLuu
         qERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334162; x=1790938962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=fWss1DOfmuuTvtC7MjBvmcvIYdV+4WbSn7R5C1Xvyztsj1WrgYJXM92i5JmnWPyVTA
         iwF5wHZGeiJnrWn9ksBp9N85ArEFycyfrOmSfR0QNPfl3ZtGMnoW7y6RnvJCxsfRnUwd
         7sriW8kLEDebdW7JQzjy+xpGSjzfC7lrgyUQQAYY/9MUfhF4MZCSWsZQn+wPqAQl7RnI
         Mnza8oDJm1rqqOkLivyJRqkRTI+EfcPHubV/Xct4XUrbeblB7NSo+gymMff7NFAqXXSP
         zUep1Hw9JUmfVKvwI6s53zrZgyVBhZDbMeSjh+0kL+AwGSPRIlqmmfaWLswzdCi4KwB4
         iLsw==
X-Forwarded-Encrypted: i=1; AKwUvBzAr2lYVx4asY3KjSD71TXX8Bqrioedngr6ozyHVvdyBUHUlTmKRVLtdHLhkoBRvVAcG6TYGW1w188JRBTO@vger.kernel.org
X-Gm-Message-State: AFuF++nnd0xBJfJxb3S4sjGF/hxgW8RoeKgetWP/1xsj+iG2vg8/cuS4
	eq9rjrDLBithvmyUV/cAYHgsrc8XqN3c/1f3Zw5t9AyjzAOIMV/R0CTz6iYTyAeY6vLx0/s68GL
	eb1r97nIa14ThHu2gTMfoRBgu1XENRvtX1lH0KXDh0bke0C46KlDIpc4pjfdca0DCEke8
X-Gm-Gg: AYBFou2aFjyXrSp7YLTOPzKnG/kM8lC1Y6XbOCz+BNC4ahl4a93oLj5djPYS8l7Vsun
	qsfHMAsFouHUSSaeG7Rh74//iTdN5p21oJLSoNVx0s6tVGvJJ5seA/QDuJJ/diHNN9yGYipfgRI
	F91qoPD8mv9uzQM9BA/qkCWzCjTBFLg19GYVeWfXltEUfDuMypB1u1pQ2jmdyl+GuzmiAYJi04Q
	6RmP9fw3twh/UEIeFoa/8KIOj+jcslWvH9jgu47o6lmG8tTE91pZ5zHcqEabDL14j1d3CgxBH5M
	uIJTq2JpSH4H8K/ffP4of/X8ZY3vplTBcm2AWRdRbv8N2EeZxTmTOqmIZfEDCAQMwGOEQ8wZW5K
	ml4BME9Q3qXGkyBYrFozBfQEH6oh9
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634819c88.47.1790334162208;
        Fri, 25 Sep 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634776c88.47.1790334161284;
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm5428954c88.4.2026.09.25.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Message-ID: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KJIsSpKD7gWBPahf91y20go1CVe23PCN
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab654d3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=vpuhTeqA5xwXINrO_jgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX1M6FtCyqfddp
 Pfq9qbNz19kzhWRkGwnuXEQXCB8R7pZtNCPh0jLsfiBChxGpzRPquqMSUPfXL7uVvaKKT4m0DeG
 vBti3QfuOQ1lDkyDoq+GwqmtdcHVkEpng/qpSoBwq5JIrF20y2Wf/Lr4hJtwd7SKVO+3bVQ5Nbj
 fx9aqkoNjR3acpMa/0OqDlRt5h7zQwXfEMIV0Dm6rvdgnMTsbGfuvAErt6hScN0agm8iWVLlm6P
 sQdrdb5i7Fosc8WrqzIMVzsHK2avwGJdW1zL7eRdCGf4VaIdWHtP4wmjhHUGR3zrOToMYVziecd
 MON7pa0TVqbeQoEzA02bGR0ZDV/wZZ/HKer8tDZ9nFqYVOknt9lpds2PQPJxd73ASRM8mIJOSUR
 HMSNuHHTEyUmFH1H1mA7kOQtC7tqvC2zjOwEgzqilAphpxcb+MBRonl399JXhBPKyJ+3uIE06rm
 6yLE5GQ/Q5nZ8O4DUpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX2brqTImeBBPD
 d3S0pea+dzAx7NbdtSk/6s9ppGzuEaarLOqC0ALobrUnyx1hAo6Tp2fkH4r3Y3JBWgkWn+eAvk6
 5HtgELYI+jOp1Yxi37UgeHlbokmlUmI=
X-Proofpoint-GUID: KJIsSpKD7gWBPahf91y20go1CVe23PCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043


>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> @@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	}, {
>   		.compatible = "qcom,sm8550-lpass-rx-macro",
> +	}, {
> +		.compatible = "qcom,hawi-lpass-rx-macro",
>   	}, {

Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` containing 
`lpr` instead of `macro`:

     clock-names = "mclk", "lpr", "dcodec", "fsgen"

https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/

However, this patch only adds the compatible string and reuses the 
existing RX probe path, which still requests the clock as `macro`:

     rx->macro = devm_clk_get_optional(dev, "macro");

I do not see any Hawi-specific handling which requests or enables `lpr`.
Should the driver be updated to request `lpr` for the Hawi compatible, 
or should the binding continue to use `macro` if this is the same clock 
from the driver's point of view?

>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 79abbdd158b7..46ae627ca594 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1896,6 +1896,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
>   		}
>   	} else if (maj == 4) {
>   		switch (min) {
> +		case 0:
> +			version = LPASS_CODEC_VERSION_4_0;
> +			break;
>   		case 1:
>   			version = LPASS_CODEC_VERSION_4_1;
>   			break;
> @@ -2166,6 +2169,7 @@ static const struct of_device_id va_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>   	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
> +	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
>   	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
>   	{}
> 

