Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894351;
	b=CspOl3F49HOj7fu8KSQEjVHQe1xqlTtxlnzVeCiwaQ1Rw9ft07HB6QNSapNNYlPmXymD
	 EgnT5q1l4Y3wYxZVONWGv+xLfv/+rPFhVRpe3nvxgok8YuvPkZkXM/2neIYafHQnkd14i
	 +y1rMkEHyk2nrNJ9Yz4Y4rVz7+7+qTt4BVrXPY/9H/jWCw2bWs01G8O2w5cY1/C04Kwgf
	 A3occ3W+rclo+rbjFE2u8LOyxn0mO0FFbbzkn3XFgl6hvGRsc9PEFzpJedjZF3L2z0p3s
	 emcmeOy8+4AqvSLxsYiH21m28U+3w4XfOSq2xJfptbBiIMHs9SJ+doCdxrx97HdSBsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n85HmyOSN6jvS/g5YO1GGb3sdeD+U77x1O1SrJ65+YY=;
	b=5SGis4mQtVfQRTeIpEaDLeCYVImNZJ9ojv5MIqP0spip/wrkN0LBYPrCdrjShEZrtEJA
	 xnQV1YQjnxN9pLfiKwc4HImqcIMHLX4YLxI4PU3jlaVvwm1qgLAkyqBlhdgJHhTMQbFhx
	 3KOaVf+oYPemqUVWpzAioX+iT1pqw2UjGLZxuREjy8hmMkirSvzFuX4bS8UjQhtYt8X3b
	 3OsNiD2Xar57YatCXIFL5Wz20fYcbMxUiLMBy+yi3V3+OV8YBCD9d7c3NSWLpb9ElDjC0
	 t1LQMzU5q74bQHVBzqfSx6d4jTOToaHmxS9XGJ1oTRsttTaYMlmQDTEYNVfaANbfqzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGiSDl5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECM3AelG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E62606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGiSDl5p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECM3AelG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH535Dg3458009
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n85HmyOSN6jvS/g5YO1GGb3sdeD+U77x1O1SrJ65+YY=; b=QGiSDl5pjpdI1ncS
	iJjmhqczDfDsj7WxQw8UoymTsNvzBA5aKEBXrTvkyVQZUlxhBhCCCXBYK9ZR0DNE
	Klv1ZrRZnExr2QSBWv0U4xK7/J/CoXQAjluxjat/DhURLU9PQMRG7KWsBVqeV2oV
	eH5qxFELVzwTdma4Cp6MpW309SgNFdCLSp+9dUCQ+APfcKqWGUjdowJEVjimO6a0
	DOTZWv5AbTy2+Fhc42rbdFJf/7EW0y3v5KZMAoW5xCFZXwhtG5z5K6+40OqvyOqp
	HxcAlP2K2hQpefBG8sjmcyh8DH8qS4jN3J5Dai5Kw9G7NOFfyD4vSr+o2tCxWInm
	j8sZNA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh84qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:45:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso5389029b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794894349; x=1795499149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n85HmyOSN6jvS/g5YO1GGb3sdeD+U77x1O1SrJ65+YY=;
        b=ECM3AelG2XZFsJ8dP2VNSPIreE3cZUoP4XvFnsnQ/E0OhJU+Q3bpSJBX622B9yQEfD
         42vKj5AGZ7QOWiyog06cgFaW3RU3wqjyfyoTS67bflJ+4R2hP9VZI0X23GwkjV1jQxNx
         Eb7TNrv5F4nE0zeHFZI7FZ5NvG5fzUBXATtf7MBenbz59fF7HLoCz0631mqSc5Kw6RC0
         6FD6GFZ+SUHb5+4VBf5SyKH+QurJds5NrDBQXJNH7e5Zmkx6W/8M8xjSnW6tQn6gy+Cn
         l54IeMqyVVKHD6cOBxtmmXS/MNgDUWqfINRcUu/X/b3e3cBAzr3uCmFhBSUZz0DARLAq
         J0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894349; x=1795499149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85HmyOSN6jvS/g5YO1GGb3sdeD+U77x1O1SrJ65+YY=;
        b=WjOMPOc4LjLCMHNgXLN4m+Au5GDZV0LP2u9ghEAIGf5XBM/WCwuDroN1kVGJKA7nYb
         /lvDU3hz+QSda9B/DR+htgVRDO2YaS3dKwQBzH3k4RyVsbjPuKmThc6Abrm1tXQTU+6U
         VbGRF1w65px70naBMmkQwn9wHYNqXjGgWfCWNs2n9wRpuwAJRARFs1xO+MzgL5qWsGNI
         Nmx4zsMQ+O4Mk6jFhnIcsQP6TLihEmdkYM48FFwkQHqoYrq9iSWW/9gsDFVwLQ5IKhAq
         hfu0xjq52PlIy+ObY+Oz1SnRmL7YeUbLb95q/cIcaAR3GP+ykT5rXtL+K6J9o3w3YjPw
         AEtw==
