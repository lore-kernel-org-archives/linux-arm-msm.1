Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569964;
	b=DOWi0L6Hg1IDKMTIT9fmc3VcKjoAXYeUGa2KRhUqJ26MoRgw1m5iCpOtltXWD1hfsEtZ
	 WM0XCz2vz5Nq/PmTJMsea0VAoG+W0X3qGnbJxa0fVfDatlkmxrSMHtJD+W2hvXwX4fY3Q
	 Ncs6pMlxA0b533vuG1Cf1wUnJMAbSaVcnCOO55OcNVrYiLfoBdk7nJgfpMN3WOY+g3U3u
	 m074gqlpkKtg+6fPjg7GU0z41dIvzGmIOADRKMkHAHlReKWKgsgBFuvRAU8CuMFA5aEOE
	 9TwVOZeeKMeEmx4pAKPfv6cYBAg8jwXtCBNeApYFTq4nSnsf5/8utmWOhwEiDqlSt/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
	b=CrLaIFwdiA8iQJw9BOj68kRtzt+/fgPM0YBhcLpGX4Tq0Z5EI3ZzqfxK9Xg8c9nLCrWL
	 XU+RisYyu0IkYvvpOkXCLsocI+PF0NJA2+GtOzI/1nh7mIsr52dgmFvYx9Chusmwe/Afa
	 e87VjPgECdH0cb0tgU+hi7l49eqvm0iE+QcVCQblpiA/oQEMWzWR8enotyf4jyYHiOkVB
	 KS+SW/WJ7V1KLh/iJzHF9eE4v7yi5G50WpSu5P2Qon/B5wFNxDSLD2TSSMtSqGqyRoUBC
	 5tax3BaM/TTtpoYqq0nC/mZIPLu58IW4vDvj0SqtQq9DbKhu2e1K+UBjMb9Q7oaDdFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbSUX4lB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrdATuPJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A0606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8A0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbSUX4lB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrdATuPJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7PvS14101121
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=; b=XbSUX4lB7yzP1MQF
	T181P7q7oRydYLPC+aK6u01y7GEZqlcC5u6Wo8VgSf0Zu1VH3Et+twsdsblyvVrO
	agl2XJh/2zJGDB5F3SAtJyNxe5E/HmUERZwL/3+HitQKVwjkWyVXlHBrex9rg4FS
	bzdem3AopgTb/NDkqgCltMfeQESHVuwdFisO2T9A0VoA3lWrLQQSoDKVz3R8rC3M
	w7VvR4yyN/05TK0ihvf6EjP51WyjwKuiH9Ex5OoRllvG0ortwArhdWEpbq7Ypec2
	TU+QD2ybSeOvfWWIw6lMjiKzLI6RmL1inOPKOblfbh9DffNijvsUTZrtp7Ro6ZZr
	AjZ5aQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1tt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13662485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569962; x=1793174762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
        b=XrdATuPJ+MTxWQOx+MZWxhDi8skZkT3qvh1finm6bawyY0qj0KAx6WSQO0SfLuSyDA
         GoAvc1NsfeFctA8s1WM0VGdYNBJnRv3Sm/CWfSC7C9v0mwVDY6ZfsxbdqL6oC/eAFxyE
         nfb6oHC6ho7bJkFxiPUYa162bebdsAqeqCbmMrZrPNYFKsnJJQvRrgr0HGmxxVs7K4Lm
         Yoz/EAxPT3yLPWgt1dvIpvSqIGjHpOWFKof8+DN8CdRhj+jhot7254VnCVecFrf+JwxB
         pEriOc3OvAh2gJk5dwiOaYypRVsM+QUUx2QOdcymMTe9JIVhx75FvCTTTJWrqS+zdL6o
         8hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569962; x=1793174762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
        b=DGghFFG99DSsD3VtWuhbGzkfx+4G4P/Zd+6f/g4WREsz97cXYMtz+j8QJFBdUKKq8d
         sioYK9+YD0K3sCuLDib2XN4T3wpWlAYkAr6C0UOROEnbojJKyRd4wlQfqF/d+h7EgXJB
         E3Fmip/cjaPDTOBoY5E25/oyNhXzlinuWMKM32wc66a2yOpYg9eVwvrhkWDa+LLtHRe6
         o27n0lwcnifOtTuz0toSxh5bLZp0nS4RPPWJt77yz9RgHmgRejqYmzG4vHG4i1jY1Tek
         V5vdEhz3/Gx2bw2GHZhz4RGun9SHLkvzO+T42uT55HrycwEPF/2ju6olpQeeeoZ2DTdY
         7A8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwia5oou22zCvUtrsCRGHhOZoVoGq3Bp/jndibdmzdmfD4zki20o4lrInKrTOvz1oxriXlABLXRuvfuaaEA@vger.kernel.org
