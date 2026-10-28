Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191681;
	b=hh0ZyjrG5QXUgZ+V8zIN4bT5pAu3bNmZEW/VrNCQoGCW9m6Y3v8yDdMWVeL3etHLM0bQ
	 UtOCqKtIdL3lY7EuEPI+r18PeAa0l9UGuaXojFWrTpIeVW8zADq4c1vsRhaT/u+3D+xFh
	 7k0IBRZZlpIT0BPViu93UfJNOPqAvL/3/AZl4eTey2dTQKE7GK/ynUTlyni1+9R24ED2R
	 ATVHga7vy1L7lc0iGxsZ5CehGQSHTwCCIhRvbnfgk6V3rybV50nXbwt0evuASqndHrqAZ
	 7HTWm89eRop/zo5ZnqJ5mzeZFfwsdQnnA7pzV7b6TGJB9k0qOADoYvKI9dhVno1qLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
	b=KjqZq2WdjfNYi2bsTyEoE/IVbjDRETlthOBZIvwSNfoiY0ME4Xqipal73B+R1Or11/KN
	 f/kEjcW7nQwD60JjEY92l8qm89So90D4LToYnAOkFGToZzlnoavss3V8Aqk8ydqwSZXhT
	 PLSKK/bnxnpobvS5yM+v2qVHtzkzEIuVDbNkGxCgbtAZler6O5XxiosNAkQCVykTMWUpj
	 lTu6ZI3V1tUFI2+uddjPS3PQgtHNkgjz6bQlnoDLRKPSeUVyTal4R/3kWnTkp5cnRR7Lj
	 NbuL1qAiC+un5tmK2PKdUluzN0AJuRr48R0ufXPRBeFG/OXikqwLq6wT/Ot9yoo30Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/dAt4b1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C740606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C740606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/dAt4b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxnX2082404
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=; b=U/dAt4b1vCKJz4R2
	1Mlby663Hp00rQgi2nW3Y9jB6nBqLctbracDmSB6Xj4ySTHPYv0k+qeR3hhr0Sqs
	2UJkHfm2bHLBJWrY93IMake8ERgHb4KtnN101wVPbwczAOrvCkOHVtnUVTOp1JJ6
	hQ597in0/dNY9pA7VN82PcIFWTRvyeryckbFi+kIGgRvhmYOVuJ9mjuuPs1VUZ/x
	MmPd5zRT5uVpdzqsrgBCRgTIGlvVqnwmJPDEPYarIZ39p0UKr92ey1mqHNvc58W8
	X8sq49s6pxhvWvsj6qOVtmE8TvsyFOzI4l8C8ZENejDGYtgp+glLfzjkqng1kSh6
	Hb9uOQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv16m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so2614937c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191680; x=1793796480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=XdMEZhGsC08xa/HoM5cUlqv0b/EBViQYSs5FZlc5IhPFfYqC2xHwgTxh1gnh3fdRDn
         mKBEQs8RSmItWMxwaxKCCOWOQPojsbEfs9xTEmYcWZYYW6ZO2MKj8hN7w4HuufZ/NLhH
         h9r0HFAh+b2O1zOHtV2g/RsMG43/bpY8Y1xsJxaUK3u0yskLUBjiz1kj8GwdjaDWKzML
         Vr0acyj+EwqsykOB05JEzMQID83kM6TtpnE7p29Fo/4Vl8yOHnC23Ca/fFL9wQMXuLz/
         VopE7X/yeR/1MFUsjgzhDXfyo5R2Ce3Q0nLr+tL4QLDr0zeBms6vrA7lD04RqGyOluge
         2HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191680; x=1793796480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=UcFwvNxvsqpdyhO2ojLPL9XzE8phHBwm6DqH9XA0tiKv1F5m61tb+N19xMdnVmyNA4
         0rxLeSe1Sl24vO8wnloIg+z/9aKqnsw3xC9TFjFvxYtDt82+aG4J8i0nZEFhoNYW+cWK
         vfkmmWnyRwLj6NSZkA3W2NZgHQw0tKOXCQhECfnH6EUT2ftbc8PALa6oTWiuy5YQJiK1
         gE50d1K1kdKe6CboEwVy7cudoVysMoH6yikxodsUK54m3l0pXR9A4bu3SXmuVarLnNdB
         3iUVD0qKCt1l96U+ROxNDyDG9TPXhwwTgTXPempNO6unB1FJdVv1ElNSUjO+6HW/+gpP
         iR1A==
