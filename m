Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB91E0DE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698427; cv=none; b=pDP7u6VH2kKC5BD7Yg20srUCdA7rflMVa8fVqcCpYmJAxcgIBkMo+6aSzzBGZpRKfGk4Q8Le1tzEyWo/V6L0gS2EWusc736e7NHCcQi4laj6DwHY6VX0AIhrKv9furNWgs6qWwpmQuKL6eNOHpW/VWMYlKfrAFPa1Fi+/r7TP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698427; c=relaxed/simple;
	bh=VD8xRp7Pr6lrGRZDItwtv2o1nHlPugA6Ovros4j9jsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyqiIHrVCtxIwLiTNAGpqPdJi78OpwcG9Yc5a8OWsO/rQZMVlagmHkH4Gxfxx9AXjLysehjN6Fl6ZwwgM0AihreXv/BLnL8yVK5nI28yOOxbW81rrz5kw4HHFWmsOArBYVjSArfZQMi7xxa33BdrRwTddVSbrZScVasnIp07EFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd2fdET7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab+GvEsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd2fdET7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab+GvEsU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53d2h852999
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YMWxBiGgJMWcHgjMI5TkWZzi
	XouiwxvGOfVumtfALvA=; b=kd2fdET7RP7EExFCU4Cdb+ID+IpxWaMazg1w5Umq
	5HDCEi93D0A8g1Uu6TpMUg5ydlaJ8zSERrpRUTOBvi+a0t6lRb2s4pBvdSe0nqgW
	eFLkMniYffJkTXKuUPw7DyG1VHYHMF/szEdFT0ugqOXviV2o5GR9AaM0EXUGfZ4m
	Gt2zlIbcy9H4hqgBLDewtgrGMjOinFxk+nrjBv/D7elyWpqGeojaeBrGdgUlyOos
	e9/K1MADsyMtmPIXoVXJ0aSM3cZXObm7X9RtLHIzbV9upOMR5k0gdN6Lw3EunRp9
	iav7ELQjiFuLdx6l3rrIxXdnnwbBktHY1qZEn2ozLY62uQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsvhty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:33:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so143659491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784698424; x=1785303224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMWxBiGgJMWcHgjMI5TkWZziXouiwxvGOfVumtfALvA=;
        b=Ab+GvEsUw6Mzj+QzNmj3zSGYHt1NzlOepjcWhHhIGllpkhuo1brbOlJIQjQGhUyQVp
         imZjjrh5DmRBu3AUAyhnLpnqMU1IJbZXAFGABpP2/alpoy6KEHsWcXpx0JJotb3hKBMw
         EzwQq3szbnE5ICuhW62FOlxv3eDcScHRoSxpaeS8rEEnDdJW+cP4rWzOoOV1BE4cASFR
         DVAslFZD82THDFk6w8FJ5WOecbKCUkRIS9fV7skN6ZzJaMk5pBM/xhnS5dNhssww8hR8
         RTT3CFuVbAP0GPsIsrFosIjWFFdzjBm8sW5yQEh67mdxn+VD9SpcPWjT4RXU4FbEvIYU
         eq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784698424; x=1785303224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMWxBiGgJMWcHgjMI5TkWZziXouiwxvGOfVumtfALvA=;
        b=X33vmhWhIZ2RZO73e/jxN1EDQpNbFip+Bi6Hx4LPue7YKvB/LzAzCYkb2IxpwGdQx9
         dhW9ZlgWIcNX6O3TPGf4zyJDe60uOCevp466xIrCO4rfDmFXBFmnMHoju4Zg9cF4Iv3Z
         cafaqmSY4/qcKV8t6tZVogttrmDY4pbmCQyM9NbR+Cfw6JgQ3m2NAL+LDJapNtw6Zfgs
         VnF5Ef2A87yMPfJRJZlnZ+2L5IcuZT7iZP9cee4Q2bPUc8KtQhMdJWuq0f0rMnwHrV/j
         6UD1wPGLhfotcXjeVEBx5gTJBZn67xny+nSbNah/G7Zvp/M6xfJyOZUUgzYCZShbF+6S
         vIhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAzv60fzBM0bFp6Wo/f/n+GErj2+8F8oTwA4J5FgYAtDcH8XltOeMGvIoMQXLfL0qzQtC9ugbSXr9XFvoh@vger.kernel.org
