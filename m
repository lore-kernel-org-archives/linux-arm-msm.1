Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016537;
	b=UQvleHkgJUQcYCUJmRfMj5+q5s9p0xrIlAqpM0O/3J2tIRWGBUP+GkdvxD89uvovEeVx
	 FEChyrFX5WRMG35Efi7Go7gNjy8nlNkxwivgePH8tbqInTE3lN9rZt9DgzkIR+BBsmwsS
	 0T6kOANuygBZTMBg5UNbScHLjaRDXq5l0e1bje8vEiqZ6PnfPxdiMa7geBQPQ3dDQgAvT
	 nfOmSVhf2KmY6nmSOlA5PhMF0x0ntusrqrxqvEnsSywPIe81WNUC1adBX7Wmb3XjCmCbA
	 sOuXykNKLo4mQyiHQ3wqXOqe1yK+k0OOFr0rFLVZwYEQ/d5E8Ej1jSHd174dSPhDPoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
	b=1AqBu8LCSSIRViXPYPljLgcKx81IpRbnXI7HDN8lENXmxBSx68Ke1BWSNN4DwdLSZNHr
	 NzOhDV8Au7V6ZyApCGaOUR32GIDLA+X5oH3s06t7JE/t1L+gclKl/kHjUcnQUU9pY20XO
	 tESYINpGGDQin6WPcH4bZxPgsCQpcfTxC/MDsSx+1ACDCQF2L/2tFDHW1uLCD8ok2NTI3
	 Tas6Zkr54539qxolBK+45vSwgEhKp9EJZHDiFD+aLkwqiu6NBennvbWAFngQ5r2sJLtYV
	 it7P7ua4bMNmOdN1VrdhSbD1175PY//Uo6edhqn/ID681LxPo6zbjw6UijqXsIqhE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQjh6u7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LVP/GDes";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38207606A325
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38207606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQjh6u7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVP/GDes
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtAQn3633297
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=; b=DQjh6u7ses5PHOUh
	/jynA5DQqOX/wdpP8HGWs+EuFDkOoXc2RRD7bivH5oj2kThoKCzGBjeaf4IaKUiC
	iWSuIJ//5bhq3MlqjoGYXIOLUQ15qobPfqECuD8FQYWh1y8hLzRdg3lLBWyJ6F3D
	Cuh9Fi2O1Y7sYNkRI3T/VgkU5lngwem8vGIp8xfpIr450Sgx24pID9u5UF8UrfBv
	0W3XIxkZHZo5LooqjQMqcVSxMdjjWZBXa3kRdoNNqsmGOBM9iXjO2s19rA/u7me5
	5a0C4rfw9O/zb4lL6Ptdd+FDXNY0bkF/4yiU+ZuaR/iTNUtoeLC/vhE5q0lw9wzv
	cAvuHA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0e0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99067ffb4a2so99855241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016531; x=1793621331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
        b=LVP/GDesVypcWgIDKggpuG+ADwkwPa62YkMN2OOMa2jxPF8+5VQq0GzzHFOzWTXd6X
         5bMDQFm+mvj9/zKLHScv0R2fNBCYf9nj7ZUq1BbU3Td1q8S8hHpK7lLyTzpBpA5QfMMV
         P2Y9yoNzdVIf0sgCh7iKmH6iypme5oVJT8pfxvBG+qqbQUhL3MPb6v9aSfsIN2bggnc6
         tx/K05IOIIlt6Epwz5DgfGkhHglXVAeSAPxkRpCy4o5Hav+4Pky/yDblWbM0AbGVNqVC
         JCM8CrAnXf9j2YEGG/hvtiQHs3IgjG221j0ZcllpU2PrQn/rJ4j4Lg43I84clx6H1yz2
         Ri1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016531; x=1793621331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
        b=Ep5AgEqUxp1m2GjDFOrTd3sYAn0TankKwjUirMdurHCuw5BHSZDH56ENWdT/SIpTqX
         dy00wc17DF21KGXgFrBXfTJ6ZnyQZlH1QEPtdx9a3y4eO5sQ4s48MjuRMdpCB7SrZMTt
         ePO/9e3RTcWVdkkTzYTMHxn23oVGsCdn8MK9BsfSCyP/M/F/LTVZLm7NPnDvpcSgWTGu
         7JfwRPk3AJ+abt0KIADkXPXERvspqj1GzqURJyhKXR+fmcfLzx3fSgdCGHvSe1dmG0/p
         8oVUjgnBAHAJG87KxSRlLlZ76NQgTu3tGHIbHtvzA+4N1j5P5aoyHTnqTxcEV6IY8hKa
         Fb6A==
