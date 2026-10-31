Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483100;
	b=DXnjNMjPngS0ZIW2Ni7ybPrWBzwXQnbcqHfmkRhlMIOjZjLG+DGymxaupEyMkxs8RJ6m
	 06M6+YjQBRzR/Vp8r+khYbS7O0e5kbJBhqhxID1WzcQcX0+rJW0hIo82Adlew5wxil5j+
	 zwUlyvoQQXVqt96fHRsxydH0SPUxxRYitqRz+tuod1dCChDTrxOSl33FeLax1yc0Z6+Ga
	 3KOmRc8viM/kWSfCvNTSgRrIGRqlNfNUuAYqXn5K8NPOu59Ou28Hw6sp8TGYC8s/xd9Ya
	 aSDgBBwKStO3J9Pyg9GZsOWpYxl4gCZqw1FWKTWejYCDk9T8Pxf05vLN3goVKZXVpHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
	b=hm4IYcpMvUtlKd3qpwqcAIHUR567kVlPemEfy0BEIlE0K0WesdGGFGojPugBbe5sQjgD
	 VjLzBM06lJSH/nqKQpizCdfKyzO9TJ2Wh0afY231ucO8V6ErYJ/Kf9zuBwd5cEFLG3Yre
	 puqZOonFa4vkIjhHAsvxFWkx7Tl2ZfZIsYpCWiWy5i9IqozNvz3vBVlLUaaLEt+QfZblL
	 G13GXN9mL5Ol7gCMuMOXkavupMoDsQeT+QJrXrYfg6XYHCgay64k/V+imUpej7KsDaVuf
	 Tm2cwSs+D2/hUA6EW1PRqmd1nZvphJoS4w+0Nla1vRnl9XHtszL9XP/KBVXv12OuuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F88606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F88606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF3jO3533119
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yDGBpE8wO71JGfIhhYSREmTT
	DT8BIMcwQoGjF/pa28s=; b=Tqy0g2u8Y/mHPZEmpqKvoI9nEA0bTFPbKTpRDOpo
	cSXiT5tsequCmwJxCOE7xbvLLdGx+iOEyL7B3jURpVBQvAt4BcUO/q6aox/lAPfi
	RNHnN6R9yDreV4fzjOUy7nqhJxaw3fach0IFzS1ZUGsrev8SyuMPQmemBcX3PidB
	d4jvX93H4Y7+c0zbWrekez2g5VQ7Zq4jil++c1Lwpxj1AAWISfjkcrKOh09+7AmE
	8xyZ9eAv4LoqeLFIZNJSKkeuupgYAaxOmb73llTamWZC1pT0jdZ/fhP8Vwt8r3fU
	NvV/WdmnR4hp6ibPfIBTiGMbxBUIit2ZwrcTiRSLAs7Qaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j8ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso299621585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483098; x=1794087898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=kBrnOx8oSeL8mEkRogeeYNnuA95pZ3+ACCMQnVqx9O3Q0w/Wpd1RLfHlyqtR541vP/
         h7BbcxbebDpH54cDftLL3qqHXGrMYOYaDO2c9LnHdN/68PkEUDDlXv4+nAokqIWqklGt
         sknrfXE/Yb/AgkkHOKhO5vEZdqIDy948DQn8YLRsGn1NH48036Mk4GG4NvoTJWwX02Yo
         xgtLHqaRVZpw149y0qshKUVNpHkZ1qUAXw8WBx0n92FVEHSIebF+n35S8FR6gvcfqaT+
         PhTIXbY+bF96BQQZaStOl2n0BAt8Y77vCj8wTBVqDXB40U+QvWuI4AJWsjMWdr48eGml
         UzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483098; x=1794087898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=mW8Ste+x6Ga500fNLsU8lfm4DWJQ+snhPH5/FN4kCq8QMPSKwtm8xGGJX9rHybaYCi
         6h2/Mp6kYtSyTEa9yVOHHRu8/rn5mSheALQZQmJ/fN0E2gWEHTx/C4LI/K19L40dVkkI
         2mqxPYZrjRxSY7M4Coo3y4sjwWz6XrkaMWqu2WPkc8zPo3OjRz6nPdBmujFIyrHjJF1B
         ld2+BxOUr54wSzf6uhWou9wxBAalWMestRX1kZWbucrZTDdmj7nCsKvn3DcMFgqQ6S8f
         i1HgRegWmFUeFy2yjfelzWV2vYWL1F/aVHUPtTCIwg25UTTYlIj2aeuGVlTOa1ruDlVK
         cObw==