X-Gm-Message-State: AOJu0YywBCARrTEbReqhoHKs3FR7t7SzPEfuAwHZxHP0XzGI2tttpe2K
	0oycIpSFWuM4Cpu1EBZhO+d1hkv/CkqB2WlVHDgxdnK/Flumb/itXnhEVFGG2hCmzAi2oUaDvg+
	VQbO7JA69RH+c1/V+rxNNrt3EQaUreXYqKbeEZ5o4PkX91xD+Zw6bvG2RL4mpklPx/BzC
X-Gm-Gg: AR+sD13vgmGSkrF/erGsvy9jCyFsA64WBR9mIU7kagBXOZIZaxDsvkjqKkJNZ4CHIqe
	bsW6uy/TU0N7EcSsccuQoPBEjm7sa/g74IJIi8IIAA5AAOZya6z3AK1+DZPeqBtHsxmF5paXYGN
	bPgb84AoI697qWmU8LYs0UhWvnSJsXUeqdGmo19o3lhjhtD+Elxu8CgolRK6hwsUmE6rNK2JXN/
	5hxgFsR195IBSQYPLRAO19qi80OxH+LpcmQuCZjBbT3OVIWftuHd3IyPiLIvJz4thsvcoPKoPci
	apddqDHr2xsa2zivXULAvm76kd3lMmi5XuCUh4qaBizqUuSOsukVl1rIXx74XLkCz/QsTUxeoyC
	P1WQNROXe1fQZOBmRO51eWwGpK0Nk1YNPbcehXi+ficqQ81WQyxUn6YqOGeIsRpq+eGBxo2Jfgo
	qh1zStm8Nk1NnqVA==
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr185183041cf.17.1784698424060;
        Tue, 21 Jul 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr185182961cf.17.1784698423652;
        Tue, 21 Jul 2026 22:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8b999sm286488e87.15.2026.07.21.22.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:33:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:33:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQS platform
Message-ID: <2xpkigm32q6eq7nh4bgsfgswwjquru4pa5oxeciyx3jpywjf2i@qnc3i5sumo2p>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
 <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
X-Proofpoint-GUID: 0_4UREohXNhI2AsBl4ylxjFEqNWQESro
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfX5se2UKxp6jkO
 ujLVxgm+E8obDvYfTusArEQ+Eur572paezVtcFhIAt9C0YcokY+Bu7MOk418HOZsfSYU/8wxe1o
 xc+iUyQrbSIfxWUuOC1vSC3CxfaPbE4=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a605639 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RdTN6Onpav5IspOjp2MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0_4UREohXNhI2AsBl4ylxjFEqNWQESro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfX12RyT3W7Rx+6
 LaxI8APLsiO/EGW8yJbc7w0wuymT6TkQ0xU0c5hi+9vpQypyurFPjAFNvnZT5HZV+x6RVNIDlS9
 mWa1qVjBW3osVzPgyYYJ0kyU1akk7Zzsdoize/bzg9zsXAZRSyjcX0NI7bcX4ws8UUBefCPXV2O
 J7jGsk8tNa9X0lmnBkpnhe5Y/nRMLa4wGa5XVsu9GttI4SZt2P/JEcDEw5LFqeDpF2RL7W912tH
 6zOmk8o2ewDtei0cAWizrI3o+0E02myktkSQH8a8uFVfLLqvxgoBmLwFXGHFRvtj877lscQ8Xvy
 u3zbav4gtPQNoP16nKLPeNZe3K9WGKPhCi34jX9+yb7mTWaDQb5nE6rA3on9Dd+by04F7R6ZaN7
 vT7yDdFfR7YXhG3Wjh/85hIHuKm36i/zkpV0R9au4l3cn4PoasNGaJ8ptx+jLPi1dEmcRNEd5x3
 sNcyJMzpiBlBErX3YZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220048

On Wed, Jul 22, 2026 at 07:22:47AM +0530, Krishna Kurapati wrote:
> 
> 
> On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
> > > Enable both USB controllers in device mode on Shikra CQS platform.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
> > >   1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > index b3f19a64d7ae..006e24a62f5c 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> > > @@ -38,3 +38,38 @@ &sdhc_1 {
> > >   	status = "okay";
> > >   };
> > > +
> > > +&usb_1 {
> > > +	dr_mode = "peripheral";
> > 
> > Why is peripheral-only?
> > 
> 
> On First controller of CQS/CQM platforms, usb-role-swtich is controller by
> PM4125 and on second controller of CQS/CQM platforms, and both controllers
> of IQS, its controller by Cypress PD controller. I will push out the PM4125
> changes in a different patch set since couple of issues are under debug. And
> the cypress pd controller changes are still under development. Hence enabled
> both controllers in device mode for now.

That needs to be explained in the commit messages.

> 
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > 
> 

-- 
With best wishes
Dmitry