X-Gm-Message-State: AFq9FYKEUI2j4qg3vw6Yyi1lXvnGmWfZAFaiiB0g6AGjGVaz363JyBmI
	3UznqVl56ylm6Y8ZXr5SzVZTWkchevFhJmcqYXuvS/MluG2KbH4+4Nfmr8gt/h147qp3WDKlsPd
	Qz7iUh4+qm/qtG6Z3gDbHrYEBCzAIhwBHb2zxva3sM9o6nhTR8k4xh7A1/pW+unvd1Aij
X-Gm-Gg: AYBFou34UPe6J9DqA4Ucl5XDH7YSuHAp3gRSd+EwnnNINeO5muC/XPBZMNflZLOQ0Q2
	yyJFvhcw/58t7stwUXVDjFkiN0neQnoLuaGsjQ2+2axwW7kFmAYo4+hEK/WcvNmDBUHArFOJJli
	BEZZLOf6SfAzEZSsGpGZL/y0ncj/tIT/1yAqg/N1wvamdk6p4MuSdHiqLo0dMug0O7IaymchlW8
	GpBJ7IkmqLmas6E46MSpJNpq8HdOuCpBkrm4snOhacefR8F5JaPrkPxkRoiJ9OvySzJ3mcpEbVb
	h+uU8czPXfYbUzYc6R9bCHe3zIkQ8PHRNIDo0OwP3a1T8tlj2jClB4TfDcHEmgyykuhQmCR6o0O
	hqVIVMbNoVJ+jSO5oVhPZKhywXhJX01E4dscP8dl1nwukOT0WSq1v18/F8BFEQk2jMn/Oc3nDv8
	gvPFdW+Osb
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873293c88.31.1793191679519;
        Wed, 28 Oct 2026 05:47:59 -0700 (PDT)
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873241c88.31.1793191678889;
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm8546468c88.21.2026.10.28.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Message-ID: <fa7ddad3-81e8-4c0e-a5a7-74434746bd88@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:17:52 +0530
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
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5sUjeysIW9DR
 +ZCOQ1HGxM6zzhYWN2ZlN2n9pv5R0JFkk3W74cihi52eyhibHLQWzcei8OV/+U7myja2vGDIIJ8
 5y3qai6ZfA4iZsxyBqO19tVhoVb9mm1XhMx+9jql9zStMOUhTiGnbM6iXzhS11hvTtRPSYEkUk0
 R4bIDYlAFfFs2qjAtmo6oWa5T1BUybujqBdXY8GwzlZiF6bj5ZMl85nj1TYgQLptHxV7bmiub+S
 fQv7H6uT8xYYWWRsoPzZWH4GeUlmD3tqmszwC3cW5yDLv+ZvDeb47kHw+A7ZzDpgPkVkxEudZ7Z
 G/JlmTkh0CKB1bIzScEMmtJYCwouhgvxLYqY7vdE+KFGSv0NtpbuqJ3uQwMNb37yDJ5Ls6Q+0Iz
 x5VAUQzCttBT86TZl6XcFmuk1RqQ4yMosjnz/OJSTarwxHS8MVsH4uE/xOUaXoAhDUPfkC+A19A
 WsrGSX6MNPN6DHb3E5Q==
X-Proofpoint-ORIG-GUID: J8jP1dFodPeqVp2NqgS-Q3KQkdCxGird
X-Proofpoint-GUID: J8jP1dFodPeqVp2NqgS-Q3KQkdCxGird
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX6kU6hZSPyfXb
 2ktt+9ljZyYDDx1aoT/+6RLRd//169Erv/ODK0g2lOjiXxv3YvT47l2RkPXR9QPiNLcaEic6NR2
 m65oBZvUOCmBso3R26VttP8qvHqp8sA=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ef00 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lZdmFDQy_dSNCzDU9jwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQM EVK board.
> The Shikra CQM platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components.
>
> The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
> via the cpu_dai_fmt field introduced in the preceding patch.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com> Thanks,
Prasad



