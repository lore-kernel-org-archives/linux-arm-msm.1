Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016935;
	b=ejdj6ktRPX4o+oMDUJRFvz9bHrkPt7cI5cRO+TWk7QZPy47bJpcDsR1Ntt+nCSGGRtgT
	 7d6cEeCr8mRwALgmmBQvH4abUBMEtBn4lI+R1MGY05v0sghNRA3yfjWmiKKXPEW3eM2Ot
	 RDWbvaSWibxfeCCHUl15jOpNqwUmeXP0rryMNx+7KjbYFaEp6PMARnJGcf77wzgDH7aJt
	 4iVlTG/2m8xKYvIcVnwkLwhqH9qHzprRjDMxK50VpmtxHmuLEe4V58xFxbmWwROset5XW
	 /SDuAYi3toZ6pEZMZvWaA477CYodecLwdCRfj3j8bTsdrvbUdfXraxs/pbSciZe3n3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
	b=bjVoMih/vpUKa1IN2yHRgv65m66xczaqtgg4Itdd2Xj38saIotxGfJw4MYAtOUvVxW9f
	 5szGxbvcZrcx7jqbc4pA88XysZOO5RYWblyWQ13lA0AcXtspdmIy27s+SfiZ6AklhRp4e
	 Axictt43yxSqbI1dnoZ7/Sh3AAuFzVQXDU22vlIHicCkbdh1gCn0dtE5jyXY2q9k+9/vj
	 frygrMsSdEZtRtryEqLRzLOmO0G2Wmv6AbE9KNr9uMn5qUO8PceJr0yczXnjjmewRd3wx
	 jDTk2P8AqBUIF0ZGX1sC5ZtfMQeieNZZ1E1OvUIm6c5J8+rgkiQ5pVnuFGjoOVTFrCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gRo/l0Xs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsekKf+x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED7606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29ED7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRo/l0Xs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsekKf+x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8HC2733524
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=; b=gRo/l0Xsb7hVMkRX
	1EkygAHZF0+2YgS/MpowSWWROkEhf+LNkEtrcEsDmhhQGc9ipXwOfyg33Jw4M8Q4
	pwCpwRV571v8rN0ze3xBYb8+j682Yi+SRuTfpllykIWTNWeOVzUVYLrcQgq5pOdW
	Yen1WzKtuA102L9t2pZMX1q+9vC3WOlREjDaJX9mdw4v55TwpjaBtDjSvwAmd0Wy
	tUFCnR2nq/FW4ghWfszlk67ejCrxxL00zH37LgVSnmLlAqfTTV2XVvqXIg0R70cS
	yw2KH9ZC3xEs2BrpOESlqS5KqMcTKhtcpCUOawvD1Ca003ZYh0GznlDkcg/zwVyq
	DjO11w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8k68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:15:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so39000785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016932; x=1793621732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
        b=PsekKf+x4eWHyEPw/DQs478VuQdoH8mpoRUNVD35qHrlTzZEZonP/R2uWCpgAZhVoV
         fv1X4yjcWTmPMoWXGkqoJLBXQcT5wW63nIDK7qiTG20KjbnyuCabMI2zOeTHf6YfsZKM
         UTPMjUgo0FPFhwhyk7ULqOfhkaHn52E8Nyfch4tfcXJnmd61XaFiBaJk7rf3fBOpeWJA
         UUh7LEqtFTfteEHX2X8FvcmG/4zOw0SSiLMN6c8jJD46ocXIDInUXSoOhVBz42sfm99E
         DKl07WsScVD7tTs0RYZJzOpj2KykL+1+daSaOs4AJTQI+42vWmYnaVSHEFDxO+KV0xUm
         MSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016932; x=1793621732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
        b=cpdebDYMh31ZfvjFEA4qMnaEBfqLjpHgR2e8lZJGY6aY++rOtJLvAQKBpwfMaKBpT3
         w5I2p2dx9wfGO1ZPl5iUXT2WSDLqdm+kKbkJvaL3CFOehhTEgNrLUvIdPHotrISOfQ24
         gkvZjvtGlav9zB/JpMCJ0Ih/UE8AtealElu2UhYP7sWAMJtYYGGPMZtfo3YSbcG8CVID
         M+62iAyf6Us9HF2Pxqs7aind0cWt5CNy7ec7OLngqpiZm7/xySEIHhhKpLwt8d7/fpQR
         iylh2qY8+vICWYSRBP52FPm7xI+8rkt+dcsFkuWYxa0EI3glzM+DcznoKtUgRNK3J8HG
         wQig==
