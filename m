Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575412;
	b=K52og1Q0Kd29sVcThWplIW0Vz0yunWsfsxYIQqlsbUKs1ocNkLkk+BPsS1fy0MFO0lva
	 zgl68GvRYOX42YTjt/HKFgJKCYSGrVI0QGtaiNToT+jMoPr078Bm53J4+EtPflDwKxMJI
	 0JSjPQSA1Aw4hIRJIQGrTM5jtDayatNLQV2uMvDSolq2LMJBsBM2bjAyextIot/6Y/Vyd
	 +L8eWlkhIk6rP4MQxOASHqCITQI67HkYu2fLHNXW8wFNRT2Pc3j3yCSoRRTF0Lv3QF3Aq
	 F/s6Np5JgTIaKlzSCTSyiSDl0WDkr5MmKpWZbP44WmGxgVYel1mxHMGOkhtzcv4FDfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
	b=FoBVptXpD+6q6b+/FLdmRwhNtDqsm+wHH6BcktRLm3zTYYcJEF2eqPs12/RQnJ5uIbY7
	 pmZWMh2eueKMTicS/7qELU3eseSMOoOI8g1t/uNxk+ZdQ0Dkd1IKqwseIUkwS7B9UUOya
	 CM+wz4egH7KGK2cG59Nu7q3ofhj7HM8Ed26WVu+H9cIdjRkzhglE0mqDQlgVDpSBNYvHM
	 l0cYeAWFeQRtNy1EW5YCdGHP6P3enD9PJdDJjCX9ymaiaUJFts6zDY6AVVyt9ODNnK/ux
	 lL5Uy1V2gBUrYGSeU1HzLgY2HrklEXAGn+ZfYj1uldFtJeStpXV0pNXMQIEJZ/ik4mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E56606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E56606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJQ2Z1525303
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=; b=SQZEuSZ7/wGLKUxh
	SZQafe4FKG169IlGo5w2z5LX2QhGIOIambc41mKtHex1LIldaOimJFyoDqEMriAd
	1fwZQnuIc8aTSa740MiCIvO9X0N5M0wCHPjDupl/80QPEMSOrkkzhosQHAviy5dc
	mFxZB8cYlzWfDg43f9HAaM8JWZnI5CppA1JmvN7rlCuwOj6x22NK0Hzysox6dfgN
	igJ45io14zaZwgQDWfPaxpRT5XbkhekdxvdvNJYSa8DLQKlZs8C3jAbNqhnLVTLQ
	R1kO3B/Sj7jr686oS1akO7kAS2ji0+1fMGEgtaYJyKc15Z91AdJgwyzHe3hGZe9p
	wv5euA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g20m1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so725602a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575410; cv=none;
        d=google.com; s=arc-20260327;
        b=AduQZlo66tzRL0TL1k2dgRK6gu6VAE0ceBBOJgN9eJ9SKgBiof6kqpSXiuV/cV8Xnu
         8tn119urpcUA+FPY1pRd30jd53gh35YzZnOqWylHNUDdzZq2BRh/g1yCBDcfdrQ+giyV
         0P9gKyp6yFEhrIeXcOFiFv7uRRH6/5WCQgd4TdLi/kIMf3cnQVCQ1Z7SIJXE56lPKOT6
         owgcxCGraAl6aynt+msPQD1+x31CuWV9W8O5QIGnZtuczUWmvWh9u2y4SuCbsI/nFNh4
         arzGOcmgUkbykvq01NVbLPJHNo86UC41TJoPI5wezSmi4Q1aUJIOKayuSe9FM6Lee99g
         eQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        fh=Cyl9941+Fkhvfuzexu+FXAYwxTtT0cvXQsOG8/oNCvY=;
        b=WXz6NcRHsDTeWMh5CEjYmrlCF0B5pjPCFndX1L9b1ZYcnLLEF34gvxnOzLF0UGm3TV
         XiHo+LIkjOxrULQWhdqrYC2+WDJ+tl+ETRmkds6i5HGkFPEIFatlzsAlI2LxSjuEYStj
         /MOeu46DtevAUsIXgZNdQT0CfRJ7KoyzOywXJu829MXDtx1OYIbJNPnYbBXKX2qQMoS0
         OFqBzfvD66wIHfaMhGESm08HB5N61LlmbZH6XlyyqonLtDi8egjim6Q53FSFxYkg9Ulm
         QCB3odqXFIcb2GPD+1PvQQMoJk5bVn5O6zf9JWZzFpR3pZkg+vA+V6il4rstrz6tlBv4
         gUEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575410; x=1795180210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=FHGCVubFmUzYHITtw/8v/jAj1vRj8VZZ7EFvT47bna43R8aeFAuUDykqPRR0lBo8ZN
         rAukflUV6vljEk10jmN4oQm6GdC2lYSW6cn1iCkKchMrS0+cm/xkNmx1kD7SoyCriMMt
         O8c3fl82wUS0BYwxQIq/06aQwFo1u+pvsGInk9VaDalb80yvuuB2GhOWYxWeIA0hHClB
         4zZLYyaF+UQXCIUx+H4qAFKYs/qfwOsz2gAJq6qEAiw4AVQJuwkSqnWs0c8o8HqLa8UA
         cPFIasqyb9vAPfFLZZm48xjmo7a9lUJ2MYF2RY6Kf1/4F8C2XEzfnfwe0nbzN9AXml3y
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575410; x=1795180210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=C15/GMyAMOjVwiQL6WfSlUwM3gqHaQq1AkbrzhT6zbRDCAt96KolSBc9AJs2KjRIKU
         y3uQulp9XS0HCS8U1XllqZB/9qaaJaJJUuKtuAOeCySXlwlkuX9MO2j2HH4r2WBW0UTp
         XYHTa/zVjjl6mggDXPkm0kqqLstz0VFBIfmfHebIbRzkubaN9igd4ah3XDD/S1uAWiBk
         dffqyqNahytFk8aIlX37am48//ku5ljQWndLghPndsDGRLj6wC3XLKrrGVx0A19hKsvp
         OQzIqqa07DhDCFwf0ILv2R2NOJ7uR24ip1Kh8SAtEUDfW5p14fZLXTzkx3MEigB01++n
         booA==
