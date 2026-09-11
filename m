Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2649E152
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117613; cv=none; b=JdoF2M6QHi7i68ab/1PEej8TiM4Zo0PNJelcbMZb1Rwm4gEfFloBEpZgw73UTDdMrkgzjgnzy63SJAxIWHkql+Z4DzGtnXceEjXQtIs3pI2m2Yg73/NZU/WGDy78PEzgoy/NoSprhol0L1gRQDk0VCt2+Y7kmVMl2uCZVS69Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117613; c=relaxed/simple;
	bh=6fq86bBfJotY3kdKrP/jl79ZjbO++6p2yGKmY5IeaZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7Jmzf2U0jNfSN0E/SFJStNgpGXJQyO2dmrNy5DwEd/QsyinmF1TAwxyQt+DRter73abCng/QCKrTX0hJo/zDP7hE55/sLhTQ7GhkwsV9UzadCzrrIENfPA3gbTLn3RxYnbr3EeKnfXm39hlgQUliNv+m43Qv99Yvy4FBTfj8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkpMFX3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtulOOeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkpMFX3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtulOOeT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l9MM423926
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=; b=nkpMFX3+GuTsCuls
	NcCtq7SzSDkqzwuY9r/AS3NtQDWyAn5LftuVp4yewmbSQlB72mEurPKG2Qmhybvx
	3pb9C6iIeoEIZIotYs3C+jrcc9Sid816T5iDaGZkQnPrq3LxwxweEpTuBwV6vP1k
	RnMlAU3opZ2znXdtkWzOzZbm2hL0YnO6ARrEEafUm534LL6FhQyN2cy25/8yTV6/
	uw3LWMKcd/6nvhbHd2dZATNJ+kDc5HDdF+SxKN5KO4/X6QhGwOAenJyLB4o29C44
	Z6gwbeqprKlplDae4Ab9QRn3+CpjckkTKuPJBrWnWlg6DJ2UUs7aBwVqb4f0fOKx
	fLcUvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8gv9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so23905e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117605; x=1789722405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=TtulOOeTHoNuBS0rauYRuRZvnflV0GZYjJsDCDNJTVq62hZWaI2TCgElcs7X3UZV2e
         LJpSxvnktB81oMZgCd0jnAmrO0Jgd++a7mQXqGUsDJ18GRoThDUVTrC4J1QG+kn95kl7
         H+wwFgVpBsN6qW4KePt1+elvZ8FmO5rMaEsOhB7WQsdT9bOC5MtX/O8nRcIFqZiYv2aD
         TJJwOuUtDtNPzE2QOgIHhj526ttVU0Oxa4wwx7BFPDkc47AB0ulwN7FJ6JmxgHJWXvO1
         Adz3MpANxT0mwnC866ks07+hdZDuaE3FlG0i7kYduSaT/hyV0u0Pv5ZLps03BGdSkPjc
         yi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117605; x=1789722405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=L1ekepmwgsOoW/zADFnfs7EGyVbrD679NQK5RkE3xl5GJj8OK32hud6UltRd2pak+u
         ynqD3LfPPYzwjQaLAuN/TDqp7XevaT+AaLdliv2GBa8H0oRa2xuZptI5E6m24xJfN2F5
         IGPSOoSg3CDGfQZoRBnsky51rTcp1C2ktc6j42gbNEXeWiWxGbHwTSKoQTJZMIaB96g9
         umdp8iUfk986w6Abq7p8xvY3SXvsIkjxYo8i94bO0p6NDWLcElIGU5BEtJMzCORchtFx
         betEtasYqQmv9JyjmXK/yUKAY31i/FWeTEWFXhOxa5TQss/4DPn5OITa65Swpvw8FEnN
         4aSA==
