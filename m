Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21F25A354
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602495; cv=none; b=iHmmPWcRec5oEdM1lJtoLhUuuv+whBd76RQjzzgpkqL4v1/Uf063oxDW7B4G+PaEY4EyNDtJ+mE8nsBjtjvMGPgVMIgtzV0ZCJgwnBaWNeemM7WouHtE83sJRuL01Wmg/E8fu7pPgQbLKhWrIXi46ewYv2Ba2ZtEm8Dy9QKU5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602495; c=relaxed/simple;
	bh=Pa/DDBU7Z5wSIOAjTxz6DemcPLHkUwB5dqkRtijLgCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRLZks/xBETsxUOAdQ1HDZnr9Er7axKB+e9IxlfaZBSiwaB4FBrCTT0lJ+jQCwJCnZ89vpW4E/qnqB/3PNAvfm1oUTqlAj8LrxuRSLOpt9KVDV7jOeOt5B4tFP5hGkbZhNBs9K+x4qi0k2SoKtcXJLomuB/8SA2fPjuIaDYBLnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr092m8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agS4LsqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr092m8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agS4LsqM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSgV1672676
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=; b=Tr092m8aQNFa3LhT
	nBE2BeXJkTMyr0ny9vXBEDGYLtVhi4vgrmn1qlHqx2bt91OdaUWLuHm6r3k8PdAr
	KfV5IXYHnMOuf/FtZZVWbBOR6zAhbqFMq28J3LaLdlQj2i19oeC3ubUcQKy090yf
	kQWzD1DZOZZg4E5vQZucgUohHFWmc9xkpA+i3M+4xW7KQHUf8MZDzBuPJ96vcDsA
	8SayVSWIWa6CCgHMVcW/1ckHeSFe6Vp97KKImOb/fhKIRayQ1q3S4DVgWnWxueeA
	Mq2HLr8ND6fFWCvmh+lxRpHIQefUegwC2qc2GBR+GHj65Cz3YLlDTUtmuEfv3qDo
	syA5Iw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscd3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:08:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96927edf751so23910241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602492; x=1784207292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=;
        b=agS4LsqM6lyCYKqKG1o5d7cOK3+YZcbjahxJN5bWT5crVuv2EjA6kaPh9BroPe4kss
         cUvA3qs88xjPuHXdiF2I8d9DHgEiijXaNB4nuV1Sq9GQp5QNjQjA8VAoSA3bhc7qwy3b
         FCqs2OdlJHl8AvNrIg/2SvIq0dOxZLKb5+JkCznpf+fAjHShY+1v2zX/IotmeQK1vPWG
         TnkYw+ROTlF+qjTZX5hh2L5sDUI+980nQSz4xQlaERNVUoPQ6Gz3klOU35cknwmP37uf
         fc2/UgvTNTGGBija3OSm3QMq0gacai8PonRS+dh4G9m+FigwFMfnFLwAQlwOY/S2QxBW
         V6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602492; x=1784207292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=;
        b=PnyPY8JGozW6IRAtBnBRp93ECIBEJyrVOw3I/OT8DD0Y26Xc9s5cRMtKOFocat89BD
         +chHfnbgr7b4sayNM/3zTClsoASTPe+773mA8DvG9v7sTVNCz/zm0CGGCaGqf0/7jNbp
         G3G++C7wVndr4y2qhmyH3Xh6g3ttZ6Q/g3qEX1DeK5gSsvSTiZqRF5zc5RzG7onjWqYF
         IH1OzOj/OduTidYhVDmaAS6GPC7Z/FmDQ6YOOIIo7auPkl8x+mK/g8WKWRtxI1W+rxNX
         Tw5vpAdsS4BC5gkYNPT8A3hPWiS0wZGKF7t7yrw963hPSR283vln0kqtnjtEJPTtxskA
         2QKg==