X-Forwarded-Encrypted: i=1; AL+hErHh9ShbUeA1Sfv0bQqEz5aVjfob48d7NbmeXsxm6O8liCUWMghKzmiUher07v0LnwwQSncbl/JYSqdO2lRM@vger.kernel.org
X-Gm-Message-State: APuU4Z9uZjIrGv749pDLeUKm7L1QU2MvKBDQR9+1lOooqzg/NkrUsxtB
	k7sWJPE/SpIGWeiQa/lOzHeA9CVPuhoFGqSehvop+EhA8MB/5vsSQt8I+lmUCm1/ZGRdF+W45Tl
	d5fNYuOPdUhIuBaut220jFWWyHhv+Jzfyy01eKp7Vi8Enaaj2u1g7XAGVaA7YlWoZnp4S
X-Gm-Gg: AYBFou2ceC9bBJ5/Db0NVnmWxGd/LlXot3Q9boXNVfwEzbjT4kyj+Z87SGkHOI2NRej
	Bq/LPEu1uyWR6U3HgjjaAHfNZB1Z+SW1TmbutTW5BCAFIgCpxgUdj6vqIW5RRG80u9F5q+XYRhG
	KlyNtgI+oklqlekDDZJjmgh0SUO7MMwvNHpFzfvSMzD8x3fn8W/9P+sW/DEqTSy0yDUUDnA0VpQ
	KbafMBX4tlMhha9vE93pcYPTeh4+90bYxRudasToPSiSdvKEFVx59nE+wvWizMVmJNZX2HcTLuh
	jvH5XO3ebCvWkcoG5YTkt1Wrx9vmX3OMxrOsonb2Sajku607JSuHBkFZEyvtPcssVYfdOf39d1t
	sB11RS46Lx03znjsfhr5G6cBy2R3ov2t3LDCZl6zJgFXTFtuKxtRILfIVUYNtNHQaOJAIADPTpL
	eAXEg=
X-Received: by 2002:a05:6a21:71ca:b0:3fa:9049:d906 with SMTP id adf61e73a8af0-3fa9049ddc8mr5651395637.69.1794894349173;
        Mon, 16 Nov 2026 21:45:49 -0800 (PST)
X-Received: by 2002:a05:6a21:71ca:b0:3fa:9049:d906 with SMTP id adf61e73a8af0-3fa9049ddc8mr5651379637.69.1794894348620;
        Mon, 16 Nov 2026 21:45:48 -0800 (PST)
Received: from [10.218.9.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdddc55efefsm4402940a12.6.2026.11.16.21.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:45:48 -0800 (PST)
Message-ID: <9de0e4e7-fb4a-4ff5-8c15-f0413efb10d5@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:15:43 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261116123915.10182-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261116123915.10182-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N8HKIVHLmWUatmXHTRQJ_TaLjgK6Ieul
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbea0e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=olDleomVNStdelZc9YAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: N8HKIVHLmWUatmXHTRQJ_TaLjgK6Ieul
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfX5n3jwcGi3eti
 6nHhENhU24FUvupB48rZrHocsXRPBy1qUqxsMot48yl0eFNySR11XB/wYTQULbI+RKnzLWOPYCR
 sz/ooWCvxSeZPjphVG29fKBRYLpoeXA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfX1h9nG/9xm8LJ
 YWH2FC1EY6ZJcvdYGP1lkoB58li6PkNouIiVAjCbpTmLjhJULLRJlkMDhrV5ritFm/KiP85oReq
 e6R2A6FRcqkzVSd0vkwyKMj8fo3a4w2D15WgdEiTzxafC7LSnJf/lkOtAxI2za404BrTvh+xQer
 vHSSPVrSBl+1Cc+Px1euPVHxYWr1eo+IbtUvMI/B0BDvvacku0qqHtMg7a6o8cmqVRzPtt3Yxnf
 yjoLufrJdQJH/BIBMG3FQfOFPpRdICMqf3fsTekaHQIlsxJ87Ej9X+THNatgjHFLNcpHCsXewsN
 PsKwwpoCLpSJHsilpYztRRpfZmsCRbC6LPnlB0EugS09Yzj2bnelJuFokvoRNq7pZ0AlgbhmPXA
 EQ9PH/pDaVj8qwzVLNtbIbJvzsUom7ZQnRKy3laTnQSfdloOc9GjuH8/TKlw1Wa6xYECyppDnUo
 pujFShKwFVvCzILYBwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170022



On 11/16/2026 6:09 PM, Hans de Goede wrote:
> The qcom-geni driver supports qcom-geni I2C controllers being enumerated
> by ACPI, in which case there will likely be no "clock-frequency" property.
> 
> Fall back to i2c_acpi_find_bus_speed() to get the bus-frequency if there
> is no "clock-frequency" property to get the bus-frequency from ACPI if
> available there.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index ef48ab3e8b94..cfa334e9e81e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1200,8 +1200,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	ret = device_property_read_u32(dev, "clock-frequency",
>   				       &gi2c->clk_freq_out);
>   	if (ret) {
> -		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
> -		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
> +		ret = i2c_acpi_find_bus_speed(dev);
Prefer to return bus speed so suggest to take bus_speed and use it 
instead of ret. As its not an error code.
> +		if (ret) {
> +			dev_info(dev, "Using ACPI Bus frequency: %d\n", ret);
%u HZ ? Please keep the unit also while logging.
> +			gi2c->clk_freq_out = ret;
> +		} else {
> +			dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
> +			gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
> +		}
>   	}
>   
>   	gi2c->irq = platform_get_irq(pdev, 0);

