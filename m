Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461873;
	b=1PVFx7mUatnfQgImC4vVVc3SF3B2IURrETfBtXiOCGhSKNmZ1Kg6qj2l9p3jX3iO1AHx
	 aZksVJ4V1TrbmbMZTNKgdieCi+xNX+d8fcfm6YIWtkPleKmWvXHKJ1Y+G8T5f7JuhIgn8
	 KNb50NiGqbDbnFt0C8N+2LDvrxkv5gK91IZQYagp3x/Yf7u6SGWNfsHY6Gwh487Grq1Y7
	 3StlbTAyRLh76mRNTtUwtLcnpRI0GuFfwisoRsznpSe/oZaxGOpGXFBepeXRf5anNzw7D
	 AZcCeWYFRZh7Owi68bLNTblPhMMCP/A/bpZ5LgOIsrhF+wjuK+uq440eGmjI/AbfnLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
	b=i+tq3/EErfP2AVkIgfE9pToW40MTPxceOSzRDM2vjd6EdaW0AM75L6EKMCLv/i8gZwKj
	 k8B5mG3ukCWwWdrgSZI8w/3mw2m35+3EY7qFmfT14UESVx/Wykmvy2TVp3y2oDQjTg1qZ
	 2+OBd6PrnofiRBPIMrafnz2teHc74wD11NQja4OeO1Di2uEKliLfUwSsn5PXfwDk8U8Ju
	 M9xdTveSlhhAQl825D1NYXE14mvhaZ2gEjrBkHBYJFAASMB+E5MmlTmKejgpkoTSAlDrY
	 fYwvWmcW61f+IJQvPL5G2hZPAm/2ggbhDGyA4w0p6wAvrrYuo66RU0aDoAjVGckvSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSrvkqXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1ETkDMu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD6606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSrvkqXl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1ETkDMu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGp4p2769030
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vA8R0uS/49ozRCw0mif7wQDK
	IClLA2ZTyz78JVx+Ing=; b=kSrvkqXlPp5CBohHvqzEelQ/3MfkOygZ4Jkjxezz
	uzm6tev/oCuNoRwX6oNtqk66o4pXSm0TYGpjQPf0AyttWcyRt3H7SO3nDzBkh7TV
	04kuSBjR/NJnJylsuyUBt9aP8LH4/h0fznbnUTa3uNy5XxuMB0bq6eAPFtVl3SRP
	86N4MAx954k8rRnTcmKvgtQQessPEIKtcOL9eV0QEPKaQq7xtWKfEHXLXSjlcQ+M
	QIthPMajToZM4cXltEWvk5tpZO0oHHwGXA8Bpk9nHKy4u2DMdRTp83xllZmfhGe4
	sfPGAUwNXL9lcIm6CFHxvFVpgmVkS67DI2Nha+P0ksBOUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb26j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:24:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920ff6971a1so39574056d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461872; x=1796066672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
        b=T1ETkDMua4TeDDr+OwfzKn2PD0s140MMlAPn70J8LrI6lc6U5+iafXip4Wsn7EdJBl
         IxeJPk/DzOImsqx70h6SqG5hptfp0Cn24mtOXHxZzIhIxATzg95xfcMBJqxRxVYMs+Ha
         AxSG185+xl1FNduot7QAOkHHvLfnyIIBR6Zll/OEDV+TmtXG0CTchjS6caFzxYd5RqeB
         rB5fDJPopIHChIpyhm8+YE06a7sATGQWeTJ4J+g57PtP0HS1HsnlWoDJaHXMuEUM1O4p
         Q31JnzhA8pFo4t1KYpkMltHlo1RuQ1YOUcvssazyW93ImO7YLhyoQXetJXQjy6+S4Rct
         6S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461872; x=1796066672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
        b=vgjuqaGqteEQ6noqbM5vkgC6tqtSWwPYdYlUwySOvOs/qrVGcVfcxg3s+qBy33Llfn
         bYadCw1X5nDlxYEflFuAECyvbGK4DRW/WNOtfe4WYxQkhH4jgoiBjd8k1RPcEfY23LVm
         iQxiSax0Bhio014GfCal0Lxlgr02PSLip9VL4mxyqJqVgi6oJx3HQG2quv7OSyTngEwc
         gxPJ8JBx6HMf1LlrP3M5vdXbH6DQdKxf8OEArlr7gpUFoW9UqbLF+heDQjvizJ82wotj
         mDBBpsrF21TS6y0l/lrF8rCvMk0TuVmlszBkOn42im2Pbj7dy3rMZ1VcpzDcmBMKIA16
         EMmg==
