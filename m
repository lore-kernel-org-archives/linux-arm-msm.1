Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE492AD00
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262581; cv=none; b=e99ajVfdRZbNruajSHNP1put4ar1BmVgvAu2MXFK2AyrS8TlBQrwp4i78Kqmw858+ph217sHYgmesJPJruUHE2WoUp23kmryzUTBapgE0sjwi/EuSuwlqCx6Pqhwzv6IY79IP3zU3xjsVt7kN0+hzlfDq8EQLqUct1wWObHhiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262581; c=relaxed/simple;
	bh=IRfoPRQyx4mDV1KY7zF8pbQdd1HlpYooqi9V56M7h8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4boT3Zsg20Ok+WFsziMmW23IFj5WzjhLvLa6l3LBsNmYd2ppaAuI2prprvjZ5AIwbWZT0QwXBtGCI/97hE2F2fx7c2lAc1S1pbsiXtt2ZZYblauOGR9CxKgt+o0/lJJEXk5AeoefOTA9aKHAFSsV8suAfAgIYtp8Rrkh2PaqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZUJGFAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1y9+Q29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZUJGFAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1y9+Q29"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdeX1713044
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=; b=pZUJGFAm7VygXV7U
	Jt2iv/ugWVxWHblyI4wMvS9p9nYc4BehIyLSYvKZjmMb2U6J8p152vxUw8dSSw+8
	RyFl9rPgjpaZIADPKtsLYNNNu5lROnlep7U35grrABJ7xaZV+uWJfFSSr2/lTzgB
	CxBpRlCGkrStVuOwZPFKLeriZH6fJ8l7IjdKWBw6q+ZSnIs+nTob331Lpsr5MjtR
	C7D+1KcqtDA2BnJODGJGZOHU4AqH4vVl5FvDI90mfUdK9d1lg6q5rP4wfjJghqa7
	J/qCtqaxLMtcLZ4dujo8+tFclzJmpXyywOm4F7AKXOT7k2ttlocspGlUnxBGK0PR
	r9U6PA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa8xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:36:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93102454272so90090785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788262578; x=1788867378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=;
        b=c1y9+Q29G4K0oZ1KNOGmi4aytW8aDt377+KQU1Zbqk59g/1scwRrwgxi44CZh504i/
         6MyL+E8IFTv6U5usyvQatXgivFgfT4HJhnN441IJvooq4GHUPvC8ccYgRCgYOuJrEGJ7
         A6o3sYPOZro8J9jTO3dLVyl0Z7K1zPXJS5Wum2d6h9j81hNb3dKyO4iTFMK4z4r8gkMe
         mtJhKsWJwNHUqR1/I/w9e60KwP+BsVieqkXltQ/TWWwsL3aAMOczDWcfLnqF9CGXMxVU
         G/jmrvBN15LCnxRZqUNpjvDMcysLFUFPoa5JCloansRfANGXGysKQB/IdXwWaqG1G8Jg
         oYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262578; x=1788867378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=;
        b=YBiCyP7jexYazRyEmUZtNW4nKmuZtiglhcvZRlMrUd4jwDHecMgiBRHp8igCOi6xjh
         MVaEdlb6sDOmcD6bnZcMBEphcxSzoF/3RjK7lMvVDGLRPKUvMCcKWfU8sDHAk2aaHeCY
         wKqQuFmzX/BgKCm2RaDRnDAMNEDS/aVac8urt04S3EvtSVyCe6hMWOYgFeXU7HvWFdHb
         BmgxJM83wLLiHovjqR/VmzgGv/u3M1RObMilk9+xQFDeoCmO4EAnIFTj+hrusoVca37I
         U24zPAb7qTqtUnUAs0AyI77S6spt5lmZylhsez0SIfJ9k9MG9KBXOISluZRC0DDMLy0b
         PfQA==
