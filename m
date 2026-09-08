Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF705452A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872569; cv=none; b=XjMaGEjlrPZtrRMdGzv+zcypzmGd61ia6ZBMkAv8nnhswFZMCxcbZXuma79GJ5BV5s0uThDl7IbB+BgWhcP9/waCMhia6Qzpnqucy816eVBXCfSBmynleMt+1PhalfXjYPAinMHXBx2V7o0G+wYMgstJ8B6swFtG0BXQgCYny38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872569; c=relaxed/simple;
	bh=XX2epvmlLQo0RJnDrbcx87SCzNk+zSmVWGjPaOcT1bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7o9QxFN5VotLxBmn8l4Hf/dXiTBZJJHquY2aDCCmgYX6bYI8USWnX27oHax+6HZi1+0B0vKPshrPaGwMjUEJWnp9kiMRBxSRnw5oKP0acljYpiTN047t05hw+YdP1nZj85pYQF7/LHlGxmSQwaRieCSDgiTA0f8+cqvl1iljuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R28QCqYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XasFuaGj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R28QCqYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XasFuaGj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1hKo2411891
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=; b=R28QCqYHddbxB2eq
	gy9q2fsTl+7J8OqbPuykazYU9/7D9Oau5u+2kfU1rUJk1qHJO9z3R1jEuKrbCiJY
	eAt5ISKZcWOp7GvXRSBrAitpX98MtOHf+YlCsRJjhiX3hbPdoNTOemvUgfhnwlcx
	iCvBo2uHhlgmAgpKX1Rg9slCTmrbObYodstgoa7RA6P+iANLhQoA06F6GTQqgWo9
	RHVEMGrywjj/D5hKtNQFwT0+/8sWnRslPEVWd4A0AwfWwtDDeLl5Pm5rn163/BrR
	mO5Vxis+2ji3uF9n4OjRzHQI9xbGfcKciJmT+A7GSNVOM4GGcC4lbN0xg9P/V9MF
	t3Si7g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvug086-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:02:39 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9e4a02796so362683a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788872559; x=1789477359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=XasFuaGjtHl/qVPBZrPdsvjtTA7RAaOPrmvyzLJXJQK9CFspnQvWHPhU5rVj6EjS8N
         tgopwejtNJ/KGTYbgfz7XxKcigiqzodBNb4RlPBV9OyE9wyLShWL0P9t1Kv8IAq4es0M
         cHDv8tdxt38sO4jB/QZ/CHi/BizzM7HQGciX+PxUk2JDG3iXoO2G9yb0P/TqZFrg5MnI
         4Z2kflJd2SuwG42qL0dTSiCkWFFTYjZRCT+nq/E2CdR0KIypzqOUdRx8cvShAJJT4IQY
         FZ/10V9tM2ut4NyY6+fr3/N3m8gSXfdSZa6qDQDZSsOsL70ZfNr2ToYGmxMfPbiilLnv
         0Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872559; x=1789477359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=C42InDFUkZLwxgtN3PZuuV06rsJ0sPsMjtXC0XH0ZwyhOlBRIQOFP/yqPe8xMcTy2f
         wIXBhCAD5/BWNqLZJxJCuXfgKX1oInkdaw6FV+5JWDzi3vhMZ9OL7wlHftP/31yyLacA
         UDXjkX4Muot264VJ6m0ynKyHC5vTuL7q2JXHCxj6TZfmPSTDXbBy+xzgeV0wjYcr58R8
         lPUWu86I3koNLzIjORbNfnLs9nCBy7Yi/ul3GZLtqgoC2/VpCq3dWiatAk7sqPLzmIwK
         EErOIyZhz1+G5jhh08PHuC55u6hYG90SF7N+/yQVXz5Ybjkf6HsMbKDTqIovBrHS8wMl
         2ytQ==
X-Gm-Message-State: AFuF++lNXFaQm4barMFI3cZumm3+Bus4JeP8i1yVKCki3tP4rTiAxwTL
	I9cUo9MXh5RP8epNMCMSCxdDLJsn64/MaaYlQDtzVH6jryKCMEvynFrETRKfiNijKzTmNgRju/a
	YJjLYPOzNbzFjjGwvVFtzyNnNS79iptFDjaanrlfAiLCsEc0TJRGLVsDGUI3zyYMIi6//an2knk
	/i
