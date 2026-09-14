Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0F4519BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388802; cv=none; b=AYO1Gkiq+Mwy0+7uizXpQiENqq83NgkrF+Iuwm9yliRRAagDOgaI+9EScR5ifPBpB6sWckNLrjjYfUN8rDWtLAxQ3YwdUwJVSVYQDDIIWq4lWpy2jQb+1D5PJ/FX36rFAUfKhHKqBIWWrzGGFZ0Ok/dHKiVeO3a3XGP2H4SSGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388802; c=relaxed/simple;
	bh=j+hitAAPFMbwqsPEZqXJrefI8wl7jXzr76x2hUOjwDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJjCeCnhvuBO1QvtXOzhLd5RqWZxtv3Id+MiGi5uo8C+XPZyZUA0yGZhF2mhnHZv2r99AZMQNGq/WhXQAsrIMIrG8eswz3YGQYsnHQEJ92RPv/rtbSEtcx6nNBpCvJzKxJ9eFfuQklUvLI1jsE3u44vQGuGq984oGDqdSMByE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENS+aZQy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8dqLSLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENS+aZQy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8dqLSLl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwds3860401
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=; b=ENS+aZQyUZgwESD+
	sH+FTSLGIUnstA2I8fW5OGA2dDlXsVl5ueHVVmYf5AkNc1IghAFvGrfvMxWJJQT+
	ja/6n8tG6V9ziV5go1sKcOqHHlCqn2Kg9YtMkjXSN/uXh3NY9keL37UVDYh1vzNI
	Fp1zq0SL0c4qw0MjURIexfJYw2dvADhGAES3wu4eUuN6byNVtC0Ksg4nMorylqxC
	HZYVvsAmsdB1eET7IZL8m1GrteL7OeTj37QrS7khjb9b1AyVnyZnHTvHcomPRW7g
	46Beq9HERQ3ZZN3zYn0wWlVIkZE7AHxGIBCUxK3Fr1YPUMq6K9b1EyU6c7mHq/t0
	pLZuNQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so115500e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388800; x=1789993600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=T8dqLSLlMEBOl82YKqEvi2+JEQ5bGyj/HzDyx7Iv8rqy6QisMxspjw86RJvJjGdCLW
         vujNHi0v9yPqb9TYVhkP6MQZZUxz2tHp9cltP51uB5V3TTQztPalJvm3RYZEMLIMTHuN
         f/PemZEDwWjZZuIg8blmHpIJK0sTUCSAKEMVTcva3qlLs89uMJaeAaa8Qay1YrJe49Uh
         DJ9V9I3DpgXg0IdAgmihPz1KQCiMEgOKzGGKRnqUhm8jJ40390K65pGy2CG3vxw+PSU2
         B2Za7Ibm9gppKp8QtcNMvZby5X5VNjNRJDBXP57ca7gcU7st5W7g7o6Vl9gobkfCm3t0
         rI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388800; x=1789993600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=bIeojZa07Vocg64HRG3m6FLmOjp80OT1lXy94Iy/ChZ9MoEyIx/VOaOyG5fMko0gYq
         yCnC5WlS38VIQ0nsST6EVyBEJtOrTFGvM+CBjHjtetGQdePnOiubjzos3reCG30d889R
         yDr64Qj1Whzg+SUCzIbFkNr3SaTvsIZR4oqXGDSNa4PqnWSy2nUWrum8STv6BgFToPxv
         HL8NNl5GhmJ2YPOlFO+0nj4W4fk+aPzCv4n+znUUuIdJPNJGGARcIpRZMW79wLEamRX3
         mqt8HOpzXtbqhaUjQsOUQ1eWYth11cvUKTZNqLSw9/A7WWqXtaWdqnyslpXImVJCUxBa
         i4Kg==
X-Gm-Message-State: AFuF++nlKe3D/2HtQBLq+Qln9veOceUuICplGf2jKFyBARBEfHmq/wYd
	Aj6cbCjlNz/vwiOJU9OuW45DK2+GNBm1xcaWr54UGKtLOW2gwjpU2QCFL0/Gs1FJF02tIV2x0yS
	7wzpEc3rwEHV0UYZMIcpe1aIjYn9zeOygIbTZceAG4+qWeYBfCS4b/vIgUGCbXPMoLWYs
X-Gm-Gg: AYBFou2n3DCc4OoXUIQHlvMg2kq4/dXC4fdhzcECR/ufPGzORbDsGViUKewgoZq2AsC
	AkHLctxW3IGDiyKEPrffSlp8rth89UfSam+pIPHFZZ7kF646ONIULw9qjEowzNK6zbB9vFVyXsA
	i5u1okMQL7XtjKRRrMaWS6BUtORs8LZ1mZMDMS2GAvLFHUJ7fpQNYYwr4HSKz6ZOGSpUBSB4PwS
	HDydkfPQIEbkfDdTK+ccbdhpMHYu3fzD1YutbQ7LLFHWb/A0whshJw9/EP5FxNL5kNvFuLAVVIj
	sGiSVVQMzKaOce41vexotlGW1Ln5j4Y/2Q0wMJgZbFu8MbgOCFb8MBIYMqYYB7FjNTFF3L6XTxG
	hz3gHpmBSt3JVaNhZdvRD5g==
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331114137.1.1789388799666;
        Mon, 14 Sep 2026 05:26:39 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331102137.1.1789388799225;
        Mon, 14 Sep 2026 05:26:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:38 -0700 (PDT)
Message-ID: <550e3704-ff44-43ce-aa0a-2a1a0727773b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4xKTao8JAsAQHQhugvsvC30Hy5DlI5j1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXz9cgZJ+PLKzM
 /42zijMmpTv1kc138bnkV2hKMttNO59L09gxzwBpse3N+Q7m9nLdLtVtwQSs9hRIinmKh2/xO4F
 au0P8bAR+6LC+qVSKT20TVhZXg68OAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX2BGL2xSVy8st
 gdwLBuAr598opeJxmhFAUvWFEqLeaerZyUqJBan+otFf2bpnLJ3tIfMCWj+yW+95nd9HJYyq7lU
 4WO262bjzgHuGaffP5sNIf8qu7D37aOIgcSzZJ5aMj95R8JfM+heiUHkXvsQRvXaR0Acf8PbWFs
 f15xVyYzlYJA+hjvkuZ8JxPIETK/OBHS7Au8BHMXzjwZ+VK9GEPR5HLrLKt+TUrk1mQyccwj8Dx
 1FQN/qFATA+lIgcu5apIvM1vyFnuEIqMgmWfSEq2OjqQmQmqHkslplHU407EFJPrw9esFdH9QaJ
 lIT/dslyA5hKMqub6vzSWjTDFDBQyjb6EYkZSe7hLK/vKIEViDzQD14lcs5BVhPwgCbi4+emwCv
 wwn1zaieFQ9w8qQ2DP421jcP4HBBAk7B/J73EdsYDapZmlqSuD9AYYEiOvtfBFvn/jVaxG0OWeD
 85g21YDVALp+lTFsx4w==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e800 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 4xKTao8JAsAQHQhugvsvC30Hy5DlI5j1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
