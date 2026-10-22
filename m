Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661366;
	b=YAt88KoUqhw6JjdYyqDpvPRQ6sh3TmW43pJwooqY1Ym9x3U8R+2JEFOLWIwDygnNlbn4
	 tpWr8HsPFpslUXOhkFy5CsFLIsMrjjjBaeIv+rN6xCkc31TzefA578XeK1SkJ9y6rBZv3
	 k9B3JwA8/0prpAV/n6HqyDQ5VZSLp9o2NFCbU//+L7WKZzSbJm00lbfVNajEHwSLG9ZJm
	 Vuoex+i56pYDh1vRQxNyqEa4d76k30W00yCxz/qzMnURMQ4Y43tyPXz0R/IZxSuvjemef
	 45IobL6Z5Qo8yOwcSAcWoS7I/gE017qCdF3iLjJj+S8kTUgGCcZwhqC0ZMpdHP30RxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
	b=akZxvg/QFs8apBJDpOnVSbT+NyjeDJFLPZP7uRPKFYRgEXnq6saK5w6SAaEDSj2E6zNG
	 VewO61qV1AIZy3kDDZ7pIlGTsZXf1kCqTLMUOB8DA4yU4xeGr/i7QVUtrFGdIvHe8yiIT
	 K0oruJopAQJcq927TPr5nwPmcViDKIB29DvPToeJIkiPG0lceUURZ5m8jVFwtSamC/Yvr
	 +XW9WOrT0/HDPZ4V4FoqMyq9q1OUkTaH8tQxZ1QcHOA3vMJh3rN7YmRkOvPChvxggrNn1
	 5WGFLyrWnL1vHgBWAce7pQjcYIn2Y5ciQPVJyolvcI5Z+anQb9pAFP5ygnuuc3ooZMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8745606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8745606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708sN3517467
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=; b=aLcrDXCUR1JjXUR6
	pH3vOrOhX9wQJyVTB6yLshBTnlXqgYdWRavOFu08uBmsxajGWGgVWzjWTyUMHSyI
	eiUdK+lTmjUbkBuqYavMS+21sJ22tqqJ26m87E6NXlU2QC2f291Evo6cvJmzQdEn
	Prg//kZBCb8KxrqZHHM1s5/10emrzAlJ6ygkkZgrpx0O5nEygAFW6VjhmawptLPA
	3yETgMyGeTxSloGyYPbJFUFEVD74gwxaAK8MErOatvvRx9UACM+Q1vJSMFZV+oDH
	5PdALBGOrBn0j86PCB3d4A84LzzWKpVGVqZdVJF15NgD5MbReHcPFjIBit3xkp9S
	3D6Cgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhnuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:29:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so43950785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661364; x=1793266164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=GF9pzvUWBASRRa8LqGY4AL7HJbkl/4i/uB2T8V7Xmhs1iqEtX9xmif0is2P/AMWmdo
         yIqfj2aoUYX8Iec+WSTht4k5sHIXnk/p2Yh0a3Tgzo9Jl0L2ttOH6WCxyX0UOmXvLnhw
         nq9sJ8JMW1Qhk3L08YinGecumKHkwE24kBA50opjeBEAMUa0RNG30TsZhunejc63h6pH
         sEDBap+5RI8kbCvoyMrvwB4ymcCiHMrLeo20D/CBoZV9onQwxYK2NUsOW7TCIsT/0f4V
         jg7JCfoTDKJkUbGP+AIBF7u6+xKOUNg56Y864rFKpa70YoVBCmHPQ750s4jmQJgg+PSR
         pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661364; x=1793266164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=0S4EMAS+AmKNaolHr+QiAwadHvNFsWDDbdIxd4bAAG4ODcp0C5l5+RjllRUF58QNT0
         pxL2ZYIbURAWF8+xP++SkyZRJX9WJ48NqzhzimZ8BxcJfqlZ6to+tcYwezx3qK1DtF4a
         74S0TspB41+H2FmBRuV1EWMBGLhYxfTqSri/T1uga5LKwNO+m8K/XuBWtH25FmY7E6ly
         RYX/+/v/zPCbgHLL/pgl8zUwrTclPGIflvB3KOuW9nbtA8BMVWCyeFdyvXlwIY5xFfV6
         J/MICACk6WzO/64H5GO7rlYu/aWJHLG4EjFkPKgvC69gMeFjDEstjv0nXeZ4iHRFrLPN
         rL4A==
X-Forwarded-Encrypted: i=1; AKwUvBwV/cCBh6wH8JJ7YnxRMrFMfcDfMo/fgpFR1yM9m40AxpYnn6FKVwuzS+xEur8bfwdBD1bW/cGGPtIqmF5j@vger.kernel.org
X-Gm-Message-State: AFq9FYIdu3TlSa7Tq1A+K14XV3N1ucVKhxm+2o3RB+pc5clvaWUeXeFz
	wSsDW3YfTf+Strs/5F62WgBvTWXIySmVKAoEw9mnDhJ36YbqIDodW5s++NojFsiT6NOEeNZaCs2
	BqaAlj8MN+k3vI0IiKYerQabHv3//WS2cyaOGd3yXzm4i64JbfAh4UtBMAPLKod4R6WeU
