Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099714;
	b=EbVayJL1jYc/aTUiC9uyhKU6Yz+jdTzhuWDvr2OFXxP1Hww/kNDBZrE8EvvJyGOTY0yY
	 Xvfw9wVnbMYImUPUnHGgTsz48KnJAwGeSrBD9IpHkFWMxYK72BRW99i3AlVLVjPRY7bnD
	 rGO/dnx/+qWPIhpW/XzGI06f0h5jQIR4uFq0KPzpcXmV370p07ZPVRocpXzJtVuYEV0cV
	 Neg9gn4KewEZIIIMfFrx3XDfFvl3B6RlLRo2H4bhGLOrQOEEcyj8/AAxskXHlfa73RL9D
	 dZ4MIMCjEi3/bwam9gMcIPajUZNJWrl1XFqq8JL20KP8UZSfvpWkH8wiB8kxbRQjvJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
	b=Vh0OPnzeeh7bTG08+a75ZZzPmMpsReuqWlxvWrODLpX/txBa1VeMiLfuV6n3G1MztR8/
	 0N2UepyGanZQMqaQGFY9ZzGZhZ6uCv/4hVlM+GoFKWh3EVg4cRCREyvk+qYWZ9IvmiI/C
	 NDrzjcgcfDY9mLwiqyHrm13KyWMk6O71tY+iKIKn6bpOe4hHkvfl1+imb4gfjzhsYW0NB
	 chibwDm1r8Ss0HuZCBty5Gcip/mOKQGEbSzMN53ivfaH3RSe+YGgpQ3RX18VyAGch5wr/
	 o5ZI4ebVNyhJljeDxc3i51+4vhcXvuKakQotD3YTXVSWzNoC/c0cRNlvXt9o9MQCMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCNIqZNz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F08606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F08606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCNIqZNz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2jg1973857
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=; b=dC26IiSeUN59GFJo
	RQx8oyqKnkOoM5IaASm3NFGndcZBXQvyMcM3uKDSxqjVbTNnDEb3ssNNdiAF3Frn
	An/0XYKg5r2a53M1+gWpBXgKmmXv6hOA9UrY/lLXWWZuNszv8KsNBkMq+jC8jVfG
	VvSDqQobri9ti/7TgmT2vkkK9su3XGGziJ3o0Me4cG9I7PyuK2EsCpYc6Gd+zW5i
	3lwcWKa6c2dJL+ZbzcKMy1fztEha12NosOv4mCnNrlziXsUSaPXxjtyBLTwM6IN8
	apARx7ayk4qAUvQjKEBp0acX0+ZT006B33M87ANpr9JqzI7TtnA14Ni3Tj1Dwyf9
	/l9Osw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g8vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso13851061cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099702; x=1793704502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=aCNIqZNzGZgyeygmqjLI27hNhk+HRj+e0nxWWqwW/JpBz3rFkk2wZBsTrAGIQnYB+j
         ukubQSis/t+NN3DyDMrO9wM3ZZY8Xt0Vtvmpn//a5NrAuHGBKYo3QKq9EIy+lKXiJFtD
         24kSWq+4y5kgEKIav2JCp840d4fs10VBzyZFE8jAlINh/7YqBW55Q4DCgkFCPPpFZyEQ
         UxQCpyflU00gZQxr3F6Tzf74JgPdSGwnSvAbpZDhbGd6CS0QUQGtbQwLS/OFaM2AZcWi
         WKOvwfnX6V3e3y2zVZixGCUoqMwz6gPNsHJDkoDrcxOX2hGaH2pQn4YVXaYqj8mto/BT
         WoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099702; x=1793704502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=Vem7P/t2MrORkrotjGkNdIOmtGrbn591eNAAIorQ7pWbL5WU1Jre8D5jdARapmFXle
         sgXctR1l4fkpqwKzf8gItmaWX5FH799ppEOA4QR+v1K5zHKMLlAWV++9dj81atV9wwSJ
         3W5XxFjsDgYI8v8R6go3Tc2I3xzGzzlmWeNr7rDY04FF2US7g+WfExt53BNY8gp5Vc3d
         zXHPpjdCzRyS92HtEFb5gntCc0iwig/TYAueyp23XdQcXyDEdvQbAaqSVKoHzW2P/XTr
         lA3uTZHVcWdlXfF6A9oU+6SO77Dkzl0wERqC4SMyM7rAUsfkcQZLlV8sWTtwD6tAGOHg
         mlRg==
