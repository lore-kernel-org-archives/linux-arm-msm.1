Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236C3F1ACF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900996; cv=none; b=h+Xp3cswLEYaww2S9riA7IuMU5+gZAkiw0PcPEkpVaKrgFzCp/Vs1I/b/SUu82oXcQIgKGSgbSSTsLI4STUguQuNuinRNwZD85vszltt+6tJaRNZbhyOqJWckKI66tXAHDdguh31JyprKIoOBgB9J3GMog+5YIEYgY34JGW5swQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900996; c=relaxed/simple;
	bh=3dYCu4+BqnUvxY85NXsuEOpAoxwux+AbVeIjM4Mpdno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZbdmr8Z61SJpqJqy3wf1ObE1Cb/CPcBpiCZPp+EekG6eJLJ1dDcs8FT0ROr6wGwI9W3QECERehT/VneHAjVxwTt5WID8TjXdtvD/20s5Pr3KjMtn3LFhoU+zar+fns3Q3Qel4HVemQqpRr4CZTPaFbVcgmigjQaW++8Cerwp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE1vkOFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Esq6Dk9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE1vkOFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Esq6Dk9B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE40a0615495
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=; b=FE1vkOFwluZvtsv3
	qPp1jONj3zkD0r1HmPK7tvBPPi3m3ohoviP+OS7Ryu5T2FKdTDpXHyYRM2iLFxUl
	pXv/XCVKA5LPVzb6YwYB17DoxadllDCZq/0pBTn03Msn583/HuKti4ur3ZvYoTcz
	0Ga/xMfH4ZX6rkjpgteU9SXmiLXVG3zyzVBlWctb1VIcTqDgXZMPxSe5iC8KShFG
	HkM4YtBNdoMRQN9g8gQQnSzsd5Qsko3MkCQjH8wy5C5Uv2FYb4cOas+4ami9fUD1
	+7oJlWQ0wE+NyxTEn6o3QFtCPvQl6VE6aCh3crnYlG+BWVQTfp79xaZJKbgX6iwI
	CVzHAg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7jag20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:16:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so50055e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900993; x=1792505793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=;
        b=Esq6Dk9BAMLZvxHYDiR/bSQPpKqSBKBDHr7TZ8hpzE06ChxNEVYbUX84uwmdyG+jxw
         baHYuzEHCtpAGfmf2xuf05AWNIXvVwuDRc+XImpX8tVI5TCJfWULL9li41RPk74jmVP1
         7U6caZYVy1J1zjuBfYgUA9Q/oTwOoreiZEHyDXVBawMbk5UTKduys/ATmnumbMWA5yqQ
         i4WZUuc763MBBYhY6leM2ZKKNNZW78zbweE5UgOfT0UmUW4KBbLnkPZMmVta0Z/6cxtt
         HHdC60X6Hbiu2ScgaAKS07dB/5ifb3+fY+JmP56eIZRFRnGDIw1qC5/xzJnUm2Yd9Rlv
         9ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900993; x=1792505793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=;
        b=Jf0cWaPaUMvHDJIP48BrRXll6QaGl9kBLcX28hWlHNF4dECEC2gerJRZRsoznZgxKC
         /QD1mnr8YasxzvM1B9h7r2JGSSSRtZ0HlFBucqE2hlf0GwBajK+YRc8mtPDodRb6ausz
         x2xbeD2RNwKwcyEvIH8RxPGR+urYSk6+balwMT9BYferu9OywI7N+zUr3c2w20mNRii0
         1u9pzLxa7GubQ48gLlJr9bN10gVhq8P3Py86j80J8d0HRiw39Orn6z6Slv0qAV/3hX+f
         pcjlyZjYNWKIo6+Pel4zly8IKfvWju11CM9qifENSlM/dDpUz2m/CatddNYV1hcOfvgt
         ck9w==
