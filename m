Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AEF2E88A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356984; cv=none; b=TSxAQ/JN31rk5wJfhHTz/yEVzDICk8y+iAkj69BMN/nrU8Zlyz99y53jUXfllnMjiRkiRPkyhfw/ju8iApVIgQjFEdhihKYQ7Q3GMgEI5knGEjonPNK1SB90iTTsUmkd+NTWJFxeiWusq1H2S5vL5A0kYVGRaaabi+1/WGZ+Rcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356984; c=relaxed/simple;
	bh=h38puJP55NohaqQoEAHKVmrRg09DfjV6DQi5WL725/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOUovGuWKYXwvs2ca4Miqwc3iSlOje5aDwLLb33gI611MUe+8HOllDfJ31LDEzPrpII3ECOO2MBkjSV5wT1pCbvw/HTDKfBP7lz4ciMODGfBrPX6sDYqeAKEbgAgE055iCK4K5syLgl/3qqCg7pEyq2M5aC89KEEyeDQOS/AiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMJtzfGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epjgS7wx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMJtzfGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epjgS7wx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR2r12251466
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 13:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=; b=dMJtzfGd1Kr54bQu
	GD9fDz/rWV3mgwOWyiYN72VDTrGVMEAKxtKEQNq015+px8fvVGh0pD9Zm3rgxI8/
	QaggsYobxVfvXippqUDvaVE3K3KtQU3NVZG+XX5Sx1ZduUUtv2fNxbCkuVcl8g7Y
	0MHu0maN5SDeuRPy+MOsm40VBDEC4QzcfyhVd1v8nQmM23qmyywpJlMmpgV/RZha
	X0AIKDbNu0FGvDsScMD6Ri+liQO4i+9JAU2hJuVcVRbPOp/RWTxiyxEmLyBwIVie
	/KrvHxhyX/x3EazV6zlui2qQyDJY5ROgh195qMY5aCzt52rnF/gAIKt37oeNS+UR
	pMS5QA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx29cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:49:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7570225606dso38832137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788356980; x=1788961780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=epjgS7wxSX3H3xyhq/a7Fhs3+UQwWgX6P1jpbIQp8cBXmFm/rtYC9LZ7QMT7FsmR3P
         R6fcdNbcjOWPu8DY3VK5nvEKrkA1EQ2CPMtUc97JKIUkGpKAy7onxZ7VC209MZMpka6K
         extSfOcXEWPr4bxR3DOg5IXwYePX+iNtQWQA6sBzLeqYxW0YBgQp6dq52Oh8iZOPG3kB
         SVkIqGLy8biiAalN5veN0YjzcsgngK1QK+TBYrOPYcyxvHzgtbdWXy+hIibjCHyFsiuB
         tJRCB/cEjvdv6ksyCDiJ3fMShrrtOqNz5ErpEElb34bvgkaLXqhaSvY4XT2mUecUJfiJ
         EI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356980; x=1788961780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=dVLL0Ne/OC0HCEDH+JiL2PAIRQtC8+Wa6uDWh40gRjnjmqdUSqxpQ898M1661s8hMF
         1f5rGNtIEMBEkFxV5J3g9lpn2cSM4ikujDT3whFUsr0G7HyYDEuuRKqxkXTtP9Mad+ys
         P07JsM+ZKAMTXZWFY+JZHTvz4vEDCcmdnkCt5FrC3N3G8nCeYvTBWvt7GnbEldDKC2lq
         a4k4NPPbCZxI1pYztFdkKyGZrRQGcnW8l2WoPHcqADOnEJGh+JjnbihSZhA0a+KXP18+
         ILhW36XoM/HVoKDnCTZTW2s5A1hTAgSCYnXYWtDUBBg4KDl4LM75a7JO7PEzjWK+mLQk
         1m+g==
X-Gm-Message-State: AFuF++ln36d+z6smu+ydfHlNxBwayoIMpWw7uiudVCUIBXqxjZZVszAb
	Eju4kTVMPjNejvao1pKioRNHmssUjLwtLvRHtmVKc6tOKL9g9tgG8UWt3s+PRqj6SG5CvQolNNJ
	6Vk43pfmpbDlAaQeFzdoofhNBTcmp1M4l8jB4sc2aiZ5UFCRKJbFIBk6IPWalGBAiZvgK
