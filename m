Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C3CEB9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165348; cv=none; b=qi98UpD54dHqPJOMbOTX0Y0ub5cZfuw7Adz2BrCBbw9ys7jHVH5TWfP1aVZnn1WIp/MqreoL1ndD+hy0D3SPXbM32FWLPbrcVetZ6YcAsooblMixNilBXOMTUK5ciKUjK6BQWqvD9ABwpCgc6ROWGH5odlzD1J2V35XCOb9s/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165348; c=relaxed/simple;
	bh=SjZ4EK/3zT1ba/gtDzHBJmT830R1l6042MseZmhzl48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoPi+pOL+9/4WKlFyiLSaIJ+Rz6Q9TQkTrRu2Jg9/leGUVSVPGl5yCT1Eb+RId+UKyqWfp1LvjCIRF9Iec2n8PlxSjX3CszvnvSLQ18ETFL4kaj4eYg4xLJzNjPKmyDfRZ5UQ2y3wKxnRqa8JKs7O8GyM6NQxE3xAHrUYL0gVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjY+A5cw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0pdT9Vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjY+A5cw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0pdT9Vn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xIJI3664612
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tr5LOcwcw4n0UOYNCfknwwxf
	xAS2b6tJnboga2qZv6I=; b=KjY+A5cwr/KsLQODf0A23aG6XA7MLt9pe/5qaiQk
	RTPEajtlDCFe7wRc39uxbOUQggXBYn9IWsGyj4rXykoeE1d6Nb6w+pYHP9+kxlu/
	osOtOkcJNO7xSbQLjq53PKmXgZQ/XKPWAuOU4Nv3zx+aMm4MC74ftBguC125l76D
	IY6SYPY1QixUKCMGttWWYBO4iWbOCn7TjoFxJ5FUsjLEbf8oztawlUanTg1IALai
	YtGnRqf7dDuN6FA4mkFdonSwzhw++Bxq05p93VhmcaBTFrinmPH91x0vvjHMtgFT
	PE4pGhGWJ20QEepUNH+sNHzW3m2oKW3jTu2lGv56aRKQjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x08crq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93915f50a5cso602683585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165338; x=1788770138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=Q0pdT9VnArJ5LvwGaO/WZNCVneadHS0V3Q/MHuFua5Ba8XI+xs6tMfNGj45SdzTPLi
         7kN7VR08dbBTDXvH6fzozuqiPvmOo3S+1V1ApZm6kdF7j2TWORhuYb2Z+42t6AL1o16O
         Q09XKIyWfq1kwwmRxRr9cSpRX6Gs37GM4sUL+f1UxVEU2pjSKezLbVfuGA5zi14Lbwph
         uaPbOWn2POQ9LKZj4TQjGvQEaMUukEMpG6UaooZwM0agDkx3L5bc0z4y8giwWZqh6+ie
         l1+k4AWcZYy2mqCU3n35Tb9k7z7JNm/bO78BugJOaTVR5mgi8q8NEG1JHHyOMjwSVmpb
         gBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165338; x=1788770138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=sTUSxC3K9odnWSQ0ZVi4QjCrglbQ0dzz3l5E/hTFgkK7K72No3t7M+TftVZT9RMKKB
         c2IAxxQx279d7pj1jvsMKrThGBqN5VDC4dN2WzhGJvZiph2N4PuBAbAXabXCLrVli73/
         pD1LQFVS8DOOwDisXWMvHTGx/dZOaz3lL01IWq0I0JoePg/fA12cZy7gK0Wc1Zbz9chz
         joha6Zf5j9/Gutpq9WGrM08BNlGjw997sPOh9u0nC0spp7fvxlKCTBo/FRWEdjGgPjJS
         w4gPe24CUBMylX46X2tjETQ6YzgIiatl+hJQDJNCaAzfVLBTUEtC1Z/p2s4vXIdqKpbE
         4I2g==
