Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DCD420888
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006175; cv=none; b=H15K0D7BciiRyti/iIEvhveFdpnesN078P9R/fAUe/4mrLDZwsWk/kUxFC+SygcVwHT2ASMSZY3iGzF0xZaVsZupK/QeqipyXI2GwvPNnexbDHBpG4pGL6K3Kc4FpuqBDTFtILtOBxDYbziIGuv/Z86/TdaRIbOq5GIXWp3EJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006175; c=relaxed/simple;
	bh=KhzSMHpkl+T0k3/D4bj/TXm71L2GvbGLt9WmQapRokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV/28XKo8W6plpI7Uj8BAUAxhEf6DyRRMJ7/UnxxgFccFLj8Y2IEDYWuUMPvwa11EmZ3vUozklpGhx/qLVHYmTwpdpv+/uyYI2pdOkR1kWmAfZ8Gw5Owq0p2H6y9WutE2z0o7q+/j898MdUFRbnEG/QcTT/68uqMMA4mB7oZUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTpkEE+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDqJklcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTpkEE+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDqJklcd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767G2jr4064762
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fXWx2kJuD1txleNLiOTk7MZh
	NagWXN9ujUDiGfg4Op4=; b=hTpkEE+QLyetKxFDc7Z1I1UwO5H/bsHl+/Zj+H6w
	SNlZ7T7LuE0PuXG+sLgLbbWV1bScdilkE5ru8hg+niCNThaA0u7pv08eBEQBe8jy
	3VWpnssSwdSXO+flBX1G3DbZO8W7UZIIKCNTpkTTPP133Mki19FDAKlLe3o9qa7h
	9OJ/mos/LyYPYIsPuDutRkmJIlLKyVyCCB2/cTLAeV39GpoAyYNktNAC3s4FhsDQ
	nsWYMAuEKVpgJpTwaiDYE10X4yGHVTYkdM1h5gLUN2Kp/FrgRgWt+oTHgSNtunEo
	Dem99xo+SjV7L/O+ZbBKgxk0+H4FWwZosjk8xXmIKluuXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5mgyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:49:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso14584891cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006171; x=1786610971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=CDqJklcd9itEv4dd4CyZz1w7+lIkSb011DXhlzaINBC3m1LTAlTBB99rZTOrbphhrj
         Sux6n3hFk5mluIUS1lYBuooVo4Og7DoLLKaie48KblsTMzUzyMd8XqKifvhSeuT+3Qx3
         EdxclpIgr4483edKjtqy4vmZKUqo1L7YfWrM8Q16U31nEoeDgxbog7NexOW5geYaHwkj
         g4r0yVX1/J34uQ/um0TUHvawVGSgtnZTCFTLZX/H9TSba4STrZ9YgWYJKewOCJpHbzHq
         kCChIZLF6/sGgl1r8dXUJ03p38eqVopRXPzEqAxfcgGYPTERcM4bBXZ5/VpW4QKW3mN4
         AaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006171; x=1786610971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=gKbNH7w6hwkFvQPYSybwTdN9ctQDUfGCCYWOxdwYP0swPl7OugM67mbdL28cjbFkfU
         J59lnCr0LMJh+0sYplqb4Ps4fL7on1BUYXJAn2RkkB2u2XoVHTUo/xSd/ssXrRVD9EPA
         ku+Pvm8RUMxHDIfS47j/eFkDt3SzzhFWaSG6NN/WNXg7T6UVagtZw/owuGsZUWRzH+68
         tf+G+FXiMqgN/6j/bEmuAD0RQL4J5Y+CVD8L7asU2tlYYSNk9P98xUlk3jmJvxSxWum1
         oLShfFpy3rGg/49Cb4XE2J3oGa2dofZ1LctaGP9za4EoZS0yVnUmW6fHFmnpsCyyfh05
         h3Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rqsc1fqoXiihORU92EqQinGWgGr5u0/fHo2LpByLG797mcSHGJZ1kQbFPBnHyIZreetcL1hbZqlirhC9wye@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbt5GrgUbHTxP8fk6geTgXa1mo6mYjDW3R2LG5mdbeFqYnnFN/
	z+cGmvbhtmbmKSAxTxiMtzSmsofUzs2IhF9QtoPUTic2Bjgg+Z3o2JZScDyrTwh24E/usmCAsCK
	vRepV+Qx7uslPvpZVSQZNSyYuFg4lyWBZs+iFdHyBm+WYNNvuwbksY8Jas5d5H27H5zGX
