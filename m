Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412324;
	b=hYJ2OWKMRueFGrDEV6dnwyB9hjpDZeUag7VWm70LBYnZwPW4mJWCIN9GmqTcpV4hjCoG
	 IOWblCr5wMJnnXjouOPvLvepDwVDBo5HlvDXNhOfuXatXGytQjgnMUIy6R8vyvNVoB6of
	 lMPxdsyPdYwHSMcknwDK0q/FFmszOb39uoiJohCQKaNvBhl0VO+FSTWsTxOt5vj7dS5wP
	 8oKnNhFedF2SjMjcnsApNFw9pwJ7t+9ymFgdXjWiSHWGuctK4jnmo23OhF5hUS5MIf/pc
	 +ph/mt6G+UwMuu/15GmnpLZkig8LlgyMUouk1ZX+D931GF8NznMhp5DoqoVxGHHmJFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
	b=3mY38rMparXRh313hTtt8pb9C+9kx8QbCTuRDEQ5RPzEErpXa9l64uxnfZCYAUIsXom+
	 sLgnRMyUgpBZHjkXo+OM5BkMLdF5PrSqLqM/OUkkrEC7w64wIMqUTiYzx4zKnqoPwI4Fn
	 3A7s6Ul6R8C/jO3oNppqXy9GGX5vjBE6DZY+29DveEBtJEfxJYS68K2TeNQkI5u5KWnL1
	 5cQxpzSaAM61rjhZuRPLlRQ+EzkBCQm2jlpdTnRggE8prZXL7xqjstT6+GKnQc1QCzfPp
	 fCpI3upVVIh9hLhwH31lKeEe9Q4XomqCv2U+n/Eilb95nAx3DGSP6NnIR0bLdI/ObcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH9+ikMx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYDt60Gv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH9+ikMx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYDt60Gv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0X9W2594100
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V93kB7u05RsWp0bMsBHWnhdz
	wP8D9erQ42L3lDrjbOo=; b=fH9+ikMx82geJa3TucKjpmFU7n8JCGIyKlR0zHX5
	VqZ6kDY9HtMQIt4WvJc9rqbXVG0X0h2fZezpU8vwLoYUtCGJGBSmz5Dtly/pHuEa
	InOCM0hwq7g2RaG8aMwKk1yFunRudlRVNy/LapKZ+m8q5WS88xX6hhVJF1sEUmHV
	0qNI7SpHEuwlWvRVz53b2H1MOvQfELWJ1kt/iDgMvyV4wiTTMndiH9p1HPfjNiSZ
	9SB1jkwO8c24Q2Y+NS65/4Z7Wo4ZiK8KHwB1Tqu1jUFpDISSBQsXrxLlgjDZtVFC
	UNSmYCRNUTn0QKDBT3xhxuFesHrv4q02zQs999Lz8zxIiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9y18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:52:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so193966485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412321; x=1795017121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
        b=FYDt60GvAHHV/DXeSSfwMcb9m65jABnxxJFxN7tVHV7dm0x+YkJwWQ2DZGORlOk+W4
         BDWoOWz5kupTvg3vWfR3/RuWwRRJJHsAM7d2PbYMFWQM1KghWr5kaRkoqOT4D4LfGy0n
         NooVOFlpTq3wqSJMGue99WZhj1Qw+qkJu0/1bywu33k4qGJ6HOPuA2V4U8yVmFWacNR5
         5PQMe0NmYbsqZ5u7fHUGne6bBodbTEjy6VjGL0pUy8mzGpgl4DPZGWRg1WHQWMLAuLqU
         ok7RY7UpFRRfEegejdE28aTUoF4yQ9WhmNbg8+ryA68cvZLXarMA53Juw3WUXKpz/Iis
         ReOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412321; x=1795017121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
        b=Z0rWmNIi7bPUOZvb77WHVnete948xfV0OspVruadI3UlpSeJD4Z/j5QatA/2wicONY
         pjD6j/gXd6Pi3aYAFZPWSW4wOAkUupKAQFCNrlUolJNRy36G1NjTgnfOFd0E7XoYhNhx
         HBYcp3u4BOiAGGMo3BDBfpEjw850o+Xh7AUdK6ONGtFT43o3sOQFnGjgY2l20eVHFYhx
         4pGxM0DsZkwmsg0UJrpxs35yW3OZqigLpyu/m5B5fbEZrnSUq7NNEDZkhpXDL4yfwJBd
         jx/FOSpFDyCw+GSGgZFrYTaJ0jFaaIcF42TjSLLEpF9+QudtLjaTF8lOeYbIpe/K1YSc
         8Lbw==