X-Gm-Message-State: AOJu0YxjXfZnKu08Sb8ml536orlV9AMa3nuaA2B/sfiMkIjP20JjXxPS
	a7Z8Q+DwG7vI15eTjsDbgdNjrG2whImgMPtX5AU9Zrmn18ixRE2pDrLr0cYey4SwfWXXnimUQe5
	SLPAbe7r1a8G1YFtJjoB17BdB/3kQepzuZxWL3G7gFUe01vyNk03nz//imuhOel6cct7jrf92PK
	3N
X-Gm-Gg: AfdE7ck0OYeS9goITmiKFKGbcOS8HTUa0xdQxGs0XHIGsdqN3S6sTuvZPa3NKLcNkqT
	Pxl+pkJ28GGFVXAf5m35jZQ7gGHvlMhjquDplZqTDPELvdpWwZ+VQesznZgXqr9nfQqo44pwc4u
	7siXSjIs8Id37XTDcz9C7JeZ/vyqsnZARH/kq6V6wtsgeTtl8wJR9lW7myLcWvFuHMAMx9u3rni
	0gjdHK1qv/tDTpUYUjPwXOgbQZBdHLX9x5d9EPbbHSt9tSUcW7hf+4D1M6dH6YJsNK8r/7YkdQw
	k/77waZ/3mBuRxlZtkJIMn8z/99MOVmwol4dRfG0Yhk/zdSIHGNi7+V90SAYfscYw6UVGhJzbKq
	SNQx1fSPa3M8Cw8DnTSvkW25wklVpklNr/lk=
X-Received: by 2002:a05:6102:292c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-744f0b2e6ecmr1020049137.3.1783602492565;
        Thu, 09 Jul 2026 06:08:12 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-744f0b2e6ecmr1020024137.3.1783602492182;
        Thu, 09 Jul 2026 06:08:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm2007426a12.31.2026.07.09.06.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:08:11 -0700 (PDT)
Message-ID: <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:08:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX0M9AZtBQWy46
 IyLi8WRFdqBqP5hfD6Xqyk0EaB9gbDGRPRkYHJ6jIoAZXsn7VD51ABBvR7D1QWkQ+IySj0jJnLa
 cSH9J8laZgUU4gGg/yZ+nLtSXZ/oitM=
X-Proofpoint-GUID: 6QtQH3noXRtbebFPvknpmDaOLKIthSGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX9x9N0X8x+li2
 kHZ/HiAZvbmhh5tyTgP1aYbvJzO4BuzmHNonkIwKClJaoikw269iDUj1MrdHbQoUKf+tsVt6P+U
 dKo2BR5rVG4/nNLHzTtTT7CxMQQ1+ULPIORzNTgPA03zLvFFlTTBvs5bErZrg6YPs9YB4FMCBdw
 vymDQVIW/rsoAr8J2l3763Zjno7QOyRzpEKkmduphoicFS/UnodhkhZ6eWHJD0dw062bqk8lCxQ
 StdFs10O8JZOz+ys5Ds2hUoTYCTJJ/3FCeCm6Vuxy6xvdWKfajfDCRDAeHbP3aTc926yufygfLb
 N98XAeZ67nXW4pFHeYgDL6Tw/9FZ7aiafI3L+F8lUHnQeZ7saCVvkDjnyyEucwppAfjWZOX5VQf
 ++aLPHBjLp3hmlIrVWTeDgqpf+hMw2rVFgVokOlE/UGy7Mo1cVI1hO7F+DgDLgY8hmIuffabSpF
 j6jZxgQ5M9S8Hd7AvHA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f9d3d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VeGrD0z-dcJTj65ads4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 6QtQH3noXRtbebFPvknpmDaOLKIthSGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090128

On 7/9/26 11:12 AM, Abel Vesa wrote:
> Since each serial engine will be enabled as needed in each board dts,
> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> 
> So enable it by default. This is also now in line with the other SoCs, and
> also with the second QUPv3 wrapper.
> 
> Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Go ahead and enable both QUP wrappers and both DMA controllers,
a subset of both is assigned to HLOS by default by the tz config

Konrad
