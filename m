Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D93F44D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287984; cv=none; b=IQqAXGm3h9cVRDo84CF+ncjFuto4E1SNy0dx16WP2bsc7NpxnYkOyfDEUsjFuv7Tx/6WqW3MqdVNvt9W1fvv8leEMgkUbJ1012we50ENWavIw12ntFOFYz+EH8Us5XpMFYtV7MbsVPNHJkAjX6XjLuMZMDvNzCg5XyktC6wamWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287984; c=relaxed/simple;
	bh=Ei7YCl18wuW6Pxk9gS2iZPPB1ZFP4W3PO+F2VT911Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzAga3oLGjeNtmygGtLJvqc3fGnj/MQP+cyPw0VlqDhnNXwYu0mavX3kfoBOgOEzh21ac2TDPfL/4DXldUkUVoqSty9Kw7TL7JUVigZCC8pIVOMU5+rAqyHQsWWpJRzgQ6+B9AD0Cr6IphnhcByQulsp9XuCM+7ejn8fB1vK4v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb/z5oEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKFeEb4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb/z5oEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKFeEb4b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASlTm2634663
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=; b=Gb/z5oEjXr5hxopF
	OrHiboeuW9As3N6xUsQM8LzDv4Ayc6+LDXKuLK2zpL2MyNCvQbCNKep3ZC0Rcmpw
	Dc4gUcVd7BM1UMFOD8KrKfLXH03GyJHCPKDxvpn+cRS/ycuQKbscr++/D2xQSoId
	yUD1ei7lfY5gIVhTii9q5zEILSuOoEbqfyNcvN6JbxfiDKXemdvrdSsa8kJHoNDL
	GU7tpf7DPPWFRiiBPpmzZ8LcjiIoU9kBIVmu6Y+o0KcLqcDZdshu2YqYssvmcYoR
	Qiy3jHHPvzQSng/s5GtvqZKGX1CKOQ/D5cWTOn7m4RDwkETdeQn6tKrOzC/1/rHt
	vCy/KQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6kg10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:33:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51caa0b48ccso14155321cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287980; x=1784892780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=;
        b=VKFeEb4bCY7SYPcDeRNd/reWnA6/HSiEKRN0oV+LFSSo2vq+5fpKpzstU5GcAW2Lq+
         /umVOkNNth73fi+DffgZoRUimnMjfXlRJEu92p74Cw5VkiGhyQOecFBujF7u9eYvCU92
         8BBytCJSAhEshu7YUhIblpoQLRJ1EUxFAY2s1uxSG8N4JRX5BWepk388Cwhs5TbkFtkF
         2hlfOphNT1DRz8V7B7TJu82uUv3VguWYXK+fOX5SqgiVmmx0IU2f2pnFXHZ1ott7DD6b
         7m6IeugCKB8xbBUgfYg9HYUxPHbn5pvIqJ8u5gyekAJyryiW+RnmmqZdd4xNx7ZmJfjJ
         to4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287980; x=1784892780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=;
        b=EEWEP2PtXyIVCyqUAtGofUlOHTmkG7yHKCpAdp73IOLDMInsw2Sw3ZMwF98c0ZIEcA
         She4iuVZDOAODzV34LiDwoV5zr5UewPm99o9BWVCpZ9ENG6bWgWbNrhCWasntJf6NI2C
         nN7QlHlP0V1XTrJjMU9PMRyUOcI0H4wObDRiE77kq5TwuR2EGyJI67HoYyDDTwWLpu0J
         Pfw6yjPlvMeT8WZK7wgtI+zJRZijk4ohK4kXLGeuYAvz4x41W4xm3K5lJmmLIkAA67bW
         hT+ZyNbjJh9a23bhvM4UhQfwKkmpasZgahSVL5CJQG8w/WOgRgv8teEIh2S1Z/lL4RNQ
         f7og==
X-Forwarded-Encrypted: i=1; AHgh+Rqr8SlCZaKD/JSJyPtg8MEWB+csYSQrBKSAqzbqeHyutW/yGQcDKF7ksuFXG9kcW/3M4Z+rfr/HFuYd382O@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4TFzGboVVoLks6e0d0axeAQUL0PVJuTk+U14G2nkf4yGgqEA
	6zt/Id+9AkpVRJ3pllYzVT5udByzqvRL/rZVexLXDzHez3I6wFxvYTPi9K9uzhgDoQZCZi/tiHE
	Cs2Li27jikY8wUPTpkKICIVjn7iABzH3j4okf3t2yqr8NMwvsqHipnDcKc7rJtioqWO5o
