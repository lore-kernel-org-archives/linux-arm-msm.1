Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F636A36A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749804; cv=none; b=gf+M/RHGVO0lCNIFa/XS8jI0HN5k/2ZTaIKsWOtnOtKTeSbkR35CMRs18WO+MgbQxNh/4ntiiMMCTgCwEeuD72ijQM/tM8Xsd2GX2Vw5mM8ogy0Dvoy1sl6ZBh1VhMRdH3u9dvequC6NzGoH1emo0V+usXCYWR42sQHomGuCMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749804; c=relaxed/simple;
	bh=mVs7Y6Zlw9G8xVUrhFmCckDfMOLQDDWqs4AWD1QQyuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSxokLgQcDIhwqxJ8Psx62Hm1zEICM1nYr30YlSy19Jofla7T8GKal1Q7/PUW7vRNBG5N4Xv1UZ+HxyjnQm7a0c88NeXIw3jDnyCyIJnQc9HjNS05Qc8VyH+ahVYNNItwt1YmCpuD6YpeAa9xk5uBZliM2587SdoZtMzq0oqqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsUVOYDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REBoEW5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsUVOYDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REBoEW5E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6F9hT1592835
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tPWV/hXboWzQLZnIxtfFdto0
	CNYSH9DwqGYVh/BZlFk=; b=HsUVOYDNINurXKdXX4nP7V0yFdc7tDpzDTj6PMhw
	DOtZTCcGT97pPbwf8QZ3gdBdjPfjaEmyiLsiVakjnbClnlKQECRtmE5ruLzNS+bL
	fm4bNczMkznWzfhwYXQKOGrucx6OaMvY6EHR+mfGqKo4pvDFPq/Jf2xHVsPIYS/O
	GIP8ZKztDOpHut6EJHj6LjO7kCNbfWpvyMTyD8hFVK0BlEbgZoY7WPzRoA1/VAmQ
	Qfvu9yDiHse3Smc58l4qzmk1ghIAl3R7FPZOmFbstl7d2kvFTN28t85oD4CnTOlS
	Y+x4qLXtIXdLnsimpHoFu0tfuArsSIC/A11M4yYN8D5SVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh2sts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4989359a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749792; x=1791354592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=REBoEW5E9ZCNvIjWYAWQFYyylauw5I+t4fajJux+40jbBS9Zf3mLifCI1EUQDqbMU3
         bSCNYAbUqW8ZvGKwe7c/BCIkV5tYMWN+As7FCe+WWPUmkRHqz3kQ9NLLXacTOX9eJkPK
         6vxHL+brZU/ESawwYQx17w940DpXPh0IhPEsHAbgh4W6wAkLjhn1QRTMXXJOAiGF58S8
         0WA9BW7IxW3Ks+T4aKLttEZdtpnaxjTaH27otN5diNhn02c3CnjFr6eOdduwv9av0YNc
         j3zRJ6BPQb9STiRYVo0pVedE9oUpIF5tPJDPj2y7i9itgcoHuiQS6cx4B0GK84V2u6GB
         dAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749792; x=1791354592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=IZQj0wqp92HR7QmB4WYJgCjDqnHVWcAbTxNmkmll9kZTXAHpDQnTBfM3ACJXySUTSV
         3x+UUGPL1ZaSAOJwCJO9VWsWmsBm1xfg1U1vj6DRXh5fC4DYP1TogBVN1wH6SF4CpgO+
         VOKiM3tvSrhIU2qppaPBVYQguy0pgr1RpTgPxFRf2ioZh6IuZnvR3G/wAhouEvML8fgJ
         pTXbEi0oZ9eyI3iaCDrWaolQMhhpA0WCQYCp1w/VXLU9B92HvhNOCKzXnTfwos3k+T7V
         mi6sJkZQyNJjlt/rjDC6AMu/0U8Uv79TOoHMbG8oWouPaodq8zjfnR4l4oiJo0rlFwEG
         oHTA==
