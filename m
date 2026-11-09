Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222497;
	b=iB2LlzoidB8jZUC0b9D2+41DpQ3P+scDtXLZaKFkJ1MG0zM3rtEEro8jOxIyfIe0XHno
	 /JGpUi9UAuGvReU0EywtIdHstascPiOBPlZXgqQFBdY3pIJcOu53F0TK1yb3adNl3nzFn
	 FVmJYvCHffNI1e43qrVXivpwIe4EArZrs/2EssUjzhQRsP3VJ2PvivhPv+ojEHib3oSJm
	 pV7FuGo6Qv6kIHkyicpM3KtlZKFpDrnSX3P2VmJifdRFc+TpacfYkKq5nMzSAw44cgnQr
	 ZLX4sJBhQrA8THg1yqBcihGSgpNunJ7VOgd6mb5j3xh9cv1ReXv2rk3t0/bRqeupDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
	b=GAZra2OJI39ARol4R1UIA0Tsx15yflSxJBikllnDifKIq8OZ/4Vnq8OKV5rkttcDYquL
	 EnzmP8J+C1gVsjbUUFhIN4OWf6WzEkHKs2BgI1+5gHj0p7wWrJQa1UZRBifia3Ti6cKde
	 dfU023VCZ8ArJy7OeNKRsy3zswY5GrtlHYTcBQ3zAFfuTtT2dklEiPNTN/8detMt/JHmk
	 9CWhXc+pxGsfoCQzrgiLDfa7g3yFdR7U7ZNOOoyR/yWw03Ar4Ev/8zuO03VKY3ULqrICg
	 kHJGC0IdTxY+OLtBVb/plWnd2CrJHPbR3KgZk4yXygRPQfZUW23NLJea+wIj1LH+gcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/q6LzJQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D4606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/q6LzJQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vEc04107934
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=; b=LHo7EinQJg9ARF4n
	xexAhH0K5D+x4kWAJSUylb7Smu9iPfa1I7dmdhZ+0cPSsH+wPyUt4j2t7la1iHH4
	VddscktFCR5IrT93cKxXOOku1kni4IN3y7NU7yRAoWTfouT5r8XYbcRprBD8uI62
	vnwFDLlxYvkMOSVgH8fWk3knoIAtryLKT2MaA5NMvMGNXG7I2Ui0nIlU4n+Fml7T
	qg3Fuy7zLNHDbYLnV03csDxAYDixGN1eCLXj1BvyBlzI+DFLxTbMJau4XcVtbL6a
	Mc19gRvhksR6JkjeI7i5el+MilEp4ZT9vcJNZ7ItjQX766j7C4HWF6IfNmdtM2fO
	RS95IQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnxeej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 11:08:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943fffbc5dbso17233485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222495; x=1794827295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=b/q6LzJQv6U8+LiGl8h2+VgYxDAiT7j6UQXWvU+MBWPOAKMDSLvC3BUuRIkIPDewZi
         i+ID47LhK7CZumhzctS4SebuBUzxPsFcu1qnz7+9FjzdkPUTUZDv3cw+L5bUaT6ZOxJu
         SxHIFZLz1G7Ux0HbWpndvNn4By57WeFtGU4yYeNJYW9XW2M6pt11p2+jiboRZssAnD/J
         8JlH+UNuVofoTm0TLhRhf6obeFX/75W6cnQyNjvukyztIP1ed0Ghlu61+3DYnEb0mYSj
         lZ2h5Gys78HnnUHdN/nbgMY1S3RS/M7jau39El03nL9chC/I1Q/aUiWoq1OXGJKxTYqf
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222495; x=1794827295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=x0Jz26c/1xo76j0QbM67QuVaAsu0LDLmXXYdGf24Nm/QmwguAjT1aCzIxfoH7jUKHd
         0KkKO6kzQ1KfBa2ONNjGQLsdjOxE1ycJ8ity5JXY4/Dz1HGp/mbgmSHllk31mRswj0qW
         stVhPd6ebax/YoTD6bUqWFxKXqGDvb7xC15vMInwBwFikgNNyzR4ZNCzrjiNeJHog0hb
         QQ8kD9voA+Wa6nP+7HAzMCJX1Sx8PR2vs9ruRfwS0SQmQCfBnof/e2wgEy8xxrzFPNtW
         +K4tjqKwoHRK/Pk4G5wIew4V1s1p217EDXFr7qD7TtYEQFzkZ+RAUHc+dz/Es1FQ8Qjb
         akwQ==
