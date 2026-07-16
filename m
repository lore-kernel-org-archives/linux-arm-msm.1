Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974B3F7892
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195299; cv=none; b=F+onPKs93mdvfd8BL83ByUGdP2eWVk4W3TW0Nwxk0nvJ6CxXiqytqXrSwTerQxirdhg3BkGtzKdcPLYsFeIFL2MILYdSd2KSvWRBcFbrlUqSdKOtopTMAvAbzVH56ZWpHGJz3mhpqh9OyoVHpEbWcwANGlLjWduifbYy0aQaLnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195299; c=relaxed/simple;
	bh=F35sIr1JtcqxmRy00QEYIX6S1fL3Pge2sdAjqNq4HIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/9hRLWT5VnPTo99Z/2FWq+W9r9rKUbaij9KydIECw2Bc1SNuN9rKbYTbzb1n8cU/adQLXgWqkiC/S/6vKpvLagWkZtgk7U701YBXVYYvuyBK5dfRlC6fkifSmvOTHYJplJGRnDPXfutKW/8slarnbl6MZ/mb3NSVZysTi+UBD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoveEY/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+WMqF9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoveEY/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+WMqF9p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DXT73122418
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=; b=NoveEY/Z6MlZSNGv
	QZEZRtX2mnQ8pcO/J9M0pwtgG17Seu5Jh15pmQcQ1NG6MlSj1W+ulDXlG0WZ+/RV
	kjjjrjUG9qjUDOECY+y/P++RZjqsRdkiqF4p+LMK6vFP+omgwWpbOT7H9jO7+EFc
	ZSQTAA0+1XdSzGBp+A0gi+zlAI7R5Reld/uHO/CS39cnEXKYJ482eTSRSar6S1nD
	5rTUpTLGnEpndc7bDh+gzExj4TmBHctHK8TVQUZ7d8czuHLUCUc9SqfszdgLC4i0
	DmwgJD1cVlBKtwLdwbdW/JIStKC0B8cW6Xh6s8/aWXxk9baluwk0Cquz46lK60Qo
	EPwVIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3phctg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:48:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so146185185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784195288; x=1784800088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=;
        b=e+WMqF9pzzhoMFvVhf2DPyAAGVH9dEAnlvYSEqmgtIktWyD3GJV4c8fMdvaKOy/7Vw
         ATtrzOghN/AsEgh4acqiKMpT8+TDm+9P6DLsqCuFcLJUwpjM2dSOEEnp/bLgiMIMLDfE
         M6dRPglr3SKieWpylBi0O5odhnnicucDQ97uSD04C91NexRwzA13aUSQwDZwFyJKqQG2
         4hmhV5wbbzM+JS48hRVDVmxXRrtDWS3UFyC7XWVplkYhC40Jlor+nNbzGKqXvvp4ENzJ
         NTDGLDiqsCuI/xw1gk3DW6cDWpVIWJ3S0NWEJhNSq9hLyocUKniHXHOvoro7bps42JjS
         ZdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195288; x=1784800088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=;
        b=GoPuNfWxzJk7GTv0I1Y7HjBinKXBBJBjywcJ7joOU0uEp9kXd91+KqYy6giuy7ViEk
         2K1EDI513L8+f8JEiUP7ptCo2vMg+ZrOi84iZ0GkTnmXVOn7d814E8sDGzbMp2ooFeKy
         utanj8KdyTEkkv7N3gN0OYgcANl2kmvocHQfOhN+uR+U1DTlkA2syGSh01KTY9C8pRxA
         TiHKXUj2Avp48rVcxluY70he6w0ppZ1zf1d/pxHePSXYItEaQStCt5jKq+1LXnwlUrlM
         tA3eWTVv+W0irUPQIzgmjIAJH41DP6vS3uyGcO5ciUNvb+7H7+oSFEns368Ogm2IMTyk
         o8YA==
X-Forwarded-Encrypted: i=1; AHgh+RoM0IzqJJW1u8+Co3vkHVlWTxEAehPxVdX32QYNw85LgIvzHSeddVAVYHghZ1xU3PP+3q3OeQTqIBDb0usb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hE0kAgd/40pkbPMOolp4p0b6VVPAjanNnHNKweIlYkAzWH+u
	j37REaLhz2Kqv5uCsBQNL8CL1Tk+G8swAzaDE0/hcquDsH1wtKKzoZ5WPUP5fkDu/MG+/dshDG7
	gpsv6rzm3VtVNjEox6plNLqyUcw7Q4cVZzY42W4ePOdW6iD4D/uODlNZzjHki38IOo3WA
