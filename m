Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5543849F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674015; cv=none; b=j00EHErfxD8BJDGzE9WijGoV2C7cXfPV23L7QI9WxSJGj768YkaznC4P7p7rY2dSlZrT9Wp6YEe/hohi8E/pstwWHnPztSN5Y+4J9+fXiJh+j3GxHop0WUflCbKQk/V5gGSBznmWIKBQ6hHsiaZOofe4PITywluQT/ov9qdlhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674015; c=relaxed/simple;
	bh=UrX+FfK5xngLltgGZozE0HVIhtHDxj8UkG/GgGuN3Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MONvNpzd9KhxafYYPwbge7Wk9GNNLeethl7ewRj2oH8jXu/bw6jCNjqkh9UpgoLD3YTkc2IDOILNws1HKWxTl53/ziXyDMWOdvYxLz97gzwj5Jz+ZXq1B4Si4NA7iPX5g1FTsk9sPAZYFnxcqyNCYkq9sNwxmF173mxoTvHCtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oW3X1PeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpG2Yx3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oW3X1PeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpG2Yx3f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZZNJ3196632
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FBLyKhH6QlZwbtDhRtvyYm8q
	UDIOFADLvRXOHopvWq8=; b=oW3X1PeSxECCkuaTkjTjy44Pj2zcExcyYQmZPbD1
	nJyrbs+USExMnmER8cgHdd4eq/U5g+5iWejlHlhoAUfyH4W0byxCkFnbQJd9slwf
	d76FmQrdSkwjacQm71ggWqbXs+8bvqoqy9qP39WIgTj3RHp7IEW0NkqA/5Fji7z7
	iYeNEhw+cnPM2qv6fePFLEIXhJ8MACpNJblGnf1qFVuBRXtfJ4zUH3YDPhgieQpv
	8vD9YxZbZYT1njn9EQidHQwzC9GRRznoBpI5OHFnz/lexsgoOXEFRQm8Eo1Ptb0s
	ctYtkgvdGZ5Jn30xSF7E4kaNVJHJsbUVqdbBj9emlIPdAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863cpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:46:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a87ef9713so79645871cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674012; x=1785278812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBLyKhH6QlZwbtDhRtvyYm8qUDIOFADLvRXOHopvWq8=;
        b=FpG2Yx3fbgFb5on9qHACP1QZOuTbp5fnazNFqPYfsy8NcjjXMsVOGZ6J/oyN/HF00I
         b6RZgpCkQg3yrVjB32Hyb4aU5x3XoM5YEmlmV8wScuewAcDsk1MxXKMA8s0hQj4rzuUr
         xfaDw7uEpkaIuLOYwyJA6qilO8hcBN1z/elu3bgRDbvKcUtj3Bl2u27XEhEiST65GE4R
         Npfbot1MXQ3BoZS+CafjAcbwOurKbzqMeS7OGV7yAKKWvRVcv5zUrA9tqXMnVu0mHsEJ
         R/cMha4LRz8pp+QUW/6P3raXJxRHzM4E9TASmdvCRj3LZ0ANIkSczm6wrKzzN7/daWyM
         ImMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674012; x=1785278812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBLyKhH6QlZwbtDhRtvyYm8qUDIOFADLvRXOHopvWq8=;
        b=d1kFmQG5YSFUGpAUlkiqOq/jGt8f9ZTfJpwKOvSS/zkimPhTbdZ3fdadqPBXZ7F14w
         47Tz0OjwnbKEYEofbCNBdz7fC8giErWNZNN3GsX18MovubvfizeAl2LCFqgYsVcTfo8W
         UbicIZDpn0hCR8XxJHjFJ1bmJqysMqGiJKF4oQviavEphcF/C7REovCPFcjH7/iJ21QW
         6CR3oLCENteU2iv3H13lMgAx9ARBLgZHjib+pSWcRUXNCOLbwwwfjtKPSqARVlvQ0NiR
         asRtj2uN2ybC4tPsRANO+o7lzYKLbqwvtsRl8EWxHS592dVAOYFXaP8Gm0ZlMwrPCqPt
         LDBw==
