Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B250AC23
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073899; cv=none; b=vCY7o9GnIh2UjqsFKldOibJ+6uSZZkxbTbjX5JQjXG53gBqhfzWwpdkBELAQpvxhx/VFiHD7JSFCAM9AHRhFdoIu2YGeL58wAWdHtYt9wkhEO2C32yX7Ff7ID+vhkyNGEt+oNxiufqZv4EhVub/HTfbzDZcAm43NO4FG+IoePLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073899; c=relaxed/simple;
	bh=WdMLefM7dUoJOaVxb3gVT6vIiuXbHSq9V7YKfmp1BAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhvvvU9S5vraBl+uEET1URWz/b5LnuVeDE1OA9UNNKMPou5wgWAkz2YUqGdhApjaeox0Z461fd7ic4O8FVTvvqSVXJfkc9fw/ksR8hlmbv6mxT0A8igd/bh8jh33nw9eBF6Qif0Gx3xOAaixcdnaN6QqHVa8ghHmQ/8FWuN0qEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5eCTPSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGvVvfls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5eCTPSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGvVvfls"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYOs33462811
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	suYjCd9Nie0pFdjhXxb4QQCH1IwbgguqYC73FW54hnU=; b=f5eCTPSQimTp/oxm
	t5qkXSGaugck9ulor+MoXN8qaDI+uDMntfOJCmy26WszC2G9s5ClGeKROrYreIi3
	G8Zydbjp+tW2E3xllOg6sYPZL9U0H1RapKs6mSJRolh4C6otGLASBRUyqhGh6ipv
	Y0dqrX/r3pnYYE1QOXVeKIDG55wlnKF7Go8kkc3kB4jFZ+vx2tjIBA4brQo5j1fl
	mr2SqkaiQFImuo4IjvYxLTVzXcCzhqBiGaJ6JqPHUiw05w+7ezdzKyAyxpDfbSzh
	M8RL9WvV4+RLGfIHzF4LZ4+dfmwGbbbC59A2Gj0Nx15pVnQezd/M5iObvUU8z0y7
	OQM6VQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu68637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:18:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf97f74492so242378137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073896; x=1792678696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=suYjCd9Nie0pFdjhXxb4QQCH1IwbgguqYC73FW54hnU=;
        b=XGvVvflsEPGFNITIbG9xtoOdydnlYGJeAdXUmC+kHzDjybKfQ8p8JBIxPUFir+cATd
         E9s+U48bfg1XajCegKrJJo+CQhbt0Hi23rmMu4G9eB0pVBgkL9JU42ZrARWgGfW+OQE2
         NpzR8/A7VRJHmNZk/EFsEgqLxVFGnU+ZitD9t3xQtT2LODPuo7E+dP928Gq59RVVQ9XN
         3BfHPjQR/3Zt92nKwHlHfv8bk1BAckQkmxSEbl8muOjTbY5yeTNAJZ9I07dOd5utlPUe
         X2WZScFdDZfVeazK51IBk3WlIbVWTrZ0hoiDq4pHXgPR9B3bis0IIf3hfvgEmnMmP84X
         C5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073896; x=1792678696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suYjCd9Nie0pFdjhXxb4QQCH1IwbgguqYC73FW54hnU=;
        b=WWOim10hbM7MI3+cOh5zQYawt1KAks7S0ASE+HHyY39shvtRjLbN6evn1CpGYTMhux
         UgXg8begxY7g2FzBPvR6QLHfXdGQfsSFUdMPDI/EaCx22n6dfnEYLXXXHs9xSBPTlDjO
         pM//gHwVK0mGrnWa/d1jPK6bZTN2QqPbudSw35EJH8U+xQEywndB9KoFjML8Uf68xKns
         Ih8nnFDwI9s8YDm4Gmv63yNMQIAz1HgYWavKFgQn3RNXQqIobp1tHuOtwINULtg7ONnj
         ICwRLTbS9v6l1Zn2JedCMR2A6bImyv/HMdvneqEncgRIqCpk/G8QOvsMu3BAYVxqiqx2
         Mwiw==
