Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07A4A6CD3
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440653; cv=none; b=PM+edyfnrhhqzTb2gWnTtoUjpr39GcZuefCH781oly+bYCoqLwar/8gPjjPw4qcrkmLMdXUdakpmwX7OSdm1UaJxh0mR0WaWYIGybCwnBy41v0+ehXRjffwq0BfZ7G9I0mBi+SA5a+C5QNTkLQ2GxleF1fIgYvMCdRnPaiosbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440653; c=relaxed/simple;
	bh=uKlKDCO6lte9oquheVtNrXZEi++5BjURmRRXHWT7JWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqjVU8P9axq55hMP2QyggQsaO+IgOsF5Z1XQgjIHw681OjpBpzSAHtOOwpRALpzB974B7Pq88V1rtM0+XYFi2oeXwB9MMAzF/TMMJsUMRTT3q6+lsr9qRpRvDZdJzbolDA2h0j48BVzNFZSlMMkCNyO4p5bXHnlgd+0VuMGgbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE3SSoes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZy88raU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE3SSoes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZy88raU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHM8C3852435
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9o9tfc6MP2cm/LhJj6iD6n2
	2+6eraXxnRkI1mIVuDE=; b=KE3SSoesEq1RzZ1pOwC1wqNPDoVtj8xjf4xMQ5JX
	X0oTrmpNrQbbB8EQMzrbok2QLWOh4IemCFx2EE9c2GxumFPPjFDWSZBCMNVCsGP8
	QXGEBNW5//RzDkg1wPyzOyVedlsz8o6iNBItzsWGVl6119FmOAoF0W5EixxElqpM
	Ow0If3sMF/u1h6kN2VpHW/fkyehJUHQMp8RvErVy9ZoOHAs9p37Qk4vg580tALID
	lP2e5U95WZQtzEqHl4xiQZs/oRFQdg5SuD+BLlPUFGluLW/5HbWK/kckUqaZKrPe
	Qys5ifjjWZEcWEKC7lQ6DfUObrenE7vwe00AQvV/uyW3iA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1667-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:04:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78489ad6d69so2014231137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440640; x=1789045440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=DZy88raUAvuFutIoXXOn4vaeM1+TDULaOPgXobfaALcttPQWyL59ixfIB0s0CNQQgQ
         20gQnV2yBfTKxEkzEGe1RgQ78IDs7fQdxU6XWcOJ3ul9gYfdsRoxGYpWTEAvYtMjlIpq
         0Iibs8BVFxmy7IZclH4Aj96HzgEDQjhfSKOkzli3bFXVDbOzRySV8zmMpSqsP2JPPluZ
         Sv6VTtySQp3Giqy09wsQfqjtMxA8/2tslNf4Z/5CyuVqBCHL/WdwpPr66yfFm2CgGf44
         7MwtIrZHK1Np6PaHmb2zLPYha9knElcetqEI34nYo/wyyPMrMnMoxz8RZFzHm13GaJkE
         plfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440640; x=1789045440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=FvP9WseazF6TDyVCuvPbhfYpPbkJ875q3lxn9rEMMlZjmNUaySX51WkBb2z71xLHVg
         x7sz+caZyOMUXpznG1JVzOrXktQ0AekAQPXCvuLY4uUMdnTn0htM5I14w4Pvdn79EU8w
         Y+Kn2LSJ7Iri55nx7WuRBkp7SME6xPJgXb22KNDBMSXiBKtqOPhBwCy2yo0ZAW5NR8ZC
         k5L4q1Wo3o8sXgiCvDQ1RyiS5puTEp3kJfePvI16olvTgHCKw4VxWFMDkJLLKQmHpBBH
         G0MkOcrDHUIhrCG7GYP3zpB3wi1hQbwm4p2lRcusRmE25dRwuuJcKWLS3FfdA/QJkTtM
         XVmA==
