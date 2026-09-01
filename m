Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99149383333
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268679; cv=none; b=c8RTf0nHAb4VFy1xZBFRw0iu1Fzm/j4ySAHXNMQAtgIRmn0T0xlSrk2lZ1mj98b+JJDw42rowAttS6kLrhUrhU6j8UZuApJUyuhYlqSdU8A4u6xAGl9pEeAqewop4VmLsVqU8m/WQPz0UXIRg1PaDcGfsXGrkMjrjzs3dkS/AdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268679; c=relaxed/simple;
	bh=vaanBrWBtt/K9qjvJi2FisIQaJGmMcAWPsrvdyQ2gEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWM/AwB5ebFksCMEIGrZOXbu2ttABlKBShQIhzmDIr/19pA6LcCdlz0xOHAAQ6qQcCGC9KWA3D3T7TLpeNZM7HCG5muNLY+TOfPeXh63taSF0s2yjvQb9//JMi8sckAIFg52HIpn9FqKDMc1tFt/w3WI3wu86aGwmiIDh1Q5XMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1AAPkC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfcBaIQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1AAPkC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfcBaIQD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9tW1641291
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=; b=Uc1AAPkCq8yaPHNb
	K1v5peehXwLRGrA91Ar2dWf73/ZrMNfIqgFj04Cvkzo+qj7RAbUoGXUiYuQb+CD4
	Fm2OxH9BmijnVtpvFkMq2FH0i8v3K7c+Dy93rnZGxUQ9+3u5pcKSq6+ykSWt1kMZ
	3JGcj8C8tmt4+r1lRDeqOm0DHNfraXlQeSqPXmAdzZA5Y8xpIT0nZx5dWtsVjbVy
	dsLzsHJhdJ7br9l6Q3a8q1loCUuaYlRFwk04pSiUCQYmFS8SbH6RT1NmFs9E+LiN
	HYnH3v09g4IJiwaLgwOkVMPZTWTB47AhXEgFxgw5LIXZ3J7iQgCKKRlBz2fxkj21
	RsqITw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8ts1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7824ec38da4so120045137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268676; x=1788873476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=PfcBaIQDRMz4463xfzKr+VmNR0WNvf/U+y0O/t05NmmWL1OIrShtMBqtcZr171K4Ho
         Vs83QWcCVbJX4n6R1QTPGf2eOXeO3gx1RzlJTiKe6fJBUesuonfPKsk3sRnCrI2Q9TJU
         tJG/1qpGzRsrm2lsXDik0mNgzY5n0Msp+iy7ybhZybVq24CURHsdt339ABgwXcxgx7WA
         ojAsvgQh2eqKX9G1AZmKtrYwGJxBSv34cKHgc26OvzjqKgC9VlKETzadrl3qdfYzJ0rm
         SLRhzdS35SuRAGnXePo6vNh1KZ6vTrTHmpCeGaq0rFKchiOP2n+6ox1sWporJqeV4ELp
         6NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268676; x=1788873476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=X7FtkKXKDRzAyxZe3sosniYwKoVv82qQ7B3ctnqbdRAHGcWjDefoGhIoVupzKFFNot
         f0GLZPe6tYohZiM60gTgdfvm8qXgDdDoy0TH2ZOfDCOe1uNit0E0JgeiFXmng50hg+yd
         DJ2KfCf8UvmE/DDOYE4LRE8UjWOcRJrB+h/KQXcCk8qO3S73hZ1mWW4AJnQhsORHdcNW
         JQQ3Wsulcj5UD6GrCHcV3kUfqKrhLKDbU+Weyvi51NfcVEW/dGGWUWdlL+pCFA5R9lv5
         UOosIWk2DBE8EEmL6A5mhUNCpd7j8pkXkjXvP+hMF7Ez4Hr+5dI+56C153yLmxntZoCV
         FaPA==