X-Gm-Message-State: AFq9FYKQyIggMgfq2Y4nqJlAQUrvAIae2lFKQCB4ScsHrhc6SIlycCUc
	oU5bFHD/h9/k1AkkZaOB/O2g5cfteT3wneUv86IQqiCxt7F/utXgNTT+hpOGLRQhgGuZBBO3/QF
	zGLuTmlmqE6PMmBMH2TFCarBhRV7EZBDvisfp8tmQGJElom77BZ1UYgbO1VPly8Juos+i
X-Gm-Gg: AYBFou1qh/U2AJoJWgIH1A5NsRwvdkG1IuL67YzDoBmN0XXxs9EcjFA6b68UCHEEVh4
	nDH0UjfKqFGv9UFKh4B4tNxbNy0R+/eE0NNO3hsD0mr7o8QEvSDvf0pozJlG/nMT9T3GO9hd4ts
	WsbTg2C3Ubp/mIqnZMtJ8zvyhja90Ul44gZqbOdP64Ry0keQJduE6zLTQjaXl0Kwsbvjzv1g4vF
	rfSo4IH3E1sqZXBJaSoJPEsAAU2vrsMdsUeSfx/hvU8I89DyS52ovpkiUYiCjNWUEE4NflAJD/R
	doRsOXL9DCkCQwSPZA3VaVuL41xk0X9M13oP2p8OStaHAg87gl0iePJePLUCknbL3vIdPFZfREC
	9XGLti7UXEukPGqOrSCE9Cw==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr984230e0c.4.1791900993217;
        Tue, 13 Oct 2026 07:16:33 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr984179e0c.4.1791900992740;
        Tue, 13 Oct 2026 07:16:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b173eb99sm3263983a12.6.2026.10.13.07.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:16:31 -0700 (PDT)
Message-ID: <0624ccca-37bb-4bd7-8c40-73f89ca769c3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: enable the
 watchdog
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BisXsifI3ehb65BgPLhUyGNzolRT8vEf
X-Proofpoint-ORIG-GUID: BisXsifI3ehb65BgPLhUyGNzolRT8vEf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX4183E3owFWxn
 JsVao6npuYZLDWMqrWMbQUlLG/s068KZijScYb05E6hX/sCNW+GO6X61dmzGpc0uGajnXXZeJHR
 29TXP1dbrrFls3zQafrNAxDaRKMcGtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX2aXRJy5ThQ3S
 NVoo0mZ7claf+QLwExcuoZsPi5FByTsMb6Gx9F2hfhy626eAaQg66vua+mmXUEvSaABgrsGBEgM
 iDcYm2pKhSjLV06R7Tacz+2tcG+q7aYLGObw69CD0hYROZ6vrLJgBa6l/K7I3Fq7NsIWFDFLR4L
 L5LkAKFJXEAOHXUw+B9SeChlQ+qsXXzFdBy3KFN68lacb4/j+eFsTl2jiGkRTcJ1tabNihWpLMf
 WSPK2CEfJmZifHwbfOMeiCznxBbz+TaByFPe6wlo4CUNZbQn2Gl8+GMQbTquNqgCPPnWFrAEe3/
 VNSwmFKD3nVBITkBsoS5xVTpmiOX9xTu6ZcR2aslJjYYSSqmqJLk8wVkA/T7YiNTSADAPePlsYy
 L1S7xbz9Ylw18kRGmYanQrq5C9NkxKCW9ZmWYSucZMSV5lrJ4tFBugWFdsBp1xryMamSC7PCYB+
 jRq53VCz9Op+s9Eypvg==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace3d42 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3WhsykZCFRSWcWe-wlIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130055

On 10/2/26 11:45 AM, Neil Armstrong wrote:
> Since Linux is loaded in EL2 on the Deckard platform, the
> watchdog is usable by the operating system and can be enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Preferably this would go to sm8650-el2.dtso but that's fine for
some future change that also belongs there

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
