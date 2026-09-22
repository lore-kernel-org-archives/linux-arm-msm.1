Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29FA3D3001
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092870; cv=none; b=DfWufCQcTZCSb8fq689/afN3tVyqNWoEQO1LQ7FaPMIx7kqJBFGaDE8bkit7krs0IjShEHLB3lPumRqwUgnWizZdtYogd7PTL52Q1VM1B9wEYxa4IZfSk+R8TCO0+ltZ/bMPocAAAwjqFQUOZWlvAKlk/9QtmJQ0MO4J90JSLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092870; c=relaxed/simple;
	bh=3R4gQIMPX1xyL3fLfmJonUsEWPtqtPZU5S/FIjR1Zgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJnlAqHgEANPD3HMxZFsp7J8a4lSu6xfjy+IZTz/A0/Zu6uVjjydvrTpOWPkhvYFFBqaN/jqHWA8kZpMzT6Za0h39YZPIIMrsnkx73/+b/fJ0wben/ZhxbjMYkZeyV+6cpbnGjg05qcRVZraFpqzCujX5whBEg1ZXF0JDO4LN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVLihMX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFyP9MYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVLihMX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFyP9MYr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjK6w317958
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=; b=oVLihMX5pEmvoTDM
	MOtd91S0ChCCAQGOghu8w/ob+XVXP9TVXRvgw//nAsO6T3khbZ35jGWyeegI+5ha
	bAwVbktgMDuR5ubiHlVE1GOy69jMeliLeFmh7yyMNnw5fV6L/49tbz6w1zlrvym4
	vcKSBmwylQvTeLJQurpVIptTEJCjBNcKIaSYCBysGpiZzT/mHLl7/j3Q/v9abLj9
	TrJ8d7EpuGDkQV6kecT6XCygoBTMoGY6RBhK8Lb5L9VeJBq3OFJGTKRk7DEqKtcV
	FKZREM5S3Gs7G+71uTvfDCw0rok5FtQXdQ+hnXJ6ZIVeMWWugEl6fGpbs1xjPXYS
	vOWIpw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqhyvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6aacb473dafso443325eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=SFyP9MYrHgRh2mEdkywa84Ft7nGCYrugil/DNo/EwVX6/Hcb536sN0elm6guQGY+xB
         /hma38aUXJqyKfr30UZDyPbForEgwv2JPobFOf2Wpx5yd7WITNF21Ak6vKT7tqbzkNbn
         zaTNzCGiXGUSs/fDQARIs2uxXtkP6HA1+1qQasy3SauZvdyULBYX4+WvnXRaFhx9XlON
         IYANd4QJZkJyxYJk/+jV7NlBC7Dli2o4tq1ndA36cS/zpSBGmm9Y+230DYCXhYIHun7l
         NMKqH56EI4RrXGOJ1Qzo98GJPuJA3qmBULdstg4YkCskdUiFHLLlIVKFffjvsxpdXiCK
         yrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=Cb62ORHakerpSYylbfCJEeDU0NDT0jXMaJhAxMG3wFSNoFuixTY+PZsoy3nCi1qwES
         l7r9Ky8x6ZPOuPs9NxqYKmxG/WGzOD9ULqoBvexffn/q+xe2d6ufvmJrs2BJFyztBWyP
         B4CLhMnOl9K1TZ4OijwMgK5Ew0zGKWciWY4/fFZC+88nRfkwVS0uG+ccfYl1KMvGGxOP
         rGubmGCF/LK4lcmEe3z3vsrAMYBKh168d7uFq9ujkoGFI6+hhFwq01XxEAEvrX+3Y4dG
         350mx3N0V575zsamgCaveklJGEGoSnMFgkrjGGomAOpteab7RC4wElpsGEkfH2awWOyt
         Ymjg==
