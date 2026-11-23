Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445098;
	b=nXN2tCxOFcaAgXRORnh9JD0XzIWLi52GGthM682xcuqjI1OLnkEkIHCfgbvWLfiYM+yv
	 DJXUyJWmORLtVONWZXiwJaZ5qp8OsJ8DKxkAyt1DFO3Gvx0Q4aVAsYcvuk7asF6ERBDun
	 +jVTB/ZvnT8K7m/ZsCzkNX5gJPS15O1DLgbZXYqXaI5qFul6/EbFOxaTDq4gfYM8+UE0p
	 K9dh5aB5qLwRXPhJqKshMxeUjhWLm+yTN8Vk3knHRVWyE+DFu22o9SGGzh6L/RTWVxsKO
	 /LQupgwWA3Yt8E6FxlEI+oNHmnM7ZoSO7igvFohk0JgOuieMksmKBxBWHL2yivYMUJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
	b=GvjG6/rTSHs4oC6WX3NNmFrI4Ck8DPEOndHbmwMXGKYslSG9tWUP0/SIlaLdsELF3vAr
	 A9hK3acVaUDUgKNeMi3s44Bwf8N0FLBHPUcPfsSQvRkIdiw07OYplXPS6lqzRgZDRQ4CF
	 U7hGD22qvDsOuhhkw/rTQ7iZrm4jMDXQJPxIaA7Mtx7p/vdPPWIRRXxQaQ0ROQWaLC/mt
	 cN8Rc6OK5zSjT2kw1hhTSwUtPQ1xevA6K1Q55HjP1JwJlmIZLiOEGMgDioZvuoG/WTt+k
	 /C8DE/S5BfOE9b0P5oxImUwr0doHSjhPfcOHYoDtEx8OTyiwq0TgTS61jSbKhk83kjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C398606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C398606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEmi4030401
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=; b=eaZOWP70t09Rj07+
	cPJieXBnlKsehB+GrJAydZDT4+PLIYK5pwuW2r5gNJH0Ojd7pEgMs9r1m7UJdBwM
	7zQKYMmWL5kxVdZlZToJgb7EbSrJo+bICo+4pzanjkiC32c6sBdLCP0QpHDvY6o7
	2N3LRchjol5Kcyj9VoiTImB5GCC9sG44+izkryoUavpx5ETRmQ8hsqXj0PFeoFPE
	VVs3eVVE4trvEH/2pNWN68ptXYzHit7ybHQ9WjKMfQry0Hl+hcfvNyem1wBUiSP8
	j+93DPws1QuTtVdpd1VoOT/++TZwI6m4sUIepZrJmTbemGkiwsq21zFG4MnOuAvU
	ZL8I+w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj2t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5569529b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445095; cv=none;
        d=google.com; s=arc-20260327;
        b=inaKpMYewPDmI65Qd2LanY6Vf7t68LzkqMuInYloOgnLI62nVUWc6jKP4D/l96EbaV
         y5TJXRt9gw81AeMd1YyackCTmDoVfuysBiqrM77fbl4QFhd6kNqqaxaNOZlcAD9M/xCg
         nq4CZQ+LHFQqvYDIYdh3J5o6xGQTA4wGP10psXBQNw+1aaWug+tL3t++Nne6oiIL8G6v
         3C1aMvvWM2NHrrK5Q4KZrwgVsNr6alQdJuQkNlJN5QzYVpyE5OJTMTk3d0cZATrFSk7r
         L6ES5B666zMXMI3QLkzWXsk4zAFAxDXJ49Y9aK84dXwXjI920dkPfEa1xSXCldDQI/gs
         YO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        fh=D6mRnPlmiTBF5uG+oEf/cLqqHPsr6WD2MoTnmTArIzo=;
        b=ZwYeamAxhT4+sX/lqkz++Z9kz2ew2K+0gcU7ctPdV6jDinaQ9hl6LfbgVnT5toXPcR
         OWbIViXea/bokaehco06B/gKPF/+njEXU83ydxLwI2y5RYfQBWAI+8J60HFeeP65/cHX
         9ObGa8j5JShQNK2Fp0zvu5tsYKOJFFF3pHjh32nQCanwfy6d567ouxFksfH/qkYgt7GD
         9nKXHviaAOxXa62hpKzUcSrVEP5plEz/bnRAhrKoNGuTYYx5vJF6wwkVzgXXGAMT3i1w
         Pvk3OuMiPhErm8qiQUdHNqAb/jnImi0qAYY1n2xU4zjz7cDGGHLs8xVhfPagoSpioTO+
         Onzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445095; x=1796049895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=IdaadmqPxlrWInEksHGTbMHQw+6cBlh1Ikp0dHsSCrliSqatwldTV7brzaR61dmqKg
         iTsH0WcKNbfqHa9/RMhyk5JAvXhN26AKkI2aCRXGSHTXTAXnQCAaKv4wwvY5zyZYQH9M
         3Av+Dlg6ItpjDuBdmcatiEj2bxGjQUqzCedAxmsC/PBPjBkB+JCg/Nt9MAlg37HYym2P
         6bz9XGYBnwEiPJ2b2lFsi/m1C3VcxkoLdxrgb3vAgBrfPEKfDDKMDdyUZaN9altdouBu
         IOeCGzmX0UIvlwVKLU2GVkdYOhfiDPj1tNsAiv7CoYOMzBgbM/LIg29fUU0Eh52aA64L
         NUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445095; x=1796049895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=FoU81lKobJolHOh7+lgKIh05LypJaeQDXQb8zo1yHD3zpxuhfrTVv6RVnhC+TM3Asv
         IM6HdKanzCZZjTMOsPtqa0bXrfXo8LmrsaxcjYjKlFrxcPlv/KlhBMnahzJlyv5JT6u1
         RIQKF86VZrvB7ATf/2YSk+RW9gM+QevEtM4LA9mzmH9KyzD7mzO6BG9H2fqKDsktNmeF
         bynRk9uDmA8KMrBVa2+KJvRuAQhAh1oTtOcOKiohFe1P0fxO3WAQVRXWbTVCjlT2Pb8A
         bKZTT/PqjFUcy5pvdJ9XtP0q82sbUDJSTv4u9aUbuObaZH6YJ45+YUcxFWFvHV7UOw3M
         dApw==
