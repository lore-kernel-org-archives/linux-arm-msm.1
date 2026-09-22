Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AE5328A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072817; cv=none; b=g0Z00VyvkPu+mOvyvT4DU3Qhg15uCgAJjCNx4RpTep3BovnP+PnbIyR13aio4EvEqoLYFS77MKtZ6ORzHe72adjf7pDmPTFGzOCMZk1ezQvqvvfzWgp3qHOzOAD1NHMh7HMwYoqb7u6jCCQfX6ZqN987JV0EswmjK2nJdq6tFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072817; c=relaxed/simple;
	bh=CnteW/QQydDTia5kiku2DODgBP0WEZ2kFVWX0qHslvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNuv4xCABqCHj/nsPLLOXaURutzM1pnXrB2L35YcfcJPaNFpa4Ie69vMRbL7cffb8GEm54c1Za4Jf59BnYUiLV5BiqPqQrJUY8E+bKeqBHKS18O4UyWJf1LUy+HNPKX86R2CCjYy0msqjByWsVojni33cGGj77jW1JOTRVAgvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/CHkvur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxtVD720; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/CHkvur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxtVD720"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6VXTj1978671
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=empcgrZmVB26CyzoMm70tPXe
	VVtlzHO2oeqvJZ/GtxY=; b=m/CHkvurgZ7qH3f+0tFPJxZoC/2bhBmuV+vnEEdD
	2JNG5+RqdFISlBUm7Ol+Ga3o9x3c14QUBk9/UqROQMO7z5aJk/6+UJhzEk6VYaXr
	R3yxqiZhWJr8Zx4WPf6mxcEGKdh8yntewu5p0kpoBmvg9OgRh8L2K3b1bDesNJAJ
	nqZ/bDG1OCFo0/7vrCeRIC1KBmcDaW6kFOLzmntlIxNk84TtBGOBEDa4XHnzt8Er
	L13IuSvqdCq3MOlShpSdvbp8n1Dccc+TnMw1SDlRcQ9+M0W02NQIz6yeD5UMsrrj
	DndszRMesH1pG5WY53u0lHiel8YT4mdEeeZNj1UsPcQJiQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jcan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:26:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4783377a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072814; x=1790677614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=empcgrZmVB26CyzoMm70tPXeVVtlzHO2oeqvJZ/GtxY=;
        b=WxtVD720HZt8rBS7sQescuYffKnmQqUux4JeCbXmLOuBiF/zPJyGxifAz0XlLnH3fZ
         tfYUi7M8qlVX23eL7bRvQ3dkMOdolwOIbECFnej28eO3FlA+nSWYVuBT8wqUMFs+X/33
         M69F54TVKNxEZXq01hvHRo1DnoEgSAdf5rFtTG+qLKvBPZakPQuM6GchEbXNaW6dpcAO
         dhc2fkzF2l5pGFtgL+CxhgCMXswot3n0ELHP/uhHr0e+Koe9uXQwZLfUlJHYwAOGKzkA
         +jyvLlmu240xS1RQ4Wr96OFXaB3x+bdIlyr0T+wlEVqjyOgEU75DO4TGI5yezT0TuXIM
         bsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072814; x=1790677614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=empcgrZmVB26CyzoMm70tPXeVVtlzHO2oeqvJZ/GtxY=;
        b=GMRvOR8HODHVOjxVOZgvtmUiVDqQIBj4tmXIsazcCvPgj337D6109yJQM6ESiLcvE5
         usI4dvenYG+bje2onw2VNOZ3y/rYwIbT7s0ssXq+Sn2lcmFWaCORa6j7uEg/jia8TO35
         UdqGmd0Ue5rx0Uz+4cbBV2ZaJaV2OFjV/9J7xg/jvFmmRHwH2KQYY+mF3unfsnwt3PWr
         9gB+UB7+DDUUOmiSB/kV34t6uPI+SyExuaUzQZBi2dTgm8XlOWpjqRYgCrr2+SYKKrwJ
         /A8VnXSLZD4sP/TsbrROKbxlUDRcNkRuypsGzCZdDLQftV127QNjk/xLkgg0OdmT2IMS
         g0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgbu0v23KW1YNGBkyL+sh7zjC6zosdR9VaI/G/CQ3WbB1kqfrgB+XColtLxvNzUK/bFAGUGiumPmAjvLZy@vger.kernel.org
X-Gm-Message-State: AFuF++n9URbjEFQbWSTfcbBsZMVoYzyopqJATfcd/wXfGVcZTVBFfRJx
	PBQAC7k0KuQH0aGOlV1/tDp7jEaPvN2DJzPr+NqJviX65lGnLKaIbAb7pcfItPT2gS0OkXVitTl
	dr4AezXRUkfhKaQ8rDaam5ZGH6B3LQYdOXaG3cwbqW7V8Nzv3SlPgDwHTimE4m1ZI6NUn
