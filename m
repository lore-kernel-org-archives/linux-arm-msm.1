Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168510;
	b=sTy9SbciSwtp3FfuO4D1NzKxb71U51N1oiq79C4dQYKQmkHwtw91wO8euUBlXdLykPMP
	 XTPDTCqucYQuMFrHIM1V5ukW2jmKRRBCe84w2q4TvWUSe6aOS55meQpubD9SEzoDVizTf
	 1G+DUfbfng33nDZ8dLZ23+EmAgnDpYroOc0y5XBzIgeOlMvORssFAoOnF7KJZtE/4IWAs
	 ztpC6Mc8YgYhuZAwzqWxCW5WYDxMamfy04KEmjIFJODenpKKDrXxfx8uj2VJJI3li1yId
	 W6Lnnk2/jnQzLPg0VmlWZ3VBlNHtDXbBL/WTyYxYy1tQLaiqiQ3/7YA7f3NP7AMGFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
	b=uNIIe2QU0mUNBjSiOBbJflMMwlT6CXd2e8Xe8qQfGGkLxuJaLm0qGad37aAz9sOBJ3q1
	 cqpPIQJ962Sw8OjV++JIQY1Rro0k5MZbBeufRynOdE4YxmNqHRDTe+Kz/D9jvK/Lm1FB1
	 25H46C+9M4jv6QqUsrDF934+uUzSFqFkgEsy9BctJ0vXn/UIPZDYgBzmqQC3U+qKsAJ+z
	 mZJ9djevJO0xuUhn3HI/QDvqyN798t4PWuyD7alJvantBv/s7KPg0lHArXJV09IwalFlJ
	 pHSGgiKzbr+JmuC4SrP494h473fuMyLSz3DbAMRNDaMaYXtzkjgidJsZ5zTqnDv3rMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D334606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D334606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S6A6lO326240
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sG9Xj1OZVI1nTkH7YcZt+Jc0
	eaj5QNvufoqH8/wgxTY=; b=RGRCJdyqidppeH5y1UWkTK7cqkfH7Ky9Hx/ccd47
	Lnnk/+X89OuXV4QsYlpHNhta9YMeZRyqHzxhYfDOe4sdVNVIKHogj/BD0IBKu49D
	gYK+9K6xQegHz7NBVAQB6Ne4nMd87z/smpPRZ6sr5MASz0pSJY1OUwh03urjLeWX
	LFJOmSc9x31D47tRusH6y392NtJ76nj9OJ0TDd5HRvm0Zi6+fCWZqDOY5keXmQUV
	BoGfUbaS0lUsIGwKKljqKXPwjmQLjAc10Is5OLCjsy7Pe44cjzBwSDMbwLy42s2Q
	qI9/AgiV1vRoWorSAwP6neZNRLg+Jscrta8Rm7PZu+oQfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw815y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:21:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so499693eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168509; x=1793773309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=ZE2ux5mK8+z5PYn1nhZBhysEmOjrRE06QDGHFZpR4RzKxHFkjMifS9C4TWvcwwBoOC
         vTHgUEwaEKtJGhE2KrLJ7bD8Mn1gguddB5yNST+4l4XHIObcVVg8sR8LRHwAoQxGrXe2
         YOf/utWNelE0iWIMLJwHVD85+7r7KuW2sD5l9CB3xU+C5Is9ERxkK5/iYrHk/DDtBAzG
         xo0TVXopvi7hLtS5EuGgIos5nE2kE2QpP9K77MP9XZA7FdCbKjgPYmQZ3+7Z6zJ4P4e1
         v/lL0dRLNVSG/RqMue9I1IjilL0a4dVNdSvtfMPN1z6G3BzurHLRp5z/jMV55MkwvwHE
         fvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168509; x=1793773309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=jSUUqDusNvkpTzABK5oKUULKZ9PBsRwKgeL4AM7iUXR3FucMBtK3EdZ5Rw7YS3+hkH
         vE+2a9kZti7kebY69HNf78prjE6kK+HDtaRwbS0EQpTriZAFBHI5gEKP2dc/tHa9Laly
         nuLmLY4rDBHnWZa4opo0gqUwc7bvZzyOLRegj1UiQux8rMpCiZQqqE99f7pAoRpKwVXo
         AW++rZzzBafH/91nkk2ylensqGmYHXpG8stTZgtm7pu4GiG4fjLbg8l6JyDDMpgyUQcE
         y0BhA/47JKvyLxFeSKh6IEsHO8vsCh/GZSIz09dylLrOPXK2dS1BAQxXtxQhOy0XZ+47
         oNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhchXAApLSnCGx+2n31/EkKHZC83Vyk7QVxzWYfkPPJ4CtSOyDbgxd7t/spa+aLTCICqLd7ePJMYlCTK38@vger.kernel.org
