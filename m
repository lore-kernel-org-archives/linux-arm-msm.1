Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028513;
	b=Abphr8Y9eO8XjTZ6UOPSWf2qdAVT4Z2MJAwCY2eBuQVbCM2PDMe8emND3FUd62jTCB1J
	 rgK54aMpeyg6ZVG34O8fOQYNmcaFbDDDiNEx474qsELCpVLEZg1q0tLJrECFu2d0mrPnn
	 a4+/x7T774JD1y1GMzLe97d36XR7DYsVLdkntecedhVxYRk/A9mqIafNEOAJ8QKivZS2b
	 TLrcoK7uSuiS2sExQaj9rZmETAfLlgOhAfL7t32jox1G2A0eNiRV9eibwNnduHSjIEyxs
	 iR23CXaQI2quPmaHmLT/vTRi6WEMWWGN1HZcR7EN9VyDZfWYZYt53CaBRPzNt923UlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
	b=j+tJjLMPh7A1PaXDzRgEYh05d24ub0KceXEr9nwfr963p2DqJ2LsLoLnhHkyCWXzcveo
	 FsUpGshkRofF/EGg9V1ORePrtwq466Z25MYCnVRJnCMI3U8KePzQyTD0x07Zw3XaDwsG1
	 M/rP2Oiqt6P8xigs0KSLtep6vDcQJ6c9CRlhw6IJsKQaH0MQ2YeHYrlMnXf72RNvgDiQ7
	 az3OnbYbucgt5F3eqJu2prKJVJFke6Ndfmw+57lWJ6p7iLj3XcTMuYF2gVvzM3SHL4k0T
	 Gmh6qUlcizr4d0Dse/Bc8uh3n4PtUadNDC73yJ2j0ynhgS9yrezdRUyhRSakYfLaNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A954606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A954606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvtR43567341
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=; b=MnoYhO3Hq9ye7d3n
	I70bVPkJMUXaLd4BchJS6wdZIeo5uumbSB7Ayb2MbMTuWjBKETyLP0iTxmEuvQs3
	FUe9MEZHyQT6ySivib1zo5jcl/hpYCLLs5JpY2KLPXp3zsE7Zo2M1Tw/z/6ygo+b
	RjuRgGr9HhstP9vEPnuVuXn4xG6FEZAsc6ALW/Bh2hQkDSRQDc0JfN/Fxbm/Tf7e
	LXVAw9sjVBDhAjcy+gDYi84cpec+dvIe3fljak7hGhoyghbdMIEj1DAtaQxDbbVL
	+tN5EnQNrdk86SG8RCYEU+14qxO2mUo/w6XmoBAGYPDbhjGRz9B2Oq0oFwydo2hg
	d7+Bfw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y13dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:28:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso132916137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028511; x=1793633311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=fk21S328HViUZqIffDGbZjQ54kRTT/OM/R4uX9wXY6oTeE9si3orwptS2C7Qhq90gG
         SU1y/IREdSnmJnmccxb9WZzrOOz6iTmgIbXSF+NnFbTEcX/vwpgQLSnyBzHeEQjw85PV
         LDrwUPvoN37dNbo8BctMcFb5NTlrbzbxG9eIF6rfNHKVr+9YFwJr0Uh0Acuj32vBgZ6/
         sA2ODRFc/a7+EbLiGxNTYAoatKcqoLKSP3KkrTo8luqDaQM0gpq/G3LY5xu/dYnGLKcd
         6hdyzb0GC5q9dFjKm3J2ozBnpr80E4R0lcxjU+HBRPjuvJo2YkyPYPe7RGLel9HZDfZ8
         Sbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028511; x=1793633311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=x6YZaYyQlTHvfLfhvk5Z/Biys/1AwhgaUP0fnbdOWj0VKsONju38QQ5Cr3tYnmtrsB
         tAKGf72TKKhe6pOF2yWwPSvWNy6T5IHfcnVb+Dwbqj0MmNXiyJc1MZNjUYeFVG2yiwP1
         kP22YbewGDDUoiWKiuIfNPwIu49Svaaykkc17IlgHgeM3Sw+KujI5KyXK8Q6oLODw/WR
         w3+Jod5fA9pPEpLYb1U2F2zM9EeP0acPNOtU5tqgWS+/LRLzgQIEJGUmQAqvDY4+QmyJ
         qs+ezhIaMTbeQ/lydKKO9tajcXa1HXP7HAykP0JVJrDa2IRrH01rnqljLFlyUf0rXR9f
         dm5A==