X-Forwarded-Encrypted: i=1; AKwUvBwIPRNmA1qLQpgR9cL9pkUHHO5omG1NoNiefxs+xGkpWIYyRd0KSRlChwdboNbcuXzPDhSjexc/AOgkaw/b@vger.kernel.org
X-Gm-Message-State: AFuF++k6RVbfPRdwbMjUuF9ruS4wqTnjodiah4As1V8SF6ZSfFfS8God
	aMLWkyzuC/uSIjmEZZhMaWipZdCXGppLW5xuED8wT2C68PPlxrPvsqJqZPb+ZxU+IhE8JMmCzl8
	Q9rdz8bEp3m4mtWmJiyIi3MXLAg0wWrEDMIo7JiHdcktlCsyM5Qf+4iZ/kB8SpvtdJhKC
X-Gm-Gg: AYBFou1zQ0X5WfWzRje4LkeMU/C3oFLy25CoVGivwvyNatsP7jGhXms4qqf4iyYUBby
	6MyWQsdEj/Xt4AAYPyAHOwVrstr71MUD2eGRXm7r78Lu/LEQz/bIgqAaP2kU6H7pgk0B5iFPypJ
	kekgdf86vs45cPtD23orRiHpsAaDmnW6VvY1Z/5PdFJkx1Ic3DzCVwvA9Ht8FMxN8q+Ydxp9YAb
	TVSr1DWvagJX3J2Z2TxsRgnM7XLTUZ8TgSKucEuHwUgltp9VYnRfCQOPpe8OrCiVOjkTpbkbSSQ
	6X2IiYQyu7CVjRSd2nBJZxmz0iqJPZ2a+TbHnE3ViRH4vzhn9dXGAJHpt4Dhpz/s/2p934cT0AB
	dliMQ7/jGou1V07ZYuGl4aA==
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381800e0c.0.1789117605272;
        Fri, 11 Sep 2026 02:06:45 -0700 (PDT)
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381789e0c.0.1789117604909;
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm446603e87.80.2026.09.11.02.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Message-ID: <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r6otxhb2HQIPLo_gHTisyJal4RCQwJdt
X-Proofpoint-ORIG-GUID: r6otxhb2HQIPLo_gHTisyJal4RCQwJdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXxiaWklRjeBSv
 aZm537tjQkfUPX/A8CZNKULFpyZ4LEaA8ELS0nXag2GtK9siiE+hN3bnpxdPd1gUTN3awt4aJPQ
 cp1kJ1Gu6WCqIQlH2SdZ/UAI9Hmgi2uHBz60k2ehPdoAxSqjGVeC7KJ6IIzkEYgJLCgyuoog6da
 FUQSXjVJ+pQAqBXeBzFhSHrA9249TY/mWZBn9JG+bE7wOb2jOWX9KYVHKg2QXlRhl6hMhFx0vzN
 +3gzmaOqd5p4IdGu91xjobOmQpER5oahrve44JavmHICLCqVoBO61W7iw9YXwmnOxZO9YQqkxSr
 fRYy8MYFn8GH2KK5h88woJ1TNTlLyd/8ZnMrWwK+GBr9QCtEoPImyFc79VGVpjgraLPDplQGWeY
 YCFqttviGNk//7pyubgK8kt8E1wLjojzyhk8YK6jnTAaEzCDJywMQfj3pqEATy57G0rQxr5asne
 rj8s30sHylHIUDFOYrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX3UgtEa4n0c+m
 bm2W93DOA1cdGmgwbRwJUaK1kbDOSsi9ajzvJgp1qYJLmH43MEI5QRl+h2UKkHdDI7ppOa+zBbX
 hC7hLBVJTTYOgCtqq1gx9HmT1TmBiNA=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3c4ab cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WZiSlqQC4IXfQuhb2KwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110127

On 9/10/26 3:44 PM, Imran Shaik wrote:
> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> every clock, keeping them non-zero until a consumer takes over. If there
> is no consumer, those clocks will remain active in the idle scenario as
> well, and the sleep vote is never cleared, blocking XO shutdown.
> 
> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> keeping other targets unaffected.
> 
> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Are you booting with clk_ignore_unused?

Konrad
