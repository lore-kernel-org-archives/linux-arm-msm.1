Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC173BCD36
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438955; cv=none; b=Z/rKJataWbEUuznf0bPiTb6Vv5/24is/HIPVzWA2al/HXRpf+wsPZjEJxd1nSyo+iy+mqz2NZOILDLoHk56oXyFijwXb+pEN8iafgvoLRXQyADQuTvxpjWCdfGQBOLRr2D4w/PJRmQiPgBjKJxyVerGa+HP1UZd0Dv+P+dmxEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438955; c=relaxed/simple;
	bh=SnxgTjzR1Zqve9Lg5TP3239+WHiQbhWCBAAzxA6DzqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR9KPB8zAr9ePMuft7MGN6+rKAyz2YpPGd8m72jxY28AghzHk4S9Nn9yIGNPpeq+mlcUEd4vewYVrnJ3L0b8U1ML6+nL+xwT1nYODCWyeNllXFcjhY+YBZdty8lDfbuG3K6RSJshFnf4cAaK5iMt3q0r5bItCq9WuW1OkpQ2ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blsdWOTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTWRifPm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blsdWOTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTWRifPm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Blsp1752705
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 05:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2pabwNidMfIZQcD09ezoqQZT3EqnKdE0n3SpfgNAFc=; b=blsdWOTV1I7T8Jv4
	3Q2/BTrBeKeYuu+ykt6ry8d6TEaBmpXmEspwMo4mbdRaju7QurwFjmWX3SPNB32j
	Zd8MqZxM76juvvWS2GtwL2JAT6drY/Ov0J9xTFb2DRpFu6twihr+X7pn4AQPTyFF
	QbIQzw+G9yOP/eMm8shd3Gj8uKUNXPCzsWMQ/G/jaFYb9FuCbVue0FeWYSd7J0DB
	ltHATrEc+IgW0hxUyqNhtD506X7FWcAGhZYF/5D2pzN+AZ+JJFHLjlAc1sD/Q9LI
	dgn2xm3bTAPAPWdl3uBeEtZROJWqG5mtVqVgB+ST0JDJMXhNLZkWVO9WuGaQ6rhW
	DddxVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sf7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:55:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46c120dfso537041085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438953; x=1792043753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2pabwNidMfIZQcD09ezoqQZT3EqnKdE0n3SpfgNAFc=;
        b=hTWRifPmAUQ1soJF4STEfgiPq49q4NjKJbX0/J/dM4sB1fTa0egGQxeFvq9oLhveQQ
         6p/QsvvhzsL4JBqv/hmva/hNL6SdzwGVrzGJA2lrxZGDT/ZiO1WZJQugX5HgXzs90589
         VB1NlZmWnh9dk0b9UIUpqrpmJtEXx3b9wWOTkWqrOdN0tgTaETT25Vjqm7MblD/a/o/X
         Oqp6UURgssmNtOKXv5CZ8heOfVE9LGfzu+Ae7w/R/vAj8iQRN31osvIvtUPl0eo2cQ7Y
         5qq4RIytPnBfAVU+d19qIorQ1cv90ax0oXpRTQp6ik8cz4uF3V43pRb6dej0al0czeF+
         cQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438953; x=1792043753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2pabwNidMfIZQcD09ezoqQZT3EqnKdE0n3SpfgNAFc=;
        b=c8us54jCVxQwTx61b8TurpqI0pe/GrhdUU43NDt8qyBenubqdhjr5dWgLV56eXWJnf
         wZm2xg9/V7jVxcrqKR+1KTkZ/IUDd5NCiewbEmOBf/bueQ37I5PwnynigVjFpy598OS+
         kznT7EB6yPLUr/FNFTihG2Crvl1/Yjgl73cC+winmZamuwmOslCW8chSWihbCdZl+q/k
         batNCuxQ+P6Vgek8J71TstVvZn1BbmXcaonyrFZjhQwEkDKuk3X4vt0fnqJmQ5Jc+B9E
         stNX2HvR1pCd8hNrUcGdRBIJ1ZFFqnqaQ7gr5zNRrsYGtUH4k8qSifo0t30xH6ST+H16
         dViA==
