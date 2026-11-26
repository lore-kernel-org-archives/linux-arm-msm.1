Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702982;
	b=C3yCeJSLKpKgH7VoTGLCvz0RNfxKnlACvKhjT3FoagOpDc+MVl3STJcxdh37povnjeFp
	 D7cXfA+Xam7jMN5TO7ayc1nrSzAClgIltQX/X193G+Vcccp2zNqd9nwHPyJx3pqUJs6ft
	 52niGsEbQvnXNEqhF2IzETVILXfsJUJmeuhX0Oi4dkWM1IU+t6OxFn0qbXSNf3oUwpfyC
	 XBvzEOUWAecyV2OGWTystMLS4QzbcfaLzg9Yc5xWMolh0It1+SqpzbGTPK3AXk4I9XCmn
	 DtMsSEOd7yE1uuSTRMXrDjehBu51F67YxHSXdOb+tNj52QonI3MULJVFn7cRHsbSmOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
	b=Dv+OXTH7mTfpIsM6k4ETK2NNsfbxnYzmyK+6XWrKTb5TING58a2wEbyA1e2mo5pUfKgQ
	 Izv7e9NXsHZdvwAhI/5t7V+nvvfeIN0MNdZ2unk8eZO0mnKatf0sN9V/rSQCgQPOxYOxh
	 XONGAsLAaaNWQ2NVK1wvt+i9sXJ+CjDAK+dpuMkNvoKO9+YViqiN4/MRwdv2U804sTXK1
	 cqgTltKFOIFDjkUMWcU1J25BjRArUc4ZqcUeurPMTEAZwTavBjZcVr837BvKA7IgNl++V
	 wqXPGw1PyOTGgQFUrLwFyKMaArzJ1sqXmxUbReb00Rjre7JQ1nIKNzML5germ6L5sCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDk3D2yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhvQnrYk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F5606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610F5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDk3D2yf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhvQnrYk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRvs1497053
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=; b=oDk3D2yfb5PYVxpM
	nJFid7gT7XrHliooiSDwTKNXKJGaf8DNzGNmJhsLwRLJQtjji3Pyb+9RRvgg0rTx
	83j61SEjWZZd+EG9TE6FAWwDNACQjG4UXYxPTfC8zDG1DBY8csl7j1zrhKWG7rrx
	8WFPgnIXp+9Y79urnktTk4gH8m+KVxzZLwMTw47PKN/ZH7D2IIh2KB6ORacmsqs6
	BBhMWCIuWvuIe2fd08PPrUFNWdjby7hxqXSQOwmNbMw5CRDFLqyiRUpQ30+vWhgH
	mzR5Ja0GSJdFM2EFhQ1jxy5U1WxDqEl58Tu0A4qUvm1bUqEocYcSrZADAJrkwcck
	fYOKLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3drm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:23:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92137a5944fso9455386d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702981; x=1796307781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
        b=KhvQnrYk2VpWLJGulTeSLTzvCh6VTVOor2y0yMe53Kawx7HQDpU5Op0IUOJkQ1Q/r7
         AvXdg3KEGR+OUyInlguHwwE63wNpxLzM+qbexYsoOvMe+EfzuhpXwHkYUvEcMcwdM2nL
         iN8nDPlEddZxxi7IR7qIllqCHbNxrOV68UkoeF8rXFjsZiIN1jVYo+/bwX1QIgHB31lg
         +RCqXupYEosdg7aIvdaSQEof2IyNzxRr3ydfUxyBHlNTk3uZin+w68Xj614vq4iSONQo
         ew+628dQ2dNEqeoCNnmIP+cfBgkorXd4hx4aRpFZGV+vpI9ZaUthFf0Miw5P/8QZ9a5V
         xKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702981; x=1796307781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
        b=VjeGgxcRIgZ61GBjpvEoHJGxwJRrHHifsZqmjPvijbe6na1KB4dX+F3gjMLLoPYoL5
         FD+WNGUQaDeuVoDT6zqZhaAgEaDtPGWI+TNvdv0UVZ2Uhonly6oOnXfqp4K1xGfL6Csb
         2O4TVYbMtBQ19G68lpwXy9JpBJP7FODXIr7N20OUEvitqLbWWBLd6+7E5Ch62fjXzZKz
         IKF4Vvl4dBIMswlriyWIg9KRrojKwmgAUl40cE3ftNmSydTabCFCX2KqUaFAbC6KzJ/r
         ljx3SrY2yZdgFcBZR77yZ43BHqfiz/x2oAmYZxcUY+1YxxK/7qsA5nnuCcuWjHpNgj89
         RMvg==
X-Gm-Message-State: APuU4Z82eqPeplBNxixB/TMEvGWHpLq0b2Yo0mb8Z7fqEk0zQbi3TXQe
	HrgNXGbMnn0k2l0qK10IUpIufX/E0NtRJaRnVgxiFI5c+O66SGXJeiOERzIVmtYcv3F6CBczKA5
	XaZrKHcpyOYCLmcTdpdF0BdzlNEJcHG83pNmTSQgvSQ07v+/Z64Sj0Qq56NuUbHFqyp20
