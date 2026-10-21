Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604574;
	b=pi2obZbUTr9U/64gq/bEGdGp8xqlSPd8NaQDyCpQsDW0LAvhxmt3cL8oOD5BJNNIhDjg
	 kcvzVcG76YNZF+a0Ns6OI/YjZaM4h5cjPySBmvIlxmpUUOZ/a2nZJgTIwfI1lV+HSrwZB
	 xVk4CT/iY6ZG9sO2sYQmWSevY5NVUSKKlti5BVqHHa/ujfOAuNyyIj4GMSc6Q4Sw3qEWv
	 XQDjPMcE9QwBBUpHOHCv79xLPl6rFydUhGehI3799Kc/dGkX53K46jVoZw8oXGzocrXZ0
	 XVBGStjr6rZyD+J4CBvYfzIR5NmPYxGdKsI5/HpY1aOOwizKIGWtbYtuSGfVoAjZZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
	b=qVcGor243sQrz7h1Y1K0q1nmsIKR0dJXQzVHHMHe1IbAd4eEr16l9ZuV9r2FQEAzv+5r
	 iBklj+OAJFgg1JPnQaGUfhl/4RisYhOMr2tMR/5FrOZWb4s8nOIH45M8HKdK1NEkyK02P
	 zAEPAXJ8cMs6ZQI8MJSasOyOXfYrf1vkvJ5Fw99iG+M+3S7vh2sdKPNs0OPArCEDqqTVX
	 gt3b45woEfOEsEaAcIjJ4GLw+P8Dy0d2txHSW1fvwg7p4/6AonT7GjxrLdLVgz6euaTPT
	 ew/dIYazVP72T4wtvyFSpW79VHv6R8SJle7u1iIRuO8Ep7ql76r2ZmoBmRtD3BqaZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5UJc61l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NW+OdVzU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208DF606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5UJc61l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NW+OdVzU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTpHD141155
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J6uuKNtXeb4uetwD4PZfD6Mt
	JhK9RufAjFZJblRiWyQ=; b=b5UJc61lKCk10wRlwwdluLhM8Oh0cHeTXdtRbdLw
	de5nxnODD42+dQF+Npftyjw2cbnPLTVyDsg7LVJ0Jw6V/mXEzm3UiTLnfgSu80mb
	i4yR57yXplDSr3fsm+VRFL6DsXDodLxYNIpQhHGgA4w2XT3cWH74iG4tQtke32rD
	Xl4zXJ/BJWLdxqM2iOQLUNlkhHHRMDvY/7WDZJnOL5RRMLsV08v5/zQJi75TXgFC
	1/tapy//63912OrCpVEYL08LMFAA5FsJjnfCXwtYuX9uWZjze5j3Jl92Mv4qwIOK
	S7OspoUnFSdLOgAnXKZPmMOC0AlPx91HLrx0DgxglQlyEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58983s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so224253385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604572; x=1793209372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
        b=NW+OdVzUEUQEv/RcIJERWMhfZNFKRj9kZ9lQHNRnTNYaHcBvgKm4y75lH07/TJxCyB
         aJrp60lp3i2TuBWjJbTb7+ap84CajzpTcGdx8uzJLG69iI2GVwZLLUh4YDDKsheVkJza
         bUWYNebMvp/vXr5fQWoPxAmwgVHiYcpFzSD/7B8CrU1Ttm6Tmy9SLCF2wl3SI27kPrkS
         pLqR2eyXdaMdbaQF6RTPw03SxByMc7dDDWmRFXfJiJP5n7cf4t5aQTxMIqrEqFateibl
         UkHLrHo3+hZcdlKO6te5f1gEIglJJhLVV5eprPLclE8AeWYbDIkhDR33qhi5UMszbBKA
         bMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604572; x=1793209372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
        b=ki0rgy4GXGN0dwdqDX4vwPceJRX029TfAgaoEPBtNFLUTmKJq6gO5/lNzFLWPTWh5X
         Oq+ITwPkNB5WUF0k1/d0uOgm9j8rpbx0S58F6BICeF/PWv+U2y7al+E+BU/Sd1RMERoT
         0Z8CPzMDljhFmO1J/GneInseJ4EFSpTHwxTPfWkFJGVdlhP/XsK/61w3+oYh867jC9mj
         njHNq/L8kvIeXX/5RbxJ6FrlaLD8fmwavQ3BeVxh9cxTokkc5YIL/9/nnXYO9PzlwuqP
         m4vrozpj3jQgBpgq7Qxnd1vAfnCHy0LOFXc3zBlduJLmKcelppBVor0bHr8Iu7U3MlDw
         mwmg==
X-Forwarded-Encrypted: i=1; AKwUvBymIqkO4DQAzGzaedNclMezI9ZZjJP2BXVP6VApnMAT4N+gjU7815Ei4iY0qzi6HNgwZvE6U2wpFUCDLG1B@vger.kernel.org
X-Gm-Message-State: AFq9FYKEf/PJ1gjATd+fkHlF4fw3pq3c8aG/AGTcvN4CIZSxWvPMxnCa
	4OhD0mQ+lfNp87s6Tx+9kmNWQT1d4L2OuaL2zQQkFGA0cpmlceCkJVrq2m5FdIUDniErZfUkCbn
	7iIUGibfDOQdXyDIhg1sWrJPEgWiEJr1XvT3cAbKdO7gijZZOi+fwshhQb+W5tAaSt4Mn
