Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498497;
	b=aTHJZyBGU6f7hSVKBtRj8fuGqpeUrS6ITiUpJJapzrt3g1BstFgShRbX96lFcKezgw6Q
	 E+joG50JZpN3Q/iw3niYYJeAGwyEbFqIgsSIf1IHMWWFcIYKBLdSMbTqBunLOYLA3gTl3
	 3LwEGGqsqev6r26tWKyrBVb6mp2pwR6X0bO/hOfncGxLW7ZRM5jYrkeVtgkYRnARjQksm
	 eHrY6zfrojy6RyVIfibrKLQKSmP9aAmhfHkeb1Spngx6UZhZV5bTZiiJFEOQR+OQIqVcz
	 bo+ORhbCSt2UzhMUrwOc4qzB6k1KRwJ+hOh7rLjJyLw4zNmrPX9ASWRZ5hl7VY0xowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
	b=x75ogn/ZEF2s117S807QVfPCJ1dQ1jZE+fxh9vqKxFrU0MWJoVCYQN49LjYCE3XN+4Od
	 hgLOD6CjLY3Cz64W8SUNJ/ygwnzd5po08Se4giNJ13VPc47TfiJtzHSFc2vULIxLBCipX
	 xOx2RkoeY3uWy7/wiHnIg25vx2bPB+4gVg4U0jeDSTcHskF2HbdW44hSL6Wm1f/d16WAm
	 flp1MOGZ5Wz/uKtYi1K0UShPkczKEEx7voYBdiT4ONRkgBg6We8BUojnf2aBH2Ow9Yztu
	 sd4LGTgh2AmWkbW/+AnZkydyuqKhGOB4gO4g5/ZHdaVzHGQ+O4sUaIUv+lUlm2pTzvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF07606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF07606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KC5s7g1592542
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=; b=ZgfsrHAc19/T+Yp4
	jF0Vwwa2rrG73PUhzpiN0RMdXqJXl5Uwr+ElgdzsI1QDwRXWNe/N87zQ+sPomlCw
	z1XK5Vz/IiTAUrxLL+3iWXF0jlW4cW5OBBx/pSHqkdyIA8+EUKReEWA5JCp/A+N5
	mM4nLz8/+me9vupU95vRUmF6X/VNQ+l/B3zNTZdKl8RaeZSymwUa+QukI73len2P
	3BS6OxhNSXqnHcN5D3NYEjIZuRVaIyqFnkd8QdJ/rZ9sa3sTxi/YExDJ+pzl0WYg
	n9qvMr/+q0PKyK6PjkMq8CmEL6f1xwUsoZAR+lCTlPFLqt4anOpewAd64pN1FJ6i
	16V0Rg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad898904so58710e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498490; x=1793103290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=QWIVbJ5NmNlYJ7p3bmYaVTQW/TxnBBWVKaliezLTGiXmLmXONDYoxW9uoR9KCIXwfr
         /zAuivXFNjO1O0YhhcO13eqOSLK/aM7+v8z5Oz50dAe5xipXu1dFKUOXczybQLI5GiPp
         L66yPFd+CZMT2q7zFZf6tihJcWl1LllDZEXo3+lHji3nVJvL3zEMztS1CBA3zElUXAAZ
         M4XGiJebEi8knCIe5me1XYFRPmSQo4Jb3rpnKksnih1n444TwZ36mPt525Zoi+rExn7t
         GhiuhMFwg4rUX0gydv9zdWfCC7CB1S/G//9RZSqR+580CMclqLkAK4xWvsdLd5/2c0TD
         qnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498490; x=1793103290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=RABie03b1eNMafs43yQGraPiRhuJ7Y+fldPja6r7b+5DAOS9Ewu8kqMftajkELMG8b
         K0AZeAldp5rkS+yZO5ZRMjkpAupXAR/tHjUKSwrgfHNyMRHUNxVaWDNfMKR7YGGi4eco
         BmWPwga5ZdzZUl+yFcc90v+VgS4M55/9upGvL9zEOY03XXtlyjJH9FzqM9GZL64L9PKc
         lRTdsfYrSokFBuNMz0oIGHCbFvc0ZFlw3DAcxdJF+QEthr+Hb6jk7SPxwkxlX9UWUwEB
         +4WtRLUqytRodEP4mDFLSwx86/Qq7sl0SfAfbWCy8J16P1VKdItyj4KyMcv2j+NjC/gh
         s6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzEPPomrf/MLiCEGjqPDWpwTcMgUQLpmOPU8fhAhxZ+1bF8EwncCmwbMTXDE79BuPwFp0iRBuJilYGB8p0k@vger.kernel.org
