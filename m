Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956333986F
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888680; cv=none; b=sQSaMKGG0ur8nwhsDF+iAxE84E3MVDJYXdjjIZE2i1tCc5BFRwRvSxfvrtsYAh1+d278f7vrAU5uAi/M0HKYKs54C2sG+fs2oknkeyxs7mlyP1EF5OJrmerr8sM9nSOXFqHBijCqFDrSHjT0qNtAE1HNOVXz7ThCkpO/XNy8MzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888680; c=relaxed/simple;
	bh=s7eAoytgHL78rL5A8ihXjUoEHb//2G369+9k9wxCR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVkVPOKE0VWHihkwbjLOd/RVxgp+eFsfDZlgW7YgGb6jfoF5NKy+tkb8KWmG4a5VArNGR9vkDUk8qob2XguixKc4AGW8JFAZLdk93mJnjlRgbSKsoCDlSLC2/E+rdS6ojgvKrTmckNKI9n+/NrHZafPpFmhwNICGa179D8AAdoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9P4tMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGixPr78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9P4tMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGixPr78"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K551it946293
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tE12glMtnWbg3wZF5tpLsoGg
	lLX7WuJZscPmbfDKmso=; b=WU9P4tMbZtsjPwBqnTtYg/gEyRwOWM4ovuhTKM5C
	hYE7nPTDT2YSc3TN24gfOoP/6fPhHOIQwcnLIPelMRtW33CBpatctqVBLgdNnSEG
	1p2kS9QDBB6ZvGdD4ihmPr2KUhBeoeHW+rYMo+cV6miUH9E1REKMtKQyTzkKz37q
	7wXJWsnyzcBRDxE9OirUVfnnLYZ6GF7i0P0g2QqRnv4VCVMFwtOgPwRnEVETBe07
	lbdsYFQqLv1IXnLJYEw2DZ6HRt4YtsdtI9d1mjy86oX07aXVjSExegWjVi7oQdH5
	dAfaf4qFGre8SiLceL2B1lq490cxARolFO7w+2mpHYuSqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ejcxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:17:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so2576594a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888676; x=1790493476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=SGixPr78MHpV4Sc6KmGS4eQNicvRumiO+rVPY21dFPHQYvlOyse934KZI7kCdDtGrq
         tpR57IIUUr7/Dyw+dHtU0tva71fEmx1QdCjNCbdHotawwIbvglea+X0qqK9AbOr+yf7B
         tmpX1JMhTyLltiZG6Wl9TjJ5nXeTOdeG5YqqAWZMTDT5xDTevb3KeQ/2sCiu49LfSdZ5
         WVDrOl1Loqp3rC7b1vEN/XC6DiMoQ7Ec1M+OmjrzCzdPx1D5YbGBoVXG9mn+Pf+rafjQ
         cn+KKSeCxCMz9JKtv0L974tsTMpCFnuW3WEDDP/eM2nfvbqcyLOdRFx0Ua5DHrZJ9jub
         FDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888676; x=1790493476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=VQLKeQy4nmlerTeYycRsY3YWyBn+TzvJrtULIafBoUrFql6eT1A3b2O5ZKMQ9/Gnkm
         V/zEI0kMk67VVGkbtDMB+MrhNR/H3T/1Pb8k1M+QLI20P/57DwOMJFUIHv0rxn4u6hds
         heKDsCrMy7GHjy6C7mxPMwL5sexWiLwA+KRrsClzuPD10IqUOHSPtYYvPzYHa9DxDt8T
         lUN8YSr2AjtAvYF9q7l0vkYD9s0uJsHCyafpazjNNfqBDH/ELZIkzcnhT0LzB/qCxpRK
         cLordR8SZ+lWyCsiGXwXJNv2hNo30aQI0iTaTZpkmw4hL1xbz4ZAHZ6RbpcOj3l2Aupo
         fdvA==
X-Forwarded-Encrypted: i=1; AKwUvBz+rJb0CGvQHH9xskfdzqeno3Bip4lNc0KVm4GFKnFYHDWkWCLfaMtN88ptwHikuIOfYA2ZhE37j6y5D9o8@vger.kernel.org
X-Gm-Message-State: AFuF++m13NQog97HzG/vf7Y9Cf8D2L6SxzlN6KAKPht4Y/YukU3bMa0B
	r1XK5kdfkxD20azVusilg7OxHh67z+Md+yXahZx2ZFvca0mkOguwett81JzoYcGfwrNTr+8R2uE
	ns9ZP10uE5UkqDgZcsae+Qy6Yix60vDWR9Myr0BZmTSFNBGuI5x0M5kRvsQ/HL4OzNaTi
