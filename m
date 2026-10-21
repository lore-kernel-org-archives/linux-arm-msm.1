Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573743;
	b=OE/MpZNiAff5fYWqx4mjK3eIhu6lzVuX+2XppV7YbGt7R68nLWWoUqiRelb7O5y57roN
	 eV0o53JF3dCmPTLMKouOztUvz7oiUcGN/447TPDxsmkBraQVUeP/rxd8eH8ouvx45M9sx
	 pfXycDyinOZAKKpYNXoXiofz37fNuVdTTLUbbO9MtcSebPT4zA+r/jBvDXJrOhv9w7M27
	 RPow1hDpdCmxotOl9MsXu/BMw03y/8rYgat8hwtO3hcG/vAgnfUs3ms0nVmC6ikrtJ9LK
	 1wdHI8H6ksu99XIFYOfAfvLQ5MPk93Oq3nnxgeG2DLs9MJL1HPbCY7w6qg+/6EKUvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
	b=zhCGWaqnZ7J6Xw10Qq6O4aRLv5zhFsmcICWPIbvi4zO7LzE8pl2Yejp9T/WuMlerVZJw
	 LYc5XHcgvhxGa1dqQNzunoybHcq0QzhxShu5CaHXF7frFGD828w0V3TjRuzkpUOt48JCb
	 M/e/qGrkAGyqehqGDnPNKMlgwCFKjCkpk2LWEEbFjU3KH5hpXQ/qPYY574R36nfQDr9wv
	 1YK2n3WBO2WHgOZUcliicDCiBBxupPnh8+5KEhuK2C1QrHI1LpKBPkg05zzOVNftYLM6Q
	 PwNVv/vheOrPlsFjvp4ug+zm/LPlv5+YXe9hqwcqJR+DSPIt27rA2UE8lUKsFJSqqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9336606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9336606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jaKi3573438
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GsnIM0p86hANMXW1GOBgAJw+
	27kK75Ae0x3nGj5okmI=; b=niKGOsSBO1/UkOJ8NdqAATH1RX9CpEKMnBQjtTg4
	WrlzWfxhOyHp11Fy1d9Q4572BZX152ZqdsJTj/TcVaQiCs7Pii9dOjP06XeAvLDo
	PA3u2gqR+sS8Cu/QLwA96oy45BUzA1qUOGECjbYekAcgr01SleVzCu5uEYDXLTzO
	GdCz3ztGZPem7GD+p47Wt1/YHpdKO024LVN70C32iZ/rNNEldBlJGVE/7RbJL8oR
	C2n3niXIUd5Km0pI+imPcnQzfgtzpuIH9KrgUagHjar2InYnsh4O8Cx0+4zkeqeP
	qIlBCh88vdSlVEgUkn1V1uLbma2EoP9aYvLWIwVQrAlnJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu5e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so115149785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573741; x=1793178541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=aY6a7838NIJMzyJT7nb8YWgyLwrTnpIi3dN4nvaAv+gjSkme7A0PByQeaf7AoCfkH4
         +iJTHUyyiMNKSNOQj0NX0eHVW5IMU4rTEWMQLLzhNZ4wnx55Y04WXC3QaVXEyMoEqaO1
         5FCG5JeZEdD7vYj9fkP+Uk6neyuuMVPAHtICPLG0oUVbUMZcgNNH6PGpuj167deGOxWE
         WUMz1kiBUcJME/8TWrnRmRxadTWc7rVdNKLekFA3QcuNZ3t3sV+GPnZyZL1vHKdbLsi2
         Dw46zCylfRTE4dRCzWHxYesi/cjJRvdr0FvQ9UfghJqdbji48AO0KMpnd4bbsBZEh64H
         ZX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573741; x=1793178541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=D42dU5o9g1hwrgCS9Rrz0KL1iBvgHuGgkNDHg2lvPRd1/gcmyjNTHOg6K0q3JLGwKg
         FU2dVHi/Sm97TSzhPMWEp4evBEMLRrME7nx+KdMmkUDYOFmoXJLAiSNzwWhFAVMZyusY
         I79CJDCvo3gennZpTrT5Ci5le8E/e62an2qXRBl9lU+WOpDFzbHc1rZdIdJwDtNh1o5U
         Ds4QrvTbTJx9PTDPIvPjN4ys1JXLCvHLtP17Ulyq84qRMIgc3PO4VrAvN10U2i4WpPQL
         oZHqMFj7TRq33+Lzko/b8UkEYGCECwQHTrq5n1aBRlMZNT3Nl+Trr2ae2lZiBswAbyk2
         hsaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3ggfjb/Jjg2nSsQr/SXN1QHwAGAHeK3DOYiXqX6Lkm/aDry4j0v+e7WEUp8XCvtFvlD0hXvKhImv9Cw6M@vger.kernel.org
