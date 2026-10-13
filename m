Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CF3806C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876483; cv=none; b=ZClY7/AFDZxQ/KOioeIs+VDb1CKAF7QBWC0FyJLBy1YlTRunbUUX2WEEYI0Nji/EDZJIJKHRpOnmQCXr+VU3NIyql7tKkNPD84ZiVrXm+EAmEN0FHi2p5or755m2fLtu8hoZUGabnZVPAN3MlZ9sGv6h7J4bjveQIxaZBjIlb90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876483; c=relaxed/simple;
	bh=1bvEIBQRw9p/Jan1rJdJmHDony/sK3GAuFwWmbv5cOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMI4L7MJzFFxzhnEXDMhGulzrVf+KemAKJw9lMRa5Eg8fCRuaTXQileKd8b1ibY9lEWBeNsFHYGC8QFD95TSM6XC5XbGJloE4cmtpZN/ztQZqezapkVVbv1CbvNlmzCmEwRKqHHbqYcGWYi29Rio5azI2Alm43duFTK99b92wgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iK/0uU02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YitffppP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iK/0uU02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YitffppP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRfv949345
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=; b=iK/0uU02XeC1OWps
	LZBkoU4LxoC+9/ctBKKKD8EEQ4HRqofo7mF13YYnXgq54APwA7ruFB4H3M+cOSdX
	oUMw3LGCqGk+Y3WBksOxcgBe+Dyl+tEedzaFU1q1lyGB+dsgYJGKi/J3ZWVB/zgF
	xo3peLqWwwNq1DmeClvMfdK4Vt0G0NvGXCUI+ki5clXsuLhv/vylBmmmiG7/r1A0
	sKKiwvSK76nFPX+4fGTBNXdVolAiKOYUuUDUZXGQHuyOI38FvXoGGrOU793YAIwa
	tBh7vIGi4dLgjv7K8iZSWOlilETNwDPGSpNd6nvLt+UmeUM0OMt3QADY8I1Gz8Cy
	sTBnDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6289kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:28:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1280381a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876479; x=1792481279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=;
        b=YitffppPZAHTkvX3vKICiubBlMKVFA12+HrB4Pe8gth2U4t7H7FLTzXT9OOEyeCq9H
         +mhxj8uvkN+UtzoNvvjRknS6vE/Ve6L6sFbEZW3vM/2CY5nVvePXnnJeyohcK3tXvYXo
         IfSnN1XTvN1HRM7NQWQjQ4Om59HGp78MDwFXYvYpm10BvztnXU02pn33d7RTYacs3CNt
         XIpfWTnpZGimT40G1cHbLj4+yOhdekfqLpj9tn1yRr89w7TaekBZbV7crAThGeIxfXlE
         GoOkDjbL+fCdEBuJCZuzFL4Jy2MiidzG1YzzYC+qv6Ikqk3nHTHL6nJWpbOqu12LCpUT
         n3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876479; x=1792481279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=;
        b=APyJYbrMiFOZb7CJKaNjyCksTMxPOqe4YyeYrI7zVQnWtQ2lVbYVGVBr1nu5HGz2cd
         vugTvdEP83oJswVMU4Y/CundbA6HC2fwnh4m1gfwBhm8rWs8Oqqly0YkvnCpfZ3zyDSP
         fk1PdPdBejlUshRDulQpRacxXEAcXZ9VACo0MRxn2Z5MqKh+3KQR/TsT4/9eNmwvalmR
         nurrp93WJcObvfz7ccgZzWxlKnkXkDV3wP3tylLx5D4MTwH0xzHr5LqD2Q3P0fVV1Huo
         NPYZpnU+jXW6z4k9HtrOvYVUNKB18rYpQOXfMLLVMGmGT+qw0XNuQsq4i1fkg6OW9Bsc
         2lJQ==
X-Forwarded-Encrypted: i=1; AKwUvBybJPF60VkWr0UlD/Fk47B08+3jMcLbHzRFfuszSDj0Fiv5r5PUXHGod13vH6yxBRBLieCOIOCIXz10+yxA@vger.kernel.org
X-Gm-Message-State: AFq9FYJUbQROv7WQ8vtPPhtFOYVLtBHLWEkmMydC6Ao9x35ZoR80nV+3
	JjnBX5f+DR711QuNfe7rxjzyYkraOp38LVZv20VdoaS+DSzzniBOccGB+w97P3TXhmo+mL15OmK
	bNgd+w5dWlThdCoP8LBGC8XUgigpq05KEoieagcn5aTCQCD72XJdyq6LAf4bCeI+NKVp/
