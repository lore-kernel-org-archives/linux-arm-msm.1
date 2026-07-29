Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620542DA2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316273; cv=none; b=fz+NTHwZYajaX7Ilf1dZL4+YXLIV1RoYzNhRZuRuHA5atbSj+S7bsy7HSOCO5sA8wEradd1MfipNbKLW366KPyQKpTGbN4N/hrAbuK2PT9kkLM0T7DNubev5BMuYAI1r8ls0FRz1/sWegbCibwRMdW8+xYzWbkNS500DnTuawM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316273; c=relaxed/simple;
	bh=QoddJzJhebR8IjYCrkbLAN0s0tIW48jnNL4y2MIVi+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVtMA8dNPVrGCEtfBA5tZOkhkZ9x19soEVgc7n1j5aO4H2HGRJduSEGCiFg8Mkow9FE73o0EQYnZrxbad9cA+fCxZiDjLrTDWK1GTSVzP5SLfpJYMy28yY7Kp9HSbJwBpbqKw5gEm3v2lFu1fa0H+39+ZCZBTkhrUCnMgGmY3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olgukxVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkezUdmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olgukxVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkezUdmv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7feGP1054257
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wXnburUlupRiHpSJ4CDRreFD
	5mzaQY+gxtna4BDSfRo=; b=olgukxVmAsWZ02LcXQwlyT8bYAehDVFa3R7kbCpe
	DakOUQidq6ip4mUR00onnJBM4zWYIk5wcpYS1Iw4gQjhjvgu5ndOyN7NMeEUVXji
	B4Mqf8T4+ZSuwcQQlfOcEXCYLcZtP+HyHLNrx93ael2OvAhZVYr9lG1lMlj6Yylj
	VtSRZ8ia63bA5kpjFI5ZbmKSfSt26FQvf/7un5Cm2vxsR+3ANwMdX6sUXGCKe1Ir
	6aBcJO9ZBNaaOhxueO4fjxX2x4qD6nQqqaDFBOSDMvuX00rqJLtKs9AF8nV1R2W/
	pw/uISdOUS2rbhY/+Gsi2YyWBQhAo+8TY7O7aBGMGhW97w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa3014cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:11:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1225807a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785316270; x=1785921070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXnburUlupRiHpSJ4CDRreFD5mzaQY+gxtna4BDSfRo=;
        b=fkezUdmv+7DlD74zMlqjvarAuJrxM53YW31C0ElV5QwQkwpI/LmRp6RO0TyiOThKRV
         CqCHoUtdruRGlSxao3k1aZB4KOoyovrXyP/8pCRnFjAhYnursJ5KdCQcEA5wApjGhzW2
         diJ26vciKisW4BYz+cM15zvGFQdhcQEzDWYqDez6OfDDKEXB0M+yOXTzaYo7okjqeiqE
         bc977GK5uROovC/bYOmO3W55TfqRJJQ5Kexj0UL7gaY5G/MHWfHwnCJd2FoijRTJgFJS
         8w3Despgzn+6Jx6pTfocFpuAmH49iMppGB4nk+FfqHg+1vWRHdVbKHeWtbYay1vNDoNH
         rWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316270; x=1785921070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXnburUlupRiHpSJ4CDRreFD5mzaQY+gxtna4BDSfRo=;
        b=HSn2ZVVS1r3KPfgYUsJmw1J5+1+O8m1A1YwlvzWYnWswI6UR+EU5qIGt2dGO1mGKGf
         kAQf/qXyV2xZambdR6qrrcMxuyu+PNTqpsbV30PxSfNfX5VCAdBxf7uxCRrilyMIKeJX
         +v2drsRryXFv2FGUSMUt9o8Z3iWUOJttordYgawezW/ZFA4iz/OpPdX4KqFvs4l0e9rz
         TSABZ7SItkmQ5v/EizU5srOcDfWgwvok+xuYrPbv8KltaELzV1PGONAzBWigrXbeBUhg
         sjF1wnrn3tAYv7WsJSLWkZf7se9UBwtmqR27GT7aSHQc8mSNyHZPB6wzL8SXZP/ZmNQ3
         gt8w==
X-Forwarded-Encrypted: i=1; AHgh+RpBvYjcKRHvxerEjpyiwN1SRaXmN/8Xv0vIStCOloVCXrvAlfZto2hpndihYQpIPryzU/4cpZIQ1fBnDWCM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxr2ToxyymgW7sNynTABIDwQ/vhzOOtddIjZWTRbMWT4W8TbnU
	PWeaxNoirkilKFMOA0of1L1DkKB21lSM5Nt65QvNkew5+5TEVvYvDXvneiAM99PuBTCN7sWOI14
	woxCGIRTff/wH+Nq43RybbPwxAU6+3RyH6ewoVy4adLZsScMDUkK/OzSXxfYcpsw7OoRp
