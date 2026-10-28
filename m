Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199159;
	b=Wl6hleYJAFwVJl//ztilxRSoGTjOeLUcple/SM1DbGj+ZdCvmSS+5v977frK9/V6q3GA
	 FUvn0yFArBClHJWyTZ8CUAmLFry1VhLbmrjz+60g60euMZY4ROdhLnJywVEMDAJFd5r5i
	 smNSVw7M8Duxm2B+QeK/zYKWimzajElR9P9ASPLEjQYTBynivHPieGssQINm79+G98eJY
	 b5b/Lk2sHxdXfcSBHEj4aAJB3+yCbt5nAw8iDDxBv8PMtjS+thTdmI3bLKWoMGZR3xmLz
	 u+KnSUlc614EcVSXH72nzpdmh458L1vPq9OxTms6rpRuSh8mNe3zb9Llq6V9CAFSpBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
	b=2Ks0i4MqFPdvR7AJyYivqzMT+xSWbbqDdFlqhBTa6Sebik6/Q12vCxt8PaPIWhduyUBD
	 v7p6nidqAF0CwzpwQ8tF33Kmn2EfowKNgcKCy3u1mR2MQPEs2IvSLVrAeyRf8f4GdTwDI
	 IIpjR73s1mUlCtOAoif13FA9qFeopvcXQ6Gg6kaezecIz8dHxg9XzrPGu02K7qrAcaJns
	 XDc7gN4oN9osl2yhsmdhnE6N7AelI7kORAkdd+dsX1F4+TsrZ8n38EDlecjXSdPG8I8sq
	 ZyusSrqWOy6cXmjLXSMJuxddtvWfCtoZdXiDTrpZTvp39qCRCxShmTxptxqk/w6ETMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11E606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD11E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6cs4154790
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=; b=FCttlUdfFxPMKEgN
	fso/1YYi+kpRfncMw0Ru51+XqAYw5WA+vmk7jWl0H4lWSiDEx9gPwhYyGkzo/VBR
	je5eBbD2efYYLgCkp+RUfuDE0zBjKuq14I6BSeWEmqRq3C/FBhgl8LCl6ekyfac/
	comCXGmbe5th7frZoNV1AuZ4RvuVN2RUX3/cWiRyta2qNlFZgGD4pcDSkcWebvNt
	tdT2sDoxeA81C+sysW0cWBpEXDJlxqvhsuHBUYR6v/VnEcHxuyQfdJU2P9SxDU1h
	Gx/fb9nDrqnQxb80U+U8Khxp5UqrWuaCfcC59d7t+LzzNQEZwLnmw7LY/EPvP93x
	oknTQw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1ct0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:52:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so106328e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199157; x=1793803957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=CEKZgUCnMtpoKoKJnr1475ttjleaHNAvaXxpqmy/A0fgmr5srpPVATQ9CpkCPcW2EV
         udZyqryiqq3ptq7fI4p1ZGQuCmi1eJxe4x4EfssIIj14ST6nPZYrlLZ4xEpCwxJldCCw
         oOy1a9QFD4ubLuzytg6BIzyVA8HhpvVyEVaf/OjfYlKmpUuayDNAiBbERhZGOIogmRR5
         4a2azLpFsMK1m8GRdfll4cTQD4nWTxKZfYq2K6KAACimunMNSIwBC1Ive26tuV5B73os
         5gg59SX3jCTMJX76H3Mj5ONnBVIfPSYbtTyzNNxYR9A6EuhRMgB7JaSmFQ67vQShBdba
         qtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199157; x=1793803957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=Vzh5LpOQ9J7kPSEVCCqHiBuFOqVb9pRsGAnxnCg2AG6/iad+7TD89vNxB0nhdd3fol
         xduENRGheZ/ysx99bzSoyS38Ut0z58KJC7OjCEFnnkPNRyZZ0EMeZa0shUpa9PoEHcbC
         fP3aJFNxq6zKzq6FXyzVgnqGBlJe3lCPHDeqTv6rI611W8y3jp1QxvRpUW+icifYUKj6
         ef/CbyTHLg8SbaCZYZ2jhH+Q58l79SvxgCqHNmmBjkyNQ6Tj0gjIiuUQJMwdCtsU3nKF
         ynC7qcgr8schQlvjT/fq/GmuJS09WGdTzzUEoUBN6pLHdyB/do4AUx0r4kjHBGq4FQrq
         ErcA==
