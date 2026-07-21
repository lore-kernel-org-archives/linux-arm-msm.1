Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36C32BF51
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640760; cv=none; b=Oa6pTCvHUE8i/z+yntNJOp0UkADngFUMUZd/Ll+l/+CN8C+m+002KONpRTh1MGfwCObHdt6fkjfC3FA98CagE+1XbVIXhU7tQ1xRY5QDPz9U/HvoMzOAmHebygrnGRQu/U+tQK1Y/KPYJVk9wsOcMuVrOYHZKLOslG32sL7FjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640760; c=relaxed/simple;
	bh=2VeRxx9Pr4YNIhJ/kHIN3nTgt5ob92tZERHuChm7sYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/2ZpH7fHWpeiD7OVQSgDkLtY4TUdaD/DaF7APcSfKB5+WhUhd8+DCC4fPUb+0JpblUV0Q+uWpAwBM/Sa0ikMy/3I7PhF+EG+VuizvNO6sMdvWOFMll/uYPlUlCLgYMobyA8bbq4NWQPpURTmbkFo3oIXGXvMz7y62b+v68PSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaJVThjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Po0T4G4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaJVThjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Po0T4G4E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMIwj1793877
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Md4f0+Xv4Zzq0lKW9IFlBD6
	/JswUoehfefY9+RsgtE=; b=JaJVThjpyU69ta3k38IZFtMTax+h4LmfMZMZS8oS
	MsoagmjNzPjGX6BPOV7tUUbLx/A+S04E7W1a4FmhzZEkary9ywsqVJie0bU8E5OT
	ZF0xTC0+iHdT15sp86vKVK6zO8G4BGC3lBqSbjzzzIXsJx+/dunIS2gyFe1serHR
	Te1rvaK1iu8z2bDM4HkB2p0uHaxCRoUr4CvaoNpFgCbmhCOGDn5kR4wTLjgPvzQl
	L8B5lwQ+z7elnMF4DwrKrPTE4MjwevbMRBGelG2Yxnyg4UqkbxdNjT4ml+ICrdEn
	VHzhwaNXeOrokYDfxyXxJ01te4g4jUrEWOSIsuAeEUPa2A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2ecw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:32:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7475c666b20so4561093137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640757; x=1785245557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Md4f0+Xv4Zzq0lKW9IFlBD6/JswUoehfefY9+RsgtE=;
        b=Po0T4G4Ee5Crrw/oolJfKLcUyCQjvSpM9XkxvuYED/cwoHmJm4l4Lr8pGvCHNWp/o8
         ZTnar4GI9LTST5MhDA/nd+KpkDa01IjdVHMrzkE3t1eFtohfuRju8bX0ZW3EhUeaM4uS
         kWcfgBpgPirj2IhQ8vYyDGYK7wOllb0E8SMIYHKt3ETIhsLcpPbRRkKE6b3gjO0CXmIp
         Qfc9+6YlUcW4yp0WEi7/CfpgOfCaREy5v3kLYAG3VkIOFcBI0Ng74FaTEo6EQ3nb9Sbm
         5NThb0QGf64Eyi3oHJX8yJV8bdL6sljR51RjZuznc5CUKOgcGkWiKeITUb5eYbL2s3l+
         +BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640757; x=1785245557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Md4f0+Xv4Zzq0lKW9IFlBD6/JswUoehfefY9+RsgtE=;
        b=XQzhBesAIHbYX2Ch/OokRgKZ8BVbhSfvsQ38ovnhyF6rPvKuccwddxE8JwqARqugt2
         Ax8SNgppZtQmdGlbHjKUOLt+Xu5L0cqrkhNfNn0zC1+7EwP3b0Qbv6IKl9Z4JN1JcSHJ
         dHFFXdEv4qxgJiUovm+DZJh7zfTiL+7h6byyHLkijiPkid2ZcNz5yXweTkMfkFd85aSR
         2InRJ8+yUbYOo+Fd7OJO59X9sxV8b89lkN3JEgtememzOXKg6JG8bkVICadIxJh9vD9V
         onuhDAsckzpXLkJV27cXGIXw9AEQHUnBpPw0lbcBXg2ZjiPQhADOdBG3Q+CTR+DwKGj2
         +6Pg==
X-Forwarded-Encrypted: i=1; AHgh+RrT5n42Ax67SVnhrHPDGlCcADwhKDPKitvtkH2UhLAvjJ368DWqAwxb4rIZ1KvE+8gl2BDcXJBnymqnUmC7@vger.kernel.org
X-Gm-Message-State: AOJu0YymJLXUKeDLwnKlXAqvS4BzQIjU8u4KLI8J2gJxmUXi2RNIdC+n
	agpdcN0z5EtbCroeKMqpSJN/qzi9qTnmL16kH572UdcCkMVE9EOuMKyTWzSvn9TxdQLyoUbhKfL
	04pjaL/p3wSnumTbPwkeGyETBfS6WEgjRl7jo7uWV8Z3zDpzR6HUXNf4VF2rirtAURYam
X-Gm-Gg: AR+sD10GToTeKqIYA2Lb5NOKOSkfD3aAO20PgURX6cOpIIjlJTihIrWLDrIasBq7raP
	TXkx4AnS7+ytxGUqtxu1m9b1OZ+YVspuF3hxcs5gTqHFjK4rUdLMrtpjNbEcYEfgO+TBUSdG5cL
	ZB2ghORaCLR6nAh3tDiinVLyS5KBfIc1iW9z4eZ8DsYxmWXlM5y+2q0FO6tPonrfvguJkioD2Ob
	VF1SyrSLyOZN/t/zkiOIbiKYpornDEipDBz3EX7j1uyS0xwLCwetT8Wi5SmpSdPn5w/RQ/YNdtJ
	kKubQoDILnX+WCic2UBu6H3SFt6IIMZtKvBc1KnwXGW6NEO2FXWkhWjzLIeh9G7LD0HHr7F/JD2
	oA/o8Dzr1Tj798IAs+gclxkeI9mM8KC3/XMARqd9YaqBpqbaDi65f+16rLlSYd9UTgrJKBto++9
	lH0mXssAojdYZfYg==
