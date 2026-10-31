Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478694;
	b=FVI5hPjVXRhNwzFiKAuU6Iq1H9xC7jnJaiqsrNw7IXou0+y+Zu8sBxcTb7p6ec+thus1
	 cUOlVxtkyjlPZ2NNLOMJkHjjL2guR7V3k/t4Cu9sWDKNEWa0XvjNn0ff1bCSSNLPKagGJ
	 48BttqWa0R0gO/5fsyzhXZ/0yKhRKLJhC1OVeFw9TCjLA1bOgwXNzieYbfgTzKpq0p57X
	 yZt9A6NmHy90EBmwFzTfHC2cfSsg6ougU/rNcM8dk1TuSsqttMdZ2H+6W6nMnLu43RnJ0
	 UOz8kOkOWuCnnfRR3vsbKZol4BCMJ518KObJzn510UY3frc23N3lP+mL8VZ1IywRclA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
	b=ZZfMBsK3vLfOHSUHdFBmIVXSKldoZ42hG6NR9VsNFlOW/BpXkTzsjv4F+F7yQo++QTyB
	 qQsfNoK7BRg3g4JQmhKELVER5dEdx8GqdiWropMbStYORQLi6ufB8M/NULCGJe1vJNJGp
	 2YbOu4zAczfxhrnHJ5uiNrL3Ev3jFCqt4goki2Qvo9zOTppZES1jd11L4pCCeUaQ9gxPh
	 xaTimXL4AvLQyfnYpTvflM3cVkhSr7TcH1faW+PE0CKltXal2h7kw6ADr7gHEzqi71HxV
	 Fc/3le7PHqWE8eBOaqmp/kLw8mMpMN+TOtOG9YE7VHD5Yh1bF63FQvfWpCu8+Xm1EMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gorF3E5T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gpl2h49T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2B606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gorF3E5T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gpl2h49T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFDTw1890223
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukK0x8ix9SWhHXUtQP3CPTLr
	QTiWMUDAJDT6GYiDeY8=; b=gorF3E5TzHG2eMX/5+4poZUAltnSP03K1fpI+ih6
	MHOyyjg5o3wWfkn3ydZBy6A/NIfc41lQDqWzwUjkWbpuBwE1+2JlxOPMIFyABWHf
	yFYDWaknyjT6YRAuypB+B3oVZrFs7iz5P3+L4Pn6u8JHilFAhqFPCzZ7sm5a+vxG
	JcFp7WiTTrtWTNd6Sh7NFhsQK4I5KA0YUSXEWbLoIf1F+AAP8trRXxDzffw1eWQb
	93XB39wD0J0JAMNlt200rbKNzNfPldCB3LvHjGnLl3fLenk7v60fso0TRq3Pscsn
	iu5pWL7gNXgtIYCmwczHS52MxHr0c+TWfR0yxanlZvqpbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7sy4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:31:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so454775885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478692; x=1794083492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
        b=Gpl2h49TO6C7mX1s2risvVMzIHgPhiRoFiqgApCd3KVkgpZHY9bvGoAbLwCVewRORt
         kJ+tvj3nYKUU3sKSzMlfus66PmGSreB1SFsmrvzyWtk3blZ8vTB78a9oaMjkxRU+6B6p
         q33le/1nOriMvKoBBf+pX4tL9SqGVpra875uu3Ny3BTqE4fO327u4fCLuSgGSQQ2oOSC
         IRCAczxjCsSKa8AB0jNG55ldhca6isJ2CMS96u9LL4XTfQ9CHWvznnyIPuzVxtR+uaJn
         p8YTN7JZXR4XI+rUyJy6o07R1AcsYmncZ91L/wNIiqkYYiuXiBN4FESS/4cSB/ju5oEY
         EmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478692; x=1794083492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukK0x8ix9SWhHXUtQP3CPTLrQTiWMUDAJDT6GYiDeY8=;
        b=ko5TRw8mun1oIUlxxPN3BzS7KomXBAHnKV8LWn/2ZeuDoGWr4RoZCqVbt3o7lDm9G2
         94b68MQXYy0jjf5SbgI/6Xa+o+Czloh5xiCyprBxy9kEHRju3HT6WP2lvdhD9RVwa4gj
         DiSqtdrj4SrXpRXtmW8tRPn3Bs9rTcqsvl2RfCIJTyIopQJpFNGsqobPjAvABm0ruwc4
         xsLedgbG42n3MpBpdVdfpcRbpaN096uU0sYu5kiqnaB97jo2unBTXxPzdet8wFKi3dby
         H8huRNlGPzxN9O8WS5TZn8caEmyXQ1/mwoLFKjjWE19Ozn8n80vt1Ccu7gBcB97bYCzx
         7GQw==
