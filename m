Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303606;
	b=W0xhDDt/ID9255TfgTaxnEiLSRXeLWMCx+tkaFlOkzpIBCxQJPKK26UTQXJxnSGPd4MZ
	 nJBeEj8wYdyzfTAqY6UtzQpduYDKw848BCgqEySjyWuZouEtbO1eMmXyBT0Rs9RMhBkqw
	 2tguOeILnjsqhrtE0vaH/kJeMJiNL0xjsmtyvx/EE1/5IHpB485MpJmfVRYYwpSisxvaC
	 5z7dmWnkPb3IFEvhfNcpTcqxUW1USTZuZYDId/cMCTEqWWG+GLyL9ghEtemBGGIpQnKVT
	 77NznVmCJcZqpyuaHDFA9u8tE8jjCkLcDiqKyyciAUTVGDmFT+xoazadbvQGuBnZvLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
	b=WbCi7QtfBXl8Eig6Z2PvHPGq3LwyH3udB/OKYDBouDfaSNBV9sP3vgl+bhbvKvxF6BHI
	 o9O6m9t6xgV8zTA+DASJqYwIibTbXrNv2eBPV355hKURMSuzmIXujz4xg4oZ1jwPp5ZIu
	 j4HHBwzTsWzFc/SX0udeRmg7xOsl7Rr8UUlx6qBnn9RZR71wPtF3/fnfV9DicyQYY0Rmz
	 9+qLm8Lgr32kAqi/U3Jb3qASlBL9D/abtMuvCu+z6c0vIlfyTXtmJT08IhthNOCLJMnDV
	 oLCCZFhFR9czePZBwcwdNJCeq/QoAztYluVJDmxTUa+oY5cPT5k2izaqKroEgLzOc/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n34dV9sR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BA7K7rFQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CD606F978
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65CD606F978
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n34dV9sR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BA7K7rFQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8msi22888653
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y7bkcxYY1gBkDRHqiDcxBJm6
	m3c0cx4HJ2rva7mAxEY=; b=n34dV9sR7yaBOmNYnZyPb+PNUxzdVHxYNu1sctjY
	DkiQR+rFEmIQZ+y2vsNnX6hca7rAODfb+cQWCkZrqe6CzMVfYNzzDKeCUvYo5oO+
	nhs2JX4ITljFgx+tICJo0N1hVxnToYHfluOQW26Qe/RnV3IGxlYeqmXPoxeJa0e0
	yi/3ypalME67O09T4E7LGupXYf/fs3OrJLHNZ4ewTtFH8XJiqCy0IqjKeDvARjDX
	4feCch7Yg5KeevMTrKndc2YGHrvJijlv42Fg0Zkk2qTqA6tkfWQQcaGTeSHBY+uS
	xsOLtm0BSostCSKR18yA0L1lXC92oxYwS42I6cidzrwd7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cr6tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:40:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso288572485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303604; x=1794908404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
        b=BA7K7rFQ+JoVmlyr6TRw9pfS4UpjQKYY6fQubJzMC3YQgWEa6nEi03WxsnlgCEv0xp
         uabidMcK2Dz0NkhfHa5uTMI/NJYgQ0K8QIQbef8NAG19YKg1ki+eyfXmrWnCol3kK8jl
         RkeOPPsgLpj/GpokFCSEgakWTp9PU0t7WXUowxZ23OgeXTqv1V7Vi0TYiV691x6J1qiG
         CmomTFP1yi9q9qqO9iPCgE0bWgA+YLbyacW902kP//BqYLjidHGg/jYi9Si0z4hCWb1K
         +PW5b6v2sYUirxbuDDVqAn9d+BoylkQr7F5XGghnrKlAW/HVIBN6dJyyGauYxLVUTnPx
         nHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303604; x=1794908404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
        b=E+D7RKdsjGYDJCFQs1D1fdKYxLImDRKpiU3fcUjnJvAKh5yGn0vAB14CMCVR4VRKrW
         ww/hP2vo9Wa6BiFWF7g3wNF0UwRHYJj8zLAyEDDULNd/zQ93kZW5YBtx7ylGZ+Fx3XT4
         4qdX2lmrvj2Ng+HE8gMiIzYEGKRFEPAfp6b/y3WA6xwIHTJxrQF4OA2EY+FjwThMdPlB
         xwFdTPb7i71cslHk+dt5zI2x8URig5TrS17anvVhThxB42nMYppso/nxqUxPmgRPGvG5
         xATFqDY3vkZAh15cqXdNyrAZbZMgODhEVSmLcDTz2XU6/DwhbQPrOGK0IbUNIdq71L0m
         oGlg==
