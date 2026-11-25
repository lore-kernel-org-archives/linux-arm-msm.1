Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598339;
	b=pLV1tKZY4ylCaryrvuxiZ7uzFjctn6uMmjVP6FjB2o5IhaUspciuATTgw9k/Pg8q6Q2j
	 esAt7WOnmMIDJwCLdW683GZ/quZ50iecuJcbVqFIzKl/Ca1Oejyg34OV8Zrx5ocrZHU/b
	 T7QEcWk0BzlRLPeOyysj2ylDpYRw8kzz2D1tWXF4bkmmXteO/+AQuw815Wky8fv1bsuRX
	 7LvJPBZBnwy5GNwtOTn5yzsOTewT0lkbksOjjrAVJkVPkcqw3a8FUG6Ja9fJP9NKLU1FI
	 RbmCDM9lH66paM/XN13/lLJbCind2qE//TK/FsyNFpsT9PoAj/QjbPx6985gRvXa/FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
	b=Fb+LrXOmV11Kflz94QVmkYUsX6pBINhI4d8Fxd2pSfO1MesYzN0Whbo19C5fkFw+f3JD
	 65fjjbauwobJzTzQDbVipelIkpszd/Tzzgks1qNDMPmyKw/f5VFrGPYmma1Y6oUfQUiC2
	 Ape3EYZmmFAqjptYFLqDdkS6B7nNveiiZ2byzl1zHC6utg7IIW2RT0opCcyAbfgInFXnD
	 S94ySsIBKYuf7vp0/rVZL96zhqLL0xVfDvexXCQd3bUW+/qYBD2WZWZbIa4z7dcD5IqqB
	 M7jQzA6MauDaSY0sKenwPOp6XvHV5HpyH0AnV3+lq3H/PJhsSxOoOwr7krxIaHnij2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAE606A698
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CAE606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69TIH3809048
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=; b=GWgbSZ4TNz9+5qMl
	QkTo3W4EpXrRntBZDKsTi93htfjF1ObcWORNOizPjsspuh5silkP+R8pvJFUmcLk
	KDDNGlRc6aDby0XHutQ2sMzeD38f6AcIvjeTNbDrMd6EaJ9EAgzDsBBaUepaothL
	/6gLbWIWflflACvnfszeW1yZwp8nKJrqxmykGhh5LMP4Irh0Bxj7YdZKwmqUa9AL
	hERoiizUvEr73p20tFBn572LC/Mmte2oRR9/l+0bwvg3McT9e0SOFpmOLZ3avStZ
	gTHyeOZ+Dh+kuOZKXZnuzh28fgKhdsFM694WIRew4MevQU8d2UJ7DFPLB1aVnKWY
	DhUVLw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkc1yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4611632a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598336; x=1796203136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=VRXEA7fwf+fBmdgY4/fleky8uFnW9VeuM1Rjp7nEti2NYI3/07V/N1UjDjFlPGC4/8
         Uogn4h+Tx5oIzxcQZ/q9E5oZud/YkNkFITzKVU8l8U9g/LdBNhEa8eRlrqpcmoUI0L5A
         eKi9cO4QZ2ti2NyiIYDSMEvs6EACG3uIJ3/cjTaw4Wl/6qEec7yZoT5vnkLG/we0LGhj
         3tNJASX6r77Pizmb+EeZB+Nc6jTi2pYcG99ZF0adLfdqSs2XQJhblNfxQk2SgHWrjdfI
         F8qvCGhhBdJsRzuybkP9bgrnvj6a695ShFlfZJ6y77LPs4/d3T/yD72j12l4P/UVm7po
         o+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598336; x=1796203136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=Qlvj7KZA+WWNBsK5jY2M9KR0R7bKraQ49hHfhUQcViySgSfkxCHBOaZtFYHnSoF2ko
         o+7V+e7nCYE/Mh7nrSmXlwuC1WHJWsiL06LzBX6FmgjvNNP+HNpyDwgT/mYsON4GAlCO
         x46xv56TEFdoiypV8Nv66tLyvE2LXMrobiVdLs1vjZWX6FMV0jey4bEsi6MXlxznT2UE
         15VRpMRqn4vuwWQcfOownnNpAqMU6dfc2TyXfSs9ypwJHTUrDlCnlzhV8C0Y/uZJOrvZ
         GpRUT7HES8Ezcnb22rvYA8Ldxa5tCA5Yq8NgRFNuuHTDH02eStSuhNVEMZZbyAZ3yXFS
         iCVA==
X-Forwarded-Encrypted: i=1; AL+hErEBw4BafzUpr61QXj6H2mKg+CvOFVAYWfSnZspaK9G2XmSSFCeO3V58DG6+qj69lhdv97n9uAwmPiSaMLx8@vger.kernel.org
X-Gm-Message-State: APuU4Z/3G1prxe1u2U7OdmYEGHmPYtXqTyERnJw+hUWDUmgQI9YSvVKU
	G++muFhkPPdBTiiRHIgITfBk0AwZjO3LSsgyRDk5JNaGmxw5F0YjFBJ/65P2Ov4AmV03nSVKMZF
	4LBsK20QYc4mlQ2f4ojhgOGmnmqzLzksO7PsCNR3RYzVL/qJ46Wz2emElniBzvbz1bFVcvYTSjn
	+dxWQ=