X-Gm-Message-State: AFuF++kiuHdmFNRbreJqkiy9R++rDWbMgYz5og1vGi8z2CjdAM80OW75
	G6/0KXndDY0UgiepOOPEZsEuPLLnFcV2CbzQM+yNNxU/Y+T//wrq2OdsrimQjPEkuFiAGqyzstz
	czjAw7Gk+bikDQIGenUtw8C7V3McZ1ZtnimU5Y8GoQR062KCMp5QOkpZml6wl8YVNoxfn
X-Gm-Gg: AR+sD13rN5rD7PtJ1PUm+40DhGBYnjB+MBL/rrL0+tQ96lm2snYzzSFry/SbYdsdxNk
	Mhcwy+zKSibqcX1GVsKGJ3A11x+xK3V7489np3FJI7y04CJiTlvh65ZHCeBAKrXfzbyqQq2YJaC
	JLqvu26QYzFnsWW4kp3hbQ7H4z9AdyOsUDr3nB1/pOOGS05nL/5kLSRH8l1v9j4KijjFBCfgfmX
	HLq4Dp/dYop57SezdnU4WibuyqvDDYCxqdgIXP0y6uQrd689zds1UiSx6by3q5pRnR1M32dW6/9
	PgDTS76XRHpqjaFKR4EjQTnR6NfAxQPR+RFIuY7TMVsoXistcVSRa9UxfjSDtOEdo07gSgMspAy
	eFZa0BP3CLiCsaxDhsNXG8w==
X-Received: by 2002:a05:620a:8018:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9392875e6b1mr1452514785a.2.1788262578418;
        Tue, 01 Sep 2026 04:36:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8018:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9392875e6b1mr1452509185a.2.1788262577784;
        Tue, 01 Sep 2026 04:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f25177bsm579310766b.57.2026.09.01.04.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:36:16 -0700 (PDT)
Message-ID: <f23595ab-e0ef-40d8-998b-4cb0426ec166@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hvE5vFr0XxdkamJromhgPNuQelI-UOtz
X-Proofpoint-ORIG-GUID: hvE5vFr0XxdkamJromhgPNuQelI-UOtz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfX1cXXjnGThbQW
 X8hsNOV5SSKKX/vRbYFdPKN9+qGJ951f6gBA/p+EmuWibQQ0FPApr1dc1BhidgxBUfMNbePXy57
 3era3OAT3TyqmFIanT2ilqHzLgRhKJo=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96b8b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=X7E0pNrBJpJ0GBZA2WEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfX5MW9JCpgQk95
 8fThkrMtbwYVlDq3Oai3zgX8iEOJRuSOvxxW/Wgmbtjix5PWOEuEpK9fKwwSaWAyrekiNkhJac1
 clIoIkFUR5h+AANuKNgNPDGsfnAi9Oy4V5WTxYyBow2AwUPr8EnryOo6tLo0wABejxDIefKvMWg
 qMokG5daXmyJDrCMmAVeDA61fzeDQJ3nLOD8Z/a7ig9zXJOI94jRFAeb0SM/EN2/vKMEdGKcRFv
 Unq3T988HXdr4PVEb0bT48yElDfgfZciJg0uWjOw6IKO1qjpO59DkQ9NKy/QWSBkaqiMZ49nuig
 E6JyJxsqPcQrusK+xC8lmgmpVaXR7VUsc4GYbBPd5G3vv4Q2An4j6tnfCTWSdWff7OjktVA7jt9
 q3wHx23u/DMNT27PFVwsfPEtk0ilRJ7tmbrvLugsi1TS9saBmsfhvRZnD7HPwn0FaQkWPb8u7zC
 2YfpI3rqG+VrQkzCklg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010102

On 8/31/26 5:01 AM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.

[...]

>  	struct eud_chip *chip = dev_get_drvdata(dev);
> +	struct eud_path *path;
>  	bool enable;
>  	int ret;
>  
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> +	guard(mutex)(&chip->state_lock);

GPT suggests port_store() should also take this lock.. I think that's
a valid concern

Konrad
