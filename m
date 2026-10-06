Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DA3C871E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275728; cv=none; b=tFghaalUlZyJxamw7YQ2tG1kl93gbUYwlNAsFuURExfq0IdmxY4DagxqcRAjrk+ubbhavhDxdvopG/TaIBmmLey+rOagK1QG1MqTNUafEi20Hb17vg8kL2wNYZLUUouSKOKM1/O2R1ceAJ9drLJn6q3gLPl8MoNDvspaS0DBoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275728; c=relaxed/simple;
	bh=EkyRhQuPMwAhaoX9kduyyF5/JKDntQkvvetRV/W6idM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPqxLIs5meTKDGoX28dVmQV1tV4pfcwIrilKv5nJaiTzYh2EcLJRaJZLpaEZ/2FHF3Fv5SCrl1Cs7i9lTE4OdP5xKzA8qFDNfBWUQ8SEHNmJcCR6WQZ6DDn/rPGhxS5o7O6RM5lk1pZYlMx2fDaRhc1eWYONVaubIApzWVH46vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2i9BEKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqYs5HZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2i9BEKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqYs5HZO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eI5h548471
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 08:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=; b=e2i9BEKJXT2T9yZT
	6DC41KanW2kiXVHas/w0ggKtZvcHIK4MurGvsLuW6KHZO/jowXmRt2Svn5P3TI6I
	/NSUCnlFxeBWZnvkH4W1FrQxtBCgIe33LaUQIu9NKKeKTEMq4twly0g55GkNSJGW
	q2Cm9U3IJeEcNWTKAS/hgdxa8S7GodV8Qmaj3d9QeTzI4TVv/Yr6gpt/YLzBIxcL
	1BuOayjPTk215rxrsRZ6+IW3OBlQ7AVwUgrIBnNS/NvB2KxcXHswKF5FcEV9RavM
	nNZT0PPhY3aUlarenXMEx56FOp2qMixU4ItrlW9sFRHROqzaQzwPiDeP2jHQlQuq
	O9Gpwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvvdub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 08:35:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-887e45c7063so2183706b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 01:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275724; x=1791880524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=ZqYs5HZOKhm5yGXGLoq8iFdS7pnEWMQTZFv+HixCWwedHXvsLawVosKLhU1AwbmgjA
         lSHxI3rIkQh6ANTa5kjbV7GyZspWU78Fa9W5HM9NZ5Bbrr0TdbY/7YfxvSovKT7GkUKS
         gjidqEupkG+kHtqfvFJiCqlBuHLuM+OoEc8zZyOJZk6DAa7gbR47Wm62Y7OL/wBZ/gzB
         njYqXpD3xG2OEgyujygqpuSZNRMrT1dZvKbvbKCBzeEfsWzvwpW03qzMv7vbHfpt7uxi
         70RulMHLfhDDk5/TrrRFwSfp8NVJyKEqabULBZIIk0PUdoSINumc3nilRMlJvi02CnzI
         iQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275724; x=1791880524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=ZrPTgCR6kQGU+tF2toIn83Ir/fkNp2nEKxVTc2WxMwbpxocqy/nD/H4+3KXBihSLMy
         qiB4khMVCYKPSeKqixuKpPMufaIO/s0/CRe6WvQL/bH4twn8+YCnYNRnJ2ROqpU+rfae
         6seJgMAl40LWxFCO7RLAdeJ6drnhiCC5VCa0QH2jGPxPNcdpBrHAiexMtidbiUuc0/+G
         cMArdjR/LLDJjcBdoByfIGBM2C7ns2GIWZfiT/XP9l3av8KxzY7vZwGwM0nlUGgqm6Kc
         Ic9OzHRemSILac8giH2bnrF5pQ1nXpKlTVNzM7c6iYrkL70VbSOMIs09NHcJjXQQFZGF
         +xBw==
