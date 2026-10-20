Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501684;
	b=u5bVkybqwa5KZC5hDd97rdtlcuP/nVvhD2olpZEcmrXOpsSl/PLdzNvC6Q1PFtTLjzjN
	 2W2nEu4Y6dYUXe21XJ9kSFVnqgwpDQ+8VVhY6tD53Rl5x5CcJgG1FQz3y8/l4j/4NYPXG
	 3WidqdkbqE0VpJzYNPPe7N9CVsZ9wIj0+qcg6i/p++W/qAan9N/IEocTGacQSN+WaWpvA
	 UE6CVv9jgsi1Edp13qzWPF1eCLkLkXfiVMrsxxYj3P6HzUlLBg+0iXkB27J/N0I5ksxEj
	 hbETujakrOsSGoUXZ2IekTdxl35tHJCUtAQ+XgVnc0pQO1/QTwTuyu4vYCKztYNJAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
	b=d9tE/F/RGVSOTm4l1vcc8Yf/FE5q1ZxC5EJCASSI+aUczs05Ee92QxbZ5/8EqSpjXCgE
	 u/Jk5KoyJdFl6a6BZJK3NZKCiCNryHFzgoW15A8Npwk8GahRSpnLATzv7p1a4IHV5G9Gu
	 tsAL5gDdVcCSjpSEElZPkFoZNdfcpnmA9rr/5uAjeXPdencmKsoqB9t8pbcgsRS/ivULc
	 VHhzQ/IcgMofUncV6YA7bDi9eiNGUb8Dva3m39VjrcRw37lIJXMaKOmfHj2UITyVcUzXK
	 tNWyFH+v3GP9CYxHNV1N5ppZaFxCbBEoAjwLSu3wk6bZFiRBVaenhDgWRjAlfxqe59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CkYlAD/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61007606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61007606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkYlAD/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxLeB1145632
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsVaM+X+He2qAXNYLPkW4269
	T8viIt6nfU7YTJpM1Fg=; b=CkYlAD/GZ9N7jQyCWq6NWS4nrvWk3+jaTlzasDFG
	rmmDIb9ZcEzE/UVXvfMcnRsLqPb7CtbFIPtHBxMIXV3/lRGNVcQvxDqfkIfJcoFa
	rsa/fGM8wZp8MFjXhmOdO9fVBz6lUklKO3J/7kfcXF9bhZaG7zphBkR1D/4CATgk
	RrMhKZnhVc8rHvnr8Eb961Mt2mycbTromUovOyTE+aHnljJu4vIvWulF3pZJ2v4M
	qLkqNbO4FzK+6Djl2w3Iw2cbDwIArDUd2F/qZMi0C5AxONHjmNsmO8v9VCW5S8+6
	FWKCW+TL/FUpS48IRboXZBj7g3wEYJqdKOV9VyDTop8yYw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qaj6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990c957f129so184634241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501683; x=1793106483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=h70d6fWe3663Tlp3vn5QMkwzVNZFJt35kI2ZyCXpUTp33JXfVU7EzDfJyzHwEXVSlL
         4dIMJbYn9SkI6SKFhL0pqHfoQJZe5vqPcZpIoLkDZacYY3ISAB/nlREMNg+4y0GPK7Ut
         g4vYXg09xr13x4LKC2v2zCgrNwxet1lwY+hQM9u3o+RQ4jPfXr/aGimCC1tNtXJ8QnJt
         gESiCgHRF2yQz1pL2P1mFbMAQRQ6XB2L/ZnVsf5pTvP/UJe4rhyJ8kkpkg4qMh1mEbb8
         g+dsbQEkoG+t/xVqofRphZL213Am12xE96SfCO6pUA8BMhqYfH9r6AQLnLCv9s3IpR0v
         lZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501683; x=1793106483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=U0+ORhu2qUjceOgItNaTQBvKmW5GmqLLRUUAwwrUyaCvTWIqWCgwjmlWJQAZuZMoSz
         lS+lULxF3t/8O+VW+RymyUueLa7JQKNDVNgY9WBphbwnxTUk5Z59s++QeFiTSeUfaAsj
         lXELcfMBCgoWR1EYNqUPlxp/y2q/jhEWZf2vhHRZazCSTS3wJmYIWu1C2vpHv1SC9EWP
         V33RJBCJ3H/jIgw9D4fjLUvyWyS96rFha/Z8l3ZSDDT263WmEeoNRImb896ntGTMIIs2
         KraG0xC6so4EH8uZCFUDqXw8x+qWnySsPOwXygrNnEj2tBFEQ1UNuvqlR1b7yTfmaMrg
         LnDg==
