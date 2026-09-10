Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC998392807
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026312; cv=none; b=W6Qs+Ib8NXjHvWKUrKG6h/2TL0YbpUuamMCWWK2mOllvrKnoxo0RBx9N3K1NDYS5Pt22Sf/93cfS6TEF/VpjQYI9j2Yh0/GP5Mq+O46GKK/UT6ivFhp2IyJqQhSEtaPw57nPq1FnPluMXk50Psuwsd9hntGZuWcJebVSFW/7Kp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026312; c=relaxed/simple;
	bh=ZYmEjvHrGAQO7cqi6Yvg5Vou9RxiLtdcAkctGESY/2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvF9OSdL1366uZ0GjAR30Lufy4rVAhOEesaccnvlpuxKfubiHJeB8MPxgzwrs20BlrnlhaKiz5wBbkcJeayIaj0bF2jht80ZYLNJOBuMjqm8xR+J9XYp2X79H5S8oknlmDyutHiOTp9DbwrPLrsslMT8eqqQFuhsQ+sINSAXAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGD5juVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3AiHgQH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGD5juVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3AiHgQH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H4k9810805
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=; b=XGD5juVJnMNwnkqs
	8LvzH1QFHIX1OhqIAPmigc4wD8Cu04YfIBxzONyg6ludMI096DE2Mjqscc0JXnG7
	37LYKykjmDl8tTi5zgfGqx607uy6v+cRcSnX2vy+MATceJumgXyKR2DB6wSd5hH6
	TslSzgOmKpzWqWZk/WYwIXLjBXEoZQNPnZKWGPsU1ALrXqn9NMx98NqG03ulCqw6
	KUtsBbtob3ki/ar/1nds5Z31d9KOQra10EDBcPRQj4coC2Id45jvYzrmMn/oEVR1
	k10FZuXAxs2YnhVpmp+NaTD+MZ57qf3JO1Q38HFC30Sth2FywePgye/yn8ft+h9y
	OXxSBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjpm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:45:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53002215979so14461361cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789026309; x=1789631109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=;
        b=G3AiHgQHaweKW1tZ5keiQQ8lB27rzNJ1WSarwuNpIafS4YmtBs/RyWbbjJOk6iBnfM
         wmoxtPT1XRDu+wgTNdHYDXFPnftGX8H8iFBSEvZCWNZVCCvMgt6Wqehgi94JyN87O8hR
         ZWjW2X8NFQSpP2gpg5Qjsy9+FGoIYz+vmWz7CmAT1Oj0tYQhskL5Iyyz6NeWKJ9dpHye
         EuGtTppxNrBf81WlSOXurvpaTJ6A84i5G1CIH5u79XnmtGgXk/jgWEXcbXI6ykSfWcEi
         fhhD4DcPCpA+lDXj5LG09b9icZ6J+OLosVANNIvogqRk7Dhoqvmp8vyxBDPPJyeytWOu
         XZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026309; x=1789631109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=;
        b=IxvlmEoFVuQE6ZB0EfnRujCelCE/tsqjO/w23H1cdB4JvhaEDBQRJyiF+SMqlRf7CB
         CdrCDhTtjbhD22yeODvsP82UR4ywzDftOrt1J4L1hUl3++vZejIlRa3IZZwNIgCeZAWp
         b2OUNVn85J5/rkhuYYFsh2ZURcy4iIy43iVVWoc2Dt+xGLrehgmSH/cg5AsF3GQLb9K/
         FoL/WgBopNZxpZPnykxRXQTnOW0EFle8LEy6+SZDWSGbhwKwivwjwJ4BeylVWEWX8OnL
         9iXxVqoG4ZtR/AyC1UYNmMndTOEO+zHuQsZx7Q5Pv/tk27Na+DwICMSLlv7WeDvJ1uxj
         SFZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXr3CHbHKea6hWh2A/93QNbuGurr2xQdu+cTQxQLd8kLDf91bQk8vRg3yQlOJIYYi54jSSCY4RDeZ3/lTe@vger.kernel.org
