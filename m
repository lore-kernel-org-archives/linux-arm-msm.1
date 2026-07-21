Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2E3451DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633894; cv=none; b=tARokQ/BOxjlhH1uu6lHY65LfTmG29B+KRrh/Uq1n1HSXmC28kpdhS4+HeKtIBo6WSlN+REOjmIH3jMtdkuHcYvG4tg3ZiUnldkkdk2Jt/3xlXFr94nXRZeBX6oHOF0XhG5aIYpNDJfyPANGWUW0aIXkhmqX8owhBpgN6LIlLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633894; c=relaxed/simple;
	bh=J5+dlRIcGdEBIMh3/R6fcjXfPbiVgnNn/3o+ZMwkvLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBtsXnci4MSCVMvWC6n2LRd0onWpQm/hfQchOrHfDlMXsUrzdX/u8rwheaaYnIS2VXOCoUsjOshoxKIi1mjhqbvg705FtFLcxlNH9Cb9YACWrOoOSdn//s84tQAg3kxJVG8WSlkDpw99MXOGHQa1C5k+KnaI5HNJVxljvYkypGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8FLkf5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOrIPVpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8FLkf5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOrIPVpE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARuAU1252094
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=; b=V8FLkf5+YYyljXR7
	xCOxkgLFeD6d556f8ZWaW014/LdxfWAAF9Y+W3Is21iFI6DgcPhqZApi4hKyGzB3
	Dv/BkjF4XyKENHWNnQg1TOggOnUTSWY7OJwnS/DG/buovcZfVPxMkE33GSPHweA5
	ZHAGdXbolS061sNBoku/X7NsTQDmSLWQR5wJIp7d+F5PyCLrc3nIkGo1LL8YcwdI
	Loe8WzsSPKaFIq7/E0zM5+TCds6L4gMxBqbxXHnTH/BvNSqqGDSx5ko+ZIpnFtER
	JyoZMUKH/KFUFHhSERUNZ6fKi1vXSAloJ6/Yzv9/iAteSWgAcoXyy8S6Kku+g9ao
	H0ybjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcc80c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:38:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec3314f65fso227988356d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633891; x=1785238691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=;
        b=QOrIPVpEc6QtHqdgECXw6ukJxyjF75ncakddZVVVuNe0GBCz9k3E74xgppHLQbVQKO
         8dfwS9Ca7Ne6nT6sVPJfbJjFohx1yhizTvgzV0Q/AV9hrxOSkBLISwqgJvqJWoS45gDH
         tuw6Rnp+BIyPN6kyGvevNBJN6VSSlP4F6MAEiPy5FYeIAXGiGN9qtHAHI6G7ius5ybLi
         a22vjo184UNvq8nq8ghaqfskvOyLmdfQpscarespLnyZpX+/nEJYMtmtGK23Je3jikIO
         tmF3Tm1DkJQ4xqRSwRWFgseAZymueLGkWtNO1ottRDw9giFPWHE0RZx8ve8djLX8dnfW
         WSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633891; x=1785238691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=;
        b=IyHRRMn8XzIeZL4+Xk8yvktxVjqfdp5TNdWckSbfN4CB2uVgtH52k9wYVCHcVQ8xfe
         OOrd9Cvm4jlpAIMj874AuUvsWfBK5z2zol1pzpRkLofuQo4zY1zktHh/0rdfzOplk/Mu
         TIRTI533+RURRYu51oL82AP3/NRXV8On2KNNSKMAaQEvH6/Ijb4i0RoJ9CIuKt6jWllZ
         IZGLuu+BDBS6VD622gy9cx+vtt7H7U8xX9qXgs8TsPIkiNrBhf6kUl+4GVs9lP0pzRPJ
         AA4YbWsiQKX+v5zj2Q8TNI5wedBY4CGNQ96UYgfwkSVUU7O72GdX3KDj0Ud4uqB+InjW
         dIIw==
X-Gm-Message-State: AOJu0YxYKp/sZOXHLkgSl6j4JzJ7EZ6159aWX+AErWFi28tuMMGmtqM9
	0vLMkDGaP7UfTRY6GJ1ls4yQYsdK3BW28pQo36c7pTJwAKkG4SkvB292wsCmgoFc8bbP2BA5PpH
	anMeMYAp/FuwYoBq6azBfTVIRFiFhR4yOdEGMQNBLWplkGMg1wf7ZXIWWN/Jls/4W7+Md