X-Gm-Gg: AYBFou37U8ZZoZ/G+ciLuu18Qc29UmivYAzN6Oev13VZ7Ba+uBCYsVU6kKHGODQI/z0
	KrhCAr8CdV7X2Kailo4wz8BZXRuB6VEDlYIzWx8Ic0bUBeZG9h9DDDB80HTNWA/unf7zJ1x1awJ
	iJzg6jNmB0ZoyJFzT8QmzI7QhrFg5abY0e1tg8UaGD1yvF69s0grqF07BS5t/8SLTc5oWga0Btr
	hP41eG86d8OWUpmZxWU3mpNnygu0jTg+1LrQwKGKk/PJumPj1GmGA+EMu75ujplJlTgaSmHfBZz
	mCyVzdYm6px2gQYPo6hsM9Pcm02s++FsShBNNZ7dHacW0litc6CXsCbZHJP7BIiiV87whB23nyn
	jb/GsL3T1DOBIfGpDVaclyQ==
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519685e0c.3.1788356980523;
        Wed, 02 Sep 2026 06:49:40 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519675e0c.3.1788356979816;
        Wed, 02 Sep 2026 06:49:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad015d1sm5649791fa.22.2026.09.02.06.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:49:38 -0700 (PDT)
Message-ID: <fc81b75c-a76a-43db-877d-1eca69da2736@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bf6MroPShZDizDNrqfkSzbY6lIzaRaAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX3TquyeQZOGFQ
 2Epy4nu/QTUZdySqJD5S4ZVvSR+Wjh6FgyEW6ReDoRVP02eFo+CiZpGFcDaEmMeAbri/cHNrt0u
 ZFXIvxV070R1DYyYwAiHNVmT6/Lt13zkcOsktl62KqaZVk+Ij1kYdSNpHOJLjljhc4A20hYnYmE
 gvoAnmt5Z1ciVPE4U9GidZBAkL4Rw0vKKyKjMrNQyUuWcKxEIjHIru8n/XuA52uLgbTVuupO37w
 UEyzb3dx4EyaEJSvHPiWfefBxTp5TEbSB/dA0wNxNfUWk7PWKp8dcQkVM5dyQb+gSWThNKr5Uez
 BtrSnP/38zrWmthTowt2bHzEqEnnTbyx5Jv0myjyJx2j0KuDIxRZplkqhEzL2z+5zR9r8O8RH8d
 pDa6dAxt+eaRiF6O0Ebo/v7AAahddOTLPowNmLxl/4vznSGVEnbzmqdJKIYpswmL02CdLp9mqRO
 wF90hyKkvctY9/X+HQQ==
X-Proofpoint-GUID: bf6MroPShZDizDNrqfkSzbY6lIzaRaAF
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a982975 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EiTzJyzHe8GYNTRMAEEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX7xxZNALhYjl6
 ZX+SduTTJ9zmILSuUDPnqFKkEO+HF/49HlUlDy1klOn5tQ7wxI8urIDc3lV8sBCfGMzORNojKni
 ihMntomVVeH4NOSZcJtcHYfdqE1AlqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020122

On 7/26/26 4:30 PM, Pengyu Luo wrote:
> Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
> based on sm8750-qrd.
> 
> Supported features:
> - Altmode
> - Backlight
> - Battery & Charge (Full speed)
> - Buttons
> - Framebuffer (Require mdss and dispcc to be disabled)
> - USB (Two ports)
> 
> Downstream supported features:
> - Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel)
> - GPU
> - Touchscreen

This paragraph is wholly irrelevant given the tree this is targetting

[...]


> +&tlmm {
> +	/* For CDT: <32 3> <37 2> <77 1>; */

What's CDT in this context?

[...]

> +&usb {
> +	dr_mode = "otg";
> +	maximum-speed = "super-speed-plus-gen2x1";

Neither property should be necessary

> +
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * USB2.0 is shared for two ports, set pinctrl eusb_mux_default
> +		 * to select the repeter. Plugging out one of them will reset
> +		 * the DWC3, which causes both of them to be disconnected.
> +		 */

Is there a hub inbetween? Or can you only use one port at once for data?

Konrad
