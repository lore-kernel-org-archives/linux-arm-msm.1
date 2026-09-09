Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7A5505F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956589; cv=none; b=bX/6VK5g1mKh7VOxzGJ57xtGUCk7LGWJiBA10+H7kTn4nPIpkOyF3dcwAi5Dk+YiaVHPoDDJaIoYfye2tzxqfz8HtE7EmazJAewY1XorHXrJz+bIkZgtr4IxsAs83I72J4O0I5Gl2m7tDqCPGPrWAseazApMfte0z9eOxXr2lXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956589; c=relaxed/simple;
	bh=I/m51bYBFJMIfVpaVeMrWiBZ03B95wWcbnMIQftSxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psr7MUL5s3NdR2n8kxsWvT0qdQ3glZyYvfpW/4cem0DH3WSurAhse+pbtNFFM1aov4W9mhW4gkwBo6jbpnNnupwNjKyPujoE3vc0bBtEzHTs4Pgdr3kEGwDfa3N/BByAH3yA9enNAIUFZzuStSrUTlDbDmLmTMT4lf4sWFf8BM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPW3IlBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1gK5BTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPW3IlBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1gK5BTs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4hu1183711
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=; b=hPW3IlBfKZFmKUS+
	ffM2FgnGgsgP3nq1EAFrAT1ViXYE88EcTRI608VdcLRzmHRpz5w/UjvJaZZoMWpq
	+SvQ0UBf1DCi46g9SXCWJkvuMO3zjJj3D4O0z2Ep+eGcOiPpY07EMgS0fYiXIQQl
	e6NqtxN7r6t6t6rkseRLed04oNv3hvK7Jn7zXQC6XkKfH1jjTnO8dfXGo4sfQRDG
	9HNRcztDEse3o1duqBAYwDH6KeIbOjLBuDa0nX7f4rDW6Jr+bgFx5UeUKFuDf68V
	/+tKbfITucs6YG3cLE6ZC5dM9I7PIWPYCGRbJtXXqSXQHmjKbL5thLbG2oGV3/fd
	qNjtxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rj79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:23:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93495488976so73361485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956586; x=1789561386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=I1gK5BTs6pDXLBxIVnWkZbMPA+fJbfAm+yV2JDbfLZEUAJ1CRPaFVbZtNcybgDT4Jw
         65QapdLgtOCYa23kMTg8qb9UYiGNViE0n1L80QPqrOxWLhKnYkRqbJ17ANExLbhwPK4j
         E9fckUoGjFeDscFirU23g75uAiXg7Q0tzmnm9No/iCMXhNIwrHud/iuVtKCblyNf9e9t
         C3DHcqIqpUazWh0xRmSBQ4dO0RbaqXTznSyeF03uLJHOLekmSH28mg2KriBgfVZgJ7ga
         1kk9t8JUnK4QEyFv9gJMGfpBBKOdSGnICvltt4Jqq7Mp0zfO4Q/wa5Suk6H4/UhN+fjE
         z70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956586; x=1789561386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=dJfOWNJbDjpTETe7BnyCmM5fB2os/f4e8tHwyLkitVEk3mZZjrKP2QtS0cGWTefUZ6
         424M9dLBdZVtfUd4/u1OZ8c8kr4OFM4EOndbuJj14g4/08R6os8DcKO2xDfTk//AHbHY
         Gq29rKZjsQO2XJpVxRbIyGNKnnu+JItSF5SGjSVhcaGHa+VgVLdH4i0oyjVLhA7Y/TCZ
         9Y1uBlkquKAiAfAi4UwnEltYL1ugAuAOG/UNO730b+6Z1/S/c2WUQL/S9p+mkfZlrIn8
         w7BVkEhAGQEkpswi/xNphFceBf5AU5F8REPEWopV0JhcKfsBeGQyRL7bbIjG4tdDglLu
         0aAA==