X-Gm-Gg: AYBFou28674P2B2VM5trbvH3Nxwo3ce0cWV0zLecJ97GjCHElVPMI0iJNPhureMJK1L
	T/og8wPhpCwxnQ4+4f3WdPaFwolGnv8tzMd5A0roWue+shjf8WgRflIbkpAnD0TZclSSnG4ID+G
	+NBM3YnNm6ZY0Z8u9BVD9FsK0M4pg7jU9zIMaU9CK8f0rD5iwFRx6rdBTJ1v5+Y0u43MAQSIrjY
	r/hL7a/NpDrsmg3By8rkX61rEDH56USwVL5Hnb/+435w3auou9GYViyU+L2PVV4Wk0PG/fjRRoZ
	Zu4C6Z8vqh3l5NqrZugq4zj5rbPv9HPd/RpNG4YkBc3B+rrGV48jHXq56vSnH8VUtfzZ9jbyRzL
	vrl/YoxANYl66dTPhOim8vbo+Kl2NmFhHyrGlqYZw8P6Db6OTScfgapH5CyT05Jw6easp69o=
X-Received: by 2002:a17:90b:2687:b0:3a7:e0ab:d923 with SMTP id 98e67ed59e1d1-3ab3acb9ce5mr9405640a91.39.1791876479251;
        Tue, 13 Oct 2026 00:27:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:3a7:e0ab:d923 with SMTP id 98e67ed59e1d1-3ab3acb9ce5mr9405610a91.39.1791876478542;
        Tue, 13 Oct 2026 00:27:58 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm19498578a91.3.2026.10.13.00.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:27:58 -0700 (PDT)
Message-ID: <f4d10126-e2a4-41ad-9960-ff129d92f39a@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:27:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add qref and refgen regulator support for QCS8300
 and SA8775p PCIe PHYs
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ziyue.zhang@oss.qualcomm.com
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acddd80 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ka6KI2ZnJyLrzUlNBNoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX6FjIaA4flPPQ
 rI98Fumzg8nOzhyNxxZMBU3yyuEQ4pM5UqrrNfe+TtRHYXarzcW7hESGJsSaqxCNP+rIOnhrqOB
 LcmE0xNExozQ/qAI7bW9o9ScebM9IEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX9b5uDJMmmCcL
 ZXeA/v6JQFhIw8nwO54TOKugfbc848LbNbU6G9J03/o6Ts8srEHOwrKkr22XSFJ1u9BECUp2vFw
 ThmCw1ItMhqSlCad6P3rlcr0SiTPJQcgIpg4hcGbh69YnVlGf4jQE0yrfqS1hIz5IQis57Cb9PO
 HTel8Cnn80X92d8PMM2K7qmBNdwkGdpLPv9RnJ+fRSltvASCZfm2KKcFuol0nnvNSD1n/jhMcps
 KwwYmP0kU4Yd1Ab721ilkhFqAIvTtZNkj7aHNzmXpW2d70bv8nL5unPRivjQ03IH+VSniJkwUyB
 GNgWEOVw2rSPk3xhToofc09WjaQX3KLgCttg+biq2QRUZFZ3RljrNvgcavy/N0/pVLj+KfsbiEd
 wJmsMbC960WTfxVEl1yy9N+CXjIrAJK0yUwSd6Yu/ZMTrcRJGhXvAuK4lzE2XK/d2DuFt8ebxuA
 ocqz6WKqTyCXUltG+8w==
X-Proofpoint-GUID: wsbd-EKJCWew5jua1U2yRi4DAqcO75ZK
X-Proofpoint-ORIG-GUID: wsbd-EKJCWew5jua1U2yRi4DAqcO75ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 9/16/2026 6:20 PM, Ziyue Zhang wrote:
> This series adds qref and refgen regulator support for the PCIe QMP PHYs
> on QCS8300 and SA8775p platforms.
>
> The PCIe PHYs on these SoCs require dedicated qref and refgen voltage
> supplies for stable operation. Without enabling these supplies, PCIe may
> be unstable and the system can occasionally crash under certain scenarios.
>
> The refgen supply in particular works around a hardware issue where both
> QREF and the PCIe PHY are expected to depend on refgen2, but QREF actually
> depends on refgen3. This series therefore votes for refgen3 manually via
> the refgen supply.
>
> Changes in v2:
> - Expand commit message to explain why these supplies were missing and
>    what issue was observed (Mani)
> - Remove redundant vdda-refgen-supply overrides from qcs9100-ride.dts
>    and qcs9100-ride-r3.dts; the supplies are already defined in
>    lemans-ride-common.dtsi which both files include
> Link to v1: https://lore.kernel.org/all/20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com/
>
> Ziyue Zhang (4):
>    dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen and
>      refgen supply properties
>    phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300
>      and SA8775p PHY
>    arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
>    arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs
>
>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/lemans-evk.dts       |  4 +++
>   .../boot/dts/qcom/lemans-ride-common.dtsi     |  4 +++
>   arch/arm64/boot/dts/qcom/monaco-evk.dts       |  4 +++
>   .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 +++
>   arch/arm64/boot/dts/qcom/monaco.dtsi          |  4 +++
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  4 +++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 16 ++++++-----
>   8 files changed, 61 insertions(+), 6 deletions(-)
Hi Maintainers,

It seems the patches get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?

Thanks very much.

BR

Ziyue