X-Forwarded-Encrypted: i=1; AKwUvBwMAT/TrXZZEkKDDu9HDLAvnbykGF8qKdD5SJezvZwrq3M+Lv6HWXQsxZGz47qIHRm3Vq5HvJN+mcHWP6GH@vger.kernel.org
X-Gm-Message-State: AFq9FYKNj8+QeQJNJgecdoC2yMSDZNcGRYNs9JKw6DFUYHwNxXp5ciso
	2QOXrNivMmSf7KnZdotZ/+sIcBiZrQCk5E7H9XPd/Ooq/9L2IXLku+QAo7ogHF2qgDzhWimCc3c
	2tKRuEuV7I3gZr0wg74nCMNmTRjPPtgFg9dGmLe+N7PNpVRfIkVG4wntmmxPqKThbvdT2
X-Gm-Gg: AYBFou0Yaq5i3JOJTLsaOW6Uwi/0tE1LRAwjg5cEF4pzvt75CEPcRiYZk8k2Oe69uVi
	28FWVabA0OQuQKsBHQbYxSgDODggDxdLCLcF+dMs46eCgGMJN2Be3wfBidFSpHSDqA4sLpByxOX
	BHxVs1cd707ruoYdz3L/RVDLsultjMY667hPRNAgX9ItsQYi2ls11595Rrh8EBjrNAN6ibLnn9+
	Y465TIIPYOXWHVg+OC8bE26s2aHgQl7y4gSqhUcWu+Kv+wY21Pfgx6kd3EsRX1A2QjkfPI3K2Qo
	JDjkXjOaIEKuhU6M2tOAZ42AKBJUWoqKVE90dHWLYzEC2HfPI2eSqsy4EcKQHOWQq2dicrrvtQj
	gaJme2M7e4Ufvqw8JW7IQ9A==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr961458985a.5.1793016932125;
        Mon, 26 Oct 2026 05:15:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr961453885a.5.1793016931605;
        Mon, 26 Oct 2026 05:15:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8b85fsm1495986e87.55.2026.10.26.05.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:15:30 -0700 (PDT)
Message-ID: <09a09f96-7572-4f11-924c-49f7fb21e2c2@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:15:28 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX2JJBNw3w71AJ
 EwDU1O3b+lXWO+b0eZpbAdPP32DXGjZisWPT+ZwgkCGaPhFG5U9Tpm9FvaqiayxIr3S+CxNCdyT
 rJbTEIjANRPx+vevqpd4bZjsgUyHniQKC0PTT+8axynmYv66EfRk8pG4Y5y8HqCDLqx/JILMmfF
 HCE9CZLhEqvamKj6au1HEkM+Q73kH5IK4StrNqdGOTy6jKw6ZbuILJGKDvR7Svc1Ar2IB1HDhub
 swee3bma0nGyCBdxkuy4tlFo71jb3R/N15gpVMFShtWKQrZctJnhX7jQPIETKbZRnkx+pTAapQv
 JeabuI1HZvCNO0lSwBexkRMVRA40MJTFEfGP+vFTMdr4762U/URLJ4/eDq0qkh+IvNJVkka4bLZ
 w5uhuNPCVIlLVzQHruEL9UNKMNWgHFe5s++Z/fNI0AZ+X6c4kj+O9McRrWR7f3C0ZouGGUQ0oKL
 81DQ86qjaVr/N0+oJsQ==
X-Proofpoint-GUID: 6huu8py2MB5bsxlsLHoNr0Y9Owa4ilrM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX1Kb7jz5S6w6d
 k4JZ0OkEoBDPbpIQhBWR4qhLMdy8IdjfD/Lc5wmdwic4P5BEHxT66YdnFfnaI6atldypYRvj3Z/
 vZJZvOcnXbqrZhvgYaDkvdLqQOHvGPo=
X-Proofpoint-ORIG-GUID: 6huu8py2MB5bsxlsLHoNr0Y9Owa4ilrM
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf4464 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ssGiREWd8Ca_oH2jvLkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm660 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 0fca9662c64a..723bffc99b67 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -386,12 +386,6 @@ compute-cb@8 {
>  					iommus = <&cdsp_smmu 8>;
>  				};
>  
> -				compute-cb@9 {
> -					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <9>;
> -					iommus = <&cdsp_smmu 9>;
> -				};

On this platform, it seems like the secure ones are SID 1/2

Konrad