X-Forwarded-Encrypted: i=1; AL+hErGEPHeLw46WtZ9sN94nZyyA2KZy1zYDk8tteaddrYu6U5PcWUbpB3BCf+ppUKcL8qytPfoNSeC8i8xbiIhj@vger.kernel.org
X-Gm-Message-State: APuU4Z+IFmsreOyOsdMKy5oUH7arXwARipj7TUcLSwPHjZeBbp9loTX0
	tS0mahmFu4pt8KarpfQGTc9YujI738RHmHDA0363Yq9oPgJIwjEnKHaNwOKM/kOVifZ69PvD9UC
	Z9xPI2iGDhqpc5KwuR9DBtVHzbmbwjLANVj0yuPE7Zu9HB/gehgBOEQmy8tBEgNIOg9oh
X-Gm-Gg: AYBFou1UwlVVjeHB6O8vaNipt5EuQudeMVoCOIc1RxEdcLN1G7oeD1INbiMxFcre+kJ
	pfi6wGMUOv8uEzUeBri7xQMqaUgePkL32/rJGDOSadrfJAxGwAKyzCu4rYpFeD72yVliXpWJ2t8
	2LsOQgunBdfeUEXwoNu71+hOPgeTwNdSsTf8QRSK0erJjcaX27vbEAazAQzV8xBRiqqpuRBrsyN
	mut2qpLxQkKeFCSXkwfjhOZJHtf+dN1yR4KYvFl0mtQ3hAcMShJy/hv9J5HWsCtN2Mu6WYkgd2N
	F54dHl8yFzDFNUpeecus69pmL5lqCEOpH0o0Socqw0dLtgUQ5aSXuFb4cvFElB8fxKuXi8GHB+8
	nQWprYM+Wk8bGW/DakLRBoCdNfe205go2fepYPAnKoUCHRGlm3WZqic+qSRNd/g4RRVM+SA==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515074185a.5.1794222495289;
        Mon, 09 Nov 2026 03:08:15 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515069785a.5.1794222494798;
        Mon, 09 Nov 2026 03:08:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f94805sm148341166b.26.2026.11.09.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:08:13 -0800 (PST)
Message-ID: <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:08:11 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PCF6YG3YXlI487pq7Fx-n0doFX1x52HW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX4+nNYVPH3xX0
 OXGi42/3+BMK2P4ndZ4ffHi6L8PWles0qzUb8WQ2DDoefN1eHdk6EnslkMdBPHySa27Ds0FJsQ3
 JqZd1rX8mejmlidRxrmZXlzJ7Z+snjzsZlW85117g4Lm8C7wbAWvSSjYPqDIuo95pQHQR4iBgQi
 /krL7maq0Pn07sXLPmpuKLeHxamuSb06HU5IgV4cwkiwZhy1JNsygB06+7I1/pV/4MNqnRLQpAe
 lKpM2+9zud6oN1c0QWu9NfBeJz9cgztHzTDFIMh9U+yxmjdbuu8Gy8gLjuAMDpUQx3PwBFc4MiF
 R5DgElteSATSAu7x4X1sfZ4FLoeSs9XUxEfhLboYWwfneHQUiDLLZ+J9zwaSrCiX9mPV/yOnDZz
 w8dR/KaUEW7aexn45bfjkxD6Ltf5cgIwjCmiS/tfbAojT1miqI1MZlaEkRbrg0b+hclkP/+AAlh
 bqQJVofVIk5axw4tEEA==
X-Proofpoint-ORIG-GUID: PCF6YG3YXlI487pq7Fx-n0doFX1x52HW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXy7oM8dnTjw4F
 pr2HSLWYh1WopIczckdlnhHv5A5RXcZbuOkbXUrr+2VHU/gDRJyFIN8CSQVZgSyVGeBYbbnOYCK
 XAFauWuo+VRRnaOMZrwYAJYZPuO8X9g=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1a9a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=0q0syt3hQrrWoPH5w1IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

[...]

> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

No PM8008 on the other phone?

> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 112 IRQ..>

[...]

> +&vreg_f {
> +	status = "disabled";
> +};

I think it may be cleaner to move the definition to the other
phone's DT (are there just 2, or more?)

Konrad
