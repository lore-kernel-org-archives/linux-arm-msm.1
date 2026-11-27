Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755598;
	b=lDrMmxzqb1uD9AcC7O5h6d2enbrblEtUW/j2SlEM6XPM3+vCPkyIE0XssZgXiSfLfZV0
	 z42S/IQDz9x6k91erGTZP/O2LQqASXGqLgsRqnn/7aL3YVQbzcikJWdxHwix1U05DnXdF
	 rJufjGVZcQ4+C/YHj0q5gics/2JO4MozIBf8DJAxTDT7QaRgnc/CxWJH0XcFMvXM5dilQ
	 tS0fQ163NzXQfoGjF67pocggf6DC+dZvD0ISpTPeNPeRICqFBvSaXv+7AHTrNd30F+Md6
	 ZoW2S4dXEIdkJN2AAKCYAzcPjjNAZ8CfPE4wg1fQpTTF/IzqjBY/7mwOxoDyvcOnLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8nTARFLuF8rWdXWqUL0nOdf631KIqF6Aph8p2q65SnQ=;
	b=f5SrJFBmhAcL7LR5nwyEosBvp8mQgKl5zp/z6JSBHT2c/rq4oMu0himJeUYp3SLd0c1r
	 SNjc39fPjp4v9+3lJP12WRmRvM1sKU/q/fFQy48X+i88WcIBaBpFLYNZb9FwkUBb+B3s4
	 vSwX7vOJceOfvCVuzB4EHY8sW8qmN8GvXaQjKJm++7mJdw9QNnwq+ILjKwQ5jNiOUAbmt
	 eP3C9XS2BhUu8OL/2ObDNqc58Vfz6r0G5N0aH6ZKrVgw1ZXX5W10hSyi0URLQVmFxxR5W
	 jFjuYTblKWgCFc0S+VIBwJbh4emBTn4kxoPqO6ABtXR/fivIVnD3/u8XRHf4Y6fHncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DsGhTixg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAPvYzNp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B182606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B182606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DsGhTixg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAPvYzNp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw73T781859
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8nTARFLuF8rWdXWqUL0nOdf6
	31KIqF6Aph8p2q65SnQ=; b=DsGhTixgqrEWYjXjL+rE/8VtI9KguUuR9Lp8ntv8
	QjsfHIWfQIgl7TlTwGcJwUoX71pSnrlQwlwqZohaMEFcT1zXipTCrKVeZ6Uup2N0
	IEJXztbEr4FG2Niao8AVLIohrvPLY94FZ7Yt4Ke/fIf21Dg6+QWGQYtonyLmLK9k
	H6ZuXXVV+V2FRB2x1lE52Y3euFJpB4VP25Cg42c67DFla1mu9/bwnMcOlekNm4zu
	y2F1UYdqDpwLjd+aO3mjecFFbxTwgoWH8mmpagbCfBSyoWtkLxvavbvcmwrFrHeR
	HwoaqB7y8NthaNcVnnBRa2xjqj2AioUCTqB7pHff6icE6w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm83bjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:59:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so6465333eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795755595; x=1796360395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8nTARFLuF8rWdXWqUL0nOdf631KIqF6Aph8p2q65SnQ=;
        b=bAPvYzNppK38dDYGxIP6bmMJuj+MZDHXSi4C2wxX+IoTGMWDi4zXHI59dgjZOomlRV
         FKpGDcaJmKyN2HtxqbrlfpV5+nPvg1vti4Tma5MvoW+o67+8jwH19WKZVhDgWxHEeqwE
         fsi1H16njs5D1NUgICofmgg9OmtTJt0q384OSqOeMsHsGcVAAW1XBqqs2Ar8U+ss9v4u
         CH43heW5jNKCwzoMVkkmS2vUsyT2QwNhHvEhH1N1ca+IsJ+lQ+rGvJm0U3MplJoKavA9
         NQKzghwXq4mztF3E5ViXO2Bv+AcwmfogBFIcJ1aAMeuGCCP0mQKceOYCxcKkjPcUcfyP
         0pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755595; x=1796360395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nTARFLuF8rWdXWqUL0nOdf631KIqF6Aph8p2q65SnQ=;
        b=BKhHW6Ff5LJMv+h1hTHdjUCPIb0UK2PTo5r5+qmrXuXT/kdaEYoO7X8U4s4WtuToGr
         RT6NwZXWOg1HEOL+EEhON/jZvx4YQp2aS+UdD+lE91NXCetRs4z3oWz7IHO94JxhbM4R
         zR3+gyx229MFpAC/+wdBDF9SDNhC88QKCpNFoxqOpTrGCof63LYF9N/Tj498kzAX7i7z
         LoTsNi40LxsKTsNSi7MUVA2CBC929GOy+W3utweJnGOZw8qXUgefCRj8ofdEo1/aFjaf
         tAVd9cVPLVFVACdqi1ip0+B1ufrGnKaaZnPPOiQbuxVrNXAt4Hohdn6Tjw3kypB/8uZx
         veFQ==