X-Gm-Gg: AYBFou1hqqdW+D+eL00fk1SdM6g6FcKIo2uAgfpHOy5AMtpEyeEshaRSARHs8uwwj17
	j4P3uyLFi3kFx8ynFGT4XxRzZhDhGu4YHWjoRSG6RVb0FNdg8fyx8a9lSpE/n9NxEbyuepCL7Gj
	TXbhAxBJuUolTz+UY5cbecJdTMi2IS2I7zq9/GiYHMLsQI8OYkZWIlq9hO+USNQblLrR0snUd32
	BsA3h/wLRYDqaQ30OhvcStnCTOJZmGFEOzcxHbtUvBrqtK1CfActP80/Nec91l8/jwF3ncckfIO
	zEKTYudQ+siMQ9d1iqMwX5TGQY7iEfdZ8gsJdlj0/dOE+DCscWpvgSNF2URGY9enPq2rSuyFFiF
	D4FWWBD9/dICTvaTuOmzBcYG+xOyztlXM3475zILEeQUL7twSCDi5B+lskbzs1QGn4yIm5i89j5
	bP2bCUtpAWdZK4
X-Received: by 2002:a05:620a:690d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93f57f5ec48mr547613285a.59.1792604572221;
        Wed, 21 Oct 2026 10:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93f57f5ec48mr547607985a.59.1792604571628;
        Wed, 21 Oct 2026 10:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df0c9sm1729191fa.4.2026.10.21.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:42:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:42:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Use the downstream GPU idle timeout
 on A508, A509 and A512
Message-ID: <s5qnjxh7sj4rtzwg46oeeukeg3exjxjxnlp53c7ldyi7edpau2@sf6wt5xdw2q5>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-3-457aafbb28da@gmail.com>
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
In-Reply-To: <20261019-a5xx-gpu-pm-v2-3-457aafbb28da@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX6BzBCMs0pGur
 XkFaijW8eztpJwOJxtz1mZYHrp+Yf7LHDadGc5a8mcEihF4ELmo1xsXV2WKU9/oKJpXzAIgFDTL
 02VcdcThc9a7Y/03Qnk3QQrc5ef7ckA=
X-Proofpoint-GUID: p2TwGo0BXvzAKNTg3-ZsrEaJv8_3L8Dq
X-Proofpoint-ORIG-GUID: p2TwGo0BXvzAKNTg3-ZsrEaJv8_3L8Dq
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8f99d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ajoyPTHG4wiO7EjX:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VJCrZHs55krGogs9KgYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX9W4RuZ7Cxjik
 XZGKGi9eliloadsfg/MOmtFzOjMFKXTL31DiwdahOciAFfcIS0hbItVJD0JnXju2fC4sqIPgkgN
 K5rj+vkgEJ053BM0sWXdBcvDtoN2TR+oLxRhDbohIdxuR8LQssiMVZl9mSOdgZXzu7qXTg30SKG
 NQu5WzAkxU3WhtfA9oDoko82esKUHIIxfOSn+sLnAIwNTPk0UpU/WJoes8mIB9OoYE6+65vb4N2
 pjhVW9+Esn6x/2jL8R+aJpL5pjCXeOsfPX4LxZMhCEIwyqDf9KB8eU3UPxtbnQOrDWxk+HYm/ii
 pi8Gng3ujRL10SSgbj7YnwiFvQimYnCm+IjBVfZ9EAQ3groeUw8DadhtPHGjdDxRmmPfgAFMZWi
 EqYg3Ji2HmVjxmSzUeKNCV8290XnpmYCMC/vuoPC18KICrNETIWaSyp+HTXY4tQglKcUGsP4c0i
 7YH5zRslSC2UKG1KrcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Mon, Oct 19, 2026 at 11:05:10PM -0300, Fabricio Akio wrote:
> The A508, A509 and A512 took the 250 ms runtime-PM autosuspend delay
> of the A530, raised there because quickly cycling that GPU's power
> hung the system. Qualcomm's downstream driver powers these GPUs down
> after 80 ms idle, qcom,idle-timeout, on SDM630, SDM636 and SDM660
> alike.
> 
> Use 80 ms for these three, so the GPU powers down, and releases its
> CPU latency request, sooner after its last work.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> The value is downstream's idle timeout for these SoCs:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L71
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L73
> SDM636 includes sdm660.dtsi:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm636.dtsi#L13
> Downstream reads it at probe, restarts the idle timer when the last
> work completes, and slumbers the GPU when it fires, dropping its CPU
> latency request:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno.c#L901
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2981
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2467
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2753
> 
> Tested on an A508 with the previous patch: 1381 GPU power cycles at
> gaps from 50 ms to 3 s without a fault. The A509 and A512 values are
> downstream's for SDM636 and SDM660; tested on an A508 only.
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