X-Gm-Gg: AfdE7clEA9FotQF8jDXh09NQPdOpHrv9yJN+9kFqHObchl6jhS1FujX6xbmLv3smez0
	dZ1S8AHLp6ZjmU76qLkFlodiiyUSW/WqqKSi8RCm+mXaBhpupFRzJ9hCayDMs1uR3j4YNAHN/PM
	zoh7pqL6Ulmj4dDw29V/Gtq/94RdE9e0D1a72OLWi6Xo92EeRnvrrzges8ig2Sy+rAT5CSLOfDi
	buBjYVKNkh9csSV0+2VSbVDSKnghd7Wkp1RZAeLLJlvKZ/veITFJ99fRrObIPtRTguWXdTxhdEK
	Pm3B81/3x8yXimSOGS8yoRHOqbiPIsEfk5+b9sg9jGh0LfzAoMEc5qhBl7e5bgjvcayOcmJBEP6
	NotijqJvCJVlcIhQknvG34lHvz28=
X-Received: by 2002:ac8:7d0e:0:b0:51b:e991:92b7 with SMTP id d75a77b69052e-5213c2018d4mr158323541cf.29.1784633891364;
        Tue, 21 Jul 2026 04:38:11 -0700 (PDT)
X-Received: by 2002:ac8:7d0e:0:b0:51b:e991:92b7 with SMTP id d75a77b69052e-5213c2018d4mr158323331cf.29.1784633890849;
        Tue, 21 Jul 2026 04:38:10 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e496ffsm37564253f8f.3.2026.07.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:38:09 -0700 (PDT)
Message-ID: <850593bb-a348-4384-a034-19f98fda9197@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: preparation for Card capsuling
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMyBTYWx0ZWRfX3O9CyQVO6Ypj
 p+GmAvW12BYLzCmKgSNolP/WKX8JCj/M392gQlhE3yMQ3CVs4kom4zIrAqS7Svlpg6Eq3OOv4Mr
 VSHJHZXD8BPX9BSJ2TmnNCY+iSBM/BI=
X-Proofpoint-GUID: MvZd04AQMI_qTEF9-_9ohxNHhM9inpX5
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5a24 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aXA5RslYEjuksw6KpowA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MvZd04AQMI_qTEF9-_9ohxNHhM9inpX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMyBTYWx0ZWRfX33ozvN87/BUq
 vCBbl+07ar/XcfX1rx/J2yrz1gyOc5uSw5tMIdZNMliwaZjBsGxhncF5rSlNhiuLZIRR6PPOPjn
 zCgo2iys2IL5/3KstYPX9Ly86WZe8cheJB5viDKMZd5yjtBHbbSVrwkifjvAWzkPZz3P6nHLRdQ
 X+sVYbcB+jQJpEoz6w1w6wIvRb3OjB1Kq2/QtTVgCeuw78Asx6//MmtNH3ezTEV6JW1N/xv9Ls6
 wMHZJzaUctnAqcwIjzx/RurzSFp1doUKdohnxh388a/IwKSy0NrMuhdZw4xrN4LWeSvEAfqS6ys
 /aaY+4FJbP/BVcuZSDzfk+Gv+JBGIuPLvhTsw3FnSXwc+y6VqokGyTeHHTfpEnoqyf8N7TnbJf+
 /xhKctqvp7ma2jYx+/JtYCsnInBZc0uguyvPj+fp6gVjmiZwLFdbgtnJ84Gp9iEQ/mhhxbqxEbv
 8yi8rrmq1U8PLybxajQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210123



On 7/21/26 2:39 AM, Kuninori Morimoto wrote:
> 
> Hi Qcom developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup meson drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> 
> Kuninori Morimoto (3):
>   ASoC: qcom: common: use dev
>   ASoC: qcom: sdm845: remove unused card
>   ASoC: qcom: storm: use dev instead of card on storm_parse_of()
> 

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/common.c |  8 ++++----
>  sound/soc/qcom/sdm845.c |  2 --
>  sound/soc/qcom/storm.c  | 12 ++++++------
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 

