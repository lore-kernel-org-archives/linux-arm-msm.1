Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251A315D53
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653350; cv=none; b=KVIowMPSNJiTzbQ5ahixWfue7pV1EQQ0S74EbHfo01A79oigQiZHYrB4jEzsLYkU7LwKwtbnT1thrMALl55D5bbBMY2c/FS8x08bnbEP8q+OPZdmqG2eggT53OikshsygmFjdyd2LZb3OjsouxoC5w0j+iPvZpFd6x9FU0TCyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653350; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poOyIIiOAi0OT7FQutj7ttbHgwmH3YvkIn/eX8QaGDVOfFPfs1ka0sYPBJPurjHEiDooFrZwzpodv/EO7KInugvCpDv1ZCKMYYdxsztkPLSUXV3vQZhszgpRwP7KdIC5xZYICD3hGLz7A+XDF0H+wYrV0oJoLOK9OM6PH+aiEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXNsyxPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxdmU4W1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXNsyxPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxdmU4W1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2Tbf3439751
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=CXNsyxPHF2U7S3p4
	qq2uHYH+gObG9K7eS7z1Y0Y8BsyIlwFQOY6pvyafukarBFWF4V9p0Ig+OZhXExv7
	71gG1/tdKZUL1r36LmsJzMDYBmZX9+JboS2SPU/0JNWbbiD7RLiq+GbqlXKoHJ5t
	BqanG7gbY0QCAZZ7iVkciv9UlQzObiqHe4fHvOZNVxNE6AaFP5RdEBsKbWq51qdG
	kC30T+94hstZLkan1ApWaqrXMUu7zxiO8An90UeJuEcaPPusPOmnYIEoTEroyrcG
	U7KGohJhtpqKgD8+syKC9afBNUpspA4sCkKTfc78hGXJfsWH6T+NkqFi19zB9TRb
	fP48ew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nst1vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b81c13b0so35414285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784653345; x=1785258145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=WxdmU4W19E+X/dmax9fAaGkFc9z56l0Iavo7Sgj3qStEJn4vx3lS9P3XnQ97ik3ttn
         7tgO0XH9mddVd2FTNmVoObD7ToGgGj+V1zxkYLMyU7Wmyiq1sNkmwbk45WcF8m6mYFmi
         MOwvpqdKZbRLW1wbgz4VBECSOAMzfU3/6eVDwKWIffcS5kdt2ZLdkLuZVu2K2/maZ4hn
         lNL5i20o2e2rsPQH07ynqotX1kAbn3HwYRu+UFOLyPkZR4+ILr+vp3IhGeTNLOqV21aD
         Ta+h9sg3Ssi9H7Ypizd7fw8Dx0qDoAx4N7LghaYwcgBC0ymIX7yyUQxxMqO57m0mT9P0
         A0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653345; x=1785258145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=o4yOq4mJ+l25P3UoS3TvUASpV0iy762aIwypMIPVOsR7PxaJgFkhSsjJ37QNTzuRoa
         ljvJOz/Jpr4vi9YM3reBhmLN4cHq6OGbrQdpjAcHJISpBqvhwhZ4TwAnSg2YHX5M9t5z
         cB0tQTWdrkT2R5J5+zrmBpmkEBZqHjfTGbvDWlXG8ibEIWYprMQ7yDhJrQwEfq9IKGZp
         HVHWLt+72/LHHUdCoj6DdjRQcgA8gcWyZR6ozahCpYglPXAN8W742hUH8gn7rDKTtIuY
         CqHSkYWkfODJJ7enBvLdK1BEEW8jPA17nDfEjfugyAqLx+BlKyA4/Ewn8MGANGddsgts
         nhJg==
X-Gm-Message-State: AOJu0YyJ8oMlmviw3RoON1EEFwvS1y+hHuIo3snR0rw3Pwa+jj9q5c8P
	g1jNp0sXl6Tak7d6pH7ajS16ZNDTTf59FzowHHeZxOB7Cbr2+oCeAX/JjsawOH5XM5REvAbYTlN
	F5l9ZJqI1EvdzQDpYvsEzrqMZ4qTYGg38heBmViw4J/9rEs080HBIMkmInymYWMePEUZq
X-Gm-Gg: AfdE7cmEV2IorE/DbW6wtyb9X4Iiezn5Db3pOmBWXQkWsV6NxU35U6okVkpPzoDrz4Q
	aVFfhrt2VhJf0/A10LP69XEqBJ6Xg7L7dcHY+wkEtiRgruYs37UStRI7OLzFAhkWaYFgUzRDI58
	mlAlRdTYfIJqcFIoDtZ1xQVlmFHs/0Iy3gEAhcNfaj1TufBAtVV5wuqCNbIw95OJXncfLO7T9ai
	0R6235k/bZCnX4FC8kkgvgG7NBg/UPg4kDUsB5glsWRrMVDuC5p1pzDpbsDbw2M3KdfryA54XSu
	ut14lNukaBBpIhoG3fZRC6mecwtT/8l52Jpw5IDAAyLQIAIn7E0vcER6Jq7gHhCi/+L+brQ/Qeg
	hICFpYWWEv8WW5RTpDRdlJD6k
X-Received: by 2002:a05:620a:40d0:b0:92e:5023:78b with SMTP id af79cd13be357-930e70adb31mr376897585a.5.1784653344903;
        Tue, 21 Jul 2026 10:02:24 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:92e:5023:78b with SMTP id af79cd13be357-930e70adb31mr376893985a.5.1784653344414;
        Tue, 21 Jul 2026 10:02:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90205sm635866b.33.2026.07.21.10.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:02:23 -0700 (PDT)
Message-ID: <bb52643a-2940-48bf-b2c6-9383064f3086@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:02:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fuWe2aGHiABKg0dapflOihSsx3BEmCVs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfX8S9bCkEAUjXG
 UCm1b3dEF8V0MYSXOwlq2y5HLWLdi3GRSLLAjdLRHwL0fLO0MJvx4j3EQZBzf2dJwAUGCuBeYeL
 Uvcd65Pckx9IhXJeQf8T3Y7c6ebpb60=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fa625 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fuWe2aGHiABKg0dapflOihSsx3BEmCVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfXwSL+S2uO9oCK
 lVI5pQkVt3AxUElz3bUAJmOWK6t0IiiAdtkruKc41CFiY/3sCgeQB8YrAjZzHCfnIINOl+w/dBi
 AB2uVD8hJZHLDC67zEHIKCMcBw4qxI7o4GRbtFvLdFXxQi1dh+Bj8NUl2urXd8fdSftr9lbToGl
 WUtxGx8uOiMPhaeyTi7IQSeOS9yTD+JEXt0+ZgFCZ0fTOi6RSud3CrBdysgU/QNjXpOlhMAQR6S
 d/Pf7ZS+EOr2yOAGGVi8DU6qHneNi43RVAF7PR9hM+QyL/hIbZWLOUBFYxoIkaLnD9M1CmUIH5w
 /mkp+Q3XZtp48NuRH2ca/OivGGGes50nQuipz0PzJXURim2a6VN2yEzeJXaXaVqEzGH4g6RB2FR
 DOSr0m6NNDCSkKq6nfW6JQi0P6l3+BbCWrP/ki8O1lYeuufcnwhO4nxxzp65tb8vyiN0M5Zcqjv
 GOFeeCncibzTQHg2Stw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210179

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
