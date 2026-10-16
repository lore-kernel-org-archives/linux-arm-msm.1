Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EF4DAF89
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159984; cv=none; b=U1Qo2vlkwAuUCZusm2TKdIVLZCuhNo4yVzFhH+O7KMRtDk/bIFpW5Frnh8up4zcr91QtplaLdxZiGwEIaqUhfitjM4sp1x2DexmM5CVdlCMFCpU05md0nd4q61+plmhZkDBOyiuj15LGrDie6E83mwO/cZsKYwWkfy0a+wMyXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159984; c=relaxed/simple;
	bh=Lj9okW55cq/izswbCWi5maI/hYgwlh2oddbUEhyXCU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjqsNU0VJ70FkJgTfrQLeHw4ZDcOwLvQLUBk6z6WuB7Zz9Yp8XbPrrEZ5V4oxl1AfgWDMyPm3XQ7A5A5EWWSUXS4JJp/8Q3CLZENd5A0KXCXQ3b4NziHIULq3Nb0zGett6NcyvdWyXHGI8J9Uz5wQxugYM53gxvlJQQcHQ7y9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIpDKy9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRR8akGO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIpDKy9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRR8akGO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6HAr2455978
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=; b=RIpDKy9KhJbvrrzr
	EgJTfCljkxaFQ+bmMM7o5slaDQonwaCkewjQrKjWU/xSa+SKu0HV9O13dRN0ij/8
	onGC+AVVVNZrIcu3Fuf+RK+6QlLAH+OFbvFtdrwUd67gs9kt7lq0WmFEgqow0gEb
	b8E7FN2+fqFGNTqWTlKxlmC+f+DtLC/eNYTmTV9ItrASTpngMV7/WZ8PtKR+JiaR
	skEM9A617L3FV0q89i05cuWk0F9NtrUcpGDQed14k1dP3Hr/fzj92v+VC/TExild
	BFUhnvXNhouW49jAR6pH5lyNpZmZcHI8sEf9f7wwVyax85v4h7doMo8E12dLmPMz
	X+GWtw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5ysava-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf97f74492so310957137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159978; x=1792764778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=;
        b=WRR8akGOAqJEasR1xj/nafdVwrugruY6GaiSSeqeoY0+2099M+EFRCLGlNwWoUUk82
         a7lD21UbLiQ8ee6RjFmiR6NVk5sHbwYx+MBbXLEoPh4HPNcoHq0LRHQUUIBXnfzDgLY6
         0vCmuTXdmcPcCQY8C8sHXYdP2IUNh/MNU8M1y61IbiTNt8JuNt9HkfCdOJkLismJA0eM
         0pchP+dNh2qyVp3tvMwSnPEgWGq1NSoMhtQ0oCumZXFGvtuSQ5mp+5XlXXNuMWn1+IbF
         WIfglUfkhtrdGzhfkzZAbtNr8KMrryXWDzpiWFIWu207L1ZkRqT4xhNGXBB26dUeUYYP
         pB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159978; x=1792764778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=;
        b=BZ2fspqMT0DWMNxChYm4gA6wtbHPHEQ8sXBLuxNFSo5HPz7QLvP8DdO1xaACZSBEdt
         N5hc1yaMjmktTBxK5O9814FNKVCG+F6SeBBm7cjrVM9TuluinCMivQ2kXFvq3zPMDKgl
         x7Orv9mEraSjLatncANE/9BNls3yUUfcCfHzXjLv36gck13mZNWq/zQ+3Xtwu+Bfhg2P
         ppPNXOf59UUgnRgiq76qUDTrH6WL/yQyiapvnho4Gt49ZMNbN5ENAV2Ap3say+tLncpj
         wO5QMrYAuC8tS4SsMFZ0WWvRFE4es8U5lYPTTzPHqbWDS8A4nahxMhTOIIzAnneIdbIt
         moCw==
X-Forwarded-Encrypted: i=1; AKwUvBwpimNIrzMNtt/yWnl2gl242DCEuzfuzjjipmxBPb/UXXq73WJ/pKV9N2vKctz0eEaqKFc2R0KMGw+7vAit@vger.kernel.org
X-Gm-Message-State: AFq9FYJHscett2e5kH6RLc9JqBlHdhwZJNMRLK5Dw+AMy/OTjUBBrdLp
	1gby0GitRz6xxx/0cejiHcpwDqFuVPe2SOp3FYJOq32fNIobp3jCPnifbL7fPW6BYRQjX340p4w
	mJjByJibTVAAPbSMrkROeoOdW9qK04d2w7XODSlMImhntFMZW45gmEfnTQHTUIUnV6YZl