X-Forwarded-Encrypted: i=1; AKwUvBy1CpynyCioVp45KKrYmSC/usDqGxMuHa6uvMFbm9DM1pbpCNh1AK5WTRaL5CEVhy1N8TPglVb4ZIvhAqXQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIv+1FzBvFa6FI2MH+bUSZSHLC7HTvH48uEnVSm56+tsjHQz68s
	gl5ybRdQfIrhCCBxZ3Nr9vjrXh9hH7c8EHFgWaVzmkp62U+n3NjyoJpfV2EWCmKDdY93RgcEosR
	jUK8RQipS1GjQ6ZjaByA6JIQwEdKDNo9zSiezbWiVTsNNhE2SfvfE6NDwiYWH1yrAxYa6
X-Gm-Gg: AYBFou28ob6pbbARLdorqiBhzhgaYGWot9rWkMWeVM5zHtQ/wsmMgQ8GXiTQlVcWC2I
	JGsEocRvBnyTWN8rlSK9ug6Jjeh06qHmZ7WbnkRmBQDvji55Kyb47ofkoTWrO6g3Syl2nFDR9bf
	+Dax8uD0+q/2bPUWK4u3aAdpIBlR3IyZvDMJVnfdgrcLx3q8S1afoZ8DM0mkCJHYl1nl6zwutNs
	qBnJ2e4dJwL+/QQWDW9rof7rjwlqbHae9RiorwxoREQbtyU8DeE0WcwW3DZxjsRR+XkJhjY6xHG
	sZRlrkcJ/xa7y+k5lX45v1NRHgHDPEzQgYYJ9BUgEdJEXwL8CkqHNEkGV355tCrxuaL5WoR0aQi
	G7FaGtsKvAJJkGhHlvWTW4O/hbsoU2/AhNcgp14Ssif1BFg0zu1JhD9cVI+3WNHcGUW6MTKyB8K
	FMuJPaF7DaSnLv51pw4ipwRgmOYFoypJ0IO+LefIbAbvSyik/pyP9GY17X9W1vUw==
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr315062785a.29.1793478691945;
        Sat, 31 Oct 2026 13:31:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr315061185a.29.1793478691386;
        Sat, 31 Oct 2026 13:31:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0738dc4sm734554e87.51.2026.10.31.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:31:29 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:31:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dsi: take bonded DSI master cfg from per-SoC
 config
Message-ID: <hdft7yrut44wirysbfigpzgg33lucyb2ruyntcxu447kcsrsqa@k73fvjrhqcch>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-5-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-5-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: Nq5SgvVwXmRnO9ON8PHQlWfkvdcZZFXL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXw3HYGTiK5z4o
 R1GeKXm4GPuyUUwZ82qwY89kC1wnpi4lm5/Mpkn0tB82hm+0P5ugjlFOzMKdzBW2yXmhkSaDWQ2
 1NS+gOtln421M8Mj++QOgHW3YVg7nA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX48o1FPyMJt7C
 Fx7GWhOJ2joegE7zYc809QJFwqfiQMd3L4fMYlr+pj8DYT0j5qFMAtQwfKJZf+fIi8QDzZoR6Fq
 +6vq8+Cb/phRERKBMm8dlcydGC2hcourZR79S+CszM+0vLU/vNRo+P2rqimzgpA8hw0J1R1Iyqh
 fhqmWo0JPBGvvlBoJTHhvRNoiDvH0AVq194Q7eZlRVoIps0KVa3Z4jrrEAgxh1FuPnqRhqkT14E
 +a1mC7wlXQxbl4V6GN3SO0cIktf+iv6Na6EPpDElAimoYSz5NadlfoVFHVKogVuIl10hQ5qDGZv
 SqaGFjQhFiQFJnIRPFRzwKTYXk/Z084lUgSIidWe6wN1Z3s0PsTalYCtiasvYwcfbqYciQvys3T
 zexK6XYZOEvpyIVIpQk3qqDgi1vHhzmWd+GxkoUfF+lKR+sUYRXcs5vCc2w/+qFYD1wd4ukBS1N
 EEFPFoxL8srqVlpRnBg==
X-Proofpoint-GUID: Nq5SgvVwXmRnO9ON8PHQlWfkvdcZZFXL
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae65024 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=LlY1mk_YLf5cAL8JajkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:04PM +0800, Qianhui Xu wrote:
> Take the bonded master link id from the per-SoC config instead of
> deriving it from probe order: the master is a property of the SoC's
> DSI generation, not of which host happens to probe first. Behaviour

IDs are not assigned by the probe order. Master is also assigned via the
DT.

> is unchanged: on sm8750 the cfg entry resolves to the same master the
> hardcoded value named.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 ++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 49 ++++++++++++++++++++-------
>  3 files changed, 48 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry
