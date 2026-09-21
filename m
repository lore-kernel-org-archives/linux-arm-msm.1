Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4544BC91
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977345; cv=none; b=ZhyPPDU83zTiO1RfpDAdXtKb50Y/Dlx46ouglNo5WdnmfWHEUr5Zmd8wsfz/NGZVJyJlqh+okbjINm5g0ew+VZgX+1rBG3P/dbaoYpt2HZnvoljee9nESmztG7HrgIQ5gRe6NsI1O5hWqvgXcvWi+V2HQ9JraKOHx4udSm3L9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977345; c=relaxed/simple;
	bh=O/xblMgAeXmEm+hWb6Vdnq/ynyXas/yimW9gzv0+MLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2q9Nibi1Vj/4BARZHLqjs/ZCKLx4IaFPxYwPAOUL7SG3+4Ginv7gkMLVKj9CO546JiJfSBUN1dTYYJbutq2cgjMeVsclHiYn6wnbOmqQiehBWIdmdb9dPBHJVPDb2CVQYUKSKvCrtrqxvZzmhlpEGZIhvFPThjT97R3ApJvIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8RSXpUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXNZznCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8RSXpUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXNZznCs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A38l1458726
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8tMxBid7FCfgDUpYzkqKww8q
	lFKEfGPpZehQ3MFHIKg=; b=I8RSXpUzMjXSUzMXafXJEjyfjZ6p0nCvoM+hkxtt
	EZmp86/eSlM8uVOkUwMu0YIGfe5LOcuo5DDIafFVHmNslO2O7V/Wi7sViJJyTCNB
	QofGME3neVBAOk+YnfxQaiBLqrVMPlKJvDmN6u6PLu6BlzAHr3JejWsklgBdYcfs
	n6KPlLUYgioZ/TUjXbGJPp8/ZwVRVL9IQ9mZR5Vv7WLINGyZ9g+PRGWIUsTRFC4t
	bCd5SeHaRAkEpfFY1sNXg8lh8h1phX6nSdM2z771WvFv3TdlFSaajIK8fkMFZWPx
	q+PDOeVorfvyr3VDyTKHOVbHNHKzjqbj+E/Ih7RtLl4USw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v99re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:55:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104c2ce026so81310296d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977342; x=1790582142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tMxBid7FCfgDUpYzkqKww8qlFKEfGPpZehQ3MFHIKg=;
        b=GXNZznCsMTv51iGQoLZudGTlbC6f/4W1zoOt+SSEQmr/d26uXfzZlKwxMQyxD53/yX
         PNNFeCm8iNY5f/CLNlvBSmAf6NjrkfEj7LoLUGnmIdb62/tWLjr5AsrwUBMW+Jdii5xk
         xw3hV2JZJGw7Vv/m1nRkScx7jCqIBcsrGpRgBxj4r1ta9vMcWNP2YvbvRwtX9quvJGnn
         RyMvzSrS6uBt1h2fDCdRWn1NXvVCDhOO5+K9nzrJZHVFoW0lDOdJFtvY5SFRE6bZERUa
         gPrkcs2UxVYnLZgoN97BmTuB+3MKho60RPgVWvFZ5Pz555/29vYmPNYD6GaUn33VkWu4
         F6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977342; x=1790582142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tMxBid7FCfgDUpYzkqKww8qlFKEfGPpZehQ3MFHIKg=;
        b=PPSQTdDVbgQyknV50+XtBLWJULjOzwILSSRvrutD0YbEg++9IIWJY5LGAqiaIPeD+3
         Us5dwTgWzY8W2FJR0bxBQYoFQgHTsIj/zxlbs0WSEHZ/P8do+3wsZv9SxOOCULsbTSZs
         PEX+hnuKbOoOX1HbeJ5m3XCQwkxC9RkZkGSXuiH9tvZGttYQK6afCjia3b3GDI1ziZlG
         Ruxf2kI1MR49ceP2GboYZjp1snbTM0w6tsTk1PKKExdWsvX9/2b+lPy7oAoBpNmD35uU
         B46x2wXaESeDSxbWJt//rnRERhlbbeGjTa7JBkvUFD1tA861tMMQDpCrS6fhpO0BNaH3
         n2+A==