X-Gm-Gg: AYBFou2ayGRLZtPcj72ZBFNLOa6duWSVbiV0a0NoQsYZL3S2er0Kl+G36i3+LhCHlu0
	2d5Pn1k8q5XJamRmaWrBxpP2NzpfCo9iSbWvoGGDkwtIgVFOqER4Q96KBvr7Su6nBmakuqMmWV+
	QXbT2FiFYl5FCHNKKBOacE1FiMg378bsL9lddwsw2KkWh94MnqKRpCCQDjd0RlDpoPYe7olcUSc
	Cu6emYXXkNpQTRcn5YlKcpbLbPeBWcrDCCJqm82SiMOm9nVslT7UKFDqKlNeT6b65EH87fEz7T1
	uypLCRXPf6nMu/4Z2va4tsyuHcQU/tS90AouD+b3I8YobfUdukFBbR3M9VUhZs9X9LXochbgUv/
	XYdjWvud3cFw5ZdgapeGhtA==
X-Received: by 2002:a05:6123:553:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5eaaa404abbmr55048e0c.3.1792159978425;
        Fri, 16 Oct 2026 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6123:553:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5eaaa404abbmr55033e0c.3.1792159977897;
        Fri, 16 Oct 2026 07:12:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm74841166b.78.2026.10.16.07.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:12:57 -0700 (PDT)
Message-ID: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yuEJJTJEOuAy3qv41WbG6ATDVY3wfCK8
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad230eb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DPFxZCFM3FP1ELaAjbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/+6yhqm/F8Jx
 V7fFmll+rE4zVzdH4actOtK6uTbyd1QOdWQG352sR+VfHW8WcoZ675aU6gtY8oWZZbRciYvcJGy
 3K/N7fXNyBxdVGumrRIFBWmYGAzvfxY=
X-Proofpoint-GUID: yuEJJTJEOuAy3qv41WbG6ATDVY3wfCK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXzZfYFz1ZrPuM
 C75bSOEfit10LxzQIIeFkEsAU9S3j+l/pabysBeVSMw0JY60HfAG4x7Io5NSb+LmDEpdR0lokDv
 Y0iwG15k0VOntdctJnABee/1bco+7iiYJXAyEg5QcSNDt6WOCrAG5dLtVrlnHJXZm+iz5aa0j29
 AXX53ihdXcVRS/ZrvsU8EXzHGLZTpXlQA0yoxwpfw6muTQCMtOlUwkClLyhkJLgqgq03H+hw23j
 zASmz2b9XBHkHg+DuDI/7QWdhqWh/mI3PrFw4wnona8s6vNN5quvpP8ujtu7822TF45xBZGGp8k
 ZH/OfVgiCU8NnBFK9jWoLpcUVzCM8zZ/vFbwPYZ6n6efvMCj3gZY4zffUzjCfokjyKkX5nCdFqt
 TDO2zvqpqY4hmE9MFj2AwEXUrltrah1oDKdJyNThCDzHPw0b5VavXT6lnpXlVX9CQhfNZ9LkNdO
 ocd6pYXNWKHO/8hqzfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> icc_clk_register() assumes each icc_clk_data entry describes a unique
> master/slave pair and creates both nodes for every entry. When several
> masters share the same slave_id, the shared slave node is created and
> added again on each later entry. icc_node_create() returns the existing
> node, so icc_node_add() hits WARN_ON(node->provider):

[...]

> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
> +	/*
> +	 * Multiple master nodes can share the same underlying clock (N:1
> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
> +	 * Aggregate the peak bandwidth across all of them before setting
> +	 * the rate, otherwise the last caller wins and can undervote what
> +	 * another master already asked for.
> +	 */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		struct icc_clk_node *n = node->data;
> +
> +		if (n && clk_is_match(n->clk, qn->clk))
> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
> +	}

GPT has the following concern:

[P2] Recompute the shared clock rate when a master drops its vote  
drivers/interconnect/icc-clk.c:36-42

The zero-bandwidth path returns before the new shared-clock aggregation.
If one master had set the shared clock to a high rate and then drops its
vote while another master still votes, the clock remains at the old,
higher rate: the remaining master’s icc_clk_set() is not necessarily
called. Recompute the maximum vote from all nodes sharing the clock on
this path, and apply that rate when other masters still have votes.

Konrad
