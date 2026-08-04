Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF745FFDE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841395; cv=none; b=OIwisP5T48ObvpQ1p2OtVEf+TGFYPajZG5anzZffBGeqflX1N5bBqKhsZwr2aAqZXhmDUBAwkxUTKmCI2TjBVNinmQDFnc+T212+shpzWRo0n7TuyTUHqwjPt8k3Jmhc0ZAMqhPTx3akY6bYqZIFV/3rjGhHCDbW9qtr8UbVaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841395; c=relaxed/simple;
	bh=VxsP9NGMGF+25YkA4c7VstbsKKvy4YQ/efSOUIb4TdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oe/56m/Fx0n7ypm/fBhC104ay9TNIr+p0rZ2ZSwC4p38zcEP35EfIEVUyy2aGdwvehnCEMbhdxQghXtx+TAAoRBUMUcAgQq2a0jwTOF/t5VE3bD1iyWAdBaW3ZGLJJi+2azYd2hbh9KNC5+Fcqc0YpdMxQhh2YwehFhJTkfT1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRQDT2s8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5xtsq9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRQDT2s8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5xtsq9e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CBaa2978758
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ii3L1jttNaTw9r5h11TG7kldFXqku4MVlQgGYfWZH7w=; b=IRQDT2s8K6yjg8na
	CMs4jkUXTsBg4xaZwFaUlUSbhvaLVnZr2fY+XMhZyEpXfzl9muzgiFPcOAgtENPu
	atueaZDKTISTHGA2V7w2Dnj7rV587GOFzlbrS0MhC4iJiHnJ2FOJZinmQJV1MbsN
	z4nga9x8FH6sgEwDz72JRVg/JRRMDZdNrxBMsiXIH/67y5YZG2aHmk7B61LIoOEQ
	wzkqcYfNqUwAnPrh+iObhDd50IHA/QFaZ6Cl6aRFSa/rpTd91O32K3Jw3D1I/XRs
	OLpLCcZnGeiW5tdXkfb5cugk0DaX86Oc0OOt2RRI/Rqx02cTyCOHvj+IvJk84xw+
	JnZ/Lw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2syjv7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:03:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso11061635ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841393; x=1786446193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii3L1jttNaTw9r5h11TG7kldFXqku4MVlQgGYfWZH7w=;
        b=P5xtsq9eHTDJNSLajRgt6qG7aHdsMLyCmxDCBDlHHr1gLdkUDnaF4clPzAEm5/zaal
         wgRX3e9E0dOLj8q4HuHopcUEQfygVbUj67JWRaOw7fKAiBkUMuVZD1KZlaY5jxDLC0+A
         wQbGunjzDaSqAWh0qDawuyzb+yoMsgLgQCPNZrf67YD+ntD6vLnW4bwlHrGjvOgbqS4e
         WOO86/l1NKjNT/ZEePtRDI2VkjKsSg0dp6RRKs5GbkPuYsg1OnSKPl1urTIifRBtGZ0n
         G+D9+GwZcaHw63BS9zdxJeHbt/lRp4CIUtf8dzJ8Ic+jGICsNdEQEuWfGNfzFa9YFbFI
         G4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841393; x=1786446193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ii3L1jttNaTw9r5h11TG7kldFXqku4MVlQgGYfWZH7w=;
        b=TrbGXM3tTwOWXO3n3SDPFd5ZS3iZjAN2V1TfpMsxHm19OL5nl3aoUzijpLHC0inu5K
         KaRkzYkscScHt3iveIDrVOy7Cw2xMD9nX//6xpUa4H7RBF4DtYslCwGFvCudIQ9bHROp
         Zqdb9zxA7/+e3c1QgjlckcO5UkAzdj/l9yB7+zRDPySNhqWa4+om9b1PNOQ+y2ThfC36
         0jK+Ri/jehY+fBIVQ2PU/0Y/IabGEEDUzjL9wVtdP6QaycBYvteWlyfTf7fSdDKAXQzz
         J6WAQseZH+U8pBuNhKI9KIgw9dmxUaqkwW46Vp6FkQIUy9tWUzdZe/mtoeJ8KmO69Gq/
         7yyg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Akz9LInL5owB8XBnVJjYEG47DoEneO3TUn2xSLfK9MJuERKbw0zWRrA9DqyZvy9YZI6vFdp6V/muZ6Nq@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxVepaDv2O5qAFT1952qAndgzT86OFbwJidAochw2G/X6Jl4w
	hcm/O8UdpPtXOAn9KE2h9pTRwMhq4gY4byJpdnwbH95Zk1pq9oKvlp/qvIiDYCjiOEMFMRXfwRR
	KdJVCcKIPR2u/JXGyO5FOQnXwHddfwQfPv8MFkmibzkcbD+b68RDmLcp42wI5um9+aJyF