X-Forwarded-Encrypted: i=1; AL+hErFh9wTkufTDTTpZEcpdTmSK5nPeM2LQCHoYUZkREjvNxaaUxcbS96vKYiLMBJxYVNyoCwYJF2VAFalV5+54@vger.kernel.org
X-Gm-Message-State: APuU4Z9FFe0KdUIjtxWc0yUEoYn/uSvcWfb0wCf2S2Vsw/H+iaDZFWo1
	mrbizyBKB1mBNqd985poyF5QwyGHR8xzXn3RXQh8GUM7OrNYJ7rX3Ypggu8oIKZI74nWicwUAX9
	y4xDSJtaWznv7kjKrczdmpTPGrDinBL9OByE4bA5E7/SVHvwRUNNYzVCFzjHgrZwd9hZTzniS6W
	/m
X-Gm-Gg: AYBFou173Fj6El+/IDNCsTKzvsbg+HuN9fETJhh7z4pjVk2x6m93gdwYCEqd+Kvl3Qr
	DbZn8pV05UkBaKivUEhBQHmMAh3kvvRRmajnNetQpTsP0yar3fijaxvGUjXp3MIF8h1NE6NiciY
	Ipzx4yY8xpro2kwUErhNRYqlW5jPa8g/xwQp7smx95CPM93HqTtn47hxFj2/MiVrCedeNDN6ynT
	5lAHzci6nazPep300iw+HP5Q+bjKWSewX5rlhUPrjIpYLiE1Euknb2oCmVLUx1z+whsgJifcQAm
	slaBcSOmmbXhWbsxCPFCfP58yW9vkqBCKgpvEpVebZ2bRfZ7vj0aF1vkmrMCiiDWEYQ02rkWSvB
	Zo3KpKrfKNIVLkXDvZLSaBz7AaL0vovs1rb0TcWxHdVGm1Njsx2GdKSzTpFp+AB3Z
X-Received: by 2002:a05:620a:1792:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-9479f4084c1mr331193585a.68.1794303603614;
        Tue, 10 Nov 2026 01:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:1792:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-9479f4084c1mr331187785a.68.1794303602432;
        Tue, 10 Nov 2026 01:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm3991165f8f.9.2026.11.10.01.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:40:01 -0800 (PST)
Date: Tue, 10 Nov 2026 11:40:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add SM8350 camera clock controller
 driver
Message-ID: <xypphmxc7hgjfp6ci76lwjkeu6u65vzzniehwujfa2ticldvkd@outkepympoli>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-4-vz@kernel.org>
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
In-Reply-To: <20261107173621.3538964-4-vz@kernel.org>
X-Proofpoint-ORIG-GUID: llBP4wiXVhnGG9TjPu098wB_f9_GQ9cJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX8qga08rIdZ7d
 1cjOhQFUvThMHjDplIjHfknANxKWMNbZG96M5/YPVnQiiAGx8Mb27F3mH1xUnE18jMUdz/NypLp
 Ns+oqzJ2FeGaOlqme0V5vxD9xNB817Y=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af2e674 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M3dMwcLLegYjQ9TkI8IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: llBP4wiXVhnGG9TjPu098wB_f9_GQ9cJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX1s1RlKBsmaNT
 g3mBXaRXdHjrOE7uAXFVf54ksnFyduQ7f1YsvNxt2JT4+700Dl0lihQMUkcXtQy7xzDc2qejsNt
 9st4fZizzF5CejgCysB8CPIpZLrKw1ggsBYebF97SSdHztSRADHOaiNWx8US/f7DkJtjSfF/75N
 FjoxTKuq7Htau1MuOwHBV26bDasoJ/a6kohN5Klm36c+q7PmyN864O804JuE9c6//DTxTBF5VYP
 f8w6Q35jYiJVfxqjT6Py9/IkQr7zFTad+bhQZ4EPr8zo4G206XHmLFv/hFKVopIJ9znJA8fuzhO
 +fQXbDet4HbYOu63tFRX2Hypvux3Q6+eNCYIVgQcPc8a5jgwrLkbMcyjWC7yRNfMupYCDEa9sRt
 ihXLZgzw5Z4UlHPiZT8Ca+z1vgFYKljFz90AqJjHkdi91eb4CQNnR6y7MqzDp0JH8Rm4r9zCkYr
 DaQMY4qCV+ayR+1Q4Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100038

On 26-11-07 19:36:20, Vladimir Zapolskiy wrote:
> Add a driver for the camera clock controller on Qualcomm SM8350 SoC.
> 
> The clock controller has six Lucid 5LPE PLLs and one Zonda 5LPE PLL,
> clock and GDSC data is taken from the downstream Qualcomm msm-5.4
> kernel.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