X-Gm-Gg: AYBFou0ZkrED6b47JxxfWunQ7tDrXQeE+DP5s3STjDV4blsVDfEYFE2tL/nEXHohxuX
	qy1kWBYx5DbD8DC85+SYvtht7g+85Mvf1nxOuI/Zv6alDr53n3hMWkyU1lcIbv0xTim7M82Q4SQ
	PDwceDBkYMiWlm9bbvVc8J7dLORxs8YnT85ubiqfV2MF9V8cI+pdBHhzE+7bYEP9JicpWLJRkQ6
	ym3X87LljzA8O0k/1CucZjgpcEdtholdE4bXZs8I8TGU8GYj7wUbyTcXhHalX9/SuW6W//AlcSC
	aKvE4c7lOeLrHzARcu0ifCc1u2nzGebyUl+yTW0VFZlaVfS4fxZXIvmUQFcLlhNqSEAQ2oyo6ok
	N2xDKVgah7il10U0nje1r7g==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994613685a.3.1792661363798;
        Thu, 22 Oct 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994607785a.3.1792661362985;
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm87380366b.7.2026.10.22.02.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Message-ID: <bed18f22-ee37-450f-8b56-d3f21b85c3cc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:29:18 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
 <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
 <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX3cqeKcTEPcpt
 VS5adH8aZXpb6HCO6rzA1jE1GnSwcBD/kLnNf8Sf6uHlJHIg+VLbJyGsDQmb3WzqHfUvhzKAhOB
 47iMptBoUobmyD7jRTpOu8lqd4uNiCpSbbt1F7FTi9RBBzPM8JZnnsFjN2dOvaA8mB9pCOW5AQq
 hBWgnWnq0BY8+ixgSCVMWrAZoAxXnY43y1gruqtS1W6yOh6Ry5qsbAEjYA3EPnKJ9HvPV7Wi8cl
 atHcN3VgDod7ICCyAms8Jv5gzlGgrvJEFSZlazFGw3YB7SxRwpu+lqRum1iy/WIsLKJv5LATXJd
 Cbymzqq4FB9fUpWycGGVpgz1ZBPzhLMW71WNEMGF6ewRcnOuMdizq5t6eIZakyvlvKAGkUHIbM2
 AUrSa9r1goHJnCga+qwwKaxqTvsA8+rstFqUWttHZDkYMvGF8O6iGHpZ3tN1YxAUsAO8asE7m8j
 KTqjF6sSpKdRPbVtXkQ==
X-Proofpoint-GUID: cT8BbqtZf6I186mPDTcasjFITx1eO6fi
X-Proofpoint-ORIG-GUID: cT8BbqtZf6I186mPDTcasjFITx1eO6fi
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9d774 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=XKtpnFXEKgIDAPG5UdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX6P6LtHcSHpgQ
 VVgFtwqsUtkkXJb8EfexG3NNhgixYpEhO/2KYmBW78uIQi0HsDAqhm9VeEOVbEzHbIv+5/5NW3t
 ucjbRd48tbUfOoxUy5wP44xxxkR2VF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/20/26 11:11 AM, Xilin Wu wrote:
> On 10/20/2026 4:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:55 AM, Xilin Wu wrote:
>>> Add initial device tree support for the Radxa Dragon Q8B,
>>> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
>>> SC8280XP platform.

[...]

>>> +/* M-key Gen3 x4 */
>>> +&pcie2a {
>>> +    /* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
>>> +    reg = <0x0 0x01c20000 0x0 0x3000>,
>>> +          <0x0 0x3c000000 0x0 0xf1d>,
>>> +          <0x0 0x3c000f20 0x0 0xa8>,
>>> +          <0x0 0x3c001000 0x0 0x1000>,
>>> +          <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
>>> +          <0x0 0x01c23000 0x0 0x1000>;
>>> +
>>> +    ranges = /* IO (1 MiB) */
>>> +         <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
>>> +         /* 32-bit non-prefetchable memory (256 MiB) */
>>> +         <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
>>> +         /* 64-bit non-prefetchable memory (3.5 GiB) */
>>> +         <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;
>>
>> Please drop this change on the board side, this is SoC-specific.
>> Likewise for the other ports.
>>
> 
> Ack. Do you think this change can be applied to SoC DTSI?

Yes. I'm not sure about the extended ECAM thing because we seem to have
never moved forward with enabling that (oversight?) but in general:

PCIeN	|	base	|	sz	|
-----------------------------------------
pcie4	| 0x4_0000_0000	| 1024 MiB
pcie3b	| 0x4_4000_0000	| 1024 MiB
pcie3a	| 0x4_8000_0000	| 1024 MiB
pcie2b	| 0x4_c000_0000	| 1024 MiB
pcie2a	| 0x5_0000_0000	| 4096 MiB


>>> +&sdc2 {
>>> +    pinctrl-0 = <&sdc2_default_state>;
>>> +    pinctrl-1 = <&sdc2_sleep_state>;
>>> +    pinctrl-names = "default", "sleep";
>>> +
>>> +    full-pwr-cycle;
>>
>> Hm, is that something that comes from the controller itself? Should
>> we advertise it on other SoCs too?
>>
> 
> It is observed that the boot firmware can leave an inserted SD card in a state that makes the first Linux enumeration fall back to 50 MHz high-speed mode. This property allows the MMC core to fully cycle the controllable card supply after voltage selection so UHS-I voltage switching succeeds reliably.

Got it, maybe let's add a comment

Konrad