X-Forwarded-Encrypted: i=1; AKwUvBzgQhEve5NyjWBKyCLjjocT7oSKqBuXTvn8zVXPXPxfdocWq0RudfnlVEUqJeNOyaPEuo//KM6nswmC9SYr@vger.kernel.org
X-Gm-Message-State: AFuF++kPSeB+QQXmPckINBZUWIcpMFhNjihcTuqw+8WPnd2V5vfoelH8
	Gfqi/eqhQrzCbQQdIROU7wzTEshL25x7hNmqueCML97yQUz59oTYyRtw75R70wDqs78v1yuBmzd
	BiE+L4v+FO2jepy9E3Bo44v9bc2cOn/XLSx2o8CJYllHwypMdxksYGGY9ngSY45bn6V+i
X-Gm-Gg: AYBFou2NwkO3lnxiDl2KA+a7V2rE41kbiFj0vGmQVBqIX5dN64atqvakRe1di7txvsg
	9JhMKU6tRw+EltaEhaJtoPbj3iRQYNmR27IX0C9x8IH55ETrd+lt2woDfL3QLQsEYMO1/hrZUBv
	j6A/F0+eHfAdVqFqTnX33z/+snOG5CmlB5sfybYOxjgyX10vHmefVd9D65wzxVF8HnRHnU1pVNU
	F82SJANT418uB/yp/fGwOi6ShUTwAYznW+FAizGi9JCeRaLM45UfC/4X7WTcXF4Gix9DR+qmhl+
	xEIYptt/ptiTAhYwpEnGvslrTOI+6UjOexHbcXx5qtd66wjmmSSSuwvI443m6/tYFL+Re/VGyTL
	DweZXK+xw/rvIpNZtoEpiN+cfg+MQbHCnl1//0Wg=
X-Received: by 2002:a05:620a:8082:b0:93e:9808:b9ec with SMTP id af79cd13be357-93e9b88401dmr908482985a.81.1791438953065;
        Wed, 07 Oct 2026 22:55:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8082:b0:93e:9808:b9ec with SMTP id af79cd13be357-93e9b88401dmr908479285a.81.1791438952627;
        Wed, 07 Oct 2026 22:55:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5f28sm49261805e9.12.2026.10.07.22.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:55:51 -0700 (PDT)
Message-ID: <3235a3c9-4519-4af4-9ea4-8e41f15fa341@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:55:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/74] media: qcom: camss: vfe: Call vfe_subdev_init after
 not before significant enumeration
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-26-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-26-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac73069 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=lzbwJ7qkMF73zFqNUiwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mzPFoiDHC12Ro4XdS2aGh4g_xTLK4Zu9
X-Proofpoint-ORIG-GUID: mzPFoiDHC12Ro4XdS2aGh4g_xTLK4Zu9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXwf+iDMYcSD6G
 eTnR0dRMXaTwTvqcjI59M0flSLyH9orGyHs1OSxUHNkeXERvS0FL41e/5krk0hHUOY+G8srcxNq
 NVjIQ5L5BSHieOYb+UiytmzlY2pypOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX9DlDy6K7ndq7
 9p9ZvbXiAgPYYLHdkF7fMJo9V6+SjDixLJ+9jfUV4ctAlGGW+0EQJX/3lggXwbpZJIPquMcRfLi
 6SSICzbinqZHa1eSWT3w+TieRMreqI+HMzwia81pTTYliPyUJYfC0KyzjzVNYnmj4rzsCcPndYn
 //z284MAKRqZBcO1kC/1ornb/AtNM81OSKou/Z7Mb+wfgwY/eap0y4jpm1jH3bdK8Qa365UQOFL
 QhdpUNaV98Zhhrf4lcatpkXOF5n9uBRNei+UsBke4MnH+8TdaLocUGFb3cyDYpeCUWEojRcvz6W
 ycFRMgiirOAkXDFCYqZ5YF2nkoPqNtA6j38fAVXV90s1jlOjUj3VsZF0IbLKdThMAHhvvTcSbti
 esy5B6LMLyFZvKEf9H50dmTWFjqhpUvL5OdP8Kisia+25OGT0wqRSKbHtCjpYsUT26pbDOgrBwO
 E5nIiba2tcADy19X0Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Please update commit message what this fixes and why is needed?

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 8899f02ceba02..667cda379be44 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1930,7 +1930,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>  		return -EINVAL;
>  
>  	vfe->res = &res->vfe;
> -	vfe->res->hw_ops->subdev_init(dev, vfe);
>  
>  	/* Power domain */
>  
> @@ -2067,6 +2066,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>  		}
>  	}
>  
> +	vfe->res->hw_ops->subdev_init(dev, vfe);
> +
>  	init_completion(&vfe->reset_complete);
>  	init_completion(&vfe->halt_complete);
>  
> 