X-Gm-Message-State: AFq9FYIDgEsx21fnAwkjaR/LKRV72CNcQeUyCHmaxIkY07om0ZHkKQVO
	e4WylL5r1dfOpIUioeKJuZOGp8ZA/CsFoD4v001/vx/mBqJShdCggZ0TK4k7/hXO7P4XLiPXFVp
	5hmIAYzOeg0XsrFssO3ykyiEreYjzp484I5JpTPs2leI3Q2nQce8lFOLcNsJm3HUU7Gj7
X-Gm-Gg: AYBFou2qaJrn3xYR6o4IfPjRFSWy55cyS44gFxK3zdABN7gjIpFKCRqpmJHiv1wZTuk
	PJmtotNUXSwNB03kUfnQLHTY6KJGVwznXOMDJnH75Wmb0PhFxzZGe2BXo3wob2IuWWX+7HUUWMk
	VrnCTedCyOT+hhs8FPBiVGxbXbsI6bqOzbSizrj7lZhgogDh4655VSlfUeKwtRMK9Zdb7ZE9DY2
	S9wyfUg9amECg0Il5c6c94vEpmSyfH74RzqyxdYBntjTvdACuxoh+sFO+LRlp6fMOgA0D1+IC9V
	BlTcPPu4WLgnAl7qkc0EuodxiWqEGYAW+UZGOus3HC/+Sir9ebyZO7IDTDnmpQiLI7AQMqIZi68
	aH/h4JhVyvdSnIHjOsSX1TA==
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162830e0c.4.1792498490456;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162823e0c.4.1792498490089;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm472344566b.43.2026.10.20.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:14:48 -0700 (PDT)
Message-ID: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:14:46 +0200
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
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JLntTgHI7hJTGQEwhWbkLVVsuj387OyN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXwzM4ym+3Qf6p
 k1lpO8F+W6UE5zI3rXE5ji1M7PsdzkmEb5BcMq3oxwns0FVYWDye0kKEEcyF6KB1jLb7JGr81bH
 B1xINnnE/wS+uCuGoxi8g4dA4e1LoaU=
X-Proofpoint-ORIG-GUID: JLntTgHI7hJTGQEwhWbkLVVsuj387OyN
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad75b40 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YyVq5OKRWxwgIy3V0V0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9deDBup4Vuik
 MxDJBzAup19RZc9lX03/bjTyXoDhf9Ns/wux8UZ6FtCusracAn83PVM0J2g4lq8+0/+1VeZHZbn
 OeeHy9VDu3IJmsl6XEFgM7feTg/vx3SeYCBzG2crHQKXOq9Vq3n0Ch3cLqwok1hIMkSIVvJKUew
 0m0hFU3zF0OWTLRDhf6BEYC0/F9g6EmwtZxGbRGccw3wMQqPUmAUo/SwmlZhSvK/2ALlv8a/D5T
 n5Oe40YRZVBDM0IAS9lI3WoYvQEDmmt2hGkjnuI0kYkx1xXfMcF3N908l2Don/sv00ypYCYQE36
 ds2dtlb9sU9/Z0X9LJCYP/XPoYNDuVDOr0eFDpq6x4BkDtihVR2teS4G6q7/pk6q1NNxpubWME5
 dhSfr/BhER7A8qIpOgFs/1lf161IQ/28g5bq6PS/LW67XAxQZ0SWEy74ClvjJ50iLvX+tpUdpal
 yyv9OULHpfNObPeygLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.

[...]

> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};

SCM should have its own label since it's an existing node

[...]

> +&qupv3_id_0 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c0: i2c@980000 {

Likewise all of these

[...]

> +	cma: linux,cma {
> +		compatible = "shared-dma-pool";
> +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> +		reusable;
> +		alignment = <0x0 0x400000>;
> +		size = <0x0 0x2000000>;
> +		linux,cma-default;

What's the nonobvious reason for this?

Konrad
