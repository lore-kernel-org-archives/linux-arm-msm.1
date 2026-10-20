Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504779;
	b=1ubmGL3d0gpTuAE4A0ThhRYCVZGt+9YF1r1TrlfW+l1pqYcXC8f0n+IA7rFfcdpe6rnZ
	 yy61lL+eQsS9oMlLxIL4y01vZFyYY9M5SNnJhdDWNwkbvygucHcB74vqZ4eChbpWT/HA7
	 lQIMIsSNeYRbH84uJoCG6fWcOuJlmYxCXVbNH0i2LSwB4W8qjE6OAZG6EuInmR/8tguR2
	 mRNcDeG5YJvuWky4Mwu6l/5qyvC0A6vXz3Baf1EiRjkyhI/bsD5eTmSVcgpCyaBdP0K0J
	 NBzPM2P0hmthE3y++YPjq5sCg4/ENxk9GaN0EnkyeqqFIZHh/dtDY06qHMCRUcOrnaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
	b=jYEkpeCngaLPmDyE36Jwlycbih4C6MIaTfcaP1AaozXgD6wYrVgUwIYbLBNUCJnjewGU
	 hI2qaSsTbeBSbLhbnqkqxRwjaqSawaPWHEtbDXs+I1ECY+idYGKeK7Gq6iPOXzmTcQL03
	 fwh9oPOATrekIk7jlc35HreKm1tchItUtPplyXLpP987TSOq147jolSpkmcgefUYAZsmp
	 MwbjKCO8ex0xg4zQNr6fkxQr7KDXECyRdoIvRik8BtAAyKKBmn6jHQ7NGF0Cq3Do1HwxY
	 Y2rCWJuSc/PfirV5iLZTTb+/whMy3wzO7mhzqT87+u/dohDan5fh2V1lKSbF+p6+CtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5B606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F5B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9pNZ1781302
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=; b=niUAHtj+Fdseix79
	i7hZEjPU6kpD5iwYP7SQicrMCrWop8ANv9ccdB+MAu4XMVLdi3vXj0FFqmrjAETa
	Bp4kSfk8l0gjsWkLgiNfMjq5sXejMfKVoJIcKzdGr7eRxo1SpE5JRE509X4keplb
	3SQRX9WV2CBesAyKvhsOhbjhbibNbq4Gh6E+1F6eAVhxTQcsJSR2hJxt5pJu7UUb
	uJ3r7Z1WeqSbHkLarPLEMdjW6lKnzELhtOUugE/MFWLeMjHywHCrr44KuxYffy4Z
	BHs2P6n1Tim7N9q9GCh2x45YB5rlFNABP5VNSX6cO6RSYIqv3G9wTVuxJQBiTWMu
	8SX49w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28gmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so4532601cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504777; x=1793109577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=WHfHQyy5l0fOy80MQfga8zMzZXTwWjoo0HObtWPYOSkUu3Z1ckM+01Vefa9dcmgkMh
         NcoUzgauVbp/0L/j8i3RJKg1t1hWdf2d0sScLARMhjK+lhC/x/YFwrvxDdYBhTR1wxSs
         kdVlyMfxgQ+qwNEeqzXcOGSFVBUTACHoLp2F1reF1Uvf4ESmKYHTlMrnCNPBvd6AmmOv
         Oj0iZrHJ0dKJkEQB4QbFL3IbvH34nV9wBVXkP4DEgCoHJQl/PjfwMY7NCZPXKZZIwuGX
         p5SuQ+hqkGto2GYFbu4LrbcvstUV45Q4sDYwitm7ZPtTVeJa6O2/6G0VtE2Ot+MSrZJy
         hqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504777; x=1793109577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=HSJne9jSkPZtNb2z6y6qrEbLmSCXURAkb7kwFLSZ1QPxuhKjIAiYNKhBGR2ujMWkiD
         EsyfiMtswvThn2e37wP01Ehvml3LLMdnprIxfzhkgwiSeG9rvpQd1535/lf5dG6ubN6U
         X3pQ/zvozLx+GOzOQBCKFkbn/OhjTPi7MOcxzuu75t2Vga1fc5+aM0beKfwyiw0sXJ00
         K+jJlTVZIdO3SQ4IJgeEZf0erv6AsYhLzJFO2TnxK/05/m4lJY+33oUpivyunp9zPWJK
         h3zVE6QHssojNp/Kuw9CQVuT0yj1ITZdeQZDzqZJK4w5AhG4wk7pugJ7b6B7aF4yccHj
         wOMA==
