Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483389;
	b=x+El0ho90uxjtJL5ALkrlgDc3aaYgV7MJBrI8pVxVjmELCsDXDJgntnBbat2zkhwXH5q
	 5wyk0IOk+ygKyiEeEB579PT28GDfs/BacFDzVEYRsOqIDDHIRZUYmFKO7A8srUekC0nmW
	 uc3H5qMngX69ufrXB16s7NfhLdiD/89Y6CdHufQz0/tBozkVItqOI8cbIcGBEENDPEcYi
	 P2msCH/Srx4HFinxnSJ9QJf68khx+t835JsTxJ0pu4vyDFyMcNrtedmAga2t0DAjA+Q3f
	 p/dsqvKwl+HHAMhUcVxZwCA9CE4HmpTd3x17AhY5bumNcdTBZoMu31Lt1Id3PlyAFHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
	b=BE7vD/whYjuDNGiyvADNkrw1Tgv+RWo2RXcKyHcXpQc9MlmkkZA01m4AR6qna1CnV6ma
	 fAwIM/ISB72jobVT5zila2Dy5JjFz7S/I0VYi5RWj4qykxzQHoej1ivd8D6Fd+kt9e8Wf
	 yq6gTLzMg3ZrzWwxWssy2vJYRoWyccQwF7k0loctDS4Xbu0pdOBVi5Xx/n1A9iYaxlBYz
	 8CBzhPH5ZU/4oCNU8ofVdbvV1hPMhQ5R9d6D7cG9aDqXEdajpHS6NYC0pI07Z64MGyFcH
	 OMtnEF60fUtskjT7mG9ZJp5B2lfcoOYmsH22QgUu1RMYydtpjhRcbzB2JrvTo2VsF8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C4606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFBkj2961726
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j1mbjZFdOfU1TKJ9RHIWtlOD
	dzpuDSIVrKfpxo914T4=; b=nkI+6PchAxge0VXtleC8xeqjg/F9Te5QKC8yTT4y
	WrzwjzrXcoUIiwnv/nEa+GuwT4Q2AdiYh11Hwziw9FdcfTDOo+8p722PZyqoG2EA
	/OWFNhYGWHrzCpto+9qyrSquHbyhGlYkuDeKl3X52KzzDwMThiFyJ1AKMjFO3jSY
	lfgalAMX4PbQruqT0KfvN6bVsxrNyO3X6FvWhu5ZmBRZ9xNNK4ksnFV7nin7ELXr
	Uptjd1vTA8du/mHECAmZFyklwRpsFRdAk8YdZD789hEeYSPvodPm0lIwK/shKpW5
	L4NF87JwOi1zSch5tu7cJA2h78gMVIc8nDgaNHvKs0xdQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dua4fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c920517b3so30917946d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483388; x=1794088188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=MKf56zz8SX9uS8xmkg7JfxvafTZkHTj13emxxlmk8SnLnWW0b9Q9v0apVZRUb83O+m
         ecUTQjtT8jQK15yakHlVcwosCR5pHgYCEOY8i7b1IwensqTIy70INUgM/BBnPRLy1K3J
         pyyNmgmy08QqDsouwpWfdPpR/GfXogVR2r+C0yXm4+fizij4Qm1HbRyaF+1XIE20w6tN
         KsMimH3BCrkNsAutKC3gi3hnuzgZwIEbWL8GCA/dvJZuIrOVYBDLZWn8GRlfoqKeHOIY
         S7eou/TG5Mvr/iNsjYmg33M4TPrZSHGJU4Kdh+ez4YJQK9tycWvF+z363I6ZJfvb+FNF
         QcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483388; x=1794088188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=BvX90pWCFWgEXzPUkKb9OUymb5LY35jCXxSooX8zGXAOmh9x76OY64Y910BsRF0JUY
         A2Ls0GS+Z8isV+FlAVIjtLIKVfEzS0aKa+YG5tbXSC0JDJfSbQe6ITYiKs9S8C+FJqMQ
         CRLT1LUM0CoNlPQdT+A9mn8+0/6oerFOuoAmyB7CEflNUgkb7aILjWKi9hEMyWNkKGzr
         ScdWJzjdJsHpyeBNSnoZm1A5X1hYff3HFYDnaJ/X5N36Cz3Vx1wfoMNVHG947D4Ot4SK
         Ll5Cm59gPnl2MhbcfUaMVKcOCK4nfjEIZAeZsRu1PkXx23uSQAXCvlbbBFFqkWlJfXVS
         SK5w==
