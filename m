Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427CF50C29B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784908; cv=none; b=BUQ4y8SuYlnlgxdDDMMDaBHvIYw4hEDhAzQCk3shXmtFdmv4o1S6JpIKzyo/Syun1jjyH9W6qoTp1plVHySWQI2KK8+dC2GZV5AwsiGKFUsOyyW0imF0A9mOJUB+BzD8cK8bFDZegT2jv7nNXuepx37w9GWRAB8nhei+HyOj54M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784908; c=relaxed/simple;
	bh=ShjC6ucNSbTXzABmodMFdB6sBUulSzcaGCn++++rQcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLE+p/Ntz6v1Vx3E+q9HdSTINjyAe/1BbA6yi7PJCMro71AlXC5W2t2676cjJqpPZ+EdcLwLSXru6ddjxFtRxByuACSqed7lHysoEhcpIFibpddhuCsuR1zz2Si1VE5IGPh1+r/Aa6ob/CtDu9J+xjx/V+7Gw6Juhb+FHI5BM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP3NiAuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0GSRLGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oP3NiAuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0GSRLGs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0CIw3283840
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rtq/wWlS+mrwHHItxvMoEAAj
	+R0M3kvLrZoj3LoEtzE=; b=oP3NiAuo54T7zDU1eTumaSIwkL4GQadMojYc0zc9
	IDQkrrMY4ZY3BLa5qy7te+Wv5bzwRh7cGkpOix0R9VrYVUH8T6GqbAaFB48JW9wO
	bRi7QslIGBoSZ/UDWDZD6ZpoiMSDUvj4OsEv73GvixX2JS6rd+JMxFZa9CkjbA+9
	Rxc2FgyUq1n35psfc1/wYsCD+ZBgBmLu1sRf7xavKtHfTQZ23Eh/m1dYOE9bvGSL
	6FRYjFhDFkwDjAIaMFKOynFgaLwZVejDyMdv1A4LEb9diIEI60DJ6zoBiLqjH9HT
	rdZA503tVDLvLQGMcyA007KEi2d5aj3pRoUR+lQNb4Qfnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn37vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:14:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so385946085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784896; x=1791389696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rtq/wWlS+mrwHHItxvMoEAAj+R0M3kvLrZoj3LoEtzE=;
        b=d0GSRLGsbKtDNhoiETd8z94T8S14tNR17QD958/JMth44nzl3MyRaCU2S8CEY6EDjT
         oFBzHri3mQOBDY348WrH3cjCnAsEt/v01C+C07ESL//5OzccjEcwYm/bkjWFhMCw5KQQ
         +2IwB22915vq5YPCdJbWTWnnIWIROBtrsCjYtHiOtd2EBDVB5sVf6ZMSflZPT4EkVMaa
         bGXmhQTZcFpBBQxpTkyFF6FtaJPqulVBd5HPSCmdj9L9iR1K4clYmh2C0Cl2VpVhlzRW
         aHkD4nONHClkHNef9IcesJV1CYAgqn3OXeDKrE4QWS1LlXormAWvEwcQtywsFVtG2Utc
         K8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784896; x=1791389696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rtq/wWlS+mrwHHItxvMoEAAj+R0M3kvLrZoj3LoEtzE=;
        b=poi/ZZIwmxTrrddjeY5MSah0oin0WXtVzQxM8mUS67gIMMbV1OQiKEhbbH6fLbXvzJ
         bPfrXrFVwSuz8o1JcpuQaRrDVktLvkvq+ea1ebV4MU75rMiP3j86Q67+UrIYymAX2DnJ
         6ascgGjE7oh+3H0zjXMnn8ILVom6lZBfxvLY6Pr/oVcuR05VJHo+JnowIDCzlz3fyUUP
         OK/TMt/5X4/ivfYN5mTO8mX0dgZqeBAGWsKEiFXnN2JfHx0BEumq41oNW5twPPaM3TX8
         olDZXD4XGWCQREVnsieL6+r+q5CtWgoiccncNh6XDdph+Hzri5FfkRrGYJseROOdZ8mM
         LdSA==