X-Forwarded-Encrypted: i=1; AKwUvBzsPQxqLzGAUHVMskVuCwdoVYeoUcBqAyBxfZ3+DZiMQ7ZU92IhpUdoTWbrY1BFDZfw5dEaWtSzJyWYFuij@vger.kernel.org
X-Gm-Message-State: AFuF++nhAFhwm4loOUmOx9T/jijlgB8ybPsAcYjIJ2gNWROicQBaVB97
	0cNPOTk9xuskE+dAUIRn2gfwEA3xx6eVUBrLz54CmjfGg/F/YE6FNR/8rC0wAd+V2N3xtavvSjd
	6ifwmX5NCPY30vld8yhFkl77uzyudTa7YiqPMW9nqleZS30yEGdFXq0jmsFrDsdhC25E+lTiGHx
	Bn
X-Gm-Gg: AYBFou3x9l6IRIPWXbg4e5hMtg5entWTpyaHB2wc/D+zqIFGOb+WVOdjPGbymJlkAp0
	LN1I9QbhlTLnyFQnGPMa9v5/eIwzfW26xp8IZunMw2goZkjHlry3OGiOBV528CRCiTwAw252nTk
	i5gop/4opbyMwMiQ0VMSSD0f6n6zY4Nncx2NL7jLlGnBxS2sHwyzdKqZhGAhcplc1DCXM1uaAVQ
	1+oAqI8E2N2E3WI4L9cVSREElmLanlFTDTGZqX0Q078NWr/jreLFcUn3U+bBBEUEqhmkWcO9EV6
	rgU55Xas23I4piAabTjrH/ZmPtsd3eX7sscGo6Yxb2jfl1EUBTbz2ERZX3Rn2rBfaQZRZEd/VZv
	Io7AKNYnfTBWi4OAKHXPc0Q==
X-Received: by 2002:a4a:e606:0:b0:6c3:7fb1:b0a3 with SMTP id 006d021491bc7-6cb2c74c026mr10537834eaf.2.1790092866575;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:92bc:d59f with SMTP id ada2fe7eead31-7a59d968a05mr8239060137.1.1790092854872;
        Tue, 22 Sep 2026 09:00:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c42fa4dsm109135066b.3.2026.09.22.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:00:53 -0700 (PDT)
Message-ID: <b8117dfa-4dbe-43a2-8813-26cab9f274d7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX8exyS71wX24l
 QcGkkp4/H+YRpj3xfq6ndBya7sYpB1nrdnTPf7YnTsxqVcAgYd5dHdhM0uMyH91smchGvdfQV5Z
 +8Sh6JbD/zbSZ+1zRBj4O3fbDqs74ZbagTcCmrC8OYB2tk3YhIlJojV5N2TrszQYqLwpc1RWgnB
 Shg7K/0vC72Kix5+26BaOMJvPmJZz68kO8OC91xiXo24nkODI/M/Ekq+dmSt+Z1wx17drrzUJxW
 MUVCK3YZNqzGccaVG8+KFVoap/AMQ9anreF/LGVcC3j5YJGJtO3ysSqLQcS0H6q1XutoS5UScXp
 RuHolkCX0qSJktb4qE5SajEba6YMTtMYpNdyOjzYCIq7E45LXKUW0CdEK2zVE4T0lgxaJJSUqSV
 mQzzwPr4PyYzBTM+RjiCeDs/auw1JSQmkI8bQ0RbAh5fwfNOUa5M+VJcnYk9t8nDdrnM6MpQBv+
 n7kvNxiaSQhLEV/u1uQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=nLN2K7Ab_lPFtrZS6tkA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: rS5dagp1iVqSiA8AImJNv1oWEu9rIN0d
X-Proofpoint-GUID: rS5dagp1iVqSiA8AImJNv1oWEu9rIN0d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX66ldxRidkjXc
 iQUUx/PNtJKu5krfRD0T0TszXpEWv4P0jVZJAVDZ43KtGftkVBll2y07syzH7+7SRB5XP9ddF71
 BpfcCnEsUAwcr05m2VuyxSC4OIhRCaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.

Because there's (IIUC) no reliance on a rproc, I think we can
safely enable them all by default, same for the QAIF_CPU one

Konrad
