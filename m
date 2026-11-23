Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445252;
	b=v0masv7pEj8LIBcz8h3HFkKqPDiX9+dw0jzA7Y5kjX3a3C9XT4OLRespXvOjLeGyoSrN
	 sTqLHDcO4IzyHj9u0a+KP9Vt4Pc9okgww8HZJUhhFFRYCGAB0LeOFaVPBq96XhxUZT3be
	 1foaV7F3YCDUXWPwpY3RqF+y6G/oddufqhARIQIBN83IQT4FYhYO5TQugVy9kvdsyxp+y
	 62Oz1AnuE44Ggo3MWdEfLvbrYIwHdBz/MlM8/hZyclRxQSgmTm+Hy9Gp3Y44UaTxPfUB0
	 MlRTyOgRfejoKquoJf2W52DG8KfkNw2v3oYoRTSDlI+utNyFGDAl7oBegw65NyTmuiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
	b=B7tOCQXVwKMpcfzDaXmeBycMDvsS5rD1xjM3fAE+NmVJvjpX2xDmDYCzMnZ5AqLiMYCL
	 2mhHMR1gSPyTJt7FA6n48Xkn81U0HYBrfmjrFN2Pf5ispcgLq0hwfEaHmkw+i4gRWMXoa
	 xqc/dpC3Q1Nf58SYivDBHM13C41ksODcar0dscntvMU7UBEFZDeXkweuvOjXDBf08FciN
	 /ye4f1kXMwqyHdASidjmiprxMQfLtkoyqKizvpghI3nU9U61kSOKCxZC1t4LEO7ZmTAwi
	 k8cRgyQk1D/bjt593lxa9WGlKolnnjMqpCUH17FYK2V1aquLzm0R9dfWb4wHU8vDkYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uQ6ZNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ev6Cw/YF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792A606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6792A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uQ6ZNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ev6Cw/YF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKpQL2368956
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=; b=Y5uQ6ZNqVWEGZAUD
	fBEdZMEPau0S+JKacBYxxtvh0lWylRKSDwHQRYXlzqd/5CIEKhwefILUlIA+thX6
	LNBPyrtWv+VCF8WmGWWCGGm6672MeD9jHgKsHzmynk5D6vxm12bsMSL6W1QLc3Yu
	JLgidqczHYPrcYRQMZBRsj9Oyz6iE+CK/jD7/+3z2MKem/l262lImEyGMJT1AeY3
	8hHfPaUOkKnzAXS2orpiwxfYjUIDi24IT6WPLOx5BYkBkvnAyLXZ8qqCg8huE34Z
	B//fsa/vmn/9ed6EbSUodmPe8/SqHklnLoEfRaMzgvNggR0nvEjDB2YuvzHMjj9m
	GlNGQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9ujk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b46af583b5so364406a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445251; x=1796050051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
        b=Ev6Cw/YF7FGhVrNMU420Xz1goM4cemU3XlNypvGI3Gje8cz9MzCjAQ1oHrCUxKvV9I
         t98hZKgSTwbI1y3z/P5A1NEibPviKFlq0N0psgthKT/xEo+48cpa78JsG/CfWvBEEZxs
         OKHfMulYX3gbWHJjU3jLxDSnG1a6dK2Dl1UIAf6VHzwYDKvXH6YWsTotE/wGEisKgINA
         kbAahHicMssnYLW2EZzvgNFGeEnzKqkX8LWZVsRIlzlSkIm50omfOCoRBbajzlPVazYN
         omsMdVNp9UByVsGAYxp9qy14/17k/Q5C4GusiuDNaq4ZAcCoGz4DxToTWdqC7TkD1PMn
         /d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445251; x=1796050051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
        b=bd1fdzGk/BmBhl9XyMdK04Coma64c5LIGZ0W0FJsVHXXbzQPaV9OzGyovDqJl455f7
         iylgtOuU2qAVRsbDFEEf4XUiKb3Y+G268sgN9WTdFwenteUa+xyUN4wlPZV7QlBfGuSM
         0OpRClfNkPEV4Cdh7E5mDihYrjcOwDrng47Rh/aaVbCdTXxZr5L1+BMdeSecErMk47yR
         4Lt3Sy41WSgi/MZKuU/QmIupiBk3r6tD2NhvD74g/H1AJq7o0pv1LGMg9u5AFx4LyYrT
         gDGN2MDBF8e1hFlmV90sulJuAY7JwgV8lmbH+tEprGffrx4Ki2rugbQC3mur/xPQKI4I
         IXSQ==
