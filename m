Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BB3BBFBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281528; cv=none; b=um5fiKnJsCtOg2+Ghe+UAt22Dv3000NMxaf+Gj4P7k5rwcuYu19wvoGvaDLGhtXCSW7hXqAh5eAmUB7Js7dJQoIaqvmzy8kBrKisgoJhKnd0K3RU4rdGhbDB3uSz2Jns/tiv0pH1XkLcs8WN4iUiXNQbhr1Ll9IGKxyluI+Nu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281528; c=relaxed/simple;
	bh=+8UCKbpfiiuyr2o1+4v37eBAhbK9LnzHdB9db7Kd/Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqXUrU/4aARqgCvcFlOGLJixiFoAkYqyB5unef3c0kUpevELEUNB2MqWcfCQZvsnEiMaK+zHIoW8jlbHHnfvvFIucwvzs+SugH92+rCHY7OlIyGL6ffrwHK312Ap7cvBP7DR3kauuPROYIxPUi+uEusNSwEJzdQNrR36/5CCukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV/gfLhC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvXZMDO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV/gfLhC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvXZMDO5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6dILA821814
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nyN5Tz87c9ukomENRrL/LBmY
	2gEu02TA5TMmyxeBlWA=; b=WV/gfLhCfxqXxDDAYN8E0AsVhLStzc0bJm5dPDVz
	rnGX9izdwhejK7XBJ1wwiQHqjg/kbOd2scEVsbIlrbyly6kOjX3MFpuWyDt7VUU2
	kcEHFpB7WOaDsPqVOoUVDXgbKT2JG2h+eJ9cyeoagiEP4IzcLif/HicXLGeLhJ3+
	OnUyInDy5zfL5+yLGvnHNremIg0yTesr2bvi9UO/S1rGAuigCzWG99LkLX26Et3k
	cA+YbFZ6RPSJ5oW2w3D6zF4SAQMSedO/n/TO2NL6qt7XDxHv6wLFv+FOlBkqqRyj
	PZXjzCtBo1+wGhuditt3oZ5YCvOsKXRKfwkJJjv4ijw+qg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8p4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:45:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so13497121b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784281526; x=1784886326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyN5Tz87c9ukomENRrL/LBmY2gEu02TA5TMmyxeBlWA=;
        b=YvXZMDO5JQxSo1Aa39vNQjo1SMNvsx+5fS+WrnyLYCNkoZoG9k6b7EVz7Az+DXWf/2
         2GUwxo7qaiYz2cNypCUADZp5qrpa8Bu9aHEXoI/RxxvpA9AaRRG13wXIm29YQ9HsbmHU
         rlYNVE0sO+fHY6tcsY3Nh4r3oOzKa+IgPYWdLhp1ByZjC/sQPbyMCgJV/o0xU7nqRMAl
         0837vujIhJoX3Sxqa2l6d0hRlG+4tUjNu6ah9xq+FY89Pfn9sBFB8fHIH3Cq4z6Oz3SH
         eRTAfUTHjFCp/QBua1nR3ZPBs/M2mrv6JGn4o0YQqeYGmAqyFj0P1mZU9ZbixNv8JY52
         QZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281526; x=1784886326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyN5Tz87c9ukomENRrL/LBmY2gEu02TA5TMmyxeBlWA=;
        b=XZQIYwuqkCzrjx7GiuxO1QxTwTOFHfhyI/nPGjItZkz8n8URR0CPGXbawoz/X8WGhp
         HwVsSj7BlfmsCs2PJ0Yr0m28dTZERyPis3w3QJIE+VNCTLr39JyZgUivDzuVZxCUO4BA
         Uy+QoKSd2OBBaqwlzp8Iuj2cZ6HSzumpZONnRvEW4SYSCxGBBORm4tfFsARYdkq/o8jt
         dbo5b55DE9ok4yOd3SX6eTnC3mzlXNgcVDRGZfbe/jPPha0aO6AWP7EiC0z4Sgal2JlB
         ugyd2/gzZI5tzk+gPnKVF3WlrfNKVmnjvKgBz5IYinZNuUs8s7IbJUxv3VeMpWVKkEGz
         nlDg==