X-Gm-Gg: AYBFou1Cv+W/uYTUhjCqGzp5sEdJHVfR+s+ltYAbk1VRM4HVPA0HvpSpS/pvAfP92Tm
	RY3dxRmK4d/+NcLXMeS2mrUcg9XAp31vJYmLhV4EtajNpjiMcog4PMf/Y2cIbgB3GuJPIJozSQ/
	qIZ0fpkvNtwPkVMVI/KoaxxaOgswL/gq1ZN707U4NaAbbBQvLJkvQBRe2AKcTWqk0ZTYHz4OHGr
	BHLV0Al/UAe0ml3UEqN4XO0VvRU2jK/SE9zgoiSOMTf8BWFnyQ0wjaZYEkhjqoUDS2OpR+1I5gs
	ami+H4+CkPEiRZd7LBwaQN3tF7q/d/ftCgyAd8lpMyFggGVUl+x7zOXfS4Cgeh066jstjMfWwtR
	hrk6dDxZMo8KL+x20XF+kiDXLNesQMflvaWtKJnQTTA==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928728a91.14.1789888675764;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928706a91.14.1789888675373;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm14226451c88.5.2026.09.20.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:17:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Message-ID: <aq-Ina0nVQTBTL0-@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
X-Proofpoint-GUID: Cf-YCVZNyY7yoD02Zo2b3fTY6Llqnojt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX1bNF1+1GauAM
 KZrJEgDDzDl8CYiz5R+SUOiqDHPOntcvk0MnMFkEVENIo9J0RsdXQhSiK2jeyllqv82WUOhpll7
 P0K4xw4lTWZxQaKd/ZyQzZ7Y/ZdoZNUJmKM8uaLYLoMLZEHtvKWgWFSm5lmgknV2aCb7M837cgo
 vUJB3ae/ubiKPG39PohC4UvONQUQqL1MbX4XBgnEsmd0uXSaGzC6sGKTAGhahxmlhd25fCwEbnb
 H9lWyEaJevBnA9vtwgr0kZzqIMM/uOzusYNZjlMeo3VH47u449rynGTeYXOvSDeHgbpddLZYO+T
 Sp54+hbbBpoIfk+Qi9luM04z5l69024FBHyn8aNSaAZbhm8+9BYdXAt5X9owjBzTdB1/76yMORI
 2qqh93123gAhHF6J/7PtuRPzUQ0cITXaDw8IXbYKb0fNExksv8MAKcdzcEqaHNR4taWXqwUI8IT
 1HBeBN8d7/8VVNQ31/g==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aaf88a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Uj4jyQ9UG6jGA3GiD8kA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfXyrhU0tOYOUa2
 xP9ii7J5duQ68W7C4teG2lB+BS2hlefeH0QhwtNtptkaHDrdZNNMphhKNuam6Bb/3O/rwhI8a2Y
 O9mHjC0xQUB3hKRKCfwhpjDCkzQujAc=
X-Proofpoint-ORIG-GUID: Cf-YCVZNyY7yoD02Zo2b3fTY6Llqnojt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

On Tue, Sep 15, 2026 at 05:34:14PM +0800, Wenmeng Liu wrote:
> The VFE on the Nord platform reuses the gen4 VFE driver but places its
> bus registers at a different base and does not implement the write
> master CGC override register. Add a VFE 900 variant to the gen4 driver
> to handle the different bus register base, the separate location of the
> test bus control register, and to skip the missing CGC override
> register.

Are you saying VFE 900 has no CGC override register? Hardware document
seems suggest there is TITAN_A_RT_0_IFE_0_CLC_BUS_WR_INPUT_IF_CGC_OVERRIDE
at bus-module + 0x08.

Shawn

> 
> In addition, the v900 ADDR_IMAGE register takes a full byte address
> rather than the 256-byte-unit encoding used by the gen4 baseline, and
> the full IFE write master client map places the RDI clients at index 28
> (the lite instances keep RDI0 at client 0).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