X-Gm-Gg: AR+sD139d8pJrflzVhiG2jHQFdeM23s28jO0rSWhvNEh149pQ3/PprGKAudOm4jp19y
	GoegIV66vw5UD5ROqQaG5wiSQOevBhn2n+FzzJ5VOHNJLfjnxJ3NaTMgJ6aXyeoWZOiHL3ZWuTH
	3K70HfeS0hw0MthVX3UK+sQRdANaFQkN6cezyVw/DlnYAdmv3NVDP7rb/+/Kh22X7eJGjPt3z2X
	BCa3Qz/SQnedoydK0T9jVcb7YvjFedsH4UtNwrncWQUYa0VjJ44uyv4yYLmBzlWtzngK9E7rdvm
	H+2/Bg1etQ62dn/Mft134FMyUaUFJOhvF63zk0urty2i8qKasaxL3K7/+zf6T6emjEbkmSkcFkd
	2pa3D17y08KBkGJ8zrrNIzb4s6mz4RP7GuAQfzGjVxAQ7mqK9zUJ/99FitIOeuSC/vxpJO4Q2Aa
	ccqwvSgc+2TWGwRw==
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093611cf.20.1786006170703;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093181cf.20.1786006170210;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235e88sm588382e87.11.2026.08.06.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:49:29 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:49:27 +0300
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
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfXx6H418Ap8j0x
 5jVRWnmmrxME3N3Lp5bBZ8sjpXSuPITNBHLxDSKBfDT6CBm4w3mHC08l8euPcgghL9S9e0k5fPb
 rFxQYJWsrozludDpvlvJJK9MjmC7uUzGCULd4PK3WFCikiiZf/I6cit3Xb50NvfzSyHKZC8DcrD
 Qc/OkZbxP5Dk2DuwUtQWd5B2zK74SA+XCpj/4RDecokyYOQc+zt1cNzZgUeGnyrqtfsF2z4TXRX
 Gke8wLEOTyk1PrpwOL8QcZwzkbdJJk0oVqJqJbcQMXPoQNl7Vv98ldhK2ADfps4saHcLsG8LOAI
 W2Rt22rL8eXnA27/GrDNRsu4sxxdvWSOQCZeIyCjAPrPHGijSgKfNTYaLm6dVkB/RZqmspwNKhl
 7x6Bgn9z+iHCE+HKSOpWpbJrAg1sOp/0V4lREdQnChqd5qWxvRUeLXKxRxot2f6DvSrUp2lZajN
 CigN44ipJ9ggy2kDf2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfXyIw5tBJGmRCK
 e5z713bwtq+wqjHW5dpXpH5VnzFjZP8hHgATwVLVdkPg0JAbgjqSKLtidJ3RhbR8SZULNvzJqln
 JOpAvYTBbPDDTsr8IaLH2IBkbPn7zYA=
X-Proofpoint-GUID: _0Cz4pJ3hu-E8JV5dXa7_NV2n135Nli_
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a744a9b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=jXNH7nskYnz8vVHi7d0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: _0Cz4pJ3hu-E8JV5dXa7_NV2n135Nli_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060067

On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
>  
> +  dma-ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2

This would conflict with the 32-bit addressed Venus nodes (and it will
also break examples). So both should be just 'true'

>  
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel

- #address-cells
- #size-cells
- dma-ranges

> +
>  additionalProperties: true
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
