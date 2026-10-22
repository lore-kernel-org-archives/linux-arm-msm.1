Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660549;
	b=PhrO8jhyqCnivEQCZIeSnS5qXYbHdRynyh6Gd9g535SVIrkdE2sINr50vBbynb5MOXDa
	 +F3FvBL5z1ELZehXIv6ROyhKeO2eOvd0lwak+5aJeHG57v6/I1lRXQM7U6vxR06kGcYjU
	 ac0Nfl99fxoYIlVVykpROMxLlGUHJJg0Ibd5e54Tladanx0BPtIP4jvS/C0o+MR0N7XvA
	 /HL7REDb72P4ampWw/8GbOVEP83vkM0GJ6BR5fUV1iXfnSzbNVd7kEPx0UHm/d3UQ3z8h
	 sHPBpVgY1qKGs2k6LX8pyHS8Nrl1nxuDdxPSF4NVLOsZTQ5QWvwvVxJOjCVua3Tt+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
	b=t6gTIntl+lgDM149vf4mXa/vzjHrTBvgox7HNxQBPmYVTWhjOFQ4C1s+jtnwjvZLzKOi
	 Jhp5G7dLo7w4kzBF2q9r0q+/DlFWHVxMPf1ZFtqrssNOK0yIo6wYIx4cOiAMnyCHFLx1A
	 zHhxojlNyw8378Wr5SdxycxDGpj3oKiFOvTpJ57IPuL0BaecrzCgr1rM4VgzWFgZFThkX
	 6wpDS5bo4gZIvsOQVhsInTMm/ZBVmjoXPGhy35o7g7Uo2r0+J3Um/WPppR8jDaJgJsSFG
	 f2Hhu4fk3v2HwCOJbHf6KoYVDXEejV+jEKWWMN1QPPqSLdiYTtv96yc45wJ9ef00Qgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FB606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707qw4136667
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=; b=aCQWpE6kMqjIkg2S
	jE0PHueDDCkGqlclCKoSQ/nClliaSWV4Fd5lB5wjYWcLFTbn1iukagL6AEhwbLLO
	SGxI0kPy/I4imEXHHbQZEWT0eKm0Vv45Ha67io3PBm+D1/zQCL/VThQFqnk38IqB
	Zpj9TSZT1keH0Mgh6JJREBsCdix0hx+j6JsjuG1d3/0/AbCuTuKmEKt5yXpsJlOL
	gAuY8/9WyZaKU65pxBawLCCGeZh36YKgGj2udzTu9i7uU4V3XKKXfOUpsbEMSuaK
	buqDXMcIXxdpdr4ygC9WWq74JwfF0r45fT+0xHgxoJarHVCUo1JzFLnm1RlcEa6P
	xmdcxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9n4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso22478185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660548; x=1793265348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=Ut8ee+Qdxh7NHtFhXqvmLlIy7gHFkpsC+FxOHryjqlGayTBbqhaASAxkgWlcO4VNuC
         BZKrkmKsQuSbjwRTqXHmcB4iybn9jnWuzlQF6GUWmSYlGs3iNpVwm3fFeQ6vuLMR6rNO
         mcjg6m9AUL2IxRKCXUSczbRWSmtN5pNI67CF+/ES7SDZU3EhjxRQ9zNTl8NYrK7mKGsz
         XVmv1xUl7raKaMOPznvzXXQFCPK5o5LtLEXqPL6gYZwaFjCCT2aTruItjF9MsaITPSQq
         0nNeNBt7lUGTDS2Gn1uryLOTIM+Rx/lyXQpkNGbDev28JB4iw8YVPxjsWph5CWhqoUXP
         o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660548; x=1793265348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=2A2b60PeIpZNdfiqHswaNjbqiAxkrVGNTnjzT1oMecY8H9gv8VQL9WWq/viOJokNkZ
         dL/2PC6IHMoHD2IRKbJW2K0wPseikyR4uqww7uvqJl6msm+q/8OQ+ffkunogGyoWRUU/
         gGwn/CWFZBOWMPq1cN2ORY4J5kjtW2WSgoZbdCqCsnC/6VyzzVIi2ZVfBaZU47gHh2XU
         S1DnFwnBYfd0jpZwNECXcanAUafaJfmWWFE+85CjdFCZpeS08g2TNaxUsYsnV5gg2SJU
         0xEA3XZ9i+pdU3itWvN39dq3S5b25VxlcUVzuQtNJDvstBh6EO4jxOhU5WMBOI3hQbEo
         80ng==