X-Forwarded-Encrypted: i=1; AL+hErF3uRz4hEBS2jt3uZlxWNL06l5iN3A/KC0W7GQc0UJzbc1cTaJx8V1NA5x3gk9mVDHf+Xun2TPG+OFKscwq@vger.kernel.org
X-Gm-Message-State: APuU4Z9KHCsvYSlNCiZAlXKXtSEiQ8AzA4VDjQVtffZue8gDJHBLmTvu
	NdWlF8BzP/0Ot+PHN8JnB8AlrHFtUYsNO0YkPA4DdnyxuEEdjr9ELlsA/3+vZe6mSbtsBgRzfOS
	gshxHSky6gjBdgi50JY5y8kBNMPuKMVCWp6uyeUaFAKHwx//sHMWbUgmv+9llrsOcFwnvHNMDa0
	oM
X-Gm-Gg: AYBFou3fZRR+R1xA/2ciQ7NGfn/Yu82ErCJMxt3MMDvqfbPf8e8by7ILFeIRU3Mbq14
	xH7uLG9Z1jY6eOGJQq2wy2XZw1j3uqXekUxlIGGppUEnDjk/NN2DOFtWXUrABJKDp0atvQpRByP
	0rNjmFXkaq5j6zH2f27YGFW9Txm2sADnLKa+mA+i1qU7cnpRw7k/rQK3m2jmHy4LEJYBagTMqdW
	kNsdxQU/+rnn5LMlMaF6Po2mWXf+MvaWdLyTlMRfMiljPnCPoMOoZrJXUWLei+pW+tgYifiyz2K
	C3+neRGJBGOdBBDfXbKm2xHTVTOcFIf+O6BaE5R62Kjle42SBbN8jinpBYzzs9AFx23B0i8JYiQ
	bStxSZbjVuhLiOD0HH4cpWtrVXPvlImLTA5WHnUvuwR0UuA9GbeD7S1z9vQwkAy/zd8y3BC/KtR
	YBWPEjuoh+jmu2ZVZdScbCgWxcuV1sgQesRM4GV4G/CUV6aI61pHlIESp2NAk5IA==
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr201208585a.3.1794412321485;
        Wed, 11 Nov 2026 07:52:01 -0800 (PST)
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr201199685a.3.1794412320217;
        Wed, 11 Nov 2026 07:52:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092293b0sm11950441fa.17.2026.11.11.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:58 -0800 (PST)
Date: Wed, 11 Nov 2026 17:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/gem: Deal with partial mmap's in fault path
Message-ID: <ie2suz67iwxidcggliefmuyi64rxhbslk4to34cb47ctd7jmw4@a5ran3vouptl>
References: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: jH1hgQebmS2JpkwJBh9pmIj_TVgNAuSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX61Y1PaJ/INpg
 K14bZoh7sIZ7hp01kWN3ZbXz/LX9ixO6Teb/pqR+v8wNXbS3qcujksEeWMTjZP6ljSZmvWCSUoC
 TOEhZoW2fX2aWib5Hgy8b7400zBlJQD4CFPofOLD20mCj1VOeXMPoM8OAdWBsyvHcnHjCextozs
 rR5MsLm8FeGP32GpLPwBHhtCbRbV254FLC/Qslp3tTrPIOjeuJpNpbks8DZhPlYsNF00P/RfpMe
 EwWH0XKSKYA/FRj/aZ7W+XPnLsIQ4gqQ7vm0Ww1jxhIrY52FbzRld2YnvW3EoO6tajRrIJm3xUD
 sm1D4PFLCRMa45C1rcA/Okcymw2xEXW4Vh8GwrDtMSX/ZY19qmmvrpq4F9Yo76z6HP6UBIqn38J
 Ms8WZcjrbSnt/m++vJHD+mIEB3X98dky+NrgO5syHrZJcRQgdfJg3KiupF+m/nm8RlnwzmObzjT
 6GKhqrBl6U4QvDb4dYw==
X-Proofpoint-ORIG-GUID: jH1hgQebmS2JpkwJBh9pmIj_TVgNAuSh
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af48f22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cM-CtGeE6IhlOtB9VQsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX/QorMoCR3kEJ
 OJZB7Urtr1eHJE9k/2KDNX12bY/RsYLEjNZO4eeGEvFMRPJWc8aWJJUHcw9izOgNal+eEyZiPKq
 Vb7UUeoxd+nOs9ZdovgGpY98MxkirKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063

On Fri, Nov 06, 2026 at 11:03:17AM -0800, Rob Clark wrote:
> Historically we ignored pgoff, as it was a "fake" offset that simply
> served to map back to the gem handle.  Mmaping a partial obj was dis-
> allowed.
> 
> But we can instead just subtract off the fake offset.
> 
> drm_gem_mmap() still expects an exact match on pgoff, so unless we use
> our own path for that, like some other drivers, we don't fully support
> partial mmap.  But this at least makes things more robust if userspace
> does funny things like partal unmap.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
