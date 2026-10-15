Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971F51992F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065890; cv=none; b=FIvXlQh3dBYHwSNmD7Hx+Xooc80qd9Y8XC1EtzZ1+zql0rssk0RG5fZSNkFTYYoJfAeji0p7O0g/G6NGf3vuewogZzo2KU6DJGGMkQjQEXbmoMrziFUtjMnw3gINzfAErLKU+R8M6/Uxk2QrR7bCajNCT9QRVpe3ifnbUW57TJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065890; c=relaxed/simple;
	bh=AFxw+K7lzv7pYrWZ/G3VFcRCcPRi94Zq+V199RBe5fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTuJPMCe1h1t0U8jZ9YAceiBd1CvSbU4u21bkYqi7dtTtkB0h6Ppl7g42A++tPKLHj0bWkqKtJSkHRum9bFQR6L4l1fUMdE89HMXWk2wPHiPcvoOjeCnDdo6+g7NBeOdsMxJrotdJWjnUh6/4m49xG/iSP8Auts9USAXSn0j44U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdhsciG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULfQwgvb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdhsciG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULfQwgvb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jKns4077497
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=; b=RdhsciG4knO9l7ia
	jweiEwa03+Qzns6n8esY3/FnDnmrEWVztibX2tkDzrEbw/K7OBeqE153klWlGiDc
	RI8wjrxuMOp+xhmQTdmgJmHuGE2tGvM1mNRvJNlcvbsOOICL70yGcZJ3KrT0M32B
	hcz/vXbl5va1CsSLJ/9FbDMMhotYeDGZ9JbPZQMfA0gQYNGjP7BAoviczgeUf/ht
	wlmoxayeSjlgkzUTCZfUOGF1L/eEz2a9ai1ndStQjM/5XolR+iP4GQl+nBCBtbzr
	0qaxcf3vwamlFI+IFj2mGUPq/M2AWQgim34OtCQb2+Q8J0MHvJpk7rifmOuK/iEf
	E3GJAg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0kdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:04:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d44237e2faso268597e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065887; x=1792670687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=ULfQwgvbAszg+4rS41OIYbIQteoVlyD4ElYmG6kCPveSZvKKFnfFtlf6RVe4Tx7jQq
         E9ZDqWdgOtzXXip326Hw+35o04e5/m2JMjkp2iNQHaGDWXBpyPui6j9Df32K9iaLOFyq
         jTRPGRSY7rQYdS/A2j73qeqA7VOXaZDJp4rbkaZJguFkclmxYBocc5JtS+LJ5AbRFeJ5
         1PG9ExoASy9tFaunvNcQDPVAMqoD/s2NN1Ir4LGmv7MdkpFcIohw6ncCTyKLytRSS5Id
         8mz/Hrr1hV6butKaMVRuC8XQVNUCUwNETodvgBESim9lCzu68AGIhL9qL1GHdH06atbK
         XLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065887; x=1792670687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=KB4WZQncHWmNl2FC6R0XEvbkV3W6nIReXEnmHc+/vyRVnydGW5CkiBYtYh3X+WihSi
         iPBoe8fUMfGKv/JDxHK5TsePeTmgi3qrOg65rESYoulJsuhS5A0SBZ5oPHXzIRjivtAi
         GsbgkyBKaRMOedwdgO+idlQ3v1Jeq66oaiCC/0990DR6KYA/eI7cryOZHq7dxL2J8vLa
         AsQRRwvRTAMoqrhQTwQTIB5g8CAkT8Y/NjlgLTsjxZNoVbV6dY2TQAknIPKPR1GGvLL5
         m+1fmfbAHwxKlF9Wir5oB8FkveY5E0HenaB6BOtK11EuWm284C6SNibJCaJnVJ+1gLB9
         Bx1g==
X-Gm-Message-State: AFq9FYLB06BLoEdQIM6ZdSskxm01qhvIy91to90ObhsocvBt/+Hs4Rb4
	mKg9wyl9sgEDeYqg0hhFRA6gTJpVvJtYjMAPGRpr8lxwCes2kJmGY+yhZILA2yBO1beCDYPUr1L
	iO3LLo31HFb6xj+uXaA6ddlF0nQ+Ospt9huKAQmvyJK9k74RwpJRMmTtfyycXaF47//lY
