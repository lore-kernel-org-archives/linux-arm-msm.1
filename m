Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462759;
	b=3kaXwTL0Ax0IUe8BkbQ5cGKPrTt+REUn70w0UJuSrksxPtnS96RWn+xoyndui/h4Kfkx
	 5OBVPBP5aS2Tw9HJI1zAdpqob8ybX9uvrbKWr6NRPtPLVoYTAzgNbI1JEydzy+ha1m0Yv
	 kRDFvPSkpkaph5LjbOOOJ4M5RWn8xG/g9pGln6HgV5VqqRv2JeqhmtwBlZAau1TjPG41Z
	 cjGvKH7EqLu+Eh09RLEYvk2Xmde6Ei95g26ZQk7X4ELJ4YmiWpZg6Z/X6GUAIlUuu3nIO
	 rdDUGkDha8DcuGbAqOC9GQs6JzQx7dLvYnWEJfv2AdEYrSNflu+K8MXnUAY4Qpo6xwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
	b=F/aVWSIzriZtJvxiX17x7ZHdZaPzVSuSSBUHHdGLUuVdGIlVGBunXP+evy+MDxWA99AM
	 ohOmLld4MCbqtrJALUW+UuG1r3lbOwKBFa/Kn/jpl4kw3QNln+r+Soxo34zv9AXQz0Com
	 UYJDZu4oFPBLeJs6Maeb9pcEyEXEsDq+6qPwhPiH4F7cg4WUSzwcMUZG/MdxJzQouDrwY
	 FMektZyRa4mLUWpzASAr4eRjDMPUkb55knL6aIP41QLoXYujCMeMXAx8zGAHSmAF14UDg
	 ln6v0I99qX/VW0qtLGlvBDFZfgnKCYKzyPMYOpHg8phrVB7hKA1cwlZWhoeeljiaCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWbkcHLj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+SNEDGJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA07606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWbkcHLj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+SNEDGJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGrVw2769122
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kRPbPFA5UaW8RQT7bD0uzKcS
	u4cYs79Tdy4dHl7KdtY=; b=NWbkcHLjy/t72kbbZhxphVhgOotRbFVZeU3gmCf7
	MN8hsmw5vSfH1vrzmSar6UKjUi2kZXsP4XJEtLLIfhEXufqXDoBjseO7zFUYImsa
	Z18VgkFxTBZdnwTX88duQ+/f+ZqAsJwa+rQFrjqD5T4oY1RBfXKRHbyOLQ1HhUip
	wxbUSarHXgl+um7Ebg/v0fdx6Ne9OkXeRNMZRxBkzWrOfUvxmuPxPGQv1Zljr4HK
	dUxXxyTFvIuK2oCAlur7cEHXq6+Bs25PBRpP0X3n8+zHIuluxSePyvqTeTV+emcr
	lNYGpEWZ9RiPpyXitzqqaBSR1IKk7k0ONubHxyRP5zwjbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb3vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so1050964685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462757; x=1796067557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=U+SNEDGJvUHMYbZoi3AfabeiVkhYN5w0ezrHjHFiyySCD2EZ+2mzY7Dmp8RoEz2KuU
         14L3dazZFtOsb4MYaZnyBfJgcF9vaZErgm3zOB0R9SjZaua4UuW9z/o+FXdnbD17e5oH
         2X5Npxbna4gec97QnydCFIaDCiAckwVleLBdhF7S0wZMbBOVtyiZdmmu0Ylqxmn/j8gT
         U7hn16tzZFbol7eYpKBAGi+UFDSJRnHQW9TH7JqTpFybue2Lvc8I7+t7qHxdHME9YAIR
         sCsimGw5p4cTnfQKX3k8DzziG9CxfGp6LlN2WBJ+P953jUnyXt3QyICqNvnluhGN9cEV
         8ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462757; x=1796067557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=UdRCdwMae/XYpbhcUj74NvE0kc34mI/XgBIoXbhpt6xc5NQ27xNJymvw61z1SP0rnr
         hK6cnVw/PWP4NzG0L1b7prGhaqVeS1q+jlIuQjqoYAJX5v14Nc+dL0xhk9JtItvcPSjS
         EGdpdZqdjBwc9qvSwJ8klMBqr8dLl4NV21N8eMMnzZ88vpgxEnpEddLlHVTJMlh836Dy
         jPYU+LJ6Gus8dMwupjVW2IynJ1ZYs8P5uHvHav2FPzdUXQSX3aqlyCAo9EdpzSr/YJ0b
         YhhgyxBrIA9M1tOKEwmpv26IY3bDQSBsFKxQ+ZPBj8xSTpIKuBh5VgxfP9GiwhzdwHkg
         dU4Q==