X-Gm-Gg: AfdE7cmszS8+R3l0uk0Claedp/ho9iQIOdiN9YdrcMx2sWZzFonNzdQOicI6lJ+CgNz
	uFIakDUG8m75U/mRrvyAWj5XoqTK3Ud1BiF43+hbj20KfVKX1kaNE+CFhrY3p8YPX4EDp5x/8uH
	8eruOYjThBuYe4tSOMhydTdvOQuLiDQtNMgXQfpiiV+ll9ke9ocKv84iGPaTCJEzVWX8ePGvtuz
	nZHCLc/jQ+E7OAxcrfNTy9oKLJ7gO4t7cQwLUTFzZF2ATgpMBgXI1KCa0ad16/Y6YdhfyTqaXEQ
	kPJY0W+rVMN4kwcHkaQj9oyphfa/7wAn46GVLn9iG3ZWzk1FpO+RlVpossVCKN23JI2+QSLjNaa
	i1o6MBHi1kAdy3INW0+UY3GAj
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1822700785a.0.1784195287657;
        Thu, 16 Jul 2026 02:48:07 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1822696785a.0.1784195287124;
        Thu, 16 Jul 2026 02:48:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871b3dfasm178771966b.28.2026.07.16.02.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:48:06 -0700 (PDT)
Message-ID: <b59bb73b-d1ba-4392-9805-4d0ded011b66@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: lpass-lpi: make mutex cleanup
 devm-managed
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j9yOOg9EL0hNEn_NivLO7RWFVQGjs9hj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwMCBTYWx0ZWRfX3OvOFaxm5HCl
 vhD176N/8hNIS+VbtRZoGdTMqCM97oHlRyoqSTueQ+Gc6QGGMmXrjvQ7jdvXaoXRMJdpgcoPSVN
 36HmGoxrUU/NsmKBsLA6B5uZ+QmGvkE=
X-Proofpoint-GUID: j9yOOg9EL0hNEn_NivLO7RWFVQGjs9hj
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58a8d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TvLmYjrqrHd7K80V5EIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwMCBTYWx0ZWRfX/OBAZ9+8pJOx
 R5MJ+Ym7BM0EBqFuzGEm+fOR0Ls7Q72VlunA0+HWU0ihLq1n0uAiyukO+b7p0OeJdjW/C6zaci6
 7ItBDenhUrMaweeab/dQJrpiJmPfBO0HFwnPhx6A3TlMWVhqtrUwemp/WGIxP0Eby3o7JOHvUZk
 fAqsBRaj8OyRd//ETbCyM4UQlsURQ29pE39/XWAbP33vjKTDFcFtw8KICEzRb3wwhWvcDAcBoHA
 /3t8BfW3YPMflvsQb3bwnhmflPl5L4WaZgG1Xg9hctcNAvp+iB2SKNjIasNVPuZsHX3xdcAtd2T
 4X7otnjsEAmBzgADbPftijBsSZpNQjdTVTv9leYUUrhy5FLM+pb6cm2VOpws/8xx5L67c35m8Kg
 LY0toUHGfbKIP4MT9vBZh4nK3S/yXJ70qhgMR273hJ75ed532WG57qrR3vpgjeuFBxMvGXmtmRk
 N3iMl4isZRKpTYfBTKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160100

On 7/13/26 8:45 PM, Prasad Kumpatla wrote:
> The driver registers its pin controller using devm_pinctrl_register(),
> which keeps the pinctrl device alive until devres teardown, after
> .remove() returns. Explicitly destroying pctrl->lock in .remove() and
> the probe error path leaves the mutex destroyed while the pinctrl
> device is still accessible, risking a panic on concurrent debugfs
> access during unbind.
> 
> Switch to devm_mutex_init() so the mutex lifetime is automatically
> aligned with the devm-managed pinctrl device, and remove now
> redundant mutex_destroy() calls and err_pinctrl label.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 5fd4a4eba..b3e365470 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -559,31 +559,25 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->chip.label = dev_name(dev);
>  	pctrl->chip.can_sleep = true;
>  
> -	mutex_init(&pctrl->lock);
> +	ret = devm_mutex_init(&pdev->dev, &pctrl->lock);
> +	if (ret)
> +		return ret;
>  
>  	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
> -	if (IS_ERR(pctrl->ctrl)) {
> -		ret = PTR_ERR(pctrl->ctrl);
> -		dev_err(dev, "failed to add pin controller\n");
> -		goto err_pinctrl;
> -	}
> +	if (IS_ERR(pctrl->ctrl))
> +		return PTR_ERR(pctrl->ctrl);

You can retain the error message with 'return dev_err_probe'

Konrad
