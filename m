Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491949;
	b=idz/RjDmVbiscsRXSf7aTfqIHUK6Q6tGWoLjDNu4jGu6QMczN+1p4SZa4/07nxgQK7bc
	 men5csb6cQt9c4jd487wlWjjkYTy4da7F+6C259PBna0+CrxBKOMKgqfZYMiQxPgHXMLP
	 Wdpfpi30OF6ay26TTfmQ0038px2Roy3t/Z5rqWJFo/uGjxdICQfCeM+60AjO3rRsNwVFU
	 4v2ujJxrthiSh58UYr4eooxip1UBKKRgGmrjobgisUfr/8YBWabQ+AeEwrfRrSW8Du1fa
	 RFAQxTKW0yI8VR4Tgu1/TmeYXKO4Lt0rn8u0fL0nqAVgAMMHEiOBg6JfMPs9YIq6BsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
	b=NWNrP53XUzNEOlip9f0PnrqXB8z6kotTU0KNjpkeWg1hOTZu8IrNC+EXmE1OD+i6V68l
	 j4ptJb00XAbYO2mvppn8lfbo0LHi3VqUk8mIMgerF2dY7OUq1X8NqM/6RFe65IjepuMHR
	 Souz76SbA0cZ052j7vGF87puotACw7hidYaTO/QsEMzCnVMFio2sfIZUKhvrHO1+NkvOJ
	 bdeuLWvo/9g7intYDrEaVr6GTA7SvtGOksHAHkXhHzSNDQjTg9ELNd7b4Gia6dmqodXQZ
	 wgd61gJiZJpnAns30PUJZL4x789jFPzbtXIlroAjganyH7MQj+xYxX/QgDhNOuo115g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9IbTmKn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5960A260C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C5960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9IbTmKn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8XV2D619934
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLeqBaTgJ20aTc9spiaAIGrY
	YecfKuCtitYoCZ1tdAs=; b=Cb56eWOgfpOLdx2wuarL92jytqocs3Wb/IfJOJ+n
	ywjf2DWmupscEzijhRAnP6mg7ec9w3B5lX+tRC48KQdVtWyDOGoUGs6bUMdHmUNx
	E9MgKujWpKCGjKkN4u72lnhw1jmpbgAUOhJj98MsYazjPmVxB5JdDYXbSAWYuUPJ
	dWaIFAFZUzURTS/f4hvRbq8MVes9C2u8XH9bI+PNuE3WNNZMadp/3qanXmyU4OKn
	EWBAGspfIVLzRJkpDfDX1Ybd8MX/6rG45XyFFkuFJ+lIycMkyH6lmtg5GSp4LlP3
	P+XxP+ckB+J5FhfkQiqG2AoHoakxbHFt7ONkQuE0Gx6c1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsyh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so631116285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491948; x=1793096748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=j9IbTmKnlphj3HShphC9lSz/N5wdUnpt9e2Rf0htYnu8UMNOYdyo+WIoEy2Lx5KRqX
         1kJSbfNAwbwAKvPrxFFsj4kXsXJkVvl14JFwjX2qzgbDJOHf1Yr4rBzTIJAo61Ay9kHF
         wGf5Dcy5ZJlRgmwuo4dDqXzMvbiIJhlM/vZMCGif1WDdhhpvIAqv4Usyp6DCeWSsYke7
         o5h/+DIs++c6rrR/5WTUa00CtSJx6VJ+KQRoTJWT6hihO/bg+dNwS+u2DfTWCHYRLttt
         AJKTRqdh4fKdXApSx0MI0934AiaS+C8hdfpMtkR2M+Kb6eVtVH/6d6Nb5wpfU7M8lTrL
         WWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491948; x=1793096748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=xlRM/JYAaw7YiADBtm+q40Ih4y8FAd/jKRpxwpk+gxCVa7KmlguGtUB0tcSM3AVpM5
         CUj9kSdL6qWFhv/ZZO5ymct1jiaklj4oa1saqDOmLIK1trRXnA0x/bgBv3CoOCxIyrVv
         fHSMiGHCEzo/+5YJFB142NVQHUlxip02rpvvmlqxRW909OrQa5EaWkUavKNK9Z+Nh9yx
         uEMSsvYiRqfZsf+Y1ySwc9RQXro1PjIbcPxZRZ7uIvNaz+QlUHzKJE1uWHZcoUYX4gU0
         kS2zcySbOG6gXYd2jsWfQjuLc8UDSn8kUVs5S8kn0pzV0xG7ehh6W1veTWcAhzhllGKb
         Q9gA==
X-Forwarded-Encrypted: i=1; AKwUvBy05C3mOZiItaJ4S1G3bvI0JcrzhQhRATG/cRUQMhkEfhLZ1GVm+xdhgKm/9/VC+/FR1Wtjoa9sOw+56U+K@vger.kernel.org
X-Gm-Message-State: AFq9FYLx6ZTktLR5pdUNrpFIKo7PdKsPSDVVWpBekzsWpJFyoI7wlP1Q
	GmblLXLpjOB9zpgYntFH9LLefhupi8m78xpl4j9SM+AARuQSTUKoss/AG442d62J+Y2hnTUALW/
	3Auq5B4y0FqszsxgDJ+u+APr5zW4IIkDDBuzDkwws2NRUVg70pUyQhW/7ryd+22sZetKg