X-Forwarded-Encrypted: i=1; AKwUvBxNbDevE56RHrv7q5iA+U3o4+Jy1+P/NYx1lXuwPm6r4+Yscxxi53GxAG3faaj04xdQdtRzsBEdbaGWnq/F@vger.kernel.org
X-Gm-Message-State: AFq9FYLyEs/hHyFJz+ZtkPBlJhUZd8YtbvRuPbSiIhNuJhkqSQ/8/oKf
	Uzj7zMCUNN+tPYZlEUfmpfsKoFJzELIM4DG2la/N/aqIOVL8jpGjXYJb04V+wg222QEC+FCN5EW
	0msgxw60W19yCiOn7a6j4PSW5gbg/c2OczdTOnv2o3seRj2fzIa3JZvtHNAwNzsWLoTPI
X-Gm-Gg: AYBFou31KtURZA9f2FCwz0XQB/aj8gH76aTnObNjI6FxSGmjFJo3++LVw+dRtl2mZ03
	X6/YI9Q0q4UDQb9AdCGrryE7OKsl2XhYx5uh8f17GwOablQqiyWalY0+pK9DPrWz0mSIQVWgx7q
	O4vnKbqo1oPFcJMPcN4R5r13EpHJ367KMfz3Bgj1FvG8fPsnVTYFzieMc6QNt8VeDAjZPAXRFIZ
	DsVqXv6QWM0nmTWa82AO7BOuKHDtXRjCTogkw6beB49gmQZyIJLQaKh09EWYk5WBkW02NZWRtnu
	dOSXEo0YXIl/9BcxZf9UmZDiMsJVEE9KBhkcmEsZczVWSMNynTzBHJ26Jq4Of1SdyqsRpoH+BmD
	bDBKxSOzFXOnqgOrrOuwU+toxScc=
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639476b3a.19.1791275724396;
        Tue, 06 Oct 2026 01:35:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639449b3a.19.1791275723900;
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c79273dsm4462425b3a.40.2026.10.06.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Message-ID: <c732b508-ee0b-43c6-81df-1070c8460bfe@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:05:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4b2cd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rcwA5kG5DHYTcFEa1nEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: eOWOqGJXfO8hOyzVcWY4fOXK28XK7YVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX6Qgqs32HRBnX
 EWrQtfrZ0q5rqFT6bplmK7dTnQvSOBk/4AM/uP6GX2sU8j5e31BhuEGwBw4ifXACZ/3uKGGtgTl
 rEte7dSTq7p6wgU1Zwvhgjl+PjfHUzbMnEBDPw8OGQo5UttKZNNt9JN0ncFDAWuvnFNeZbToC3+
 XHlQR7ePAo8jckz7D3owvvG1a6wiOuvuHsiJA2jDqWomkjZXqncSPeKFW5eRJC3W1eKaKKv3fEZ
 GtVivMK0m+w/u0/XoYySoiH5aiGxjPbf+RhOOvCdZI5Ouzzlno2jdlLvOIxM/XlN6r9PD9vq1aJ
 ivWH08waagZZEHddRf8Z0aHSe+p1pM+FMl/+nNcS5AOBr62gXgv+DZRptzLLKD1XBHQrG64bvjr
 3GkgcjkdKuXjCtar2Ssv3p/75OMZF1GfCa0C0o5DoaXpiTWvZs4V9b+RgVIwhMkgpokhhcN62Ez
 cK0TNN2edqRhoA6395g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfXzSvV+mwo7qnA
 jtKoS/obTb80oL3ohJtbohY31Fp2FmvCzKXRkVjf7KXA4CLvTTrPw049ZtMm9B8MjdzDeBVSe7M
 S4UtVDNaNQRRyFCYwhn55dTiG1uW15I=
X-Proofpoint-ORIG-GUID: eOWOqGJXfO8hOyzVcWY4fOXK28XK7YVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060034



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
> and Maili platforms to control all the LPI GPIOs.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fce418fe6ff6..2a8e94b4d09a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
>   CONFIG_PINCTRL_IMX91=y
>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>   CONFIG_PINCTRL_LPASS_LPI=m
> +CONFIG_PINCTRL_HAWI_LPASS_LPI=m
>   CONFIG_PINCTRL_MILOS_LPASS_LPI=m
>   CONFIG_PINCTRL_SC7280_LPASS_LPI=m
>   CONFIG_PINCTRL_SM6115_LPASS_LPI=m

