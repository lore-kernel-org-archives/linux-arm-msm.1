Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100331;
	b=q9uAacwEzi6/Y+eiY3Stz1Zc1hevQuBhKbx+mbh+jKmoWHnBfGkfwVJ4WyBkQ0iv0I2+
	 F6DNU0UA/7BFkXETNCUcr/mphKCuj55KacF238bva5a0k3sGPsfiRv79c0qe0dAo9jeuI
	 +RPFc1bE5pvoZK0VnPkpFKD5nkIHxURyqfeyTxDkhrtGE74nyQwia8AxbalnaKZ6oZ55P
	 1EspbOb+QXAYGjqwQunt+lG350SU6WobHJdDCpXjy1HKxspBPfodyPZt+ubATJgV41kpL
	 3WxcnGDVeJ52ydVcN0Rgw5CYTOal4kLYyREWQSgrty5ybXNyy5E6av5vSUW2nXHtKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
	b=oiCh7fzgp+47XVyO40wN0F4M12V4pAEK2sGFzMcpCV+0IAL5izySVWqgrSEzzkAftt4A
	 KBooKK/CjOmMibMxSloaPph+QzOB1KnQr17+EntXd9nlCNAsakaRYcu0RGf8E/dQ9FoNu
	 itdK+hRolIVh4q9NO1Cln+WIOSTqBrZxYYxHsTtetLGcO/Nbm4ksZaWHYCQ/ynJvA15v0
	 v94qbCCfbbXKmnoUwfEV+kmL/je+EqSIYbQkKgEqam0XxjY65L0i9RmGrNYAZCNmdPYuK
	 zIeDirNf88tgH/3mck8vJxvT2s0vYKFRZZGmjXlHqj+Xo2XU/H/h6cHpv0CotJLvbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858F606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4858F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeC1B3026388
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jyhYkL/qDxUg3dans9Xl+flW
	G3nvJ4Kl35GuTAw54hE=; b=otucpBEdRZceIEHPz4JfQB8zfOptPJkPcuZRoK/8
	c3i5llXy4av1vUCXEy9RCr0Yh/BUtimx9gZOBSsSRsDosf93BZTdUK5Vr+/+0HmH
	t1uFkwc87jdXxMXwZFw36q/nc8uZjWcTltwDEQH+60a7lmRYdiSegbkn9S8nWyh3
	mjN2QM6FSy5+L3OFwKZMQ2wSm5vLORhOGUdXKVacv9so93xjI4qYgrjdR+et47Ga
	GK2DKgqhnj3/95kaR71G9OB+mh9anESWyF+a4EccMa9+1Ae1+eO2A6C9cyeDFvT3
	P9fHOnq7k9FxEyHmKgI65xiuBLVzL9AAKVTakrXW17N8mQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a741-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so381225185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100329; x=1793705129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=jzZBjmTFDTSSM/aY6yrAGRZCeNTM8/6lUk85TxZ821ZgR+S+g4HXdU4mQQpIwPiXCi
         b7sfrpSGHyx7bOjIKDVVkf5EYC6/XStjhrG/4bKw10k4RsDzNjgviA5Jq2Cy6LdCCIPE
         IDV6jkMSqAMeNuC5z4R+XV6SWoTZVfdeC45svHEXW6bao08knMRDZYxSY90mkXLuYtYX
         IRhY5WAu+w2qx9ULM9XvJJcU42y/LEPgVmNad+0/6ro5hvibTIHFg18dU19eRb2BXqOJ
         NRpTvheBoT/Rz37SWluJ7pezNgnWk8q5gl/cCZYUjCoNNW3fFEy39SjuJAHqbxrWnnrY
         3tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100329; x=1793705129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=ZtL8Iw4owY6WYpvqLlae81r2grruOofT/rDiqhtUiA3xWjnoAeGd5fNlXlHkQodv03
         XWD79nd+6VOK0Hhe48le1AFWMmaYQ5wBF23Yi0cHhzDPQLn+S6Uzm8YllRQCodivvPw5
         fx1+5dDnesxEH0Q6hkUpLCvoYupQ1oIitz+oSqtUDnFrFzxPbQJ67VmtaReWsAt4jSxN
         9UpIxBD8wgU8S+gQ2dBecTHibdc1IIr+vfHhb9wyEOAmRjC2awl1dTxLkFv8f00y3KDt
         jFVpNWMtDAvtV7rcE+DN2dCwex44Ab6FbAVJ4iTRJ3dwDdOdVVJwEbrtOVu9vfKe5OxK
         /SIA==
