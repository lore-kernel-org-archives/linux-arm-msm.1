Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2E34D3A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136769; cv=none; b=EqR+bj9huBqrpeqyZe7NwgLj38blbFz/Wq49MN3oquKdH1zFgvddP1ouPrqti/P6TtD/sRk3sSc7UfmwuxmAu///etel0M3tZokFlc8NYUDhmbOHlLFcXKsVoHMunlo1pxDIS6XIVeEfZNXty1oVKUDpr8vTOqhyrxyghnVPqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136769; c=relaxed/simple;
	bh=StmW96JqWZG7fKkrql9YvkfYJmFJ7jmdDutyVcOwjmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxls2A7hyQM3VVDlDw190k3NcAY/T/A5vtF/4J4XfA+/Vz5Gy7bGCd+y3KxIDyyfJ2CP/hKgk48mfyDbU4gF0g8XJUIv5/owjvVMwV2xiWhS/onbagEkZ+OB7+LsoPI9HRGVr190kSAgYXR7A/5UxOUI+JqwERxlCybsMROsR4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Ej9Iud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRlES1ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Ej9Iud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRlES1ei"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiVn1815095
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=; b=m5Ej9IudHnxlIbJp
	CqMiKZ87K0v0zFULFil/b6+JHUJQashozqlLTCGFTnEdGqz9YVLWb6vPxGKQb0bJ
	nbV4Xd5L2NSCchk7ojPnkY4ysRnL4vuVy7x+C18V/1PHXFmW3YTx652qAVa+IDep
	N+WYnFQ9SRqfF4xKkeL1hMhRIWphax89BMoMYUK4DbhfHYRY6n5fgZQpwne1wK1I
	qkFBK6AYX6QEti8kt37E3wzjUqvxIcXWRM7DOmW+6yYNe21zQNP1iG7vpTsxef2T
	UoE1Apj9rO7pT5LF8kzVZ/SjAGaxQHbh9KOw4aoAPi7Lo8u13Np6rcshLJ5usaH2
	0W7mWQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3a5xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:26:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77f133855b9so40402137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136766; x=1789741566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=NRlES1eiIc9cuyxssBZ14zXXNpoMmuZiRSZgcpzpWXuj3kzOozoWfMJ6m8pKJVUhnF
         MVfAuYRglJMx4qtCufLjdUrDqcxkGodVBeQmtnBp8Tr+40/m3Var9KmxeEdW+75xg4mD
         ZV3pzLuYCg3XlAPiBOXRfdv+mPEh9k3BK7Rf7y5UUYSccZZYeU9TxYzVBLKDD23Xbjn1
         5ewKoHb0fmtqdmTldj9eezmJYNtSn+CYvr6nLpSosulenpTr1sMzln8LiJNlT2IfluUC
         KIQE0vGnSIRt2mLOto7fyvQ9PfYY8yUcXVt7bC1ZROVm/F3q0xdcpuYsGtwTyXnMCrpI
         THaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136766; x=1789741566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=PBi6O3cjqS825P2rKLv3KJm/Lu9YzuF/MKVmfRWD+5Jf+rcqKvTmesIk6IKO2+84LI
         yN8j8Ao4kuhcwHY/hbIeJk653JvF97U6OF8j3f0W1vBmT0h7aOt/37R+6coZ9jIdk/tP
         hSUQmBIlqfeBAgOM4Vqj905zcSCNgniyzMYEpzrzbuyEoE7NUO5VPF1c7hc5wbv5aVMD
         NLLc/j6abvX8BYKCOBFZB1lGu3Zv1B2IfZKOiAwOIb2ObzwZ5PmsOJ2u0PTS0qVOcZT/
         70d7Rgq+iUM3+0b760QVGivFRfsJOy7lgMtodOiaFBQFVcTsKXFLh8Ydg8Ek56hxQD6h
         VprA==
