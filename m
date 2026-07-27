Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F23815E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162564; cv=none; b=jNJW5RL30vczhD1sLnWgV6oi4PBVdnc3xV2yUSlkbgajxRd327otZe0hKH7QdBW4smWez4X7XbPwNl2Kb1sgAFRrYtWigKFz9mAAUkZ72/GmnF3OdrMSxSEG38VNShwcYsexcS0D4v2wtQVCXTWJ8cN8hI4Cil9D/CYKZdk7D4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162564; c=relaxed/simple;
	bh=J7IX+1KghniSxNDYNpWepXmIVwOWXvgTqOG/Q+D9toE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wg/ZgjTIAKSQS520JOuWEFL1ioHKLIpncVsLr8bLSndUi1TcraH7Omwmd4AKEvRj+6lhOi3OmDXvBn3/trAICDSoJ9EBGkhK4p59C5KtV246RmwCdGIuhNLRoTw6cLn8aAwBMWEa5bv2BA+b+EWXaY32R52eUM2u9hu3O9VDqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X76h5AoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLcwerxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X76h5AoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLcwerxH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlT5u4065522
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=; b=X76h5AoPP/fCkjOV
	acb7UwIkiv6e9CbJsydRaXSOBI/t0rrsb+pITesWyuqGHAcm3xxy/0wlOT5VVVk3
	Bnl7ZAGc/tbWqwe/L2FwhBAGP1SIjXHjxiRO0y3LZ3yZE6qlTcu1MAdbh04dyRMx
	v7YLwHN3MClUYNFd1QiZ6VK2uGfIwDIivBcExXA3IUqLpEacZ+PDq1q3qlv6dhsR
	xmM6SR/SHJsakYAs5qAoyfwTQYoEWZ0aFJo0qlTj/k6iOAQpBUsZrnq2tQ/rmtMF
	Yj17Yi+BRRQYOxxYWcNBsMmpussZcMuWSyoIBHLCYkK/oFUfR4HPSrwEqBeKh2nd
	GDgB0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuvv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:29:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso9123171cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162556; x=1785767356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=;
        b=ZLcwerxHSvGPHe4x3AkGLOPePsva4i6Vqcs8szOGfOGUbLYElgGlDkbXPZg/UyNW00
         EcJltiFbNMKgm3pzOw4YUqsOzwRxdGL6WqHkClRWyvAK9eKnoE1S3gjFU+Sn4tmzV7za
         J7/lVtfqIf2NAi3VsynaYhl7qvQM9bhjo9otet7Y5pXu+RoE9VNFXzbmRqoFXjUragbT
         qbsT86icmoWHP7zAcNMpjcihFfjjzyKX5p+VR/GPjkcE02+HZfiwjUbphrsEFbG9eiMM
         57CihpfLXW3/pD3xK9aUafJrf65T6CO30mfghJdMyF+dlUSGtYvPlF6AhF0Nr56pD/FL
         CF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162556; x=1785767356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=;
        b=hVIVHfn1dvGKbDBrDfCDfhiIV+s75122WA6vP/A43put+uQR+I9kJ5DDkZeqw48fGn
         60/V/H8ahXv2qVu19h4syLhQ+x4EUKGd6JAP1RdMVfmR/cVVFjl6GSiYQBEWJGeohoc/
         BrHShzUh/Ckbg573m9yzC1EY8K6NXoxJiuvjhYUWaR+GTWGsHvkr2DdUO5tRIxeD7ieU
         e14prE5q8pqGDLbd99fYYtIBWXhKBhPDT27JEURPYxcadL4fjLyt6UiqJ5UB6KKrDhnI
         9Bxt1Gy7v0QJ9GBKHBx+40VcWpQlwlI/Dm0Ezroksiftsj493kZ3TBlmLEscrK32eOTk
         66MA==