X-Forwarded-Encrypted: i=1; AKwUvBzjklyDKF28emMnv/9ezVH3LWtpUFQtNf36rxBsMgAl5M5FBWSRyzzeApyQIoGlNM9vdJEV3HU8redckHkf@vger.kernel.org
X-Gm-Message-State: AFq9FYKUeDOv5p6F15EcKk9Xm4vzUD4HEwYLVjBUQX6VDSLdTrcIMlKq
	lamksQZtBHjFa66qCzVxH01P6hTm+jbKSaNhak9t/15b8r1GZzayFoou/6NAnTsviBRMzmz40wU
	1NBEP86i3LBtaOCmOZ9kmNHPg1NFnd3suiJI1CDrNjagXx3K1+9+LLRE5p72iNorjG7mo
X-Gm-Gg: AYBFou056gE/wMdoxQqtyI64UmISknDZKmk61Uajoi3sBjHw66Apsdl9me9Md6s5xeZ
	dDYKwP25VLZO8BphRKuvzxdxd2MjZsI0Imu9yx/io5PrDyl2piQriNMBQgc5vBuCEJ/W6DN0376
	JPI1r6drNhAthGLNCYeEqcBeB9vKHqi55X6ydEfWbBlb0lIgYIjnsrrN/gTcdwNFT4qNxR97GtG
	c3lbYe6Lnx/xLjwW0QoHFkSYlIE2KVuGQUyHrmFgj9LWkeAfYyJXvhnJjDapFXggHHnDbbHokBZ
	xX3XICwgHuedb84AjaXw0KIDlV1aUbqph9SXfZdlg7TH6jfCtN4jbo56LHigoZUvSeWK3TEdOjv
	fZsicqIOyiMSrN30U
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405177985a.10.1793100329362;
        Tue, 27 Oct 2026 04:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405173085a.10.1793100328785;
        Tue, 27 Oct 2026 04:25:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm20012629f8f.41.2026.10.27.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:25:27 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:25:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
Message-ID: <7fa3yfrvz3neingw47vkunxh7ft7u3udofeunuel5m4f2ocqtd@lyvt3a7hozni>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
X-Proofpoint-ORIG-GUID: 5PUZc5vzEQcypm2uLVh7CGfmXmr9fJ6_
X-Proofpoint-GUID: 5PUZc5vzEQcypm2uLVh7CGfmXmr9fJ6_
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08a2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fVLzsXKNZF2toPeuA2YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX8j2wcZvSKVQs
 SC4voHy72S6rKYu2MyYMlgvyTjvDoL1t2IoYPH3L9sVDLL5DG0ku//XtPyPz1SMF/6wZB6Rb6wp
 OFcJS2gb9eJxW5OxGFeRhN/ranj1vIwz+7Q5JukwHXSi8FdSGJVdU/c7NN/CJLpF4A3GQ0L6+Sq
 /jHbjSKTIXLCJ/k81ZD8/pMaJTSKAWOMvvV3262FCZztKg2O99s7xACVXLSmNNKEE++wTEHyLCD
 zYY4daW246RPWG+7cJlj+9eYnT1Pv8x+oaedl+rbHSukVrNgWaRyelHc1DaxKtOSYjp2wnN6ytS
 LrpT8NJoJd3ZVMgwYlq69i0czs6P7X5iFpFHAWyPYzj7vBgdw+MYR2YScwMpD8f1EmJAYM/fWZp
 pbgTeNpz0gXLpUeRxohoDHEpF5ei6lbkzzdlR9WHWgqlHHHJNuxc0He3mVywgJBo/VkI6X/cVkn
 FnfHD1xtNH4vnuW1lkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6VlUB+upMP90
 WR7xiAhhs2AOawZ+PCXbWzH7+7TNrvT0lbjeag2cwdDz501SflnOK4pC22Ypav5ScAyKlFKYNMI
 lFcBHmSZFtPyjFkj/EmJaGJLKLP/mDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-26 13:08:14, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
