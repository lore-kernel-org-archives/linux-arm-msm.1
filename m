Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06110515884
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570238; cv=none; b=W+IYKcotrf82zRF73DMU8G6LtUbLlGV5VTdjRMimuu0LMBglzGspalIhfXjK+fQ5zDsjWflr7Rk0wae/y2s0HXXCzlNWbPRjh0S5iXTL8TlQJj/Gqd70eHXExu1vtFFzXmefzy/9yFzNZCnni75oqIvLJZXa7Z0yT5web2/weN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570238; c=relaxed/simple;
	bh=TEZKVjkIImKIEQ9zv9oszbWeP6YlTUGvoJBr9vXStWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7YpbuQlOptqMhdjNsJZ6HawdGlzVcDdSSV0eQPWffkmq8Y2VdQuRTSsnP72vUGpoRe1g3TMdaGKdcVHMteyPqAoDNLBDrykEx0cqg+3J+eYTpftIxdzcwqYCqxEa4jlIBdAl9I9wP1eFpfIWp4wnLcKxJzHVTCvuvb9ho8Ylx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGnGylqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hiclgfmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGnGylqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hiclgfmL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZZTd2460056
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OjNCctJ9o3QNEzWVvJANEKWm
	oldi2roKBop+jgWBpV4=; b=jGnGylqU4f/PPKbIXXaVJaZj2A9ifU4mNOF996qh
	qBPEj59vzsyv7/AE1Yc2T+6f4NdZ8AXmCjamvOIVfyhF945R5TdHF+i2VlvDHvqm
	u1KJoS5cm8qR/p89bsvz/rkZ6zFXNyHvXiZ0gyGa8AZHGkSqiSC0EXESdYb0+s8o
	35GKv1leVEf90G2RTXB4cumTdkJ57+71OA9KdNEecpN7qGPEYSGFUUa73lEfTPMn
	nJnjrd2CLgllCTSydCoyYRXHXohlO2xQMfYi/+VZ1PBhin8uucyRNzgaR03QsKgW
	TZCfKSPCzuiQoV1Q9F09oot68Uxpeq3EI21jjwrYk04kvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t885vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:23:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso1309533085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570235; x=1792175035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjNCctJ9o3QNEzWVvJANEKWmoldi2roKBop+jgWBpV4=;
        b=hiclgfmLnv1Y0OoqzcdHOnx8IYuwUq28Af5QhZtcvk/G23ue5jhwu8NGy82NHyv2RV
         qCZuptaC0CqRSgl/enUoVxN27V6hnWY1pCkB+qA+MXGfw65RX2If65solgUFgAznfEmR
         gCJ67qgrYDYkgbwnUnePY+GLCzk/BDlpogRhq62Uv21G7n/LwcY2vR3ptkqfNHT6HWmO
         yKh31+4/6eMQkYEmVrlyhp6J6VCKv7YuzeDXkhi+1MhxOqkZeU6Vo50oQeXG7U4wGxqd
         Xh7NQdjwh6yumPSPYNIT8N7qW/3Z/lAzxEeWQn+DSN3qIVFJJqw2nUEoKWZEo1fCLVyy
         OXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570235; x=1792175035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjNCctJ9o3QNEzWVvJANEKWmoldi2roKBop+jgWBpV4=;
        b=sFCfvXSygxzim7G1lLgFrfcVN3nNTE7M06awrxYSnVo4ks6gLOS5n//ExPQ4xCFYsH
         YNsb9VMb+Y6ANQMZa6IkYILpIwIxM9b0wo17rEBP9I8pVJnCpMxnNeBl3l2/yx03VcLB
         0FUB57Xl77Y71rQ9ZNABINOJNLxEiZrjzbV8XREBQeVTi0tl368tD21SEQ7hVGxGKjsE
         Y5XvaQ+A0nvBm26+RmLheIqUCJuMCtGNJbMS1/tz3ElJZlK5AGeGsWlRv1apjPvztSR8
         eQOitVk5iwmopKgrfj/mOE+tchv08F0CsKPsmOYNOw/czt+o9hvrNPFVHV78mfVCs5BP
         u4Lw==
