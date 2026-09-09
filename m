Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768EF3BB673
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987468; cv=none; b=UrN1WT+3fOd6YHc8sIwBnqcfqMXKcHavhwqN2KXMOeC1uDcf9IR+xnob5WAsuLCagjNXQwPIgOgXs+Q8gRihEHhWsoJ8bTk9NV/PpdBTDp/2grqRbc/dBJ+cULnygtCTMZPTwa4fHnU/UBP5OXNgY0qopfWyGWTLHAKkv1uEBhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987468; c=relaxed/simple;
	bh=BDmAOXk/J0il5WGjLq49F7s//UAnHfnxlMZpGTigT3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZCO646LNlCO8MjsQKsrluvRc4SGoAArZLTiqeWnhqUNGA9dt/fcxMVMk7XSqthJkyzTM/Ovg77jh9bcxCxcQ+gb4Qx87jRAGRscmhKpVXIU/iXXvfLDlW8TKh/CmU/xLgRyAmSLuOfxvQeXfpNp4IN81tLgcDhRoIPIPG43kxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBQnBnW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W42BUMmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBQnBnW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W42BUMmb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JIb3x3219932
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 20:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aD1svCqhonHuEhBxqeD/lMr7
	ELQWc/Ex9Uh61jsKr0I=; b=XBQnBnW+o0JuCdB1nHL7fsroyLQyb4ry0bYaN3EI
	ZTdLoK43rd2Apyj64z62cFGax6reUMgTQH3xkaLqf+WbKbwP1yQ4xRrEE/SQR//f
	7ZRSfPC9SPLkHGrP329/P3RkqLBSt5QUQ7GWMUA0GIy4Ev0ITk26HGULM79d4/LQ
	Zj53VfleseFH/KN1lBauIOMoObdOCgLv3IX8uLGODFfd61SyfxOPoNKFLfIWZcmt
	42wwSamxdxHFrLYmw7OHxa8LLYw5ts/5aKJJmTwmOC0AwGfI7gpYXLpAh1vRcqjp
	hfo7U4cE+5iiJB8uhDkC4gP9MxtlfQU/aDRoUB5DRV8/ww==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg0j8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 20:57:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9cc5ac86so579995241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788987461; x=1789592261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aD1svCqhonHuEhBxqeD/lMr7ELQWc/Ex9Uh61jsKr0I=;
        b=W42BUMmbttSeyr/3svmpL1DuZbA7+Ky1G0LiZGe8NbedZBiMpPSS56rGYHi3SMIszY
         p3K7220AzJ5VD+kpxhaYLEvQ+PKQvU++rz9XX+nFkYNCEFhzH/GgJRrWU1h5PBB6jy3a
         N3B6tEFciGMnWO1c4piJpwjFKQr/Tc9hTWRJZQOnjWKHILbEKEBoyiXC3hV12ivvMNP5
         0erGZCusyVdJHYuox9FIj4Lpa4scUcJaAsD50KWqLIyZJEqe3ueFBMGWYQ2xR8Y+riga
         4VG/Qpi4EVDhkD7vHy/PL1Edj5ZGOAcfm7z51J4titeF2BGaIOzqVWSPiWJYf7UW0bfj
         voHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987461; x=1789592261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD1svCqhonHuEhBxqeD/lMr7ELQWc/Ex9Uh61jsKr0I=;
        b=dTbuu5xbdIDUvNCXqZcxj4qHfg9hiUe5PVwDgKxhx/LM/0/ZyMfHTNCANxw4EuAiFy
         Qm1IgF1hG7I+fsWkQ35av3QvWSlD+K65LbYj/7PJ8QC2Am7Oz2HQxaxjiOtKxB8/yB1Q
         ABcCCwnwpy3enlZgmyzA/6OigwLqUlGP7LanpaL09aa4n6vw+ccfsR3omoLS3EpGpyXO
         UeUYsTlObZBIh6x0azCmr+o1ttTV6CJrG13Er/1ziN0sPlSg5ViYX9h7mtqeFwHRfheN
         M81u+gKByim2UbxNF45PDSnTmzI+OwGffvFkOHS4BXRSpvSrL98dRHyw1xfSOhJRYWqQ
         FjSQ==
X-Forwarded-Encrypted: i=1; AKwUvByCo+7L7819YYDQnrlWqZ8VcJLmDawrtfI6uw6OMcmae78S4RBYF79jOA3WWZ3CGsQL6AL3/zeFs+Uc30Pc@vger.kernel.org
X-Gm-Message-State: AFuF++lQbwmuVvH8Pn/UTwPBfNSWKhU6MJAXt6ag34/M6aCD1tC1P0z6
	LQgudEIPWqQIowHdyuxS0xudpQlUnCrXf624cQHml6Wj5iEkmv7C7M2xJ8M+qTD2Y/FzAL9ZRUM
	3PhCC/LzYtDm1RUQUQAyE5ga4o+SodgcCXnjgHxRl9JPk/JzxHGP9/I+oIGtRgYb8bKJA
