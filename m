Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498384;
	b=cQO5dC7yVVqPBDT3oeZ9qggRIPlPFNJfKPmGYbxU8pPuVJqg55RyhlmI3wPoA2ljSYnf
	 8qquRcy8IDTna/4Sb5atdOTWN2tr+vZ+Tf3bwJQ72yX1WnwA63WYwO0B0b0ZeHfWbQx73
	 SG5CN36XkUxhC2rPB1NCiS+EoL8VheDoXkr6+y9UgbOnKb+T7PgMbhJLvNlPNmlMNDX7U
	 OSSfDICM/MNZVflc0soT4eK2ynvZEW+jI6gjVkIGYbf5IgNfze+o3mBdVGMfQzzRVjxhO
	 sufDGqrZrqGEvT4NwLdO7zjUuh1wBKldS7ZaGZCyHwQGGFpceuuK0yDDEMj7nau9wtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
	b=1aWoe4P+6MrVuVs5MUJl2dobsOIlbuChnIPre5ebT0F1O12vxnvaaJBmFY7miW7jJfZe
	 JgkUqxpRa65Ey7acmijpyGgTQgayqsEp6sSewEYmKb6quMYNJSPgb8pwodyzN36cqR/Wi
	 Y/iBFwm6Kz++lhYf0wP5lSa0fxj/guNFPOn3c+xf9Evw1HjJy9mxeb+AFrwE8GpLMAcNv
	 +mp+T0NjHeCxkyZdqzrvTWDiU4TUDxI6IfOZpJ1IHVLoL1L9KEM+jt+q4WvJdCU1ThkyV
	 eT48FVlH2QFAkr1WEZsw7HE3nnegqe0tdLpJvJNd5OOjFnIkfhbzy/saVFVFQZnMJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF2606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADF2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYWZGR6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLmXifFA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxKZi1145596
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=; b=nlYWZGR6bF4T/Kbn
	yyjan0QGcs6p2vpw6wh0H5ajn4DHki0Fg32MYd2pWRuXS72/Cv1qMHz3DZpWxjOC
	leT03jaeUUQFAUL7iYmXUsj8IrhB8O0Q6/ZY+nF9Dueechv/QTHTeIKtNw/fZssD
	gT29WqPWFuDNdW4yyeKOdFU68Mxg+2um8VeYi9mOQGCrhUMenb4uX3He2BXwBPvO
	jczupB0aTzAP45l1LmQkWu+Hyz1rULlk+MfETpRs0m4lulLNj6rn8pVkPJ4/7WeH
	VeYsWJ3x56BgZKZu7QOaXTvGxXKoJgW0cwpxfQNA3wa4yMTETkqg97V4LkimnHP2
	huUeqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qac0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:13:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso71466685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498382; x=1793103182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=RLmXifFAg4qnhvK9FAhtheyi8hr+AI4BeWZXF2aaBCq9/71ftjK6+b1JQUK74hhRCt
         DKsZjewjvsKnuZz1v9HeWB5NG5vbAdZkHK5YvAYsU0pI9koijhprjLm1V9WFLmxyugQP
         sgTcf+EJ09SKTJR7LLqBpexE4gjQ5AW4pkwi1HJ13uHXUlI1N9lvtNKD/qZCOafKMqYi
         ouGaWMlQic05Q6YbrwfqrkF5hkT39hRVYmKq+/OTBl0BCGWg3Zon1Up9ON3vYs+n05mW
         VIb3ZQenql4u604EqlErvsbYXzW3emIXQpAT17Ev0dSlisQj+euIh292lpFKWRGkTkzC
         3OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498382; x=1793103182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=marfXXsbgu5torGG2Tfm7m7T6gJaUV9y274JBymp8SA=;
        b=tvWS6gxZcYTU/WRzPdeUjQndQVI+BI33xS0QkRfP+N/qLObx3dWPHu0/nj0kQiLHWc
         2vdKCGZFeFn5MOsvB7gv5Lhd+9dao7nDfe70Wo7QjY+zDFR9g1jkdPVK/3cVQAafyQWj
         GORsqelsW11C3sGQXcx9bMXiHMrVg99VuA6JNPsyaOdemv5d2O04/3JdTtg27pEy1iWH
         LBp0kdnyVpkgxxwqzvxlvA3Gi1MCJ8W/EF3koZTvPPTldMGEtXAZ66/JhMioiIA573Oh
         8/Pr179YSFu8kzez2hRki4FqC5iyWknK4Q/yZadoQB4TgIDf9kwZi2/LSBV4d39dGCY0
         1AxA==
