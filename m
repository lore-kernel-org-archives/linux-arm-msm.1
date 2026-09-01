Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DEC476CFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269003; cv=none; b=UqEdrLTrOiBJZ12gDjKouY6//x1cydxtZE4ZLwNnVKUS7Xm50zOFpj+krekseMvy7XJIIm0H5hKQEQfuxzfVNozgU8qh//dU0vX8iD4dV6aV+2yS7JbCVAIgO2MR0oidH0vjkojLhV9GhCv23DCP1cqkIF8DDmrWz2W37dT2blg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269003; c=relaxed/simple;
	bh=BIvWPicuV2iWJ14S2btq9YUnV7/9UjuIG7+E2qxadXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cw6Pk+GG0f3vAQfTer1ncXQz6I0pOBRtLk/zKD0qrjoOKl4KBCkQu+cioL2ndFZqQENpPp3U/zEHPlWexbvqgi9HHTuRKZA/v3cM6RkbKkUw4rxr4bVXJpO8/UiYVErnQBaSee9RfDTfLWMjpRvUT5LaRnyRhrGcgw3cVtfQ8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqlaU/y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkTI2Q5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqlaU/y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkTI2Q5C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJLgS1641619
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=; b=pqlaU/y5IhnmH8OL
	SpzuEtRad3J3e8wEZJvHvoKfOyYf5fT9FKXiKlNJErmwM6zJYI3e2zrRPPOxUN4x
	BnaWC7SrTB+DEe6xHZ7xm84fa298hw8djONfpPZabpCb2zCYM5XBfsozwZPPVvdw
	9BdbXSn+nuiYul4lm9kE7jVNQg6dnOYTJ7XwBz2MuAbVOq/nUozlS564F/88UGD9
	+Wb3AaklOHIQCdYHAlXmg0sWqHVMG2OCVxejJbrNpIItaq9dMSjL1gR8T0nQH0S1
	NLvdqvJperP0DrwAhIYYzj1MqNiowIU+3N3ZrUakoVLMg/epeAhxwxeZ3xooRHrv
	WUVQXg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tswr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:23:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97ccaa613bcso43609241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268999; x=1788873799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=PkTI2Q5CJmEr01wfc/aK5Qt3f/8/mATlMJqawjGqc/3oYPLDNaflARpHzN8p0aAE4A
         d6YyNev1yBuvs+gwEA1ipzNlR1xRajjpdZsa0s6Ffr4JKUWgwjKZBUjp/4oCjh69IPoK
         oc7Mc921K4t/i/R6SP7KJMdKtSlEPwPZynovQMCi/Itm9iUNwlH8lAnYEMZPCKa6GrVY
         USZC2tcTiHueZQPdIKoNMV/Lf4sPaYlr2aMzKzLTKXZ50Clo2FTj3DJwsUqv0MEcO3+W
         VX3qYwDRovqOli0B0Ryne4a+2TrGpq2uDL10BYGREFqG5yf0uYtnT+dexZmbIu/UDI1c
         jWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268999; x=1788873799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=qt7W+OAYlZ1BxTUvo2ANLosbhUAZf7EWl50lN9HRNqGTBP7izwdGri+Mo/5BDUhJGd
         hTkZ+WyZ6a5CxBCQXGaJ2VUQkmDqBsL/2myCH5d6PjeEgs34n8cRmG4e47p+xcYRUUCY
         leQf2oMHqTCF5dejdFg6X5NDpGT8OxEGRqNBqKkKsNi3P1SHGFlHiHsLzKynKh/hx5cD
         UL859DPVDaW42uMNesfib/zj/7ZGA+s3e6TQXUuOys4fP45Pf1mXTlM4Mur4DEk4yUOk
         /xgeqmJNXWBNXNPdOJmacNK3SiMpKQJp0WroXphk0F3pUmBC9x5pMAS/dX+JNth9B6hf
         14BA==
X-Gm-Message-State: AFuF++k9iIzvOCog8lIBYS064RotRxtefmIEV5loRhJ8OgsLoyVYLV+S
	BvUACJLOa0tJPPwi7p1DYEXl0+CiLf3ISdxE/bIrwJe/j4vvakPAWBoIWkgSgEahogxi2HWBe5C
	i/s7LEfnTUV9XeQKh8bEQQiQGYZhkXM0ur6s37a7wbgdI6coSsaSQwudf3mNkBifjQ2Oz
