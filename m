Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BE471411
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982861; cv=none; b=mOlMeQ8A8oDzJAw4VErMWEWJXWB1IDN39EWELaUepvVLZTKI81bLo4Oj1p1kuemFM2B0o6QRp3Xizip9ONwRz1plwzgA7CEf6USYkqCNj2SpPQlOopwdh7y5vElk0Lvpnw7HRsmDXc9paod+JUqsd1V2IgSxjav89oEmbPD/PAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982861; c=relaxed/simple;
	bh=N7Bwiz8vNzShNEWWo1hbEjNmyTi8IpUXmCv1WVc77gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWdtVbOnuZUTir7+UQhElqllPWMtN75oPSkJlgwegAUUY+0OuolfrR/JYrkyoGyg045VtWxq9IVU7zKTeul3CWhZJgDEFkg9oYa+IbGpgHSPmyAnuNLRuPF04cKc95mrHLYul6nq1meJuqy7KgTSi0Tw+GwAsSeSvZSQRecQTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emtK+myv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPFTvmwg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emtK+myv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPFTvmwg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79ubZ1096083
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=; b=emtK+myv3usdP24s
	OllM6ZLLActmbGIWq2Dsd3DlQZsIk+9Zg4RY+DSIH1KzrEkwP0XtH1p2heGqZwlv
	hpc0RnbFu7RCi2ETWJIXuctcgK2Y9r1NcaK6fb4kUTiH5fGyFpBZEQeJdzgz7Uou
	sCI2F8YJlEVkRJwCU3vUrIZx52YSEZhasX+1wJc0lrLUpku7pDP6CmtETVcFeWac
	CPPIuKYW2Q8NlxkjUPZ35ukMIJLzOZEfcwfyrWotYX/6/ve7VXvENjXPXqkbMYvX
	RvgdTpNzG8kv2GO8wTM/Fn+2qFVYzv6Pf0mD0kfr1EvKeaqb4RsRoiv0GKZ/8/w/
	7ocMAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0kg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:27:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso89303085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982857; x=1790587657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=JPFTvmwgPbAmq/ddV9qE6qiw/GTc4AkFv+KR/iLmZNC19sBEwUSBVmaO749ZL/xg+k
         8NYI9cAoMk6ZcuKSToRn8gfja7UgaWHla3Lt4PU3egU0yCVLRklMKOH2umeeEF1El7PV
         7E4acvbTTIEqEUOf0yDsiYMV/NZ8sFLslnE43ksnxc2ixA/FXGKwBKUSc46M7Ek61hyP
         HpCJJs5MHeW8OYyFQFENdYEomzHw+jo4aGxYloD2D9QOtdO/vczCzjEIa8Eb7K0pdex6
         DODiOjeGhLzBnK6Yy08alJYBpkc9JZ31Kt07NVmiv6h609ATga+a2/f/9HBNmB2CYXSh
         ATew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982857; x=1790587657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=jmV6Wq+bBC78Q3Uq4wxDFLhj6SjtcYvLY9MO5s9xIfx/u38fxT7WS6YWTpFoiJHQt9
         QYmYVYTsqbp/Ek8Qgis2kaOoluHR6CfyReiVLbgVZeLFuVWCr6TRbYJ3e4MSlTYy7Zv8
         9g0C/tkueYPgMa5274q1t7sQw20+7OMbLTg1ANDk6HWRgIhjvno5UBNLqB4sSjQtgb9F
         m7kw4N9XfUxtEr7A1B/RnWf1MZB/zC9pJpJLCNrGIcxKVWUz4/b/bHLmfvEDVUUgNzyL
         hmutYZ+8cLsMmlLLtlUkjRRgdlMKeP1Rn/g/i05iMDu+Mv60IkEI1kIhGkHQLxyo+RS9
         BnTA==
X-Gm-Message-State: AFuF++m9mXiB9oI/UhPQ4gUGscPWvv+SqbrmcCuwJvHaCvbAvw+zhzkj
	nLZ21ej9az6x/33i+xMhZ0CkQjTtzxTOtXZbr0Q/u//qsxLrfRK9FvfOwjF7EZN/VnFYfBu9Zaw
	U9TW/V54MLybNCk+L0xJR7IX7iF7sshvsQvSA19zj4NJQZ37obKYvofQMKhfF0K320mpc