X-Forwarded-Encrypted: i=1; AHgh+Rod9czKNeGaxZz/3IJW5+4K6r0p4aQ/m6GYv3hkEJyapGV+ncuB71p9NDe1LnLAnyQZKqcD1uMytUlXtdWq@vger.kernel.org
X-Gm-Message-State: AFuF++nmhnmExQ/12f8VFjpIiBpbD/7AD7v1KoaGvzVbBf/gPzwJUWba
	T381BdXgFwSb3xKXXcJukKVlDvwPFOOTMNBHuZPCS9wjpE5+Otu5aUiul3ttBuyq/njbrzZKcZo
	K6Zj0en3Nh5/kJs8LYh8EfxzV5k/cETPfWfswkon/8UFrInKLU8txce58sm4Jvfe18QQPaXGE3a
	AH
X-Gm-Gg: AR+sD10n4scQ0t7WSdI2Av6KheqHG5ef+G8WG1j8dpzYyKZsrfxfWldsBGf5difmI/G
	/F4L64Lvbu+OFy8YHpxUbR2DO9y7g009StU6dCs3fqmqXPfSbflvvnf8oxUnAC2WzEzKsO2hwBN
	DAxx/5zwLwVaIuzDGK1CmVFkpjiyB1I2pzoackJ0sLKQjUIiLFIvBcH8beGQUAVekOXYspCNTCd
	oqxDJ36D5lGcHAKTtrZuW849MpGhXh0OYr3HhmK31tz8NoYAXXRfcJsEJlGJJWUGiwvF1B4+n9G
	B3x07kNf//W8R0+ZcqUqH10+p5AWx8ODaC1DaTY4sDvARgqT6cmunbwghFpWJ1m9ePUYFbb7WdO
	ZJcSz62P3c39opw==
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200878185a.14.1788165338480;
        Mon, 31 Aug 2026 01:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200875585a.14.1788165337942;
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2005esm21269065f8f.24.2026.08.31.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:35:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
Message-ID: <ys5ikvuohab53qiir22ivycaoxg2crlwf4ujm3w6ghz6auggt7@wdibjny3bevi>
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXwIhIHN2tVUsx
 O7AaG8auZDdaJuphMfN1OeGJ1ARx+0GxYy8IftN+EzEjuOqb99sLADgV7EEU6A04FMa9Qo57BW9
 PHzTL9OGOx940SDnVZ1QA9sBragU6LM=
X-Proofpoint-ORIG-GUID: Fwy6ZCFnHWFa1W7hXsC1bto_FM8z2VKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX1gizqwOjyDJx
 GwYluDGzfeVCoa8WvKhHMOKtIslj5oijZDLPZxbfoVRI5SLMKBHXBrTjehZTHWXqoT5Pm3sQuWj
 A0RYqA1RYiMLc3C5nqu1tF8XFV3MpeSFqPxszICxFfqqws2kP1fNr0VtP6AmZUboCKamZxXeZkd
 tZEx1D6R0a7SSUJYL+gkVLiibEuLp5JRGTCjQhIKon/BRjzsNuG6mFSfmSyLvPGVFKmXOkyyL4i
 TJ7kEQy/1+9Zmx0BkbQfBvcPt0Am+dMB6hLBKhZGCS28llJ1fRmL+VDR9FZyG8BXwU8UP0YUS3b
 XC/y3NNjiIcjl8JvroO2Lw6ZQGlpgZEKEzNjZR40Ln0S9BYpXAW4rEEO3Fgb/MuWYouFHzgQ2Dr
 cwW0+d5VconFQK4PO40T7g6/h9R6fLOMXNf7wVf0laJhU1IuCg04RCfKvjgdRLDMZcFq4HfsV/8
 GZ9kNI/RqOJaL6mq3Og==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a953cdb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1xpzCHDPxV4s1b1w7qUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Fwy6ZCFnHWFa1W7hXsC1bto_FM8z2VKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 18:40:07, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
>    bit 0 = 1 --> DMIC0 enabled
> bits 3:1 = 2 --> DMIC clock divider = /4
> 
> The current dmic-sample-rate of 4800000 corresponds to the default DMIC
> clock divider of /2.
> 
> Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
> the working Windows configuration and resulting in perfect audio.
> 
> While we're at it, remove the reference to dmic23_default, as we only
> have two microphones and don't need to configure the pins for a 3rd/4th
> microphone.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
