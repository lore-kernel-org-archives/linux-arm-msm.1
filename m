Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D345111AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902786; cv=none; b=SpfVTajTcukncr2fLuxHzYFLACbQc5/6mVIMBAG3WHntB/Jpe4SeMwUvB1eWJgnSbB3H+r8HaAnIS00LgNnUwHUq7dr/LMNO/9p5IQR95lNfwcR7UPoM4IHRS8FZ/SLkgneaY7QxC6qrcHG+UJbE6ytslVqCllRKci40ClxXoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902786; c=relaxed/simple;
	bh=q9N+O+88tyPzx0HRrTCSp2h4PeX7IevwHQzru/qQoM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDPoj/mBBZDjwtYydkqk57brYlcmiKPJMUoMjkYnz9bDKLQPfQGwmAGc8JcTdUgo2+lkA5y3H6RqhYdnxJvNsiCuLXWDa+mN+qeDvIs4RCSPyYziXAJZxWEZdDdbNSSIfT6Lun8eDbtazQ+FWEdsC238NObaF1INruv4J71uMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Js7bFU+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx/9hhr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Js7bFU+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx/9hhr5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE42ld615635
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=; b=Js7bFU+RZegDoAVJ
	T6c2hrTrNegfE/C/jteLF+c/5e1weSsho/PCH7vR6qagTud5bxIqdsI6ZstQR3Vt
	2XVYVajmTatzFdIc+SiNqMcv9GW8jMWcTZ5YIqmDFRhz8CtbObEYs8AzaCr6itD9
	m8dCBdUYMPZZE2l0OUYWQl5TdyTZ2IObgwXxqYFwoNEvR/E/BP50TlSV6QO2mCNj
	cwWWXIoWEDD5NrohbWir8iedjuIG2jR8cgSQi2MEm5c02vI3QQ2WEUutPkAA8tp+
	iKycCv4i7tomXa7A5PBqE9hpjVReZD9GsGj5I8xFOIeNJnivU1H+ZD6u7yjdx+d0
	yBX18Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7jampy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e705718bebso75362e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902784; x=1792507584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=;
        b=Yx/9hhr5LbCCKL9jyrK4uxG3r8VnOtLnvMwqQFGfIzFLT+aabBERC29Byfsqf70bE2
         WzJ0u9ymVNM2NnfCIwOBQKd7oFdNUaQWzHrBsOwOEcIcOwMfMzrfd/JCNN+v5PB34MMj
         Bk+5juG9G1bfMbu+rJsDTFxz6Uvtbbrz4uh2R/oMY3Vo2nHBWdvlv9ZFSwdaj+ZS5N2e
         Qxl+Vc2aT+OnfTC9qNrUTR4m5cEUIN4EnanRPQa6qroLJFcpPoXrHvNs0oXRu0I9L6bJ
         3hWN+1iJYvTYhfkz/CPYEvjuHGcm2l9/j4Z9ZJVkC4KKlEj71mepL5zO7dq6R5izA0iH
         2+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902784; x=1792507584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=;
        b=qeQ0VwOQfzA4lD4PW9EUz4OYXOSO8GbjaPrFL/+UiVQSJBwv26j2RCvPc/I9OF2l1D
         7pfVUw1JVdRdkoIIiGHgjxcZET08MYgUARt9MfMntg7X5dEOeW+v1BaHUFPzA9VGkYBK
         5R/ltzcSfZGmBxsuXEytkX6cEuP45n1lC/TK5OqtNygYYC0W/dUn7kdsK1032+fdghlI
         rgDJgehyDHIcSwQEPEMsEsJTXN8NzkYQPW81SiP4S9tGtt+L/j2RZJ+loqfhHQbX6MAz
         GOkJSp/zD2iVZSVj5Bc0iT7Fap7wA+21OX4/Z4jKQkj1NNx7caJp6n6kBNg0gu63YE9/
         nBxw==
