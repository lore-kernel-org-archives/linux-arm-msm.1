Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340E3DE45C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791592; cv=none; b=QPAc+8eO13CiAA/TRVpoN48Eu54CVVKHlH3g92RjgdL4+ibjLiNP7BKlkyMos8hOpq9SQa4VKGEWvq6VwNHXbSE9mEX8cdfpHakiuAvdHTp87VsINbQJgxitjnA1ihW1LEA/HzzO0UCWXDQxEbFSy2t+NLDzVllTFNkh319utpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791592; c=relaxed/simple;
	bh=AGdZIVFbSq7k5LXJC/Zs3P1KBHxez5Pg3Oe8hxveMBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ex1cpeajNBh+yraQqF7RqIzrTVtCPyngGEjB6HbCw5BDlrAoTIPU1FjAGHlALB++KG0Cp9m8nKdXCoR9Dsi3PwlBW6/irpA8xwrENH/0evIzj2QTpE82bA/paim7arcwP1T5dN+B6Fm1a6/I5EEnGQSOeT3qRiSw6PKGa/xHmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg3IdgRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtwP2Gz2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg3IdgRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtwP2Gz2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BsDY3555199
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=; b=Cg3IdgRPrUqOwQIV
	uCsypdT5LA8bc++KOuhpLQQWd+Um8IM+wi5aoi65ouC4wNv/fPR3WbBzdIWcKttn
	9Ldprh0YQ4ZVkVolInxbn1eeqvHJ4mF60pWQOZSRHlZr0/bqlRaavmCcU+RAoCOU
	HScna51QztYU/e4/erLrmn21+qUKAN3ql7c5BOmv5tkMdiEMm9AOO/NlX9157DG7
	0XOvnx+3v4nNkTAwrkHXqGixfVRy8onK/cQBYKUAc6jVTlEfcNe06UCmwPFgMlmX
	yyqmhN43vaVKHftayhWzz9gA6oXU4bfkGWVwDitQq6TIxzcY7t8qrtLfDIbJkJZu
	XuJB8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b51kpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:26:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so1004405a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784791586; x=1785396386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=;
        b=VtwP2Gz2N4RgXOFWfsIQCYeR6uGSCLsihb7EejjKcNSziJyCQt1BeRgBfp7pVW+Wcb
         KLTaSQ7wzmypaS3hxjzpgkuwiPDjk8prmaaw7kGiwsou5JghDvR/sVM0DZRTDSOPzdKm
         rrU4WStpaCKidGTWgtl0I9UiiQmVALPs8r4pma/JyC4dB2tIL9/8j141Lm+zrF8j11n0
         N4G+Q1dH3zcWLxTI2tg/SNfO72tDEatv0jFw7tBlqT+KdAZ6JCO+e/8UMIjHAtXmkBAC
         wlDzVKziVxgst96e/n6sSzIu+2mlJ09LhPEX1/UAq2f2D418Wrg5LrnLJZlBlin7EGej
         wd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791586; x=1785396386;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=;
        b=nCfKexbH4T9+N7EZjtmGMK8Zme07vE3rdIz8qZi1OfzqAe2dupdT/W3cMiUuFecyOX
         ZGkJX2vYV6hlIrSl1XfKKlNFoOXO4qzVFaxgJ2zxt5mLtXL2+nbyTxHLUfMXPO+gk59p
         b24NyrOwQX8wtkaoeEu2O2OUXrxKGvQ3ZrvMv97EjWX5wPQCHLyM2Ev/4bkrO9Xl+OOx
         2JyRlckD3hAGUa7viTYOmwfUgoU3PhSw+fcknUPJeNIJ9khQWsLtQzJSco5gjQquiUU+
         H9VJAiLhixDe+rrLdxxMOzeIdYbSE6ugyKLuXLOrYRVKs8DHmHP4jhAKvXRAQ+Yy/blB
         IbYw==
