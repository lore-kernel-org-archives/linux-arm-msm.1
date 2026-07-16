Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F8444709
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224375; cv=none; b=WTUkLZhzPfh8ZLlRDTzWQ2dVHMXbQ8ZglrNFJ/TslI/6LLp+EdPIn524LyQwZKFfgBEvXgPHm0kX2OWUxDWN4J4Eqoq38MNk6Wsv1kZ1/VRkODO3iQqn1+3Y2MYhFqDPLeAsIdehgub6CEU16+eXkTJ3d7PT9kYZDpx/4T4hwyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224375; c=relaxed/simple;
	bh=rkTsNKBe2vBiXaOmjysjswJE0ns/iDJRIFhgpdDbvxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2x26JuFCtblyxp5/lFAlIU8NkCTY6BaDKz/5taKD6tqu37n+Y44nWZ3HKy608zPs9tUOb1PKx7MK3YTHIBHy8UTBCssDpSNmxaL8/8ZnqzY9gpThwLU2JcyxpI9uChOV4Z8J2qEghnVAS6nh9HFUOl3mPOoRfjHXKajMjZyNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8rNpAKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLWqXqza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8rNpAKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLWqXqza"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSld03395603
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=; b=H8rNpAKk9LIDxm1Z
	TyousgKeiH1iMmpBS5G2ljyekzytTX34PlQOgpI1vAJDVYKffODXl2KUEndPQiTj
	PAi4JUoi5KDiARfBL8UD7GnZOUjse1neWlBmHONPdU+GWEzy6tEi/3Ddl/QOTHEN
	6HWd/3h6DX+gHmgvkoB336v/n8a1weqkE1Ej5BeZaLcObqRDfEP/5qechSelOfqT
	TdO70Gt/P0LqNSP1jeZ6DKnmlJ+ya1Ceh9dM9gPCvq4+JnorIV9kGzKJVQQoe4yN
	rRkQ9kPA0KVE5dW8xcmz25XyHv5LnANpXIT4vAGved3JOt2BiV6k+OjvmAU3MEd3
	aGmLsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym19d28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so12968721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224371; x=1784829171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=;
        b=GLWqXqzagUa/grx9CMiU0Ns88fxcwbREZHZ2d0e2dFNlqMb5JbdKphyxumfRky9IMs
         /9dRyyevdBzGysoJlA++Aqs+GJb0DXx7UQq5zuep0cGjrtROm/guAo10M3DscFY7v7y0
         rMdrlPjzrLCyzVpWqXVsQDxrrvl0Vwx/OtQBYfpqsNzYVlDjfd8ee0Zg4WmYcmAUI6sY
         6ZZz7/1Dp80wzQNkO1db9QMW32Tl1DX+Y0y/++573bdm5JKw5y2lUP0A1yXIBvGJplDj
         bvN1DtNm9WR7Is6IRJXGjw8TDWViKnpQcRJjWSDmynbdNs+0Wae9hLYhltnFRlgb9TCJ
         6m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224371; x=1784829171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=;
        b=Yp9aOZDIugUG7vdbAcdIxXBJ9viOKqrbjgneKlXPt/PqK5BCvOEXBLQKfc9BQC9Ggl
         XOp8UlZTTkS1OQutk6/9o4mHrh9tJd+9SkuN+B4EeYNP7tJthcSF9ZxVEQ42EwIMzI8S
         YQkDGdokkEo0rkCxwV9zhY1eD9bkHbtIxZk2UkwBnbSK2qityNbdjHl5rdPIpppN0/Cs
         QbC98dYyCnOnHJOHZvercpLRsACic6nO6ETtIbcaTyFpcCxfoZQ15yC+aB8V8Btx1OsD
         sox0ieHKX7gzJkKRBnNdxW4n7mF9KgAuTwfJHId7AUg31MOmVhWY76zjf1kPPcmL1b9l
         gjBQ==
X-Gm-Message-State: AOJu0YzotNBssHinYfoTvzkO92n7Liyb7VN9lO5mI3jJ8RMYSOGvo4GC
	Tkrl5HNq1UVEz1776nGA+dh69qqizbsM4BSrWZEzw2UsGGWYEus8oIhaGoh+koj56ThUPlcfgVI
	9kwq6Tyibya8PZMQXoSbzqmfrpuXqH+0VfDH3j5aLvw0E+/TEv2jjwqRFjHr1QvhvB4w2
X-Gm-Gg: AfdE7ckkVK9+1agFsktJRxUqbQYniwLYxSzpfPN8huPROwLM108ei2LrcGTCSQw4OfH
	MSje3jiS/lXEM8K3LNzTwASJs1hdqFwBYgS2bOcjnW5cXu7k08dGq7VnnNBeQOdzkdd5W8x6Weg
	e5SMygYaSS+k2iDcvkHcijHGMWW208ofGcH2YXkC3Q13+HKwfi8WemyepyhuGjndhLep46ISR3z
	UfhxRj1uDOHone2/NyVUA7eYavlbStLJ8y9vog3eXUvcYIYQHxq6G99eVowPfbJFT5Cu8aziwKk
	JKHzVSAaLsJmPk3vL4bhNMvrI3esRxH71oxqim1JlVLmABjJX4beFiG8MLc4pP9kBglByvfhDPG
	Sy1qwMquvXOpj4WzdYTxqPiWE
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr189542711cf.5.1784224371261;
        Thu, 16 Jul 2026 10:52:51 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr189542471cf.5.1784224370850;
        Thu, 16 Jul 2026 10:52:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:49 -0700 (PDT)
Message-ID: <0a22d86a-b397-4244-8080-2ff4ff4b2a3d@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a591a73 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t4MeD1I3O73H1IN0jCkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfXzUTPYRsZNoD/
 ZIZ4dY3QOJXcmtBM+j/r5OQnqalQTHrasy5j+T5cFCbWS8bVHEm07fI8yHE+ZjvtMBvWFVxYfIK
 HTJcAjfd86/jWoWg8q9lCPQN7Ipt4pHTyz7aXUemJOicR1vb1ACJqTMjg7nL0p5fMf/PVnMZZhM
 19KZRxChgZKKqTwOt/4dTtGfDqRxcBc1pdV2jhkw5LIDv64acLW8EtzUfViALrXgEhXQHCCBST0
 YbPff6oNi5SB3WuqQdFJbDOJ96v//pdB/7g2b7SFPhlJraTso//KHWwWE7VbYvbrFRP0cWDU50X
 dxpQ7s+2ni6d1fxPAyDImb8kZXDimxRCGE2gcUQHL+L1Jo7N2TbNkTQotnKEM0APUSbjSGOWXeh
 qEKS/WMKGBabngx8Hxc3DNCW+HQd4/UPVAIi52EA55R1hm6F1ukVJCCFOw4EXYu5+O+M5C5neuP
 2fXor5htCN8Ix9f99IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfXzRCX3s6frnq3
 SaVAFjRmxKK8cW60PJvlSWU4Y9zrNekqtJlMOOi/Imm7OlCYAjl7dCybJ+/LTs/3AkjxkUa49j9
 6E7/yTqobSAzQGveHu0tCimDh1eQZnw=
X-Proofpoint-GUID: 33fpYDsV0Wk2_4vAYSxXZalgpWbZv-Nf
X-Proofpoint-ORIG-GUID: 33fpYDsV0Wk2_4vAYSxXZalgpWbZv-Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160182

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
> bus-width and spi-tx-bus-width to 4.
> 
> Without these properties, the device uses the default single-bit bus width.
> Configure the board to use 4-bit read and write transfers so the controller
> and flash can operate in quad SPI mode.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