X-Gm-Gg: AYBFou3L0VdsKhGpCoVJBLPXtolYBiHl4GK5QnJWKWc2WpQzWyAN5cO6Hi8S+mh1MYv
	8JI8IvbXj8GHP992KmNGXmPmEcCt1lPax0/8WDKPSE6pYzqVlUAhDDeHGe8dciIEVYR6iP3EcKX
	tJ0bC5kP07nYqcb1AD5wFLmJudOimDPdp0oryDaqthjzGmPS7J0VqF8sMAsncyvYkuMFRhlJWSc
	Awpfk7i/Q+jL1rdRM6YjcWzbe3FAV3ZqGyLOWDO/y7f/hkgZ2oVeztZRa/trkajKl+NIdvCTFrE
	wm78bmU/ORECm/XGATwdGZ/BPEteXg83Fl+vOoE1zzV6n2EFuzWFfrSjYATfekiKEZcnxWPbg/f
	sAsEwE1j45FN5vjV1phi4eg==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137950a34.0.1788872559131;
        Tue, 08 Sep 2026 06:02:39 -0700 (PDT)
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137846a34.0.1788872558370;
        Tue, 08 Sep 2026 06:02:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a88b7c04edsm726386a12.15.2026.09.08.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:02:37 -0700 (PDT)
Message-ID: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0nXKxOnvXHTbMeQ6PbCo7fnQHn-sCURR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEzOSBTYWx0ZWRfX+wWxaD4Slmw6
 8ZzKDTkffh53bpbG4Cy3rQO5YMxrGZt7WqPR/mwhm+xwo/EG2FcZ2+pFgT36tFIhJYiFz9bWMf1
 i4vX53zGL7skWOH+Whk3nBsDpwU0YZtJeNAqtkJiO4YIEioHscQdSP/4TnqV7pTAnwIP1nDb0ZB
 F90IkJCmcCloAaLftXt/qvnoAbyF2SHJbvt6n8WQpdSC7YVT+nKDxJnmg4/4X1vhmiSz7AJawbj
 lPVmyxs9i2UgZVYdfEHihPPr9OvhbudyEL92AsA/n7WjkMza+XlkcBGbMhCJALyHk+8amW75Crw
 AIKmw2QDAzXPlgWoy9AavqDlQYt8SBSj6lCeRl9gekLBiin0AVMK4cvYOyELvkvnVqMfPXD538N
 nv1ZowTaYHIY4LPpenqHrMc8p4Z94Q2PaWnLY+/hSVPpqXuz3IdBAbaNG1AN5q1ksuxg279f8Uu
 h6GlY9tCwEJrYzvESrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEzOSBTYWx0ZWRfX2VKGCyisLIyc
 jpCnz2XvQXUBKkq7cC25+6Szxe08/rKDzxnHXaUURNsNfYXKCZfy6IraDWrwX05z77UjJGpm2X7
 BW7jDs+n+s595Kz6IkoF+Vh+Uw4EKtU=
X-Proofpoint-ORIG-GUID: 0nXKxOnvXHTbMeQ6PbCo7fnQHn-sCURR
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa00770 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BlYFBzphh5xgekHqNzEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080139

On 9/8/26 9:58 AM, Karthik S wrote:
> Add pinctrl driver to support pin configuration for LPASS
> (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on QCS615.
> 
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
> 
> This pin controller has some similarities compared to Top level
> msm SoC Pin controller like 'each pin belongs to a single group'
> and so on. However this one is intended to control only audio
> pins in particular, which can not be configured/touched by the
> Top level SoC pin controller except setting them as gpios.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/pinctrl/qcom/Kconfig                  |  10 +
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 185 ++++++++++++++++++

This patch produces dozens of compile warnings and is not split properly per
subsystem.

Also, it looks like the data you provided here is a subset of
pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
copy-pasted between these SoCs? Are the extra functions present on 670 also
present on QCS615?

Konrad