X-Forwarded-Encrypted: i=1; AL+hErENskc4oMQcQvgfPWzZId9CvzY2n2A+DMlguxIQLVbTwPy7Vn0gsoEn8QriLmkLMgWp51u7WHvjIhLozcL5@vger.kernel.org
X-Gm-Message-State: APuU4Z/wfScxHp186xGimja1+NinGehlifnp4SqAV/m8ErrJnJEqRbHH
	hossXe6GcqkPEEX7V5Wf9PnmzH/IFV4a0OYbkJ82tcWLdWv7kMtdygxIg8kGwijYN2pJ+QhmEkb
	mYPqWxJ+YHd9RCT2yDv4+dx4mw1dc/wjDOSzA+6u9rAwIS1jxMUB+Ay/KwZvt68WfjEaO
X-Gm-Gg: AZFdTZdar3ZEH0vRYSTPSd0e+Rm/4pvecwoVCRFgHEnvGnhzzaw4Ekfw6uY+MdgWW+5
	/MVFoiqbL+Ytyp5yH34xhTztNMLI+quq/OwZ5vAjpYn+KwxtIQOkwpH0SkrdjOIV1Tg0GqWqycz
	sUdvCQFDQxl+RH6A3YtYYbEGKXnlec4/OEmnFGRYMGBXl2s3GpYnsPr+AhvqfGv0n68M3187+ZI
	jKA0zlASVEfF18Q3qBeEXChaKHbE5fY/J9eGXFH7wDRHmnsmLKGyfc7TDQzHCwBpidnV4k1vgcD
	kPeRPG7DyP7HwBOw7EsZ1xv9REkNaf9opYaRSK54p1aa9EeJYhlx1qkEPa5RmILaLFSvXEu9opl
	RL+DH83AT3FmbUEr8jJLngFTUyYlx3eTx/iJIuGZ8jgHQwqsWzGoHiAAWP+yF/08PlZBEEZ5OsG
	xEhltYjkj7ig6OKb8+SUOKR5Ecp0n6uJvenuvFI7p7lSafEkpETDpYmlzVCwcWxfBpj4918xA1Q
	zBtmg==
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr25791396eec.29.1795755595292;
        Thu, 26 Nov 2026 20:59:55 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr25791376eec.29.1795755594682;
        Thu, 26 Nov 2026 20:59:54 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm120946895eec.3.2026.11.26.20.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:59:54 -0800 (PST)
Date: Fri, 27 Nov 2026 10:29:48 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Allow minor deviation in clock rate for
 clock map selection
Message-ID: <awkORIPhj/xiG2NA@hu-varada-blr.qualcomm.com>
References: <20261126-i2c-rate-v1-1-6b8c5731077d@oss.qualcomm.com>
 <eeb651bf-a627-4442-b9de-da73f70c0e97@oss.qualcomm.com>
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
In-Reply-To: <eeb651bf-a627-4442-b9de-da73f70c0e97@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 814__1ucw6AR8XkJGFXskwRqpenrHzDO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX08MGdX/Ksu5W
 9Jb7az8oiq25AVfzNX0EMZ3Z30Y/Lwozv6lexwnRuxXYlFMJZzbYhvtuJNGSH71Hm2XmrP84lcu
 o2E0QxgZwmSCmWZdNMx93VgPApDA50s=