X-Forwarded-Encrypted: i=1; AL+hErHFB6bP6vPiASF2oWCv3urs1O3W2ycM0OhG+thzwJDoAwBvkDRvQH5/yLEmSLKgDr09hgXzj2Xek4gLel1U@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mx5hLEmhsREtnVlLYWpRKunDxg2wyRlRdmvCUzW6o+d193QtL
	d4yN7y5QvD53yqEiyDrkUcSwbLz70OCIxtTzdPD0kfRjmqntaqhEly3zwhLOYL3Fm3w1eBWLvBm
	sQT36WNyzCSs0MOChAGCwtwA9C//McDkLC3iuIiUHsjuTxdohITcGdeYEJ9DCpqs+G6ov
X-Gm-Gg: AZFdTZc/mVO1d239BEJOAfb8JnabMfuCV99NTHqaYLWTDAtjajUwPnJRyGFGBXUgtPl
	KYQArLrZ9CIl2B6zRsAzAdNwBGZUwB5tMRR2KQVLRgHtsjwr2ylEUVE0BCEoiq7J3qOOJ5JjfxU
	Q1ZN//Hty7TIslIyWEoBWovKoI1U/eVNUGmOIaxVlxRIH1/adRcD9bpGGkx6K47UhvdFO9uKAro
	aAZzUrb4MgXefetGC8emnJ2jqt4+5n6rn9yq3+Yy/5IKwW5OL/uYZVwmKY4K2GndlqgbModIZ+T
	oBJsUplYuPsBqbDXvtZJ0q7Rgd2wRBq3tkSlNm2w7QtHr4pMSBrjZwrWNSGt+6GoFcmfXEi+pLx
	88fF7fvor5srOAGn20izh7Sjqpytj+vGFeriFiE4a/d4AxKkSRe0zEeGDa3ViQmVO
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389698885a.29.1795462757002;
        Mon, 23 Nov 2026 11:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389694385a.29.1795462756273;
        Mon, 23 Nov 2026 11:39:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550952365e9.13.2026.11.23.11.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <eyx32yhvf2rk27k74vlordcvqvfzugbq22kjju7mijwccltgkc@jbez65qjij5f>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9sbTwRD8dxIQ
 GAO8bVFUUPJ1J92j8i4w+3pznBqPoaDYRL2HAA/G66zX8lKxh5N7GuVeOmGtXpiTEDX/lpWboSS
 KYcvuHjWj9HPka2BK94VLDsvNbkljOdLrlk5I8CF5uIwqeGjq4wauVg+ck2ux0gqbL7+027cOp5
 QkxdEpC/sWMl5Y3lWc84HkraZmJRDE+d0fa40i7HLTD5BBLjwr2Se6ZPe01p4VDGWnf/YYZ8Hnu
 hbf+yD0Y4o+IgwAhfW78d0MZwm2iRZTKHL4cq/OISDq6QjXjWxA1Q5Amj/jQzOWe3gDUe+WKLLb
 iYhFI+n4jop8IUw476uaAh7MYSAPeFeLv8TvjlMp90FVkcRHhFubs5k6olRozG682gsA3Ek44EL
 KCzk/Be52KMxif9W3EMk7IK2lJepHyHvHjmFaNRtpPo3XXjxUvGFCLeeeLysKDpPYs7+xgRgDJ3
 KGHea9R7yDE/j4Ube1A==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b049666 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LikcBPw_WjS6U_9SOOMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _gNRnNoYbyjeqfnqszh6Ivo163oCqkky
X-Proofpoint-ORIG-GUID: _gNRnNoYbyjeqfnqszh6Ivo163oCqkky
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4i7L3ySpt32I
 SD0LWezRM8dl5FfDGxMmTQSji3vEIUcW2tOFQta6Qw2gHB2dYI00C6EE168UWcaumj6Eo55pleQ
 Ry3j0KAcKrRk4DsHS1Ks573NM0BaYyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:36, Bibek Kumar Patro wrote:
> On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
