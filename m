Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100282;
	b=XCJAF/+TLjn+cztsp5H2H0895McV+R1H1BhuEQj7K9fKXB1Pv778sVs+B2sqP+q050Tv
	 FCIp1JhKTcoCjnMfc/iEB2p74qqRyGdaUNxWqMHDVJ3uKGAj5fKF67rCz/Dxdx2D5kOvM
	 nYKTP0vflMQguYf7k92T1gxdciz1nSaFSCPNInE7kUSe7XjWTv7YK4UemBtMbW/TT1//1
	 tvzxf8gcOf1gI+tTdGxmziaZYx1dyf/6BBkVUAD5XT5JMvOIxNo5YgEkA6NydCugDSba+
	 S20QaXpughDZ3VMWLyonIxScxJf6VH1j6FZJUw9ImEKmDqZL1WBOoEYVsCGo3tx5ySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
	b=KWUWvn/mA+R6fyzTkE9rhk0HN7R0sA2gLxS/BGk6iP1qE3KP6Xv12EwjaDw2Zy2cNDbS
	 h7umlp/qYFIkJFqHuRz++jCrmb6DXus6BrT4hy0xjNGFxm8RTDlLOgSMFYDQZJPkZhlmb
	 kX6UdqcRoxVrNQ5dCqeWBq5F+lYF+yP+91ukeBjnJO50FjiBwDEWQu8Dz2Nxx0WcfMcST
	 S6txZert6PkQYgwoD0XTE7SMcYoww4ujiq85SUPeuwUSAd1Z+mByit3hrmHDJyGB1fEjG
	 Ppl5z7OfDzPybt6PxVsm8VllCYL8X9WKVPefiFPuWf4eU6ziq0wG97APzIs8PFPpqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TRPH/WHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hh/hcgDh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FC606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51FC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRPH/WHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh/hcgDh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe6dK1935934
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EebyHFSMp1n9L12tdULGndsY
	oFeYpVO3FQRxlQ5nOoE=; b=TRPH/WHKXcU5bERME6r6Sfqelaypr4fFjNzjkaxa
	YrKCMAnP9iS/qaiiZnI3szfyLH+fhSPrLUAh124W2cP6GCejTAUF0VLYQE5tziKx
	/tp9d+0n7MOqWtc5qrR04x8pqVAOzXfsFa8QLR5hC9Rle5Sk1Vf5DnAgoDZVmm3D
	N9JWzoR19LOkbDBTtZyjJIpwLMeUwAw+VsUiYZUw9NRbOM5nqNBYYjq8Dd2d1N1/
	G11vD8bnRc3SdQoRo8L+9kenhO+kBtjpn3S0pVeCzGjKeDwCXLt1pJtUtSKWMDg7
	vdc6EgW5Pc5QIdYY9peXirc2Pfd9WGOvX4o/EorN2Bsc4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtjsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so671137385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100280; x=1793705080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=Hh/hcgDhL9DivEOD7blRfa5Qz8zze0LKOjo21tSOf0TZCss+yRduFCrTULIjdCe/Wo
         6AT8+iRF75ewkWRJlh01YOvekeRQgsPOT/FHXvnBPlZKfnNDTTBeOz37Y+kQXSeA0iCx
         qGGqAv4ETB5RieYfZ3+QX/4GLiFp/+b9g5bn3OTZXfjehq8bUOCtkP8JDdnBiYxbgYHp
         GWrXqJHa6NzE5S9r3v+JuBq3jA8J1ynNEX3ff7RXdkKK+MgkywnGC37deWZRovPdvbnO
         YP1SgqC5y+qXsTxjdit/IRn26FeZ+wdDtZwWifK0J6qxtI8lgLgYpF1Vd9c67tWddzRx
         SvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100280; x=1793705080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=J6PLZdBDeDxAQAB9ud44r6tF0/6G5XmkBMdNY1I21sRHPZ8cV2bcMpGyljlxWYEGD6
         EPygL/s+7Ur2wuiAHTrxtmkSpZZRHY7lpVF5lH+Tzw62LEgv555FCZUHwPCbGN84G+9B
         i/xSu7n+fDnKGRXDZXaK5ZwvA+rjX3CsSc0yY45+hAkSjpVc0+J416KvaieDOydjDqSr
         l01pS/YzPlas3+BQ+WopIyEhCKhKoF/ctFB/F3h2vD4BWVYE0eXO7pKcW6sQaV0QHSBG
         yx5LtfFGV3En3NG15PmdU6dxRAZK22bqyiptnoV6hgw5lejYxvybnmqAC7cF8QJMoJ/e
         csdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNkxprx9V/uWSjLXvvstiBYoMmeAJPuk8rgpKGZnh4fSIVyjTOx1Q84CMUgVddSJ4LjHUbjIqYuEc4AlmN@vger.kernel.org