X-Gm-Message-State: AOJu0Ywj1WTbddn3SGFxoS2rXIeiPqc5xR3M+NmVK4/LR8jGZMmZUhM+
	R6UixexdTqOOnMR9cDVXivqspVKkRHqWNn4kKbnatO/qQHtlcLqBAq6FwwKRqcEDmLCVrKRg8jb
	gS5lisdbaWoIZE0CnFvih75Xg9jiW7aeYWCtDwZDoizagMoXIN3gHAZYgfSFHuIzYIkKY
X-Gm-Gg: AR+sD10Ra8KL4BDGrXs8HyUlfSBbnneeQtYpl2a2ZgZNRE8Jo8nvPAA68S/GF83ArtQ
	cgzEyNJDkGao0v8dWuCwlgarKu6/kel+gl1pKMvU+6shbsHvak4GdXy/I85i1JWCd7b8JAOcLJT
	1e77kp6xa9iBl5ykzoyu/gSFbYY1o6xKWqJpZa0xYahBdf47AfqJUUJZy8qDfyaojN5ZlNwIa+T
	/rLunt41UFrGUq4hPeKj/3oa03E9LWHEBTZ35Kamzp7rcIP2VF+POHtaL8daYvu2xg9FbgfKkor
	J6U+9UPtCcNTANq6P2BHaD/LJHeBpf4IFRfZEXDgUEgDWfmqmeuXzhOsj+4D+JFZhzuePL4kS1d
	vsD8MKM+LbsONfmLf7fAVWhm0+nM=
X-Received: by 2002:a05:6a00:854:b0:848:3119:941e with SMTP id d2e1a72fcca58-84e2c181931mr2456288b3a.47.1784791586258;
        Thu, 23 Jul 2026 00:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:848:3119:941e with SMTP id d2e1a72fcca58-84e2c181931mr2456264b3a.47.1784791585827;
        Thu, 23 Jul 2026 00:26:25 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172862f7sm2506313b3a.21.2026.07.23.00.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:26:25 -0700 (PDT)
Message-ID: <cd5fe7eb-aa9c-41a2-921b-52a88bc1bf3f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:56:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3MyBTYWx0ZWRfX9yaO9q6rpMdn
 pHFymEo6qOXhK4feyQYYdmcp8duKGqNitfrur+HBzjQCFSYj4h7voVqoySJ1xFDYfazk/0kRWFl
 ZGQTXi11kgG7rPcuRGfnPkQ3TfhjbVsnHqgQn01dHzaTW1lUPYzMVZKOzthZzYokgDkzuVMG0jI
 uUILIflo4WfAkdFbkL/tKO+fEL42YG4QU4Dej/knOGT2el9VgeLmiGsY4B+tNQ8JQPZQ86qMiS5
 pW3oMzhkbhEW+4mclEKcD9YFcYGmNMWnBFYvuzCZwxRxwHjjOUQQc3HiIoQsXnX3bBE08+6W6Ut
 k+mUNYK0frYul8Oe4jQpr6VyYBRor28r7kSLT4k0Dv9eIdv1RpQnrhkX6ZzSONRwLoEqvSw6Aue
 IHm1eZ1ANWmjE46BBCAWeEYz2VkYXVHbbLVa/VwdFMoG+HKOd5xAICvvZE+dNZLfEW83OeI7znR
 wQUbLXr/Xm+vxR4Ew5Q==
X-Proofpoint-GUID: zaJQ2BBhEh3jFXLdy548zg0mSEnFyveM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3MyBTYWx0ZWRfX+IzojfHjZri9
 gQ9dlXC4Kx0kwmcHzkXaUg4X1OygE1/Kmy8Xde/RPpCxauyiaTtT1jCgc7dHRYyDHJv5g2YngWU
 F9D4Wdy61vIMN8bgdvStJLnMnJQztCY=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61c222 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zaJQ2BBhEh3jFXLdy548zg0mSEnFyveM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230073



On 22-07-2026 02:56 pm, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
