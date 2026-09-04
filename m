Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A25175A9D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512472; cv=none; b=im2dsqxJRFTODJweGrm9MsRZl+RMnHvCD0ByDSX8Uo3joU2i1+zZHoQ4kA+drhtea/fd04NhNKGhmJns8nKT7sP0t4PS+m3LWxehIETrOWz0bCbRy8L03AeHgEuvwB/VHInlbICzctpAGY8T/cyjkX8FlkjSSru4VOQZ5Qg2z/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512472; c=relaxed/simple;
	bh=z8mUeY8jdDe+OPla++cCBqYJoVtldQxpArBHUi5E2dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ppq6OyLPLXJodQ0odQkv20NTayH5MXnC3NIQQVghzHAEt3Xb3i0JDZbBMIVp1GSKNyROaF/dJMWQCSj1yWhjWWw4iGhhhoZ8re/Bunai9d9Z6HMs6r21c5sTrg7voNlkJ3p5eaBC0qdTXj05aWwwAxElhKvqtdgH1oxrPVCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdPDAK05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBhOSDB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdPDAK05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBhOSDB8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847nKbi3454622
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 09:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=; b=jdPDAK053fGQzOXD
	4cj+xPyScRRHFDeNL8zcHzs4mOeJur0khdg/RqOwN2LWNkaAIBRuQ66CDy9SNfUz
	cdjxEZOdcuoo5xTcBheqPhDXrE3G5fga5X8nlO191lDpsOMTqPXi6oWY2jljfKQV
	59dl4zlsOQKAGJaFwidGakLayrYMXJrPbLTGEjifEYBP7lgmaCOAlYeIx9GCaBDf
	M2HQZMn55+SmjevbfDJp9azLFpkl/eyqSfKf8dsWQyuZeGef6wUQhnewV2I6jRla
	FTBgBvCfz4S00/OEhRxPpzd4j/JAyFQY6vx5JFZwoS0qJnO2TdcU0HCQ3mRYVUjR
	lvuEAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9sxjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 09:01:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53002215979so1989791cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512469; x=1789117269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=;
        b=QBhOSDB8lo6bge+DCDfeiHrVM3sOSlH3kqz/P13gL8NurK61xFei5bbILuU5+kCB3a
         HMuo8xfm6vu62yaXy99Q2EzMEN17Jl6BqBXBliwKiK5YHcEbMBsKim8/hO/0fLC8czUY
         V7cko+I/GHTDzh0aTA8wyJOBZGTC2sKct13hFtlHGPIZhsFVEGrsFcCOzra7m3nvKEU5
         H2TeuKSNP03m41L3Mb1lp+PrUwJfVNFynnTrnaTGu2hvkVLJzeJMv2q4ak8AHWXCYid6
         Soshfdw4gGGdrbNcwN8p08KQ25FQ6E3bET9rqHYItl1N3y+LI1odM/49RIoDs8yTkoMv
         IwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512469; x=1789117269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=;
        b=Ie9807hQ9EExSYYeZ+UOJ6T4DGqZcbuwpLEfUXmUQGI0Qlxstcq3MVKLGmTYJUBTbU
         3rTl6JLPUCl2Fahmo/G8cTcCp6H1zCdeThAAS+l3AoyLLUhjSCxldo1tlv5+ydxwh8aK
         FR7pOS6GhphErbByIe3nLy0CX8j/rPYaYF5P4bcOkjdP+OQ5eyV6JmMm3TB8FuWdPzdM
         Qe3k1YQ6HXX/H632UQUdgtbeim5hJOwNJ2tsnmeTVjDC0cOJZzeO4w3Tbpu8ElgtrDyr
         1CcvY/zm4o4hLhb+aE5lFz9S3P89chv45/sGqI5uLGShEaIMEyYR6x83FKeFsrMb56a2
         G+Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy4JavBfBNtEPV92tyveDH4D9eu2lgyICPjrBTOU6x1kBxQkKeeaac3FHvskb3Xjuw5pZeMCgtprcrb6XDu@vger.kernel.org
