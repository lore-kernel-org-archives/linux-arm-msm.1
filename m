Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789568;
	b=sDWmXU7Lu1ucNFeK0STA9gZWpCZdZFb1ecAx8pI0hwuFMQElB3sEzkylNE7v+Sz4101p
	 W8i/EUpyz0AX+YxoD755Pa7Gm2qxcjTmMOID/sQE2j37jR/8gg448NnNYlaH4CgmnNj6Z
	 JXuE0RgZPt82qFSgx71VAsqieUDTNVWul0l4sPkPM59m8290Xv9m4sEbYwlP/4ivcU4r2
	 DUyVm84BPjeTID9aOg8Jw2YKDwmvkKLNX+a6CS8kWQ+Fy07rxwxTqvbIYoYvItYOIibtt
	 wUtzfO4plvEre24TC+kTcIluxRbOUab98z/t7pdq9psFcY9F3DqpmURwTXhCbCTTp4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
	b=lep/c10urcXlPPTH9l5f++fFZ/qSqaUnMgQMSOg078OHtZ9IGNQV1bpyHjMwbV8sG0IO
	 pU+3K3JKFeK7m0cZ6urgx80RppYOsIJpt4YdIAGzytsmzcHScEUtLwT/V/5M+WPF+Ms7g
	 uZ65LvkcSope4ThMi0HcDzqtR6GwGITqlikNOS5tlDBQUiMjOS0rOfqoOl3TtUpUghXgu
	 J4bLDA/PLKfOV+GKHE1rWv7+WZIJfaRP6SXFa1uJGcboZXXiWb7NZVr/RIzJrjQfJozLK
	 UhuctadOn1GTNsCjdOMo/w0yt4YuhB5+YJj9G7rzf4bjFlsoNRRgKPs+BPl0fPzgjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A5606B433
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 441A5606B433
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1ETe2683807
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=; b=A9OyCWOhxbNrnNBj
	j9QsIzGlTvvelZiXk7G6sfyIvotoJBnaRafsAYfleP3VDnfNZGyaBLOxdBoosuqo
	DhQYJN3Rm+ndD4lKkmMPEBqJpR7TQJUHfNFuRk8MChz3U9QSbjZFqVXYLKXsI0iP
	3M8YDl3OgBdR88C2wpHB528xoNGuET5iDhh4XwJKqq/IlR4vX5ALLSv+AD4NtElz
	nSVJgU+Sp6iZD46sA6ee7Y+XdGgIkO625Bd18WByUVcX+LY+n8yIG+XuXx62PUtu
	F0ANFbsQ1MFTO25zz27EWezgHKYj3t0gw+pRCSEFGgu90ePH/pVXy41gwfaBikUJ
	u+wOLw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj0ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso333759e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789566; x=1796394366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=QXGQtXxRgRfUPqPPaSa5v4NhJuVXnfedKc9zW2WBcM8D7MBIObheXgTzU1nVB5/3o4
         y0EVDV+juXL349kJMuzcipVHtgZ7hvowNlbolPdMrrh3tIKH7oXtamvVvxZQQ31QJFbT
         wO0lbyoUzJf+zeAaekHcSqqflPTOzeHB2Arn19Dh0gOCBF0TBmLFHpmAfUjnl9yJkRKd
         Hftc1tgroYfLbzp0vApqPX2f+hA+F7UlKKnW2EhQz/p/MZF+YMSJ/mWQWyCr8hiT35qR
         x16m67yddyt3gSeqNojp7cDRW0pE6mo0fH4yX8/RpyTEQ7fCQHumIDsJ8eFyV4WgzrEt
         mJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789566; x=1796394366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=rZYIRXyWyi2SeeQrz8uv4Dn+nx9oIwvsB+dseuMm9LuJszPjCuzU/WXK5tkpINXxYO
         VcdQS+N5qvXcy1BIBJmGhtlXCjDaiOpWRYCqSdQHUz4jIkkydbnDTlaMDcO4HfB3oKgp
         DUZQ8UXKMYI/2ww5ZXZ11XqwAKnB8ZUZdGSaeO1dUtuwl/DQ0l4Otf1JxJLdzRYKgH9r
         enqSutEnTkHCp9CvsNxJFQW9rjnTn4Y+TGjwQ+2ulzxze0Iz5SCmTK7DWKE4C9BGx+uu
         2APuOgofzCKZT2VmdEJCXpLxOo4POV6s1BaPGozetgA+YlbJ4ni9yBlO1nq6O7w78BlV
         93Mg==