X-Gm-Message-State: AFq9FYKdjmphP59GyeH5UQWR3d6Z8ucXdKUXBNLI2+p/OKF8ERySMbXV
	jEgRC72x5VfSLZqflhU1YT+nBUhTalDATXwGQZcNFzbxahlvtiT+B2ELJTcNQEz78WwYASMGhkX
	zOyPEu6Xt62J6+jATZKFGxybBprhByj4BG8xh0GGSWo8kGrsw6sqiUc3zAM67NaY3teoH
X-Gm-Gg: AYBFou1OwElNTVXH6dCEdymBnP6mbEajQ0Ssg+EV0IFLkL9feEBVfYx1SJ6dAp/uCLG
	nFIILHWah5qAZ7eysgP/bgu7t87VtixH6hm4exWWb/6/N5UV8k0QpqCXA3r7KPWmiKWQQ9SHYz9
	2/wQ0nYEnmTDmXq5bSHL7cQZc5idNeF50Zr1eVIfzACUQbT+aCyZXh9Ezn2YxffmkFvsPh917td
	xaPt1fMnCuYCWw+7NIu5+ydBzXZv/pS1Cef+uhQCNv+PsMSag4EapwVQez8riGES2wBr3mZKrzy
	a9msEMy1anZxu/ppQ/2spLqyaMeklC6fBnZb5gtQnnPGVKamZQj0eKTBaSQ7qwz3YAX18YMbCWM
	eGmBC/EnnL9fmvlNq
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488918585a.18.1793100279934;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488913785a.18.1793100279289;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm20649357f8f.22.2026.10.27.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:24:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:24:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
Message-ID: <dz4woik4nsgqpyahkbzvxeq65oaqhopvf3mltpsxvf6dpkvof6@zjsv4sbzjfjr>
References: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
X-Proofpoint-GUID: iN8fNeguNurzE7CdPcV8ny84MYhY6zv0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXx7pmkKuMEg8D
 d4npMqBLDqYz7dBrs1ydMCmN4rGSYizlh2sm5Q2L118wDfS3lIqm7pakQJnFOmFEeg8VEOYrZ5O
 UcIoxVHX4Jmz+Mn6iFSzXQvv8aTamzs=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae089f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=v7bdSaspc-564zGwiskA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iN8fNeguNurzE7CdPcV8ny84MYhY6zv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX/23RhSVcQlum
 aL9fLQ3AVKFfNexZaszNzyF/aGsv8CTvZuJiOEIpGZhRGMZmlXGilNcdqV06BzI1K3hSch9jT/C
 /7Ctnf1yWagElkSPwBgtYoZdDgy+UUwPgREMCz+CUGsGjq5PTaEggTj70J7sIcU2Hfpo7/yn3oN
 URYyewKUX/7ezp3sb+ojHs/rddY0qbPhZuRiPSGAxL/ULv4IA52yghbKCtj8bcZXmmVoJnbKUN9
 lBAQzRvvGdg7t+sz07ngtC5fSqDXRn4I+ahLSd1OuUvmMMQIP9npaZhAkCKuV4tLMIm2U/6/zg5
 GLWC/50mvhKlS0+bow2RbVtrzjY6FmllpP2zERzy050f2VdtsVu0ziUezkNj8RXVdesrAJOqmfi
 OpOQB2QdOp4smJyIdcPdS+MS1AUVYALT0sqRB3aD/HKLcQQJ+h6skYJTV5j0VBbsq5QcTTkLx7z
 +KQh8exFA18Bd6i0tyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:12, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