X-Forwarded-Encrypted: i=1; AKwUvBxInJaE9SxBknmsIVfN82C+A3psKI+Pz6KxeKzMWCZV73wIkTowZIKxs7+9tIobH6TJlsbEEie3i45c+wVo@vger.kernel.org
X-Gm-Message-State: AFq9FYLnDfznHXcUVgWSN/q/N7Z60P9yFJEPvVBi0y3fH6xnJrLLyQV0
	mjMoN+BpDdyevt5ri8cbbeLsbuLxdYGCCAxFiU++R5ezRRFFUKNAq+0ZuAZdqmwom1OWnFCcGeE
	UXQltWullUlpuB3rMB6gCEr64Kmw/KIuLmLQ1D6L+4Rcz4VOf212wOVekAfzBOViKX+tp
X-Gm-Gg: AYBFou00/MKB5DOOS+E6WqGxw//U+qGwozGerBX06tQVKM9Q1cCOZ3QuvDRg7INu8g2
	XIhKNXe7kbeekhb167tzlOeQRX1V/FRGomYQXpwpYxQEbBlJAjSNJJ3gFfdgepMJQm0MqC+Efgf
	KAFv/hvWrRI/NKgz8xXABHmRkAFHt2iQxHXGP802BQg20Kb8tOctdmjuxvVImROqvhBpzrXZGf4
	B5xhGZf+AEElBue+M6VYifovcO5uVNeHxy4Gnw+2pmh3AOsyGEastsX78TREr9ym4YWogkLiUFm
	Ypp2LzjMIPWIIBBbiOlZICsvrCxp6No/GT8IZ21FyHNeevDMD5zElQjEx3jkjdxj00uAx1BVdmj
	UgzgxpPM2NekTvZZaWpLhyhcinrTtHM1USKWCqPVy5o9Xu4LsNSP2w9VyqSBda2jvfd4blII=
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112252385a.5.1793099702612;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112248085a.5.1793099702115;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e99a2sm436376166b.24.2026.10.27.04.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:15:01 -0700 (PDT)
Message-ID: <c935cf4b-04de-438d-9049-7126fd82521a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:14:58 +0100
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
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
 <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
 <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae087b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=VFv3GnuNtnl0mo3CAFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UEL3f-Yb1YwfKgeCSiF0f4eTX1u_Hzo6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX6w/7KbmM4dDe
 12oIwJ6NBqNQdfnlhTQNeb5Dv/rusaIFoQO1Tj/HGznogwRdDPP0ZVeD7lkZmwrQYVFGdW7eIbN
 NnKAGnq7A18gnv2VAyc7OyTvVIXFoRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX+bWHAxX/AR3j
 YmiTcEFqHByjGREzEIZ5T/DHNJMaIDjaIx6FUxRUP0jpORvb97JWIfJeDZpEr9aU22VM5RjGvXD
 dq7PewUXjS2rJ7vvgdfq1iPIafABZsbdyCx5Nj3eLnTuItkSbb+10eYJNS1zs5TZNS9gFhSef+8
 WXQ87HTvxrNYvqICzeJHr1/OlxHTgGhVDImV+D0/pmzpdzltga9qbRZXDAAxUqjCHtH96wWve2M
 4l7NHog6As6MyxdUWAh77/Qb0EgR/QTYvpiuIhuMli35YSjfUdv9R4n8v/v0KUOf3OO3Vvetxay
 kxcaZ/rLPBsSAuuQZs8P8Bp8pPfGm/dBre3nnhtAZJcR18RTZRH5kIFx2RXVTQNzzS/1hRowQDz
 eh4X/pUTV6Grpi5qDEcsE9gqmxBTnESOeXWMHhQmqDFtf0QwVyhg3MbR46ubYoIjCjec0A6BioO
 KQUv49yfkT6EMqNFzOw==
X-Proofpoint-GUID: UEL3f-Yb1YwfKgeCSiF0f4eTX1u_Hzo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 10/27/26 10:54 AM, Vladimir Zapolskiy wrote:
> On 10/27/26 11:07, Loic Poulain wrote:
>> On Mon, Oct 26, 2026 at 11:39 PM Vladimir Zapolskiy <vz@kernel.org> wrote:

[...]

>>>> Is there a camss "top" register to describe here? e.g. to retrieve the
>>>> CAMSS hardware version.
>>>
>>> I'm not aware of anything like that. What is "CAMSS hardware version"?
>>>
>>> CAMSS embraces various blocks, there are CSID and VFE, full and lite
>>> IPs, and all these components do export their versions individually.
>>
>> I mean, CAMSS usually has a top-level register block (often top or
>> cpas_top) that contains the Titan/Spectra version information, along
>> with various global configuration and mux registers.
> 
> On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
> series), I believe you reference to it.
> 
> Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
> as a separate device/driver, like it was done with JPEG or CSIPHY?

"CPAS_TOP" is for all intents and purposes the same as "CAMSS_TOP".
CPAS is essentially a wrapper for "things in camss that aren't
subdevices=PHYs/IFEs/etc."

Konrad
