Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483293;
	b=qewOpSy0WZ0DYBLGOzqIvvcpwAa+B50dwIBtfb7OyXfBYRTfY861nLitODirDH6Bg7nV
	 2sLnmGmRmDEVHL41LOdcA8vnuy3qlbrHVszh34lImZm7d6udRUtLIlLMFOyOywfoJwwqn
	 RWEGfgY/jU2eKcp1l3wBWrS9aGoU3bwtm8QTpoIvf+RcqVCTAt44WEKHSPheXb88ac3FB
	 mB0/fXX2cfVwq1NklX0j/K8hVOM2c0qzdNmaUnIDex5P72ZY6KpnOMOIn2nqXt3zMOSKN
	 UO7xob6UT6Fp+4BC0UyXOlF5fNOVPgIgnzA+H3VgbRQe+01NoRFy0hI2SNMNd2IVe1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
	b=XzkYilBVqR7me2wQk0gKifxxxnGIGBzSCp0/ptUO0SCcYo1ftRGa8Vp2coLqMbEamg02
	 Fnga6Rhj52J0K5r+SjR29kqmP71APd6zNuINVvXNk8TFvDmvDtRhLrRHCphLjHynVsoc7
	 QJIxhoA3zQv+wwfIec6Z6p2twUEv8J7Nn4JTOi3e6SOa4KDYXIsPbxpaZ/JTmfaUEOZTy
	 GGZtSTPWvV30eaNo4f40TVlRBbfgrwA9yoReCIj4C6//MWZ32DWHJedTQv8+FAUKuiszh
	 A7VRkgL6o7/jlCtmka74sZQKa583juMe3h2RpwWOGP56Z04xt/lHSlxkwVIev2g1EqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF421606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF421606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFHe01997024
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EItL5xvGpqO6UWOBBCZmsuF
	utwBGP9FjsFh6RXA9XA=; b=YN5aJTzguTybW9G+mlI0XJtw+n6bdR+mgrsGe4kH
	a8Dyzz44XUjSs7EpHb6Uj13LvRztzPUNAERCSCVsjO4uQzUyrOoht1lktdmwIwJN
	IB23nBH8TUFg9jCQboo1dkPIHs1ouP3XJ5POq+XgPz1aMiVzUjJZ+Ix5Epq27NKv
	sKdmwHSFLUHcMEu+UbIgQsUykWcPsemrV1fICWURhTyLU9ULzLIQS0+hnvQ3Jocx
	VuhbN/GN4A9+yQpGPF1gvjP43XD/mhfDm0Wfp0x+PVMVgtS4JS90CW47Qhkil74N
	u96yuT7J7TiTdXdJNKdFseH5+s4+L7EdbKpP302HsMVCEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m99x39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so180957385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483291; x=1794088091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=Ff5nXpYwnYEr6e5KbW+B3PvK0xjSoccwciobXjCTwS4s/CLEWZxQmka53A1cRWfGWj
         VfAL1LkIio4GihDsDomzy2EF6IT6AiTCvOJdrXfpOYzSoZrttEjeWFVhQ1jOEQXaCki9
         Js/NIVZOwOr3WUxy3WJlBEWg6QCg89V7f52pxhdn+bMUFyl1FJXVNxgd86Af9mYL1n7j
         6nzeZyYcJbIRkYTCJaJrpSj5Da33kfGx18gsHG0lj1jie8jFzhawBOGVhuZ1ogEpVk+B
         cZ6z+o1Z2nFtcSCGPlfHtc2Zwz1wOGs3W1VfDHrnqvfxpZWQhIP7B3DwH1m1Xs7QK2YE
         4rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483291; x=1794088091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=OX5wGiuP1R4aQejlxvy+/xsivW7coeyTZrnmBbWdiI94eoCobAgFmLOyHL6HXqTwZ8
         7VJNzWPE4QjlVzbMBnJDVnHh9Ki5pU5LdguzU4Q7bRxpxCEtlCljlgyFzALc5Ib7anQW
         0Yp4SuNABxSkB/SWGQhVEcHMUv78C574F7nBWJCAhteX46knAELcEs3lLeg6dNIU7UqK
         j1/XIGq/3gdosFcdCA8UIAjiE7r644sF59XHQtFuBGYH8wxcB2sXtVEtpZZkWLed4F9e
         22sOij7XFia7NKy7+h8ygQMN4l0RYum4TazR6IaKNxTjDRwGL0qSn933dXYIjWZwM/bh
         d5Cw==
X-Gm-Message-State: AFq9FYKohpQRDJV4CtaKqKokBxUNUEJonI+ZZksYrKjgH4HCfySaKX4w
	SVxjww6VlT/A4p36oIJQC8qsynmhqhEItE/wkEKFIT3jF9iNqBgEkMv0yfADxrEh62lLeQQ4LSP
	j+grPv/ePEQeZjXnCGGbf1Pkstb6U7dScoQG1COrN5JAh8DVWhQb2aUn0Mh5wi4qDYK6W