X-Forwarded-Encrypted: i=1; AL+hErHvuAr6kQJ41XE7j4bBnW7pNi6rNSAmFNmzWXB5sNccHNsQJGuMQSGVU1ZjM9ITIJWW1JS0+ndsJoa8VVSo@vger.kernel.org
X-Gm-Message-State: APuU4Z+dCzOOA8/3/yTvTxoUegzc0iBabJfbfV7Umydu4tevXhHLddi1
	NX5Ljd3kmoHqHU2YIABCJiZ9Hf09ywOuU2P8PdVOif52XLMHjrPA6o6u37vbt7TtFxsgmF8YGyx
	vnBD/wcK83j/R5rZuixFE1hnMBS8N3vLYW/tKYGpLEycyQZm1D96+ObbslOm4gIOpC65x2EIJnk
	rsqRUN2lZB8LkFsGdOZ4J7UJ3og7eQXg6AINbdw9gbwII=
X-Gm-Gg: AYBFou0NEecXAccbdG9tZuVMEf1TkPFyYgFUyoEu8+IlvOo0Ufr6fx6jOo9Nan1Vw6A
	R5A95lnZnBus3Pi5pGKQFWmeB4YfON2F/r9bjJGd5Gri936ObDaEM/UFMWmaGHyKUKza1lsPjE1
	L8iKGRFP3Sv8kEFjBaKa7yVEQ2TyPYbXCtC7Etb5OxTvQ=
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr1919427a91.52.1794575409663;
        Fri, 13 Nov 2026 05:10:09 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id
 98e67ed59e1d1-3b1b0b85d23mr1919378a91.52.1794575409140; Fri, 13 Nov 2026
 05:10:09 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:09:57 +0100
X-Gm-Features: AclHuK-XrooPPikBTcYU6ieoCi2hLf5EMDtx-gXhYpRfrFw3mVoiL0ydev7kJnM
Message-ID: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX5Uh4lZftJnfp
 c5Sao/tO3/Co0DFPzp6tY02lmOH8dHkPdRo+rgohp1oVmvbw8n9yV4TVXw73OJrzfeWz/9FcoxH
 ckOQAtUAl1CXwqaROYprd7ANgXJnKJji2MS6u3vkpom0t8dEBm/4/1P1E2XRx3oasG2bXYbXVR2
 69ngGbHzLkFWHTasv5MvnQ6WQxg6BaptTXxFLwa3C3T1pIr06WZhjlIRVChIcrmsMlXgt8WtScD
 s1myhs8Xu2T1a1iIWyEW6YusFsKW1jayhBQaIRLUxYMyYzoaxT3CkOqUGf+ZZNS/FIR+D6aHI0z
 5WexQQG+ZkCubAeTHXS65VbskqQ+NX6uwzT4IumJEfYDfUEblF9nQlqg2OruUHDPy6+tQ7qc+Yy
 OcwDXi9Y9bEJkL37vPUVjiAjC9JJWNLXtMkHijiFOPrLvF7JTNHEt6XuaPkM+U0s57TL2IEFhiW
 aNgJL8og2MOb3++Jk1g==
X-Proofpoint-ORIG-GUID: ozS9IIVm6dxjnmXqOg-4UQm11UQVxU7e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX9l2A060n3Gvq
 uLAXA3JkydkXowYEnI5yYL0A7GLEkHalQOOUID9z+bHP9M7utS5sy/eXA1yZMPLlNyHnXIPmg7e
 OiTLXCp+H3LcIo9Pbrc7HLbtr/FMe6o=
X-Proofpoint-GUID: ozS9IIVm6dxjnmXqOg-4UQm11UQVxU7e
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af70c32 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=E9o5ywDmFEx5B8TChakA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130052

+ Sudeep

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.
>
> PSCI provides no call to read back the current suspend mode, so the OS
> cannot tell which mode the firmware is operating in or why the switch
> is rejected.
>
> Add an optional flag that tells the OS not to issue
> PSCI_SET_SUSPEND_MODE on such firmware.

I think it would be nice to further clarify what's going on in the
PSCI FW. If I understand correctly, the only supported mode is the
PSCI OS-initiated mode, hence it's always running in this mode, right?

This is clearly a violation of the PSCI spec - and I guess updating
the FW isn't possible at this late state, or is it?

>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, rewrote the property description,
>  renamed the property]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 0d04389c81..2eee38d155 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,19 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>
> +  skip-suspend-mode-switch:

Maybe a more descriptive name can be found?

osi-mode-only or broken-suspend-mode-osi-only?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Do not issue PSCI_SET_SUSPEND_MODE.
> +
> +      Some firmware advertises support for OS-initiated mode but rejects
> +      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot re=
port
> +      the current mode, the OS cannot verify the state the firmware is i=
n.
> +
> +      This property is an assertion that the firmware works correctly wi=
thout
> +      a mode switch. This is a workaround for non-compliant firmware, on=
ly set
> +      it for devices that ship with firmware known to behave this way.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
>
> --
> 2.56.0
>

Kind regards
Uffe