X-Forwarded-Encrypted: i=1; AKwUvByLChZOvSgI5u5+St2tclXXR8+VguSyYAwOSzFvxvUHmvKpedHr1bIeXu/v34dPlXHtm0G18QgzTFLEzHEd@vger.kernel.org
X-Gm-Message-State: AFuF++m1MlbDC1qge9W9BbUPA1ncBdJHguaIe/A58x8ATT6GfJUuUOuD
	gx50jfue95x1kn/23ice6DH7NTtiNy2okcalGdSd7kVOmmjh34NeXCOYLi1ThdKAQDt4pREPCxs
	CaYqmWXeH4ukYK5BMCFYJp2E2Alylz0VFK1wouswFy6YkhELq+7uAGQLgGAecFqSIcV5E
X-Gm-Gg: AYBFou2td6bNEn+HbobBkNkc70cTxwiaNJoCYc5BjmvD1PGQL4+zcBCGEgumOiDlO6M
	9mRC8bOk0l1TeLlEPnyv9UAznUNQ5LSnf+wSHPwYdiHE95L4Kaliwl53lK6RVwYnQ9DMugiCPUI
	Q+feDtUvLmWrZx0htX8Wx8J3YF4ljAHNbJh3RxijVQurMFzUWHSMtIdGbllxskNa+jLBsFxvGt6
	F7PJV9vGCth0i/wnCpXlm/vY3JL+ChPdGwgJpmf5K1/a5RdXYmtBDiqe5GyXSkd43RNS9m3gnRz
	a6ckIyeEAwNNJ80s/d4G0PkwFsKVEnEoIcA2i84w6SvPg6oGTjQNr6m340AneLPVETM/2QGxlbr
	6btajnxjUxwc9ihMDfkYXudffqPRomZsHSP+7RAid59PrgPBvZm7j5JWUekbOAWN8sQt/LSlymZ
	RFZmOqe/6gibVb
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr22565285a.10.1790784896493;
        Wed, 30 Sep 2026 09:14:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr22559285a.10.1790784895947;
        Wed, 30 Sep 2026 09:14:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf20fsm86487e87.78.2026.09.30.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:14:54 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:14:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 07/13] drm/msm/dp: Track validity of cached sink link
 capabilities
Message-ID: <mtw5s2bogogbbc7eyxoc44pslactrsa5h6wdqa54b4hldwrhqm@nzg4zillqtt3>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-7-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-7-dbbf8b2b42bc@radxa.com>
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd3581 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ksxQWNrZAAAA:8
 a=mPiFDlsqJXRWNEHsy4sA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: hPlXzmDyMcrQPyD7yX6Wi6bDmni22ptr
X-Proofpoint-GUID: hPlXzmDyMcrQPyD7yX6Wi6bDmni22ptr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX3myO3l45Bpbq
 S7xb9vI2yCxJzKR/UmFerD5xx/KZHidx6mgxk2u+ZVH9hBTX/ZNFRn9SdmfnopxSCXcyaAciYve
 2tnhVYecT2rhohlvCGcCgmKRzN217IxPGeulU86J2dJ0fhDLKhdE1EaA+IcRu5hb3EgVHJl0UEd
 OqM8Z8xp42pLlRYrZ0LecsYKK/dRXTpUPL6/ORigaHtDbrwhqjdMJMPW9cwegrGOQfghCjeWsZz
 S9bqqxFBF8CRnE56/UTDaAoIm2WfaXDHIxq0frdw47o82EfafbpMSlzkTqQq93mnnwnL+qZJ7qQ
 zuWir20rcQZKceTE2vQ8x/murRhIKOXh6hnoFm5uYfSGoFyjqaiMfIR3MbrjHKATg0SZtzc55tp
 fIKyMZeLqGEbUFE3CEaLY9dkncxWJAJaZoUWj385Tg/mD0VjUery7+GiygeHmsG1sm62y33Mto9
 9HqOK5AKwbxqdTGRrdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1AH1+QNVb9YW
 8ka+XCH+qXKQpdDo3z4qvK5B50OwvbRwTjYs9xu4Dy0LrOJzTobYGYeMMsqgjcP/JrjKQ2HtmYo
 0hruP29RaKg/IC4n8Vk8Pj8JcHlQiwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:51PM +0800, Xilin Wu wrote:
> An eDP panel may not have been powered up when its mode is checked, and a
> disconnected DP sink can leave cached link capabilities behind. The cached
> values alone do not distinguish either case from a current read.

Since eDP caps (hopefully) don't change, would it be better to cache
them on the first access?

> 
> Track whether link capability discovery completed successfully. Clear the
> flag before reading capabilities and on unplug, and set it only after the
> downstream information has been read successfully. Subsequent atomic
> checks can then defer checks against unknown capabilities until the sink
> is accessible.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
