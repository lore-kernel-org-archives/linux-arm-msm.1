Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C03D9680
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225309; cv=none; b=J/sDm0AJ1ISJAlcdIYZUMlZSEATZpnyboxHkSJSGlWs0eSqjMKIocGQtSt/tEmCI1GhhMb2kZrrsLS7mh1FOkyNP52gzM47COJ4KQfNxlx5FVmU8bxvPvkNF30gK1x/jEgIKXlZ0YKs0Uk0T175Q0QYppksuj9wl191LUjBJdzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225309; c=relaxed/simple;
	bh=aDf47t6vsonXRAyycBU+s10Qt9rWoyo7bEhD4MTjflY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIQiuDkbgDPiMRbtBGZdUudVILx5zphfghKWnlvF4l2q3BBmwn16BVYEyzDR9V73I/9vodNFuqVonCVBkhtxVQeqFRu678Qgjba6ivYbrC7tOY7gcAYnZNQ6HSktsPvSWy84mLaQeb5Ak0W2Yt8OA2i1sdundY9PYMNcckwcn28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJjPv6GG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1T8xDWY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJjPv6GG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1T8xDWY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3abAo1527428
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKDADrMmUYy9oTIzjZ+SwsPUJSgrJwI7msQNJYHq6bA=; b=pJjPv6GGDSXHCdiS
	QfyS6WNlWG1PaaBOMUNAOnUF5LvTyr2dJPWI2swnyfw1HlZafDgxZUwju33UjZUK
	mXF3Qr8TTcekgYq8nOEVeVXHAWpqL/jXwkZNV2NbJhSbGkv/cl7noPoEOEQqmvf7
	1VIT6UbGf1UJzxLqpkgti7NzdLO1QIAsnwegJkgf0zfsg0PHtS5p13VtucRh00WN
	DmYNPG3DLJIS/x1gwURb8NRb9k2wbiLtLBL0GU4upJHKlEgILG1qPoa2h21Bs5M+
	iKIDkpVKI/D3RzG/uIHyedlvbpQMhjXJNZe7rpfTjPq5BMu0HTf98rAC+znqK3qQ
	vvEcJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8b3gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so1470956d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225306; x=1785830106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKDADrMmUYy9oTIzjZ+SwsPUJSgrJwI7msQNJYHq6bA=;
        b=G1T8xDWYOY/0ThZjNrEuKNglgtXLgu9Tpqa2tN9blX1WlL2XqTP/DN66GgfYNCDROr
         o9qhcf/qXFI4CfiAz/ypHB/mNPdcclWLc7pHwe4VuRAkyfeF19jszUdxugzFWAEU21QZ
         umTetj+AWvVcIPDjNCFUPJvntVjTB99oTIqKGqmd2m+ZifNUYRWKl7VXaqMCEFhXgGIV
         9EyRd87A/dOSdxQnfS/OMzqxGVqYYbK/p/+X/GGFCt+feVaQTgnQWijF8wJgwQPPbkJw
         OF6Qz/ouaTVwUv1Ay/y2IPo0OBRVKelBbmcGThjZ+vU738/xUkp0b8l7RaCk2hq5tI/K
         MUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225306; x=1785830106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKDADrMmUYy9oTIzjZ+SwsPUJSgrJwI7msQNJYHq6bA=;
        b=WpAcj8imiSi9Sxg+0GkrdTo9pVCF6JI6p+QIX3SpVCZhD6lOcdayPx7IWzvWIkTNUC
         uRqiiDqPihM/XjN8/L6bE9oRHpR6sD4r4YbpJvbW5T9h9LZph7hCap4jaNc3fbT2xrJE
         bD5QhtN9Woj+GlM80xafJgJJRpKkWIIhUoUKf/4c/zYBwhqc+EZF+/mOAj5M94IY0Das
         /VTi6BHLoaO1dKWv8teUtu81QoQEFlZ+YBHSFvwcwyzf6d8NeYBLTDUVPCGQj0V4M9a7
         uAOcJ4nu/XzKD+i9qO0E/w+6H4OxGTJ9/u9q/oNKRCK62ZqGZk0SOVKgA8G0jjrYuNuW
         ikgQ==
