Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4C2EEE7E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143257; cv=none; b=R6SMAs4PcQ1/UbNnQS84yOSDV/wEwQKAmRsK+fRZYtodQfMcjR/HUNFn65lpoGoe8Ra7ps3ma16NBL/Z2kf1LiTmnvIor0oce9dIsI7Eb6UslXn2MXHOWroYSHAzty2KB/YWE/mbZ0ER+SlbzvivktnDlennENAj3liASV7l4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143257; c=relaxed/simple;
	bh=BJ88p+IzCzNha1tDwG417+NNpmi0uZF4T41FRXvpNg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwgEUXLKB6AVlUzTaOhdIbfkaVlnxYnlTRYEwoa9PaHugyOKzKTNJuOCBEYEUnalkPS8eYs1NreqLnXT61p4F4NKiPl8aoNXzGlKtXpvFUXcfZg3YFUtFWGqDcm7I6Nq5Upp6yhpt/zkXVVEEVCd67Zx6KBVzzhBh/IdXv77FGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgI5ZNv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVxMv2Ro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgI5ZNv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVxMv2Ro"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8EuC3754755
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=; b=lgI5ZNv9g0mN+rhH
	cnvqx3aC7V9lT4LqLwBdHXeQRYsaRNR+N4cOmW+CwyjH9ZAdw5S54RfygymGMi4d
	62EhGchTj3i5j+erEmIPxGug+RdZi3k0B7tAHMJruRXsuwXMuxRXi3X2otmLvFCg
	186qpmXiVQeaCGsFlFk7euU98jOxMmH6w5ow+zF0ZMJSnbJLyyLovQVvyojUoIbE
	hcVZkC4+r6t1e8B81xPLrspEz+BsXeizFUvVWLDjjb3OSiuiUT7GoMWEBrgIjYY/
	+gWrzLboz6CNm0l0H9AyTvbLH8ccRde4EJzwCOLHGBybUkQkP/oe5R0OYD/a9shv
	ySb7Cw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffk4hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:40:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so3290641cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143254; x=1787748054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=;
        b=TVxMv2Ro0MWJ/kcRtyi/r29T4ONgxct4in7f+lCUHaEYFWh5wxpZetdwL7ct+AQbfb
         kPPnFjr22NpdPdysdxQVE/Ahux1JVUbS6GhENklM9/Z02HwKmZslkItekrPZf26hAi1D
         BoAcPuFH/rdiCSkjFI/6WB4Tr5xpIJrGekEAxrD0Q/NEutiSxwEjODHAsXKSH8TvxL16
         3Wgc25lM+G+5gJpU1aSjNtUxV3CnJkPrWpvMAnvAguDevbA64/xnsT4OMyGNs/Xv8rFL
         XK6lqZ48esaTNW2z1faAyNLMhSjPeqraLpeGIJHKe4MBeK3NrauAQOV5P0ZM08RgyhbV
         DPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143254; x=1787748054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=;
        b=YbDXh5yGdDGXpgFDl+WPLy2fC7A9jfM1NTE704/fvMx+X/kB/crZXV5JDQ8VaLJyli
         RKBXxM8c4SaHQ7zwu2eCqOUJu+H4Sakxornx1PVXLIjx1Q5Df7OeaGRRyryq/FdR+mfW
         ohatdM8qR32jL2QgzkBdmq38i6L5PvmOvCtIHOMCKNmnkUKoy6L2kaIxmPP7fDpPVCzP
         PcrgdgcEZ997kSBQXRs9FYaU88Etp1yjPuR0sRSvFs2J2AveMvLmmhAo1tuGJH9Dnlaa
         syy3nuAvOY30gFpfH93w/2hIfQ0peSJnnN1X2bY8ULiZKtumu51Aw+Rya1b3cNMjUg+S
         Jkuw==
X-Gm-Message-State: AOJu0YwUnd8EGl8lXut/JPBbD9TgZgarZ6c3XMh4R0rGfyu7jq64rHo1
	RuNc/W19a8kAehOio7vAhRmjzTq/plUTmHd3Z1lWTd9cDWXfD2Px/oqeIlbfC+Mf8PTPmKGwJtK
	q1TGQKvfnjbVPUCe7TZ0RT1R6OsI8VWCCN7DiWipFt6VmcsV0zH5JWrZsRWCSqfQikjdv
X-Gm-Gg: AR+sD10sE+67a3mtKd2xzaHbRlHTi8Xmm6Xu7Vqkaafum+V+bKZC9x6BDRcIgtjKil5
	GLDIBww4FCdbgtbWmDVPQcoWbYGELjIeb7ecDqx5jBcyaoh83uXbM0NPSKBPiXx5xu/7O6yIVxw
	x0bOSL6KNaL4oHKfpo3IjyNz92DSzNd0PKxhZQyNW8l99N11ohkNU6/GcNSkVwdh6jwvqmSb0JZ
	7MOxLM/61L3ygZ1hJ+AM59kS8wMwz3VSOS6xBo2QOKVclZY5x+xs0JY41F7RwuRCnCqzDo99bv4
	StTFZguAQJeDM2CxgSLCCfEE2m/dRmKrTgK8CEJ9wwiD86VzZ82VW7PCPxCqK+cfcxg5nfHekan
	Lrci1nujnnquQ1GfBrKWpyQ3a
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr28334181cf.4.1787143254515;
        Wed, 19 Aug 2026 05:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr28333821cf.4.1787143254023;
        Wed, 19 Aug 2026 05:40:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7abd4esm69233566b.18.2026.08.19.05.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:40:53 -0700 (PDT)
Message-ID: <c499cb65-aa3f-4843-b47d-5a7e7dd38911@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:40:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO
 bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
 <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfXxpfLTjnbGu3j
 LFUo1fetb9D5AcoKywWwhcZMBvn9/4geihhLUQxupwRJfvnNXVm50mDNBOdQu1IeZ697RM6T/EX
 VfZsZ/5zN4nhx6MHVkJsZNcZny0Ujz0=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85a457 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4FRrygT47P656_Zvv6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aQithRjar4gbVYpcYCuF7kwKPE629Pzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX7/nTJLhiw2ZH
 1ep2pp9LLnRxJmKHSDLwKZZtq5SAOjzSKKdAEInZgtVfuA7XSnQhavqWRfyLsPlNIW0xkqFWEC2
 ggOe99Tcow5dyO/jgVvICqfC0E58OEa0dCrO9EPa+4ff/ytRQb08Q5fSo2nlJ3BuRDKQq7o3GSw
 U/e8K+GaJZTVnwvfAXfeLnhr0OF9eDV/cy+u093PePYmiDy4jQqrYtaZFSOhTZaik00R7qpcENR
 sbI17zshnKFZJKi8EDH6yj5yruYuXSNrpRfLcvnxL6vxJJH/cTc27oZSmaJN+dPHrb5CzIQTgMq
 6awD7/WQRX8GhKH5S3MJYzZKJTpMWdbaWdzc6PeBndTEc+J5vOdlPiPETaWDejuwR5L/nT+/Y3d
 M+8vZAxpA4zh4J6XB0dhRnKaFFfOzpj7qpn2gdRZROnKj2ENNvHdFcp0miyihdGPT0ylkyc2lir
 tiPfaIbYHR9kd5MWdkw==
X-Proofpoint-GUID: aQithRjar4gbVYpcYCuF7kwKPE629Pzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190098

On 8/14/26 4:22 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.
> 
> The MDIO pin configuration is identical across all IPQ5018 RDP boards,
> so add it to the shared SoC dtsi.
> 
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
