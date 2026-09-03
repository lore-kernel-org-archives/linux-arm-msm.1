Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCBD4A6CC9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440934; cv=none; b=hy0MN1DoVtVMe6g9pCNPak5IB8x0R2AgwFJoJlN9ZMSVb3tydKSf8hd2yis7h4oYL8jLsWLw3MRpENMKb0LAD1zFdnz1BHwQPv+Hs4x9aHr+woy17hPy5uInEV9ovDg55MBDXmMFznaN8BuQrj/zJaozzZVYrtLjKjGhWj2d6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440934; c=relaxed/simple;
	bh=0GNg5kNgdHCE15KqkJAlxX5Kp69YoSsja79z/yO/14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejx3YJ/fg//mqvaVwHm1aY6OIqkTak4uUYq8r+99eCF8f0su3qIRSbfXHw9HtjUBACm43oe6zZ9KPNYobznCVa91s+KBkvn6o3kk2zaD0JJFCu78tjPPJXaJd8rxFRSEr0rNaEA25f9IIFbt/aB1WXbN7kGIZe6U64xN7v/5i/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gk4ZiBiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmWBPbp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gk4ZiBiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmWBPbp8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AwRrP749061
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWX3d+A3BnrdLFd0D2QxHQ4n
	ulGF3MsjnE+YJcGXOU8=; b=Gk4ZiBiT9wgXhuMnHb1OgXF57PznehxaD02w1v1A
	XZhjVvCqZZi9B32QdtERlLsOMynKVy34Q5BOeFQvU98Jam8nYOHasklRTojS6KRe
	s1aKyDE1VN/7JhTXTjjNY7nHBBedxJH9DG9hc6k5k4HhpnLH5MU2fWIg4rLRmTOH
	TKyFDBC+GrY7vcu1NhB9p8znn5IyIppldIHA+g0HkUmR2h4ZuceCnTqYVozRacxr
	uBa7afmUaFm8gM/kKj3aQkoL9Gdn+0Dq07bmMl52SCQPOfzIG78HvKgzsiaG+Rx8
	jNt/RXiNsaerQVzI2WcJT6Lq8E4zeiy3GpqCKWXTyXAS6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hvmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:08:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390ca1a9abso377420285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440922; x=1789045722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=jmWBPbp8iiT1S7kN9NgOFnr9/KzH8WWdXs93eo5wzhHL0bA6awxNJy3gg5EocKKhjE
         seorpy95tD9xUWPhtJGF974UF3l0HlAi+/QTYt7qBWB2vFbCO+Yr7hRRTxF18z5fZg12
         VcV2QilAmhKnolbyOsU02bczHXJuePUPQMfZ/yjGE92LOsP/rYtvXv7HZ48B6ToXH15F
         hMVrV8JzQ+DrcqiyPbbPkUuE6E0RHARJ7ljahxFed/WjSFA6zB5ecEskUoIfQQ2xIehq
         euYLWTVHVI3mauv7Pywm7GhfOmv+s6N4ZSYeAHzgi9adK1LId+pQ5RTc6E6FKnD3l9vZ
         UFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440922; x=1789045722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=FUxysSlU40IxZwBIbobaPairLueRKVT5b3Tm/8/CwAcsMZVfzVhVDRWiwQT1kI3C2v
         fBe9ATC/+dFsq8DsrrUdpLFSzzdEGHQDDiNhGZ0SdPlbOfrdd5JyYtiBXHmIMvL/tO3O
         yt+aBZjJCtE/8OPGC/JIWT7pR9IXolCR+LSkNJYahFsvM1Z5fqEXgzj4NbUUalaEcSzC
         GhsesHE5xsc6vvl9J5Kv5wjo399p3CDyX5nf8Ea6/zj7AQPOMje/yns3WKRZFPWFLtEP
         roDJOJ/Hyt3jA1lDojXlmCbzBcnkhwHayKeY6bT+vBlb6dFoFzSsfOjVU/9P3zRhCPJc
         ND4A==
