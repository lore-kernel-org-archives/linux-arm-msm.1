Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7076838B123
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266396; cv=none; b=PcOf9GwXvXHCTZGruRXuUEoRgIz+hd0Jo9vIrtCEpZs3gBD+7lasOvdHa7KMbyh/iNBlifcQOwpYgRPvhW+HZLq67ObY2kwy0Ef4LDmnrmuogIKgQcqn3ZUHYJbKKACF1c6tGcBwJQSYsm1qNrbeKA4kc5WzyKkEYWJV0RpFTN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266396; c=relaxed/simple;
	bh=WoB/OmRTJJSpwrFDmSdgZWJFQWCDuGhALHK9eDbmU5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxOTqybCmncUPJSHAoKCgvY70kLaXj81qMALV/puPHh1H4TJC6TABr/AKWiLK7GcksSM4KvyXkITQEjWaNWWI41047RRMea9S9nY4SM/FtZjIZ3tKHKaKlddQcPJOiseZeO59k5kktgkplBVTtcPmua9A+xyR+l3PedwEINg9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC9zX2zh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUY/tBSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC9zX2zh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUY/tBSI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9vC1641292
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=; b=cC9zX2zhsWv/2iHW
	nJz+YIv6Xhm9qbdp8ujaUqDifYvrkHk+jbv3mGUnOGkGexcckoGlV5jL+W+WO9My
	WuTbxpzrWVoEOo0RHQYD0xJFqIIebBaB7+TCoRIL/yngwCvk02qzd8oZJO+ba/9C
	AWvp6HEMqSEI/exf/sO/yAT130uNYmCgnwoBWhzxzuyvJWwEuRL2Buf0y0GfDJ72
	yV7adgL42wztd+jJ4VRNVozhKBjrhnXXlN8Bgx+s8J7Yr+YRvDrGIZqxEterP5SJ
	3ZLhu5LsaqX1GaO4nZunfg3lB5oOjQfTcH1pZZFDylLcYXg4oSpQccig+KgU19pf
	waFzhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tkyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:39:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso99599885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266394; x=1788871194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=;
        b=dUY/tBSIbHt2n6FLodAI0LA9yXQrHERH/l7Q4goph9ijFlHFGm42bm8YehiF+0qHTz
         5LMcyv3//lnmYMs9LVnAUuEcnXHYVTclUgxjs4nOqJXbcaIrNzijLBVNivo92KW6/VIN
         I1uxOGqNbF0F59+xBJdl9LpE5F1V8Ml2d3CWJ4BIdsjUhTNtKstzBp/cJSu2VECxrDF/
         X+xmqCmazkA16CilfZWpXPJjZAL7bblTrmU8YIpfaJQ2XcBaYMeD6mGkf6y/G0eBmYbD
         YluZdGzhD59YlASKcHUPWucXEYwKmneiVjYAuICWJUsjPtyOwG06s40O00h2P5C4hjfB
         6Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266394; x=1788871194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=;
        b=Xm4i3vxkdHdbiO7+HfK77aJG5Y5qC53EvZ8s0HVBXj+QzuQwjeSiVtUPfaz/sNZcZ5
         5QX9NAZ3c8yYdZzoNqkkVTo9N00b3oNfq4wCHPp8Ddn4qyN050H5TALGjgxbR4apAe1w
         6eilCqozWvgaEvpeGJaKKNr7XJHeLaqBdYI2Yf7GIv4n0N8li3KgBUSi7w7JFFYzdokW
         uCbo0/0CcpmClqNLiAHVcoMha7aIA596qBdYIJR511p2HwZETvuDC/I+cKTlfwzi5F1Q
         +vC0wtYxO4Gp5uk4LB2b5ClEJBI+IrPMJUPN50eBaXzQQEVQdKDZ1pAEiKVfEcCVOXZT
         LHHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQc0H1GTFx1vL+Wv6dHsvIc0WYjjJMrD1czhEs2cPISBITDSDMCbxMLS0QSzXRz5mZ2S/1P806ok+GcF+g@vger.kernel.org
X-Gm-Message-State: AFuF++l0tLiZFFVMOI/mN4GuPRejjEpjIjRaLZnByzlGP6Vh8VcL39ud
	O8EYfvxf+nsShVZXylYDYtKnN+5XZ8SdhOVpOlaECDG8OrShqG53FmRXt4BvfxphmwzyjW5SteP
	1j29+crw4ICvHcVH3o2KpLsV61fC1E9vkYrBNNmD+RvmHOCE4BCAU2hvj0wubbN/S4oX9