X-Forwarded-Encrypted: i=1; AKwUvBwQjsYg5wPKr4g9sq1/8UETszszdMUxwccFNc3az6x2M5fKlgNaiMYsi/VSch3J4QHZ60wZ1juN4dPfat8d@vger.kernel.org
X-Gm-Message-State: AFq9FYLoMG6ROgUnKMXYG7ENqUzjSMx9QOhGSXswfYqC+vxOwup9n4DW
	hrCtueT9UpJSY/+qfXOzXdOdF6BbU5elWnrQU7JFjuunZtsgQcNSWZ5X32WzJjocjI7+YvHgT2d
	kqBefjJc6yQbIMEaxTayUwurtAOV6PCLLFqvIBjmdyPsCTaTNjlhONOaP59BpQHuguHfi
X-Gm-Gg: AYBFou3oFDsceknKXUDzuTfnvD6pI6kkkzBkihQijdcFfzo7sSek5LvB3Rs2H4vt7yR
	VDW19p3Fh8vxnb2EAHxlV1IQ9V15bbquAK7EGt2Pu+hq2A9H+qrdTDvXYC3Q5zkpq88qhdGFTqo
	e6Wx5y41fg/wt5CmZjqheSRVy6Vi8U7Q1dIT325+Tvtemb0d4LiuZnvgIX/M4mdvHiavS3RnzIm
	AIgoGiHjSha1Z63RmRvxHdonDyBff8YcYiYT5pLeSxX01/W7BqBURpP+Rx+KVYdK5T5eGmNoj0D
	UHPp6MPEk3eIjR0s1VZDzGcnjbk+oOhAGd+DIXIX4adpwQsRz2y54KllnLiJGxUQzSKrhPPUcGT
	gNNGwFgKBNfw3+T7gC4PqF8KwAfeDJLn7tsVkxyv3eRLU1MGk751Py9O6T8uAj9rb1BzBgJHz7Q
	PWyfau/E9j9dXs/FeZw5tCyOITcAv3fFv6IdQEZ1pIibD0eOhQoIxtH6oeuT0CDQ==
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105508176d6.9.1793483387613;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105507946d6.9.1793483387153;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf2b872sm11304101fa.35.2026.10.31.14.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:49:45 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
Message-ID: <i4gd4zqtjyb3a5my2gy5p5ura7xsu6bqbheigmclhgxkeitvru@y6xlqkmftjjq>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae6627c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=r0E3B6ySCoxRs-Erq-oA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: X67Mem4EVmsxVqA5mGGB7m5ThZG_9_sb
X-Proofpoint-GUID: X67Mem4EVmsxVqA5mGGB7m5ThZG_9_sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX6GeMWRbrE4mL
 dP9dhNHBq8Fy1syrTLT0liGzWZXMzcdSqqnpwglVXoGA2x8MYnzfHGkYcWiRzLMvUPlmBSxpGIs
 GVgkh1XW0p15QAmUg5yj4EnaBBV8rjfcE3cJQrseP3L0e2eijb4NTbWxREw4wsz7ZHnS/CMB56q
 zugS7BvnV8XIg1qzSwheFgMSDKFLKZBw/ASquQnUMMHcGawEP+G+eDlnCryuL5vXTcHGDkKmiCz
 C796x/xVqAPCbzjHPX44kfLpofCzWisJnIXrkBcnMGzGqLiVkk4/GU7qnwtUPDuIUTe3Q5Nc0a+
 7cTPqSUIniVhATLXfsIDfP9glpFh9rJ9/uhx5iQSRh3Sft8B5KuSu3Mf8mTKFz4v+/M3Ai5PT72
 YZUp8nA0kWZYvgAILLhgfH5o1MNj8I6vGrIDyhCRJp261SV7QtTDprZgK8H1kyJyCo3cqnUdQnW
 3N9y3RbbKSFT4Iwo9zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX6YfPL3LpPu36
 UmYNv/08QQA6gzcl83rlbFucvoMcR38bn7g9DC0p43Pc8gk6c4cfknKuM908wKknGctjXUkycDr
 CZj5O0Ro5m9anyiIixcfoHotw02M8zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310087

On Fri, Oct 30, 2026 at 10:41:29PM +0000, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 3 ---
>  arch/arm64/boot/dts/qcom/milos.dtsi              | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