X-Gm-Message-State: AFuF++na9oTWixepRy3TpaPyxnUtCV9fvuj08MUWTkv/Wu+thkeIsSiJ
	d/5CEX0290SsXA6bPvFhhFHeyVGnVIoHIcnVi9gxxEC2ItrC/YbjXg/AtrprWYydm6VeRlzWsAY
	u/zrjdqRaaP68ObtnXeoxpBiOqdnzM3C3zWu5Pu/4xQliw61+bYrQ055a9ktmWOcYQicI
X-Gm-Gg: AR+sD13Bj0/G+nSnOohOOTI7+PMUWW6FRmogEXlK1Q2NN12rtS8zoyKliQiII3AKQu5
	C+rBrnhf7l6Qhpg7m6Ic/EWP/Vsqtg9HG+7OA680VS7fvjawNdPtUb9stdpHq2uxZeS1XprK5WM
	fqtQJDPyx3pNNyFaAvHb8JWfvq9VSjpweBN+XM8WdWItTEvx9HaywF+gEoBUmJzG3ua95OHBwKS
	Lli+o1W6l/l8sgl/UP8DfkL7zNrlU4UOAHJAgQOwd2WR+GyqPHWHic352FM5IX/dsQO7Yn9ViBH
	fC9+qNLoPSjJn5usmw+BkNu3AhjvtXyzixFwrvcEFrlym4HNRpekTXJGc4+xiXS2SoNiL2IEyMB
	VjF3f2FgEJPl1nKNu0Kl4Gg==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422331137.0.1788268676407;
        Tue, 01 Sep 2026 06:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422313137.0.1788268675877;
        Tue, 01 Sep 2026 06:17:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89d3e06sm2866547e87.26.2026.09.01.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:17:54 -0700 (PDT)
Message-ID: <5e7cc36d-73d6-4040-b62f-88fe2819ab1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
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
 <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96d085 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=xCqKcKfuVhzOl_WxAlwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+i2x+i90mwCB
 5a+/+KCY9glpIuxiMlKh3cibX9j8VZx9efeFgFn7h0IBnAhVZzISIWM84S713007Vs1a59MVx4M
 AT69H3YQAWS9sXpZpnLcdc0yHBrkgm0wnEYzB6pINjykkbfhpEtqMDAICv+q0vvvT+o9+6n5Fh3
 mlhrCnTDNHdM8k3VOya6idedo0OCJNjd93itqf0btJebeeuRJ1/pT50wdksuGGmxR8NePIlRwIo
 F2agOKMv1S7BBPm8YYUXJSzQGqrM10WbFJbG2hH21062Uy0IjMt2XkYY/E6Hz9XTgXGqUdl9YZy
 W4ITJZGyGH/aToSMeWTk04QVvOMgKq2oIkBNhGec7L9ksokJpa4RhCUutfjFsKJ+EnNC81t/PTT
 L3lw24oZyQJPFe86zJErk6vDZ5L1sSIJIAwGzPeXipVl/OEkS8CS10Qqj0wIpt1NVQSRBOxARD8
 nVJdCm1YO5OzEn7Ud7g==
X-Proofpoint-ORIG-GUID: 9P62-TskcWlbNIL4DJNS9YhFlVO66el5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+8GIACv6jUSI
 9Y6RA0CRn7RYjA8rtB94U5lqVsBMbXmvN8t2+aUpHHYSmgQYCwlYOgJCU2jQTBT+v0foGZhQiap
 szCL/kaqH4VUehPNFPL3b9g78XRgK9Y=
X-Proofpoint-GUID: 9P62-TskcWlbNIL4DJNS9YhFlVO66el5
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
> When the PHY fails the enable clocks, it leaves the PHY out of reset.
> Fix this by asserting the reset before returning the error.
> 
> In addition, language correct the error messages.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
>  	if (ret) {
> -		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
> -		return ret;
> +		dev_err(phy->dev, "failed to enable clocks: %d\n", ret);
> +		goto err_assert_resets;

This is a single-use goto for a single line, just inline it here

Konrad
