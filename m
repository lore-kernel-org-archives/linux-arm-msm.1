Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089767;
	b=y2A8nzzpcmrlI7jNLZKxHK18d4/f4eGfarCdNCBSyCUc/eEJjXpPASLpyeIihYPyFO3r
	 LFFMabzueS/5LpA6H3GnXlm7MOglGWff9yWtTAe6FTiEQ+h3KIR+QtFulg18dIGL16hf6
	 s9BgBGbhG4xFrGYFMudlc8ltPhzneXSR6VrlGquaX6HfYNWipe6zjvh4ZXn2TgnbOS6Z7
	 A7VqUw068kDsGf6w75ufCwieL5XjO6MArSglY9Un5bqGth07GK/zZgPZFuJVihBcYL3fA
	 WJnKdYGYTgiyQ1E6lZocYJ3XkKfxJQOkoBE0IXxpxUP3M9RTfhAlmgRIS/ZOAPR3XNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
	b=h6WP37ZXr8SoRMkpaVg6BqhQA6whxyhymALSotjYX9YtEj/WJgQRju0drbDVSPTLtuWL
	 jbAbqdgHgzsvgXYiZHWcAKTkZpHjqBRZUN0umNaadmARzkqnCwjfYabSepNu2Z0AkHEQf
	 BriRAk5Tc5kInyn40TWjD4KVRY1yaaTP0nI8z/4khrhPvZP1R6NwjEqkuIv4AowQQmsT4
	 qDNHKIbmny/m+Mpkl7rGVcKyYp5rS7d0ttvya3DLavkKhBwwbEZfFY+983Bkrbl2tWbwr
	 82C8R86rIUgW+PtXkVpDAUrSEPEAGXq7HCiDnGv3bNTRZ/oBOHDERnXi+fR8mJ6Mc+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mzIx/jwo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D75606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D75606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzIx/jwo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R7mqSt2141656
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=; b=mzIx/jwoIISBSLsI
	brqUo+tvPFgIKfdROBM/ENqEm8Z6RQGuegvcH8/yyh4Kj8KbO09SLKqwvg1g588Y
	sIaVjiEpqcgUQYKPpi3wxALFrHiC0RZUd6QX6U0omfZCETP1MHHGu99XQ7nUMGyl
	cAJtYa8hUVzBzfJUG9T1F+zJ//LMULGJMlvlm6mi6g4luv7wdU39B98weXlDiUDS
	OJ1PAwjlyeKW4kxuYneleHuY4dL6lLmjw86d9PIrfWtVBjpwihZuht9mWbyB9Y11
	IDszBB2uoFXW33KLC5xwVu6TbKzs1iU1J6qsKaVXBCIqrWmtU8EUdBySxYpRw+9e
	VIVgUQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw204wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so10967638eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089765; x=1793694565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=T2KnywB3ELqNGV4RPBeI3kSAIFaSCNOVhMGxI5Vp+fNbF9WOtE1F5yhFwTIW0OHHpc
         9cUod+Iy+sdh2qo6fKtmfhW8xmES+vWkBms9ZQqqGVmWvDXwLBo+aOn8cR3QR1Iz/Fow
         aX0ntRD7FWWxVZZXUvDuxTeRE55Rjq5LkxjltRUejvobsE6RXVsO63hQlgDlFgwCsKGO
         ZzFArHoowr819Icx8u0dBTtgRBbpMotcYH9G7QdkcGIWydeQ4irGG0wNQ2QVNv4RtOQn
         BsUmJWKEP8DZpU7dlZmRW7Hh00jPROgJwYUhdxykkZfnreLXW4Se0+zPpXpS0JmE5wwA
         p3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089765; x=1793694565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=EJnOWlwDOhfjZEduusc28mK7aBUOTvctX+8Kiv1GDpfmVHie8pkO1MjJvBRSe+hBQq
         NaZDId25W9z+5vuitnLFYNr+r9P6TeTckrdZJ3EGlY9Z2G05szR/VTx+4+RHSQXWMGqH
         Th0e0cNjQj+iCOD3yArC4sD3SRsJEQnoCJNZaz+G8lo7RAX7wwIN1UqFbTxb4IqG/RFC
         rkd3HScvHQMPHC8FL8rbfnS3OkrYFys0Swr4zUOrcK9jEZxaop4bbzep8//2JRmFPaEL
         47R45qECGziPNmiZs/tw8ECoeZ8b6G2NPQZTuVFGKAdlxfmbkH0XtzeOIJxnLb+zFStt
         TFpA==