X-Gm-Message-State: AFq9FYLESPQEVF5AvCOlRcgPeNb6aGXBJqN9T4fFA2yIrHNMwoARjTpk
	yRJ7bFqwjjYkkWzsJ2ie5cLXHf4LaxZQDGYMImf+9raFmR31sT+apRMNWab7PzaJv9PDLkHbmtw
	7++9JO+CXJdMtPsmJ0xf2FDQpzsOZ6YwjbdQ9AcV19+2v5l3LrBMEY7Nr2eS1ESZTDBQ6
X-Gm-Gg: AYBFou3AY2y4dH3iOdsCLsqmYaOYVRTFqwf4vJdb7GatFdBrZAZE5hHJm68uqLSaOq4
	QjuSB9JzbOSqXBOKEadFHie4mx5rStfEtBBgdpcG41+hDfpSfzBDBJ56TTc36Ti5s5b2MwMOkQ+
	mK/QCfXdO2Hb4mvV03aGkCQzVZCTurjoGlX27S7MeQ7HdDiMynV+00Oh3NxpVeG6dJXQzd0IYo9
	Y9T31OHCIsz6JwUSxGC8z8yHk0tmRw2QKrqIxqisl1bdGneGyO5gOxKuwmzv3vwZQ6reEM760Sb
	YOuQJpIcB0DpQdUunzQaNHA+HQUQPQz1PP6Ge25K81f4XUJImGhqunQM6pvJUhPbcS+2KG0BJ0x
	vhU5dWLTc0ows9kdZfd05Pw==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr2411596e0c.3.1791902783959;
        Tue, 13 Oct 2026 07:46:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr2411542e0c.3.1791902783249;
        Tue, 13 Oct 2026 07:46:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0751sm243681166b.35.2026.10.13.07.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:46:22 -0700 (PDT)
Message-ID: <9757467a-f0de-4cc4-98e8-17a98710de24@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:46:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TddeE0Q7zhYC2_NMTi32a4XHFJXiMQn0
X-Proofpoint-ORIG-GUID: TddeE0Q7zhYC2_NMTi32a4XHFJXiMQn0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX7CAty8KuG/N2
 8cINGbgeh2F4hI2A/N+vtaMyagrR+yZz4eLeSGK6Yojrck7xF3ngVi2xyxMyLXFyUZiG1ZTf3Ru
 47zA/TjI9qB9GX7wNUa7rDTsfQed2ss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX8rJ6s76LlocR
 6A/5o/xO1GdxafUjPwi8hFAz31EJ0Pzb06X57LbET7Em80Z7nj1un01nokcMB1qsvZ2e9zgFn12
 c3H72g27JTyL7q4JHH5wePnCFLlRd4MBQhu3/A3se677Hd0In1VUtmXwhMmJBDUb6m1SX8gOCZ1
 1fY1eOtVE6iVLP3Ws1KKxu/pv3nAF7Llb6HqOQN/bUaw1/eROyMDCJG8ePJF6T1qLHM4rLf4sO0
 S1pJlxQds7VKOFy7VwBllh85a0C8JD1PhMnzVI/HA8NmgOjqCb24W+FiURmouRElVn1bLsSfrcd
 20kn+j7uFpq6Cuy0pY8xacu6ApQUJHA1TlKpXGGrWaiX5F898DuW6B+2YEQNnCWh9YP98OKoHmv
 WzZ7OFPrW6Da4o/Nb/7sM09MXVTnvg9ofEqRt4+7bENgQsDSLgdjRXu/2Ohd8dIm2mx0tU1+Q6i
 Sia2d7aluRwukMHR4Dw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace4440 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=B0GkLguZ5Z_bKavFfNcA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Describe and enable the PWM block on IPQ5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 910196a23ca7..22ab99ca0903 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
>  			reg = <0x0 0x01937000 0x0 0x2b000>;
>  		};
>  
> +		pwm: pwm@1941010 {
> +			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
> +			reg = <0x0 0x01941010 0x0 0x20>;
> +			clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates = <100000000>;
> +			#pwm-cells = <3>;
> +			status = "disabled";

Can we just keep it enabled?

Konrad
