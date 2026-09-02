Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C7469857
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345763; cv=none; b=D4lvYGSuIXhHEOuK0xcZAfqm0GaTuy5MzupTy/nbU7y8QVBhz0bx8ZR4YNI7UnkVct2v2FA8lxI0nffVnr1SdJPXLv4zYBv0sRsRa2fvrKDx0XPB8DITz/50UqW0aUCNYFUuNnLhKnTcwcG1bg2IilWD4KXEIorLivatLrAypRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345763; c=relaxed/simple;
	bh=qbL8sF8H6BSNGFEBDA7Ai6ATlzn/EeqDn7sFEbF0jkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDPALCDOaUhyMH/YynBWzHy/otDqTZ+Y0ZiCeDZzYRrbU2moqI6LsGy8+b/NVSKPSXZ7ry2HoGSpnQVnAOVNfcQ09sOGl6+Y3xMX4K6xovXd/SSC5LMWlOFdvCQ7FNI9XS0lbKTdTRgrMGUN8k8HKpHhSmGJ1pgZ6EcxEvf3Tf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzMYh934; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We5IpDlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzMYh934";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We5IpDlQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NAJD2246279
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=; b=hzMYh934w1KQku02
	SJqNfC/emh7EcYvlzSk4km/GFTM3MDwKTULrgVdIPioyh88JkflrGR5WHUwTYnoX
	Hs5i+FryaoQrd5/32FrtVAzgAaju2R1NdPLbQw2jPAAM2/4qtL1eY1EtjhgHa/Zi
	Eij+g8skUxvvyviWHOoxrQ3ca+opBqsvOUnIhtZ81rpaef39Z3HO6XBxaHAtYlpT
	3IcBhvysUJbSyxZfobbJjkUMoUjNd+j/Olau2dvH3RRXKZ12zMVa0ij2hp7yUXm6
	j46wvKqn7WcnAyV0q/mOD9oWK0tH8gjnjhBPLsmmFcnoVDJ+F+oqFBhXEhyCPror
	VK9iAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj42h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:42:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53002215979so1580411cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345759; x=1788950559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=;
        b=We5IpDlQ94O8sFou4DOi2mILA6b+RNznin4eoBuUjZ/U/aTux5dXOXS63flNqU8bLk
         9cLIvhoOdBOz/XD+GFfqi01HFlMt1sY3rmHnN+IwOXu5EUk/AU0Otvv/jn9F30VNjbd6
         urkKRbrAL//qVGphyG8vY7ooW1SCOunu5QT/243jk3keyDTzctGi8pBLA5cP70okd7Eq
         zfXdm5hdhClv6ZquPxeHnm0JzNHEy7/wS2h2rV2tdM8Qv9cokdDqu0uykrbxHNHSAT1K
         YcQmJRvkXulVCaJk9G+KQ9aWcCWOfMLSlNw0rgRpQFHfktHBsIzXPrDPa9/UsypGVLgd
         5LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345759; x=1788950559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm8/WuLEMwHpPCpFNpnKg+wa9lO9vhVk92XBIh+6Gsc=;
        b=QkoC5qgejC88BBmHYRaXhtgIxhAStvLN6ZO5sFq6BICKN6xwiYdXLtdMJl6grv/NQ6
         MPpG/5d3EHIx16a849S+996TNMAZsXX/rxm7UpLmrMvZtaNLuVcpINfuKu0+gtOo9IrJ
         L2HWE/SDRFRhWVlX06hCVQoUgizPJaz1Cc3Grp4pYPM2zHHRdVrrhuTxcqI4cOkgO5yy
         00cQ+/qy/itS7lm5U+SXRe1n/oxzR/tZCM7qAgoUd6OXwwrgegTHFkqOaax9I8cbmABN
         PHHlG+/uil+Ude9vo6PyPui6XqPY/wgszAGXr3IH4LaNgk7CV9er0wFfvKBqwJXfrLMO
         dxeA==