X-Gm-Gg: AR+sD10CdYOw+wi6kFC7Q0NmIHvm8YfSM1BV56IG5oWlbC039YS2iz04xs/z6E8vlF6
	9Jjftj/P7psXqPGfkVaswmMSlKSsROABjZVY4nxP9bHSRYpklkqRgwEIGTR1PenojmIqwf8ATYY
	LTz4RhyG6qO3UMprFxdaBRK72qE/epwChOqIsbvcq9FCt8/P0SRy06cdCifx9DOpMxBuSTE+b42
	1NtrU+z6837LRHXUsdqvxJ5xP1hrYubPZ8GTTnL+UrhiXGi0mOWZLdJP/tPHv25G3LSK3GslSTM
	R9jw42jLjlBywvELS0OfufFQlksUHyfE1OJExkXDXNCjch3ACvrYmADZyObwMaMHkSmJquxN2HQ
	ciTz15TuuYBOscEbKC/fVCw==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830133137.1.1788268998815;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830117137.1.1788268998314;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b34sm2867117e87.3.2026.09.01.06.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:17 -0700 (PDT)
Message-ID: <f328d93e-2df6-4c94-b7c9-cc0ad6158f46@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
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
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96d1c9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=B9jzo3DVsI2-tMNqGVoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxfvD5/cLXio6
 IghMOo7LfgzXLylisurkjdLgH7CRSudpcZVCE+xLj3BcRJ4wzC5CFKtj/TRJmoCIXJjGc2uosTB
 bj8DssYxsbw9Cxh4OXs51S6gmVb2JF1DfpxoH6FbtQBiWsD7BY/arElQmAhB109M/U1KHUqWI10
 BWWj4KxWU34HCk4fLt/MH/YPRwGN04Uljap1AaK4YuSL8cjCp0S3Tj/1rVjpXZapV3SmISfuzRe
 H+fMXhnwjBS19Jlq2tTpvZnO8qQrW8KLFkS1nNmDP/mXW03388Qp6axdWNwrieAhUCXMOl1mc50
 ucn6ZWqspurvD9hGb0VwDByIjNsEs+ht9AUTWnizI98N6uoqa6FPT9UAipCjwxL+++2tYeJMtfM
 WrjScBbsKW6HYHG7f9Y9e4R/xvtDnuwJ+7VFOz0LwA0ZpIAwQ96/Q0nzZD/lZuwI/4+6XDUel8B
 c4Vdtx/HLQ5em/cgYdw==
X-Proofpoint-ORIG-GUID: _oTn6Zo_0S3lCAamwNP2G4HGMsX41foE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxp6p5oO9FW8x
 r63MCIsMxX0NuNMd+LUGbYZV86uSvIEbXCK4ONVbWYX8ZHdRZWLNqEVeRpycpnypkBaQfmZASru
 0WIPpIPP6sPdjUdtvNlA2BV+PuErrOY=
X-Proofpoint-GUID: _oTn6Zo_0S3lCAamwNP2G4HGMsX41foE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.
> 
> The PHY outputs a 250MHz PIPE clock routed to and gated by the GCC, so
> register a fixed rate clock. In addition, add the register/value pairs
> for the PHY initialization sequence.
> 
> The PHY requires a 5V supply, so acquire the regulator from the
> devicetree and enable it on power on and disable it on power off.
> 
> The code to acquire clocks and resets is the same as for PCIe so no
> changes are needed.
> 
> Power on/off sequences for PCIE and USB3 are similar except for the
> delay timings and USB3 requirement for the PHY supply.
> 
> Lastly, the PCIe and USB3 pads are muxed so select USB3 mode in TCSR
> which needs to occur before the DWC3 USB3 controller resets.
> Otherwise, the SS link doesn't train and remains stuck in RX.Detect.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Let's register both PHYs (#phy-cells = <1>), but only make one
accessible. Otherwise, we'd need to alter the compatible to access the
PCIe part.

Konrad
