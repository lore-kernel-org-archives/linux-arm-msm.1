Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749831;
	b=Wt7osaSpMTzaM2MV3Uoef5lbrY3qzUqSj75NGNun+xiHSc98CZh7NUWlwVsQyZxIjh58
	 0GwnA/vX64rjcIpaauJLqxFTj724vjpFEkQlGGVIwGHBpnoYJtC98GZn9Ykrccj6rsihX
	 w6svJUwIw2LBQZjoDw8DqMaVK8gmoLqnSE5RDVv9TutelIjt+UNwP8ih3C8W9JNWBRrTW
	 dhiqPu7e5RjHhvRSB0qP2gMVBoDP5DzoT6rg3FAh0K02c/k6TTXPrxgyJjaGNg5Ni/tFF
	 +SUNlG0773Bo8TGrt6+9V7Fv/THRs7tDKOCKVF4oboWl6XC/R4xGvDOouIVjEdaaBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
	b=oYlTBbyyshIQApWNnE7soj8lC/LU6LPY1ClCzvfkQcVrExxxaXvDwO/7MFpnR3Al0jX1
	 rRAoHeS4TXxlF12qZuPxGmHTu1e97koi/hiIXlXxEsEg65vpOf8cay6xFrcYf8MfkYPCL
	 KH8qzxCLhLMhvns1WeeaW3UoPxbl3sJjDcgpmNBs/j+5694BbKsSP1EO7Ir1e+rhxUC5g
	 nN49hkkBIFKYOYGnzpx92sn2hsn2cXfL7u1LTDSTXQXDv1QI2gLRIjejQ2TWjcfpOlguD
	 6h/AhR4OSICRDKcyppvI+wJirZUvGbfC8wP5meo6Xb+DaOf3/k1ROmOEN40SoYAEiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75920606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75920606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F95b2112129
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=; b=mLGHNjZ7FQaMcyGK
	8pqEg/gVX+Wy4nm7/BRD3lOKUrlxq2WiiPV8ys/NiunCPYvy/Mn9sPrrffm6giKK
	HnAyiR4XJTPFLMe8e2ghwsz6S4aWt/EEf2yT+LjaC3XTJr744+PminRBS5VeEbtK
	vvGYEOmcfmNJtMZtfXLRuigFeVUJPCvdJpiYXZR2qw97rlVei8Ln+fRx6k3BeXg+
	nyqPFlZiQSYWT1w6QnToNc6r5M+YN2QzU9aT/HATeKmqnaXDzg0VJtt/n2IBxU6y
	8CNcYSmIJkgtGv8Q584mGiBbc3DCwIP6FNHxWCQi2W7fA16UEgB90CojchPgKq0o
	AZG4Xw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykajbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:03:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so14945e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749830; x=1793354630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=R63aZJPALpIGd2XJtTQYWdxWBctfwSq7+ZTYIbb3C/FErv4w1Xark+Jrv6fZKTv4Kg
         /0kuAVgUkmjT1xoh90WbHA6UGEo8ATHcUEMMkgeYnNub0CqddrKynNzxuWhdkrbW9Egh
         kUrVrsGE7LlRSVK5yz3vC3Oq/mBYkps3d4divtAXo1h09PMxrBgUnCz8orf2BjjWHedg
         gMchj/VXuC03/BsDIVHB1ZyMB3Ev7nE91lEC+WkoAj2LjI1XU4Az1P2q1nzWbLna5rzM
         vh7NeNzeKG2NgQ8pWLP1dtnXEsakRegDKY0gOW96ha47XaoMzucOqgDlPM+uVWc7y7x0
         aZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749830; x=1793354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=irbCZRFTI8/W7mvNsWzrMUc/mi7NSCn5ivRSJYwevj2N0N08dTDpHSBrTISnABmnW+
         2TgVG/86tH0nK5HeCXvZdJ0y0pZvq5M+I8kY/41s+O7TYTuwucErdpr360/m+SS2Qote
         dyYZZotq7PE/ipqTeL0FRvFlIUnKokNMOO3uaogATX2Xm+tof8GI7RxlZywfLXGVoI++
         CKri3OQMHCfAa21XWln8tQv2qZAvI1eUt7TGHA/sw11CtLYxPWlvtSYj26xehcQatXln
         3Cc2HZaGfUtQ6Juylexbjz99eN0CCPTnwbDrDCyrqtswhLBX2kUoaasPR2GH8J+P/U4G
         n0OQ==
