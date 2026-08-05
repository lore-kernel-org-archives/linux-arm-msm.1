Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50617382F28
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922681; cv=none; b=asZpY9YfUU2dbR7xAYEI+1XpK6mUhzMwsrF2YFEDhyu4gxS/J94wl+RdMJGET1YjdYb14kpwRQSl4IMXlCy3a68/xFg6RIi5kpinoHmnfabyAkN0hD2BfE5w7Mu2tQpwX1FvkHvDp6Ilfej5J0MJf/75IK6+Jpk8pdPaJ0+M9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922681; c=relaxed/simple;
	bh=KMR6SWM19erGsffKdL2Iv9/3DBMFJ3A5y8JxmficuJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bLkBipCKFryabUrqegxs6GxDVeQdkxFTZWn4BRqeTY/6XCpHQLnkp/s1U/IMDaOV/qKAh0vU0suNe9wzEkdrOa1eA8fd/IAiFZuUAI3/ZZmdtEY+Q7foAeHSTsvNijQ3J+H3skb6ch50tKJaev3U8MhIRIMEUXT+f2ToHK8pCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoMsr0r1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVxgxLPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoMsr0r1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVxgxLPd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758ddEl2669653
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 09:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMILTWQ3u1gjsljNym/1x+Kl/G5TJKj09mRXvfx+800=; b=EoMsr0r1f4NBTCMO
	aOpTeOK+9Wrnx5rVf/Y6USVH82y0msZ/zm4VKHmfgEohVzw/AJp17Vop8Tp1j4uB
	vFdDFMryU+4tYEDr8xx6em+pxofb0Pnp7DVRSm55mhO/ONfOLwh+GnNtbkQXaV05
	vips8j8WEqpmGhg6AjUjUHQ5+UkdjHlbTYrcJEZtWmwOa4UXCjiHIwkofSEvGRek
	XSKiXWv4oKp3Ru83s0hM3zO82NJXG6lbbDJmO9X56sc3Ojr3sQyvhs0zK6hsmS89
	UMGJv4da/eghcSkm1Zu1rR3jStResHIJWgCq+fWOjoOO7f9R0CAo+9Vag2b9CVwf
	W4GGHw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3qbwm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:37:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso927436a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 02:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785922677; x=1786527477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMILTWQ3u1gjsljNym/1x+Kl/G5TJKj09mRXvfx+800=;
        b=XVxgxLPd1NwVjuW8paPp5MpdTVU4K/sysI8hNPzYnTI8927qJIo/mnNjaQVnn3fZZu
         PsmYbGYMxHqvqXXvCyfqQ74RwbVC9hL2DY/yqMMIajkQ0+Iiej18+M7xJI9ZsZoFvYwK
         f5bugkaei4hZsC72N0Dnrii5z/QdLRBwymjmkfUaYjTomEfwRl3TZU1qFwEMekO0vSi0
         WbsaBx9KhF3FLQ4W8Vg5A+oRN+uFBSoiFTkr8A9jKV0/je8SlxY6d2N39ZUlqAVTmmeJ
         RLkcZjAHgmunQ2M6CXgtWXZ9rqJXmIs21n7WzEOgQF3a2ne3AJRbVFwVDeEZDmdAC89D
         ygAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922677; x=1786527477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMILTWQ3u1gjsljNym/1x+Kl/G5TJKj09mRXvfx+800=;
        b=JASWFL8OTKfR/HRRNv8wi7D+UKgNXcCbYzklxi/lD1mksVMyKop5aSyJaLzRQeFP6F
         sj4+HLABZsbXUZz0G3XXgW0UHICWYkWHZ/r7xubIYkDVCOjSbMs5fU9xcR96UDd3rnqR
         sAj8KeoSK9Ok3w8legyIK79eCtWR4MzLfG9pMlxSQ/OlEll8RPq+MapNNaISrf2J+ZFB
         4GvW1CRTO9Q+XsaJC45sK56fX26VVWpzrYGCEIvevelNLrZzf8UIUvA1yesHaCLuPiVm
         gyBA9grYIDdskM+haGMvY4mhx6wFVB4kAm8xxDxj6jiPmjRfBBL4fKWGlr2Z2MJpyRig
         uo9g==