X-Gm-Gg: AYBFou3lJ4O4UaAy3errh5nW3DNHr0PqQwopd30J9Idjrwvx7F12IVo27qhnG+4CyNM
	zhh1gF1N93L0gAW7A4774Zja9hv7xCGfFZLgmffTRIFYc3/R3bBwot2j8KveSPgbxdlvcLbPXNn
	Akm0x34Ac8B7RWc6vZwR4tNfGbBBH1Hh8PwsEt0XTncuj3PCdENViw6TiRdB4p0i7/imniHT58I
	k5C/JAXzplGpExp5zMEBcSQ3eAPyUZJ5kfWMDRNd1gVJEx17KnNw9vAwPqQd7iCF/CJucwzr3wp
	zQnCmHBXI1DAv1Am7GIlB7u0gpC8O24ZgkUPAaCQJZhe5k9jqAhexRJtuyfwBMeygaiSoSNwQ7Y
	7eCxZGZ/i6GKKtlk+1mKApg==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878482e0c.1.1792065885569;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878461e0c.1.1792065885133;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043b93sm115554566b.56.2026.10.15.05.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:04:43 -0700 (PDT)
Message-ID: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0c160 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UejlFaKpO2bYa5uMUq4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX/WZ070ARaOjB
 BsY3zVzDydUqDqTpp4O8L0VIYPQhmY8PuYmjeI+4iz16KloVsyPNxYlIqgtI6u0crOSvTJoz/H3
 65e9w0x4S9QjRD3VpmrKYVFIkWUYY6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX/pKcQTlRgHC+
 lfkGPmNcvCzwTI5j/5yi0z0ahXz/XovvmH7V5zB39Iqh6LlzowXF10qV8U4eDwTDGzv+Q/lGL9N
 lpSrJ5lbx38C6NYNIc/Gf9tjU2ATlarU7yISHRXjZ2i83ijRiATfhHcQ/mWrVH6fsv8yF4lPaEB
 u1RdCQARyDJLBssVNtN2dzkjeOWceQ82/uQp7zNW8V9vFD2rcjAGVuaB0rr6OmfEGKRpJMYz6GL
 MRq4PP8Ya+1z06SD/ZM0IVqS2HqPSSkJGR4AjXe3fxtfaAL95wG/2d51XKwlpTdUxdr7YFBx5s0
 NLOpOakLVEfS88Xg7LirUyxryWxXAaA7CyHd6W++XF/+8aaf8XB+N0d1kSjScrRwAHsq8kJenbp
 n4NQnNFnFKx2HQYKTazpcydmT8RayyWnsl2OowRmGboJPhEUa0E2DEdfth/KN8747boEoyKZV3m
 7uCH6NxJF4YWbf+qQVQ==
X-Proofpoint-ORIG-GUID: tTp8sT1NMle_Y9CEdxg8tVszMUYORxz0
X-Proofpoint-GUID: tTp8sT1NMle_Y9CEdxg8tVszMUYORxz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.

[...]

> +	pmic_type = (unsigned long)of_device_get_match_data(dev);

I don't understand why you changed my match_data_struct approach
here just to reconstruct the same data

Konrad

> +
> +	switch (pmic_type) {
> +	case TYPE_PM8008:
> +		irq_chip_desc = &pm8008_irq_chip;
> +		mfd_cells = pm8008_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
> +		break;
> +	case TYPE_PM8010:
> +		irq_chip_desc = &pm8010_irq_chip;
> +		mfd_cells = pm8010_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
> +		break;
> +	default:
> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
> +		return -EINVAL;
> +	}
> +
>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>  	if (IS_ERR(dummy)) {
>  		ret = PTR_ERR(dummy);
> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>  	if (ret) {
>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
> +				num_mfd_cells, NULL, 0,
>  				regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> -	{ .compatible = "qcom,pm8008", },
> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8008_match);
> 