X-Gm-Message-State: AFq9FYIE/2Ieu2MYmxFqtKIuW74uTU+jrlCQJTxN0JKW8FhxBrY3OVM6
	lbzZKvo6u9s+brWqenPxBm9BE25Dgx2YE+FtWMxRWi6Qd4zVEm/p/xJUnmu2UQ2lvzXCRremGSq
	vi2rDP2bfVSy9ODuqIgy913M6S5HULr1AvhakPNHC+VR1XyKch3Nxf9mTHYP5sKN1Sf+n
X-Gm-Gg: AYBFou0hb1AylQercSQYSS5tT7XIB2Zso9qE/1nXhHjCj2QoDTilma4uZonuhFD9Q09
	WdXYhbNikK+1Fd2Ldw2SgUAr8Rapen3GDHnUY9k6RiKR0bl0IB6maaieScrigo/hwroEx9stAPk
	aI2rXyKU1W7MLucQhbM6ry/HF7YZ9YjSFzp8IqOdyEDupxlSrskEstMfMTY9lgHEl3KZrvY4XIX
	7URJnQ1zoZ6ML6CEbd2pa5ihgxjR7xelAV1PQeB4Ge0RtZEGB4Mj5Xggfse9tOx9pffmoZ3WLwq
	GpK8vbvDfh5O+oTIPFuQwNJY5G102AE0FXNbQ0Ll/2nFT2dSCUeb3tgYsQIPw+ckRtZ6wAtYHMG
	WXZWINP7PO+UrQEYuG/lukQ==
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512079137.3.1792749829640;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512050137.3.1792749829147;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfa594sm84380366b.80.2026.10.23.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:03:48 -0700 (PDT)
Message-ID: <70d5ef70-00c7-4265-b2aa-3a784d4f0d1a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:03:44 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXwdMww4emd7ub
 sFtvMcF/iU81FZCWKSqCZ6fGVJ2LlINKLKZSurf1qmKZl9pWn8rgF53GCv3sPKq6IIQ27bv4lLI
 bzjDkL54kPb9y60gM+PMPCNsai9aODiPgiJpw8KaD9bvWF1EfH0zfyT+xFHfuyU+VA6OBKqB+0J
 hONOu8UYrrZ8zM0fx14ugyNM5/MuXOxwfIqDYLBm21bj9hFfk7ZhYacwOC/n6owALpjiqjTzEHX
 AJMnkzdf+CsMivqQMbXSgbbNAuDfbPhLrYyY5YfdaYUIDQqkhbprGgkxBSWED1GFUCRUiigrpyi
 nE4goeDh2WUoO+bKA8EMnjUuOO5sRdNvifjKkeXrk6Qd3ya0l4NJc7O6mJdetery+Qu0AqkIl7e
 sy4n2gDg9knJtiEUUnzk5qnDAVajIT8yIJkFGKFGiykJgxFLiPpqCdx80zdnhSkYiL+jHtkm7zw
 cTMxlVaRc2EHTEbtLwQ==
X-Proofpoint-ORIG-GUID: nOtXoo-u-fIxQg1w0hePdzTB252O_3jP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX4OKsqwITlZsn
 nCrvc5uKDbNp4tQuvNuilvhZVVjRkxJm3qXOHQHcow6+veQCCSAW/z2iZT6gY29xhpgx6x6zgXU
 5VAfWCXb2QZgTFjgaX+5RqqLcnDDmRo=
X-Proofpoint-GUID: nOtXoo-u-fIxQg1w0hePdzTB252O_3jP
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb3106 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6bGC0mKcvBxu2wzPFmMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

On 10/23/26 10:13 AM, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
