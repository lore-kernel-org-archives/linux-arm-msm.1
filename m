Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF87409114
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274163; cv=none; b=BWN+0iRHY3OCXWfIcHbjo8Isg7sSqJqtgvSslUgJzV5i6lqToqDRC3rnC2djfWpp2IVALjOsyAcgl5eylyzCP1T3Emewo+2FxHU4nTjODkcUXFGBNmv7piKzFRMFma4hxWFkaQ4H90/SWVDRHE41uiw6DAiW6FDvN0+3dRaawUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274163; c=relaxed/simple;
	bh=h2WLcDOj3k4OBlntnyY17nVK4H30VzUclgqFOJ0yB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KewHS3c/yeY0EBgKcXA7DEJ7yDx+1E7abmpQEZ9b/29kTKWw2NDZoNFw46AQRVx1Z+0DlrVagYtIOtkBmpC56EdhVnZSuvUbsdjkqQFFk0qj7nFzLcSkqqwVWmYmgZrrdVSIuaaWiHb3lBgsibr+4XhFnLac5NM6YD3GpSX0F8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naX72m5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyDyKyqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naX72m5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyDyKyqq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Wmu2746429
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvoY2QdWS/vIBjMfTsuzBB/l
	DG2V9aKuSuLYY3rq/zM=; b=naX72m5PjDY6NXu390ua8GewZqfyb8oRuKwuhyvS
	7T33ireJXp5n404TLry00uVqZkLDItc0zvqbCYIdVIogFSEMIuQINCwJMRhlyYvD
	PEnRslO7aaiV7iJYrPfIKESRl9/HzhVBlRA4EWx63DqBCLFTyEvVobRHfz+dKfuz
	ow24bO59xb9jHao/XR8fspsRN6spIdfa2cGVH6nUuQ6lrDhft90X14M5I8b+ftJb
	owt7YMH0NIrPrNaIKfhekGfan/QdvOk0JwvDXVAXbgOUQ8KKCC18u3EAEWdFYjDd
	s/KZe4WTSw0UTxxEzNAD0/F9G7wxFik9B0xZ6NaAOPOfaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm15y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:49:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so777860185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274160; x=1788878960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=UyDyKyqq0jT2u1CvQ0OnWwgvdo92QhfH7EuPMuXJoWvgGDqY2fGttx+uF0jVKEJLi+
         HxaGZUqEywktV3hgqjJKZPRJcLirEpAGyzJL8lvSbTtxBDpSuIa60d4J2PCWT3yoMbFq
         iiFuH4hbrF5kWPw4He7IXh/OsON1FPNJO/dATlxbFZzzDqIAtY2qbkz01L+Qvp/9I3vk
         yazZ4FHHC3lldjUQASUVKX7h4olf71luHKL9N4iSxI7E7enganbIW8JTbbE/ikRf9FLm
         fH8OkE4AwxYZ/tfcELRI4PohJdl35p6OYfsubn1vf22tcfImD6QtbzMjLtP9MU+s0F0T
         fvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274160; x=1788878960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=Gw/9d8pdfpKg6qGIvKtVjqFx5e8MvN1NxM16EPkSGINh7wUIFThImN8ilrgX4FYzwR
         DbfZP292TTz8cCqdKzZ28B4A9HR9aWqhKIf3y8k8t1uTN0lfv9kvT/QTzSgxkj6MUVK5
         haiBgJdRBXNwxPggCvXdvIBcM0fxznr3b/B7aZ0fub71uU0RlRCKPblhC93AW8LiGnVk
         3hZjg0iT1zUXkBdIq7cfLI/cqAfIdKVXspJ96bE+LmP4sG1iVsErxvbGfR3iA7vRf/s3
         ctdrqHPCwsojTMGMo7ASldPvwumkkyoP6Z/jXMSl5tJbj4N+5wwjxPpetGuFvNZmfnpL
         Zpsw==
