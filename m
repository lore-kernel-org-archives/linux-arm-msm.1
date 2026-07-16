Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9183502A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784176327; cv=none; b=sz4IyEpV4JGiIdW5gQ4+T408wrzSuj35lffReKHXcyZ4D34dMpFO8XbZR6n/Rv3IvT3VkHo1ItWQXt5KCr0n7uF3kQXCM6Rxm7cz0riAWot7tWvuK4+MFufG74zm1F6pE92xripw75KjLChTAziGSkdva/7IlHamGZTxMSy7UCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784176327; c=relaxed/simple;
	bh=oR5AomPs+1hHhjJbWY1HBJmL69/8/Er1z3HuYIwn8vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Scu9+CC7pSRXcvJ5g1oeqnDO1j68Shqicu22AFT429Del8e+nMUawhZVJSy9NXxT5P0z3dHO6jZtcOQlQbh8NCPQvDbWd97yGb1WBnnzyW8sp7mSa2VhzyuNIxufrWEiqpMmRhHOC/V9C56hG5q6CwPdvsFiYshx4QIFclAUyng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmUxvRKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0MIrhMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmUxvRKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0MIrhMB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wXwe1689745
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAxQphIx1Qk/v7bg8ehdwSN+QejMZHgGX7T9KKnsWiA=; b=dmUxvRKh9Me95ZP8
	213CJvRae4lfEWZjOX0gVlv4QTAnH3LQJnL0ilmXzyD/br+5AErysxr5PqlsQcuk
	oBx65G611LB0JWv9PJSgy5P1ddaupEopBHLkRY1+jSUNYUOT6ElLc3gQu2hb7ToZ
	zlfl0iKccsyMFlRzCQSxaJeZCEBLlw28iTpocxPSiCVnvBSEyDCWD3MuZRe9RgBd
	/oFihaVjsmghK38qr7nOSufPNEf75WPDGIzyBdBt+O9a2IA8nkPBSkYD6WpNL7hw
	Yoe2G3rKx8u5LGtFAGG1fcFVTXTjERiLQ2xB+xoaS2n9tv1/vb7wiYCPAlUn0WJ0
	zvd8mg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmkyb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:32:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so11127452a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 21:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784176324; x=1784781124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAxQphIx1Qk/v7bg8ehdwSN+QejMZHgGX7T9KKnsWiA=;
        b=h0MIrhMBje6w++AbbC/4aSW3c78grfpZtXnZvdZlQJB9chkbJ6iJGjTKQWKyrsoRbf
         KZ2SC+s0AlL/i/7CJemlNW4qw0xZlXK8GMKCEsQodQxJ0lamI1Xptvm/+BpCAyfTuHNf
         g4Q3Bou94PODbf9PBwhFaJwBQVLtn4VbLgAovcSUDCCYZ3ey0TTsXMrLfY+Tfw15YE3B
         N6S9407Hw+6pmO9IAoQ+jCEN6Gye4Knr923HICASmwnwPhwx7+Wj8uMJ5fYgnPI/JDuT
         /5rHEqEqeIyjaBqEfh0TtlSACaWPtbn4HknDrSb5b1FOYH0m1FJG3JaEnWzlKe/IlOub
         DRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176324; x=1784781124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAxQphIx1Qk/v7bg8ehdwSN+QejMZHgGX7T9KKnsWiA=;
        b=T1sejQGFMXJgQLyQIrU+VEBMVODBV/PVU5Vi2V87oFbzBAWN17a9GA9831II7JBexj
         QV3skvtcCx+x9dMP8WkcCFhqaXV1g7zMw7fcKfQ213By5H+QNqgN2npivt9A65/W85Hl
         lHRenNHJNcQubht2L+JM48qnvoCmY+U7Umlm/6wLA0R7dZz1Hri38dpIAmY+NIjpmvFF
         sbXt2EDWNsiI6lMMxu6/0EIObpbQVcqVmMxEZZN1kEPOY7hy2AUI160080iCDSK9+Y6z
         M+XgRoZCOJXuyc/rSMxVfwu3wIxetvFoe5kfSi7Y7BCcLpITenRvg4Lkth+0vjwFMLN9
         u4+w==