X-Gm-Message-State: APuU4Z+Wz9uzbPCkR0J6ezQr/ad4oMlAX8nS2QlB6u+ESWp6HTX4udnB
	quuYUZqgewQXgVHRPyvXeYsXr7QCmd7vNIDbc4R/NOPFnxc8lvB/51AY9iNAZaRbfc2gonaCcPw
	UvTVeB7qiTK0waR1N3lNKWSsyn/O+W6iCLsejn+qEd2ozvmHYPGM/ixH2V6QdDPWaDTCq
X-Gm-Gg: AZFdTZfIowg13fX1we7Qj1CRFlqcu1hhaGvJB4DAvGKwvOrcPQ8Ndjl9lZlq1GMI61G
	yPCaUdHXu4LcYbHiMQnubsm17JBL6Wr5EmkWAyfVVWb0HVPXe/VXTP45/ShWqXobOUAl8YPO/OQ
	E7Dwi+SPPyUtM4IOnnUP4FBQnLZpa4i1OVKseOqqGn9Uxgonn1KI0USia38m7drnGnEiNZMdyz2
	bK9UD8o6DhPuLBWI97iGWKVzvttKSnFZIwyqpAIlZGfsVxGKOYk0vdptPlhOFZXyp8IUfyWtf7y
	cv9dk97VPX7Q//braWBlwnbnZowRCHaMyO2Pd8C2FYqRDSTPSSu1J5IyZblQ/OsBbW8gvpK9A+J
	w9WUM5CsJJbCqDVVKNrN1aLAj1fLnoD6YUyWBvV849aywsTJT73qmhaf1DZYzTOuqtyJMuoY=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109607e0c.3.1795789566385;
        Fri, 27 Nov 2026 06:26:06 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109554e0c.3.1795789565824;
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm871434566b.19.2026.11.27.06.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Message-ID: <2b589a52-de75-40c3-b4ae-3960b9068cfd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:26:03 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX8Qf5fG1hsbnA
 sfVvrd95PdqwTlVevR5sZgha9gebCTbKwnp+dBUR9R4+jMxp961UXOkczFPSQd1icNDBN5fY/eC
 fcqdjsWKqepRWSL0CCRqwenPCkhkdoM=
X-Proofpoint-ORIG-GUID: vrixLMvZK4ZrVaBPpgSfb5hBMfnM35yi
X-Proofpoint-GUID: vrixLMvZK4ZrVaBPpgSfb5hBMfnM35yi
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0992ff cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=bCXaPUmJWq0JbFlovXgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXxGLuyXIHX92A
 e30oAiD6Jtn6BpKYn1mpxjT77M6S0oSs4D87BGiyo+pujQSqDQfy424Mv6B37mVzyG31UJ9x/cv
 qKFI1jaSpp57pykjd8B9a4uZsrA9V4ij+cSo+qcEQpAK7/QMA7KtGwJ1VVSS0An7DG+NjzflLQl
 hnX7kkVqxhniIP7DysLZONWHQ134vFmSjRBRAHLFZ2ydIUa7GbgQCAGoRAuC+fSi5sgdMUhu+0m
 R2TvgdczWsRsShgbw23fjtJRP8bFstcVvaCALwce1UhK4BCs9gJf3pCJgCAalyC/HK3lVre01Zu
 hOxke3W2Pb2r2mxj5KZjSK/oewLmFWd/GcRvgmQ3vEV7qNZRe/AAM7S76KLTpSkbmiKzNwiZODI
 KJmSutJJEPLOkPSy8RToaT5P/64ewRDvSC0ZTlCDv28F8uUGzw1PN67iaJ/Gh72tsEp2cp929i1
 92IrxAIeP4jGdjWQTqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/12/26 12:53 AM, Paul Sajna wrote:
> It was introduced without proper verification, and causes
> graphical glitches on the display. Discovered by bisecting.
> 
> Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
