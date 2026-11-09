Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234819;
	b=irMtCr1HYi0dnMBg+H+iGqLcud9NA5D0PveqC6VKKOTkFyKjF6iofmbBVd71s+3kfdL/
	 Z6SQLrpHJBlMk9rezzfHSgtxeS9SjzNYmDqNVj3qLKobgQLydC0qTvtrrTKF+mGPji9Me
	 Qj4/H6HenptY3K6Y8T0bh/1XETVnGZogM/HdLBoEQT+uTILlVl+l9WuqiFRzjptFMPBw6
	 Ka+y8YglUnRRlrSDffv28b3LnT7Nm7m4BMQDH/TJgOwVaAfUut+pOak/p+e/02HSou9tZ
	 L3yy+ThQ4YK69GI4sEVFHigDsWRfSMkZbbc9J1CWXtJpjrgWclQ910IDwUQTCB5jT4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
	b=xS3A7m9n0I7InjAxFoO+WzE2kmX3bCKkVqBPGQwo1pIh+Bbawka/yrBA7VYfenDXIrUj
	 mGeE7GIgyWHiKDm6WjdVp4kuki7MGVW4HZUZb24h2MHQVRXMOp4FTz8snYp5vaOcHPvZh
	 ZkAOKFy91HrjQ+N7fphBuIOs7PKPrFAcgSlOAsRkpuHpgodpLx0TkPQyrG6SLhHTfReAK
	 EANBbM/zi0eZCLQSG4yiBDYNSrhMiAW2AodyM0AYGlkJ+7tb70DMDVTEhKb/RlVHWas3y
	 cfie7TD/4UOuKltpozfrevoZ/YbShiLqESMGGmqKV18TjNsWiRuA2Qi+6Lbkwat+dhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC9606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9DC9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEst8336367
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=; b=LA+1xtTAJJxIVMht
	l/U6UzdQc712+X62A61o2OXNbrxt9nseabB8UoVTwbxmp2DMA+narMHLKqgv21S3
	H+GcaS+du0uQSGd8cprO9d+g/ncMNIl00x6a/XuBgWAZUKFNBB+HOeMuHJ7l0vQm
	FIr5Ow9i+7mPHkze15zhbAlB8QX9ayArzdnIvv74RZXkGSuPi1cVA2vI6woR8Et2
	jC7ZcbY4VR5TfD0Kx6obAkKlNWa15YSvRHVOHS8HSNLcTMctoNhtiL4jK38usNQo
	VRJIkytT3TCG5ndGKreTXgrY7CzyBubG/EUeRN9lH9RpYfhYaOYRiI0XiVdWHKf6
	j6oppQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rqd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:33:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso484191a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234817; x=1794839617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=RdLsQJ0QoD5g47jXPNlzrBbjVFvMAJvOADAZFfzcVMPhJFP3b8cI2kHPgYhsw1jJFM
         cMbhLXOsQ+ISJSW/anFsHuJUecH65Nqc8VQXKV3SRZzxemL4Nzdb7bqbrM3LJJYk6P6U
         Jdn+2omj5m1/oXANbr+vBgUK/Mw//3Wa3dKzKeGiHc0HDAqap52fTlelsLVOF5ezb1q2
         5hA1hPIb9smPO1Th73O8CXFVjg/mB/7LdOrH+TqLwyg3vwH3Xq1JSeATHmkI8YozfCQK
         9oBc8gXjJCpJN3oRYwl0Cy54nR1lHOyn/KslANgq8oIq62besZOfKrq0j/Ztst+KVvtn
         E7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234817; x=1794839617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=yJipSB223KrRfzO/y0w3rnSRgfYKzIkTzzlPibcxgEJkB0FkPf+xtN0JG+Z6VHZwOv
         6b7dabgrvbyrPzdSR4xxP5JGzp/L7CS9V4IeeixErUNbjOSBh2nXK1uiv2fMCfO+um5M
         w0dyyBDdYNZBmoo1LcFNbospeva5HX7izPRTb5vvQqrDbfuB2J4bZJt9c1aryMVABuUu
         Kk/fjU3nUG0BxVOFbFp1y1x62MGF8MWcq5OsC7EH8PIT6dwy1GzIhT34GW1PVrEaaIR1
         FN2mVsJY9vGxEoYlPwEJB/0e4fpRXZcb5fo9E/7PqURpBVzM9hpnMFjfciYKKzDKWJh/
         Hzeg==