X-Forwarded-Encrypted: i=1; AHgh+RrrBJK1i+LHmZ9jKeWbgBeX4VVaWW02PYQ8Do0p2FiOUFdyy2vdTDeXsHva3FwrdK4H2HJENrtnweNKVTwm@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTYcby8vePIcsJdgRJ50mFaQYzbXgNVWUW4Na43Tc8cOjKIjB
	TmMZXt8OlhqzpzJ28xbgylW5m7Rak8I32NW5th/Lraozlkygf+VIqolS5t5aA46ivuu3ZDsXA2P
	tNTKVPSkACLLVR5SYrXLLQWyBSLRzeqIrO8I7oNFAOy06hAKnTXG0YLlV200DgKMkk41z
X-Gm-Gg: AfdE7cny0YfTRbYl/ph6qSgB6gXRJvDelmrFuWhpc2hfwILkr0efH4RDNZa3CmSUwjL
	iiaBWvoXRTzNiq77R6i+h1ZtUv8jB4IfQbJC4lU2foNOEEEuLGINfgWx53/uY0+d8SpdVH3y9BU
	wNumRTPuCeafnaMtbbc1q+iLi6g2hx9JXq2s8btleLl/7ojRNrHVCiSvRWerlq2gx1NF4sS7Gr1
	XHqgeYVkXKq39uE5uUEvOzLDf0ZJuwaPW9V8e/eswsqVqnL1CgkCwHmK1oibNsKCKKHdb1adVR1
	vMtsyASwm4c/zg3C6CPP/It3AuEpoCjJJuuiUid+JbW2k814otVX9BA/p648RZIALKPIx4Voq9R
	Dz4UFwDX+acvgTA==
X-Received: by 2002:a05:6a00:928f:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-84c2931087emr1910459b3a.31.1784281526130;
        Fri, 17 Jul 2026 02:45:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:928f:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-84c2931087emr1910429b3a.31.1784281525649;
        Fri, 17 Jul 2026 02:45:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30c89sm707423b3a.36.2026.07.17.02.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:45:25 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:15:19 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
Message-ID: <aln5r5dT0XROdEdM@oss.qualcomm.com>
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfXzQNboSiyWFFB
 McxgwTDEkUb+S44vUVxmQLkYTUZNNz/Z3TdCxri13+NyGgDjZYAtQ04y70jSV1YPtxln0FvgUer
 fuCotzKxrcqifCSUR8r8xCpE1dM83zrmZ8lP/Si5wuVH2SZx8yFV6JTh/LjTVs/Dr9WY+a8Ak/A
 B4Q9TY0i8PsKqKZkIQTQqbTREPH0SO67JYyd3X324/mx4ajCekXjq1d8x609AyByDxffFuGpUV/
 lrKR50rEebC4yjV1ZoGTnTDCF52ehJ3bENwbThScUD7ut2HFpaeID24fpeKKwj6JRKiytbsirJQ
 6sYnD/PMYs0oPz2MaYEGN6fULxR4hVsWgUzELiC7IREmkok2MtpNygtu87blv34YSBAHySgw7r0
 UgCKQ+7RcQrQjWvzwa1XZKRY2EqnFtzBVFvSXISpdhCKNSdcczvZiTsQ2TgdLMz26xSkYj+4L3p
 9dEjLcPRiln0IdUU+YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX5HiPFHYhnmY5
 THkPjtyV3UHB0BhTbdYh3qYWm4wnqtWHhwWL390IfWeh8p/qk20pLQRl3/tQu7aYBHSk9sTSC+x
 7wJsdAYGHNaqJ4eVLxgXEC2bXS66bp8=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59f9b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WbXkgyQLn7-7E-RSUvQA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: yNuPFEp5m_kL-5EOejSUQI7iGcffu2A5
X-Proofpoint-ORIG-GUID: yNuPFEp5m_kL-5EOejSUQI7iGcffu2A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170096

On Fri, Jul 17, 2026 at 09:33:58AM +0530, Imran Shaik wrote:
> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Tested 10M/100M speeds on Shikra EMAC with this patch, so feel free to
add my t-b:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

