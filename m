Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837E2DB794
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957008; cv=none; b=mDsw+C42DW4E641Ntx6IY0r20H6myWK/nXl5faCG4qU+4LUEij9J/dletKArdKIO39ejjURg9LTpz6rZW6aHjtX5zDoxohT+fRKcozXeiF5ioG+elO1s3rHMDTDx5OcQhjvbXxjeG4N5lxicuUXcT9OxOzHFB1WDkDhNzDnK39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957008; c=relaxed/simple;
	bh=5R2WG2zuzdSzT5XoOv8B9SYH83ZjxW6UiJ7HMT+qpyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF3QACtyCE609k4sD4T7FQHSK0qVw3zvN5RNAp/b0KZNr9HgeCgSvokBnhbVGJe+Udv9qhU5i9eMb66x0Ufz+U8vpxL6XMJR4y6sSLKmNnMD1OyyHMrDGQZ0Xg9KM52ThJ+ZVKOKOpzFVjUA1CwNenHGcVlzAx+TvaDrGOS2jnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eltp8QJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtFdsch1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eltp8QJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtFdsch1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGj8e1877923
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 16:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nH3qF1j8aNiagObAJdwRA6oD
	RFUOLGKyMVWPWNBWPpY=; b=Eltp8QJEnKJpzba1zGil6Wiz7FPCbDadNsdwwTIH
	mqTqa6060VTkMipW2uMOLWOeEM3t5hCSod86knNT8P6E/6Dah5zGzqLVFMwJ1Adk
	llPGw+mBah7kBsfPjblrukQ2ZGL5i1KTdvGbu3ZNpzN4w/mgAQt0X8qj8RkU9MYX
	FtWMAGssCoWv4LCw1DWhpYO2ZO6PVCW2Cf6kZ/cYqapL2KcauXPD91QA0Lfbnr0W
	dED236+MR/c1hyCM777wbJTaH28BBHnrraifZ49eM+Gwk39R++qE+EbPcpI/OvkB
	EHwarEfoURdGxyNPwU68idzDZ9uEUTfOYBNjjxbgNuTm9A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tkxcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 16:03:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0bad5eb7fso246203137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957005; x=1791561805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nH3qF1j8aNiagObAJdwRA6oDRFUOLGKyMVWPWNBWPpY=;
        b=EtFdsch1d23t3doGl2+lEjazn10Ct1ob7kg46RZsM0ndZ/uXhmaT0Yn2Rz33pCRIT/
         LN/5MQL/M+B1h13QiaCJcwNlW32xRBg6oqJtUpXSm5IDKsHFRlAe5iOMGkQuJTNLtxu9
         guMhrKj0Dw+cFnhNGS99yJ+oy0y7DdwEAenYJs19eZu98O76vM97+8gAWCLOyo9hoDSk
         AtbxrkENJAsC2wVa4pAI4YYfmrQSCXNs7ebsOvFJctwSlyTeuzQu0y7rzVZdQUnjCDUR
         NGWnxB1pYWLNxfhTpTYaWiPEisgRLHQBvj4MUXqQZeWiZxc6UmRE03P4ZhVQUDFEmqis
         QxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957005; x=1791561805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH3qF1j8aNiagObAJdwRA6oDRFUOLGKyMVWPWNBWPpY=;
        b=XtGAFZC3mKMWnNiANdTunAtlKGyNanFl3cr6XbmzItpHeA2+TcOsvMBt0fgbdOeatI
         /v/jvfz+tqZKkpojmgVjfYEgtuyjGX7fYuLuLROzjnqw6nG9U2Z9V2vivtWsGW8u6rVl
         sVoM1ZScTEIIUWjEN9BXJ6FJuyCNjjJ9NEMbiLLrjh8tayWhFajaGClFBM5Krsi9l3+p
         5nWv/P+i8O4kdZrR982+evB30mTbQft9B8Si0Jbs2BAhpnEDYZEMXT0BHNYgI0jkTNsP
         725zGR26ETEcq+fMdjBInj4xH3xbZxfDPKYZtqhp9MehOFt6i4DcUVEMxbfwvmnl4WA2
         /UJw==
