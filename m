Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A739CD0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175935; cv=none; b=WVi7XaVMxPvSf6xOfgonPqmU1jeU70kACj+TNL9e1C6FWPl6h3VTfq7hrG/nroNvQhHynIUs5Xi99Tfin9PmTTubrY9FtmhUf4nhVBKIBit43HEVpEalKchWa1oA8kNZolJQR9vJDXz5zoNHmnJH4bbaObqbpDjyXQUDN/rhvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175935; c=relaxed/simple;
	bh=gLMEKqEEwV/fRvQQ1VmFy+8sHppbwdhNA9c9SfGg1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVJ7slt7cCV5G+5e7WoU+nz/R19EY2H8QJtw/Psl5RsaHQaRZFm2HqcIkNU2c0IdUTJaSjrJKqeT64riFElsUJRNZ0TXU+kPPl8IuAieseF9WrtqWKsHTTIMT/Lp7uZ7wL3UCoOwKvyEFkLswW0B40rOiudo7XSny9l1Nmci42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZRh8Cae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQtdhh9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZRh8Cae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQtdhh9T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC1uw245557
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P051N9m9fNC2s4r4wBi5jlim
	x4aHj3hNeJV9vNXg7lI=; b=eZRh8CaeF3/j1iPYpyGsjLL74xlFpNPLjI8DBjfZ
	YuP+5UfxtyrZ6TnDXvtl/gSfsDXb1kW0PEwBkPqSDlWswy+9v0KRDw9v84xUxYtE
	aEsWmbLGN0sli3fQXtEbfwqCkzYHvt/mdp1BrBmpJCdB8RJLIZdSEdBXkSA9NWSM
	o8HkgzBFW2yIqXuGxRAmBUBT/woaGFhf7D0x4F9xbnT5x1eJxvi2LmVhmOiqbJxX
	jL+3gJ175OItl8z+gFoX0i+FSSkKi1Wk97GRoG0+L7DmMCe1E/3kKfTQxSobEuDn
	MHWqcSFP2FEp0U20ZAhrglGR1gVadmd+11oEohyrpVtH2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbtbf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so161160a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785175932; x=1785780732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P051N9m9fNC2s4r4wBi5jlimx4aHj3hNeJV9vNXg7lI=;
        b=ZQtdhh9ToVInDvH5dtmwruZXvBQo3AFMbKvvhWlzx0rjtp0GGE9aVvN5x2EQkELLlm
         qYctBexSf3g9WcUyGV/Unpr8lXSTrX7zSW2rhGyw7WDXU2VAhmfsHxW1ffeB7+OLK+oQ
         y0LVZqJcbSAKyMIXQ3O0zaumlfFshpbsZ0MJVPUGTQuj7iB6VDeSmhra5IzbFswzP/SB
         MvsaYxvPv1cp05qbl93uwSCeo/O+kObZ+Rs89/v9VSbf6mOHZk8ZqT21W3cWoZCy2Vui
         SxYRoT/yX0CAENBUAjPiTQNjjlDGmHjmn2cGB3incE65eijbBjN34NSDzwwlLxohXFrB
         HhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175932; x=1785780732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P051N9m9fNC2s4r4wBi5jlimx4aHj3hNeJV9vNXg7lI=;
        b=C8zD2XrHHk0mzcP2yywzUr/XWcOPeLc/ys7Z6jCo7l+aDkHdf4P+idXTDUH+9UrEUM
         0WdZp1OjAMCiaFqJ44AwD+CMItWP6rtL1y8oqKlh94dbwYeuI+nAm5d4PzDEPkyRtuO2
         54GMlPrqAWfuKBpg1jWurYgjXTqvBYvusQ2F/TnFc36wlFCo4DnWJgpTa7oCDd3a/Azd
         kuFj602ID8d3HDOs9Eq+ycX583/At5UyE7XMNsFnmZI9wRmHyEAM+WauVdSE09F9VD5B
         KewFTiVq3ae5DBP9SbEoW0L8gOR65vMi/9aDsMWf48LkeFK3mLfOoCHoTRczF0vG9g8E
         tAnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUtU3rMsEq2v3Df/Z3+Fl34r+BmKuPYu4afEi21J/Lzu6H77J4Yb0U+BdGyW4UFZ29XuOBvhRHN8/a7W7e@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUKCZHLA11mwNH2swKTZRiSO8D5Tv6DrxpQwU2DuU/VxgSvzT
	WGnA7b8przjbaGx9OmKIpaybQk+ptPYUvtwlGrzF/a1EODVcRJLFBn/anxT4BvXwp07Vu1kths6
	v384gwLAaELNcA4yEmPg6EK8VRqIH8Vv76XVcJS9GoimzthvnKIjyju0AwdehPWhm8bw6