X-Gm-Message-State: AFq9FYIne3EVGviQsomiHeCBFGfkVQ01PKvDRznAnFycXI7XmfCxXb/y
	kh3Vz3dcfuQ8vFL/48VUEvYBmWMf7COfFChWLiX5sY6S7rrhGC/hmSMwbAmmefx8P15fVzCqQ0+
	j9y+ipVpj44PKZUKUBTIcoQqTRqzwFbofUknISyxoppea8J+C2TO/U2jk6cnSq61cj45f
X-Gm-Gg: AYBFou16L+g2TYkgexNN/qYQcdX11sBLK1l5IqrTCKA1FFT9rVuzGAl1F6P+AdWjfyF
	+x29IbYhcA6U7+V7QIw5g/lHPHv9A8iQ9E5U2sge6OHJX0hrfHnkNM6pTBoC6y7qx/QYIfoFQc3
	JZGVSAFKp0k1I9m9A40Lw7m4tgXn+8EPB4s4gD4xHWK+pVYvYnmaUxhdSR2MGcIeo//WW7pgm9C
	zfr2e8NkRJFqjHS+rdYSaTRf/yPaBqdurFkeLRBCwVnmSrcqKsVU/bJ+OgsNnI4gLSUZAXrbP53
	dScksDZfVlzl4uwf5OHGKTg9DUkvhvkW5YPtAIPnZgnXM8iwLYIAGDZM429ug8+1RXDb/pMD1Ck
	DOnu3CZSHM0fSLiJW
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302299785a.57.1792573740978;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302296185a.57.1792573740394;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm4461248f8f.53.2026.10.21.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:08:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:08:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <peg2pnqbptiq7luxtdudddakrzuphe2uc5xlwi3vbifprsm4ww@kd4toenw7b75>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8812d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4e35E3TMtzUg7Ff5I74A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXwADsfKYHahRQ
 BhTdXD9n/qa/QOBizn9i6sQLEgmP1sxX00GBgdaw1HRJwu6zskhONJugv+hPsTOI5sJBI6G+DHm
 yFuUepQF+30zelt//oibqBprzGCpjh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX7Hcf8WJBV2+9
 FJIvpwTII1DZGklPSWEd8qHFyYg//pdOxUAwuDAiu6H7i8oC8rnMHmJAcR6hIYZG7BKgUCgdyP+
 7QS5twb8OlzLjI1g/fyWUd6qp0dtyFuoi4VqmIyYTu+nIqSZkrhy084csBfMJCmXfbP8wnxC9Qb
 NnDsS98kWl9aS//cWPqNadUy6nt/jK4xjS2iE10PhBGwt57xsjPtL1+bDlrBZX0ktB3del4aGw7
 gZacay9RPE5QPO5GKwPHfzzFCSwzPNnZi5QlLjVlqNcsL4QYGZ1foP8QzNHX0Y6VoLU8ra9OHuU
 ieucf0qGgERT44a2KYq8RhIzJm5GXxtLJDDY7OGExMQahVCMriDM1unfWl2gcR1f/5wNIo+ghYa
 037w9X9b2Su/HdfzW9Rku6ei4oaQbxIDVmXNGcd8y2ShGJNIDxomFPsXc1uTySzISd9hVT4a+7g
 jMH1u4MIVoSKB0cvOzQ==
X-Proofpoint-GUID: Z5mrVQIkkLWFZ6pDlQKfKw5MIve5C9dt
X-Proofpoint-ORIG-GUID: Z5mrVQIkkLWFZ6pDlQKfKw5MIve5C9dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 26-10-21 15:36:29, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