X-Gm-Message-State: AFq9FYJYphiana0J/6f97jOmTYsKmnGGaS2P0e9YLw7jwBYIzxwDu4JX
	Gb/DyNOC551G8h1Eodi94H92EKT583eNDfaCXd9CseiSPMjEB3n8yj05dqY7gh9tI8PgxXDn2C7
	565sFfFSAshxKI5dHFXorytuh6s561brMH5qHHe8uR6P3FG+/rx+C4i2HtVc0JX7KbzoT+IW6rA
	etzEEWRA==
X-Gm-Gg: AYBFou3VUU2Cd2u+AJfKOtLzIuo/ViBl2JImnzuBxvvCK37VLhVMYNr6iHZwrW0VlUW
	G04NQZqMNhgMkWs7TpaAsY3KWYrCajMLAtUn2Qn70CIDrqSRpNUIojHc9OFYgWhgbX7FCrGOY5U
	gWgTKX4R1V2A66eglXqHtzgljcSLFq78g4z3Nlt+ptVR7ncy7q125Pks47D82XpI6aVcLwW6OJU
	dfVYquy/YMVattWAlB44Whs0h1d5VCH6hF8GRNpiwbeDZcB+GQycf4/ZsU0GBc2rz6rpyKyOLj8
	ryNNHEsJvESZr8P8OuTQp/IM1RIkyR32+dvqpj1offiINAxCMwcyX9/i8C/8721/G5F4XfIfv70
	oUtPXX7AhqO1GqvtBsOJ9OQ==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr340886085a.3.1792569962336;
        Wed, 21 Oct 2026 01:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr340882885a.3.1792569961901;
        Wed, 21 Oct 2026 01:06:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm550186a12.8.2026.10.21.01.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:00 -0700 (PDT)
Message-ID: <3c5f973a-c97d-4a76-b357-09f8feffae28@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:05:58 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8726a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=9eXLaK2AgRjqOK-xnasA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UaVDnDyWa0t71gCZn1tyilIXQAPKRQ8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX04YtpkzI21iF
 hnTtaE5ZWnlZEjdBdN5WoCylQGA3JfTjLPg7Ec+nWN42+zw57hD735E4UGnrNAXG7KDw/ynRHv/
 pT5D9zvvyFYtBL1OL4J2YVXyNUA/mXDnBXKmaip9oE5PueN2IzkEM0bC3+lpJ6qcmN1fpeXxDgh
 xL8UEEPh8tWDDdr7lMoHaKN7qGzB3qqAgifEZdF9fiKeTL7OPy9iEpM1+Mibb3PM+CTPwV0AOjS
 VdXaP02sdND6YcGIefTZDdBMA0k5w7PKe0YHQLiRJdaRLGzH1oqNuUufocnSJ2XWJflEYkO4QRA
 RFeEl3zItBELDoN2nZS4BxLwNft0UDo9VAQRpaEERNr7vgNhIivEwBb74zhAgGp6Iu88kTU+JPf
 wGrGip4C7k6WOwgtVCubqk0Cga4w9xemE9nl72V0G/duH6N2bt3FMuyDD4PlovOTTfKYI/DxqMS
 TdY7ivtq6BJB6rymWtA==
X-Proofpoint-GUID: UaVDnDyWa0t71gCZn1tyilIXQAPKRQ8M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX0Itw4vsovubs
 Cq+8uy1+DAhkkMqUKSp2CWRG3Fnz6d2qB7ygjEWApRIqqmP0q05xLl23eYHA4CqOlb2RX/zXJRi
 VrcrUtAL2W3MdRXLcfeSulNrvG8xReo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210032

On 10/20/26 8:54 AM, Julius Bairaktaris wrote:
> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> 
> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> which takes its AHB and SYS clocks from GCC, so the device tree does not
> pass them back to GCC. With only .fw_name these parents never resolve,
> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.

Because this is a "never could have worked" situation, we should
properly fix it by adding the DT references to those clocks. This
way we also get fw_devlink which will ensure the probe ordering
is right.

Konrad
