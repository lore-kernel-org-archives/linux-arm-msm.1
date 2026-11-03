Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705427;
	b=nAgx84fkFpzloAcpuQsqqmoiv5MmUGkBZidRz5HESrBNlX76mE3jbycEdjOd5kwOM6YG
	 iQla2zlZ5vBVVl504iJQbfWjHmfFPYUiB5jeZMbzZqrkB5yb3kJRkneziVD9oFX3H9gjb
	 ueOb+/UDdFH6wvRT8xKtOyrBY2lRD77bh+fm0f2wO7ECJb81NByoyRsYEkl84jpVOWJlj
	 iPlT26ebevsczr3ye3D9JeLAUF519UqOQbrrllVokPNjm1WODor83HfX9gk9sXzgjTVLp
	 lx2j9DT+CmPvgqKdS/wHnQB5FnbQMr4b/ccSco5rH1b8vwmaG+wwfOYWmKlmBIzsYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
	b=i0z1ECK3jDMZGcu6XA1jUSr0bQN/Et5w4CduvjWOTKPBLw6ktUg1Kzt0HF39lbLrVb0m
	 +LCREbY/LvZfytB1x85zlWJydrelDTjQyt+L6tRUfP4xbguThgLKzCt5ZRmimDWP/z27G
	 2E+PKeBUN0NkJQmJj8+eelQwsVnu+BJ1IqG+z6xO4Vc/yNvUSW75ZINhfdxcGXf8Wjc/H
	 J8GlAjSaQZzNx+Neg8DKfSzyOpZgUXr+YRi7k9B+J3c44uY7l6G36zhISdipRmF5Abf91
	 JCoXJt2UmCozjyhX2emZcFuODB55jOdnEvQPaw9zmGYYsSRukmFyZXVuns9H9Zhal6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtRFm+43;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URhDYdLb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE9606C570
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BE9606C570
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtRFm+43;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URhDYdLb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAUt82201864
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=; b=TtRFm+43mkhdOS7p
	3xzT8ukoiVZFxLgboLbyziImNglLnXKCV04/vNYgNWs1jb6k/1LCbvpoKumIz0oS
	xqkw8Fh90T1FssXYax9/hFM6ZI1QbBxkCugDQYKUUBaac/jFVYj0uR8Oe3/3FRFx
	H9ybX3xm+dykDMebMWwvNSMAIWir5r9Y7ludiWMkAjvTLXCC13WFP8bCu0xwQgVZ
	5SggYrCxIWaDAHWghi4Xn/RrP4Qv+9cRDVYP9mNXnSL+x0sC7H9E5P4jwm1x7drL
	t0ck19WmKdlUmOP36rI2LgL8dc4JCm0rMaVscQ+ijW/PYAuH5790TEEkP9ACcfTI
	mTdfMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3gan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:30:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso24574485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705425; x=1794310225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
        b=URhDYdLbIr18cbGa3b7LNZGYqlFEqXyqVCZNVg4dGuAJo+rNJZ8spqSLfe0LAFH7eC
         LTC+1nCX8KFbLDyBKOWWE+d6py3ggdDZhx1LpMAupfQrqcVQgnl+Z5rdbJCLJRqhE1YU
         verjJLKOeN5pNtTbS/Qnz+k8pjOqfChgcgHI0W6iqGojGzpsZcXugjKHCUsCm/yDoS/Z
         U6kW0zWGnfV0qcU8gqVYVrgXMwA7VLl8Av8Ax3eCjMl1lCNEOmMdTb330dal4dsSBVj7
         AjxbnvEuwJ4Uob2cX7eovMLb9MJnCrqymCzcALzqeRIX8luXPrfA14phRojRKd3PkjWO
         9luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705425; x=1794310225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xq9SJGooGMkxiXASdXOQUDBFa/yXYeiSSIq21wnmgbg=;
        b=DmHlYsXR0q6KlHfvrItxPDJhWzmSumgZ3F5ZGaFwi3HZe+Ftq11YkJOdMp9qlyzYD1
         MVukioP4ktq/cEXzytdJtbwaZXMnd1xq0nc8xbJdZuj7cXWv1dYRHhrlT68rx/2ko14Q
         aGQLTPe733BytS30l6WHH9OLeVsg9SKzHxzhKnxTlMr5GoeJQDfA5hTzXWKzRUZYsjfE
         bVwdG//KJEl7xTldnOnLhFItiK4KptmIWk0H1qy2eijBFmTr3P4aQtIrjwC8kU/mm1gW
         QlUst2M5OrF3/u9KalXDTRIMwrG2CN+pnJApjbIV9dejfWERuFd8/6p3jo2EvaTYC1e4
         Us1A==