X-Forwarded-Encrypted: i=1; AL+hErFJAP6fEi8LuWIysd0ulcBNCextBQEizMqJ9ZHyGDtUfFkSowFhOVrlraTvVSEtmwmx7HQA7ioN/F96Nrdr@vger.kernel.org
X-Gm-Message-State: APuU4Z9iTm8lQouez2lfUHn37Hf1NhPjHOGCWEL7p1CkOHiXwsaX/Rio
	QrIgxjBMNoxptdRJWOIdl7zYRjD12ZBxTaaroRRL3qp+wmuBBbB64TlPZt9eICpii9lUqRFzZ2Q
	0YRXRBj4dt2W8eZoz+bF0sIBBN0u/SPzG1wckXyDCVGkLdrJTd93pdJLuvyPSq9EWkji9Wcqduw
	mEaZFRXs5eyHsL9259RzzPHDtV1GgY4h4q7G8ig7aJSsE=
X-Gm-Gg: AZFdTZfmkWg0Of2AoBy7syiTievaks5NDeFoxME9HZbWaIwT32tgEiQJEMMzjOTrFI3
	zrpacMIyyICS5VjXgdKWmZAPtsmNQF9x7Ne8UF615lXyx3qTP/bk0YSObfDQmLka1bGmWQ8uckJ
	4O0eWUDaWNCxjdYou28A0Isnbes3oW1ZePitm+cJRykWjjEVZESCRVrAaTfOaeGSTXEDkWKUesR
	tHo3nxnZDlgpmul
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr9837962b3a.48.1795445095405;
        Mon, 23 Nov 2026 06:44:55 -0800 (PST)
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id
 d2e1a72fcca58-8c87cc450e4mr9837944b3a.48.1795445094856; Mon, 23 Nov 2026
 06:44:54 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll> <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
 <20261123-humble-native-ibex-7d2f72@quoll>