X-Gm-Message-State: AFuF++n9QwzvegdgfcsMRuTr9m3KfbaocZB28m+Pw1/kKzqYsoitFQsn
	q4K7ybrzkls3pcHae/FxgHM/ZMipnFKH4NEuO8DEYiJEUXthMyLj4BsQhjiUEK2L0P6hOp//Vni
	hxPswXpHJf/AVVIHmj+7JphH6/o+WKb1Ynv4TepRHvu9cyfzAlNd2bNEyNuLaz1Uhf358
X-Gm-Gg: AYBFou0i0T8XfypwCHU3vfpUuU8D0Rbr0m7eig8Fzteh8rv4wCU76qGqsml6d29ccPR
	Al5Sst67kutMKJgDFozjfWfaioLwjQ670/u33Ajv/8nrctmAxE6S7/ciidghlhKHniz7axqtObO
	mOAKxVUePBQgcj3GZnCHm+/7iQgnKtpVekc+VrPFRxnQlgCIL1EU/pdZ1Q9DdY2APGPXgDfOvD4
	LM1P9wrKCxS3nGRAYrt71fdH3CaXs2/PbLl+YqYot/iyXMADcAMYnG0ypYyE7SA1n5Qj7JRvUKC
	Y4Frpc/wuYSkPvYMzI0T2pXcCdmuNXoIOHposKHuC+Omz/XyU97BGMySA/8LZ7qCYoVZVtCHRpT
	3gZ32HGym2HHpP8xrne534Q==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2763873085a.2.1789026308980;
        Thu, 10 Sep 2026 00:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2763869085a.2.1789026308504;
        Thu, 10 Sep 2026 00:45:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bf5072sm7672972a12.28.2026.09.10.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:45:07 -0700 (PDT)
Message-ID: <907c4602-f4c3-4491-891e-271d448316a9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register
 header
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX/eXE1IceNej/
 3T+OfG4VwwQZA3xl8r/Pqplx4w/Oh3sJzzutaRDOCqaAvBEIOZuK/qDlYIdrM/gZgRPU/9tNYWo
 m5fjiRgM78Kgj6ldLpsImBaBmEhDChs=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa26005 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eKJ4GL2s265JBOqWuI0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2pBX_SzMX0V4qsjMV_BZrnFqo9Lif_CY
X-Proofpoint-ORIG-GUID: 2pBX_SzMX0V4qsjMV_BZrnFqo9Lif_CY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX4ouC3/ncGzBK
 UWGFaUP7wpjuIcp8REpciQ2qoGsf8+tgripTZfMbbsv0/DAokAuuVpTbieUqYW4/3LL+a0ia1LD
 11bFpv1prMthxgT3AIz7fY8biX42R6NfwGYD6d4bgXxL9pbiqUacAPErGRU+1ZiXNadqo3ButX9
 +JLuMRjTKevlYit9SiV0qDgLl6rGTsRBHUMvogeEd5vv/3e42OlhYizjkqvK57FxYFGCLmEqVbv
 Yb+A/O/WaNoKnrfza5SdXxd6u3fwYMse/r2+jopJXiSW3zpkPV6pFWnatAaqIMbDDIqWRUobPRD
 6Mbfc76IOleWHhRiUWgzyMmW9QxfoNXxPxaJjIu80jaXqZm6U/d/177HL2gaSZ+YjQyxveu0E+d
 7fUoly1Pcw1YAIL9sIAA75fP7n1Thjf8L1qaYYT232vItE1tz+GlI2Fahq7/mgleoWcZDrcktI1
 k7agQpSCQrk7wlqr4Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100084

On 9/10/26 3:15 AM, Shawn Guo wrote:
> Fix up the whitespace so all offsets align. No functional change.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