X-Gm-Message-State: AFq9FYL3/wcU9qyQt5rlon8ujGKc2QFyrLz+Ewrw07ymBJehhTLPu4YY
	agZ/X3vhItbrAHz/Z7rtwiazJL31NqOPaO106iDaeAXD5okm21T1sGmRP4sWfyTi7XTN/SRXzqj
	nXYleHp18aG/tt48jGKf1v6U/U4pHXOs+s9GRszLGAZuXN6fP9ef9dHu1me2MxNZHsfcZ
X-Gm-Gg: AYBFou0CEvXWpDjcJN16LEjdZumjTNRoam+iBrg/huHvtOrQ7aWJeh3g/N2yGl75WcP
	WvOWxFpuyNTqPe8WUN0Q3q9376OKAyyejIfuVfjKV+4x6H75fuDDYHMTUwwrH5KBlwUA9oumddy
	kgqAjrTNJXmAiTjFS9fo9JBkyJ/WSm8uZ+0Oc7CIX9GA4+49IAgrApoyAvbppHTHLtZy4QASsKR
	2K2CG9wZM3tNpUV9Y+Vu3NQJRG71H25WHiU2w83SJUL1JEeON1JMED2APud7rm+9uZQLEKTFlNz
	1y2VoTGzigortXq9WPozDCMOINNuVyUiKZ1ZP5bHfWoN6sSdBuqISUbJS2PtJIqr1WoZWRqCm99
	NMSKM1qSc52sIT6taSo58qc9wrF4Y7jObmd34lsW7iNKLEc57YXZamJbTEHIKvlbsf1+oO4DRfA
	j9emqgrg==
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161089eec.35.1793168508970;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161055eec.35.1793168508453;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm3397103eec.0.2026.10.27.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:21:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:51:40 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
Message-ID: <auGUdP/IZnAEui89@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
 <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
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
In-Reply-To: <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
X-Proofpoint-GUID: D81_c-3ZiMvUlBKzzWAmsyAlyaN62fXb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfXzfbTG/NBVfyy
 I8PLm3GDFPuFMBPOtBUfMNBbY5oXXMm2yYe7pWBML+tTM4OIesF+xh7ayyrKQoh5WHCJGf5eQC3
 Gt7oJyO02TXajnRTNlBSHtV6kbyilkw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1947d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=eYwbJGcMLBrUiUMk08gA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: D81_c-3ZiMvUlBKzzWAmsyAlyaN62fXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfX6pr7AbX43kPt
 J21XSzo6JoTNZd6wS6JwY08VY+QxhklLkxuWuXA7DLuDQUyII/E4wU219utCqsfuSjcnxQXPhik
 ISDUbsJ8VgYY9lJWlpkxXwgMpS0SO3mlsxRc1p4/tyRFE6mz2LZhWWDRonFGV8xhSJZiUEKc0c7
 fb8/al9xRaQWxZ05DjYkj6v2AInBnRIA5qDjVSoVRKCj+tsy6oNBSfcuNu9DtjutUzeaRekNRiU
 /6/cqgzpNXx5hZ8ochRqhZ4sprX8SXqApTvBdUf6ISE7BBRGiO/cfS+ij3SPTA2uQ0a0hzkLLvS
 LLDVm53nOND2ZHP6zWB/UVG59fx9pVJhjAHh1lz3qK12n/n85NUmRbo1KK5JB5OcG/eooXHxMGL
 eV7A3FGB9R+vTRXny/09qKDoJidmIBrvoYzPJTT7TZha7vt03KwltQWe5KErN9YSEF81Zmpuy1o
 VAzf4z0juSSOkggd2oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280025

On Thu, Oct 22, 2026 at 12:48:05PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 17:17, Anand Tiwari wrote:
> > Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
> > available, used by the Talos Lyra EVK LVDS panel overlay backlight.
> 
> We do not have Talos vendor, you sure you did not miss dependencies?
> 
> Best regards,
> Krzysztof

Qualcomm is the vendor. I'll update the commit message in the next 
revision.
