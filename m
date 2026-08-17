Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC0431A37
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972845; cv=none; b=uoY37pdKyxm49VdyC0Xwvm7g+rCuwbDTpmTcXWqfu92W1lkP+RZkK+74iOzSyHm4s63dPhyFbLjyUHNXnootL+uygnFMieJwA7ggB4cH8mal4l8+LOAqUtFhS0lfVsSthZBEvGuvHGabEdSA2HEUVtt97cG9MYGdux++yX4pV6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972845; c=relaxed/simple;
	bh=voO8sypVqvQZMHIbsiVnjirbHet2jA8QTEFrrGTm2g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QO7HM+U0uR5YS0Dela5E4kzp85vRut12DUaTe1Fr5BYp2S2iyANeFVoSY34+6JTE4NwKNKo0RX3+ue/0AdOkGkBN7NrgqzyYp9uN3wDiZnLdB2d/4qmfHnlueG3mAwB0rzA2+1bhreODZhwBNbfSLxLwH6Kh2Ouwj46kyL2OgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9jN12bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqhZ4MTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9jN12bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqhZ4MTL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD61FW2329809
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=; b=d9jN12bhgXLXzXem
	VEdveKhdGhqe5nLxCs5296huHVlr/aYrcr5jRQF/aTcs6/VgXK7IdpmH++t/CEXM
	3tGAXCXEAvPba16A5/Lk+UHWmVAwivmyjzJl0qwKkEn9WztqJkid19mIbMW0gjCA
	qPG+sn8wuFPf+/x3aFW3VLBBVwgL2Pg2ePiBzmMBC/+IQ8FZgzG5NMnB+N92SHcW
	u2Iy+DySCSb5rcy9gHLZ8dZOyF5TmgpOd6mTO7wQRxtTgA7wkahmWLIL48otdy3M
	A3svpb563B8b44/Omh+6vdDAT+GE6B0vX81r3wxSj3npbn7kftMQ13j6Owlk/goI
	4u7Beg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghssra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so3867161cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972842; x=1787577642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=KqhZ4MTL2HauZ89eY5LkZDoH3yoBkTSmhQXjBQWktxz7ws6H2zOEebcWHvCKyn4CUc
         rA5NQNPz0B/5aEGHtYfcJUr9xDo+/rPjdJx+B1hPt7IvA+GpSuk91XTLD8LrAf7WLzY1
         MCgODu0JM0HJ9RcUxg+PFEAswFJV8uCVSAFmyii+5X9ekZk/U8ecWcd3Dzw+pIzY+MVS
         fXmVVf0BBG+WT05py4/EgWaiDJ/Qq+XuXPiyuu+0vltg/b9+20TLqqx9ZmBOOieBXSYr
         nckBYgbKfkcl3Vsuf4y4l3aB823xy4WxorpMA6o93MzefkGRrCBKVhmgzKEQm68krQWn
         uAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972842; x=1787577642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=H5tx0T12/JFd02OYw+VczQ1P9BdZjryLZKXdvMaTaAK2iQaNJW1yU74Z+nssBZF5JI
         9vugZJ3uUV9VLCZ9aNgcWUnHk3yKccP6QjL0MFE+4b2riiTkrNoaSukvUGV1rqn1V0q8
         /64bD+HHITtH7pRWdhfck2cN0nwj/WK+uVdC7F3dhFQMbI/J4YIbpCwjCRTx3PalKW9Q
         Rwij/JuMHuWMY+3Ar0DhL8WBUwWMuTjhi2YFQaKo7UYH8E4GS8+x4XqmfCF4y/mu64LL
         ZvkL74rdRD023HJt+SdTEfaJ9HY/d9Qs/JW6zKyEdbBkjspsRL6qULszTObTI7TA7MuV
         1/fg==
X-Gm-Message-State: AOJu0YziwGRIo9+hG1gWcs1pbmFzolubstKzQpKBg3X5c050NKc3Pdj/
	UyR8X1UHHI34UTpyBdK7NSc8Y4x8dt2rlXLYqBMcB57SJkSCCPGPlUPUZBxoDwz6E3EdHwHGbSY
	FDpqDZ7f12gyl/qGwfh6fUvrIAyCJLsEsVvty7gQSNSmO+mg3vRsVpl9YWxVnWlCbAK8P
X-Gm-Gg: AR+sD11mMbZbjJEgmaTLkJt6oKAZiQDyEnT6Gu/aJLyjD4X/Ckr6qNdIkIT8UZHixO9
	oDxSw9qqZA77H6gxoPhFXrt0dYWyUdR1kurmh1EyKHf3asnwkOFV8A6DIL7HRiaxPV1lYvx8mKk
	S0MC5tv0oPDs3ZlGz0rlQ26871v6cwP2tLNospulWqR7iuGAClf9bfq5nJMQ7LgETCio/ubpnGd
	MwoHDm3W33Ib9DAY/pTR4MFb1mPyXeDvRHz9RgPnizDdkPqz38CPcnX0WpcciITQla3JWBvNMki
	6sJeRPMdKyNDC4KzyLkexLk8rk01ODaj6n8IMlzf51s8L/nraXSpkW3Vm3wfAtM/Gj/bWzPavxa
	tpGMmkb5bid6g6JUy0gX7kjji
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193422531cf.2.1786972841721;
        Mon, 17 Aug 2026 06:20:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193421921cf.2.1786972841183;
        Mon, 17 Aug 2026 06:20:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:40 -0700 (PDT)
Message-ID: <efae422c-51e6-4dea-aa80-fb2669496ba3@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a830aaa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX/54MgP/gjH3D
 PY9z3u+sjQs4OCUDyUqW2Yenvsd7Nu6KC+sGrD+3Goi+J0/CPUKJc8yKR3CVGwRPj2JGGMoB7s/
 knFbm0IZig7cbVCJL1kz1vsZEWteAio=
X-Proofpoint-ORIG-GUID: ZQGVbh6hrav8eC2rAlO1oxs96u0jRqlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX+d6GoTOm+Fgn
 xjCnJGD6DSr+OPLJp6LTb64dDj3StGmyaEDK/iZJdUrV6lYxO1E/6vV/F/hbSsqmHIpZC5Fe/eY
 YgrJ+Uv/kxLmdIbpHfby+3M6LOpg8rjJISS7YNK3Yi6CaILfNVsCIklUp9GzTXIHVUefO3Xq7XZ
 hn2p56/HWJSN8IDs8d28GVE0bIzDeRJWB5vEvx3AZqVYPn0NV5RFgaN5OlvsTYf5EYP0MeyFzcy
 zc+KewYngU9ikPFBXN9NIGFX7kl0zw0k1NEP82V94EgR26/F1S2asuYj8SxxLyGXxEinhA63nG/
 Q4CPD9NfWASjD1OqJn7LE1f2r5PIxFcPJ1qiNFR+yD67sCnkKHNPhrEMxbKmbxhlHC75fcqC25O
 1upi3IGlZ4FzBaCJjinjdgBjnNB9O71BJWqzW8s0h2zrquqg3puP4rvIBWplfzgUs8ImcnnHx2o
 6oNLjfjSM5rLyYw9s8Q==
X-Proofpoint-GUID: ZQGVbh6hrav8eC2rAlO1oxs96u0jRqlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170101

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

I believe I reviewed this already

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
