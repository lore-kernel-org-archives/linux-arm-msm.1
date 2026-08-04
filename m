Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BF3DBD57
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860281; cv=none; b=H5wXRMCv6f5FayhXI2cg+eopORiu6vVRNUgcBKPfbPu4qj5OJKLjt5KJms0UEXqohQ2NE3EeY3/3RLdeg8K98QT1GvVm6iqzSxMtLMTKjt/VgNdoJBJDzb3CKzhr2A25SPA/vspS5v8Mt6SYjWxGIqBntOjgbHciV4ucZsbtVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860281; c=relaxed/simple;
	bh=jILPCPgJgqJSeOaNZUyeYrb1i8QOwgqT9AfqPujrudY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVmULo8MWmapUmWC4vSt/leH/FyAaCvjd3URO1YK7pMJgUJc2JrAfCnDCzPpdydzTrbQoPi+EQtavlTf4JpM04JBGTjYLMOW6biYZtfcilJ8cYnRQ7DwCdZy+wDAdYB/MzVzlvkvqGkO5KOEPZpCws7mm5pPoAeKfBsNygDhgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVZrYf1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNZfwxL/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVZrYf1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNZfwxL/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfTpK070753
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 16:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=; b=NVZrYf1HKBj0dEN3
	e4Qu3KdW4YDTzEC3b/rdUTMjtW1sOwnnrHPeK9oY163Ry1bOsxYi4bojY0lQLut3
	YlzJ9Ki3WlyLhDGA4ZUU2eW9VHsXTsfP+YPr8CWQvqYtOSuxtm0D1EbbCUOtDj3n
	u00OG01TH/YISj2yQJQc4Y9Z65L2kA/0mIBUJlG8bk+ReykNkWe+w2lWyIM4edVd
	YTgzG9XKIBoJNstVezj/pzMYZrElr0CE8W1Ni17kDvh2rqhFdWl1bOEFSo5Ahvl3
	0BOWv1MlYwCDhflCmL4dEArotBfiKJiSXvY7XrYIsuqrAk9FPwSeERrdCxGidrgF
	zOCRnQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwsg6hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 16:17:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so32563a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785860277; x=1786465077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=;
        b=NNZfwxL/qjTru7a/ouwF82ajdl1jKH4W1gwhU6cgHxGizyQpjJvIe5pOj0vKQ6gBPO
         /yG2Ah/o9gcdQfslDrc4dND+rp238XXp8zvfWUzIzF/O6nN2Yx52Zwu73a1ccBi9WSUN
         HuVQNEwH0Q+37vGY5EsCmR18NT09SnjxaTK+EpcC/8b2XRR1+Ae1VJbLT4r7JsTq7TjR
         ZWbj7unAPq+dL/3k8XfNkx8fpHJabpkBpafRVnRRaRuj+tPM3yVjulkHE0gO7N3233TO
         0rpRw2+5X3OAWj0RqPfWe2fk2FuwMi49blbYHKZiynvD/IXD1esWf2/3bT41ZhHhDoND
         8K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860277; x=1786465077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=;
        b=ZOkwFy6sf6cT5Fhg9fPvvi744YNGVuNJoUTosia8rWdxx+fQD0UMlpX0g6YPnlsKXI
         VrvrMc1Eto6Kb7c+WkfmuI7ZMD99/DQN0xOGr7IF32DA8kSIXMFZ8GXimMinmBptH9rn
         6eV8jyzp+JJv4yb2t9ope3UlWjNzX6N8gZeN+17Brz2lDjUBEY6bB4vu7FwGobTuBtm0
         PCdjJmhHsJTUwETf2A4C65PlPwH0sb4XeKiykwcgskZjMqSNctRco5fSrqiZbD0zuDrg
         4LBiAbJrv8Qwp8RtK/bcKGIa7OIAgArch2Nl7iT0/ypE7fk/M1L/aQ7d2cZoTVpOJO6J
         XHKw==
X-Gm-Message-State: AOJu0YyKDwv+ZzDbr0mkrTjHWqkuxCvVewuRlkBSkQrmEGXhIytJA4Sk
	oC0hwAF2a599OQ5Ojz5qZ/PlGcS0AMJwkwYbWhMQbQhzJzQWt84jqEIdpKBmaoQgWlyq8kgdbmf
	HJU/qwCXQs+sgI6qjlElg+qB9TVpZ69Y2cIuP5t5nCE1J1IloScUijJbjfyTZyrM4StFs
