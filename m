Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199441DDF4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005975; cv=none; b=CLCVQRakE8w/kYMdLJmB2eHQyV+nWow77wzPVYYAjRfWfeyC1oJRypFSxbaxQugp3ROO7g6rUTO/xtQQUwzVqTPQO4lvmrd0u8xlBnI5/cg54AI8w9e1xfRiBcayjER5hk92isDu1cLkBPKNrsVyuTFlClAFitljqdvSTY4ozvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005975; c=relaxed/simple;
	bh=x924LvagBvs9zGNGovI+PJGXhMYenuCHaOCGGsy5L3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXlICixGiOEJueajThNze59IHIT7pNdx9S/uW/3Sxyfx62b2IT/U244p//UuiGvcrWp8nGu1n6YLWUBQRqB8EJC/al3jnm9VMaayzVHOb64izVaPE+U8kmT7ZZ/8D+fZejw7Vki4nSVcbN+KqSIBd4+syP3xYNv/wniz0BGRwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2fJd2Vn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIV/WCQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2fJd2Vn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIV/WCQ6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767eI5s1354133
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z3U+LaXgyAfHEPCwvvkxr+LS
	jwWxPhlVa1SScnQkLRI=; b=J2fJd2VnkPqT3Ry79LyPOwTAX2NC8jUftvABNehh
	TNzK1sf0+MulSuY/8XlafHP9IDt314NTvFQYnNuoAGNqYzX035pcyQ5Srit6gpOo
	38WI9LcQXkY80Y/JAVWWNIUXiuIvklZ1I/ZHoMIaKZ9sVf/2i5vu7F0MXeTRirkq
	5RTg3xCuODqZwDqA5Qy1t79qhVpIo4DLdMjBhyHpek5Rd0dq1OkPfVTyNgS5ZLmP
	sXvPp2LjAD+jTR86+VhMl+nUyCElATyfwKXMMZAPxnw+eaonND7HRKwGOzSMCu/G
	ej45vC2Rtwuq7e9A+5eb3bsGmWss6/TS5DTAFkAJt6Ob2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmk8q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:46:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso19459801cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786005972; x=1786610772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z3U+LaXgyAfHEPCwvvkxr+LSjwWxPhlVa1SScnQkLRI=;
        b=hIV/WCQ6LtPZccw9XCTcPGapYt0wRYrKsGhsrA2JmgIfyd98HcQhjMV2VRpe+6QcON
         vaHwvy7hJalcm/TjCJjTiff6PkYkpB68RG34TvDZdsYZincIb6ABM/zp39t2Qu8WQksO
         Y+wzt9zykb0+JRs0QrU2TXxxybAKtJHczkHh+3fAHy3clLxTxgodjDd49UL8hXNPriad
         Sc0LrRALjQqwb74oA5onGO9c60w9hfxTJVDVfl2JyuBZHjdpsXIeE8Km/HEq5KVnxBXe
         u0zCysqHKcTQthY4Dvj1zDZut00lGEqDc0iS8/fqQUz+IvTQvArukBprcJXw5IgQ56QN
         AyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005972; x=1786610772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3U+LaXgyAfHEPCwvvkxr+LSjwWxPhlVa1SScnQkLRI=;
        b=a7h9WnYHs1z2gzq2vIwovX7ug28Bp+pILlhVVaSxQ2ph2EilmCx4Q8nCD0Juec3Bjf
         0BPGQ4VRsWXcCls+Y98qgqHRMuG5L/Ul50kElREbgwGvMoIGlOYRWfVNu1IzlvvqjnpS
         PRgqRQGJg9NVby7wEOmmkkZWcl/uFCZ6zYQScn370C/xnoCKsl+eclAmQFf/8FG/Ksh1
         xqd2l5V6PaS2jmqktrE6Uou8osp6AyDxeLQ4FDH7aY6ijBvblHDv+6Mg2l4/WP/xOeoy
         vMYasD7RSNo+DW/jnAA40+sSjM8hXNC23sqCwhjGQxpCMr5EWjH9eIaFgHINxuHJDNPg
         dMhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw25xDP6W0NQYI5HIVr4YkrojiartP+qxt/cfsTn2rI7ASEn1A8eMm6pB9cC7h1x9VN7IXht4pZdbsTRke@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBt4P6Be9+vUiO8E0ogLoADH5a77k2pD8ZbHY1xuIH1d3K3N4
	G2cPwM0bfPB8m5rZonBA/3P11FwxKdS1DPhjfIFfG1VlahN4AZ0M78FmUnjCWj5JeGVi2C4Ti8f
	ogKkotg/xtqnVcUlaurezHQ2QpQMwS45ZdXmBCUqrtHeqwNp7y37zhJ4yju7/bI+rcFoU