X-Gm-Gg: AR+sD10b5nf8dqWwOTEGm5aOgHVaouNhE1ZEGVG4h/4Mm0MShMAjDqMaVElEwO/DDEj
	qFA2rld/eBn242mVHf6e+SYJ9dwTPQ/y3WKvGnHVDLpkl5tIR9OPAsiMpH9lhKPcAbktKX6B3Fb
	jyAynXcUz/uVmVtL8auIirObbZcqVAewyrWZcMnwioUfoY4Oi9I1g5HO0nQA6AxmkLOf5dHtrRX
	wvYQPIdRjV/WYnPeweL3uLvLxjxP0wwiIR9x35XLyxByQnP9qgQE4Bh+oPjNy16fqA/fIogu4MW
	5Crg0yiEevzyVj0c6glzShp5vTfAiEiD5RvGHJWvmbUstoFTnU+l3oHXMqcvzW6pl37OLW/WgIg
	4tPMqDnqmeGSIix6Ith1aznsnVRRkYGsMO0STAA2W27jivdA=
X-Received: by 2002:a17:90b:17cb:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38f6a5430c5mr5909556a91.32.1785316269605;
        Wed, 29 Jul 2026 02:11:09 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38f6a5430c5mr5909528a91.32.1785316269144;
        Wed, 29 Jul 2026 02:11:09 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0edc1csm1058184a91.3.2026.07.29.02.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:11:08 -0700 (PDT)
Date: Wed, 29 Jul 2026 02:11:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
X-Proofpoint-GUID: BIAmRmdDOgW1wUPYR6_tMsnnvh6ufWw6
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69c3ae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iYY4eBxCTIKzZHblZ3kA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfX5xBXpHZFxm13
 RkE2EfHtzhdrRxdHpc1cvATPw3v+zW3HQ+Du/7RO7a7YVR4RD3TFpR0kVfMIjwCNolFng93anLY
 GOKBVMoqzTzZYWwLcS0ZiE5RTrLQZI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfX5GQbCSPKxtAN
 Vqt2LN9HUa95sIturBmPcbmJXcxwEmFJ38NhChZcfQBmDIyXX/sx4u7wfVNTyT1neMp0hZB7Nt7
 wYeUosPLGRNx8qkDzUxSPp5od8Mwa39EMJg0TvFeQ6u+gvoO0H9XN+KUN+kA1zhnhoUKRNjHWDT
 OeausAUV+skQb/9EhfuK6XRzYHKyEBoxQCPXvqpc4GrmOHK92fiq9C6XR92hgrWJpEfHY+csKXt
 IuaU/KZMLX0EaX3K9p+s9n9KssMaH1hrt/CclYryiZF6ki9AYN2INqGVL9fTdkLDd1c8DD41nb4
 eKVDO8/qozs5PZOFxhj2fkwbNP8H+DgAWnnyJ0MbnK38F1R9qKjmhgatPkWmiHF8MUZZVXv3H4I
 xQQ3XdwBXv+i4vDMltoHkNb03Ed8FgW64DA+oFQykxUmIzIv5nibbcc5lDFlaAusoK0bYNmHEJa
 WBGiIIEvyXIxgB9mEnA==
X-Proofpoint-ORIG-GUID: BIAmRmdDOgW1wUPYR6_tMsnnvh6ufWw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290074

On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
> On 7/29/26 8:45 AM, Qiang Yu wrote:
> > On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
> >> On 7/24/26 12:01 PM, Qiang Yu wrote:
> >>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> >>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> >>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> index 6125617de82a..0aae613a33ad 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> @@ -28,3 +28,11 @@ &mdss_dp1 {
> >>>  &mdss_dp1_out {
> >>>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >>>  };
> >>> +
> >>> +&pcie3_phy {
> >>> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> >>> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> >>> +
> >>> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> >>> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> >>
> >> I'm guessing you also meant to enable it here
> > 
> > No, we need to keep it as disabled because pcie3b is not enabled by
> > default on glymur crd.
> > 
> > See the fake pcie3b_phy be dropped, it is disabled
> > https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> I think there are SKUs with dual-NVMe that use it

But the pcie3b controller node is also disabled, should I enable it in
this series?

- Qiang Yu