X-Gm-Message-State: AFq9FYIo4XXSKJN2Xv+1iodRSYkSORUs/TcjwC8fzN1J2kFdZG2YBI5z
	BdFtwzClXRdzgIWZGX/ibQ1YQ7dtmbWBbNi7kmQ51eXRqS/0S1EwzdNGUtw/amJD1vhg7eOSLWX
	koBKhkziQEVYfusV8DbzI4CdGx8D+lPyAXZauTaTLFsX6OxC3t0VEzdkrGe7B9T3o1nYt
X-Gm-Gg: AYBFou3AO0fGCjM7gPXZEo5PZWxQmVn1X5D1kkTAdWh3adbS+ioZPqXpay2cPSlnoPu
	rPUfUPoJychIoESIGcITHst/99uBZUXmRbdXIxkhP1V1I0OU30fTsGg9ib961OKiHI04N/zAy8O
	Cze/M9RCzoasTDSJqDWqMdUCUZaJGBjKtzByFviBI1+UMP+i1TqNXnK6ymUEBUl2XsAqHptD/fI
	VJAbON2BxZsn059/lrLN1hwO6RD/kEk+iH7oKRW7BLXhPF0c+zvtDD3JOt2ETpTaFuV0UmFOUVt
	3t2aHB6TNiOI+9QIzvh0zI2zFC7o6oATGIxfoExyKP1+CtDMSh+Pi/MVjBelUfIJ8awWeznrm7C
	0rLNsdx7fbSJi+pbk4VbMeAWewGrEZ+i4/mQnMLv39QAPy3HZXFQX3zJ4RPoh5Tjg3Lj8e4U=
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270562e0c.0.1793199157035;
        Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270544e0c.0.1793199156609;
        Wed, 28 Oct 2026 07:52:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm31881071fa.9.2026.10.28.07.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:52:35 -0700 (PDT)
Message-ID: <fe2c319b-223a-4178-8ac9-33a3a5fc099f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:52:32 +0100
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FdyI6tafzlyhgI9SR8-uzgeCSjoncJTm
X-Proofpoint-ORIG-GUID: FdyI6tafzlyhgI9SR8-uzgeCSjoncJTm
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae20c35 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1jgiRTNCPZbMTgtKrOUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfXztmnmaonnfGS
 0ciCW7ZrOOFNlDZZKyxukpyeKz5OwvpUflPQtN2qyGEFWhLEpFZkAHFd+4wRx7chwYxLi3duQPu
 6vCmUDHA+QDEYQkTEuyY97DubDdAioKRsg5/QawlK1WyJd0v1oI/sal2Rgzx9U3Ccy5hdZH7Gka
 l34R4kjE+pQekapoL+vrmXu1apYHu6dUtYvgdO3IVxGWmSbrLPwE35S97Be6aAQ/UzNktj6wPHy
 e3am5WBlPtWFqgAuKksCjb+mM0mim693oo5Ig2EJMUSuGlExrNZB8d+2DRX23xgiLeoyRnBvhG5
 EkD4QBqMHwJ2Gvvy9534FDrYgbMe2MCWw4V143dfnURG+Hx4TEQf9wIuCreVGUPZZRZ5fIeQCY8
 wry5Maeo0ln4S6L6pBQ+LswwKO481I/ED3euUeykcrRV8hMGIFFFyI6tboXWNwcU5dQ4PfH28Fs
 Z5JXIozc35nfCg/ugrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX7twNrI7DMJkS
 ICj5QAjGh4CzV8MAsaCOUNbr8sGx0rKXuvCT829g5qf0IIlgAymzqMjb8HCA1G43VZ4KJb9rc2k
 ugtCWZ6WLkX0ex0A6bAfk72VPYYYoDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280059

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