X-Received: by 2002:a05:6102:b0a:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-747531315acmr6448924137.0.1784640756578;
        Tue, 21 Jul 2026 06:32:36 -0700 (PDT)
X-Received: by 2002:a05:6102:b0a:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-747531315acmr6448891137.0.1784640755956;
        Tue, 21 Jul 2026 06:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291da5938sm2972262e87.31.2026.07.21.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:32:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] phy: qcom: qmp-usbc: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <4nd4f7bfliwumptfr2uykm4x5kyqd2gy7oputk7q57yu4g55df@4i5nzxl44i7p>
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
 <20260721-qcom-usb-phy-fix-null-v5-2-a181e2adbd2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-qcom-usb-phy-fix-null-v5-2-a181e2adbd2d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tSNrKUOZd5R-Bs0pO8aO1dkXqfZjvzei
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f74f5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=X2BsbLyNcjRDPuEeZYgA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX+Y1bgDv0d+mM
 SeG9y6Ka3YByKvmNRpiG97R9QCY0cY4pq0EAsn5WnuNN6KeTGkC/giZLuuTfbB1EWVaQhGx7ADn
 XCkLEk4OnNJYl4WQTbLZSE1iXMt8vvc=
X-Proofpoint-GUID: tSNrKUOZd5R-Bs0pO8aO1dkXqfZjvzei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXxrWz7KFM3NgD
 5SfRUZRcevepgim6hXIq3CBeQnkKt8excXc3WGDcMLN9ysfLj+4DFuv0Z24KX5Rkcij8RfFziIO
 j77YMMHYZZLQ589wlA7OPPGX/GXbopn2XkqhTkDmO+Z+cgzZ/ULuzOIeSbXFcgeH3ocwswhM7gq
 Uk+wCykBsvEsdY76xqgAFoBsCLR6iKaPVGlCRBKqodY98gU61qIUemyp4zsU3Urjwk7+WXNPS9g
 M/sUkYMNZ0sbl3dpa+IjIIytV3a8wj4ufr9xibBiE54z/D6GAkNr1AjEe7Jasbgk/LyHjT9n/x+
 xgIFrb0yAIywnrvsiynTdT2+YtjzSfu+sFuR1uzYkp9T/aotCgwSfEuKMqukLnJOtl04YabpIFk
 6h0vRydAfrksJ56UWdug2Q0BF4EEznf+QoEZxDUmRJqXNVc1VPwO6zG0/vzgOBsE3hMKpY+uCEw
 bFl/jcyow3hnS6w1G8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

On Tue, Jul 21, 2026 at 03:05:46PM +0200, Loic Poulain wrote:
> Runtime PM has to be enabled before creating the PHYs, since phy_create()
> only enables runtime PM on the PHY devices if it is already enabled on
> this parent device. This opens a small window where the device can be
> runtime suspended after pm_runtime_enable() and before the later
> pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
> the PHYs are not yet registered.
> 
> Take a runtime PM usage reference with pm_runtime_get_noresume() before
> enabling runtime PM and release it once the PHYs have been created to
> prevent the device from being runtime suspended during that window.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index ab3055bb5b0c198832ae06dfcd04fd34395e271d..4317224070fd8dec98090e9200ac7d0e97265979 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -1959,10 +1959,16 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	/*
> +	 * Enable runtime PM before creating the PHYs, phy_create() only enables
> +	 * it on the PHY devices if already enabled on the parent. Hold a usage
> +	 * reference so callbacks cannot run until the PHY is ready.
> +	 */
> +	pm_runtime_get_noresume(dev);
>  	pm_runtime_set_active(dev);
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
> -		goto err_node_put;
> +		goto err_pm_put;
>  	/*
>  	 * Prevent runtime pm from being ON by default. Users can enable
>  	 * it using power/control in sysfs.
> @@ -1971,13 +1977,13 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	ret = qmp_usbc_register_clocks(qmp, np);
>  	if (ret)
> -		goto err_node_put;
> +		goto err_pm_put;
>  
>  	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
>  	if (IS_ERR(qmp->usb_phy)) {
>  		ret = PTR_ERR(qmp->usb_phy);
>  		dev_err(dev, "failed to create PHY: %d\n", ret);
> -		goto err_node_put;
> +		goto err_pm_put;
>  	}
>  
>  	phy_set_drvdata(qmp->usb_phy, qmp);
> @@ -1987,17 +1993,21 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  		if (IS_ERR(qmp->dp_phy)) {
>  			ret = PTR_ERR(qmp->dp_phy);
>  			dev_err(dev, "failed to create PHY: %d\n", ret);
> -			goto err_node_put;
> +			goto err_pm_put;
>  		}
>  		phy_set_drvdata(qmp->dp_phy, qmp);
>  	}
>  
> +	pm_runtime_put(dev);

Should be _put_sync() ?

> +
>  	of_node_put(np);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  
> +err_pm_put:
> +	pm_runtime_put_noidle(dev);

Why is it _noidle()?

>  err_node_put:
>  	of_node_put(np);
>  	return ret;
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
