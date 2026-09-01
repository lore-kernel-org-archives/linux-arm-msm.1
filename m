Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC55C3E5EEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268593; cv=none; b=KxvOL/8yupH0wCkN1aUm/zD8j96LcluwkkR9liYA1NFDNIuG7CDH6pPqTcLi9MOzECidw3/6NQPUvkRSLWtYWGFhFriJ2ElxXKflIsmm5kMZptGwj40gro3GVAMwahdF5iLUU1RLhM5qZ+WoyWQH4QwRW7u4nUA1CcmNd4gbhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268593; c=relaxed/simple;
	bh=LQ12SJUBaxMvNbSyq/WSxG7N0fuhvkTI6OyQzsXKTSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKCgcMGHiYc5OV1KM110yjMfu2FlQGEDE7muRf5STTJYrI7v9s7/OvmoxihL4m3eyfPrsPDMkag0QV4nMWGzRUXCEhTz/KxXQPzhX7CSiea9EkORpGovgw92FdIUrUtON4Bxg6IrHod/1UPjqYDKG4pp0jVv4kgGzyCe8xSbjI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0w6tk3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rh4OycyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0w6tk3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rh4OycyC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJlnb2752270
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=; b=U0w6tk3id0rNfBAS
	8apj5ENqwbMeBUyf4VZWyDAc8MwLV7WyLghvqZDfjadRanUylve3o1GWTWBzUxui
	YUa2GLCvsaj5X/Z0sKhpO5MPT4isuKQ6JM/f0Cl1sey772Det9Pv7YqjzFJE5mv9
	qPUtd6NpO3knt4liK+GZe2XTXKbSRSX80OOGXfZf114WmWR+q7sPwDKq3iPLZ5xt
	YxyrFLcdi0SO1zLiUWqfpKvEqS4ox18mvjOREDWr0xaK3l16LlTHit/v7M5tm4Mr
	GiRvp349WdlMN5pyrZNAFchut8V3C7C9FMtPSMzyk11nwSBocjKhs+bhIGDco5vN
	FqZ0Lw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchc3gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:16:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so101355e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268590; x=1788873390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=Rh4OycyCfzz3RZt1reUVS6F/tKWjdwjU12UvOtTAkIlsskJYpMmkAsoUXz82Xm0i59
         DJx6LjlNdUIBUa+/7YBdrDEINg56ExncueVGy0qwoAVRqEDjEGKVO35GAtTOZwDjh52q
         lvdtPSECscT5RQXPDyZC4oeWmQX9+NjfgvwiR/RLvwzRtH8ozRDjbcOwGc3SL4kzz6jp
         dkunNu5K3uZ/eZr0/hpJP7ZJKBlx6N9S+TVplZiu+apQplXlZ9FM+dyDYQWvJRqnlYHY
         7VePrAE/6bzrnN0CeJhzcmtYH+Ta2PBGa2vmInQaT4yphWnEk6ORt8OOoUHL7F0eDgGf
         jIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268590; x=1788873390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=PfkKmoXICiOZhvpoNJqwe0Ih3FpIzFvKMNeM8C1vTmPX6R9szIhY2o2mdfIxrTmFq1
         hRrNgoLr5/hSActSEIVMvVwaA34iRnjRGL71seyCmTOihKLVJwo//P8wsdlt6LunMM6f
         9fwicMv6D+BGFpptdvL/vJkNhyp2c3e6y0zoumHF/Y3M5ZlIbGfU+xhzI/a4wPb2P7RQ
         oOddXDIT1xI/7rYctRc/+0Ei1TIweOh2U8YQi4/JhomPexRaFTO1J+ziC4xGo2KQOq00
         BVHI9gVeNVKbmm4M6IRVEDRoKkTjz6UNmTYGwn/KeqMm7yvXgsL1hbtZa1jyFUbTKNmF
         zvFg==
X-Gm-Message-State: AFuF++k8yr0+ERirDycGpc6cyI86sfkyvQBljWgIA4JGZ4P9aa85Wg1z
	aIwOVJeyQr6oLCMcxPm6vlUv/qAXlYqKyfJ8UQaEqSuFC7MKFUNKxW3GHE+9jLXeT4evop7v44A
	wu9FuFf4w2tdIWl5gWPTMSs1fPP63DSsJoWm1uMVcd/ghxK1l4AoA83wPxtwhnxBGUybN