X-Gm-Gg: AfdE7clXWrCUPA0A2J4S4LM4txuscLwciAZmBvRKoGetS6xq51p3n0hZQrsLeKZfxWP
	EYEB9u/mJlV38vdUUuQucg20394PaOfgSGgv8aWoBwEl+kx1tkUK9fRm9BGldSm1Wg6AOutpKYz
	pZH0eEr8F2kQjJLCx9hwt6tp35c5fAo78gId7sUhNg1OXTj2tsXOhJoKZFx/Q0Bm+5/txOwG0V7
	luJktK8YAjG+6yJHn5AXQ4+S1LgudcJDgmZQ/q3c/owYG3c2lRltuCZdKwVNZPg7KbeKfuG1Y+o
	1S5zy6PWk4avcC27aDw2fz3rG+maFFvHg8pgEB84xF5hqGHaOFU1UYgNLE84hf9T1HU6JbvNa8K
	sN0pBdVyM+ze2SqZB7RP81D6c
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr11225961cf.5.1784287980401;
        Fri, 17 Jul 2026 04:33:00 -0700 (PDT)
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr11225711cf.5.1784287979821;
        Fri, 17 Jul 2026 04:32:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afeb98sm61675766b.22.2026.07.17.04.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:32:59 -0700 (PDT)
Message-ID: <b67a425f-1fc2-44fc-bb70-2a7efa7b68e8@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:32:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714125806.310708-1-oleksiionchul@gmail.com>
 <20260714125806.310708-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714125806.310708-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNyBTYWx0ZWRfXzMkH9Qf40d2t
 UezOvr1QS4nxWY6KqhbgZMC+jF82EroUEIPljK1d5dfFmc77BEXSyYXsbYtwsk5aOOv0LPZn24j
 VOljsyB3kqaL08GsxVmzBgZbg+dg+XNTTykTwrVXnYmRREUB7GLTOSJ6p8b3FKH+HGMtMPg+3VZ
 7tzPtQFUBq8UcZ3bF7UuQUA30H83LpGFRM5YfTtXS23jLx65HYukdqozZquqwsmxN9rGDkCTVfH
 3XUIXQ5p2RNWgPEMLgpM5bbKbgMV+OrlZ+EFIVNTG2gvip9fk+F/7gy8mnTiAONviZhE1RohTzY
 YUXHtur9AbO3M3cnE5e2mRD+FNQZUecxjh6SyRFueMoR7TrUD3/Hw1KlP/A9pwH6kepwf2kHYPa
 LKxAqYbpFeY6y0IBhAFIE114K3Ld+vgcVLCekWnq2SPEK0WoLThLMgQdxuVlNLcbFFiprnSeCpQ
 3sZbR4kaIm2XCD9a2Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNyBTYWx0ZWRfX4gGdusC6iPeR
 lLTlHSbzk/tpAkT6tHrV3XNpBOKNuLp/Ne47RcLZRX8am8878PRFedc1XFDXuJYdJUt4iu+jGu/
 0ASjh/tE5crY9LEkXkmkZGSrQ2256f0=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a12ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uZAEgtoqDJZVUE3vR7EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: V26L0CkBkchsHQrISJkJw7luKubUmuLM
X-Proofpoint-ORIG-GUID: V26L0CkBkchsHQrISJkJw7luKubUmuLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170117

On 7/14/26 2:58 PM, Oleksii Onchul wrote:
> Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.
> 
> The supported hardware includes regulators, UFS, USB, GPU, remote
> processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal sensors
> and the hardware buttons.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

[...]

> +&i2c1 {
> +	clock-frequency = <100000>;
> +	status = "okay";

nit: let's keep a \n before 'status', file-wide

[...]


> +&spi13 {
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "goodix,gt9897";
> +		reg = <0>;
> +		spi-max-frequency = <6000000>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <81 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 81 IRQ..

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