X-Forwarded-Encrypted: i=1; AHgh+RpHJ0QyArhVGvwGX65007NdEfIJB0le9RcTuJVDABubyM4OA469f6JwKu9jozMagiF/tQqfceqVfYbZR8yB@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdLT1i+gS2y9mnrtnRsuWeTaSahwe8s67oNHmIaYAp3sWtsdB
	dy2xAFQgLVYRmnBviGLWFKog+2N2WICE8QhtTHrqouyiy151wavPbedeBETox8VVpNM4qvrZefN
	399QdIEC/mcQN8rizyqRecRBAvatfhVeAL+qhLAHvGkHdL0HQFnN6ca+ruMdCs+7Q1pPI
X-Gm-Gg: AR+sD11MMWSojk0S8HsgdmqdBqPt9/sSGv6fqTQ2eYrrmR93K1Nonr5qC79WUTmjVAD
	lUjcGi5ZNArlG3jSHXDhxVrM5JhQajPlD88M5yHo86Sx1Onb8QIbRuDwM/McRU3ehwWhQL8ckoc
	dpAHelAcOV6zwlb3WWGKwOoO6j04ZxDPRxOLLymiGlNtOkUi8ASz/OgbUCqWOQNrRwRtpt3PmOv
	N4x9S/H0vVHYqNI2gkyUVwr7/U/JC4kBXtc7whVUT4tMlFGZPThb1fhZClw4Mh75MkkhEpkAg97
	1OeV7tIUJaIGccarJHn30M3lmup/cCLdpwBrR0KS4Ak65qLW8UXpOpKT9vc2120DVe18qv6Xe3f
	qs64NNgjv6Cwbda95cmitSd7FdO9XmqrWcrm024tgWoNhIerCVx1N5KhciYhQM6AvI7AAz/1sy3
	0RyYtUQUXvJjzK7w==
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr17061781cf.29.1784674011884;
        Tue, 21 Jul 2026 15:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr17061531cf.29.1784674011351;
        Tue, 21 Jul 2026 15:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd3fsm154169e87.1.2026.07.21.15.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:46:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX76NaYuATby/m
 VYxaCnwf++GEizA3F59gsD64phl+rI0d/Dmh39ZO8/NV2hKsI+TppfnT2/cDgym1UhL04XFE0ot
 jvL3Gms0ZDO/zmLg7azeGtLhwAaCJ4g=
X-Proofpoint-ORIG-GUID: OgVyDmnRUAXjQZs2s0CYNZKOPfK6S9fs
X-Proofpoint-GUID: OgVyDmnRUAXjQZs2s0CYNZKOPfK6S9fs
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5ff6dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ScSKZHR6t8cGUoQXxYQA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX+a106qsrs7oG
 PEAJHk6+Uwh8S++lK8QNrmnWdd2Gzn2UjOWsG/dFM8GRfsmmuZl1pBAZ8wx5O15nP7drYxMvhJq
 TLBaJ+jCe/eylurjx1q5WO0vRIpVkhoHGvkGS+ZzcaQfYXdYSkZ43wcmLk0CmJsmMRx1Addh2Na
 ul10uujagPo7tHZYWRxSWwfNaI4ASurYQgJhtBKYaTRdqmBvB9uTKm8llCoBZo4AkmRdwVvG4pC
 I9uNSW+gkX7NskTgPaeuWX1yTst2CN+G33L6UaaWD2ZjgvTKCnuNrSBaiPInYOv1ZhdZk6kx+S3
 00Q5BaTNzhkH+lzPAa7pcUfgZPFiMuhxJC2RYqQu4gkrIKlgCZIm9CM1fGXrOt9Gb3O3agRJ5wm
 zqpVDASDgTcoI50YsWw9NClL7sH6IlECUT0ffJOy6Zd8LqTNWjsOpp/unY6O6PC6xQOYK4Wcn3b
 C/P5R8YLH9Yp9q/2U6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210235

On Wed, Jul 15, 2026 at 03:06:55AM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Two versions of PLLs for v6 PHYs exist: v1 and v1.1.
> These tables only cover v1.1 PLLs.
> For serdes, the difference between v1 and v1.1 PLLs is the value written to
> the BG_TIMER register.
> This register is set to 0x0e for v1 PLLs and 0x0a for v1.1 PLLs.
> As reference, SM8550 and SM8650 SoCs use v1.1 PLLs.
> For RBR/HBR/HBR2/HBR3, most values change.
> Make this distinction clear to avoid confusion when adding support for SoCs
> making use of v1 PLLs.

Checking the hardware docs I see no mention of v1 or v1.1 for these
PHYs.

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 90 +++++++++++++++----------------
>  1 file changed, 45 insertions(+), 45 deletions(-)

-- 
With best wishes
Dmitry