X-Gm-Gg: AZFdTZfIGNSEtpj7UJJMNjM6iJPEAEsnEwlUK0Qf07Vqw/vUwxRMIJunicyWpu1Z2R2
	OuIe4Gd9/q8CwqKZQBk1nNjXE+wxgjIH6XVtzdT8g4mkJJlx8HEAHDfaGjubG+LZ3+KGgD1mQAK
	rKRb2uwLUVy8wpA3zJaM7Pynhoz7kFS/SKDeCdkyQ+nHO9mmuOFdtvekw1TOHuOOUJls4qY/G28
	crLlIFaE0wW82BzyS9Ur6GRpqBDe33kYxuRbZm8zCDZhTkel207UzSa0PCTwa2q4opPC/96QlJT
	vj0qYiNs/CQ2KLBx99mBN597D7Tf1W9im1gMFeP9J1quXsc+U6UDwZidxE8ho49w7FXpIomQj6n
	zQX3vGaO2bKniPGLqXjExxqeGbPD/z6FL4P0FX88BtJDjPI6AhJHsiO2GjGXwwI1bg6AoAVR+un
	w=
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029378a91.36.1795598335895;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029358a91.36.1795598335425;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm6290687a12.27.2026.11.25.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Date: Wed, 25 Nov 2026 14:48:49 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
Message-ID: <awan+SRMtZs6c9jQ@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
 <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXyp1m/nEuS/VP
 eVoDJBjBm7Z/i6iyvuw15eMIChaSILLqmfCQIzQTnXQJbSiL8P6CP7Apkd64CAIWsUyNZlHdwrb
 aDGxJtRpPpFPWoWMd/Im7AtS7zknCuc9lfgK5PuaMr8DWe5WTSowSd/KlPv+dWyF2P5Pk8XhRHf
 gt8ZUtK93WXzYr9vp39r15Yf+m9BGUnATWSzu7OJf1iuIDyD9J15Sjdgrp8t4YTRRXKmRUPYnLT
 S2ichOHjIeOJwbWGAljVvblpPxTiBVQkxq7Aiv01Lk6F9OBAEAttARCsHHzXk+r678e4WD4d7dP
 VKfmFnAcB+FxcvL6reBKG3kbHg7+Nli7oWccP2oIExgYvTaGZWxqUhKkMXdelXD0sp8wjbnbqC+
 k1EaZA5J1w1uu1pfBfHjTk+0NMemtCa0dLk31ssgvLlKevepqnnzvJKeoaTZMbg6MsMec0CmvTZ
 tCY5QaocNpw8kPR4iYQ==
X-Proofpoint-GUID: 2hNNAWftvdctMQZ6u0PyvaQ2GuejQGgu
X-Proofpoint-ORIG-GUID: 2hNNAWftvdctMQZ6u0PyvaQ2GuejQGgu
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06a802 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=gAAQxgIGOAtfHdDX1gUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX/93NQaHx301x
 PMSmivq11iPtXUoJ15odps7lCYqBK82YNROGiPcOCsAPB3ilK8MHJJ99lgRJv0EXc06yA0RCXnJ
 R4T/UVCRqyifIqE1l9J/L10DNlAt3k8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On Tue, Nov 24, 2026 at 10:55:57AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
> 
> YAML devicetree binding, you hit combo... Drop YAML.
>

ACK.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 

ACK.

> > battery charger found on the PM4125 PMIC.
> > 
> > SMBLite is a reduced-feature charger IP sharing a common SPMI
> > interface with the SMB2 family (PMI8998, PM660) but using separate
> > SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.
> > 
> > The binding covers:
> 
> Do not explain what the patch is doing. We can read the diff. Please
> read submitting patches or look at other commits to learn what is
> supposed to be here.
> 

I apologise sincerly. I will correct this in V2.

> > 
> >   - compatible string: qcom,pm4125-charger
> >   - reg property for the CHGR peripheral base address
> >   - Four interrupts: usb-plugin, bat-ov, wdog-bark and
> >     usbin-icl-change
> >   - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
> >     and usbin_i (USB input current via ADC5_USB_IN_I)
> >   - Optional JEITA soft and hard threshold configuration as raw
> >     16-bit ADC comparator values written to BATIF ADC comparator
> >     registers
> >   - Optional monitored-battery phandle for battery parameters such
> >     as float voltage and charge termination current
> 
> ...
> 
> > +
> > +maintainers:
> > +  - Raj Aryan <raj.aryan@oss.qualcomm.com>
> > +  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Qualcomm SMBLite is a switch-mode battery charger IP found on
> > +  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
> > +  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
> > +  supports USB input current limiting, JEITA temperature protection,
> > +  battery overvoltage detection and a hardware watchdog.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pm4125-charger
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
> 
> Drop description.
> 

ACK.

> > +
> > +  interrupts:
> > +    maxItems: 4
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: usb-plugin
> > +      - const: bat-ov
> > +      - const: wdog-bark
> > +      - const: usbin-icl-change
> > +
> > +  io-channels:
> > +    minItems: 1
> > +    maxItems: 2
> 
> Why is this flexible?
>

I  made io-channels flexible to allow an optional usbin_i channel. The
shared driver requires that channel for SMB2, but PM4125 uses SMBLite,
which doesn’t request it. Since this binding is PM4125-specific, I will drop it.

> > +    description: |
> > +      IIO ADC channels used by the charger. usbin_v is the USB input
> > +      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
> > +      current channel (ADC5_USB_IN_I).
> > +
> > +  io-channel-names:
> > +    minItems: 1
> > +    items:
> > +      - const: usbin_v
> > +      - const: usbin_i
> > +
> > +  monitored-battery: true
> > +
> > +  qcom,jeita-soft-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
> > +
> > +  qcom,jeita-hard-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
> 
> Express temperatures with proper units.
>

ACK.

> 
> 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