X-Forwarded-Encrypted: i=1; AKwUvBwUo0oBR9cOMlKsHXeNZb3BAb5k7DbClVlC9oOOkyJd9kBmghjGzFhUArIAFzfgB74ipF2x6vldL/jQNOJM@vger.kernel.org
X-Gm-Message-State: AFuF++k35+gz3bCVhgjcXUgvv7eMWqGzKWH88l3Zo8CY0E2z+DPXQhFD
	PqDJxkuDy6Rg1E/CMc4fM7UkmG2MpxH67l+qxB5u7osEYl2+GyjC561DeIz3NqeLqGKlxP79zOI
	KDlyUeJUV2nfyWPy1O1xRzrsKulB5i/wfp+5obFSG2x/CLZ0bL3IjnpURr1gOuxKWttJ/
X-Gm-Gg: AYBFou0vHyj8ZVSLa636pVgLRXNQrJ+2U4qf60WI3EGCfMxmILj/Cpd4YrMsc3Cngy6
	O3Yog+3zewc39moDCjtWu0azoVWcN+5WS03DDI6gaG3NKScBhjIHKX+v0aoznbX7XUVrUmR0WgQ
	AByfHCtsvn7LBz0bearHE/TqexN4UC5d6CCSGo8iwAjSfzSZa1H7tSPYy3LcwGDy+k0We9uxCde
	BWQs4DA4ljtJb/aiIczkC2y3B5fIKPLQQmaUP+Y6E7tZVBh/25t093/F85XaiERDSsxkg9oZmUh
	oBV3YchiMhqDbViWu5p3FCg5SN4HdfY6WxzbJsjDsDwvBYqdpcTsrpg42XgaV27a146DW+DGJOQ
	hwhWSuw3OlXDPSxo=
X-Received: by 2002:a05:620a:600a:b0:93b:d79a:c472 with SMTP id af79cd13be357-93bf57ed5camr846738285a.74.1789977342544;
        Mon, 21 Sep 2026 00:55:42 -0700 (PDT)
X-Received: by 2002:a05:620a:600a:b0:93b:d79a:c472 with SMTP id af79cd13be357-93bf57ed5camr846733785a.74.1789977341715;
        Mon, 21 Sep 2026 00:55:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm258971295e9.2.2026.09.21.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:55:40 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:55:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
Message-ID: <d2usqknrlbg53wsyyqw4wy4w24hzcjf266eegyuqhplxsik7sb@o3l4gpyxjcqh>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0e2ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9SnwaucS_9ItoiqyrtsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ZaknKJXD_eofWQX-vbUPQ-J23h6Dgaiy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExMyBTYWx0ZWRfX6BL3f1O4wNVr
 z67B+seKbN5nlh9f+Q08BvAvJddTUllgnFYjWScb4C0j4+drzCfwJkaXxvAJB5pRNB3bSSCnzts
 O8bOz3iwLxJX6wfO/iaXxi4dD7K1pD0=
X-Proofpoint-GUID: ZaknKJXD_eofWQX-vbUPQ-J23h6Dgaiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExMyBTYWx0ZWRfX0MaEciDVZnRx
 ocyQzksOjEdQeQ4L668K8NaNlMy3X/yg09eYCByHjbqM+0qj0gWJxZbnQB5hKuVO9+2rzxy16f4
 Ea4NR6VMxbtgBq1J2a6xRqKN/lMGqX+UHlBvlgPj/DAV7lQBdROv9bsD3mOeA8kVozPgyEo9FDv
 Qyu5xGQVHQR7aO517mSRX8c8/OH2S29EsOPFQBgN6nbQOZGWA4td+QqH2gidt2HYmY9BTwxkcJV
 DewLbKDCx8+MQoudfrQ3wQyDZPO23fv+/loWAGE85HXbS4e8yq/aYJ0cjk02j2ZOx0+X4DDl6Cl
 qf2vzAtkvFIYO9lBZlAVh6h7lyQpvrM8cxrGuLqXDLN3kDxHaYofoy7g2MlDQOzYh/mDiFSy1Jn
 BpQDXMPTTYPYviuPNMqb2ztXG5w0yhZsE/wOkvjuVom5SPI8uoFd3D9xo921TSedQDGY/N5iCyf
 mpaTCRvC2acc4NFQw6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210113

On 26-09-20 16:49:15, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
