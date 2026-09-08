Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5E376A1E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852255; cv=none; b=AwUcyRRG3AGo7pcgRJEcx6/4WvMgx1czBYeMEJGH1RoY6XHxPayededRy6fgFCsXdcZcf2VRYz8hIuo7i9fWfYU39jPp9NVTSb2x/FJhLimKc5GBxz9msGoObI3NVLS8vOKxcD4pTPLjJHLZGTbrKibOdtv2XWKWMJRcDk5YJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852255; c=relaxed/simple;
	bh=68mN8dkbcC52j8QqeimD9o9xvyvNhT0HmHwPEE0CFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7SpJHhV1hO/eWndzZ+Nv9MzB4wUVL7eT/tfnsjTWamlPH3HlIr4EWCueGTkfDh9p0lRbANels8A/Gr0GTBU+rfEAceDLd1SJs+5gBGgguPMN1HDPr7BqKwJJFkvQNQTfnxm5v/6GFtRyS1W47FqkpRIAmsRAz9uVS4ia74arFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKulF81J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0eqa/5Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKulF81J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0eqa/5Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M5FR2502683
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=; b=nKulF81JCCJ0nrgE
	ZuKyyZDC+NjlFSzBRYTl0v0ea0UVam99BTdr44yFbRol2b3faqm5S1vSz75QR2hM
	9Y1fP3QiK5r3JlGthx0ZpEPRf/antQ1WdKTybJdgedXB20Fy0EhVTsghi6wxhPO+
	IYlFzuKE1I17uoTPRp73I7hm6yo2g9/k+n286M0hCAOsjOHxQFHstHgrknfdEBFd
	MTFoxc/uZGE8S71kmgKYzz5MLyvHDFUzbt6XEiJDSYH4e8T3vIq/3BQzwkDNKxSJ
	9hi9yzM/MPPGHbyabmCPCtBR6htjnWacbeJClk+shlUdi4EZQ3TjmXvDk6zn+ERq
	J/Y1vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7ga97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:24:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso32999585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852252; x=1789457052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=;
        b=f0eqa/5Y2ITAHYnahxnfEAWDoAFgYYGx9Z4hNSmOtm0T3GvirgOTQ5E7H+JGya/p74
         xfnVnN6l2sMVKP9CfgKCmJjgSH8uZ8ajmP9m6VSA9I3AyubgUI1df/UvtZJQ/mndxfKA
         sOEzFA0cSi5jeE/bMNqPlyAggtVdlAh5dKF1yHg68+GvG825puJ/yQjcsLQDkHf5KeMe
         aTXTgb+ULZvsUDLbZv4s0djivudQiKDxkwPj2RS4PFWd214soLBmOsRDJ1NbceTa3O8P
         veDKHxp0b8bGtzyUGbi+bP/aDgXpa1K+zrf3zTQbXaWYMKBSI4/QoE/35e/LQyLEJS/G
         r72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852252; x=1789457052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=;
        b=RbiokbGMlhSLPsI2OIZxMoRC8XVZwM/TDLrrKykZZqtqll9R1XoB/L7mlkXv8yiS1K
         sPGXhMhPGnisw4hQEcNx7oV5YcRPNu2p2pni+fsmGVuEy/IfhA8oF3MTytu2d9BkWe/4
         s59RlmU9Fki0wyk/Cyij933bMV0WF4KGumedKbJRjpY8DKwrQb7kjzabR40CUB6CItJu
         84iCmvIAd34GOOialBxazWa3OCafs50ZGxGdIryJ+SFVPtibrlFYGZ2qZToBIp/ScUIA
         3gQLtR2oyn+MDEsZRwJYI9gsEHqsJpbgw0Z4eMI5GIKoXuMbkrwTghGg/CnNUT0nmlD1
         ajNA==
X-Forwarded-Encrypted: i=1; AKwUvBwOW2kgeUnLhEBPhTqTzp5OtRmQu8p0pua9T26m4xkusrM/1eZaD3goDRSsMLe1YXqqame6+0sgAjAT1O/n@vger.kernel.org
X-Gm-Message-State: AFuF++kjzce1U0RPtCc4UDlJLE6PRkEcH9x7ArSJXwMKhwcRWvcJtXHZ
	ZpxhQfLDAvZVNCkJUpoinH0vmME3D3J+waZsZ3tUUp+hWr8o8zWJJk09PXkW5qEmzhoOf+lHNbV
	anuziGdKJheUI1Ssk5dgz6QiJk6qHipOA1JCtpkzXD8MIgw5y2fnA3TuPLQld6S6cSsAt
