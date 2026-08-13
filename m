Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6337F8BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640252; cv=none; b=b9WsGvEwyGXJnWjtjJjbjHboLQ5xwj1MKgbyZQhdNLnq/mNf32WFccs8ErZc3pQctdcq6wgFwWfGlh2NCf+O9mn3e1pwspzjbm4JKwiTLM9jRIjiej01jyCYEyBxqH5LWuYsz7pmduN+Rc2i+58g5X7sUeOpviMcjhGK5aEz10I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640252; c=relaxed/simple;
	bh=EmZ/SXlYIoH6oNWoGBBMTimPLa7HdbufD2s4lqhmn40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY1FIW185megPfR1I1fQdzjyD7dA16QmP62Z3q/G42TL01d2xVMJ89x/lOtoHzLS0oexN9X9NpFJGkIDXpr9P6hZItr9y9YIk5BZpVufxeG/zKts/my2LzZhNqNvU+0zWk63V9x30AI1Wvt/Ki8Hi8xniP9wj6jHItH9XbRO6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkOKxoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jno51E7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkOKxoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jno51E7L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTrc93050668
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=; b=PkOKxoDj33bdC1P3
	oz8NpOzn0Lp1h1EdjMAjYPkLjvV9J8h5B0/ydH0Xrw8mg2kXZBQ+vt4FwRpLSKKN
	ujh1Zw9ZNYMlTrA6CAQpQc+GfZvxKKvn5deaktJ6h1si/hqx0j/XkNRJgSvutuAf
	2tcAebQbWHlARVvNyPdyHGjZfzxSJ5hBk1rat+oKiQ03Yae379QpnEKn7iLvhl63
	uOA10hcsjzjU4ZKabT16dozbRL2yhbibJhNA7HdUKS+RWnxRIcxo/favVHZ55PGE
	a/G6p50MV6afL9Tsdro7D6cOX237ga1lwSMhs2xkg8m32fMkvgL7vRqG68H0BNAX
	rVRGAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3rtjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:57:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso44855a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640248; x=1787245048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=jno51E7LoajUtwfwYI6YX6DIdSreuEYPMw+VxFvnoyCIOlPkZEfJBLGN7lS6TLaI3K
         NcChBWEqHx0EOTgAuBJNtaaCTLDCM2jJh0e8IhH7spPp8gyQ1rsZ7bW2t63wF9LXp/aV
         T1LrLKPsY8Nu1FujID/ZzdIG9JyXbX5zIoYX/oynMIksM6w83gpB7kZSIBKc0jZ5huSk
         Hl0zexl0ts6D8bn3XusURb8SvITjxbPyvccZYCkm5nX23sOWGSVXkloFV/KcnFHi+fsO
         t+77TRWSZAm5xsMiIvKpXJfB9l4lF0gKMBUrMolugTdpfYEqp1UZCXCrQq1qa6lJ8q8E
         9T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640248; x=1787245048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=IPIvBi+hhMCYmNk2SwOjED0sPWP83M/hV5LJvrdY2Wdn37GNwNzt2jGO9/TANJG6pt
         WdDfnDBZy0hzz15qYNJKP1Z7Eu0p7sA9LnhiSMEwZ8oIyGlFfaax44aM5xsm8ojF5M9U
         OM5SRlGLSIt3jyald2/1VuIP3IsPd1Kt47DXzJVdcyRmLyEpR3wnkw9Cs7bhwGOqiJ4I
         9eZvkGzn5dFs4crdxDcxrHPLlinfvXsbeagppvUrLPIyrJDj+BIMjRPl5YK2UAyoWhfR
         Ufm7yeieWsFTZZLeHpxXlrAxzl/BC6Gcu3hL2a1dvlW3cq8/0FghQK2ndOw7hAb+24hR
         P9cg==
X-Forwarded-Encrypted: i=1; AHgh+RoibZC8SSD3ih51Pk6QvaBaUOpkV6TSJtU/i2mKx2bzREJrTUNlDsV+9zYB0oTZhzBqXQZ38r7nyDCwwmgP@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSDjYP/C1xL7J9M9KIe3PyZ5vj1y4nqlTOpxGLF08ZOHTmS+U
	UWuymrOqQLVJo6Qn7q+g4r/6gdrHE6bB6W5cT6xmhyYoQkvPwZdOp/3HLTEnvD4vyxOvlYC3zBP
	lzYrVOhjW1CQISeScJBZHbe9WRPw5p1Q+1BNpW3CbI9ivRQ9TTBH1eLVwC4SKoIv3KmQp