X-Forwarded-Encrypted: i=1; AL+hErHHgmHf6p46LZLgQbU/eyqbyzueeGRBkP/Ig7wrh6T8Um5Kk6qV80BfUzm/8+YfvettRBXHv8tIPvFrcdSL@vger.kernel.org
X-Gm-Message-State: APuU4Z9jpxCvfRHpqjUBCf3659frqIA6iWPryLmcSftHHHRrAtHmR/Ln
	vejUxkGD5QEUse1Cc7/HCXPQX002lj3dhkVADVFsbqUp85tRu55U8BvtC7L2HyPSzLhWYm2Em67
	rkiv953D/cEAgPsgEQkDVohu6jAboaeTgO1GB7iJQlUAUotRZpxt9CmpNobP7I+WhXZA0HPNu4F
	WP
X-Gm-Gg: AZFdTZebub8MiCUzZ6h/bUDofizlU3aSrP1UiyKJ74Ab0qRvzMt7vba0wgyb0BrFKRT
	VGRI24hohXgo9IoUN3aJ2t8n1ngZZ1xaILJCAp5qFQvED3DSkcwtHg3oCD9v0SOBs3Ke1X9v8mA
	InSvcrImfsLomKqFPvVsEo+eDO43OEQKU4/qTByjBNYIx0FLllhbxl6nStSUHyK0yW2f6wb3Etb
	WYFmH98hAN0quUpCLwZwkpjEAaUKUCmJ61HLLI6027uYTRFp2ABJkYmJutBrST9ddXjuidHyBiI
	ASnE5IcVRhVyRl6ukK+CieGnYWtYfq9LC3T1lf3WeYQr/IeiS3Q1y3SNqjYtMTHUASbq4natb+J
	72Wd62Kbt2C5T8IfRgUWojCrrGobLk7UHFdVUZKctI2fZHGup0NWqMAoJMROviNI5
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr2024792985a.8.1795461871304;
        Mon, 23 Nov 2026 11:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr2024787885a.8.1795461870742;
        Mon, 23 Nov 2026 11:24:30 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm436327465e9.14.2026.11.23.11.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:24:30 -0800 (PST)
Date: Mon, 23 Nov 2026 21:24:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] phy: qualcomm: Allow compile testing a few SATA and
 UNIPHY 28LP drivers
Message-ID: <uxutqaemdcgfatu5n6ckqhhwp33fzotz3pv2volcgywbzifrfx@zfo67vkasbkz>
References: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXzFKIfxcSlBc/
 +4asrNz+0U1x3cNJ7+7wNqP0ENcoJDFje5aNiQ1W+RMvgOa/CqBoBEyy2MghEelgaL7tjSelMGC
 QrsyekmalJL1gtRu0bWkumF1fbEwiwo86+FE4ytGSjCxZDLKoNvvk1/C6XxgmidMmFtuLQzPD/V
 W1qkNolyFfPNR90PZ61C0umKa4SZ3I4OyqDY3Uv0JAwnZxvWaVSk/bY5Hlyi2sjYqprAs492lRB
 RY/o2RKk7w6dU82+P1q4ohYMUcxvHMLBi4FvD6uIPfu2DgJQDdOQkWTzqQrGqFH/5bKh/ZR66gq
 kQVSa7wHiY8IbOg4cf6juMIB9eQs0TuWgKpF+CfNjDbISYOifETRcNhLxyWQrwWxKraBKlWARNV
 vbtxWB3vVM18Kh/ZLy4Dccozww+3EqusCXsRHQf1YxoMK2WHsT63O9uiCReoiXMAYPk/FcLN/zD
 WtoPEm2Twvzr8MXKwNg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0492f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bASQEeq-Kk1eUeroIz8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: YbVpM759Ie3aIWHO9bgb9nT5hMEYStgT
X-Proofpoint-ORIG-GUID: YbVpM759Ie3aIWHO9bgb9nT5hMEYStgT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX9+rrfzF8aB3Q
 O5meEvWTF5wPwe0GlJKnYpIkeDrbyfV5b1q8arrXtL8iZZwHJMbq2TLAt9rLn5wAjloDJXHJ4OA
 DZn3IiH30vd8iOSaaFmb8R0kXjcqp74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 20:05:42, Krzysztof Kozlowski wrote:
> There is nothing architecture specific relevant to building of
> PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
> PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
> coverage.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