X-Gm-Gg: AYBFou1fuwxDs+0h2JWrM+31YOgB+UzPwrbNh7NJyI2XO3B+rwyr8Tp0dZYynBm1qmm
	7B2sU29QidBcjutOE7nAi04C/LfMv516+EiaRvFWouw6CdtVJi7tLzAvokFpkHJCU84RmdUu9ZI
	tUTwmGjlio5fJaTsqiA3IFu0J6PDCe9LZOzCH3kCqQGz08b1qk+PiIBveidIZdBBDbcNE4cwBAp
	1aJm+gbMZwBnKlQ2G1UO2NjMb56KQ7IKsye4NuYnmSt/cf53NaUED4avvHAZSLUuHAtOtJa8anQ
	dba0WhAU9NYPXPvAifILHuWv6uEAToN9rgI6G4H5zUvLbcWtt+uOfYmnvfNVJJLhBJG2q1O6nio
	ZvZo0t6Kmn33Qxzn738Ktzw==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1700387885a.5.1788852252446;
        Tue, 08 Sep 2026 00:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1700386085a.5.1788852252023;
        Tue, 08 Sep 2026 00:24:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6db293sm571789066b.61.2026.09.08.00.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:24:11 -0700 (PDT)
Message-ID: <edad7581-ac99-4d76-9320-861792b07082@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Honor IOMMU provider's #iommu-cells in
 qcom_pcie_config_sid_1_9_0()
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260907143349.317495-1-mani@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907143349.317495-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb81d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MdwB8lPkXo1r4_ePphwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX1BYzSgO71FLL
 Hw4s/T7D9BkEzmWcul3c4Xyqnw/TeI7hI/mCUBwObk9VfOMBZZkvrsMGIv3H9UR+GFQ7vLZIUOs
 oStEjl7MZSX8TZe/vwfxUL9g23BDd64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX6BWQ0fPHKjjx
 xqoXuJc5sqHjwpg3vjFrpiZyrbHDrqtY9s75/YYBiYzqWC1hh2dBLXfMSPyzMN7P4tJhKY5Fepg
 s2jzqzUB+kirYdzhv7uWC7gg+fkBCdczDY2V/bZQWJ12RHF6k8dJ/Q48w8jNk47OMKIWKiHSgeV
 IYYK/9HIgp8Wysd4jeL1d8Bkg/51oEBE/UXEf2+necNIenFzVUnTiimId6gvRUJ6E6IoDUu35DF
 gp9rK2Z/q25zOyFA9DcI7J6NMBGMW9E9Hzp5KPusMoAwXpwtXP/ewDcctRWMEl/myruY+CwnPqg
 DkcNUzuA+99QJoOOh3gPnN1y3hgCOY3ucG5Gkj9gbnO4MMXm0vcB88+jzSEhokH8UN3kGyf5SrO
 kgND1rWuy2KEXXF2ZhBa2TpVIjbt7Er2annKOKZnvrTw7Lo5fHQkvZamshg7TsS9jdTF0GZa3cZ
 Ne4jz/usrlaCHlikpLw==
X-Proofpoint-ORIG-GUID: vOobb_BNhpjWFDhd02QT3j1WELV_Y7io
X-Proofpoint-GUID: vOobb_BNhpjWFDhd02QT3j1WELV_Y7io
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 9/7/26 4:33 PM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> qcom_pcie_config_sid_1_9_0() reads the "iommu-map" property as an array
> of fixed four-word {rid-base, phandle, sid, rid-len} entries to program
> the BDF to SID translation table. But that layout only holds for an
> IOMMU with '#iommu-cells = <1>'. The PCIe SMMUs on these SoCs use
> '#iommu-cells = <2>' (SID and mask), so per the pci-iommu binding each
> entry is really five cells long.

[...]

> +	/*
> +	 * Retain backward compatibility with DTs that describe iommu-map
> +	 * with 4-cell entries against an IOMMU declaring #iommu-cells = 2,
> +	 * matching the fallback in drivers/of/base.c::of_check_bad_map().

Can we export it from there instead?
Perhaps as a follow-up change given this is a fix to a current
breakage..

I was hoping this whole logic could be simplified a bit by reusing
the map parsing logic from of/property.c, but alas it doesn't seem
feasible given we essentially need more data

Konrad