X-Forwarded-Encrypted: i=1; AL+hErHK6PGJjvfTlSbjHplEnXRbwqhPGla9eOGIISzEfcMj8ZiQVc6ao+Xv3nVJTWTV23TPwHatKZvlPtPSLcUp@vger.kernel.org
X-Gm-Message-State: APuU4Z/vZ7YP4WIMfb9kXpfMqfBnEJnJDNVmLFVYDOOHEF4nhfhUdDf/
	rAXJenwcfvSDu+5pffjFKQlkBB0txdcj1OX6gSjK8fjqx8S5RPDzkv4jZk6cJZuNsATJGSaBXCp
	mKFrfzQoQes+S84ljSLF0qzCpd5Kj+6BUiAymu8ubORo4VpZUGZU8TVDpGo4fAwAyOnmj
X-Gm-Gg: AYBFou3VxBJfbgLQ9MggL8DTyCIS7IU5PhfJe/E/Dug7r92fCFwhIOOA89L/Jbe2+S9
	3jIXzXrXAFBUcrVCriOdw0aX0uMoMPl1aO4mGu9Lt8fDQujyIiA7UD2YKhmnXBtvsGrmtH9FFy7
	xMD2qeMoAonsq0B70PqbMC3vK32zyRJc9TCQhovZM7bMb1EVONKPt+ymk7n3f3ie2giE/uLWIvH
	Uc4BdVxDq2XQskd2MaF32pC0z+CYwi10gTnKV69xpgE6tDnpIKZ8nQGlhS/NqfXTKDyoEsskRDd
	31p/TcWzgIOyjGBsJCQlk2dMgdbl7gGBRJEi8kg/FRJFqljnJaPVn5qR+VzmyS5yVBsYJNeXj1s
	Vv3Vmv/2kKZ0xBQMgJcaCqjxGCsmlBjl0cbEZyZjxxakCEHdOdCw0l8sma86Qz0y6NZgdy4Lgcg
	Gc0g==
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536989637.16.1794234817566;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536968637.16.1794234817107;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54de9sm1408883b3a.14.2026.11.09.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:33:36 -0800 (PST)
Message-ID: <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:03:29 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX6yunYCOEEkvx
 uFcxBeuVv2TzVXr5kjEvFNXmWRdmhsCgrT30aDE+JxfsLvJnitNfIiyWaKzTbERjtHbuv2k5m+p
 jdnvNmOR8xuU8OGL1w6jX5n1/Ba0r0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX653BJpb3Rz73
 SLXXh4z8LPMAstiGS9l8eJVfZJDur+l/Kfz81rqLFMUrX0AY7fJi29HQbLgw2wUKg/gAHTplXT+
 nsIy+D54D0tCQExE++ORTbk/KghDOQtSvEN+o9dzZJab0I3/AFgW/k/HHfUiGGjwoeHSDzdeHc8
 zSgeRvsXPSWfVYQSDTWBvEvp3MNlcKuLQpQ6aUGwcUieJd3fVKd60yuFqNXtFkbt4lEbfrA1sxc
 diiv+Xq50iFGIn9eXMpNj7InNb6Q/vRe4J9RMkInejrurcPUWRRCLKDo0EUM8nok/BYd62KdEXq
 uSoOLMIBRF0VGcvfG4Er2VeQFS6jyifdXuHwn4I6Xt3rs4wcqX0M1cIx0LG5XeVbVjYINMOqM7W
 L1dhVrzqU4T9ZGEOqNKSxRg8cPZElKRWzEJurJtA2TqsUAyYGFeWhwfCAEoM2vqB5CLNZjmTg24
 SrgnB0RUfbsRdYfTliA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d9c2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=lXLgDm0nUj_2s8HzTMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4rBYNgK52LRE_e5MMD5VmNtmcczHzkvf
X-Proofpoint-GUID: 4rBYNgK52LRE_e5MMD5VmNtmcczHzkvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057



On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>> specifiers. Its value, 9, matches the GENI serial engine firmware
>> protocol ID for QSPI.
> 
> What is GENI serial engine firmware? How does the Linux rely on it that
> we add bindings for it?

Hi Krzysztof,
GENI firmware runs on the serial engine’s programmable sequencers and 
implements protocols such as SPI and QSPI. Linux configures the engine 
and submits transfers to it.
The existing GPI DMA specifier includes a client protocol ID. Linux 
programs this ID into the DMA channel and selects the corresponding 
descriptor format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to 
that interface.
I will clarify this in the commit description in V2.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

