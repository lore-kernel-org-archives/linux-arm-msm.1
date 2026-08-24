Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58C3EB81D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562153; cv=none; b=auWwWmmtjJ8wdYL+h7JHCsja9VG8l9Sy6+HI5kBGLY2sWDgQYu1FXjNylQKiMpd1ZyCHOuD+T3UzcEhEgff9QGX0cJVEq9EDSw93D00BkB1iX2yeCHe47OlC/01eGS1ZqvCiYQJIf4DJ0qlG8juh8Zmyt2T91IKHNq/ZsiCjGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562153; c=relaxed/simple;
	bh=zkcfOpvOOEGZmwcMkmOXgL76Nm/r+udiGKSvmwxFSf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP0XGnqJ9s28VkVglu1TkEbJPtbQUT+4M6IUXgN6bl/7uGbEYsA+BfOSPkDtX4vJMuz9Yt9kTMBQ2yJQeEe4gvN6zXMSOWk32wvqmF6mEDC5g7B/Q5hctl/ZkzCMIkH4klUlA482ew9rP/w904XMpNTAN4GwhY4CR+R8UcuUkEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqwoLX+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QselUN1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqwoLX+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QselUN1J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R4QI2057955
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=; b=dqwoLX+C7QT6RQov
	mKpBteKiQe0EkzvFVHoeQnevASa/EmEvyRoOBRNqOj3Fv2jDEh1uJAo9EQ1T4ZsP
	L3amMgPRsnizTaEFhQZDavC2EB1aSxYZuxRdJd97Z0skdLY72Kye0K/IhnCTYTrb
	WpZj805O1jsJ95/fMGcqlMcjCPywIxBEceHEltTKCPIOas286kUrq8KodtQpYw73
	ztOw87E3qI/6zlfmvYfyJ2L+7U6j0oeq2B8INivmM3nyE169hw5i1nO1QeZTvB8U
	24+8bCADETR070qYkyG1047KL/Vx9rjdATRkMauWbMLU2ZZTfmqv2NTFWnJHh4u4
	EI5rpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1k6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso29907185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562150; x=1788166950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=QselUN1JbrVBVEN/ZmcHeStbU/uQWWQD6vQN2P8aVjqRchCcWlLQQ41FmFF/e1UsrM
         hmMlLynznt/CeW1ImU2B+3Py4raH2d9JuqeF/S7jDJV5+EqvBEravrj/bnM5ni/YBjsI
         jHlY3DjKFM2d3wpeP1Fm8UCdAbK3C89r7BRmpiMYitkUtajOebfPSlkb3068BoS/wJhX
         bNh+jx6XxIybNikWQtkd7yxvRsRfG43eTpAwBraScmbTmOLh1eZcMzKPv761njd12fwG
         BrM1FoDIKC5BXCYjYbgfwQfONlsSYJ3DD5bfpmwslixafGBCclb+p3WEr3XWGOTlrs9l
         p9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562150; x=1788166950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=ketC3QJ3vwnN6Oarxo6wcA/fxz7IoT20BTvQla42Cxt4cd+V1yd5WanhRkQsGXoUVE
         G2H6Vwfu/nvlPOMKPKMS4IHcZhbvCraO2pSNkfI20T9ArZy8aTSqZfhmlalz/p5b+NaU
         sGhFb/kw7An+KI0Bmm7VqD5F/AlAsXLmlMPC6soReS+V8QewiM/9wWwokXP0mL5JzXJQ
         DgOYTvxzrR1UsXpVeYn2In7XhP3J5vt/UMrUQwbYFF5zwhe/CxWeUesuNd/V1sC0qliO
         B7oZgC6JsXKoEOt2Q6iLaKS0T3nlH6MGU4ar+ooAZy+TER97mkJshqYznZzbaqSrdlWe
         I18Q==
X-Gm-Message-State: AFuF++mFnW+pSTv70ejRB/9livRaKSdJr4LG9YBrizSfQJ5pHm/BjAS6
	4qbJJ1aJYtFDGqvvSdjboH2ykziwcGJpjPS1nOnsv0eJ9nuTx3JUDFg8zEzE3jyYLEjNIeWv3hb
	tA6LDvBBBAsrAfkFrMrs18nDDC8wViDrnq1Qsna0eumx0Kzw3STks04f03D+ENVjG2D3R
X-Gm-Gg: AR+sD12YotxKNTRLPBO9aPyB2HmF8ZJ+XL21Wp65DNtx0AtW7i5X2H/9TSJgQNrKc1Z
	OZAZwWQY8SS58UyXc9hulVuM/4tFhMxo7e3tdJczSiW3+gxtLy5Jo3PYBBJR42iZfKcpUNVaaWQ
	d80VCgrBhR4SWY4godW/k64TG8AWB8SZGIGGMUmClThMb4r4Q2n1oEXlFoWeM0xfHx424taTQ/i
	51aLEB7USIeuKBMh0DNji5PnNJh4Z/Ch8sP5FslmWL61GZ9G8/u4yt7PFS2cxisaA7gYU1jV8qO
	AQY3EVWDRkXBbEt0G7J3bk14lBPoDIIXrJhXMlp564B3VUgcV/dOeqrJrJ9r70z7xfVHX+1Q1Fx
	47qrVXep28Z9IlGrqh4dWAsrq
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597746d6.5.1787562149831;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597326d6.5.1787562149363;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1191775466b.42.2026.08.24.02.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:02:28 -0700 (PDT)
Message-ID: <2e9f6fe9-31ab-4107-a623-b15470fe68de@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX9lnWjmC897m8
 ds2wY7NvO4+4zINnz/p+4DgLMEh68x/gEXV82OIcRtHj/oCkZZEFvYox6ozDLZYd/yCJI/BRlGu
 HkyNiLEv4W0zyJ+lVghElyuWCh8QnRoYuNjEeCLj81y9Fik8Ym8H2cyZSDq9Yaw3ITSauHoNGDl
 mRytj4R+MBB8SpxARpoHbUXo0gdCyeGmGliOmWe50kY7vzt5sJa0tBxw1UcDAbqttVfUh9jHEpe
 W2iWjvSGSnWjFPYHI/AxBaXrUSxP+JN4xs3h9moqGGdnaN/YqUJo0GF7bvK5v1c123v5x8FLBzS
 g1ZSvxEXmYQL76LmO4nLPkZngd3McZVhOSCP3mK6re6mJqSs9TSLqlDvEkGArmrmeIg5UGsL7qh
 yxfihWSZ35RM6deQ/cXIngaEJYGifrzd8cz7twhU9xu7gb5qjEfmhjAq4niXYDMw5aXnQtKKRFK
 Xrg/ujMmmUOu95WLQGg==
X-Proofpoint-GUID: Me3P0AgZGSsqQUxFuEOdp-KU3j_9MNH5
X-Proofpoint-ORIG-GUID: Me3P0AgZGSsqQUxFuEOdp-KU3j_9MNH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX+5Q1k9UbJAso
 upp5ufQfgMHKKMkMy/O90mOglAg544D6Vqfq/JGgNgsFhBkNSjiYoLhOvFXTDuUNGpeCGPj1+uP
 tv+xRLG529g6K0BIU29cGr1qESqnfxY=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c08a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Is the GCC_USB0_PIPE_CLK not necessary too?

Konrad