X-Gm-Gg: AZFdTZeoP5UyibjLE+ERucY7xLnobPRS1aXfLVilT+OlUTfR3l5MXRWgBLnU3lHxakj
	8O9+qlGAZH2DwYoLF7QEnQn+3/+rmXSRg0nJezSRSnEE2dFqOXF1uSK8IBgOjcqrxp0OVzG7t0W
	VVzO3yeYMjat0UhfQr8KnHZ6ltumIH90xUyVtxAy8OxDceX5jlbiqF3fTFF3Yf/LCmy5/HMwqCK
	zP0rWj02tqi+AkOEOahCZe5L5JyLvkrJDnLXjiJeld3UBMCd5K7sMbv379NOKW4S7NdIv835Hx1
	bjApMYlEgUW1uYRBGP4GQ1gsGU0kfWiWpPn/D4jUaMrXIPdkLKI3faC2T4uaT3wiFt/Kakb8R+F
	mWv35AXF6iahymN43H8URLLxu6T62qaNWzbtdcvSGy8o5BaS+pi4yM9lNXUw4V1EEDTBBYns=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3561489985a.1.1795702980572;
        Thu, 26 Nov 2026 06:23:00 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3561486985a.1.1795702980158;
        Thu, 26 Nov 2026 06:23:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9816240a12.31.2026.11.26.06.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:22:59 -0800 (PST)
Message-ID: <2af8f98b-56e1-4cf3-afff-37a59586a68b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:22:57 +0100
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
Subject: Re: [PATCH] mmc: sdhci-msm: Disable clocks when runtime resume fails
To: shyckless@gmail.com, ulfh@kernel.org, adrian.hunter@intel.com
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX+/d7K/hNQEzk
 bzzfMBGxNBxnH+zeANNuN2V+6pkVlrjxuqoD0kEy1cjA4J+DHOn6ctv4+GM/fBioc+bn3imhVit
 ny8KOYoptLfN/NjICfsjfljAWCFGBZONPFqqSvPggACOKiHXE+ZisvsQ3Phx2K+oo4SvSiAXBku
 KtDha6u0s0ogUqS9iVYyf1XPaoEt5SDUQjDuMv8LH4xlp4rhtxHIosy371H/O0hkrSaEZWYAhbU
 tdZcWyJ5UtRdF0kDMg+kBZn0C+zLjz8h9IjqCqxV/q9nP/cAp/MUImtAJbCY5vZaDU3frHw9V9q
 mjMfT7zjIthOOU7ZshcrHpaS1fuZvFaVRbzb12aqFJoFFm468h+Dr9EntWs0IbwBWVwynEp9Z8/
 f4mYoCpNCmH59e7faLnX7A5D225rR03At8QKFMaCl8W79q4ZS6Wlry+vUauB3EIHqF/jHOcrMCj
 qV7nFq7o8JvViRNjcAA==
X-Proofpoint-GUID: kY-5ino-lOTI2mAiExpYJVvqga-6o1z5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXym0/xkw0KAQr
 IvsLkC4o/BEKbx3dXZcz2DJBBGNjmIU/Qae0a0FgoEqLUoKywZfvzK84yJNwYL156k/XhlCKbwR
 PRC0dBwt5lQx0gnHFrH2HdhQFjFF4Cw=
X-Proofpoint-ORIG-GUID: kY-5ino-lOTI2mAiExpYJVvqga-6o1z5
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0840c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=PR8Mj0BxCgJnN8q3-T0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/24/26 5:31 AM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> sdhci_msm_runtime_resume() enables the bulk clocks first. If restoring
> the SDR DLL config or resuming the ICE fails after the clocks have been
> enabled, the callback returns the error without undoing the clock
> enable. On the ICE error path the OPP performance vote also stays in
> place.
> 
> The PM core then keeps the device in the suspended state, so
> sdhci_msm_runtime_suspend() does not run and nothing drops the vote or
> disables the clocks.
> 
> Undo these steps on the error paths, in the same order that
> sdhci_msm_runtime_suspend() uses.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 21f1e2d457ce ("mmc: sdhci-msm: Re-initialize DLL if MCLK is gated dynamically")
> Fixes: c93767cf64eb ("mmc: sdhci-msm: add Inline Crypto Engine support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on arm64 (W=1). I don't have the hardware.
> ---
>  drivers/mmc/host/sdhci-msm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 32b1bcba47d6..39db20ce5bb7 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2978,20 +2978,27 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>  	if (msm_host->restore_dll_config && msm_host->clk_rate) {
>  		ret = sdhci_msm_restore_sdr_dll_config(host);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clks;
>  	}
>  
>  	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
>  
>  	ret = sdhci_msm_ice_resume(msm_host);
>  	if (ret)
> -		return ret;
> +		goto err_drop_vote;
>  
>  	spin_lock_irqsave(&host->lock, flags);
>  	host->runtime_suspended = false;
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
>  	return ret;
> +
> +err_drop_vote:
> +	dev_pm_opp_set_rate(dev, 0);

This is not right, it doesn't do anything with the clock and
introduces another point in time where the clock is running with
the power pulled from under its feet. Instead, we should kill the
clock first and then do dev_pm_opp_set_opp(dev, NULL); (notice
it's a different function)

Konrad