X-Gm-Message-State: AFuF++k4eQEsFoM3qpw+VTMCB83B2fD7N7dEkT6bXhvoEW54qqNWdKGy
	SiMgt/+vaY3eXRJXmBrr1Bqbu2r34OOtuP+YdtmnkfHnYtY/HNDm88Dsb2SBiglqgjtSdzrM6Nk
	abD5oJD/N+yyKnfIKNICUkSHlOrxRoM3H4wv/3KD9Z2deDdZOsgfGjiwjUltq26qmIwkD
X-Gm-Gg: AYBFou3MBMLXUBt0PafNmG2ROGN/MaW2REOHH5qEWEgtY3AGd/hMCq4zo0tpIEu/Kk1
	Dhej7cAbXMal7hrlEMugPkt/HknMpSx7nAduU1cgTYZXdUiiRl1TeRcqcVrFRadHmUq1Evjd4ML
	eFVTbB6QnJb2roERTqfpiCWzH9SiJj7n/DU0krJRQu0ihylzVwYlG8xrWKV2fdLV6u0XrGKQ9JF
	FESVTyG1DvalMWPmGGd5PHidOQ5krIj7UX7dBWTIiVCWT7H1xM2cYBTY4Qv+yZvdoECOXPEyPrw
	KL9yHdrDJ2HIM3v/nM8xnpVaOX+WkDoceFQb6jSF8SPurRM/KJD/bIR3hmlGT8HREhAbY3uv7Iw
	L1qNvMHG3rVxctSy01mvU4Q==
X-Received: by 2002:a05:620a:1b81:b0:939:2c96:1551 with SMTP id af79cd13be357-9398055cc61mr341379885a.1.1788512469269;
        Fri, 04 Sep 2026 02:01:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:939:2c96:1551 with SMTP id af79cd13be357-9398055cc61mr341372085a.1.1788512468661;
        Fri, 04 Sep 2026 02:01:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm76155866b.40.2026.09.04.02.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:01:07 -0700 (PDT)
Message-ID: <b245d6c2-825c-403e-ac73-d569820895e4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:01:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] soc: qcom: geni-se: Add helper to set SE clock
 rate via OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9a88d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX38gSc5r2j+1o
 DXJwlKSEVwWSMTa9GqNxinresSm/J1o9k4JuF4y8stFgSejGZ7U5cc0EHr5ps8WRN6KpMHrXxF7
 BtSm52FrzY1SbcQmuZBE40lA739E8yz8iVy/3IX/8e8KVCLy2pnZrXkLwjwNAwfpyYRXsaO1+gz
 E1O5XpeYZwi5qdz/xQweYUt0Fpao1Xm0ty8/McnGi37Ucn3kBYRasmiEACcrnK4V7F64FApWMpx
 XgJTor00LzJJ1Soe7g8aMTkZTcu2SvO+dBPu8g5942VM7VfonOBj4rbmZ9xkC6c7ny37t8vy2Y3
 HpTjQOul1TNx09QcQJ57o++ZA8o0OH3mhdFR3sw729gFAWz7jcjAcM4mWLePBwekkeS7pDYmAzl
 lcb6gGXaZOnWU2ehsQtpL8zxLOPfsJAp8Ujf1B3525028gSwcq4DMW7VHuYWfSv/ooy8TisKYQO
 eVpOQTia/5y7dH1QPWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX++29EjqXj4D4
 y5y/GuqFJk4vjnJTPMWk0792+We7Hq3FQFiqgYzvPLpYT+z3ZoXPFuc8whLeE+y/5CKba7rznn+
 OQV+g6f8iwswGtsrAUtdZONJUKOfQ8w=
X-Proofpoint-ORIG-GUID: Vu5WgQet8bTqyLXb-wEi2SKBTL2C01SA
X-Proofpoint-GUID: Vu5WgQet8bTqyLXb-wEi2SKBTL2C01SA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040081

On 8/27/26 7:59 PM, Praveen Talari wrote:
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.

[...]


> +int geni_se_set_rate(struct geni_se *se, unsigned long freq)
> +{
> +	struct device *perf_dev = se->dev;
> +
> +	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> +		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;

For !se->has_opp, this silently does nothing, which presumably
may have bad consequences if the caller is unaware

Konrad