X-Forwarded-Encrypted: i=1; AKwUvByWXEqXtvV6MNYnfWzgP5Azqhxybgrs1+m3DCK4Vxa/IOcsM5PTJ71BATNcOQJQtemkOrya+v10GRDZf9B2@vger.kernel.org
X-Gm-Message-State: AFq9FYKilRDdvUldTYi9CLX+pQIfte4bumZnklFv4tefgUU57Hsgm+KN
	SNnh+4RTyP3Da71XdUY9k6Gn6FfrV6hz9EfV5Wr2envpZk6moliHvfntdrjceF/o8lF8+5/DaaY
	O2uSCeT2QemScLWPrRHSDGuSgvVqpdoGVGK4qyKb/cbf9A+9nnYwgCaAjvJfgJbnGMzEs
X-Gm-Gg: AYBFou3XMEdud+5Uq6/6FztcZKoXELH1YGdDS6apg28/jyAjiqSC48UjESUEuh9lUoy
	a/TyFDe2B1L0rp+smLKbRar8bof4hB7qCsCzzJkfPpwk8uDKyHFoMrtaXAkNPyy7P9tyyHg1R72
	D9b4giBtQD+w2qY7EhIk4/2rkoecDujTzw+wueVc4ToTGfoySCOo71rULxmrcVb7TgyFLxODy9L
	JaRFJGFilNVXkBlwj5nIFDIzvL3AIqC5pJeLVKbz29gtjREQyGaTv2HRJvYTCh2shqS+MEJFRAr
	bn07+koQNZ1sPAdx5eSPn1lLQLqHLDn4m5gmm6u5UJ3OxLch8Uv68lPjEfz0hAz4LmT31fskOIW
	Z3MmGUCFGg2hylWE=
X-Received: by 2002:a05:620a:4456:b0:93b:be6d:4f3e with SMTP id af79cd13be357-93ebd1b7386mr474337385a.25.1791570235128;
        Fri, 09 Oct 2026 11:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:93b:be6d:4f3e with SMTP id af79cd13be357-93ebd1b7386mr474330785a.25.1791570234455;
        Fri, 09 Oct 2026 11:23:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18d12fe04sm43385665e9.4.2026.10.09.11.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:23:53 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:23:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
Message-ID: <mdngfjjdhjcurzhxyke4n53u43zq2b56hfojisui4o2r4ixebs@4pemg6bzzd6k>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX9m5CmnZZYG5C
 afFrtRj0MR6phvYLsVfzs8ysE0h87gs6yLaLZJ8vd9L+dGJi8oKJYi8ORTcQ8d1ml3A5TmRfJOF
 +xXZ1EWOCs63bg7GJtT94DA6in/LotU=
X-Proofpoint-ORIG-GUID: IvKvQyUNydy4cAOPvrbJsRm9g32TkyMf
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac9313b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cElxuMu1DCgb3UtQ-3gA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IvKvQyUNydy4cAOPvrbJsRm9g32TkyMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX/rISgnyvuB7F
 v/T19S8JNnU150KaXagohsPG3RPH6GTZYbrX2s/ON7EZPhtgdAEGJfgK4MFg6SeEU3mlHsS2Wrc
 SFd38VeHpU5AUtBVOJ5PQXSk3dGeqW5p8f8WANif6S/9xn0zvvzks5uuWgGnXr0QhIqMC8h+OSB
 23Kn+dJUDb9yEhZyW3C4j2fRVjPpwDP936oJ585x0Ov62vA1RLj2eHg0LxB6tPXLhu38BTg9OGo
 dxecR1xRrhhLpI+1LxBRT8QttyUzdGlju/Ogutn9BxTBVDmftKGQ9CCPEka0Pxg24byg2ek3ZOn
 f+FsQWMQneBJ7IHlHRsj1y7r1JP4RCPrzCQBdFGTq8EKklQhdZ4zeGplf7rMwVKTUeyvCZIAHnj
 /DGgdrXQuJOqfunRRKqFkdm8JLM77o46hy3GBJi1sgC17iDz3ZBBDOsgIXy6wGPsdjAPb0co0MD
 6tMGMdN5x9LkxTsxKDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090073

On 26-10-07 12:20:45, Kathiravan Thirumoorthy wrote:
> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> that provide the clocks for the A55 CPU cores and L3 interconnect. When
> the APSS clock driver probes, it attempts to reconfigure the already
> running PLLs. As part of the reconfiguration sequence, the PLL output is
> disabled and the PLL is placed into standby before being re-enabled.
> Since the CPUs are actively clocked from these PLLs, removing the clock
> during this window causes the system to hang.
> 
> Avoid reconfiguring PLLs that are already enabled and return early,
> similar to clk_trion_pll_configure().
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