X-Forwarded-Encrypted: i=1; AKwUvBxuebhU3Yp5LjKFlxCRyY9MdwpMOYqeUo3R1XIjQU9gmDURQU+LKqAoljQYsnZCLpJQYszZXAURV/rWusSZ@vger.kernel.org
X-Gm-Message-State: AFuF++nNSGl2y2khj+XKIBiZqxlW8J2knl1i8mtdibM7VVZJmDnWDeHt
	k33saedJXuIT5exO2ihhIUp8NGlzQkeDk+f72yIUOWhcREeZre8/fyv7BWjhDeOkRkhhL52pMvT
	mV4nLUD6MgAVM0PW9pUtnbM/YkdgOTuE4jfIkLsX2ar63FYIxFkQiT+fd+CfYLLhGloaU
X-Gm-Gg: AYBFou0prR8czEWvYKavr1BDXeOhwD+LJYI4hE/QrvbUMPHrZXy7fTsM5yLas+GPHB8
	c2lbf71sV+A1kgl+ohqsXqI0TY3wZW/JhKzZKEZsgSxohCwgCjt4exY2ap+24T8IjGp18Ws25wO
	DmTKZh9VplRyB6PuxBBDRwrJvzfMHWMv8Uqd6O6tKiqtGZHp+Yw7Hb/TtQbOCSoLBNhCp1QBWDH
	zQhAvf/+RVV6aeDSl10s8qUKFhOWe84N5S5KOPAktPmSbzRrQrh+oIxeemVyU+ZMDaFz7BoyUIM
	sQxCowWkErJJGg+Yr794iMNoG9R2fJiULIWQNBOXvNoag85W4PKoq6wxYC8roJy9toEmkfnT6tV
	kfC4AW/Ic8GS3dYOUaaXJuw==
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275614137.1.1789136765724;
        Fri, 11 Sep 2026 07:26:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275573137.1.1789136765193;
        Fri, 11 Sep 2026 07:26:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm86105266b.10.2026.09.11.07.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:26:04 -0700 (PDT)
Message-ID: <04e79cef-bbd1-4f4d-a249-f040c7e33435@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa40f7e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=q6PzOI_h-AFGYkee8UYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ZAXlGvHJUBek2laIX4z0kGSKovgWwxwU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX9okuzrMdMYFm
 Jd8ZpAKmKKTd1RKgJijLFbnP7zN/2j/b243G0Z5ErCVQUxWCCcXtbzlYdKvctw0yXd4JxyFCC8V
 R8ls+LcO6SkN4eG1MraeruiaCxKqtSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX9EtKc09ie8yd
 Nbm+fU7naLrmdV9opgA0ybUTmAGUlcVNAp0PSBUdIt46yoASsQq2TMhI0vnpRYE508sk+6jRhJK
 PEpaoD6fdd9DfPzU6OCv9EJNyUCaXtoma1vyV8ZVDS///M9bTHTJafjVepG/jpNoNXkiSAsBBOT
 na+ITzB6cVIY20OclFTIQUtUoSQHmbCM8T3WxbtlL1/igIjdTiOodpZqwh087I7OHlBwtmrO5r4
 a0sySNdHIbwd/MNDFEZDtlArAQqy4uTm6TZ4csrYP3V29w/YwFx7+CA20Mtido+jyVaiXzLhL4n
 uz1TLbc9SHCWclnxZBgqXt7VYQW9cHnzYxUSAWBGU4E5UybfKZOU/CBqL0SsEFIxhTRbvFcvflC
 cp4XEval43wfUEUbrJt49DQuzJHz6nDjpneIZZrjg4KlOK+VDwVMRIO3CIPDrntmRlrE/BmXV0c
 Ol5Ivlic/hmVvsnvMfQ==
X-Proofpoint-ORIG-GUID: ZAXlGvHJUBek2laIX4z0kGSKovgWwxwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

On 9/7/26 10:23 PM, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
> all at 120 MHz, and the 36-bit DMA address width.
> 
> As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
> a second enable reference on the "stmmaceth" clock, which is already
> enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
> run at 120 MHz for NOC access, and managing "stmmaceth" through the same
> clk_bulk path keeps the rate-setting and enable/disable together.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a488640f6dbdca30 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	},
>  };
>  
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};

Can we please put this into an OPP table, so that it also casts
the required power vote?

Konrad