X-Forwarded-Encrypted: i=1; AKwUvBygJ5knE4iZGH4cR+Jn73/hNwpC0xyTZDNTUUG2Pu9GQRiKiCaytwrRUSxIzq9quQTCmAhLwimrXs1FkGTt@vger.kernel.org
X-Gm-Message-State: AFq9FYJ114Sot04DAc46AwVJlHDjNRZatB02ngk/2Kjg5KMaMh7lebrt
	SYcyES3bMBcOBr5v9vcfSievpqPvu4Qjvo96q3VbQh9lwZt68oFp+gN9tVvT5w5thqTmhy3P4AC
	hHqSmq+oWfQEA1o6HxSeEyxPF+VKu8B9tdyYmqJk5DMXdHWYJSoWEyOlMROkb1cAH1He7
X-Gm-Gg: AYBFou2Vf9mvsE2tdlQIU9W8kOQlZejd2BjYelY0UoARP1skfcjRQg4ZQpnzN7b4cph
	Yt2bROsjh7zBnL/SG7xOJbFwvwtZWXQSX3Mm8zgYaxzqTt0QyP9oARyBV3DOw7JQ701qEB0fyqO
	1cghZQrhMOv1ceDyP5uwaWvwmBsGggvsrPA9Q3Un2UG+42wNpWkZvbtTvYtmD61j83k7wD2hs99
	HzJ/hfY3wqbTsWyM6fp8XzteYraQI29Lc7G2mdrjxpbLSw1/ZvJmt2yBQxyiADfYBDMKAnK1d/5
	vkw5FiIBM4Oc3zuG/hvm4ysdKWsnqbQNPwYbgVQU2qDPedRpZCW8EIeXYPMNofurzsmeEOblQxn
	70wspxHL7IE5pobO4IauBPw==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031674785a.2.1792498381997;
        Tue, 20 Oct 2026 05:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr2031668885a.2.1792498381498;
        Tue, 20 Oct 2026 05:13:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:13:00 -0700 (PDT)
Message-ID: <6257f715-265b-4a33-bf44-5f5c5449f046@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:59 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 19p-edM_OBofKK40Tl_MyMAVIPhv1ebu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX8jciLczfoOn1
 RBgDNpKba9NUOOV8Co2XKk4AG5FB9XBM66FYPLZYHBwOu74kh6UakK3lBelpdSORE6Zglmpfejx
 dHQKF5EXKsCL1ytd6uWC5n+MEoUcGBOvu0H8RetuGdtH2lB1jDp2d1khQQpPddRgzH99XgtE8ge
 IN/BGdRV4acvQg98nuCgG669euxY7tt9FWUW5T5KLZXtCgsWk5bIhsLgSQSCIvm1a3C2+qTTslF
 2RgQ0r8h+A+W3FOe14aklHx0AhX6JskcTSGaAbTge6RRy9HK3STEn81/MaLePZ3IGe5KAeVe47E
 JMWKthTGTrdModujt7qKS5yv5AZG3jSkLYwF275XNQ+kxpd7HKIZYWUthwM594uyrJkblFU4BA6
 vpymvx4jFb6iRq4eY7CdOhPo0TDTzBwqgc7XhzYX2bGMFWtSKGAZ8MGHsxLNnJjapYiJJFBMPEe
 uu/ENB2kASfF2bsAK5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX2MMlUSl5zpPq
 e/3MnoM23QIp3rmpT9CbilXM2okjIEUPiNKewQpK0FBEzM0ssPTXwjjuDYakwfDRDLqpThFRE2A
 orLKn8EOL6tayARbVetsr8pAejd0Sv0=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad75ace cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fHRsoPW1gXWW0LuZJBkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 19p-edM_OBofKK40Tl_MyMAVIPhv1ebu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

There's no reason for this commit to be separate but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