X-Forwarded-Encrypted: i=1; AHgh+RorqjjLlX0oKmHpz1pklSyGdzsBl0FbfSbXwAynb2lFIVVyiMXTFLRhhAvO71Cy872xmgjxm9fq8fnkLIu8@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQGTRxo4LeYwk6depBRTyUZuCAcPag7uYeKt3fnVtCbWj47eg
	efGOMsF49yCwzNng1Jz49aENn8vANtF8M6xQSCk/taHxsEmc1umaQ2rn67uoORqStfwG5KKOVGL
	5sQ5m/Kza4rVzwnecFZ9fxf+GtAt16J47N6MDWeQTnTrs4xEqRZ/k28IiauCTgyDHYRZ0
X-Gm-Gg: AR+sD12UgDbe9b+p3plrAD4LYM9t9DFEtOfCaGkPwnTTt0ICRrUIagESInfwauZaYGo
	8oMfhDN+0F35HFpLMRAtTwQW3E03Ni6h3XXEIaoMk7xx9TQ8R5r/1RBPTCgReMoBI7Gtep9Vw79
	khp8jqOqkzh774hPxcUs3co8ECKIfA744145B6JAp2efn4vIXn4DmVKGFmlOzuJLmElbK3kRjJn
	mb0SWmLlwem5mC+wC8xrrlPKAFTMtz49dF+wX163gXPl0ISChvwqnmunvdpr2JESQ048yitU/Kv
	g68UIcq47lCqdtQrVtWAejMPGhfGF54TmIaUG4OEGnMDPOeP/8QgpDl5oEmbpcAiXCin4xYRpgM
	rODG5A+GRKOX7M+ogVVWVT1bR
X-Received: by 2002:a05:6214:2a4a:b0:8fe:6078:d35d with SMTP id 6a1803df08f44-908172f6006mr20403446d6.2.1785225306357;
        Tue, 28 Jul 2026 00:55:06 -0700 (PDT)
X-Received: by 2002:a05:6214:2a4a:b0:8fe:6078:d35d with SMTP id 6a1803df08f44-908172f6006mr20403106d6.2.1785225305932;
        Tue, 28 Jul 2026 00:55:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm724127666b.52.2026.07.28.00.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:55:05 -0700 (PDT)
Message-ID: <947ddecd-12f2-48c9-82f9-072335b9028c@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip/qcom: Add defaults for desired SoC drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v2-2-466f3c407937@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-2-466f3c407937@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX0mxI60hjudFh
 gPQHcwlPyfc/N69Cr6tolJRExc/BQbaCMCidUapfeMhwt79+OMPz2dRL0/5yCiBmUG4gwgfkn+X
 HutY6K4ZIQWl9JdMPIla5417I9GmO4HngNWPyHFkB4Ap+cfjR5gsPeO2/BuiduxtuWW7yeT9i5R
 Cyv0S6UoHr7Fu4ENyFUg9YT+ZC4DEsEbSqfNhnM59Fr80LPD05vU7S8mpc//PRVtpwkkfOLFDwZ
 fkdWnYUamyfdm59+XkYOtdnxL0n3U8yoQLgewjIRbwFchXTdjZwQFnBIZBg1LtcrOngZg7r0ztQ
 8uYPJH3g8f/UfFVo2FlLtP5rjwYShR3AZqvlJ7zZ0qp/vMYxqOrK74xaR6kScLWuN9squVx1DIz
 wG7VXuhacTXDVBnCZaC68+SP5LkdcTI0wxPqvB5PAvFk3YGJpJjCO1dMHkC9G1wHLfswrt4pF1B
 DrL7if0xqewNxdQ2RRw==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68605a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=c17_2U9e865ku_9f7QMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DYDXwc1mdZ6YgOzfUaN56mFGEQhXmHYG
X-Proofpoint-GUID: DYDXwc1mdZ6YgOzfUaN56mFGEQhXmHYG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX/SLc7NmR9XHC
 EfQ2RXXUnZjGWe7R9JESJK7QLXGJ30jCGilMrWrUazJv6fFXGjywLK/airOtBd/y0xkYBn9cfC1
 kdZaClux/f3wXWZPWtfo0YObFN8ZLBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

On 7/27/26 10:01 PM, Krzysztof Kozlowski wrote:
> QCOM_PDC and QCOM_MPM are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable these by default whenever a kernel for Qualcomm SoC is built.
> The change has no impact on arm64 defconfig, but will enable QCOM_PDC
> for 32-bit ARM multi_v7_defconfig and qcom_defconfig, which is desired
> because SDX55 uses it.
> 
> QCOM_MDM is used by 32-bit Qualcomm SoCs, but there is no in-tree user
      _MPM

> of it, so it does not have to be enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