X-Gm-Gg: AR+sD10PXgvico9fYMv7KHTHsrqQDrfUhWe6hlFvpHxwk/gp7iDmGDTEq+q11z0h4dL
	8kYElPKQWbFHlyL/38yjGpgAQj0C3JXlLxnt9rpHxHPG8epjodX22hb7onCceKAbtpHBGMkWrJH
	39d2YQ3a7qIg3LQr0nuHcU6/Qm8dChJodEfIvsJiQsiCiSFGS4p0A5C2hrUiozQDLl6xVA+D34E
	dXOEXtKZ1JEOq8a3JDmmkMQCTivvt9ORn768HOFjKeaNCkzN8o6xqV+BHHbiZHLGNQt7uoXTZQb
	R0H/s6yWr0yMxNBg87cRSbSEqAvPi0vbVdveqsYbOh7ScTP9xcwnv+zqwBPygkCM6h+7leuaZTx
	TDwNGDSUOxDo/urK+tVYVvnty2Wzzyz40pnVzJgf+H7E0ZMcoBF8NnT42pyA/wWYjFg==
X-Received: by 2002:a17:903:4b4c:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2d0524eb7f9mr133254205ad.41.1785841392888;
        Tue, 04 Aug 2026 04:03:12 -0700 (PDT)
X-Received: by 2002:a17:903:4b4c:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2d0524eb7f9mr133253725ad.41.1785841392461;
        Tue, 04 Aug 2026 04:03:12 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa492772sm4979595ad.42.2026.08.04.04.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:03:10 -0700 (PDT)
Message-ID: <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 19:03:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260803091003.15285-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71c6f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=DPF5wdA_JBoVcR1QEgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX1kQfSZ05j+57
 OxUXNrsFLSK7xTOloxJDK/wKxRsi+taRP/TmaGnHlDMp62LNoM6R/qUUB31dChEaLMtBIS1bnQn
 73qTxqa9r/2EZN6ODR/l2p+0k/iI8ig=
X-Proofpoint-ORIG-GUID: G_u-bt-kMUZ7dH9Dsfag09mtRMdW1u_E
X-Proofpoint-GUID: G_u-bt-kMUZ7dH9Dsfag09mtRMdW1u_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfXyF6hAsLVCHcB
 BcbXu5s8B3OEVSPybk8Mi+ioxs7Udm6xBgwI/QcNAt6ypr46noe73VOhLux6XMrha82E1P5wjua
 x7BIjqBq/bHwtURb4ohjjb9aiz0ssUJo+dyoJhEDJ1Zze9B/42yfnXKT+GhlHxz0xkIU/vUQX7r
 /n0swED/iydpew5vslvbveES2NbfwwCEfBRYcjDrT09P3oVFt+chG2OrioHsNkW1ZaNbuY8IAUC
 JqwtDrS4yk7LNWnaU9wc0h9mmGFGGDlVp5EZ2EUP1XrzN2lMPiPKmsAzRgYXqdDA+EhIbGNkULc
 Gww4IuYKhlt+4RB3hQy8prdJve08buryZsgYnQl/0/nI8hv5D3yohf1sq/lCT0kX51+zJeqgNSE
 MG79acuwAApYQQgRSEEHNzl1czHCtt6GOUuIcCqDAOJ6R2a8c9S4Zo54WfGu81FE6W7z+hZvg+H
 9prItRARo3QtZ+qL8NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040087



On 8/3/2026 5:10 PM, Stanislaw Pal wrote:
>> The CMN PLL AHB/SYS clocks will remain enabled as long as a downstream
>> consumer of the CMN PLL clocks is active — this behaviour was confirmed
>> experimentally on the IPQ9574 platform as example.
> That is exactly the mechanism - and it is exactly what IPQ5018 does not
> have. On IPQ9574 the nsscc node consumes the CMN PLL outputs in DT:
> 
>   ipq9574.dtsi:
>     nsscc: clock-controller@39b00000 {
>         clocks = <&xo_board_clk>,
>                  <&cmn_pll NSS_1200MHZ_CLK>,
>                  <&cmn_pll PPE_353MHZ_CLK>, ...
> 
> so the device link holds the supplier active, which is what your
> insmod/devmem experiment shows.
> 
> On IPQ5018 there is no such consumer: nothing in ipq5018.dtsi references
> any cmn_pll output clock - the only occurrences of the phandle are the
> provider node itself and its own assigned-clocks. The actual users of
> the CMN outputs on this SoC (the internal GE PHY and the uniphy blocks)
> take them directly in hardware, with no DT linkage, so no device link
> ever holds the provider active. A few ms after probe the autosuspend
> gates the AHB/SYS clocks, and the box dies on the next bus access -
> which is the measured behaviour the patch description quotes.

The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
continue to operate correctly at the fixed rates even when the AHB
and SYS clocks are disabled. Therefore, once the CMN PLL module is
loaded, its output clocks are expected to operate at the correct
frequencies.

The downstream consumer is used to keep the AHB and SYS clocks enabled,
allowing the CMN PLL registers to be accessed.
