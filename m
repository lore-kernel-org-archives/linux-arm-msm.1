Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66529519928
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651227; cv=none; b=VEnjqZZABDTOgqVhq+8aEyvOq2xtjQFKV+KGRO1Jn/pstwve1vj0/ZBXaKBtP2VxV3BiY2NsUt+M3GjjhvGHB3iLS3x3xs4y70/FZkcWJA+98lfPU+sZ5xXmtAu8BO8jNHfqUbkMFMG7AUAVT/BTgpFvfqeMs7aD3wbU2QhY0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651227; c=relaxed/simple;
	bh=g0OKgrYQTDfjAAm4doBDR1j3Gm6aoztZ1YM4rmFwJ9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZT6IQdzUCSyezUAqiHznKbsgh/FK+UD4Yjb2a8syy8uJ5ZKAvbw3GK7Elp+Ny3G8reWGA+/aVbGnJBmOSyTBNNjIy95bRB5x3B15jkup7FafBjkCWmaZuFIEwZjDlJJ6nZb7kwIPi0NGVyn6t6TNCPI8bLm0s+RMxElaorvT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZfXe/8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcnRc/bQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZfXe/8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcnRc/bQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zsm81863466
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=; b=hZfXe/8Ytpnhn+ah
	Ql6guasgef1znqZW/1iwQEzbPLrE//iJXRq11c6xUwx5Wgahrveh+djCFsIRmCRh
	e9ULl3ew9/jlxSDfbKxMTai8/PxiHt1a8gw0QHZMVv8C0Gq4fynVrjUqHl8b07Tz
	/p6ynTD0xFTozw7cgHrNnvqBW+QXAri8G73pSARTBqENwoCRybqZTqRzbet30EbF
	soBuodYzs3vgydYrkGalNfUee4fyqO5SkIEIsNFdPlS4XDqKKWPso2l//0oIsRBa
	EL5qvOaryS/CoEggersHh1c8B96MAssrSlr37FGEgfTxUgRXXBOo2ww6j+3ge9eT
	URNovg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6avdb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so19431075ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651224; x=1790256024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=AcnRc/bQTG7N/3rm7dLNi7x20LhAorOYNNvJWCAdOGo/3G+IWa+0XkEz23iMAMPMbJ
         vFBn8Hq4ZjmFLrFwRXQanXXGg3Dzuhq53kSpqDUe7eTB2Ms7CMkNqaNHDfREtuRXB/us
         TN13WnLQO0AXBT3E9M58/8OFFYBROu0g6R71nKA921tY77SBDuytrpR1WrMfPgPXzdAe
         fkmbBZDbrusxWa2NobJsos91A3S9rJ+/G/VGr9Pc6Df5j/iZodM3CXG7GVVoUuoBxGI5
         I4gsdw7hLDqWJ24lMNT9C/djq4tpA9iRlpqPVzMqnLJ4tL54VMC8Xo6FyuyBMfEVlSV2
         GGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651224; x=1790256024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=a/AUn0gjIuFJ06Om2xl8iDbnlhhqRpDOvEtXNvhuyL35jyJu4NMib6wJUs9lzb5ofr
         DIhtNBLvOZrrqcTTlBrWLg6rd8ZcpTqFZgjaXWF8cLYXxq8PrHKxZS7IH7JzMSFelCHr
         RD1ocfaYjNfAH3aiH4vHv0jzVJaYlj8IZ7GhADn/gheqFxWiQAs4wKtFBMPZ/fV0Oh+p
         7ABHzfD7kT4F69LFTcSVBOubr7SnJLWDHoKa3cvhkyqzZPLj07hsVys4TqPlyUH5KbA9
         bqo9UHML+dNIoWCFIiTLO1xb4nbVfJF1+6aAND0UPhczNwQOzEGJjy97lweEl9jI5zTd
         nFsQ==