X-Gm-Gg: AR+sD10+gkEsVMQXj7+0xZBRaBGTwUOH9KkSptvc/DzdYUt+9JDlj7AJtgsIjFiQbrz
	QOSY/vmhSRCvAIrnS2dX5HDYmvQR6hGt237XPptnHGEa9j1FRqX4e1Ht+32zLdgwWf/E21G0Ipx
	Gm3vF6e7LbSK0xwKMMpSKL2DQxUF+m2K9UGUfX8bHXujvqs0nAp5wDHbr3CNZIDG/CTtTqErH3J
	z7IZZkcl4Yj+4vhlsjUWRmsC29In5CJduLTQm/6qaEDILEvE53SZlEh7jL8i4AMZ3VY8ADmL9jG
	tt/rM2k0PtroHKDY8IdSOrTaWIwJy3SHZHsdBA5iNpWXQgCer+fkoUVvc2YdeFLLSCxAmJ8q/In
	8+hrshnJe3Y1qHOVe9ZqxQJ+wSipkPjVo4q1g2VtQfYs//wzsJUFX+2pt9DzoL0HSscD3YRMjgu
	feAXbC07n4P16IJA==
X-Received: by 2002:ac8:5941:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52ce5f91a4fmr131338001cf.17.1786005971548;
        Thu, 06 Aug 2026 01:46:11 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52ce5f91a4fmr131337511cf.17.1786005970990;
        Thu, 06 Aug 2026 01:46:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df6bsm578947e87.25.2026.08.06.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:46:09 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:46:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a7449d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=7De7YDJhBeuExJeypKAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: 79N0jLXuS7L7n7wgJjN8qsttbtQLCcgi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX/fanksotIzqH
 KWni8c8r3K7plu4qCdDS58WKfsj5cX+5m3hcnyNIaLpAfuRYnwPugSBLc43Xzcc3sgcz304/vv4
 eS5M3bqXK8QjRdjI11azvrNrhAjHfZo=
X-Proofpoint-ORIG-GUID: 79N0jLXuS7L7n7wgJjN8qsttbtQLCcgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX6XHgkUtIMnGJ
 UJ8ccy2QPlVMvAIrH6WG1sNYSt/8EriSyPuPHc/8ZRqImJ3R64A3MTothF/R2+7YjbZJkCJu/3j
 iU53EEfRW/ildHmdy5Shm/CVJ1IluWEk2c5OBa7eVnxskeGU8G80Cme/pFhY8DIlPmN65HD5xjz
 D4x3DPbn9CTtZW01x6MB1Lpy7+Y+U8dmsIPPRNvz4vtm67CE0JCG1kuu1iCXN9JSQ+nPIdII90H
 2RF8FCFfmvvujSq0zkve9oG7wFWNbOR31TsfxCrVBFVCvjZb59rVxp6WzdMTFwR1eovHkWKTAwe
 uLBu5wtMFUVQ2jSr2yCCIImqFFLSbq7yJ2ue4MddzpaDTxeH+0nQsZ4jPk/keUxIJIdu8DPFeiE
 wYBb+DcEjbuONtU4wJD5C3INs1VO9F8WN29WuW9bsyWuebeofqDrGCOBRZEGXaGo15jKdog0i7u
 8VG41h6AJX71RWorHzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060067