X-Forwarded-Encrypted: i=1; AKwUvByKY8/FkxHHdMV0ez0AXOBxXh6AssnPGfqCnH9BehkvGg+urKYj91AdX3FHQ1r3Nqs3/D+3BjFG0+5x30Vn@vger.kernel.org
X-Gm-Message-State: AFq9FYLtNnX19lGm1xy6/aJML4/MAIQ6UVofooWMJM9BDuEvDHs8k2DL
	jReX/rKzP6HEWhtVjytu3vNChPHsrZvWY5UPORYuNXAV3OTVJuJtUydcrMiJ9/DcO8e+LRJXkmH
	2BXRSjTb+Umvf4Gi5DbQHGwKSSVqWxASxtYrXe3lFxqCaZxjPEDu0KzNIDrmzCQ58EYPb
X-Gm-Gg: AYBFou2RFt5CbHPLx8KJaiSh6otql2erzZXPdDCiDfZwBx/26sCdJNgZ5vlRtt6D4WA
	orWWhpB5NmiqVBFpaRMvlb0vH4N4XkXE17IunwCW0XA0eo/twsXF24qw7hERSRw/ZrvYYj8LEvG
	jWHwYIt0hkZiu34/GVDkJYpzPxbq/7jkCBJwboq9WgmBRvo/QQnX+zC2Sq6+XYsYXMG/C6UiOJX
	4etUUelo7UIYzZ50k2s4/4Am4QYlHhJvG1vOWnpkgxnJsZcTDLCEU+OWZ6EhlUnCxD5dWE0NueB
	PDUTOsfsdlddExHPZQIvKjYhiyRitiIB6fi50EgmcI+wQCSWzcI4F/EyMZjYkjkgdc/1WsDFpvF
	/L/AaFq1EfhdzYEc2oIVP8A==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr4203639e0c.0.1792073896091;
        Thu, 15 Oct 2026 07:18:16 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr4203612e0c.0.1792073895639;
        Thu, 15 Oct 2026 07:18:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3dc15sm135553966b.37.2026.10.15.07.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:18:14 -0700 (PDT)
Message-ID: <25956f40-e7e1-4815-94a2-54ee8b1a50e7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:18:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TpgBS6ib1aiEgll1uIb3gumh4ilfEHso
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0e0a8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iNO32DtW_iceHKFLXyIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: TpgBS6ib1aiEgll1uIb3gumh4ilfEHso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX9es+ujxUj2hp
 hpyvDSxntER1ML2/ulDAo5uduCJhRDkOiweynryQGW0KNxbROLyT0VUoa4u2MQdsu8twBcbI1+N
 ZAsSn/qBIHTIRnSsUsXH0a5HHo8YX+AC40jlmwvil99EysJFxTOvAfIk9X5WA4aAD72WI6scksa
 GLfbDZS7VqoURfKtckcpIpl6tGygCKuZQbEISbklMEzpzZ/5zInWQjEbX7ICCs8V8mLkS7FrtKr
 Tv8/ofkJm2B7BnbrajFEgvCE6uoFHNL4QrGaRFS0mvYwPoaNsiTLhRVK1/wfSnEvd5B4ZaN7VRR
 bEOOPfZf9rr9q0d2OUnAkh2e0fxq2SbQxcC3uOrq2bONwv5MTQRzAN7DsZ7R4HQVUmsiYazrrT+
 VBxMBF3POt/Uuuvz6EXmWPrUwGCpr3doMh5W8y4rGL0PBiMEC5qUbPWJkW7EwGDfGfXKO9O/50i
 S3d1Dz3GBS0ExEEpS2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX42y3Xow6Xjfv
 B/8Rcl16c4bpHTaqqHR+QZ96HCLJ8M3nF5WtqIqd+VAjaq6cH/rmfcErln6k1dbOWZwVQ36H5tX
 jf1skIfgESOZZYsKZRLWB9QYYqYYx4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

On 9/22/26 12:08 PM, Shawn Guo wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
> sink.

[...]


> +		tpdm@12410000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12410000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_2";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm2_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12411000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12411000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_3";

GPT points out the labels should be ddr2_, not ddr3_ on these nodes

Konrad