X-Gm-Gg: AR+sD10zxDxOhM7VI9wNK3hbGOUQmsTmNwDTO9HNQ4R/RcA3syvyXFOhGUrPi8WRLeU
	DNGE/zVvEKCmYY+vauk1+N6fRSruudBcHvuyRo4YowFsE97n39iWSeB98bHD5WUilZwsPUSSg/M
	7UmhMZH9A7KdQKrGn0Zh6lIyVh1Yd2opb9eOzGhhUVgNTfwy92o1LvchfT0oilDd0SDkNtJzcug
	3YSiOKUW4zypGh+88Ow3Vhz0jPGKz7BoIW62mgYovMD3G4qnXWmAo9jyLaAR6EgLbj4C03J+HMc
	KRjIqv0J73bUPl89RnlnAegWQerHwNDzKeoIQK/9sQYhfJnQbNTnanQtD+OVSKYzdly5gh6uXks
	WcYfqNYBpZs8RkJNbHHv8lOeCyA==
X-Received: by 2002:a17:90b:5625:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38f644f8641mr451037a91.20.1785175932480;
        Mon, 27 Jul 2026 11:12:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5625:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38f644f8641mr451004a91.20.1785175931937;
        Mon, 27 Jul 2026 11:12:11 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm33096048c88.0.2026.07.27.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:12:11 -0700 (PDT)
Date: Mon, 27 Jul 2026 23:42:04 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <amefdKQOfyRgeWn9@hu-mdsor-hyd.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
 <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
 <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
X-Proofpoint-ORIG-GUID: GfURt_W6DTnKh8aSgEKlWvauwurFeaQK
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a679f7d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5IGsX73iB-lTh6suV3gA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2OCBTYWx0ZWRfXwJRD1p9Hf6Km
 ODwVWqRSMt9RTB8HAxL+uvrBijWEMXXOQOdLlacVQyDdN1fSIQPwwR4mEoUmTyZ0sI7m+z7EkC5
 ZlwxpXhNTI9bb+IMUF32Th89USDfks8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2OCBTYWx0ZWRfX0qWqlly2nQLu
 ICilavsxFlxytteoJFxTRhGZ5ETgG7ySQc3wbv0gX1sRdWr7+1CT5n0MXUYWHXWA7L64iAcx57D
 swdsdn+w9GYiCcGwbzssWfeoVA8uJgSD7Ns28bPw/oJaZKLuK71vNzSjTZJ1SdznZvua9g0vfML
 Gfi+Dd6HSlh8RDif79ecO0XBVEPBWqNvFMWU4z5Oz1jXTXv8nkqcsMaPZzEhLDN48RAZQe3jCWo
 +GPemSTw5zIoR4nzO+eSCwVo+TtIynAebPj3dEwEsBAzaVDi8qPJlHxL74kQKG7yxajsUtPXW0K
 D1TzW1mkdC28Q+p1Es80AIR2+i/wVmiA+WTQu0s8u7RUujIOLKNjT/6tVoIaItq75n5XpQfN09p
 swpnfNVvVO8DRBhfiP7HCHIGMhg0uoBHlpbT3E4yhI4n+9stLaaJLKbgKMr56SY0o66AcuYcW7l
 EXFXEOLDwlF7rkgCLZw==
X-Proofpoint-GUID: GfURt_W6DTnKh8aSgEKlWvauwurFeaQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270168

On Wed, Jul 22, 2026 at 04:49:45PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jul 18, 2026 at 04:54:07PM +0530, Mohit Dsor wrote:
> > On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> > > On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > > > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > > > 
> > > > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > > > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > > > 
> > > > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > > > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > > > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > > > 
> > > > The bridge receives DSI output from MDSS and drives an HDMI-A
> > > > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > > > 
> > > > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > > > ---
> > > 
> > > Does the other EVK not have this same hardware?
> > Yes other variants have this hardware but only IQS variant has
> > DS-HDMI as default, others have DLC panel as default.
> 
> By 'default' do you mean some DIP switches? If so, please consider
> providing overlays for the bridge to be used on other variants of the
> EVK.
There are separate daughter cards for DLC Panel and DSI-HDMI, at a time
only one of them can be connected.
We are planning to submit a separate patch series covering all overlays together, if that is Ok
DLC panel overlay for the IQ variant
DSI-to-HDMI overlays for the CQ and CM variants
> 
> > > 
> > > [...]
> > > 
> > > > +&pm8150_l11 {
> > > > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> > > 
> > > This comment is superfluous
> > This comment will be removed in next revision.
> > > 
> > > Konrad
> 
> -- 
> With best wishes
> Dmitry