X-Forwarded-Encrypted: i=1; AKwUvBxFd/LQdzt9YoZ1zlZ9LrMVvUAwz0fI1p4+ey4MicOmPvt7ugaNSipwRhOtNyx298wTnQ1YqM3PX9+SDpn5@vger.kernel.org
X-Gm-Message-State: AFuF++nqgdLtOsZ7tul7hBkbELC9ANqSmtB+gCfdLmc7ZXIFaC1aDRku
	QXSusnBl+N4Xx02gBe/HytgSdfRp8K4Ap7aBdeTgW5K9pGomcvPEbmUQZSzXDOQtdY6KalpeG4R
	WT3zFnrkW++asi0/AMxh/CEM7bdI6RuZcWBEQqz+wZwPj+ZtNg9K4ucDh4x+ub6uWpAxw
X-Gm-Gg: AYBFou2yDCwmY8Xs+I+lsBY99ylRodilEoxGSc0MmlypCg2kxN+0MIzuGzSCX/uT3jQ
	HOexVanvA+3ltVHC3ZBk4esc8ZtBOnoY2bLCTLrqH9JbaqTIhmUVihFxaZKI1BCCA2x0HWXS8kV
	Ux4/XRyZg40u3xxenTr8afVEBb/ueaffk08aaXDWPc4umi7T6GcC6Y4Nf0Sv7ti2fW3FMgqHMv+
	Axo8cP5rSO8jkS89Qcfmsz4KMiinwSzgbjn18r38XDYsjB5Zf53JsbNG+0WgJ4tiMODL5CPgz/o
	WUFqYv6uvLCRh8g//n5diti57XBUW9RLs++O4toMuePW0+dV6GMaiPA/gn9hFFfMz8qZOfSnqyU
	Q56cbamf2PkzrHw==
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307739137.9.1788440640436;
        Thu, 03 Sep 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307694137.9.1788440639785;
        Thu, 03 Sep 2026 06:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm13755345f8f.28.2026.09.03.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:03:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:03:57 +0300
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
Subject: Re: [PATCH v3 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Message-ID: <kx7vvg73j64dujbmbhblwr6wkoxdkimvw64uew4llzvleo74sd@wywugwoqv5ks>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: 63KJsyH6OAKMAK7wZ3K20M1uzMmFdfFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX9OQq3hTMi8DI
 Y1+Gl+IS5VC8uLq14h+IBMx9lKzxXo781qhGGgOA5OEPN0VVROF0nKYwFS1p62hDP8Kp6U7f1VL
 rt1NBrGkWW7GKk2So3H9LcPGIkQNq5bqrsEWY1ejCy6Rjjg4u7jVEadgVg/A//U74EvU9u8nN7L
 XwWfyVcs0VT8nvXI4ESaI4tcs92fL9dUDiqB3ZUQKPzWT28+qlylpGZtrtoCv7gK9NT8d3uXDew
 6JIiooUalwYDPeq/CryHCCTNrMbAJ38weNJeJ+xwmm16MFFCx+tihDlcCt6O6Sb7lIrL4UJay80
 /rl/4lQGyzt4KifdbM0laB9weEueNWG7dwTARvClfrhX1NOzZ08DiJjFr0eSMjKMlBJm8cuor0c
 eO8mEzoSdwX8hqaEE8Qhuxx6rMGbPhb7yI+0ucamneDw7Neu05W7gKdHONuY93eYw2NEz+HQ22y
 ABrUzRbUvS9DdJkDgjA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a997041 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1qdZy_LgBuSf-aNzAIkA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX5AGIrHaPKf0d
 4vojozMyUtErfiJ8b9NVQ/xI5aRstv5Zk6Nf44lmBZRJqPW5nfawNAoAQcL5WB2lkX4m4KpzN30
 QQee7jPNnYJtq7jtpncqQJr1cTUv+I0=
X-Proofpoint-ORIG-GUID: 63KJsyH6OAKMAK7wZ3K20M1uzMmFdfFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:16, Luo Jie wrote:
> The PPE (packet process engine) clock is derived from the CMN PLL
> output divided by 2 and then further divided by a configurable 6-bit
> divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
> NSS clock but uses a different field (bits [5:0]).
> 
> Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
> helper introduced for the NSS clock, passing the PPE-specific field
> mask and reusing the same cmn_pll_div2 parent selection as NSS.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