X-Gm-Message-State: AOJu0Yw9ChRjSSr+yzrwC4Ff4I9KIKaqOE+xumLbY5bhgboZSiia+IPB
	EwcsfDzdzQuGdL1CY5esuoufeEHvqlbMkXZXGUAlPNP0NePKs5e2Fm+4ok5j1jUjqjV/5MNdC1S
	C/Ng1PanFDQMn7banPEJfVn8TC5emkNc4AacbHBMMeQrI2sYNyzbkK85nf6oD+jsl5zpH
X-Gm-Gg: AfdE7clTpR7zocTJikVF+TrB/voAmph2w6NreeWVIZoDPn3JAyPZGJrJmzPgFVnSz1h
	PXC5jBQUAGj0YLIprd8VfokvDAMPQTLJgp4fBdgm9EEKYsWAJATKU+Qe+7DfQerXvvZukDn6fi3
	4Ey8qX2gVxGcRC+omDR3+1F3Z617qRuae1AVd+UT9Sezsq8/j5Ffq2ppgsgNc5xO7Aa9zcQr5Xs
	Ng/efu75KQZG83G6/7zLSJsUVu6VwQp2wS1kfzcBYpbf98grbkXSjXCJbdHJeREsTmr36AKhoob
	DalpzkCeOqh1z0QCjx6AD2k6KJoHtghQRrfDIE/3SY5Lnb8yKbZc1HMJ3BZfUGSxVWPYotWKI42
	H+UeelPjbgzKbCRQTXbMu+L7+Wv0=
X-Received: by 2002:a17:90b:586d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38e29f85696mr5662959a91.10.1784176323839;
        Wed, 15 Jul 2026 21:32:03 -0700 (PDT)
X-Received: by 2002:a17:90b:586d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38e29f85696mr5662932a91.10.1784176323411;
        Wed, 15 Jul 2026 21:32:03 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm7308040eec.11.2026.07.15.21.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:32:03 -0700 (PDT)
Message-ID: <98eb2294-51ff-4e0f-9e8a-c2d0d03da77c@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:01:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for videocc driver on
 Qualcomm Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
 <20260716-maili_videocc-v2-2-7ed5ab140770@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260716-maili_videocc-v2-2-7ed5ab140770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA0MiBTYWx0ZWRfX5NyYi8QPVQKQ
 jW8JnuFkMsdLmBBgkIriC6mgPY7z/c/rKj/ZVcP308+15S0mDqtYuh95rvIySrriNzLYbMM45/9
 lFu2atZEpu7+DJbCepoPiqpmfe8HC9Y=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a585ec4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KabViBKo7pAC4wHH2OwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: nNg2C00td0W0j9aoEiavyKvY5vR-sfIF
X-Proofpoint-GUID: nNg2C00td0W0j9aoEiavyKvY5vR-sfIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA0MiBTYWx0ZWRfX8Ib0wHvuoKuX
 OJP3+XvQQpBni3CvbgtKr8GgJR1H4cyUpe99YXDKMNmgIb6KkxGIi7HbJGAqrPU9jfgNlmlZZuy
 p8Bq8yujou0PgPChwN/yCxC4u65ECNvE6jglhce/YVcpHmhHignkT9HPrWFOhjjOqb94aDd/rWK
 Sj4G86zmzEYJdff9NYc4idrl4ZvkDf3LBP2TqwJVGEEbog0/upgbvtfE2VJWrOTtyF9EEFChSWZ
 yyNYiYw+LU1D8bCP9leMTdNhD7RtSIHsPWNZuK+qFP/KI2yBW847O3pRxi5EBfnypgz5QNuDyxV
 NXmeAZk5qFflclHirtxQ2q8USPc7JB6X76nVQBWBZiwQzDAKmmtsgazgZEL6/uMm7H2Wjzbdogz
 zivxV2Q9OQgKTF66AKWTAX2lOpEJxBsDL4B6szWTv7OFNsJq0flEybEr0h/C/wZfmRdEhPBT2GS
 HQBMTlPN48za3CSCmyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160042



On 7/16/2026 9:38 AM, Jagadeesh Kona wrote:
> Add support for Qualcomm Maili video clock controller driver for
> video clients to be able to request for videocc clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-maili.c | 660 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 671 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