On Wed, Aug 05, 2026 at 12:37:06PM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2026 09:21, Krzysztof Kozlowski wrote:
> > On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> >> The VPU issues DMA through several SMMU streams, and the hardware does
> >> not give every stream the same addressable range. The non-pixel stream
> >> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> >> address the full range:
> >>     +-----------------------------------------------------------+
> >>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> >>     | 0x25800000 - 0xe0000000                                   |
> >>     +-----------------------------------------------------------+
> >>     | pixel stream addressable range (0 - 3.5 GB)               |
> >>     | 0x00000000 - 0xe0000000                                   |
> >>     +-----------------------------------------------------------+
> >> A single "iommus" property on the video-codec node puts every stream in
> >> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> >> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> >> that boundary the hardware faults, which shows up as unhandled SMMU page
> >> faults and spontaneous reboots:
> >> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> >>
> >> Describe each stream as its own context bank subnode instead, so that
> >> each can be associated with the IOVA range its stream can actually
> >> reach. This limitation applies to every VPU generation, so add the
> >> subnodes to the common schema rather than to each SoC schema
> >> individually. "video-firmware" moves here from qcom,sc7180-venus.yaml
> >> for the same reason; it is the same kind of node and was already
> >> duplicated per-SoC.
> >> Adding the subnodes requires two supporting properties on the parent
> >> video-codec node:
> >> - '#address-cells' and '#size-cells', both fixed at 2. These do not
> >>    describe registers on the codec node. They set the cell widths
> >>    used when a reserved-memory node names one of these subnodes in an
> >>    "iommu-addresses" entry: of_translate_dma_region() reads the
> >>    address/size cell counts from the parent of the phandle target, not
> >>    from the reserved-memory node. Pinning both to 2 lets a subnode be
> >>    referenced with a full 64-bit IOVA base and length, and keeps the
> >>    encoding identical across SoCs, whose buses vary between 1 and 2
> >>    cells.
> >> - "dma-ranges", empty "dma-ranges" states the intended translation:
> >>    the subnode DMA address space maps 1:1 into the parent's, so an IOVA
> >>    reservation written against a subnode needs no offset applied.
> >>    of_translate_one() treats an empty "dma-ranges" as exactly that
> >>    identity mapping.
> >>
> >> The parent's "iommus" is kept as an alternative via "oneOf", so
> >> platforms that have not been converted to subnodes still validate. New
> >> platforms should use the subnode form.
> >>
> >> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> >> Cc: stable@vger.kernel.org
> >> Tested-by: Daniel J Blueman <daniel@quora.org>
> > 
> > Not a valid tag.
> > 
> > 
> > 
> > 
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> ---
> >>  .../bindings/media/qcom,sc7180-venus.yaml          | 15 -------
> >>  .../bindings/media/qcom,venus-common.yaml          | 51 ++++++++++++++++++++++
> >>  2 files changed, 51 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> @@ -91,21 +91,6 @@ properties:
> >>      deprecated: true
> >>      additionalProperties: false
> >>  
> >> -  video-firmware:
> >> -    type: object
> >> -    additionalProperties: false
> >> -
> >> -    description: |
> >> -      Firmware subnode is needed when the platform does not
> >> -      have TrustZone.
> >> -
> >> -    properties:
> >> -      iommus:
> >> -        maxItems: 1
> >> -
> >> -    required:
> >> -      - iommus
> >> -
> >>  required:
> >>    - compatible
> >>    - power-domain-names
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> index 59a3fde846d2196ab1e4588eb396012ba6860712..ccae41bed757bf3d9518cd4afe4565f043b45166 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> @@ -47,6 +47,50 @@ properties:
> >>      minItems: 1
> >>      maxItems: 4
> >>  
> >> +  dma-ranges: true
> >> +
> >> +  '#address-cells':
> >> +    const: 2
> >> +
> >> +  '#size-cells':
> >> +    const: 2
> > 
> > Above do not look valid. You do not describe the addressing of some
> > other device node (not a child) here. You describe that addressing in
> > that other device node's parent.
> 
> As we talked offline, these are actually needed for dma-ranges, but I am
> honestly confused whether we are representing this correct.

Vikash, you have been asked several times. Please keep the discussions
on the mailing list. Now there was a conversation which you can't
reference to anybody else having the same question.

> dma-ranges tell how this bus - so venus/iris - performs DMA translation
> in respective to parent. Address/size-cells are obviously also needed if
> this is a bus with addressing.
> 
> But there are no children with addressing, thus what sort of bus would
> it be?
> 
> It looks to me that having here both:
> 1. dma-ranges + address/size-cells
> 2. children without bus addressing
> is some sort of abuse of the DT syntax. It is allowed, but does not
> really represent hardware.
> 
> IOW, dma-ranges alone feels okay, although unusual, and it states proper
> DMA translation for this bus. If you add address/size-cells, it means
> this bus HAS addressing and thus YOU MUST use addressing.
> 
> If my understanding is correct, then solution would be to add addressing
> to the children (so unit address and "reg" property) or drop
> address/size-cells as Rob pointed out. [1]

Doesn't dma-ranges require address/size cells? In the end, how can you
specify the DMA address if the device doesn't have addressing at all (or
MMIO-style addressing)?

> 
> If kernel disagrees with the latter, then kernel is wrong, IMO.
> 
> [1] https://lore.kernel.org/all/20260716165434.GA290489-robh@kernel.org/
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
