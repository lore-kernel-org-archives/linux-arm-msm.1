Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494242BE94
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891723; cv=none; b=AIJoqHouONK10THByiziZKfItVTgZ+UI/V4NwzR1YCZsWEjYyL2zFi4WWefrT1iRI28mHPB+XhC9DaV+/JBQbpSUaSxR4oAbte9TBrh902V+Q8+3an69o/NzcXENgPEjMkb8VvUPlqgRGCGy0EFBb0Sl9V9uvi9fEEKjAfNJ3/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891723; c=relaxed/simple;
	bh=NLsfiK/bjz993utqebyrcPcVbe9fcrRODRXzucOr8/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcSCNkGXMVFiSNFn5B0iofEx+tcuvpeCaReYk7P6/wq+Fko2K0NRRCEXpbRmWA687SVzGSbjeZ8XhuW/NX9jhtymytXiQYKBX2RJDrRJnXZr/ftPqD61tQo/jbKO4eI1OeoBLC6gmlFvQnxgB+EqeXZTiZFUoyxKVmdinD82SfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ci0mhrQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TndGFe69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ci0mhrQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TndGFe69"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADRO73889267
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pWBEjqDwcWAFORTeA0+h9sqF
	40WLlT+TSIZr2L/YESQ=; b=ci0mhrQhzqUOrtdkU0hKBEFGKQD9WW4LFmglLHid
	Qz+yCYJQBjHXeAl+D+BeAJHzoAPwYJkCVe1JnOEDFxd48ZC7jiYAglKgHzFzb1vG
	rBHY0hPb4NihtR00VtW5Cq9CnwSWazAAslCzunwAyQEBc1QytSZ4oxvvQF9QXmS8
	0gScIHmBx0IuWjcCRMhXnMlRQVurpFr/N67GKUn28Dn01EiPMHv2iSNeMTh97PNC
	358kTq4dnwT612Op0dAlOOqPfJK1G0mDqzlrx/OMUxScLAuWtnmKS07Qd9ExlB/Y
	khJ3OpPNzt3PCIkhYH7KiG1TFPj+bqW4DyoszQSxV/zY6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f68cv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:15:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so5328841cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784891714; x=1785496514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWBEjqDwcWAFORTeA0+h9sqF40WLlT+TSIZr2L/YESQ=;
        b=TndGFe69RpcF+Mmjttc4jihnKLW8JkkBC6TyZJ/VTXzk1nWKyhIrvwr97+gcjjt9rD
         R1xBbskJLO9IAa1cUc+3eLYzfowLhDKAOevgIkBLFK+i+SWBz8rd/S/+W/sk5rzN6vgt
         pce/+BeZhnvgcelXLpcT89aamHv8rTihJeU1ZRonB9yX6ihbLzLt2MzLWgcHvRLbZy/C
         V2ux60T9Rm33+TW/E04p1romo1YUfFROPMOCo2u4KeX+Cz2nVU2ivKpw7NiyNAjtTdfx
         TkXk9hPt7OaGTaYgou1bhhxVFX2yhHkRazANQOztnPaIRUDmd70EHuXY12jKGa5WOweZ
         3qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891714; x=1785496514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWBEjqDwcWAFORTeA0+h9sqF40WLlT+TSIZr2L/YESQ=;
        b=JDxrMWJKUkiTrOLz1Mwl7Cy6n4bDa3a/8/bGfAewEwz9OngPNcllXAdFu5GvQ+MEug
         CSPm8wVUeaKWHgud2M34dZIGTJm7xpR7ZpTML41NgTne1u15LEYPEk9tRGQ9ijToJ13k
         3/xsS73v/TDB9kwXAQBgn6SlNoz+OqN4lJpjQdSLK6R3+jCmEDJdsk6+wXSVcb1vTw/j
         Gu/6m7yZZCyAxX3DnDPaYd/LqsbyFRTFZYOXlGJA31hD+cNK2L0u3Ze6SIxy7pCe7Dxp
         ntL3HzOywbJta3a7SQMaFyReWT8E21F+81kOTee4vyNQR9q1vbIDe5koC9mrQo5t3SCO
         FwDQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy7qW8v1Tl6g6QpRLn4kehNw+IesLxv5XvbJ6o+k6zNuRMZgKcICDPg2iw1lcwsvJvgsmRiSlEea2rt7Ps@vger.kernel.org