X-Gm-Gg: AYBFou2xVXPa8TFQSCAyueGOg8NuwrHlSgnL60JIGrvzLvrcmJOFFM6/K0VoKsGRsQ8
	uTFRcl+cwYW28D2dvpqx/lqCaPP+FfQWdW/ruShLvqzbxDPH/rDapJTTtAo36k2rKnaW+bfaO2d
	yq901HhNXC/T04scJ7C9atUAbSFbVUrE1uH0R00xvRnLAuMnHfXPgyf3wEr5uh+PBS/6PaUGpCv
	dRUxTJYUS0I99RFsGa8nmUwSOvortCnIY6h8PiCSgTOOwmGskoY+EnXPtHihsbuwyh/dnYw/6ml
	OlI23lNN1FFK+Q1L5Y4D2ktA2mmJ7UDcBe62JW8BVIusP5GlLctBn/AiD65aiohjhkdsbNZBHaJ
	R4WjFfPuNTk1+H7X3gBVAAHJ57ggjtn+RJVsOBrmTwmp+b3LJmoyf3mLFkD8o3ZTwDDQafeVsea
	gixBBb99pnvwAY+/2MI4bRoNjRoP1nZUM+1rcG65E6UMrg3lx2rqIufTXOcFPjFg==
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960250185a.58.1793483290811;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960246385a.58.1793483290275;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e5e6sm790440e87.57.2026.10.31.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
Message-ID: <dkwloahmxcka2ykjdrf6nh6d6cde6zgd7fe5s763h7s6nv3eqe@pm32d33ghgbb>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: oBS7gjriAwxUkM1IVvniSMrbnFW1Vsar
X-Proofpoint-GUID: oBS7gjriAwxUkM1IVvniSMrbnFW1Vsar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX36/uFDZlanjh
 1/A8t8poHR1EsViTb0wAWj/R/YCbPEWNNAphWjvrEtHfXoOkgzlgNgwMvM5qJTrtzx98PzwlNOR
 WFTj5GElM/N4qvv8gJSQAi7UAER10Q4x/dlKfvp9j8wKhhI0XyR0nZbmYtijaA8MNzCvEs8luuu
 vIIg4uAjz+OGE0MAIExWZZotJWPVcLFxFnJNv8os1yGchmCfo14mMpkiHaa+G9B8QBKAFRZHM9T
 QfBNK8LwsrWhfqTE7LDEQeRdbVl2u3k0D0F1ZwaKX/wnQ2lHdJmDB+mSs6CAn13fErs8236DkAl
 xpHDtYVcaGeLh/Pt4ZfOlF792A2KyVp4FOYAkLAe9Tq/B0WRSudvC3r6mty/T7iLGMMfmpbMBWD
 R27H0cAjMWFFqK/ruZ1PWoIZJlLst/VI9MgklvdTBht/EvnqOiHd6hMcBZwrlg5ABFTHLv1S/vA
 xG1RjQ68RBN6Kkg4uiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX3q/LUX2nX9ZY
 h7Wu5buZ+pbz7LkfIVKK8cU5tiRMAro9HIdfc/f3rO3CTMqQJyaXE3JjITvUf8AwMizs/cmguRn
 6RiHppmTzTZhZCGGpQEME4hO/7Jo3cE=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae6621b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=b0wOoaS58wixzsa18XgA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:38PM +0800, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, block resets for the MDSS core INT2 interrupt controller and for
> the MDSS RSC.  On devices whose bootloader hands over with the display
> block still active (PLLs locked, MDSS core / INT2 / RSC out of reset),
> the kernel so far reset only the MDSS core and left the INT2 and RSC
> blocks in the state left behind by the bootloader; command-mode panel
> initialisation then fails with command DMA timeouts and the display
> comes up as backlight only, without a DRM device.
> 
> Describe all three block resets so that the MDSS reset returns the
> whole display subsystem to a known state before any display hardware is
> programmed.
> 
> The reset runs after the display clock controller has programmed its
> PLLs (the clock controller supplies the MDSS clocks and power domain,
> so it always probes first).  The block resets do not touch the PLL
> registers and no display pipeline is active at this point, so the PLL
> configuration survives the reset and nothing visible can glitch.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index dd738d13df..950c528bc4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3071,7 +3071,9 @@ mdss: display-subsystem@ae00000 {
>  				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  
> -			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
> +				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>,
> +				 <&dispcc DISP_CC_MDSS_RSCC_BCR>;

Please drop the RSCC reset

>  
>  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