X-Forwarded-Encrypted: i=1; AHgh+RrCubn2OghPSsH31sOfwzgl18hYbirYhqsd2PqvlF+yD4aOLsOLKRpIzeAqgIw35JpBNJIGD++5Oc04xhbt@vger.kernel.org
X-Gm-Message-State: AFuF++nkUHI2+VPNLVFcIPZosM44w4FfW6r0OXDKZ1oxVvnlGUlDVhCr
	y12CGg5jyVJkbimxvS4jF6SqVdMKMSlKimm7J+WleVq0tp2753DPWLtRJnIC4TY04AnyEzM1Hrf
	DgPUG6SNVgV00SvtsIsHNA28bYNBNNSOjfadbM/31Ustq8OO1+zOJPMbZO3iTv60tCW5f
X-Gm-Gg: AR+sD12T75fnCJ5UX3OMtWjkv0YGnWOFzjdnrkbjJK3tmE8n6xfmJP5sLaqduXmyzBF
	qhe62lVajdxL2HU6spAky1i8kHynrf/65XMIGYbfsPT2T9L2mpiBv6KbgksUHqT8MX2ZaFb8a6b
	/SxQw/JcFGeFLowKUHRXe2+fROQBCJIWZ44MMaTlfBXd3ZLNJeOjQxTrdnzdwS+oEg3gqx0Xg7p
	MDfTlT5g325hBuawYeAu9hENGRfs/6LwWpY+sT+LTitzCTYfDXvXk/Br+zUAJWopjTxbv0fYXxN
	rhKEuBXwZItgQi72WPs3rFDCRrAu/5vcMRPdUP8d/K96/3eCJAS8fGR4DC3W3Z8Bi3BGrLVAUsL
	MWz0IvsMCtqPAZhw=
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984653585a.3.1788274160142;
        Tue, 01 Sep 2026 07:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984630285a.3.1788274158525;
        Tue, 01 Sep 2026 07:49:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42593sm5660257f8f.2.2026.09.01.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
Message-ID: <m4y722wgil3rw3pg55vemschlcpiug7s3zrdkn2gh5fpflp667@eahg6zydkxjd>
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-Proofpoint-ORIG-GUID: MqUE_M33IJkzTZEO_tEMHl7AtGJ-U4W7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX4Gzh/9GXKX0I
 fuulXKyhhkJ8Hu1stytgDrQy/nLD8aW6tlvRSoMLBtA7BIxmtd/DPqtiSPMdgYGwDLJJI3mda63
 ZR7wcJQM0/2Ko/Xomoe0kMQweaOlmtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX8y74iREzYlws
 5vCJsDyQgEkUOh7g9zY9+L7ZQlE1jsPgCCYkPFoAGi5cPZ9dF0G3MbFbbrwFGvY9xSDzeuh/v1H
 9cxXn4YUXGtvZUIE1WteYTPk37B/nNLsP4Pa7XIxYIK2/rK0yI5/2QI6Yf0mrg/LmqZwU3SUbrP
 FnluWpTyWk5ZD8Bc6xSXVNzqZ2nQWgRi5TXnw1yi8UAKDyPFT9BcmTjMWpMIehhhwjLg/gvrQFI
 DleLtOtSh8UlW9IeMpWt7nWJCYnnzBVf3IVvbJXgzxPuY/0GXmbRBIJ5y4k24fPdWgQDA9NKrHL
 8PXPSgEbZ46GLtigQOA04zZn59k3kOhpKlzMFCIAJm58x9rFg/PKwJ/+I/uPLb8ULGGc0ZFpDxT
 60jlcvpNSuq6WL/31adUiO6VryKfAvey/+3kSCpwmHRHkzaw5GH7S3Se83rIWAd+Wi9uiHbLy+x
 ndpI+Z1jr33Zc7OYb8g==
X-Proofpoint-GUID: MqUE_M33IJkzTZEO_tEMHl7AtGJ-U4W7
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96e5f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_ajnx2MfLvpOtqwsA24A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

On 26-09-01 11:20:56, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
> that regulator is not modelled as regulator, skip the -supply
> properties for those two LDOs.
> 
> And document what the "missing" regulators are used for.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
