Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48049331EBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524918; cv=none; b=bfd5hdUNbnK/e0fDFlfBmIIQLyRDljr/JDYutG8CFEvPNytn1vpF2xIagBEaNJ6OkqAHCnt3lVt4YRN9d7o49/xNETfNX0ez0+Z6jgBsOtn9dhc/ZxQjryuqnbCTYuk8p/rt6yQ8qispfjlAjp1Fvqfqa5y/iI3KxNg7H4eo/w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524918; c=relaxed/simple;
	bh=F7MqsTpvXEhShRZzCrVhWm+SLKO+Vc5RAc23Ul79HmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWv4MtsTH1OtGnP/iG4XCbkZyZsZ4Bud03eewqUCAaExlukXkYFA3oJZFWA8n++SyIUISJbrIB9V6oRSEGuvPyIodhylH7LkjMskPpSxmMtFGfCXiKVz2J4idj8KASkt5LhJK7lRw5Ee9RklL1kYTNyH4o2VCTG5Lw8NRhQoCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL67h0iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfbOGbE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL67h0iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfbOGbE1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YpXj3847917
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=; b=cL67h0iuMunP3Yqn
	+dKF8mXZ2XFnPGfyvHp1w2Ih1MY1WrOc6GqtrXdddlSD7I0/N47HFrp6Div3gJ4N
	KSf0k7v4+2I4IDFhcaTepJbDkcoV0eepRY4mCcUExPzizr1RZuCVaqtdzohIYdkq
	C4aobWj+TeBFiCVxLqNYUQouMenBZeDMXHXsWhzR//tZPW8TUGKKDIB80rQmCA25
	ZujvmJvrbpJtjiwR12Rs24X/aFvxhZSvEsQO4USZgnlEgX0t2cA5XejgTsQc9YBT
	Ad1nc5Wr4jv9C01nbuBtwEPSe7UWmUWbuftY/gnXRceX0v2IsDfI8M7CqP12vA+M
	4zclJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5k0pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:55:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so932244a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524914; x=1787129714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=QfbOGbE1dT4ou/+9LRTPtoNUH8UNZMkDn6xnSeV/pE9QkX4Ue23uAY+ExS9evvb+Kd
         Jzz9jdosEVxztAA5YkGXoLBG8A7dFoITcxBJutE0Fe34VCuHV40njSjniTPwPym4o94L
         nTivS27WwQL6OOhaJm/FHjUDOLwhuSclxv/fVdomAs6LRniVUrPj0FcvT1TprseA5AKS
         HpaXqlRqiMk526WE05YSmu6nxX5b1/c505GE908jb+CVU0xJPVzjlUNQlLBxQAnqZvKB
         jWSpAhZHbRetdAVodjucv2osdP4avQz6dHnsoSVhVhuHKWSJnQYcDBezx+o+LjJcDSuW
         JQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524914; x=1787129714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=cXuC2AvUo8ls01j8uUOgG0d4SzGj7B4DU1a0p9/ShRYcvCCaA/mlViY7PlnMK3tG5W
         PNQ6UbCXhi8cA86RZ1Bc/bK6c14Qtq/TidF9wE5LHSyrOaqCfsmkJn2GrhGJW3P9p3Et
         fSKb95kn5hqnWVvG2oVtvhgPLpMvPZwho8kIX+lFoAeRNUKSiFHXLSh8tuljpDBD9dR8
         FgpaTZp8iq1imBkVcDHiIqm02b9nBNQtaEtAsDqATpEVdwX3DBmNu8H4H475h6IsZcEv
         qaaVrs4hhIdbeeipKG8Nq6BqWp+2MG9KF1QFXqv369J6Sz+9LmOqrfO6WIoYjRvIOhbd
         JV/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1W8/AOvstJDbH9H2w4QQLNPmB/ieBkuZBKsDhTHniNkn/RC+w1z7s2q6syiH4E7r3A31nNifiORntF3ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TDoOy7UW+xH3+Y706QEiGU7Uwmfr1BDvN/ePgFXovUeNNPFs
	YKkvM4d1ryx4lfCa+QYMtn4KAWY6aC4AdFmVIUqpFBuMe7uS8q5N9KJ/Fy1gfec/7dP720Np+0X
	eQFEqI/LOUSkAzNPpBCDta53ZHuhZr6iPU+dkP1lbgbwBpflP7PVwNb7EE9MfRwyUlJKf
X-Gm-Gg: AR+sD11zZ7lnOE5TZB+lFU60wqP4vyO5cLzvLlSlMO5tyW49jGt6inolGBvEAGYdT3T
	dqDRrJszVw+xLYfp7g5JL6xL1KkOjnptz7fea4owR4eE+7M6/CtbXI4+DHI1XamuJJDrAz5Rt/0
	+UtJey/ozAqMirXRBnI+NpfUNImUjoRUTofPQMfCUZQ7Z91S6gaHnFPBvS6g2AdSoAX6cwD9LMM
	FlNHGeFcF+0LS5iCvW5PEGIebbY08g5NUzm6BIJtiRwei6gIPyDxWn+DklwU3kHRH/hTgpQjCt8
	AZVVwGBD9yCCcRonCSjGN5VAt2ZmzAtEF3NdNHUgD/tY9WCfFFntp/V4BcwGq2opEeYb159tblB
	8iZPfjKBQv+sgEzaPmsoyObLIf/fv5Y2iRg==
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605683a91.11.1786524913690;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605632a91.11.1786524913227;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2808212a91.0.2026.08.12.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:55:12 -0700 (PDT)
Message-ID: <de19d0ac-3b3c-494b-a3da-028570989bc7@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:25:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfXyliI2GYTCZPk
 krtEz3rIfuPtrKctICHrHx2C/BH989eDGFBEaJQwuJog3f0qLWOBL8rD9mL/UO0jIlzH0qIdomk
 bZsFzvht5aXgtZWJWdzJYQTK4jvUcSg=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c34f2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: I4hgdsjoXxpxGCFpzMDidJo_z_0nwG7D
X-Proofpoint-ORIG-GUID: I4hgdsjoXxpxGCFpzMDidJo_z_0nwG7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfX+c54nQCnnKKN
 bCBiTz8QI7xpDWPXACNAyTTBSNvfp8aVW8Z0PoYL/kBR8bIjtpQRFmC8scGlQ86mcdPAn3/52kU
 dzx87lz1hIcd3wca6dYsObE+6B9V+iy1OuA/uQ+FIRSSUkoDzNoWfws3zrl6B5D1vdCYJWCALx/
 TMyO++xHVOgVNQI2p283l3XTrQ47rw0KfgJzUV1zEOlgGUppEi7c4H5nimOAqE2230sY9gm3Qr8
 cvbSZxsPV63N+j81GYfUm7zc8G3m4w4ZagEkqPIsHF0T3n8+sEjwtPKZNvV0VYtS9O1y9OpX0TK
 ulaUPgtrMoeeenpf+V/UCimfr35vne+0Xf1xmC0dIqsFinwA663V6l2qTTefGQQR9LxHV2/rxVd
 BAIkUtAn/kMPhKI+dwjaHqJ4yeJsWNhs/pJi7CSaNWE9TLIXFJx6yJ9iw216XQXf3orHD51WcH8
 ySV0Y23QtmaTf4peBnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120070



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.
> 
> Introduce geni_se_set_rate(), a common helper that abstracts this
> difference and applies the requested frequency through the appropriate
> device. The helper automatically selects the performance-domain device
> when power domains are attached and falls back to the SE device
> otherwise.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
