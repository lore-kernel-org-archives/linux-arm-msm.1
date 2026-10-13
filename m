Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D505038E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897261; cv=none; b=SZGuE1xI5VcbbvQJb2SHwbrU4pd8DbvOi+Z2CK7R70cl2sJNNd0yhSY3AZRRNAcIB7Q7JAYjAec2ojEKlDDKS9hhngE7IYTbsTuemxDvKjfMtSkBPOX1Xn8JnhiqULJKc3ZvmbMAojEQm90Y1MkRZJv/dZ5Yf6dQ29iIBCu3Sos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897261; c=relaxed/simple;
	bh=08vq62vZAx40BjAf9+sA9gEuAv4BeAsI56bsFH54Ntk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXIGZotIh93De/I7a2H0VWspmsRQgG+VLdV9u5RhfIVQn/9kiSYUODGmDP8LC3laZ5uZf4zneoitsBG5C4+RTduAt7HaVe/bMh2vPA9P8zJcvXJGvbWpEIu7BGDaQ88829N/R78TLV9DjxcA4vLTevDSInH86njF1U5el82bxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNuU3hhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpmNPw33; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNuU3hhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpmNPw33"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8YbtA988777
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=; b=TNuU3hhZmmJpKghC
	LaSJdcVsc6tE1zauGs6S9+JtYmOHsv6bveY2jwSzgLxjWXVuFTmUtA0CUbjSy87y
	Jk1XlPElx81YQ9J5wh/76N7pEc7KgxUl8sqkFcwPsAXOfnZsBUvi3HGz0WZtDz9P
	PnRWGlalMWofiSkT+i68cKJc8Y0Rt0+LTGETpsNi/a70AlnoQKx7JnoEz7e1lXgv
	RLsaa2Z8F9YNvIQ776gR7Q4ZEF6WstODPykhfV6K8YbdBHrdfYJB/vfqhojaamfA
	jxreU2QKKcnTYdC6besAtR0HMLk04nNwmP7C3LtMlma7nCrrE2nI60SfZr+WufbV
	pqfl5A==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcb2t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:14:18 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66cdb701595so3867674d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897257; x=1792502057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=CpmNPw33yf1N4O4c8ezMMEKN+r0yjkbusSbTEQ5FpGlBcbu3KoRTI1n9ANaiOysfnY
         JiL9IUQlKLOOyz9gZGZfi+ZsJkeSpTnoQ6KVLRtSEpxYCm6Q8KAoP1CPYi62HyMVofuA
         I7GOvaloXgmoPMKUH4U2YSVah52qPeWPV1Ew472b1sJ5/iMAx0ZGKK9y9p1CRU3qA1p6
         s4FTrXcRw1LZzSFIBxEpu3zRYKxUEUyqQ6vePFi6gL1tqKfYZYVKXRn5RTesXCrwKO21
         hOe2k7U/vGqel4ivnWjCPhmAfn3TnFBoM1v/EV5EV7RT0WS4ZBEhKT5uYmw9kcWJ2Wnm
         7MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897257; x=1792502057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=oVtBAORP1XWwUZ1FzERyG0NBjjYJk902ZPC7mFSG0FYFNjH//HPoZqIcNAhcKryowb
         nvRlAvvvnsSO7jxXfs694yYU2MIU0UQyaz0y11xLgwXE94/s2fgqbEyt/5YLJQ1Au1Qq
         T+Z3+RztQE9PBaPkoK7JBjGXsgicSZDYVczy3Wb3Rxo/A8XhhsPk7YLQ+dIDIkMOdswT
         U5CTxDx212nfF1s7mSSYtNnz0PPGB+MubvgTCfX1pJwYYoAxPfS/PMOImAZQtnQ02A8Z
         wOnTeGiZpt8RNftsuFEZCvxtnxQjQB0YdbA2lsKnRoZqSaxqZVqQBno6yuLKDUts1EP2
         YZrA==
X-Gm-Message-State: AFq9FYI7HVpsem4+IUrIWVXohhURNAt/MqKlOuqqcLDLTLAdcgDoQWVT
	w15zvak+puu/h4WOPi/YclRXaCCfj2125WWFgWvyVPEy/wTFG6LLqahssh14eFBSwTUH83Mm9Il
	RRa+ie5PHjKsrcx4kILkkQY3ptRvm4IpO9z6+U+3RstYFaCluYKoLZhPLKwFNfnA7op2S
X-Gm-Gg: AYBFou2UsTNVIvW3PKAdhKO5U3oVk+DEH+Ai3Wu/a2ljm+2ZX8ph3OjBsDOb88zO+w3
	VloAR1C95ApTS+45DUQFuaV2km3cqianu8es7CXJi3hnggVpafE5oGaazeMdkqLAJrabKeIjSHK
	8XZSGuNjP13VzOOKT1zNk+eMUky45XM9M2sPpbqbLohe7kENhA5juwY6usvSV++H12gEiFAaE4m
	YXY11rq59WXw/qCwqbEMpbUhp5RF8Bnj5NjsQVue/9t4CfUFRb1JJmctCrEFcCiGT3SZH0rp8mC
	AqMoLnW7H+8yomOwZU8Uj8dWvzjavZcl8BEcZoKjU5gRNbQsOo/4hgRp+3vCuuNwFcrli4rsuNu
	GyQByRgz45otl3bxbSccVUnFOX5V+kmsXI/3H/ylHyGk=
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046144d50.18.1791897257493;
        Tue, 13 Oct 2026 06:14:17 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046129d50.18.1791897256984;
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ae586sm4715275d50.15.2026.10.13.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Message-ID: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:44:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXz8Z4XWt+Zbaw
 R8HRCXPc7rRUaig/ckgnzFfFW+WrHMJboHTUyYtd8Fzlm0imA3y6ctJtHhh/l097jeCkAa5FbjM
 sE41ScqbqTDpk+3TpCsNxor1wKe6A+HwhSQBKbuAYUe+T83XG76ozPZB2z2FQrGEBwM0atdOusH
 3uOoNxDcRvDU3p+lK3JlV2vXYDMLNnP/AFMaBVD5Ealni/cLXlEBOj2/1TI7rmWoDjimZnP2CmZ
 vPj//vrv88UiuyEs7H0LELQl+N6NKKOUrTN9yWcBNlw1hJRh36++Ap/CfePeQ7Jmb5G2B1W37bG
 ubgz4sWYxTgIGbNAwH+fL1jb3JMCpnrIJbm5IQTGLr6wp7sx29lFCUkQ6jHIG3igzS5B2PYXu1D
 bUF8GmdBdv4Bih0YHSqAROinzrpUGBtNW20QTkC7+8mSf2XkO182vb6DXjQvAPKClHUA3XLcM7u
 7Q3Nnr4yLMuO3n7nYfA==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace2eaa cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qsMvIBxTQZfwbozelBgA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: BDKbM2mc-FtAqFJtO0AFyfQI9fn2JwgP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX7nUDj87hgX/Q
 rzP41q/asa6Ju3A33N93axTCYfopYpw9qaHVTwsmhx19XEG03Vz0MhHGU6E5fxNlVa5COx69LvS
 7I973PUWwH9RYc/fNQDCUohwG2M4NrY=
X-Proofpoint-GUID: BDKbM2mc-FtAqFJtO0AFyfQI9fn2JwgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
>
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>   2 files changed, 211 insertions(+), 64 deletions(-)

[...]

> +
> +&qpic_bam {
> +	status = "okay";
> +};

NAND is the only consumer of this BAM. Should we move it to NAND DTS?