X-Forwarded-Encrypted: i=1; AKwUvBytvxN1FxSCRWNKkieY3wr7Ztas6dOXQNk0mKzjG8W2ohlHLoIXWGa+a1PgnkYOgYGhlyIq4YUnYyvoxTN5@vger.kernel.org
X-Gm-Message-State: AFq9FYKpYkXO+0eYA2iLThp3pSe/fRru9iqoFRInIwNWxIIaN0Y76Cvq
	/WiluS1pYrCHf1NTBzUdmyVOpVzMy/7HLhnuUTatrlopkYfiIuyDiJoIsB3oLc4kpo+oFoGy7xn
	sKoexDVtQdp1HvRaJTjYlKpiw3Br/DwsfuZ/ngZRpUHd/z0cWPisPIV8PZ2yaBbydnuqE
X-Gm-Gg: AYBFou1RpXF3MgMBA054HQliO/0S3FNEYgmeunXeARCcjXdzs9E59ZSSjniEzsV3mMi
	ZdQMoYVdxe6nRGgYu98VKwBfue5OAFXKP9SqyTOYR7X7rJNVau7U1K6gVxVrTYUsE1tdwUUCT2O
	EdSsIiCDCyUTFfg2PX2GUjydPovU5vUjIM6OLXUbRKaWT40x1m4PC7pRRG32aFYLKzuSzj+ZL1v
	ZSHPHbE04AiI7SFq4dTgt8+Vv953nVPLNrpGORjRE9nK9/fB0lmHgFT8SI45elQmGDscyJR8wTq
	jNoZuTjbk2RmILLQmtRFG1LPc3ZxB6XCD4yrjHZ4qFIIY0uc52rcCQf5VDbALifroVVFnFLOHte
	yJ9SGJJCvLjUqd7Wtm54lQADK+czvWZR5WbbqgCeeo69DuF/nwxKOHGq3axlS2nZ13rfWHWv2fX
	GBrilPtXpwaUAbWfE8nM1lMYQMRmht3r3RcCzGe7JDJd1TPnz/HsSourgFGHn6cA==
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040524385a.40.1793483098159;
        Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040523285a.40.1793483097768;
        Sat, 31 Oct 2026 14:44:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm757409e87.1.2026.10.31.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:55 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm: mdss: Add SM7250 support
Message-ID: <qshcmax4t526oqoj2udcub6oqtgnkol7fptswvxuftlizy2g2y@2zqtdemmz6a3>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
X-Proofpoint-ORIG-GUID: Ta2bQwuM6MibhyR-3jsxemgowoYw6RdB
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae6615a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=r0WxMInjeZJlmvLLs6sA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ta2bQwuM6MibhyR-3jsxemgowoYw6RdB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX1zYnjyqG5ZkS
 dtQrxqVAEq2JX21blJYssonmPNw0RTvRIgUk00z8i+xOphy/Meu8PJK1zlz+sE5Wwg4ME3WnKS6
 C1d5hCWic7p1puZcbbKgfwYlzLemCSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX89FvYklwlSqy
 hHKWkRpaFmnuj6nkMtISUECihCAqgkxjNwTCAJAbrq5orxGHwBVftiYWNgVoYQgJyNPXRyMjzl5
 GGaGkcdmKh3hwT8FRZ54QNtX8EWjcGdwNLU4r7WsqI+IKzluBOiP1HkjCDOCxADMce/EZWP02En
 jaLMnND8LYLjZCSouuuk250+5C0jTp1lRZrYTCDNb5rewNCFUzaN9+m+oyBLXCusqlozOipty8O
 Hu+S5cLW6syyj87swC8COommhpmOIu4Sm24ScBiNofYA0QMIFaIr9/fGt+RBvp/B0iNESrpUGEF
 YkTrmcmDOinDXLml/M38y6zsEhIhdYfGydjmrtHU+Dyuydp8Guf3ouj3gfo0YXotmJ9nA+F3pWy
 k5d0HuOKnJtbBsy/2i9UbwdaTd/KVJHBJjoi/0zcnOO58hYIYLOdg1GnX1gymqA2cX9ceeHeeOt
 ZZMZAF+3JFH6ScdbD0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:41PM +0530, Ishu Brar wrote:
> Add support for MDSS on SM7250.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