X-Forwarded-Encrypted: i=1; AKwUvBwJU5B6srERGBL214/olYgpHLT1YBfDajOOJpksKlf/w5DC9j167k74K3SmeS/BNi+p5xRXBeQD38+J7FEu@vger.kernel.org
X-Gm-Message-State: APuU4Z+hnMF6ROXLsGlQVv49Ssgd92HMa0YbOo6fS1gvSHj0IC4ZLEMk
	MaGuN6+S+rddJJbPrQBxjEoAjePrBuiBFMRh5nk7paLzSRYvr+IiaoM1NeEgrOGOojjcKOSETiT
	SK6p6Sv+VAhgPbb2Q+Yh/ZkAnrZS+fZA9VyeZ/P7u095fCnxTT4gRNjlxZAhtT5ZQyFJL
X-Gm-Gg: AYBFou3JGVlTRJdQxMijQlExolWJzuZ+eh3zzOzBYUiyA8263n6BKKBbJtrIhlGipKF
	fiWnUGm2yhENCW1/Fw2pmkBMmdgLBSi/23GLxSx1hgMFJbBSH8ddgXD2Sf+dkcmPau2CxRs7atN
	Dp/KDjA72xrxb/Nt2nHgiuMMlzQTddGpLIfzxt+jswL0DnW05IsHedGXJSvBWkwUX1amwfxYutl
	p7wvOw9PZ5xc2zdcNBswh7bozzy6TWFiOnnf+Tv4dvFbDh9VSqccxG+peyxJrTmsN83IanXB9R9
	/mdERCn9/B7/WxAi3MJFkN877xJK+2aplmbQLpHpJGUSzQUExv3tuXyFv2jChxUZhKr2VE1ExF2
	AbNQ8cEfdoL8JJT+9UZCM4NVq/0ujiDeDnKxSDHSCQ8PkU7DUP7X2BF6b7mXiViL8r9b5MQ==
X-Received: by 2002:a05:620a:a7c4:20b0:945:c3f1:4008 with SMTP id af79cd13be357-945c3f14cfdmr411364885a.2.1793705424588;
        Tue, 03 Nov 2026 03:30:24 -0800 (PST)
X-Received: by 2002:a05:620a:a7c4:20b0:945:c3f1:4008 with SMTP id af79cd13be357-945c3f14cfdmr411360985a.2.1793705424067;
        Tue, 03 Nov 2026 03:30:24 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefc972sm76300166b.35.2026.11.03.03.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:30:23 -0800 (PST)
Message-ID: <0574f915-51cb-4eb7-9d6b-49ab32aac553@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:30:21 +0100
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
Subject: Re: [PATCH 1/4] drm/msm/a6xx: Restore GBIF CX config for A640 family
To: Val Packett <val@packett.cool>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261103011358.65398-1-val@packett.cool>
 <20261103011358.65398-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103011358.65398-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JO0kY_ht1Bq4gYWc_anLpBqxIKayhsds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX4I5aYDY5gZdC
 26P2tzMO/UzJe4d6Ih3EUch5VkDksFs6QUH8Z1fo5wMKHy7trFpE2b9n+94M+GH44ZpBHIQM/7+
 osSmW/oGhtfJ4l0MqFlDvHt+S76Gs4Snr2pxygzGbX2rIeYNPzY1Od0cb7mTTY5qkWDSuYGJMrs
 xlRywzJfdLcFUC8z3yJzOV0eo/wVH3qem9DE1j+VekcrmhejzXOF5K7wbIUfDkS+sZgoW89rqyB
 A1ula/9cCoMsu7vOEjV8xBSDKXUFC3LrWk4zz80xigxnwTooVB71ANefkIT56p0i1nseFA/TKW3
 a6ZBF6e4SMniYqN52GBzqrCtsmWI/0nv6T1HufSV/YJ0e9ROVlmLpqqMSxHdJKRQLlQsIPDaey7
 r8UVUZGo+pvezCSYbyi5H45wKQGcyXBVbfW3AZhMdhcTUI+6A/bw8nPyxSvkOF+l18+rsobeUEH
 QcOFc+dfr1V6C6juZjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXyXGhpe01vAdv
 P8TX0SK9php62qWwx0ruSRlE/UUFbpsZWuIbcYILsKaFCOGvIMleTYs0dApf40IQhTu10hgT46P
 DHWKzY/OIb6AyxaiPsaIY+c5NxB2iIg=
X-Proofpoint-GUID: JO0kY_ht1Bq4gYWc_anLpBqxIKayhsds
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9c5d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KkZ6ciwvikuB05GOVvoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/3/26 2:13 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Commit 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU
> start") moved the GBIF_QSB_SIDE{0..3} configuration from hw_init() to
> the per-GPU catalog entries. Previously, it was applied to all GPUs of
> the A610, A640, and A650 families as well as A7xx. However, the A640
> family entries (A640 and A680) were not updated with the new gbif_cx
> list, so the configuration is no longer applied on these GPUs.
> 
> On the Surface Pro X (SC8180X, A680), this results in GMU HFI timeouts
> (e.g. for HFI_H2F_MSG_GX_BW_PERF_VOTE) and GPU lockups shortly after
> starting a desktop session.
> 
> Add the missing gbif_cx entries to restore the previous behavior.
> 
> Fixes: 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU start")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