X-Forwarded-Encrypted: i=1; AKwUvBw7j9bFprpyQEngPnGUiJ8u7LrJyKsHsyJxbrY+KqUVtuXlrWMeC5xa7y41T7QduP/klTGC53QwMQc8znNx@vger.kernel.org
X-Gm-Message-State: AFq9FYIn+OAnBY13xxICBuWMuRqt6971HdkFmCcb+FUBuWFN+vzpFOoh
	ASQclqV8Juvgoj3BceaBffKWfq4eXyYGI5iWxVDg76xva8Ue4xIrKMgTBdcweN9firf2HMdDVBj
	PZCqgxsWqnMtGJjwY2ewXR2SElW07oHFwa3oc4QFO8+b6QZmh3dL0LhAOXeE4xpi1kITm
X-Gm-Gg: AYBFou2DPHFtiHc+pK7+ADh7XijFBvegmLOPvUBp3Jl3PBR4YTzf44pSwLmSzKC1dDF
	adYls0yv9B5li9jlqiqyfT8ZFTD7uyj2Nom48JrnvikKGjTYYx27vGLZ0pHDnGxpH7tvTApgZH5
	18k5T1RGV0YmtTjCHl48+rCnj9TqlVJKvMzDkPjctHSRidCjgaoTy2sChkW79BpPsWgaMrv1OMJ
	oI29FeeauAUuXfQzUfdAr74DnX52VTdip2VvOTX+oTPny+q6R8HYVEq/KfnVW3Zd128l+xyhEer
	WpTJh4y9dJUjX6Le4K69qdta6MI2sU7U2YbZt8g3b50XO+Og2OQvrIeHLXpJmwd4xzdsByeOJ6S
	gIelCPEVW5pDnE8bSEYqp9w==
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1485280e0c.5.1793016530638;
        Mon, 26 Oct 2026 05:08:50 -0700 (PDT)
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1485236e0c.5.1793016530072;
        Mon, 26 Oct 2026 05:08:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm312729266b.49.2026.10.26.05.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:08:49 -0700 (PDT)
Message-ID: <b4b2c7fb-1c80-4101-b643-7a7f619f604d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:08:47 +0100
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX5dYNbl77G2aP
 bOBsHtrct3cQhfXf2aAesKtXWVZzv3yO5JVXqHpOHpoo6+pZQBd0zUVaSqUH+emgTgZml2pNIxl
 as3yXy0Gp4H9xG7geay2xgj0xBuAFDI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf42d8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HmQ7WK16ZiDfZ1s1pZYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Xd0kcszBTSqTXj1ibctcufwY6kiVAci2
X-Proofpoint-ORIG-GUID: Xd0kcszBTSqTXj1ibctcufwY6kiVAci2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX4Vwo+Wl49yk3
 WS8QUauT8f+g0erbUcR2vCg1PkNodPLsSSsdYEBQY32LZ9cx/K0ydmZl4qCVga2J0+IGRW0bjCS
 5kFxiGHTb2mfqJop9QvpV5s25dcf0ehGEq9CX/FZBE/c45vbVnVQNO5o00BodVMVqhRchqfDovt
 vxo0pWBjuCetbb3DoKl2iEsKguq50lbQirTBVUv3xgAg49RuOnvCbIiBk5o5/zMqwKtQIhcKYkC
 ocnx3GRF43v0gfBzNNdnyVtvn7EL6QI4bdlTrW7lzSo1L5A6JwsDB1YAvRRbmAiXq/1rgkXypDT
 9PpHDYt59D9Aakwn5Uit6ES54kQm7+V5qcOrvhV5S02Mtmva0X/m5grjO6aCXXJDqycPzeUrCie
 NVnrbHnWQ3inhY+VwNowYJcpReqrbrELZlYs8T7HGkvGtGMPDFGbu7hDnWBXVFpbcEk57r1v5TG
 uCL/qxt1b7pep91EVDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from msm8996 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 818e5660df91..51ef306c1ce0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3701,12 +3701,6 @@ cb@8 {
>  						iommus = <&lpass_q6_smmu 8>;
>  					};
>  
> -					cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&lpass_q6_smmu 9>;
> -					};

The docs I managed to find suggest the protected SIDs are
2 and 3 on msm8996

Konrad