X-Gm-Gg: AR+sD12f1J7wgCaEkAfNK0b6ad+JZoilXiVOXwnR2snuApnoraDSt9EDPxtQAja48r+
	MghfZ2IN53MJaPZPER6V0jVfHDvne/N5ZRFgrBdyE0U+tiq/46APGxilkQRVPjdNUoSgivOWzb/
	6EDe4WsDiWNwv/NR6yWsNtsqkxXyW5aFm8B5A5KVVacYtttg7ZCyPy08sAt0kPsYNKR2Y5AKTcN
	ua9gHTEBtIgpPrEFUMwr9XoesbCMlcZI3hkVTQ14O4h4z8WbObafynfppPJA69laVgDTOdwVlvj
	SCBrg0VQ6UnbFw70Pt/teEHddWIqF+MYemAnjBZ8J/XvVaZjqtansrGMF7n3M365GmsgQVEC5pL
	NdcSFu/WpCKnK1ZH/mkfctw==
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560692e0c.2.1788268585238;
        Tue, 01 Sep 2026 06:16:25 -0700 (PDT)
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560669e0c.2.1788268584589;
        Tue, 01 Sep 2026 06:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305386390sm22564121fa.5.2026.09.01.06.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:16:23 -0700 (PDT)
Message-ID: <a1d438e9-0a12-4b05-b154-eaf9d1a6d31e@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G2Yfw8ePxjYKLPjV5J1AwptJdAxOOi8O
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96d02e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=r7ctpyJW7PmjMhvLdxUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: G2Yfw8ePxjYKLPjV5J1AwptJdAxOOi8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX8ntdpncFQaQO
 LUxhxjFuqjlQxLxWnQ5s8Pov6qZIeckQ+3ZWRSCvCrP0odjB/A27VcruzzRajrv/sOoaWFe8ATP
 YeMDtuhyIw2f0VF6+oaBIDmozzz0484=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX4afNLLEIU/gX
 pcg0Frwd6FdEU1hh5z9YvKCEawFd2fiyNk2plIJHPXi9Kh9vC9B70v9xJhYqplZDbpcRrBNayv4
 eOFje7UzWdnwBdfCz4+RdC5ypec2OIFnYiIqNEAH72JvONq44/d2V3EtrWjmqLDofn5WVgqqBb+
 c6ISm8EMFJdoq8A0EDhV7QE/r0olU1bbKbFr0Qrkyab47YoVzWBuVZ/chBZ4ATHtMRnN65n1kPR
 8yACEEffSxMkBMholgK0JVqHUngtEJOArGsa6avVqE53+j+fVHns9lZflg/r4pm35+7tNgoSx1J
 Q7XeCLpmNiG29oGClGtPy9vdFfz+QlyS/4odywZPwaFCuN7YHY0q8Sud1y6Z3bGxyc75U1/n41w
 sYLFexS0a1yHuJdJA4XWy1+n2/yE2V0xqB6ugXv6bsN6vgzD3DpCIghmfC/gI4KDRartTGwpnm1
 iV9OlWIQWjblbumtmSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Switch to using bulk reset_control functions to prepare the driver for
> managing multiple resets, acquiring reset controls by name, and
> uniformly storing resets in the private data structure to enable support
> for future combo PHY functionality requiring multiple resets.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> -	phy->resets = devm_reset_control_array_get_exclusive(phy->dev);
> -	if (IS_ERR(phy->resets))
> -		return PTR_ERR(phy->resets);
> +	count = of_count_phandle_with_args(dev->of_node, "resets", "#reset-cells");
> +	if (count < 0)
> +		return count;
> +
> +	phy->resets = devm_kcalloc(dev, count, sizeof(*phy->resets), GFP_KERNEL);
> +	if (!phy->resets)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		phy->resets[i].rstc = devm_reset_control_get_exclusive_by_index(dev, i);
> +		if (IS_ERR(phy->resets[i].rstc))
> +			return PTR_ERR(phy->resets[i].rstc);
> +	}

reset_control_bulk_get_exclusive()

Konrad