X-Gm-Message-State: APuU4Z/61QQIdrRLe80iApfZufEnUSZ2alGaGIkGS2Jyc4QMBM7E995l
	FM2HKvPS1XBZrWu8IZv1KyfPJyNSRGVLcZ/itaquh00r1HWXWlOA1jnHpKSApSbuX71KDO/DNYQ
	3mVbW3KQeWintHAsVi6JHue8wnawNYXh9NFR7+COSCBNP/usNbmNbLKju/r07PX7P5hlH
X-Gm-Gg: AZFdTZcVPg8dHOChibRPreHxd7glFhbxYVA0n8Ub/905ZcG+DSG4W/+Ph06Y9/+ShWp
	eTHa4Gl0mXh1JdMOwnB20t8zLXyvmpoI08n2bjyjM1YOY8ig9YqE65VfVP6jrkMaI8dNY5NFq0c
	1Bvg3EjpXqaOVe7AXdHBAz34Tc2aSqfo6BEiRyZh8Y5Ok86OdqrctNFfMcmPR9jow6mY+znv9Zq
	bBSTBMgr8xgdCda0pO8pLZRAmJyiKudH5E1Z8/SuPTc5m+Wr5aSNebi5+sXBEx2cwT+hjKfjzIS
	Z9kRLeO+8Uuv4K4TiQn43l5PIQFnSLulyO+4IdAJccJZi7USGjNCwVlQAo6Wxm/7EPAG8traMo9
	xQ4ZFjr+rsDJR5Nzuw/NCYdNg22BxbFITwFav5oXGYBAvnU5PGyjewwNBiXXOdbJ/YZV7bG4=
X-Received: by 2002:a17:90b:4b05:b0:3b4:33a:4cf6 with SMTP id 98e67ed59e1d1-3b41c908fafmr17090992a91.4.1795445250727;
        Mon, 23 Nov 2026 06:47:30 -0800 (PST)
X-Received: by 2002:a17:90b:4b05:b0:3b4:33a:4cf6 with SMTP id 98e67ed59e1d1-3b41c908fafmr17090947a91.4.1795445250058;
        Mon, 23 Nov 2026 06:47:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm435068166b.4.2026.11.23.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:29 -0800 (PST)
Message-ID: <7cebe4b7-773a-422a-9391-58dc3848fa28@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:27 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: Drop redundant ARM and ARM64 dependency
 on IPQ_GCC_5018
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXwo7Y6q8qNvQ1
 IgyvQfe3ef214JQAJyaqFE14m/JLwnt24CHYz37p6CFsLN1GCz3HGDbJMfOPnUbQvuefvLxIadV
 rwvBj3Wlm71SRzR2eAXREOppa0lNk2vscO62c8LsuuxFcT/no5dDk1+GB8nlIqtOa+X2ExD+7uY
 eH7YUC+J+mElaBzIU8JnpP3JxLF+MDVntKo/XhMU5rd/zYaMDok/9KAFk0kg+AbQ1a0EhlBkatS
 AuYpkIIDaIGzwo7u4OpMYmH6/XYO89+DQHTWdb3ewHLj12rxw42HSx3/MJo0QY97lETwS503kpn
 IoaNEqt6AHot1HBG+V17uxB5uGujofSzS1UvRNxu+tLO7aG/xk4CjYqptOhHaJo1JpWWroynT5q
 rjPzw0Jx+d9sdBa4tEshLuFvwmY1RmSFOXNQZbEYj/BXemORicKsxZjsijUwNFbJR1RVoxxXX0x
 fhPZtfWl2pp3cwEaC1g==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045203 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_3eSVg-FmVzFu8mZ-a4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: KU4bXFSJ0WLKxLN5pLWm7cgcP2g0WmTp
X-Proofpoint-ORIG-GUID: KU4bXFSJ0WLKxLN5pLWm7cgcP2g0WmTp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX1IaBQdROWT4Z
 cmmlm1y3lTMxHn0pCyF+FjXHN9OBg6Gx6y4x7b/JXZ8K7VMMgtgzrwz5Nr+2ue9R6fCkiCxi6EG
 n2WNDMcOl1N/gmXxui6oM5hqZtsrUkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> All Qualcomm clock controller CONFIG entries depend on ARCH_QCOM which
> is ARM and ARM64 platform, thus additional depends for IPQ5018 is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
