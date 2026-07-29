Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1701A682A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334599; cv=none; b=jY2WwYaJQ99x5QPchMfnKRr+b/2KhJdDHhbcwy5SoMwqYtHS0twMG2uI/UiZYbd+/IOIo/N0v96ozktDN4kbv5NqmgF6/uRRGuN0GQIuAUSk9q6rFYXgZ6+DhHeaqtR4vXn2cG9/aCTBmQytsjJd++U4NCLkGk/8jgFH15p1YJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334599; c=relaxed/simple;
	bh=SXR8KMmnzVF/8QVSHt/J+Dh6oizq4Ndks3Cg7bpT+cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUmSKLmw5n3TN5IRxXeuyhn5tciaOSowAIYC5zcPkFZhpdtXhQtexo3GfxJl+vKlJT2CVV09LCQAbtDkXfM7Nq+HkTTvf5NCmSaHPGYzl5NqIfohWqtaM8WuRqWL13ixz56i69RtTwuyiWkOsAR/qjhGRS8rsclgblVWhb61q2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTDvDKaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwIHM7/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTDvDKaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwIHM7/y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD7tku2321985
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=; b=VTDvDKaUrP1F2wP7
	WX3HaPHaOC/RmWXOT1AMJr75dqs0Z+L69g3ieM/Jl3EyCUNJ8WFmAapo0C0tgmAt
	o6u8sIIQ19mj/RcojblMFzTZ7Y2d9hHG+ekmyfJpnbxnBgOd8AhJxpNzTESOaiXD
	i6WTrU5gO+ok+BiNaR+Qqac65fWPfzIC0MNmuUV9gpgNo4vnm7zH3XAHv4lJMjjQ
	oZTYrZgDRKoTY/F0KznqK2GRXZYxlDLbDr7ZBbNC52417gm/HD0uAOE34dz+8cfD
	VLes1jOeccGgClQvFgWS70vje66lm+Evv77P7sm1aOF2HxWPq3/PBGAH3IFLzLo1
	U7UyJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgx80mbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edae07a7so17276585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334597; x=1785939397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=;
        b=QwIHM7/yubz/jZ+RbSYH/EO0gMs5EUj5prcii9J46dSRry5VydsLobqenwzE68bNAr
         QtbeXgHwdPtiOV1mfI/Juo4ZeVcg2IABu1p/32Dv4adCeUAGCWVrD3n2ncihXEPnwwSH
         Zc937p9zNLCc7asTH2P05gaKaWl41BtpES39XqVIr9Fd27UFgdlX+YJVQvbU5HSM/2+k
         PAUC05VFwALpdiAaI+MAna/3aFRSZIOLst2mN09l5YtURQ78UUnaDzBIzwEQClcT04DN
         H8khz9P8pSsX4m5XlnV6W80gZgEUNNTdqvaJqGPtuonEwMjWo2u5HitRt/Vp9MtfWX8s
         eR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334597; x=1785939397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=;
        b=Qboa1EzW3JX5Ar4k2kh7as1BeERXu86ZnjAgWfULXldP5x+j9d0CSmfPsgTEOw10nY
         b5iG3Z8jTCQj3XGFH/DjVepEDfB7paztyf4jOcv/5YowMlIoLwksEuHP/iVQ6otR0+vF
         E2YDdhkiJTurwk0nzpvz1JClYL9wcEbFJSpN/93SG56twieDMTxPgN8qgQHU4CXrpxT/
         BuqSRfb2X0mHO2oNZhcdRtVrNcRL6bg5grDqZPZWTp1IakdNbcB+FaLQZ3JiLCxLf2MB
         qvPHdw1Sk/xA45u9LYYClh10QvC1d5k9DMd/xWAtIdyKyEqbNnKPQEMlVE5jdySb6t3o
         ZBQw==
X-Gm-Message-State: AOJu0YxCRnqWi3XsoA5KBPpmpfrUE1+h1hhVIdzIYSwpibvKzp3MMkp2
	i/JASD6WnKeMM1Ar5n+C9UlVp2mqSsiVGhxX9SIUUB9tLctqp7GZtjgARmIUDw4Tt+j48IkhuSN
	+YODX/dBNvceWPlxgOYtv2VHUx16osd/fQ6yDh0NQ2W5TxvwQOcFLxBdSqFyNNQhra1xEwsxKUP
	+z
