Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231A33EB06
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954214; cv=none; b=gwXS3ebvrTSlGjUvdWBxgWkgGxwwDonpm0rtVjROfk+gLej1Nea1m8U8ZQSTm1DAqKpo8o8Tc/TZhk2GPOOvTYRa1rwUpvvj9jWzn06BrVzsnRsVqnEjGQwGV3zbO4h/fuM0NNXnuvk+MJ66RlhUqSWrPFVi5w1iFGdoa/lLjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954214; c=relaxed/simple;
	bh=ubKoPgXQXHc3GSIxqcIQKnq/O/V4JDb7y8HEE+B3tyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp4pvpr+7W9kZJ5VWOW/+utsrmVQ8+KR8DO5tvB+biR5k0488qL/1JhSuOScIU+vP2YDamAqQVhvvwAAfQiKk6YkFOqdBBNXnfexRRusHzWe1lKvqCTe/mydbsuW03ZPXx2nkXZjujDmqRJa1ArZQDJu7Dzt+BESAiJR2GsbeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNcbzuvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9TF3+JL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNcbzuvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9TF3+JL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2CKKI1125314
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1habXBoGNYXdPzU08zG+15Pf
	ctcDvaHUapAr9Iz9pzg=; b=oNcbzuvYciqX4x+PQnk8vhSnLik434800wZwzpxX
	DIi0oFu+vlyp+pGIhoIUDrF3XLXpifWO61MIQjOjlFUGzB4gX0V0Uwj/LrOJlJdy
	slpWgE+QdgfnwvyUmm5Kl6fIvljkHjzNnKe3sU4PGSHVj/oxh/9WznT+4anoIJEM
	cqXAv4+HiRdzt15HKvkQEMBbGM+pyFpRkpEcOKWEpe7y/rFTNXqvXpD4yRzTPYJV
	vyb5otPaUewzh3t5D3VmLcMv+V+oU8IONgK99n+eGsqGx2sDluNLJVzGCi2IqXIL
	JVqUxSDnV0z3g9OHJIUQDRZY7myuYPSuhTrR4fLvnrV4JA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg82a68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:03:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso2209595eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 22:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791954212; x=1792559012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=Z9TF3+JLBNot+f11vIHn/whUrgC6WeP965g4i44DQ6YD+bpGYE2GUQFwt3DN9OQSEe
         mUpiXZ2YY/kSzKh6BCvX7uAmzYruAx4ViDEw6cuSmN15kAXUV5y4ckoPfNW9jMp4YI2e
         AA8tUUJULXIQHYpwOGT9cUAUChRknYnv0Ef+371NXevPk27s+y8ytsDfn5HMQYs8ORbh
         OAdS58cjnEhlkv/nC5RdkvU0c2bmt1gaAaPKBq+I0pfIiasAI7L2BZarohbwZ1xZ1iQ3
         aa/pTh71ONmN8rTsmo5dk+9cwdBueEFn7uQDdd3721njI38kdm6b5agJsuGUBAbTIyig
         3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954212; x=1792559012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=EbPwkVG8yB9c4oCIS5PPSx89suR3xEAnGu7SJSc/Af6HLeI8kYh+RA66zJX7kFVvNj
         F23mZGyQ+h3I16GD8MdrmGrQ4iLdJMyr/NMxkLSZcrMyalDvPHUi3Pv/B/EoUXMxSqmI
         N9ZrG2e9vojpAn/LcPgDTJH/zyrK8sZMzt13bpDSsXAa4GDZjr4XVN2AhPNAc5g3snvA
         PO610TKSrWENUvHYkb6kCVQOcZy3IO8PCCgmZ9Vff8xcU51hqSHE4M8EToJXI/cC7Z3+
         M/97XgvV7KY5FzHa95F1yaICDnRDrJEKO+n91jLgFWlYfyB5Q7XtkLi7O/4rG/qWxv9n
         W3XQ==
X-Forwarded-Encrypted: i=1; AKwUvByKBnoJTTtig9IGz+d7AOIMHIhI/j07ReP0+OAcY0qGXo1Z1BsDNw9jCDjqMM70CRZPW+vSAwxR7vXXbAKC@vger.kernel.org
X-Gm-Message-State: AFq9FYJo7jGQ+FP0xYHMYv6I74coPwsmp+YD/VP+Ppf2PAHy3kjhC4hS
	lYWkJpIeBjZuaxc2XEOkvxoFKpgz08FU0YvLLxBIQSGpSnrycfK4OqCyU1GShIWoiydiRKIuBoH
	fWhE4ICKebBcdntSqPCJ2uai2ogZsHQBU1RDVz3ASxLVS5zoDckmBaPM4IHfMmdV+eFut