X-Forwarded-Encrypted: i=1; AKwUvByu3r+HwbfYP5lHzHGwgDd3yzPgIqItkqE+CdueuL4ah1nr1bLnNToZ5njBgAusLL52/x6MrxkxDL0MHMe2@vger.kernel.org
X-Gm-Message-State: AFq9FYI/TtX4QvrboWWwW8J0BNSI0ToSZtFziHc56emanxL4vDDjgp4z
	6fiTuw0ZhGq4zDcZO6OSc7k6XMMabu1i8FlsiEOBvAJ0pgHQqK36NpPcdWSzdWRGdbGwfdHdgjt
	PMwwuB+Pny+9BPkpfRvUps9TmDOVOkoU0TuVZBISFFJrzWC/jH/wvY7U2movB3fojRDwG
X-Gm-Gg: AYBFou14F6bY37h27/Qt2cRRZZD5nAMdZSfMFxIhuqz0+t/8FlqKiNJGjOpD2ibrqvg
	J1IT4QA3M4uatmHstM+7Rn2eEUmwsE2W5KqfaZN05UCj+etqVWhdbv+o5fb6yXULrn1SeTvXb6d
	xVC9obdqqjrpl2fSndW/qtqflkxh6DsAtm8L0N2zslsK2pnM2+glRXwP7qHz/Kip4M5c1iW3VfV
	Xz48m0+p9+HkgoCX/vTiEXA61tMpBlWijRc+bOIPQTD6oeJFaUwfM7Y6ool8nH1XuxFBZnMQyht
	tS//DyJXNz0Fz94xzuJVbNPuAhZ5a97iiUbTiKZ9TrgGEinU0NNEJ/DXPNCSHv7fQ+UXvuEclFp
	JbFdlloLqpPpqGO6wTKwnKQ==
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107148e0c.5.1793028511374;
        Mon, 26 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107120e0c.5.1793028510938;
        Mon, 26 Oct 2026 08:28:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm334450866b.17.2026.10.26.08.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:28:29 -0700 (PDT)
Message-ID: <652f45a3-8af3-4460-a081-30f67bee400a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:28:27 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: enlarge
 reserved_mem1
To: Roman Linev <admin@mswin.me>, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        barnabas.czeman@mainlining.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
 <20260824155535.335494-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXwAcLHg+bJ5KZ
 O3NDEekfQj8MNDzEu3Ccvpvbhprkaiyqbme9Tyin3LqjaYAqPkuLFQOhQpaa7ezBakp93exJqgF
 z8qAkTFxwTpm0oU/ffL7q/hH3MGk40g=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf71a0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p94XzNcQMd10UbPFJ04A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX2PtUJtL8dbxn
 +Q16igUlygoDuA2WiuCcVcyjZc3b5zKVzygz17m81jZ10UB44j8hTjs5SV27HFOnyQGIB/Y2lg9
 0mhhiQ48rxLaSV0ZL1lyOUg25E0NoIjzjUylu/udWZuOzSlfOBAbMyNbN6XZ99dj/KmUjoQZPAb
 qZQcUE0CcIgzhqoEThEZ7lFMOBG6RvEgTLrESefbXA5ihtMZ8EBBqIxIXOg/JByTwoVebH3sDOs
 76h0g2HXxPXREqkJoj6HE/RLWlHMNX6K77wSRnX6iu62mGsPgvsRPRU9uvyZ45wla1ZsnXLJXsi
 uFOFqbu27yMIwdgBem8HG72QlYZ3tlIkmJKv2MPYKbHdgv7gsb7fyAeuuqz3xVzeAiSAirnEwT8
 0ctI9X1KJgmako1NJV1nyBesrnmWrwdiUvyNyPDyW8KZpbj3yg7LaJ1gj/2YM8/3GpfJxtT7Pmg
 Ef8apGB1lDAwTir9Xcg==
X-Proofpoint-GUID: VWaRRSbBvtpeUt3LXdfkpz9bGkKYxhnO
X-Proofpoint-ORIG-GUID: VWaRRSbBvtpeUt3LXdfkpz9bGkKYxhnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 8/24/26 5:55 PM, Roman Linev wrote:
> sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it
> ends at 0x48f00000. On laurel-sprout the firmware owns more than that:
> the downstream device tree describes the same base as

[...]

> +/*
> + * The firmware carveout at this base is larger on this device than the
> + * SoC dtsi assumes: downstream laurel_sprout describes it as
> + * removed_region@46200000 with a size of 0x4900000, ending exactly where
> + * camera_mem begins. The 28 MiB past the dtsi's 0x2d00000 is not the
> + * kernel's to allocate, and handing it to the buddy allocator wedges the
> + * machine under memory pressure.
> + */
> +&reserved_mem1 {
> +	reg = <0x0 0x46200000 0x0 0x4900000>;
> +};

Please update the common DTSI, it matches the reference fw map
and I'm very surprised the sony phone didn't crash without
that reservation

Konrad