X-Forwarded-Encrypted: i=1; AKwUvByX7Nz1DpwbQrwWyms9RYylGJyRj8ZwzIqXgEY5rjstxSkkSLxZTHzly01yT49Lf2raCVYAipjItRfCqzib@vger.kernel.org
X-Gm-Message-State: AFq9FYL4e37v6NoHsVz/V9rET06pmhNbDzZOJOiwaW+W5x1o9iaaBPx/
	qmPj5Ikctg1NksJv0dubqlMVu9qvlbm4bhBfmY/GpjCajuP7MG740i7wpsHpfUON/lPEDGAvEs6
	+EuwPHIWDE1ZHWQZJEHSI8Crw5xUWqIbokFfxGvSNsevbgyg6af/8ITHCo2HvsuRFbpEC
X-Gm-Gg: AYBFou1pwzzMLGiTEd8h6WM3/JzvceT5+H1QH7mj+j2TWliWOb54K3NChedpGou154F
	+qolXsWBRjvoGkPFA70Jp6JMSf+YRIJ+ut6HMZxuTs4uuHqN8SyJFdxgtgfgEPy6ITc+obRDuTl
	X8llrB4KbHJzrMNAmD9+P1YPIteDO/wCGxMYjx7WRIVOSX+XbdaQvN+AzmLaCPegdODU4kXNcZ8
	Ycx9cKfrrNcaXznk+jqLvb1wG6HxeCeHrvvt0wCHoey3OtLugBdQWd+Yo+ldK6/lv9k4/Ody6HA
	TvpTciaFlZ/EI8DxIIke6hMOTLccCLNQhx9cH5uhDZ5PSR1qqmFwWFVx21aJKue+7Oc+mZSZHrp
	QuYMAtfF+n4g0rD5DMfZOVXeU
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437220a91.53.1790749791646;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437199a91.53.1790749791156;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca64bea4sm1825727a91.0.2026.09.29.23.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:29:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:59:45 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <arysWfwaY5GOo10G@hu-raryan-hyd.qualcomm.com>
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
 <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX4fTkgjVJgpq5
 8uTS1JmBshT4rHf0eczCxShVxL+rm4U8Fmi6vO4K3bwcuhY8HGmYZtdQkY2QhRQxumtnE0pQ492
 7k2sgilIsnrgCVUrfTdEZS98q3H4ocjDN2OEGMlyNZElsTPgGk5A/Z5E8PNswrTqkK/shgy4NLI
 4iUTVtjCiL77K2tsG6sC0Ci15KmxQQPc4AGny3J6SsEO9F2S8+I7u1y51FXyiPyQiF4YwEhpSP9
 R8vdxntqpUxRWzHdtYz7APAgYCBpmaidXM8nrHbs+VEBs1EWPnFvRCClVkOV6R58Jb3WjEEGiZv
 DnnTk9I0SwG1WYnFPmizOJlQW4ZYggYnWH8yJ7HDv3oNXTRDqJqCdHJ8H3Tx28xj+PeuFBTHL6F
 RxRt9jY5jI2zSB2D2GxQfw6Fh1t7DaYGPiNGNUoPBSP1IktA0ga3VI84VlKYM+NScAg4Wsd3L0c
 7knpJ4eTkBb6Duts0LA==
X-Proofpoint-GUID: g3up47rj2dGvOMD-HYMita3vF47g3yoP
X-Proofpoint-ORIG-GUID: g3up47rj2dGvOMD-HYMita3vF47g3yoP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX/I4YRbezppBh
 KI4zfAe88PzgNA0lLEGXGstEtQPeQY4XaQiUm+pyjlyA4Oz4gNn7xuCJwRaXnd1ZK8zTcbK7S0e
 fsuqLgBFFn/j93QEyA8JivnQab3LJoE=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abcac60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wkZ4SpZ5FDF5jysW358A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300025

On Thu, Sep 03, 2026 at 11:02:16AM +0200, Konrad Dybcio wrote:
> On 8/24/26 4:49 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	msm_therm_bridge: msm-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	quiet_therm_bridge: quiet-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	xo_therm_bridge: xo-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> 
> I see the SoM also has a PA_THERM0 thermistor at AMUX1
> 
>

In schematic for qrb2210-rb1, it shows NC. 

> > +
> > +	thermal-zones {
> > +		sys-1-thermal {
> 
> Please give these meaningful names
>

ACK.

> Also, the XO one can go to the PMIC DTSI since it's always there
> 

ACK.

> Konrad

Thanks & Regards
Raj Aryan