X-Gm-Gg: AYBFou05FqR15TFhhpm0jgc8lCtYxL4+NQU8XqffYDYWydt+J8LPPh9wSLsW+vMj/dU
	uvlFjYkW4oCgn2c42nWDYUxH5PyMtiKl5rulB1zWkMV8rVfljGa33wXEyuJzqCuJLkMJ9ZUNGB7
	xuySGM4DKnQ9O2stMhe7ELB93t8oOwqU7bsV6VKXtTTJPbQ59CdMUTojlj9QIisSJCm5VZobiUp
	nW5AlnDdRP4rL21hSWbSpUK3WLtSWYbXX0UfxHWZ9GTUyBAnL8BCDnUTVejbICiIKPeedWw4KKk
	lSe6Zq+lUz72J02aXPSOlByd87zGNVbbl2XnS5uof3IK4Lr3Bso+onz6YwXOdt+Ejet1UXk5p7s
	SEIhL8SdUXkwXH2oxOSBzuk4lhaXEnQmpQHjPXKYsQLNywtkEOb7pizkIaQc1poNnl/jkeTrQcJ
	8WYgZvdUcM1+BqC7+umB2EmhP0OEU9
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092259eec.31.1791954211956;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092224eec.31.1791954211451;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm54827471eec.18.2026.10.13.22.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:03:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:33:24 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Message-ID: <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
X-Proofpoint-GUID: lD_Ki9GnRqOpwH2tW8BzkkjJ3-jlyOd9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfX56uGKTPMdEwe
 9XcUsJ6jxybwLt3PXDxkSYDn3I07ZfPlHeqncexp+n3MrhPvap2zfn12lMHDocef9sc/IMDOh0B
 mmCjR7fOYIkyLFs8y1Poy/pPFxQSVbQ=
X-Proofpoint-ORIG-GUID: lD_Ki9GnRqOpwH2tW8BzkkjJ3-jlyOd9
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acf0d24 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q92GnTf-AHtPrQ-LojcA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfX5Tn9EegR1Z+o
 cLB+6sGGL8vKMRKZzbv/11hvnyYYSokodl580OAOCv2iR6TgTcLi4XSFk8P4yIRERLkQx9act/0
 /Yxk6ug4ra/r3x9z3qDTS767O+KSAzpHHfX6OgF3VeUriEeIlela2AkECv/g9QhRg2q5u4028FK
 XjMUrq1P8wUFj98DyrjEzVwQqDy8nlgGE/sxJ/Pz1R8EF4uF3/MDyA3x/GF7e3hXju3tNq1C3Tz
 j4fO0VICStVlIbsIaDACBMzeVRHOrxF9z9fbjuJMwmERHMyiQwlx3DEWzbEvKqxSB7eLD0mqkSV
 FlPJb0mJnrxieesHRGsnVE2aoL6vyeupBqhocWsst/xS5JZXC5YHhr2uIn7QutlbAHiFl9yQ5xe
 uux/aC+7t4mcDBSFlGpHB1L7VPdDIn3AepRgcx7cX2pfaUOxL4QKUd0ObVblLUZwRej0BwtdWJb
 n4GS5Gd5UXBZtPUj6tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140019

On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> > Describe the SDHCI ICE register region and clock, and enable CQE support
> > for the IPQ5210 SDHCI controller.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > index d28d68a10958..c14b42c22616 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
> >  		sdhc: mmc@7804000 {
> >  			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
> >  			reg = <0x0 0x07804000 0x0 0x1000>,
> > -			      <0x0 0x07805000 0x0 0x1000>;
> > +			      <0x0 0x07805000 0x0 0x1000>,
> > +			      <0x0 0x07808000 0x0 0x2000>;
> >  			reg-names = "hc",
> > -				    "cqhci";
> > +				    "cqhci",
> > +				    "ice";
>
> This should be a separate node, like on other SoCs to allow things
> like frequency scaling

Not sure I understand the comment correctly. I checked agatti, sdm630,
sdm670, sm6350, talos DT files and they have added the ICE region similar
to this.

Can you please suggest an example, will follow that.

Thanks
Varada