X-Gm-Gg: AR+sD10XDxSyDAqHwujUA5unWSxMZxAhzoo6bCzmJiHN+onJdym7+nFlBg+6fJf2ilf
	lzffEOl17qPFZ5ycBaXIHPzBuAb81kHLboqghYDx7yfaEhJqyWf3WBlTOPYI3oMnCk5GdDBRC1U
	DQuJqnFpzgV3LhU/Oh8MeWMIsHquGRM0ACrDePfiZOU6z+9Ezd0zXrZQPS0qdN3YWVFIrcp5tMT
	oOi3d12URnEA566W2PYLGXjdJZxnX/Z5qgzacMCk8FO7EIWk2nJyu5MCBaSunUwZYbL1d4J1XOi
	NALbfr/L+S+Y7oYYatdToJ1OKUVj9wQaMO7K3Q6uu9BL1DtfkwOY4W2gu9Ml1pdtHoEhwSHrwhX
	vFrbM8BoJjfkJ83P3Zh0M1Q==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1525534285a.4.1788266393553;
        Tue, 01 Sep 2026 05:39:53 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1525530885a.4.1788266393064;
        Tue, 01 Sep 2026 05:39:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d052d81sm760433a12.23.2026.09.01.05.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:39:52 -0700 (PDT)
Message-ID: <74c0fc35-a56d-4297-9fcb-23e2df8646c3@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: qcom: Block accesses to downstream devices on
 link down
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-ecam_blocker-v2-1-e7a8fdc1c5cb@oss.qualcomm.com>
 <178826612782.58092.15490835074765422013.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <178826612782.58092.15490835074765422013.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96c79a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AFY7VbZHp1LxXVr_yegA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfXz9Pt6U2Gbrzm
 pLxVcY36lIbjJxZTFKvO2BclrY8LtXiAy078NZA3o26mh1EdtdO+tiyHpKBA0ONjlOTn3BNsRjU
 LIzfGogFLLV/EXxW+vetbovk7eyWyTzwyRiL6gi7QgzvZ+LTDYd9Z6drzNMcB4ZNGz63t0oOnBM
 DqvdIVeaZaUdfiBn9sB3w/Ex7tpbwRUkzqgsmr6RZIboOQkj5yA0sUgoHnkguh2KKZyuBMI447W
 lKW5w52a8GHsVV8cWqNCUEn1d4+ftRH9ZlJouEYXoITBHF28XrIDznGGZjE3+JOfaCxMbAeS+Vp
 OQRy22aDx65g7jMtYW/OjZYlaS3eJWAxgBSj0JlLSyELe55wtOmomv4PvmcTly7PNeJcCu/47+K
 x6hyecY92KHObPNZlJZ+iSkPRuV07yAvIkcKf5Yc73BiK1OyiDGSXBw2ptJXbo8h4XiIeOALjfS
 S7MngE0gi47sUTBWd/A==
X-Proofpoint-ORIG-GUID: aQWKivWV-VV8TRtMV0W2a058AcKAPI3K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfX2zgmR4k8IX4S
 8NWJSqUtmhXswwnoy1duog2L8AC3tdgNSloMGi0h/YMpz1GO+5cFuP169tZvA8vd7fUByUpjCLz
 GcMiiale4wVVyXXwjrVdefWmMo9UCiU=
X-Proofpoint-GUID: aQWKivWV-VV8TRtMV0W2a058AcKAPI3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010112

On 9/1/26 2:35 PM, Manivannan Sadhasivam wrote:
> 
> On Wed, 19 Aug 2026 23:36:54 -0700, Qiang Yu wrote:
>> After a PCIe link goes down, software may still access the BAR (MMIO)
>> space or configuration space of devices behind that link before recovery
>> has run. As the link is down, these accesses never complete, resulting in
>> a storm of Completion Timeout AERs.
>>
>> Use the controller's ECAM blocker to drop these accesses to the PCIe
>> address space as soon as the link-down interrupt fires, so that Completion
>> Timeout AERs are reduced. The blocked range covers the entire address
>> space (base 0x0, all-ones limit), since the Root Port's own DBI/iATU
>> register space remains accessible regardless.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] PCI: qcom: Block accesses to downstream devices on link down
>       commit: 86624b718f94517b26f96c1d7beb7632e5562afd

Could this be a fix for

https://lore.kernel.org/linux-arm-msm/b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com/

?

(+Xilin)

Konrad