X-Gm-Gg: AR+sD107HU4W4g05E4iw2byAU4xUto0mzm62fmNMd79wqWO1qffQhgSoK7gy7GsHyjX
	03bxO9zHSFl7XYi8SCvtSmuXgiRCEheMImWm/7sXFPcbqk48EYPT2/R5JSIzzh7A7Y42FpDTL37
	mFH1LFQvCfr02KxGZBSAwV1gMHXOli/M9k5A0FCglPyBQJ0gOXXWNex8oiFIRYngNxwXP2cKY9c
	WpDOHxH0Aa2+l6Mr0MQAAJDAWVe5Xv9SeDtxqvdaIfDHXlcTizZb3FPcNdtj/NKVHqdrDB6SDXr
	QSDjTn/Tg250UVTTXNzsR5diTvFT7lNrRwGoeesdoJnKjexrTTUXp107ZScJ+TD/P4rGigKUk6h
	Ctt148Y7/SUlyJXLt2J8wQZIYf179SiY=
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772376a91.12.1786640248349;
        Thu, 13 Aug 2026 09:57:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772329a91.12.1786640247833;
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.19.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm4121774a91.7.2026.08.13.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Message-ID: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 22:27:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7df779 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=o18eRHaKI7CUylSTromjKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=TlKW4IKFNLZu7OIdjWUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfX+gw70RByZAd4
 /vlPlqdfcx+tFa/N705IN6ZKl46t8TGlrMQ7FAw3uMRm0Ta7OItQKg60eavXxAS//jZpdi0S8X+
 4iLfTm8HW8392mYqfRzkVj/UbNC2QQlb+c2OcP1zmJtlOdZAFV+eC0Dq+3XGZPBfHHS+wcuXB7D
 VYwNmvLxkzEXFp72SfKYm/dSinuqaPGz5unIYEewRT0Wcp4hpzeP7HN93cjCyAyP+E+T52SWP+0
 Zt+U9HmdLV8gIhhG0fOOJ1WMr4SrNV83Lay0ng/22jawuVXVx6DpWncR3BZFgCKWYvOzGAcsJX7
 PaqojyTcVmM6ez3JmR07DCKG/ri1/Ss5jF/F7slPhZP3+mNdWgvmGElSv3mhJExwN92rPxQs5bg
 k2vGMuNpJy3xmnwoGJpoZ8KxPCOXMltrAPVMZHBmK54+uGbxe/sFf7BXC1+Yf7axfXNIgvfbKAv
 VnWOsfQUcmFC6QlEahA==
X-Proofpoint-ORIG-GUID: poTaNwpXTuIshQePkxN6IqeQGPYcHi9K
X-Proofpoint-GUID: poTaNwpXTuIshQePkxN6IqeQGPYcHi9K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfXzKLgcxlNz3Fh
 jXoKhIMUfSVqPMwKUmrVzsEdhXHF/t2FxCIrwaKEqB0k8x//XEewHNJEX2Bv6b80Xzx66IHsO87
 vARlNh9xCNJaexCG8JwTKzF1TppDANs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130122


On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
>>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>>>
>>>> Peripherals included in this initial set:
>>>>    - Single Cortex-A7 CPU with PSCI idle states
>>>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>>>    - GCC (Global Clock Controller)
>>>>    - TLMM pin controller (110 GPIOs)
>>>>    - Interconnect (aggre-noc, cnoc-main)
>>>>    - GENI UART console (QUP SE3)
>>>>    - SMEM, hardware spinlocks (TCSR mutex)
>>> This is pretty limited without any storage. Does it NAND?
>> It has serial connection. this is enough for a start. At least one
>> communication interface is needed for early upstreaming.
> Yes, but then, as I wrote, it is pretty useless without the backing
> storage. Also, it would be nice if we new the future plan. Is it going
> to stop at this point? Is it going to be expanded in the next few weeks?
> Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

Hi Dmitry

Thanks for review.

Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
kuno:`, not `arm64:`.

This series is the minimum-viable base (console + core infra),
following the sdx55/sdx75 pattern. Storage and the other drivers will
follow in coordinated series on top of this base.

Best wishes,
Hardeep Sharma