X-Gm-Gg: AYBFou1TtDykH2n48W/M80GmwltlTAIaOp8XIS9r5/+++n/417Geok2kZQfD3bn5oPi
	WgnRHEaE1+mMfTHFEP4AG2L7vJspYJvLL4MLFkTEyGKBeMEAhPOEblo07AG6iEAvflhKGWlOv89
	HG8c75RU2xT3Spw8mBv5PKHzaADDjrWeBL4OuKu24JxU6Y9zV666/RtLB12RyrpV2+3B7JMSvGt
	9tKhYFLILOkyi2PYQeSwIBz7bmb6ywkY5yV58xtLhwRMgtXSQQpSr9ZZojF+j9TB2oCLO8Stnd5
	k4U/G06k5iQcxKAoih3PgHIvbyOD8AsVDUNODyP48B63Y83WE3i54WlbweQEER9poIKNVBc6A+J
	BTyBk7rVHPPAFBx8W00TrkHFobmECODF0LwFmcx5Nkd0lGmsxPI7W
X-Received: by 2002:a17:90b:4fd1:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a0731183dcmr858987a91.28.1790072813950;
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a0731183dcmr858957a91.28.1790072813493;
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a3e24asm3822296c88.11.2026.09.22.03.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:26:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Message-ID: <arJX549pPM-0Rxx4@QCOM-aGQu4IUr3Y>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <63c1fa59-1a2d-4c39-b0df-ca7c00d2e535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c1fa59-1a2d-4c39-b0df-ca7c00d2e535@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XoVEDQmC-RwYIh6HenK20Nsp_GLsw9Ru
X-Proofpoint-GUID: XoVEDQmC-RwYIh6HenK20Nsp_GLsw9Ru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX0g3jkEQ7jH0g
 P35Q/8jGm9WoKXLgZJsGXeEd0JLfiQvtELzGB7mPXbkrfqPgkNXVFvAZZOjHcC/zaVJEisH20er
 exaORwVzu0uD969636VAP5GhuSC2y9iT3jgB4gEJWiM5PzVtiTV8kbk8F35q0gQ20JYvu2ChNFF
 6lAKyJnZrYJ4CYqeesW8yYJLdSYtdujWOxrmXsCHn3Lz6Csqxn2no8TnV5sr2qT3NZrnT/vDnWe
 JGn4LKsMfVmuE7hzTvXDwgWGc2lgencySgRwfG+y7MQuQOPULW84mQpNEYipXtDyo8UqCjExPyU
 BNmzvyrPaImQX2LuJbiJtmpPLxxiNkCre1YihMCzfGJ9CS+K6eI+fovEbDgPEb12SQHBLHw3xYf
 vIHJn7igk4r3C1DI8wFZ2+0+HA0HVLnQmKaZh15dbTXZl0Ad0CBjCDHsoNv8BPHHyD3Dob7Ewzm
 5vcuUUtWGqOT12IHd7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX4/Z816WQHuAT
 bAIwX+UnoptdbRUES6FavbVSqnT0+t7cWtvZYA9wmDsGONOyZ0uQ2rXFeCsbYR/4/7GbuujRLVa
 N+WdQ95vw3gBkgk/PzYjx5xEXGUvuHs=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab257ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M-_d4yFJWzV0JcTPBo4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=IRUrt_SQlIu20UJnvt05:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150

On Tue, Sep 22, 2026 at 06:14:09PM +0800, Jie Gan wrote:
> 
> On 9/22/2026 6:08 PM, Shawn Guo wrote:
> > From: Jie Gan <jie.gan@oss.qualcomm.com>
> > 
> > Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
> > TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
> > sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
> > sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
> > clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
> > plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
> > tn_ag aggregator into the main CoreSight funnel and out to the AOSS
> > sink.
> > 
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/nord.dtsi | 3540 ++++++++++++++++++++++++++--
> >   1 file changed, 3314 insertions(+), 226 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > index 926ccf3bbe4e..3e4fbacc2eb3 100644
> > --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> > @@ -345,6 +345,18 @@ domain_ss3: domain-sleep-0 {
> >   		};
> >   	};
> > +	eud-sink {
> > +		compatible = "arm,coresight-dummy-sink";
> > +
> > +		in-ports {
> > +			port {
> > +				eud_in: endpoint {
> > +					remote-endpoint = <&aoss_rep0_out1>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> >   	firmware: firmware {
> >   		scm {
> >   			compatible = "qcom,scm-nord",
> > @@ -372,6 +384,20 @@ cpu_perf: protocol@13 {
> >   		};
> >   	};
> > +	hpass-stm {
> > +		compatible = "arm,coresight-dummy-source";
> > +		label = "hpass_stm";
> > +		arm,static-trace-id = <25>;
> > +
> > +		out-ports {
> > +			port {
> > +				lpass_stm_out: endpoint {
> > +					remote-endpoint = <&lpass_tn_in18>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> >   	memory@80000000 {
> >   		device_type = "memory";
> >   		/* Size will be updated by bootloader */
> > @@ -1900,236 +1926,3178 @@ tlmm: pinctrl@f100000 {
> >   			wakeup-parent = <&pdc>;
> >   		};
> > -		apps_smmu_0: iommu@15a00000 {
> 
> Hi Shawn,
> 
> Thanks for helping post.
> 
> This irrelevant patch diff can be avoided with git config:
> git config diff.algorithm histogram.
> 
> As Coresight patch is large, better patch diff format helps review much
> easier.

Ah, thanks for the tip, Jie! Just set git config up as suggested. The
diff will look cleaner for the future versions.

Shawn