X-Forwarded-Encrypted: i=1; AKwUvBz9VtWNww/tcqVuFLrcUTqlPNWuRyDTjL31TJYqBBOYJnKiaTXSHVKhoi74Jeh7y7DODpDODLli65zKjKU+@vger.kernel.org
X-Gm-Message-State: AFuF++kZj9qBHvzoXzj1oKIbUuyxUNN8OAB9iKUbB+YY1oQpDZIHm/LJ
	2OckSpCLslv8ieeKKXMvpKUJ+yf4YrJKU4iLv7wOXOT/23wteF2qVhAHD7XIqjihTB3xYzijysd
	3IZ+2NwRucH7lIdxP2brP9Pv8p6Rjb8P8IoC8JjrVgGQBiVTc1J6CMmFQIi2qB6KFk8s7
X-Gm-Gg: AYBFou2ucWSAPfQi9icUgW7w6jDva319iPxtm48JT1Yt+gAW1FHFF6eO7OmU6JJJVLp
	avKj9joZ2EMKAGELeTi0TMyfohCZP6IDHy/infAXsx3XL7HgHlPVyal2ogMTX0Z97N2YGuWWLe3
	t0pFGO3wfOwRjQVVU9MIs2EMEiy1Ztvn5SCa8bl1MFbLh3V+uKn4u4lLR16zqAguQ9baN6aX4Y7
	JWlDsOWpL9UZ2GWE29Q9KUAZwgrMGhtNQU4rc/wfNcVbl9uGlLlwZmXt5K5Qg4n1vh76sP1qRXo
	c1/6EQAVKIHOEiY6DhTfS7WLA31uZ/oBMne+znh4LIMdVkPL9SZtGUPyfRtZ737v+l9PhggCI4c
	CD70BWBuBlJEA
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725606985a.12.1788440921713;
        Thu, 03 Sep 2026 06:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725576585a.12.1788440920416;
        Thu, 03 Sep 2026 06:08:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm14540106f8f.26.2026.09.03.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:08:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:08:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Message-ID: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99715a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=g6LbhwNr6PFK3GcEcCIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MkPNVlo-74MrP2Cs9_V0qK06OnYCPFJ1
X-Proofpoint-ORIG-GUID: MkPNVlo-74MrP2Cs9_V0qK06OnYCPFJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX0j1p4BqXfLSQ
 Z4Quweh/5beela1Fo6/QVXFROEvSXo+Rg0Z7KuvOjFilJPLGyMPzM8+qsv7GpJtFDyLUsHJCZN/
 TsCyi6pSB0k/LARAr2u1kWbxTCwLkH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXx42QgRoXqtPu
 i6D6VvnVRlx5q0E7PbZPIa/BOBTys/dLeeWZp8J5t/pLJWqY1swH6Ya87Jf8/lOSRr4DpMzBc88
 ixFR2gkmHON7vi371wAh8NIE7ARlhFQF1nqUyl+gR1aeNLS5WUzAnM2edS3gykmCaW5cVDd15d0
 o1fWxOHjZP2JbqrbXj0MpbiG7cgwKlR7x3j1iAaGfb/mZPcl4iflBIV3jVvQI8RJFdRPUe6tS8S
 OG0EhRU9gBHXfDqy7LJ3a+aeDluBxCIXtw+6lv6pjBUzY/W2HYLfe+TpKqcHg6v3kaLbZn2c/yd
 u1ZmU1y9IE8bJxx5yy1fJOuxEWmIxgBsc5TKuJEbY5eTWVOlPbEE90mPsxEEtFS9zDD40/mPIEN
 tHCbihqqixtzuQ5Nu71Gj9DwbMcwCm17wzkRoessDpf7MeeXtPBW4m6aAIonF7uh8hHjHsOfMDx
 8Sj6x8x/F2JUWxQjL/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:18, Luo Jie wrote:
> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
> provides the raw reference clock to the SoC-integrated Ethernet PHY
> (EPHY), which supports up to 2.5G link speed. The output frequency is
> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
> CMN_PLL_PON_CONFIG register:
> 
> - 0: 125 MHz   - for 1G/100M/10M link speed
> - 1: 312.5 MHz - for 2.5G link speed
> 
> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
> for clock-tree consistency. This is functionally identical: the
> output rate is purely register-bit-selected and never depends on the
> parent rate.

So it is not a slice of the cmn_pll_div2 then. What is the actual source
of it then, in HW?