X-Gm-Message-State: AFuF++mGtY+NnXy/QO8dHCnoPt4O0axgWihpwBvC13YQbjNCH1hCYfgL
	gzJqQOZHYqEN6YoyGb5csCqPaDr/NmNl+kl4WcYwNmqY9bvj3goqlRIZMstEhyGEMRUstDGzuH1
	Qc+EWb15B5b+a87r9ubXC0WR+RVE6q3ukQBbXVJYjcP6GikGplsvnI5mbM/au4oLNRaBV
X-Gm-Gg: AYBFou0JSnmfKuNTUgCidi4QqCYHzVFEOzmev2cFOMUGBaqNspWeFYqY72msQLBl7P3
	fFIdOKLdlaAf8OWzr8ASlntmpHOqoLDPWWovhG5ACd1/5t5NCFAERSrjRi9lwdR781xo1ePGvwl
	ZenMMRRmJR1J9RXFR3ve9qoWRgObhBM7zTwJYxhHN1gVNQSAcxNVZOUMe2kNh6mp29z0gSfx+sj
	2jW4paSswzGx+QXkupWrr7oZfgk7rEOKThq+Fd+DYeU4w5F3rxsh22IHa5m58ikHp8tGn8/41tG
	T++qW+CYHi7KST7sKxE/CpeqjrYp5p4Vzo6s1DVLx9WxHz7pF0kOiJCJS5BzosCHYFTBrWBQouE
	KLfkcJVyQ+WrjhbFuA67+k9wYgo1v/JkM+xJ+
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141887085ad.2.1789651222532;
        Thu, 17 Sep 2026 06:20:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141886355ad.2.1789651221893;
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm26488215ad.82.2026.09.17.06.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Message-ID: <db725f23-0164-4416-a148-5bc2a4520a4a@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:50:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
 <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dySZ0ysOXSFgkfXZSIZp4Hc-1F_-BMB2
X-Proofpoint-ORIG-GUID: dySZ0ysOXSFgkfXZSIZp4Hc-1F_-BMB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX1Qf6mJZ9sExC
 eUBnZMbHoY6nGyV5HCs1fIjcqcwSzNr+jIIvmDzODqIZBnDE9+nDxDa0HS6/2gOdyCtD1u8ufRN
 Sa65+fXFiSgw1qQOyoPkUbelZwyJ1bOnU0jVDmvddITrlxa8XLLWiJpfRyBcfSBkHhVsCFig1pl
 +7VAUSjogHEfHK24KuNpgjxHOuoCedSIb82dPxnos4M/VtcO4hg3Yc8zBjHv//q083AjyjMeP7D
 GwgDttkRRkVqKkXA1RDzxTss7UdIEh6tfnJ+yBXPozwMMlbpyRraDsATM/oTj9oOdzNk3ilrK/e
 VIx0WaDPRbMyZmdrCiu+NyMRIYEkhKjWqppGjYVSX8h1/GPr3TYOxldhGiCnIsCWOuDwuKKUeDO
 Z9GVIRbcjU57V15tSYJaonP7FALH5h4CkqGRVr+WRWhHxA2ciLRTgzbSeWysPbdtKw3ZM3LK66Q
 EESy/brcu15Rr4c539Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX2hExjCN93BuQ
 Bl9Sn3RIbauk1K2Mpy+THIxNPXXzvb9n4JAfJxRyPMcbkDhjh7IYgwnjBFP3cNiTBHJMFULCmiS
 LnG344Phgv5SxwxPXBB6AiOnn3DX3fo=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabe919 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0mNTRpIox99THDeoYOAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170187


On 9/2/2026 3:48 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
>> Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
>> PMIC, and essential connectivity, designed to mount on carrier boards.
> [...]
>
>> +&gcc {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK_A>,
>> +		 <&sleep_clk>;
>> +};
> This is a NOP override
Agree, Will fix in v2.
>
> [...]
>
>> +&rpmhcc {
>> +	clocks = <&xo_board_clk>;
>> +};
> Likewise
Will Fix in v2.
>
> Konrad