X-Gm-Gg: AR+sD11mV/tmBKm0nRAss1O1A5o/kQsywVuMma0f/wkRrzSfllKE6XVdwix9dZ9nRYw
	gloI5e2L3BPP2WPHY+XfNfJrcLZUYA5unJf/sRNhJxdJAxk6lS08vhK0SFJ43nQjCoy6lwhgRpI
	W5F0wjQR/714jyJdScPcKLW2+egNJbiGFIWNNR8gEY7e7RZkZWsmgJMfoUKbmhVzy7XUbF75Ypq
	RwZjIHRb5gVWwwsY6mnRVcWIAmQSEsEe9dlwCO7BfXiGxAvE0p0Ts1m3LIyMdfCxOthpnjHalpn
	MRXxRp7OjJJTL1GPPgSbpe8yfzbNkfgRKpapjZC0FYnInhJpouTQoCHXpO8Sdg1/PF2W1XYsVJr
	+ctgAIHMILs0GDMPpzm1Gv4tf
X-Received: by 2002:a05:620a:aa19:b0:92e:5272:4e3e with SMTP id af79cd13be357-9330239e7c5mr564205485a.0.1785334596822;
        Wed, 29 Jul 2026 07:16:36 -0700 (PDT)
X-Received: by 2002:a05:620a:aa19:b0:92e:5272:4e3e with SMTP id af79cd13be357-9330239e7c5mr564202685a.0.1785334596443;
        Wed, 29 Jul 2026 07:16:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f5d69dca2sm4948701fa.35.2026.07.29.07.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:16:35 -0700 (PDT)
Message-ID: <470d18cf-ec29-4f45-aee8-64c5bf492599@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX2MA5fe9BE3d4
 EoX0Hzm5zAvl3m/KFSSYzdHbxPiKlFOFyDFGB1fcrF8RR6XiVZBus+GVWDQXEw5+f4cVh3HN/mD
 I9vS18kqlv3bDqHq8KT37mNBNJD8fpU=
X-Authority-Analysis: v=2.4 cv=MZdcfZ/f c=1 sm=1 tr=0 ts=6a6a0b45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fDCyUOZyI66MdxFVymcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cAotMZ_4G-kmRTIOLunw2wr4v-hDFLod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX02KIH40JjQb3
 DZ4X9kMht3YsYEQnDuNnzrw93DONiBUnNb/fkszY3HZLnHQ28Xf8oSqw5zpVQDlQKut9A279AKs
 kJqNGb3l0658F8q4bQtp5KjgrtAMzUjO6IgeqIq9ffQc4XxawEEfkl5vEfZazJ39tZKSWs5AX04
 6K+LMfpBEmW56YTKUCHo1WhgltO4ck6+xy5gJGToUJRn/fGgSV0xaG82CkwKJVKD8fXiPQFLv7j
 DQaKxGJA8ZY+jXCE8wBkGREIbRnIZSNlqSD3Y0p3Ypja6GNZ12bIRRkQzrnzVq3xrcFMXWfIBSb
 tn5K5McJ5G6ILoD155X1dkpdAtLsu2F32YraH2DnSl7/n/YbZ4u+b6rARfF+dQz3Lz6TM7zko28
 ZM2l0Adt6uuqaZBjn8ZV1inOV/qdRgIbtrOtf0ePsU8cr73Of5rahqV5kC/wgWiuY37lKvKuJcl
 tuUUJc3nzOz4Lhtci6A==
X-Proofpoint-GUID: cAotMZ_4G-kmRTIOLunw2wr4v-hDFLod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290116

On 7/7/26 9:11 AM, Kuldeep Singh wrote:
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Add the dedicated ICE node for monaco and reference it from the SDHC
> controller via qcom,ice.
> 
> Also, define power-domains and clocks properties similar to the UFS
> node.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
