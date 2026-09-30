Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC0483BF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764406; cv=none; b=dx9VDkQCqXmcNovYeShNLDf74nH5icbnM9dXwj3M4Y5eFPyC/eFuGl472dgG5K0/kTBPlfoIQ61648B1LHr9jzkIdM/fgm6Qd/+EBCwEsTBD2pokMG7FR94D4GFgJm1DNvTj0GKKCZV9KOSzD+qtUObV6koHveqPEVzcxwA/hZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764406; c=relaxed/simple;
	bh=p0rtOpqJgYOdzRogUQx4C72rBJ6MZuOxyLFNm8hD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kX0Q5+m5JN9Ae5jUmNi3j9IMZVp9rlSYyZMn5DWFUZVXTkY9VCzbt4agr9g0Z+O3yO6XE9SARzz0wkf6LBOYALe3AKob2DjK0fMQVZy1NhTp1cZjDbuPSsD8roW1sMSaxzQynFOkkOLrS8QX63/jFb0PpzRNj2OWmd1jWL1xO+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKp3pkBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9UPHw4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKp3pkBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9UPHw4O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UA3wPq3414037
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=; b=KKp3pkBlG9NMn4o+
	Ie78eIItC5nrJQHzevcTluOiAL9eL+IM2U1fu2POEr0CPh21TWhoOJoh/3q5xDXF
	oGg+oJlL+dI2NFnXoFUUlMSBjBp60SqqKSFox2b2bJbwcfSM5exKxEUmjtRAGLBL
	KhrNGk++ecMx8H7H+ns1IWmdgdFnVfICtwPauN6XY1twkBNf1rQEAFAl/jCjHkat
	Hw76Q3tvDqvnBY9isdhW8J7IrngXZFJEiUzfcInlBymyWWJftxE58SeNLVzsvFhB
	foH8mUZM6lr89VlWNedjUse0YSfwmOyOdW4+7fjcSwA8Yuv7F2QrZw7oPW894TGp
	Z2qUgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk83fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so4174385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764403; x=1791369203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=I9UPHw4Oiy0auvSlwDAgvpMRNKOkl4CGmhHQYBUJ1vNhgEAf6nSdUrt7TgnJjfVEGQ
         mFctZykjxc2qzkBJlfwcrIB7g4JE2ju04HcQp5G+kVd4cqYcDyv5LTLJEw5MXxug9zqK
         WiCXQayR+uq4Zk6FHAhpTlwUAtAeMtEZpLDpDWmt9vNZkEWI1XJ2TCSxQ1prq7NWMEDR
         bt3O3lK0ljQv/djHBD2Qp++pZPY6qIfTKA42gB23ni48GU2i2H67UgkhlTEjcrSbkxmc
         BZ7Yar++LwPVSRFO8zoNnwjNXtJEtqxDvSiW3Qw9J4HAqmSM4i42Y8IFo62gMMRRT6WY
         yvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764403; x=1791369203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=L6o0mrjN3pEka3qJuqaNx+Rsg/2GFCeSyZQDJYs97R/Bd5VjZA3fJXk37TDcLgpZzx
         Xd+zIUG3GPvpv9CpErlvapsAM1VjV1ycuhFZJuMn/6SgQQAqIdOmsvcu1WOY21IZY/Nv
         fDV8btqot7+iYCNTD/K0eKrOYeomE58FTM/gNHCLOxu7RzDla54hN08sRfi6inTbP/ZZ
         UdZaXvyPd7asQ0d2t7oPWo3d3tM9d6jinOp2gB/2N4KAN0DNmirPleKgmB3pN9DSFN2H
         jhZXs0+5EfYvXW1acAAmVgrfnGJcS+B95uLWIyVf+0gn8pWlVPx8k4QHNXhcupAiCr4C
         c+2Q==
X-Forwarded-Encrypted: i=1; AKwUvBypBscU/kCqGuG2cH1o3+RmH1Qd0RLBo2xTsWcczZMB/+xCh5qjVHfehVhvxbLIxYRh1t5i5bzNGnyvDEEA@vger.kernel.org
X-Gm-Message-State: AFuF++l+NZMsNTjpxzjeGQPFN43oN5woBU09ccm2TsZ3xKs+/vqMwyF5
	2U8oDMm9cxkp6b/tws3hdU0vccIDiyhf09ffWn01KNJXnd4HSNerbXjmy0PZOgWIU14h6p6EpgV
	1Rw7/1T4p1OhYu8XFmyg5ehsSaWdKk8C5hhebOm+rnjlbKgs3DZtUd4fM7D7Aq59OYVDw
X-Gm-Gg: AYBFou35PyLkfoT5cwLsMdX6SM0/5Yu+8oPtigLbtLALO71rHzyTFwDhN5Q4zXWlXlb
	taYavtNdMa1mBJfHa98eRFY82BC9TKKY12UhWxha893R03884Fns3ex7CFPegM0rgwCtGuP4C/m
	NuoBS7v5H9LQ7+JHkecx10EHVGXP0ltFp+/RGtV5r7khle2t9goRj/UuTCVMydFYNmJ2jRExT8X
	1DtrMrYlEXniB8x/7sgqmookvOcz3ez4KHpUUWgT0Ql9QHLHxmVMly8dw+eIcwaOPaLIMWtjNm9
	XymXO8T0QfGohE46DXoXRVC3cX1LnVMWAyhoVBaoJlrUxeAEni6U8Q4YYfrXLCcvnaRPODYrzOt
	oMiDpfEiOUXuj6prNY2SphQ==
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144982285a.4.1790764403195;
        Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144978585a.4.1790764402614;
        Wed, 30 Sep 2026 03:33:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:20 -0700 (PDT)
Message-ID: <3439bb37-0aab-49d4-99af-8c2b22fc4adb@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YdYePEBmTwq68aNNlrmKrXgTpjB5_TKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX4pYF8k5x1FOz
 35y1Jk189Lkh0SD+85hgTMO81JvjfTlI/aYRkB+8U5Cf83R7Av2R4oP3exoAEKuRdmwqdFl/B0Z
 HlkR8LQ1e84pc8KF4tuYMuk7+OJTfyAQyW4diDv4tap17KBqpd18+12JbydjYQWVUMy1fBFgfOi
 pJ31jAF/U0ldaZ+N/5+aNH+cSKMPwHvIWAwRbwPTgubl6tS4dUHKvrosXdnizrhcW88AoNU2c29
 fvN+zZGbiUpsTnAspG8MSjA/L4lQuVwwkIJH7jjAR25yTAdT10vnoOCTYsJrA2lPRfhA9sNggVD
 qUNHFBdcj/KzkD20ELzsUaLchxsu1/iMfmUii97kmWSKYDbCS8NKUhPZH7LFAkRKoE1ld+XwwNV
 W7kquLblYJyiM0FfuJIb39lMWlM/FcyrcR3/JLdBa3RoCCcd/2bgS8olHunVyn/JiZA0Iu2GWfi
 CzG4L7DTCQ8bi2e9bbA==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abce573 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+APuFPzmT+/m
 OUkNiHASpALFOrFmqaJvnMdX85lma+uYy/TxMJ9ev8F+FHa1bZH98xF4azTcllNVL9jxf1yc55N
 4uhR3fhcabmIrq3mYKnJU+ktWQStgZY=
X-Proofpoint-ORIG-GUID: YdYePEBmTwq68aNNlrmKrXgTpjB5_TKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