X-Gm-Gg: AR+sD12NWmyA5AsGUGOEUgP21/smMwdHIH0YTesO3ZzTQWnQfUAPO5o3cLqHk32TuL7
	PDSrFt2VIeF6xTcmXNf68bX3vjXzSUdVMAhhzP1T+pfPSTukd/dcotVYD5JwuwGSIzdYAhh0ao5
	/tugzGDsVYuRc1S3L/UxyyUfeKhpIWaDfELKcBKowF/0aEdnRp9dNkXqoXOm11iEWlXIaoW45pm
	YS+DVguRjpPXkmZWD6BE2ZKEKVu7gW894Uzq/01FP9cenAKVc0GlDHoOHm67cNskG8cX3bQ6x6+
	H3tJIyXwCO+QG36zsmHuG1kQhUidgaC1NifzP1q6v/Gy7An7gm40EBYyC8oBjigH4ttPDsND+NR
	5nwVF3fNvl9iuYB21qBadOVd96NaUkvr9bYYZPVKVy5M=
X-Received: by 2002:a05:6a20:1605:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cb6c7b8165mr5346981637.10.1785860277202;
        Tue, 04 Aug 2026 09:17:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:1605:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cb6c7b8165mr5346920637.10.1785860276707;
        Tue, 04 Aug 2026 09:17:56 -0700 (PDT)
Received: from [192.168.1.15] ([122.164.83.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm10211411eec.25.2026.08.04.09.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:17:55 -0700 (PDT)
Message-ID: <3a9e9335-7886-4fd7-932f-e537e7610537@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 21:47:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add PCIe support for Qualcomm's IPQ9650 support
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZItHzSD7aaaA4TXEwaTugH7mI85frxg1
X-Proofpoint-ORIG-GUID: ZItHzSD7aaaA4TXEwaTugH7mI85frxg1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfXyLXInLZeRSZV
 cQHPdgmHXlgzr4XOaKCArzjoUWGscuFM8U0mwUKvm1+SCSm5zo6j62dkxPmZOCcxVYs9CP2a0mt
 sD1z5StlRNN3M/TXBnERUjysOjbK8rY=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a7210b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=B5ZuGdSqHqji0zkKYHIP4g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xn3Osltq91GnvOc9J_YA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfX6qe+4xFaL7GJ
 ypFXueun5TnDlJbgzprhH6Z1IdmBTCk4qtvHiwdgdXv4aIG38OvAwpmTeNPdGK8778jFFGksl2w
 1O62G3CKzNOUfqZ/quqlnmwuaGea3LmgdsqI26aMUM+uMwk0lgUJJkhvI18AXh6acx4kXleA6DO
 wRtv65hioKiYf+js+slO6wjazx52/q+GUo8pba7Fte0vRLMimeyiYh3VzuS54aDBwDk75KsNYMF
 ytdNnGexsKxRIGyooIWBH7v3YrhhgCsuet/hemC9tZ3AZLM+UcxSmOgMUq4EmKyu9eWGomwtmdH
 j7DQx4oCyEY/yoIk1gxujo0xE6VWGu9Dl8KhV2ZnSyrhixaqHmzHrgzTjNOvQ/RZcDGCXB0KsjU
 h0MGIeC3/7ppXbycxxNrabHs4LjWJhmwEyPb1J+dz5rb8MVacC0zTRJjCISdURiZnSf/++J1PiL
 fQL2dG+LWadkT8JZa9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040131


On 7/14/2026 9:59 AM, Kathiravan Thirumoorthy wrote:
> The IPQ9650 SoC has three dual-lane PCIe Gen3 controllers
> and two single-lane PCIe Gen3 controllers. Add support for
> these controllers and enable the three dual-lane PCIe Gen3
> controllers used on RDP488.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (2):
>        arm64: dts: qcom: ipq9650: add the PCIe support
>        arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
>
>   arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 +++++
>   arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 665 +++++++++++++++++++++++++++-
>   2 files changed, 779 insertions(+), 5 deletions(-)
> ---
> base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
> change-id: 20260701-ipq9650_pcie-8c77a69a6881
> prerequisite-change-id: 20260521-ipq9650_pcie_phy-60d7df32581c:v3
> prerequisite-patch-id: 0e1655d496f2d2f3df84eafd66ddfa6d7e202f3d
> prerequisite-patch-id: 46b42b118c95ec605f763f3f4bb3588c2685166c

Bjorn,

'ipq9650_pcie_phy' series is merged and part of linux-next. So this 
dependency is resolved.

> prerequisite-change-id: 20260519-ipq9650_icc-994280404adf:v1
> prerequisite-patch-id: c601bc5425e90330caf3faf758296ecf364b54a4
> prerequisite-patch-id: 75fe7bbebbac8801823601f17d55ba0aac29eeba
> prerequisite-patch-id: b651a08f6d6933bf8ae06f3e8a7d1580bec5cd64

'ipq9650_icc' series is the only active dependency right now for this 
series to apply. Both the 'ipq9650_icc' and this series applies cleanly 
on *next-20260803. *Please let me know if I need to resend this series 
with active dependency list alone.

Thanks,

Kathiravan T.

> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