X-Gm-Message-State: AFq9FYJtF3Usd7NT/d5kZIzbsfPMlLcKXkERQHepKZIJRJtx+SMeCKrF
	kooef474RupW6p4aW9ynpPSmLFViQo/lJvUL1FwxO5ThYaTlKRgC5V4343M4g+EWj2OnCCbHIDh
	eMsR57+voE58t+TfwaTXZeNe3FhBHY4pNeW8Ff5E9UNV5wyWp329SBhrtp5BlFu15HBb3
X-Gm-Gg: AYBFou10cySFWrOc/W9bmn6cX8TuPEQcFDi6Plk3Zyg+HyfXGAB9+ZZUVfstRJcy4uz
	X+q3oyd8JOBcba13ZM3XM8kNpSNMIgcPkndggVJ6Izd4lNyuBHy2+rSnrr4bw+AKHwrh3F2bco7
	eQXMI/gVpILWt0rRw4rKvaPtTOpmKf6Yr/Cbsmx/sFzsXznlaD1qDBNGf0AoiZlfUzAnmHqjZxp
	KzYUw712tsi1W/LtXMZhbmv5f4efYxFUIs7MKrnaZ84+hlXPICdZvvXP/+23MHREyUs76ctVpYJ
	hnbvjbbSeuAluBWUJqCVr2v6RnnbWjhPr7k+A+G3+7yuGobdNrW2gn5wcBqHSddqdXVU3y/TF1+
	XiZgX8PjSzkiU2O6mjbhZ1w==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989933485a.1.1792660547880;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989929985a.1.1792660547440;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85881666b.24.2026.10.22.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:46 -0700 (PDT)
Message-ID: <d8978154-e99d-4d3b-8d0f-b707b2ce9722@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:44 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1h/ePE6V0bUT
 hfkltjbSVFCXDwGYYMkzdLkGYIN5NAt1IGQf3SdCFO+x8X9q/d1Lnh4fko5wIPBQxVUD6CJGgRG
 JTdJdVvFzAEc2CEA4TS56iIoIO/uQWA=
X-Proofpoint-ORIG-GUID: bv65J4l3lDTsXR4c83ELfhmNbwYDNPpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX40tLXUIeCnZT
 nKT3tqCUliSp+NYNuSgX4RHE1d3axphNIcPU6vqk2fRq2ENHPPPUPkEytDlNy1X4d9zljjXfHJv
 bfdYj7I8ucJwk+bRyq92tRWKC2IWSqASJo/efCVL/etYdswgzkH/pbj8QCy+wkfekRjjBA8n+Q+
 PYplnxtFn+OqdW/3S7tuuNf42o2kSh1xI55OSut3kl4oDXpVx2XaJPCJyUHlGiOjkbsZmHlgv+R
 VQG19/1kC/Hcpw20ndPg4bMV5UJmWlOSDJYWMk7qu7TwXRpoX6Cb52Mw1O5Iu6+fT6Wip9eD5zw
 KgXXBLhKpZs3vunuqVGDNTqeYP2F90fteKaUxLFh5RIm+2dkSnpV/DDoeQYHPJo7aREELYLLJTX
 CFEe68uczIjFu5HLoKCOKU2QYHAHmIDR7wHk2RK2GNI8Brx+sPL+Ki4UsIi3vENLYlglg6IgBAh
 CyLXzJ4zy4aSc4L6soA==
X-Proofpoint-GUID: bv65J4l3lDTsXR4c83ELfhmNbwYDNPpx
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d444 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JxYTsIeC_X4Nw1WztroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The Eliza EVK carrier can be populated with the UFS-equipped CQS SoM,
> but the existing EVK DTS describes only the eMMC-equipped assembly.
> The carrier board itself is the same for both storage variants.
> 
> Describe the UFS-equipped assembly by combining the UFS SoM include
> with the shared Eliza EVK carrier description. Give it a separate DTB
> and the UFS-specific compatible strings so it can be selected for the
> corresponding SoM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

could have been squashed with p4

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