In-Reply-To: <20261123-humble-native-ibex-7d2f72@quoll>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:44:43 +0100
X-Gm-Features: Aa3M54pEpZ40tQjszZMv2Cjc9ZKJszGaoEabHp-a4xi-MEaol4PsN--f8rv57Hc
Message-ID: <CAPx+jO-e337v234_wF5QKDf5YJaEZE1-+_Mo5=Y9BfwuG+29_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b045168 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I1gXTs31tpYBTtf-1f4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Imv34_rh4Omh09KGqUNmGPuIfA7o-ur6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXwfslk+MYj6OA
 +9QxFXf3qyt3VYOyt3cblbfVnwH//QP4hCHbvHUCpOYHtCJ7d9GZKcCFABUi+ul2JSXaAejolgL
 njqtDEJnk7nTEmrYgocwoIgPU54obPsuKdFZQLZDncJIXYBiRcBxI8buPtJXz20c+SoFcO3/8E7
 Ez9T2yM9NSnVwRTUBziO06CHLr6RdwwDfr4mSvlngNNxm9aaoU2DsNGZ4ByxdA92HodiCNuQM7v
 dtzk8PbhcR8UZYxHMr1lxNDQFENPlU1ZKpxmF8ILqWlBWoF064+0v0qUvrzZuM0dRoStX578Ojc
 R5TFqRDli4o+3pShWNiQxOsxgzNJ2GPnKeL/FvDKAIzvstxFqfx7SjAA4NI9qXEDaO7gasIHA/g
 hrp6ZbfUmEBfBqukkykFvksPp2LlmQ/B0uavrY0o432fS3AmTzJW19RFGs8q00IeLKEYTIqQKWI
 CHu/K6eL/ndRPJbLEAg==
X-Proofpoint-GUID: Imv34_rh4Omh09KGqUNmGPuIfA7o-ur6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX89rJrnJk5+0c
 YrQ2YLtUl9aJPKlhN7/9tAoeFRuygGKHweAfwQ0gV9g3KYTE/7a6IpZpVSdLCxJqV0/Pr5QCfDY
 oFHI9MH1ABAdxgi8wTQZR8/IyhvF0VM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On Mon, Nov 23, 2026 at 9:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 17, 2026 at 10:34:52AM +0530, Maulik Shah wrote:
> >
> >
> > On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
> > >> Some domain idle states require system-wide coordination and are not
> > >> applicable while the platform is up and running.
> > > You repeated the property description. Say something more. Why they a=
re
> > > not applicable when platform is running? So if not running, when are
> > > they applicable? Why?
> >
> > On certain platforms CPU subsystem deepest idle state requires co-ordin=
ation with SAIL subsystem
> > such that both must be powered down in coordinated sequence. During wak=
eup SAIL subsystem must
> > be powered up before CPU can resume. The wakeup can take a second or mo=
re.
> >
> > Selecting this state during opportunistic CPU idle can therefore cause =
substantial wakeup delays and
> > repeatedly interrupt SAIL operation whenever the CPUs become idle.
>
> The idle state latency times define that. No need for a new property.

Unfortunately they don't. The extended coordination that is needed in
the FW to reach these states has nothing to do with latency.

We simply can't reach these states unless the entire system becomes
suspended. From the PSCI point of view this can be compared with the
PSCI SYSTEM SUSPEND call, that we use for suspend-to-ram.

If a "system state" would be voted for from cpuidle in runtime and
when using PSCI OSI mode, the FW would always return an error code. In
PSCI PC mode, the FW would typically downgrade the vote and pick a
shallower state.

In regards to ACPI, this can be compared with the S-states.

Please have a look at the discussion [1] I had with Sudeep around this
to get more details.

That said, I will work with Maulik to clarify this. Seems like we
could improve the commit message and the description of the property a
bit more.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261005-s2idle_state-v1-2-3c402c66f388@oss.qua=
lcomm.com/