X-Gm-Gg: AYBFou3uYQuP7v7be+3XhD5GAde9nVaZkawsOU2GnRPqfNIVBOnWl3hUf8kytxYG4/Z
	F9WQ/266jxdoVjuozCwBabxLua3N8eyL0JsUbCvC/aX90HAFKM2wK3yMZ0jX8e3DBOx9K0yqOkj
	Ozom9HyunL8ueCwYMpPv3VrVEFj/ox17BIpb0j5b/2ULo0GZxLja6Yq2YXnWzTrkL1l0ebm8Lph
	dSNd1Wc+H3uuyMrdWi3B4OdpXAUr5qRqy/Jk8cNHQ5hr1E7syc1hg/U0BhMIgeElOW/UklrfYpS
	wUxXmwpGG+HqrzUDvuzqsve5awDTXwAuisnmr9z/Xl2Cx8IBdQmTJX2JX1vYrotD5EoAPUlQym7
	HWEsZfrMDn9i3Saj7Pp+lOWmkUFCIcYFmUgFQxDsAQ+BkMC9VjZvNoYPAZAdvBULZ+l/mfwU7ml
	rIICi9pSS4bVkx
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id ada2fe7eead31-78a4a8be7c5mr16080312137.2.1788987461371;
        Wed, 09 Sep 2026 13:57:41 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id ada2fe7eead31-78a4a8be7c5mr16080274137.2.1788987460865;
        Wed, 09 Sep 2026 13:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765bfc42bsm728249e87.18.2026.09.09.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:57:39 -0700 (PDT)
Date: Wed, 9 Sep 2026 23:57:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Message-ID: <dulfxazlrtqc4swjeuxmriudzzm23z3wea5n7tfflaeb5644kg@6buydclxzmab>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa1c846 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=JqCuCV_VPJ6-B_cMBtcA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfXwgywhvK44csv
 ZKkd7C/4AK2P4Y9H4Cs2jjLXnHJMPqo5RqxFmsafxa8kg4QKjhMnKjhsW4A942PJC32DK5qKsY1
 HfIaa21V/ED9vvH1SsanRoSbdz/x1P4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfX6oi2B+CIB+l8
 YNdQYNvOcy8iHqPUjaxIYTV79iqylTSnb0S9IFgmvTtvMssoxIOKqjzBTq2Vk+RpDtIK1VYwKME
 APdAtLO2/4oK4xqgMhqulLlinEtN6pU85RF7bVgVdpNSL5tMOpcpCaQ8p63T8dWWbgw3/Bywq1X
 SPrzGRNZiSi5BVLL6sq4I1r8TM+S4pOR7J03kXQi4LfC3stMoQ+TXQ6VWoCsrhHqgsxt420aAAv
 IrqW9jP6o3nlOH416XxJrJKFdxKpJWJf09vO21xEv2Jrc59wFC6fEXVdRTezS9CqvyeW5vsZcsc
 D40sTApzg9U+RuowwUfWgtPoqJZ60VRyOybHI4urdS7NshQOGMA2h2/NWm8qZ1hj63NcUoH98/Z
 pLQlAn7uGTNzoyXKkYhz6K1LaFWrYGyOP3B0mYRhtSimhozjs85zl3dEK+eMZrXwJnCUPuFqIfX
 N5mOiK+RiC1/ZpkWbdA==
X-Proofpoint-GUID: 1ACwNn3D3FPH5zPxmAvegjkTb6OHJum7
X-Proofpoint-ORIG-GUID: 1ACwNn3D3FPH5zPxmAvegjkTb6OHJum7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090235

On Wed, Sep 09, 2026 at 08:27:09PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> Update example to the subnode form. Doing so, it picks up the supporting
> properties needed on the video-codec node, address-cells, size-cells and
> dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
> with address-cells and size-cells as 2, update the video-codec "reg"
> accordingly.
> 
> This patch depends-on:
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Tested-by: Daniel J Blueman <daniel@quora.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 118 ++++++++++++---------
>  1 file changed, 67 insertions(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..dd80526838f1193f4c9105793ae4bf4fe0755ec2 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -98,10 +98,10 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
>  
>  allOf:
> +  - $ref: qcom,venus-common.yaml#
>    - if:
>        properties:
>          compatible:
> @@ -150,70 +150,86 @@ examples:
>      #include <dt-bindings/power/qcom-rpmpd.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
>  
> -    video-codec@aa00000 {
> -        compatible = "qcom,sm8550-iris";
> -        reg = <0x0aa00000 0xf0000>;
> -        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

No. The SoC node must go away. None of the schema examples have it.

>  
> -        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> -                        <&videocc VIDEO_CC_MVS0_GDSC>,
> -                        <&rpmhpd RPMHPD_MXC>,
> -                        <&rpmhpd RPMHPD_MMCX>;

-- 
With best wishes
Dmitry