X-Forwarded-Encrypted: i=1; AKwUvBx0HismgNeAmLq8J4DbX65CuVGOAi2OZHmhOj7vfubFGm+H3wCCyKLCwgb1pMScGdluXGIYNSiYpo/TgfCs@vger.kernel.org
X-Gm-Message-State: AFuF++koqGmY0mkJQ8TuniqF26x+CtSlHmxNoIVN2wz3SSLQShoWh1Xt
	Tkb/uNSXzWQMvIeQcK87g08Mc0bXtuQHhwcWXLMFxXdDD5+xJk5OVC8I9yw70s3xPIrD5e8oazz
	Pv5rxd07Qs9pXhDCubXNxWpZ2EDffePGbY3+JhkZamf1nyaSft1O6+OJ183KXLRnuU3h9
X-Gm-Gg: AYBFou0QmXSYWVC4fiMsr2QeBvcPpc8kw4idTts84OXoVVJozGbd9kyHji7JPwD5d14
	Xc9bZII4CnAKpG222op9lMHFb2wZDWIRXMcRVZnzjnfV+kBTpnI4/8kCuF9iOafs/wrOXFLfl5n
	dio6CA6XOAJopMAmPwZF9BPMbeKpFNdhzlITs5EWRN3uMII4t5iwFuYRsKZn6mzzaKfKzEBLAAx
	IWGbWa3WpLYtlvfUZKOsdmiuTp8jWCtEtrRdnp+EEMSOI7URZUSNxrsNSkXsJuDOLSjnViYq/1m
	k00UIQd2Qy4y8+bWmH7rsf8pTb+8837fupaCgEhRtC3mrSr8H7mYuyO735si+Clw8kBMVA2piTn
	XtB43mopxl4BFcSlmh40SEQ==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176465885a.0.1788956585513;
        Wed, 09 Sep 2026 05:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176461385a.0.1788956584896;
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm759612866b.36.2026.09.09.05.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Message-ID: <179b5e05-b08e-4023-a184-bcd573213be9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa14faa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_OBMBAdlUt7QoIKPFOgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4nZAo-AlXqgzaBLUXdiQ-jyn-AdwjdMC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX3TZS47srUOcG
 HQjp73Ay4qqcJ1IqkZw5fEEfW5sKacg7eMa7wg4vPf9WTMcKPZEX+ii23y96O4naAwfOxC8Fh+k
 sOwdNxKtKNmoNbFs/pQFrkGI91N/DJA=
X-Proofpoint-GUID: 4nZAo-AlXqgzaBLUXdiQ-jyn-AdwjdMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX1iRQQMxK1G0E
 wS4ZMwBUU5FoZYWxXbJFcGaJ6nXlEIH81adl5uhkcJ4xuTSOYi1ru0gHB0phO3R0er0saLhcn06
 aZiPak5m0FNOxmxsZ5Wll0uY7oerUDWfprAeudSfkh5HHF/j49k1ZXcg1VuK9lVusN8s4xKo012
 qeMQxU76/WW0mCDgs6g+Bg7kAaPCkkE/x9miqMsyTlFPf006Nmijfy919f5RJHVd1Gu3t2KU2si
 vXUVY8kap7AL9T54sedRE/uWonjBh4Pl/YbWkvIoUNMqIAZJpirybwHFah1tR+Osl4z5KL2vk/a
 RjU34IFXGZdwrnzzfhAf/CoiGJ8bBISl2vZFdFMTMCqc1+lxMcxsZStPf7UIiyt2BOEbxE5dqiR
 sTO3Bg1FH83moaqcDQtFJH7oNDWXdk9U3G65ZGEbpfnm0iZkamReDHUGljY1PfxMUrehKgfqF/F
 HX/6W4rKt0dHeU9q6Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
> 
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
> 
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing pmm8654au ompatibles while the file is named after the part
> actually populated on the board. It provides PON with a power key,
> a RTC, and a GPIO controller. The resin is described but left disabled,
> for boards that wire it up to enable.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