X-Forwarded-Encrypted: i=1; AKwUvBykKDvke/HGfDT6GuyyU5c0mrcFURwb/QQ8JHapz4pBfoAv4pI3zlcVnCxuCSaXWcQrtOnsl8RJQsxwgfmw@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ7HU5fmqVvXmzfmmFDI2uf1jqyMi6xEsMILHJJyaisdHncA5c
	dRybDQoLEp4AKK1YXTnM86+G+H1WZ5J+rWuE/OiJzMQ+g7RZhQkVO/s+jrOyF8pjOi0Txfj6k+r
	jBe1Y/izzg/cHG93ceJc23TK7u+LWVe96XkQEK4+xZz9Zp9JdcXmtyiGRO66+YrMlUApy
X-Gm-Gg: AYBFou2gxXWHR3JjK+6hkBY5/cBqxM+MK4jAU+ppHgGyV0w9oqmQXnQ/5PQIuPm1XZI
	pKAVQWlFfv6crKjD6GstTci55nFI4wCPLT0n1XYeOtWGdYxZGkjHlrzubVzQ4svodeicZa0WEBF
	kTOPwoj/uI/oiDpxhctSHuypEgLI4wcVY/LDpr5Kpgqlf8ujK7dDNYkviJLrkoF8Sl6QtxRrElH
	b5PThGgl8jI1Wdggt7l6Z6AI3uUZ116WYBg45q1SC4NQkJAUwrftQPDuQB/I93BPBNT3L3m3WM0
	vR3a1zCZRQrSeq+P1SnTRGccX4i6brSDlXj0jysJMIJypPurah+yZpBFe1n1LWX6G9SVfme45hM
	Sbj1lJXo/6JBiE3DxHiocUe30oDtS0Kp4
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502666c88.20.1793089764946;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502640c88.20.1793089764414;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm31709403c88.12.2026.10.27.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:29:23 -0700 (PDT)
Message-ID: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:59:17 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXxWZCYplMS0PB
 hC4rnoyobR4htB+ejsJFGCYUVfLs69l7FyHe+yhWaC5EzLyK1OAedLzls0i9nrbRssO53CSFtle
 iRUBoS9gvfWuUp5auM8HVFm5rxqGGm+TyRLy1r3XQxPa6ovMvZ5l+F7txCJ7GY48Zn/E32byx9r
 z3uqPDduaTx+7eFNHIoXJWqtjg2+V+0LIcueRNtlkZW/8ZQU1zOGT3dcQvaGfmjxqbG2IK+ctyD
 odmEOS3wsExzEB0INSTp6FFJ2xcd2MRk4+Vzh7TbbX1wWj076PrjdevJo/EFDgIaj6/uMzZ5bQl
 R0b7YqGSDTDxhhr3qLkgtMSeNmwhVEU4+DgzfoZW0apgfdDkJrnpImxLtAv/XIYqv8BpDUyiJ+2
 2G8GonUMnQOlpXUQ2VTMYCuQJfMzO5CSWhzqXfViQol2dNuKr2Hycv+vY2G04aZJezy2QbT08PK
 Cgv5aQXKe+5uAGqvJ8g==
X-Proofpoint-GUID: 9HMMwhOw2s_y6I3DzS5XtDSZ7P1EC7kI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXyM5EySCyNnYU
 FNNog5qHlOwmIVxvG7/kVfV6JHJfDlZ7IDuSsxfdu0tOQa1ApOPSW6OFss6gh8jh55RAT7Dh6iM
 oFs+EMwhD6pqbOTUeL2zYqmWvAfpZtM=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae060e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G9vM1blcj23d2gLDv7UA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9HMMwhOw2s_y6I3DzS5XtDSZ7P1EC7kI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

>   	rate->min = rate->max = 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		break;
> +	default:
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);


S16_LE was originally added here for compressed playback ( 
https://lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org 
).
Could you confirm that compressed playback is unaffected by skipping 
this constraint for the MI2S and DisplayPort backends ?

Thanks,
Prasad

> +		break;
> +	}
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