X-Gm-Message-State: AFuF++l41dUPvadnc1jB0wpaTUhxBj1hMI4rbV3g3f8mkrcWy9fU27w/
	j/LqD5L/m0/7I/UUVFu6UxtVJ1WBn6FHZCfoUPtiZQImVgDcsp+cMTAVGGpvxi5jkIOLyHGRpAR
	6PNDiZDRYA3U5X8BBuBPED2IKTdEurzYtqUP/xsqJdPfMl3ygk5EtZhanHURr+mW8esSf
X-Gm-Gg: AR+sD12EyOYjaYOGflWSPNbsKGuyzzitHrApl7wOvm/bvtNBSYgHhKOr4cXZL/Ujtao
	LzVRb3EQgbg/hx2YosnyPITLzKJon1Tm83Ls7bkHYsz7L5y6tZJ3JgvIz7KJQpszt3Smns5njpx
	Qm+5TWXtxSo7X4tB91rIItEF89zgLuJ+PrpINzLq+AZ7NQ4s8FpuongScQQRWO0nU1Vtk4c3tEF
	Z+QLHFX34gmKYAsXYWv4txMM86CLhOJ/YxYifD2zIxDf9w78rJVqM/utfVixN1ixBKq9gMCzQH5
	cr9bqR5atJ/ljyrFN9eJsUyNDH1Cqgu7xsh0RtrtqDi9mQ5yMckcjrLM5Gl1xdbe83lnGOdTGAj
	OQkWIy/S8S9cB996V3kANWg==
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr23818001cf.1.1788345758816;
        Wed, 02 Sep 2026 03:42:38 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr23817831cf.1.1788345758380;
        Wed, 02 Sep 2026 03:42:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm876140a12.30.2026.09.02.03.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:42:37 -0700 (PDT)
Message-ID: <f4235ff5-6bdd-45d5-8949-389328a89280@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:42:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add
 QCA8081 PHY on rdp432-c2
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
 <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97fd9f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nlvt5-eobG0rQS_va64A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mW0bRLZDjqauQ1FE6Qgs5I6pIxwsmv5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX6cibIVyMd/2I
 wBANWhMbBM4IJOQXk6t3XbGSupVQuAyEtvcZwNLCL1/UHCT0f0A2PtZB8oLnbAPzB9fbJpUrP1i
 DshN+Wznu61fBUPjhfJnS9IbQu5P5P+8tNJ7p8HgsBG2Lqo8s+YQSNN51rz4qss9a2QoiylLbFc
 aoIN+ncUqfovTXtZy+CvJFh2xi7cu8/LWSwTY60QXzTNaaIBv38XHKpE71TcvwAO2B782cecYzS
 TyQpdaF+uiCSqcWGNa3cAl8WNs/OzZt9Mgek2b7Mp2YzHExgTZC2s6Tu1jGW0qSs8eTUfOvLkjO
 1JrT12MlJ5DV/GDBNVv8y+eHVIOPFG9ljco9Gy07p4LKYH8H/shDVbda3v6kwVP4vGhjO6aoKfm
 E/QI2NHgFFGzSEFhSuIxKxyqHvcBXG7V6kgX6QQ7E0BpWDaN38OvBH4vXC9AHSjmiKwG52dkGCG
 ac29ZiqDPxXk9Uiez4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXyH6wJ/gCmCC5
 /bfwRL5pUdD72bSfQQSRVxikenUtm/SXCHngdSWSQ8TktRLgUGSBXkOapK1ODx2e4myyYt+Owi/
 4m1QAsANgs187Igd0JFusWkMYqyauc0=
X-Proofpoint-GUID: mW0bRLZDjqauQ1FE6Qgs5I6pIxwsmv5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094

On 9/2/26 12:22 PM, Luo Jie wrote:
> The RDP432-c2 board uses an external QCA8081 PHY on mdio1 for one
> of its Ethernet connections, but mdio1 is left disabled at the
> board level. Enable mdio1 with a 6.25MHz MDIO clock and describe
> the QCA8081 PHY at address 0x1c.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