X-Forwarded-Encrypted: i=1; AHgh+RoR9bSrcnUSK7y/5qEIGqADyFfNsuz10WthNusH+naiTXdLCM+llXUpYUroYv8zSyLUvTxFccyuGs59O2r3@vger.kernel.org
X-Gm-Message-State: AOJu0YznKCTFB70zIgHhR1Ecvll300dsxxAZsLL+wdsMV+UK/Wey7n1w
	fDF8EHvbt3qwxvd7P6hEwdsO+Z5TxVG7W9KoQq9ZHhn6GAHJaWwHguQpRXJMO5gdUITDXjL/5q2
	8+3k5upemdRYzkRoxdEz9dr0HcSbmbI7ijUNY/uryn7ly+eU9h/Igv4wgHZ31uZkPVTjo
X-Gm-Gg: AR+sD13prH5xCuAjUXSFEF1pcVIIo+BfZSJ8F+A3vVSJ1Vujtnz9qTqU/o2ljBZkGGx
	mIcKQeF0l4xGAFTQu82iRa8ZlZ8hAqQrrq8z72tUZpSrMqVkZP/2De7Upu/lVgFT5K3OU3QMcGz
	xmsGL5lCjknqcmgjE20RdNk9nv6kKY/29kFIgSFxc6DNyTjRMee8w/5FKyebvrtSbdn4RsXeBvn
	zZacXbXhUk6iQ7R5UJcrvwVDC/QPwAFTPp0Be/Xfw5srM+0dgIxpjYczPXv+gP8Nks+ZVdWMN2b
	B6/wonaZ1u9qaBqO8K4SeN7uuAYFGkEL5i5HxBwcan3cqBkAg3hSi7OBy1LbIVM/N4H+jC5AHxk
	PWt/sw8/GzQol7rCCOr0UZMi4yGPGAMw=
X-Received: by 2002:a17:90b:2d84:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3903c538263mr5524739a91.8.1785922676962;
        Wed, 05 Aug 2026 02:37:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d84:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3903c538263mr5524717a91.8.1785922676489;
        Wed, 05 Aug 2026 02:37:56 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917a5d0sm2756152a91.6.2026.08.05.02.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:37:56 -0700 (PDT)
Message-ID: <19104992-25ba-42bc-a7b9-c45f4b57c22f@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:07:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Simplify PM resume error handling
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        viken.dadhaniya@oss.qualcomm.com
References: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NiBTYWx0ZWRfX1Jua7UW8K9jV
 z3tkPKR2dfn7MAoeayTmJSl0BYhHcDJBJkuA26RAaqVBvoyxXIn4ZZLqZTQimIxOL9Fy4UtGkWP
 2Zci+RealPWofBSgLkJXWgGe+jHTlwwoSgBten5jaKsbjnHJlonLCiRcbrK018zK/mLJ02kzjh7
 +sBzSpoRnaTg1Zki7+13dwDOar6I6oJU/5CzG6BRxRNO+VAYA1qNutujWiSNj2P3cPjfsIkmQZm
 pOSDKDglhiodMpUHmwxGxAEzGnGeGSiOhlGjWcIz5eLBpQW4GKowDPcIIJhT3Rwbgso1vfBxKRH
 aaGXcK4npGLTwCTWlF1W55wW2+Ig+WbT3G9SR2MnFY6n5LaX/eoqPgcf5FRyh2xhdldoH+t7gYU
 HVQr7F5jAEOLORkkj/UpwExtByHzDkYWg7bLwqdkmZrdhdED6hRFemsk4cE3WD4BUM+ArEbNVgg
 xHNu8WGbgAFSiKFBWuQ==
X-Proofpoint-GUID: qdInH3VvePTirq3oAW-3LTPeCuvnbmLe
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a730475 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6z8TwaGRFWoLiM2ZyNYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qdInH3VvePTirq3oAW-3LTPeCuvnbmLe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NiBTYWx0ZWRfX+ENnRGRHnpWz
 GgLaf0ZGQRKQRf/rIaRQk6O+G6AO3UMqNcYQFi7mIaCNO/CtcF4X66ro9wLmQ09Y1k8l8huulaa
 3rUpJIp78uxZjBW9Pu+NhK1lLQevBAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050076

Hi Mukesh

On 05-08-2026 12:30, Mukesh Kumar Savaliya wrote:
> The driver currently logs pm_runtime_resume_and_get() failures with
> dev_err() and returns the error code separately.
>
> Replace this with dev_err_probe(), which combines the dev_err() log
> message and the return value propagation into a single call, consistent
> with how all other error paths in this driver already report failures.
>
> No functional change intended.
>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index d5c977e34994..96015e077b69 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -994,10 +994,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(gi2c->se.dev, ret, "error turning on device\n");

This change is not required, as this API will be used in the deep sleep 
use case to reinitialise the SE.


Thanks,

Praveen Talari

>   
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto == GENI_SE_INVALID_PROTO) {