X-Forwarded-Encrypted: i=1; AHgh+RpOiawNPINb7Tua0snzGf2ixuFrwsLRuGAPvi58k1JTqJdTCq7elkmHNmGN6JGOLskJ5shPox/z4QDLbLrb@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJEpDhugUYJSZ2V6o6hgNyPmrcss1HpKGxFSqquS2+En/q4SJ
	QzkmGc2sYgclqFessBbIxYR6iaXQwqukkvWCTDfv2b0RKN+0ikFGL5WmX2F6GNBGT/Pknk8Szau
	/CqHIc/fZUeBIoFd6vqImEiEzDVejQJtF042/Q1DyHLhn8i+JELhkdXqC5B/X4eJhceWo
X-Gm-Gg: AR+sD13bFxiBobne+BX23r2yq55gKu0DD9/CAjgHPxt7zYiS4oouO9DvUXB0zoZdgEG
	6XZPbxjtanUpBgS4I0ja5z1QuHxh1rA4QAdkMV3oH7CkV0k8nOLkqoeTNHNkvsedG0DInEmlnFg
	ZPsSu64aOYULjqLaCnFCAvBhBaF+PrY7eV8f0mgqR2QzcZpXad3kaKMH9/HuQ51Hu/NR3Hs6zOY
	0YpWm7HW1e0xz9sYJlOuueIm3k4/in0sHZ3Ra8ssU2lGtGljG4J2vipMQ/LUgkC9HhPfa9xvIeg
	9T0QWwqeHEcww3W7ltEaRkmOvisG3WzkLmTSdIZ8Cu8uQktTJTzu74cKo/ZBaz84t0zgkfISyHw
	E95avqH4hD8YRv83UtNJqoi3J
X-Received: by 2002:a05:622a:aa03:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-529cfe240e9mr2323181cf.6.1785162556038;
        Mon, 27 Jul 2026 07:29:16 -0700 (PDT)
X-Received: by 2002:a05:622a:aa03:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-529cfe240e9mr2322681cf.6.1785162555456;
        Mon, 27 Jul 2026 07:29:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm662235066b.56.2026.07.27.07.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:29:14 -0700 (PDT)
Message-ID: <6313c8b8-8a17-41ec-95aa-b0d7bb8c7923@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the PCIe
 Root Port
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX/8wG9LCqvCSH
 IvfBHYvl767AfTGT12Rdv393pwUk6zoBni1L8mGpPn6hf8nG16fWgaIUqgL3eXb/8lkJUlsnWqZ
 MYb9BpQKIBNZy9JG2qFZAFlD6FLMQme52NfwyH0q0K1HXhofy6LmKB0eicAJ9a1xj0hv0biwAoV
 E9VI8zF9kqvUC0tB0caCWPtZO+diDtbjSeNScNC2HFsNBHXRyj/uCoMtEcCvGVnO34r5cxz8BEc
 3OObbKM+rAF9ZCTt2jRrmkhwUBLCgRXce5PfD/+Mm/EN2fFUBSEvJkvqh+BhdJ7vZMnkPp/yks+
 lmkUZ6AWHodZJihe7Ix/fOpyFLKKrAqiNy7jz70eigc2npaKlGfX1XLLDNwrVG0SMciEiDbiSw+
 E1mYd/efLedQ6Ls9Vk94HIu15kvb2A12BdiZXDp8tW7VNb0z0kDE3YMqKAy0qJsaCCx7vrhbkPf
 ADuBQiFS5Cwgle0gzSw==
X-Proofpoint-GUID: j05qKkzAsuVi2-hQ1fIrXHKrZDRN8Im5
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a676b3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=23UZmRNxtACLiwkAMCgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfXzpjnwquCrdCo
 YCTRyzZ5i0DMELJx3/o3v8B+adesWFV94pBykQ+iMgroNS58JiEzE9s7181faV2MyTGAtpN89qY
 kza8Iy1xpFOL2HU2rP5Zt0NVm7KSC2o=
X-Proofpoint-ORIG-GUID: j05qKkzAsuVi2-hQ1fIrXHKrZDRN8Im5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On 7/27/26 4:16 PM, Wei Deng wrote:
> Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
> to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
> bridge device. This is required for downstream DT nodes (such as M.2
> connectors described as graph endpoints of the Root Port) to be matched
> to PCI devices.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