X-Gm-Message-State: AFq9FYILr5a/VSwVFttb79Fq6SgeHu81NdN2gyuHtPgA5Y0cogC9/Cmd
	04Pg6c98f5yWZsP4NrtikV1j5WbekOyCUFR9ff7RHnLFdofndVrw0wv1oLWDmF7M53l/P5Pza8h
	TRDKbrcJ8YQnitIizIsxp9FHu0rmVFX3zZvwc59TM3JB92BW+FTwkJ75wiUUVzJlcTg6DsZs88R
	z0
X-Gm-Gg: AYBFou19GcXJGYgNe5Igch+eEndzvgJITBj4XMD/b93LCsCgOptrAIRFWgFGtWSA6jq
	eMP4lFzn3HS8fuFBsj2Nd8Ii/7QMpP3XMRip5v8GFkHofKgTi/ddKObVTqHWaEWiaRxeShWAC+I
	xZhkB/u72nuUmHtXUlsRA+6LSTpOhZf/H5MfoxF0jhqoqWNxQlkgYkZwSaOajpMgqf3s/6lqnat
	gcBW+Wp+yR+FZrdQttJC0pjkDFkOCBQF2FTIFkkuAaZdyD1JAeWb4WoHSsVq9ENBexVM5sL0aM3
	axMOSIJfjlIPM+sgDnfAwoFNZYdvX3wwA01WSUAKcpZHWGeWPdgpg9YJozs1nHIbF2nlTRU3vsv
	i7GQaHnVvUu3SVig6Yzai4g==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188995085a.3.1792504777232;
        Tue, 20 Oct 2026 06:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188991685a.3.1792504776850;
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm485955766b.7.2026.10.20.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Message-ID: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:33 +0200
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b4sMzL6FMHgyszuqvCS6tc3f2lMrd7mq
X-Proofpoint-ORIG-GUID: b4sMzL6FMHgyszuqvCS6tc3f2lMrd7mq
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad773ca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F9CCb8yx842l5dURUPAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXyG3ottIZm23F
 71cYI15LGRvlJx5qIjPbxtx6Eg0CBaGPWZgwg/DMgRolSlI9jmb7x5oLIz8VTEMCqmNVLHt5hGd
 uA1FQ1hQa0gqPG3NrdEPAYajrPHA5MQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX7AI4dCxx3+rL
 mK6esUlOjxTm12K6szqS0QZrEdrjTqZnzRRL8NxEwFK0/RLryC9y/GTDUslIwNFD800RUwQX83q
 wX/aIpYBLvW8ClrmBm72XrS3OTh2wKFTbdjGDEWc1tZXL/QXrNuPqjcwrj0NAlpHBaNCJMkWaKu
 dITP6XCqQBhCDrvsmgvHsg+GsaFXW4CHF9jH5RCkaEYyI+CKu2SOrRfj5ITuJi2fozC9X3RtgpU
 YoPkPk2n1cUTrkgytYv7ZlRDX/MkN+y7T2CIRHylY+MWlNOYFqj3RIcOK+9CGQZrAiOuI1iUA/i
 tOz2NuJeGKVb0M4JMmGSku17+YEFZVmYhZknlB60WQe69/e5AawyS39IR/1ZYpGFP5UusGnMYzu
 mz1PngT7u6hUNc36IXD931AipJjUj2OVfMJbPHl24+W5My/QmkEH9WaGeueLI0AmN/1rzPcefu0
 QdCgWi3/vVQxeBKZbhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Patch 1 introduced it!

Konrad