X-Forwarded-Encrypted: i=1; AKwUvBzocY3Loor1xmKRqG9vEG1SSlD8v2NYXXovLjPSF7hfXpV33o2eqNANrEU7KXVmtusaondjLSnDOo8l0Aap@vger.kernel.org
X-Gm-Message-State: AFq9FYKmY+3DuuI78jYbMhE0oH/QI6zz4/Q/fMXmkb84vJjtAfixdszw
	ZyLZsedcB9u3Cb6YW/GU/O+FuaX1Nfi9iC0voyWVUUmtj8bf5JbJ3suKoPjFmVO7uggBJszEMOq
	trDZx6lUfJn4A1wxL7zVlNXP2X90SYLKty+nj/o74iwUy1pC/681fcsLHlSmu/29HEsnW
X-Gm-Gg: AYBFou2XgLkA7oo3j3pVa5unKB3gMmdesE0M5MlDSxfM5vwE/iD/hWI4tK+UQFPM2Dt
	ljpkZN0cqM7nKuq3uALUYeErsSfs+5DRXLU1GKhL0fk/0k4+2j4mopZ1vFk5hTUEmFpZ3wLVPjU
	RxHwRgpt1cngh5uRrweXCsYqb2u56edMDvXO9kyGUemImCfeuJNJmHR8DB4UIN07WQ9DKpG7f1n
	y6t+kLUtA481c9EjAiCFuI0kw2vb1RYfzUYP/UywukkfYQ1ZVpnk6Caevh5NF/pViLfanc7tDaa
	Fwzz2RXcNy6U+gQE1rkQQUVBtpcixhZ25v+tzwbqF4pgQWBtW+a+93iyZ0YqI4xonQqAPmRyjkO
	yo9xlK20qGBRG7QPy
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360513137.25.1792501682561;
        Tue, 20 Oct 2026 06:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360506137.25.1792501681954;
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm65693245e9.5.2026.10.20.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8150: Set active-only tags for
 CPU interconnects
Message-ID: <6ydb5v5dpryywosyjbovdzedywpdpdyc3lmeea6j52hpp7b2ai@l53sdm6i3emj>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: z_jW3S2yKadTvJ9XsFRfa7njw7yokVCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX8pPpnxgrDFJ7
 gqx0OoR1RH4jcQm5SUJDSIGMkcqVBzGUphOWplgNDG+qdwRe/1wtwMi817OXBn5rQQv4FNO1wGq
 VtqOtEC6kiPinj8vvRi3pWWCh0MoALQfgLP9/hbKL70GF55nYerViJAU99cGgqwqB2a5XJk+H1u
 B+ZPZIolTEIsBghFbG+0JhtKdKZlRu/REf+Hc1JN/ejOa9oJpSCv8HEza0hCu1EN9WHNv7lMvRl
 zCLdV9hyGp5+jmh4WstRWp3Tvi4acc2eTnE4ljPZFzc+/7Ca6nneH446tkXg58xOXVi+iqjF1e4
 Was4S3X2tHMKGEWnGs2nFql6Da7GCfxoLLYmBTUOPHRxdIx6pHQU+aNenHRYxDcIYS8i1CCQRkG
 LB2lv7wAbzyC/lDv9eNALwys9ZMnVdCikTwFh6jhJYvJX/WeEfLrX4V9JTzf1EHuasgzzqVR5ob
 yFpP4RFI5ZmfMqemLgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX368fg4Pxy12P
 j/oT+b+POv3iFYul33AWUucfu1FuydoctQw0KLtPa8Hrozt4o5Ha1ln+VcOdsfkN1WfToKDj02e
 2gUy1/sIIeWzwKrLmr8/oPaZZRruDw4=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad767b3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: z_jW3S2yKadTvJ9XsFRfa7njw7yokVCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 14:42:10, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 2b6187abafea ("arm64: dts: qcom: sm8150: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