X-Gm-Message-State: AOJu0YwyifFDqxnw7oF2WLXbFDnngFTo13N9OPJnxFl9ZiWLfyw0afo1
	x5Ma+SEzp0+waoQdDIrTEKYDN+YNXaQFZbGmSz7MROhRi46O1KvVKiVKDGdM9uF04otUq4uPMlt
	Yx62pKpYBKM2nBVNLhVDmXHpereVDo5SeA/Vz+TeWU1dPrpTcYOi3d6XEvarM8wdRoLJQ
X-Gm-Gg: AR+sD135XfANBOA3cw5H/VrTKGxxFxtn0RZjtDrt71/MUsfrU+GLhMmNlxnjRGFE+Zl
	PGEJVLlU0nrQkqIYUzhSWc4Zma68ND6Y6jbUqqpKC1M5ja5iOq8Rnep+6COjTvxl7iHIWXGA8pu
	1c+5cO1cshic6wSkj28kKPOd82UjJTnx7ARl1lYr8F2XGKNUO3XZsE5N7VALnMAIOvkWdHSSnuj
	+7gAioSvrsadYt8FVXc6TbV7t51dTMpnd8CE35PS0UWyRD0NzauJ3vWnLVeZYYpGfxd0/dL5Ddd
	A6CFRTgUq+PNEudgIo8zshSp/jdLxj6iN1ddWHYdQ/5ePpoAxtvOMcLS3/E4xLnKScbd8NiS6xo
	hApuqQlkEeZLAb30/g0yPKK+j5FoeL7mgsWuoCh+SM2gZlJYV4nuhD5j+jtxgUbO961AIfS11Ms
	oS4kzkdgD52SbRtQ==
X-Received: by 2002:ac8:5941:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-5283ddb06dfmr69298831cf.18.1784891714399;
        Fri, 24 Jul 2026 04:15:14 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-5283ddb06dfmr69298111cf.18.1784891713842;
        Fri, 24 Jul 2026 04:15:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883dbsm13547251fa.2.2026.07.24.04.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:15:12 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:15:09 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <em7loyijdpav6chk7pslmz3u7cifqbopyoutwbuhjjhs4whmmc@zg5o22m2xrej>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX2MX0mN9yfXnH
 5PzIJGTZTbpcG4HL/jo/wpIjHuZO3rg2qndts9DgQbAozn7zYhb09V6JoBJ7QNjCar1D6u8wMzb
 IahCJkq4prwwJ+7PAerRdHtLUXJ+GMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX+SG4eJn8H+cE
 3v42PSIvToOoId+H7QuOHDGVFMd0MBaKkmxVtICesv50IXGurIB6r1G/7cqGSaBraMb9iFw+Xnx
 jqbwBioISbVcYxnn042hXZTfC8Go85wGU7UexBPcX2hcTLhAC8MaUS7j0+yR7BcUxE0it6d4TXy
 A27RQqjGdCfENSh+awLpyN3Y78dOgomcQiAeaAPOUNdBxrSWR2HTHj0Qq8YyzuUQ2TkJ00cJuMk
 dYu+3INL/pCGxfgIfqmm4+Snsq1BPzGVGRhieAoxET1OhxwgZDuSmKJKfOmTX+SztNWe8nLdmEC
 zarhDeMMrAnzDhS80B/BtFL2Z83GAyD597HzsHaTFozUmPPKp4T93I45tEnvz1pDmhgEHw6n3yU
 YeYNY5PzEypyQHFkHaAa1R0AF5gZjGmXF23vNs5Kh22/tgNLaqEqubVqQHMF7dO5lnTlmmKtb76
 GV465IlnS6HsNUc3knw==
X-Proofpoint-GUID: skrfRCYWll0DKDfwpVX1zn-pio0vSQM9
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a634943 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=Myr9REOcfyVB5ZbP5wAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: skrfRCYWll0DKDfwpVX1zn-pio0vSQM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240101

On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
> 
>     +-----------------------------------------------------------+
>     | Stream A reserved region (600 MB)                         |
>     | 0x00000000 - 0x25800000                                   |
>     +-----------------------------------------------------------+
>     | Stream B reserved region (3.5 GB)                         |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | Other reserved regions                                    |
>     +-----------------------------------------------------------+
> 
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.
> The limitation could be exposed when running usecase like concurrent
> video sessions. The binding have been validated with higher concurrent
> sessions across the SOCs supported under this schema.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 3 deletions(-)
> 
> +
> +  firmware:

Venus devices have been using 'video-firmware' here. Can we please use
that name? Or I'd ask differently: what is the reason for deviating from
the name that has already been used?

> +    type: object
> +    description:
> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> +      VPU when no hypervisor is present.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +

-- 
With best wishes
Dmitry
