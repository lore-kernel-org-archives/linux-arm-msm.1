Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A50B49365E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436611; cv=none; b=I+zFk/utuNUzy8okGPd19qq5ucYU3oq1s+FqzSQQMcoxVA6JtGnokoIjrc2n3gNKxs8diH7nXlnn6Z6F3PBP/+G59MdYr5MYPR1nz724UfVT9Df9eegqSgugAgkFlOPjJ9Pgh2zSm8B+8qgp/TQM89+ks1hLEoUqmeYd9O3Riuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436611; c=relaxed/simple;
	bh=l2mBviIzjsxDrCGYmNf6Y/ZxROvtLAzlD3i0LYSPYDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHCIAXW3ucWYXud2Mv7zIx+tzVqwVvGICVCl9ANLZo615woU1BSdubK5Nfs/9nB+XUvk5MV1Lr3kSfYLLUNXHKF5y0bG1JNnY7AbFCkzZMcllaZp1gtO1lKMHvuE3LYYpFfkn/hUNxtDi7Wl8A6VJqO/f0EcJfg2x4u/aIaVv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/Pl7Lyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILzmJBHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/Pl7Lyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILzmJBHA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAxJ212405
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=; b=V/Pl7Lyu3cX9mZzb
	8uTCS3kaV5siO1pTkeEPItBh6+P23hiW0JDfw7kKeUTcy69kPJdnZXRkqsYtDtV6
	ypQqwuz+LH44O/RS2BVCUbzbrvpf2ykxZgtzbWUswKHzVpuW4OSuGaJKcinpfaOQ
	RJKXvjXlYXtXAajMLQr1AFysd8cegYUTVnzSqOpyl5S+MoQk4CpgOj/VMT+UefwN
	xqH4K+jI74ma7JSqf5ciHrpSkv9FPE/HNNYmj68TNB3UA8NhUOfR9b1r9t3yLhQU
	tnAXpd1/iZrWQQRMNIemXi51NguX9axokjeT1h5vjPSMQJBn11r63glTI6Mucd0H
	S5oxtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhr0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:56:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso51029085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436606; x=1789041406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=ILzmJBHAeLLDw7hSPJ3h8HWvuWy06/ncNoeiqEvBAAgoR0FMd1cDd3MnRhu39Ocp6B
         cw/yz3JziOr3JAG6BvAYi/0/wDUiFGExCmKqXd7pEieUN1bkxNmPPtCE3JK5815oIOwk
         ed6cGEf5HW2q11wcXHTHN8zvEHFMmapb6vdKgvEhRXfqdmlATcpr9kuNeD7R8PRDLjeE
         7Z/Log+I6peX0I8fJWK4kJgvGDjnBpiWq/ojXZYZETdaRwBdX0AABlw0Dvto9vcipaEn
         fyCp2D+IW/6+uB786e2eLvzWkbRzC5oWnvYNDUVdn96ESA/66lB/I4GrddmOjYOiOnka
         X4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436606; x=1789041406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=JAhPGYbDaFwvAvHYzxVOgXK7v9GGhA3Lz3UUyBIKkvRguRcCiHzHFu8XlSURPVfoFe
         si4W4pgwjG24QGTs/ZvX9j8+1Dhwf7A6B/a6tHqPTQpxWi4IQA76XoFNQ04ppCoQiyVq
         KN83IS0IMNMkqjiyz7iedtl5ONNGWEJPTmBv3Of88hTLs0OlAh8Txe3SWW8OILDQCFmi
         LCgALanVZt+OBWEW9kY2333XUiwGq+U/AY0OBVozXaIo9YQXiUZiDZCZsyU1dXJ6z4+r
         ntHQIyD/waN97wgKotqmZj2ybd4JFZZJdZvLZmsELWQqAUEN3iDDm7OR5Wvt50HusZtb
         QEqg==
X-Gm-Message-State: AFuF++l8jTo19oW6a674jWnAMHqaLbQXo2Zue25rrdXeIBTpDk/azhWl
	0dZBq5fgm78J0YS0iiBezbq5vqaXCcRrAmWW0NFXjKyM6I32Ojgn6Rngo896egfRisLIigczk+2
	D3GNEWMwo0FWizunhl1Dskmj5wLHFA/uclfwu3crvSPcPBNDcijkHo+gNuxbA7XcVjEHI
X-Gm-Gg: AYBFou1kdDVtf0Sm6Q+K+p7yrURjJ7dbN73mESgscHhJpiDfC35bZaMn2/vZCCvAI8+
	cE+8HC84lwacg+8kRWRg+3PJg/bw6KJEmHt8blg8NLAYjMOiQVZtzgLacx9JW0oaXhU5mGvCJgW
	paBJkOeQjy/KbNMdcN/H++8BzA9aa4CtFJRv1hvLmqGd2Gff8uh5+RYTO0HAR6ki/W2bnBACwFd
	MGimmntJm/oTkET9d8P2PFo7aRkD+/Zk2RsFg4Ypy1rI2B+IyZ2mJ0ciD7ByAZPrQWDUBr/xpGk
	Luq6zNPVyXEmHksozcjbKwkFyyunxL5xm0RsLah01PoAUAzj58m5COk6Gv/LbVJ8fZJapzFAJIL
	uNlWAlt3TT54GWuCuL2KmKg==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435187085a.2.1788436606023;
        Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435184585a.2.1788436605551;
        Thu, 03 Sep 2026 04:56:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a104fsm88275066b.28.2026.09.03.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:56:44 -0700 (PDT)
Message-ID: <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX8yTlD5CXB74d
 1v1x+zT+pTxOHD0IB9WtW5esXrro9yBPZq9NFnI2E0OS+X0+nq3JXmOpoaDW88zJFVFZ9VBJBND
 qmV318YWxDsYoNZVHQm53DX2ivQGCxKTbkiDAlTZnjFnUrQU1pArJT5X3q4Yn+Fe13qI+rw03lB
 RWEi9+Nx6lp37lj/ZFLaONipKPH/mMXZvAN+g/OpJikDZW1TYuUoct+n8k0MFdlyRGl/F/Xhtfa
 s3n7bqG2XNfbSChyWFoVYRfCR+JooSuR71MS2OiZFugpW1hFPogIXZ9pyWm9BMijNhI5/I74HCX
 BVjom1a8nibledX+KAgc529FHPIV2izk96pYR4OeibXeMBp5JjkvFNhyD8PSRTwQ922CS8F9snW
 Wdxd1IIycCKSvIHLc0PRZLFBJISde9NYQOk3q1Fk1+c7n7IkYgzi9GlmQQC7yG6wSqgeyCmVK1F
 iZ7/tnpqyJjLBHxquvA==
X-Proofpoint-ORIG-GUID: 44a8t43ytuJq5YVqM4qGNfuyuND-OzHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX29DW4f9lXIJE
 a+XdiTRGBWNXYDaFQj5eu3JvaXgdF0jeqNgQhRrfcYGs8LDv/tyxozMJx2MrO7k+GpeNJ5N1Fqe
 ipEUSWzYDUWwgXdO7ARZQ4p2T2XOk8o=
X-Proofpoint-GUID: 44a8t43ytuJq5YVqM4qGNfuyuND-OzHh
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a99607f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QFuAlUpucN9v7rsm42sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
> +						      struct regmap *regmap,
> +						      struct clk_hw *parent_hw,
> +						      const char *name,
> +						      u32 field_mask)

Since we're doing clk_regmap now, you can just use the clk/qcom/common.c
infrastructure instead of NIH-ing it..

Konrad