X-Proofpoint-GUID: 814__1ucw6AR8XkJGFXskwRqpenrHzDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX70LikS4pbS9Y
 haoJxM7K+ccMG1S0W9utGHhaW9nuN9f7iOjE1Pegye+wbISc/pvELs5ltIjXppYzdn1O909fBch
 f9Xe21b/9mX0RvaRwzAnbFOkfv7iQxDkPLk91y/KVqi/eEkSFmWn7wj4rgnubFVA4JfK/6mhMcp
 zfo/GI29ZJ8kwxm1k/KRawtgnuJCFot318LgItrvAf2B4yF1PF2i8IHNAN1onjAlAIHP3pLzBAY
 6eqCIspnOk5QSZHoXOXdDzycA7WCqlU9alVJUZBfImt8J64k0aeQ6WcFKIvaQXYJNmztvGhiaNl
 xLHJM/KankC0v0R0zamVNaMnSLc7wt8RvuaTFPszAHrJRW89JCT5xBcmco9Jvr8UogqGKfnTuBI
 lSOK5yn604LVW2WGBH2FEgeXEyIrGz7Mxq/JRVjJoytGyYWT4mIB+HW0XUBf6kfkkyuzXc2zumV
 hIdvLU5aWVgQqCO7SHg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b090e4c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5qUGMcpEgxZBPV2CaegA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270019

On Fri, Nov 27, 2026 at 01:12:38AM +0530, Mukesh Savaliya wrote:
>
> On 11/26/2026 2:09 PM, Varadarajan Narayanan wrote:
> > gi2c->se.clk rate is set to a value of 32MHz +/- delta by calc_rate().
> > This results in the clock rate comparison against GENI_SE_CLK_32MHZ to
> > fail, and the requested frequency is assumed as 19.2MHz.
> >
> > To avoid this allow for a +/- delta in the rate comparison.
>
> By How much ?

In my case it was '1' (i.e. 31999999 Hz).

>
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-geni.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index ef48ab3e8b94..88b5b9aa4667 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -207,14 +207,19 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
> >   {
> >   	const struct geni_i2c_clk_fld *itr;
> >   	unsigned long req_freq, res_freq;
> > +	unsigned long rate;
> >   	int ret;
> >   	/*
> >   	 * Use 32 MHz only if already selected, otherwise use 19.2 MHz.
> >   	 * Preferring 32 MHz merely because DFS supports it breaks I2C
> >   	 * transfers on X1E80100 CRD.
> > +	 * The clock's rate may not exactly match 32 MHz. It is slightly off
> > +	 * due to the calculation in mult_frac() in clk-rcg2.c:calc_rate().
> >   	 */
> > -	if (clk_get_rate(gi2c->se.clk) == GENI_SE_CLK_32MHZ) {
> > +	rate = clk_get_rate(gi2c->se.clk);
> > +
> > +	if (abs_diff(rate, GENI_SE_CLK_32MHZ) <= HZ_PER_KHZ) {
> It's like  +/- 1KHZ ? Can it deviate > 1Khz too ?

Not sure. But per LLM, it says for the applicable qcom related clocks
it will not be more than +/- 1. However, the mult_frac() API can return
bigger delta with numbers close to ULLONG_MAX.

Thanks
Varada

> >   		req_freq = GENI_SE_CLK_32MHZ;
> >   		itr = geni_i2c_clk_map_32mhz;
> >   	} else {
> > @@ -222,6 +227,8 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
> >   		itr = geni_i2c_clk_map_19p2mhz;
> >   	}
> > +	dev_dbg(gi2c->se.dev, "rate: %lu req_freq: %lu\n", rate, req_freq);
> > +
> >   	ret = geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
> >   				     &res_freq, true);
> >   	if (ret)
> >
> > ---
> > base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
> > change-id: 20261126-i2c-rate-da11bbe02b6f
> >
> > Best regards,
>