X-Gm-Gg: AYBFou0KYrIqZb4TeHvhYAMcsrx40ta4ujDYOCjocqdl0+VcMSk/bQZb6Q3Opzen6Hp
	pY3iDrjKgHpOV9OWGAvEzdp+lm6KvKNqNRww7TDJ0coVEAvkNX8xPA9JvfwP+z/gJDHH5vBktjg
	moUo97z3ld7o28yuoQVUzAE93BrYmfp3HKus3XwkxjVGCP2x0u88R4M0pwcbf8Glc8RyDbCkn9s
	5fHAFS5C2C2BdPrYq8APIg1PB24uZE19GQLPhpqptUuJ6Gm4M6e6hMkV5ekc7i03TeZck2GnAKS
	GgVlTuJtnl9X6kzl4QOqnR8FHkj+6k6R1I5p3LZMUHX58hMWyopI3uqz5C74+UnrOhXWipSofMN
	VCX7ew6dNngQTbdlO7oHUMQ==
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981019985a.3.1789982857289;
        Mon, 21 Sep 2026 02:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981018285a.3.1789982856852;
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3573ce12sm276656166b.35.2026.09.21.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Message-ID: <989c8883-c481-4132-b6ca-3a333aa0788a@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] backlight: qcom-wled: Fix NULL pointer dereference
 in PM callbacks
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
        stable@vger.kernel.org
References: <20260914-qcom-wled-backlight-v3-0-d69fe9843841@ixit.cz>
 <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX4jitCqqd0X9w
 RVH9k3m3qj8aWya+VhI5ZThNBuPmmcKXtlZ3tQzkmQWYx3bf6Ua0G9g26Df+uO0hiSegMqorddP
 j2LOC844DuDnPUN9QCBH0y2fYVqiIusKoTjI8lT/B69Xjn+laOI5U7x4b6q9axkdE7rL8RS9V84
 UWd56Dnd8QudjpRKQi5N8Cd72IjtAfw8iudfiUbdZ7E2Yhz80cTooEjpyqfhilJY4GurrrUOIa6
 PMBkjpq74baCXumXMmAH86rzo28KKEb0zApSFJALbC/XwhoB6H8mKqKfziWEnDhEWDEFdo/9ZWz
 2LyCw6fT+cpZZQXwBNNnKZNenkzaBfXf1f1Rmh8Z+mCNYw7aD7+PIyMFq1Awa0OdiGIB9OBiAHp
 IQZmmVo5KwVbE1vu/Qw6jPO+BN7E0QpWzqQUCZ4IR2FW88vjqhvzg16nCsU9v3ntt4AtihtxvL3
 VzxBg3NP47zeFADBWXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX/7ZQCwaM9GG1
 ZobHgBSg5WWiRp1TyRWjlffYAED1EH212E7DoKQtGc0AobNMCqS/pwwQCFlYvb72fPIT1N5CJGl
 gJteGpEZy6n/7DmtkowXQAWzNWsqjhY=
X-Proofpoint-ORIG-GUID: d7t62VcylgsICf6QOMf4jO7A6XZT7EjB
X-Proofpoint-GUID: d7t62VcylgsICf6QOMf4jO7A6XZT7EjB
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0f889 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=WGO8Zn8UdcYOddqErpsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210135

On 9/14/26 8:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_probe() doesn't set the driver data for the platform device.
> As a result, dev_get_drvdata() in wled_remove() will return NULL,
> leading to a NULL pointer dereference afterward.
> 
> Set the platform device driver data in wled_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 650dd95f06ef5..a76158a298335 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1747,16 +1747,17 @@ static int wled_probe(struct platform_device *pdev)
>  
>  	memset(&props, 0, sizeof(struct backlight_properties));
>  	props.type = BACKLIGHT_RAW;
>  	props.brightness = val;
>  	props.max_brightness = wled->max_brightness;
>  	bl = devm_backlight_device_register(&pdev->dev, wled->name,
>  					    &pdev->dev, wled,
>  					    &wled_ops, &props);
> +	platform_set_drvdata(pdev, bl);

This does make the pointer non-null, but it stores the wrong object

Konrad

>  	return PTR_ERR_OR_ZERO(bl);
>  };
>  
>  static void wled_remove(struct platform_device *pdev)
>  {
>  	struct wled *wled = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&wled->lock);
> 