X-Gm-Gg: AYBFou3SNhT0sbsVGeq5qOKEAezLQUdyjD33vRHJ4gb1gfoInZ5WpscDE4z+oLCnAT+
	aHOSEMxA+2d0s4G4ihwsMbjPhbewIxW6kfP1TTGVzCvxgy6VDur9AluE7J9gp7haGpPwmmVHElx
	U/Ax/kICh2HvKrZlii5mPEbNKbk8lTR8mtVhDFdh7ICOK6IRKBfkk8IbWjNE+NC93HwCXpEezb3
	faGyXqSOQoh9lRjiqQNqscZAOZIB7DPD8uiiPyYPaBDZ16jOY57/9uNBWUFd84fCqeG+6Mkx9gh
	CU7i6aHH0iS046pWKlGozx+hy6zXuArX9CsTyFd23+ztsCVgLtUikh8s6fMxyZ7ucFuKBTzxJzz
	iN0ILzT2pmoQdR3ubjm5YeBQl4ddbDt51a34Rtn7RoUcqs3WWxrBcYRtanbwDZ7QiJFdaMihUDs
	fB/2mr7kx/qYgt
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081445185a.28.1792491947434;
        Tue, 20 Oct 2026 03:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081441285a.28.1792491946837;
        Tue, 20 Oct 2026 03:25:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm28145191fa.1.2026.10.20.03.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:25:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: interconnect: add Qualcomm MSM8998 NoC
Message-ID: <guychj77ohhlnhzw4bcgglcfiwyppgt7wzd677smjbd777kmpv@s4bclghi335b>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
 <20261020-daft-competent-saluki-a080c7@quoll>
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
In-Reply-To: <20261020-daft-competent-saluki-a080c7@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfX2j89k2Y/UCO4
 PSigllRKj+soBFB+oXkGa1/xNn8zeY2A1OFqfNVLya5mfUxzCKAkgHV56m8vDTkW99hnxRAlC/Q
 +tuiSCDmcXFILjlKksFCUd+o7ap23lA=
X-Proofpoint-GUID: cL-4SY6ynB9GKHBh0yrukWJjdE1Jz9dQ
X-Proofpoint-ORIG-GUID: cL-4SY6ynB9GKHBh0yrukWJjdE1Jz9dQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfX/bJslFIKl+bG
 z4Ng5a9sNydOD9IS7IgiTl2WGwobt8geIP1FZYtvHypVMNB71sD/3/X+V3tb5ilG0m2iGtaXVWk
 1xHGeQSdBFRqYAGz8fryPJ6L0G02Q9xn+wMgDNd66/EfzKIfzKiNVggnuYGskyEel4VuF8nLBY8
 lFA59sI/dEfFESH8arYrVywlXeSpTeo1X3oZfHrsiXz+JrcBxhcokBWMgKVVdJ4hP+dri4TuNNP
 GZCcUd9nbr2Z4cAEVq9oQhKm8DY86SwZDhOhC8E1bqA85SY13w9Ux6WAE4F2M86yEIx7mJ0v8IA
 tzNHW6zgf1PbjscXgZscWosmpapRHpcFc4FfFbrBQB4N3QC0sdl9afnUHMHGtTM+pJN9bq7JPUy
 rSXMZTYpGqVSDwQDdVmxd/PUne+FZMQYbiB5ZtlnobMFU314PJAjx7pwvyKaXN6gGYwRmwzhNs0
 K3+VAWjHEKU16mdvUGg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad741ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NwY7b9YWZjBNx-CeCFIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200041

On Tue, Oct 20, 2026 at 10:24:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 05:12:39PM +0300, Dmitry Baryshkov wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,msm8998-a1noc
> > +      - qcom,msm8998-a2noc
> > +      - qcom,msm8998-bimc
> > +      - qcom,msm8998-cnoc
> > +      - qcom,msm8998-gnoc
> > +      - qcom,msm8998-mnoc
> > +      - qcom,msm8998-mnoc-ahb
> > +      - qcom,msm8998-snoc
> > +
[..]

> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> > +    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
> > +
> > +    interconnect@1008300 {
> > +        compatible = "qcom,msm8998-bimc";
> > +        reg = <0x01008300 0x77d00>;
> > +        #interconnect-cells = <2>;
> > +    };
> > +
> > +    interconnect@1740000 {
> > +        compatible = "qcom,msm8998-mnoc";
> > +        reg = <0x01740000 0x10000>;
> > +        clocks = <&mmcc MNOC_AHB_CLK>, <&mmcc MNOC_MAXI_CLK>;
> > +        clock-names = "iface", "mnoc_bus";
> > +        #interconnect-cells = <2>;
> > +
> > +        interconnect-mnoc-ahb {
> 
> I do not see how this can validate. You do not allow any children in
> your binding. Your tpo-level properties should define all possible
> properties and nodes.

This was validating because mnoc node explicitly allowed the children.
I'll move the declaration to the top node and constraint it separately.

> 
> also, name should be just "interconnect"
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