X-Forwarded-Encrypted: i=1; AKwUvBzIqs/DDtOTFurGY/9O8QrZ8rZI+zJNbU3BPoFGVsq6X6a8l6Pu8am/YiUTG+AV8nexefTeu5Bd1/aQYRlw@vger.kernel.org
X-Gm-Message-State: AFq9FYI020OGEzcwaWdENUECB+5CbEx11u5GHgmqYDZkXdJAtTZCwQeP
	I3n8Eq+iHeHUdMhM10LaMgYMLLzUa9rwbnbDaLcRC5AipzycTtsZPHqY5h/8TWqXEu7X7mmXwMo
	l2DV4SXGs+Ff3BS9M307tXsF9pW6IF5gi//Fi+gJ/WRsZuIniYEOPEaCidzEijHaWzLr6C0TzIm
	B2
X-Gm-Gg: AYBFou1pQ1zyJno2SyJoavYCBL587KQCYdwi32v7tidlUFBLOi0qmp/fuT+vvQ2HdLZ
	5C7zEIo4/X7zhVmJqjP3TI8C8RXrolGYGqILzheqHeETpTiJOvVvOMZ+VdSL+W+Zeq7rMil4+nq
	d31N7t9GUNtOwth159fVGcb1Fih3g5+120gZZ3HGnPDbokSxPZL2/FbXa29IwCJolEwvfKUHJEq
	9CvyZTW+M6oj4TV8QWZAz7L3Tc4pofDg9OCHB1Ceg+ppYwry0mz42sf3+zTIv4mUucp4Tpb4BB/
	DTOCxSXFP0CfWjAhtNiW5JMn2f6AQt4JLsY5GdmbQsZFBTqaCMJjlh3ZJsIwbyWcyyhu8c8qy+D
	xtTBPbnDXLhWkv1m1aJ/HzSzBglZkm4iJMl14zXBsnOyxeMypiHJEtTfObc94lspDMMDJnF7EN2
	ymX3BOJHNywy4y
X-Received: by 2002:a05:6102:d8e:b0:7b2:cd8c:2b1f with SMTP id ada2fe7eead31-7c0f2108082mr687152137.3.1790957004966;
        Fri, 02 Oct 2026 09:03:24 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:7b2:cd8c:2b1f with SMTP id ada2fe7eead31-7c0f2108082mr687142137.3.1790957004479;
        Fri, 02 Oct 2026 09:03:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bf157sm830664e87.83.2026.10.02.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:03:22 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:03:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
Message-ID: <updpxvguckjxn3qp3xzu7e4xah7h6sodoufp5m57imtzjeo3mq@yrqxib3jbi55>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-GUID: gQ78beXSPIoOHMIRi5e9lcwONW0drLq7
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfd5ce cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AG5diU-uafisgQmFzkcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfXxdLQuOjuHHzC
 7CqAmxGxFvnNuT8iik4CLOl8ulm/ZSRTf0e2v3hb3A2pjdDbcp56zBAh3ZcKdxoIRjqTpAW0v0h
 Nda2q1EBz4PJnvP3JTO/yYO2pF8WgTFa1SL7AXJttlu4ZSU4IJpGcBwQZkvVrrB5NTBLtVxSq7V
 6wGJWy5n9Oa5hf1k8NIMWWA9eXA7Po1jdFW+SHB6tZt8VdQQPBgFpjLh0KgpMixF0igruSoBD3n
 KkbojlQzb92gPB3n+2/R+TUgYG7tafv6Z1vYo4wFKeEL70OHudA0DzZaY3T8qAUZlmrFSOs2xFE
 jCRDVMXGHT3m9j2HfCCvWtPoL072F5WW3jVd9aqrVo4Szvgn/kZR05o4xoAw8CRpsIgdME8Cu1R
 HjE6RsQQGUTeAgdMu76JkciYvZmeMzseklQNCI8Z4uoAPFr1lgkOLDarL0L+yOg9PelBc5wqrmK
 s8Of1w6Swz2GXOyObqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX4zCbdVKiPT03
 ryrcF149aHb1NUgMLGY4VyW48Orvfa5Gm2aXnzPKz4HSsrOM06M0ptjF59RITeJg8GT12O+L8Oi
 o//55XFtIm3gZIpMVutZVA46Qe5qYQE=
X-Proofpoint-ORIG-GUID: gQ78beXSPIoOHMIRi5e9lcwONW0drLq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020063

On Wed, Sep 23, 2026 at 11:27:57AM +0800, Wangao Wang wrote:
> Enable the iris video codec on the hawi MTP reference board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> index 7709582491f9d426886a6afced6d3706b629e620..9b8616221b9c0d227f2ec97363bd4c076d8dc247 100644
> --- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> @@ -781,6 +781,10 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&iris {
> +	status = "okay";

Please mention the firmware-name here. It might seem redundant, but it
will help userspace utils.

> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
