Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263628;
	b=bmkT+M/LYHbPEsQzlSiDkzAs1FSVPknx7b6QhdxCeVc9ph3IyqGx5geyp0+ecXhoi47/
	 JcYDB7BoqSJiesoONKICy2m6YFT2E4jyIwDbqUYm2tBI/wV9AcmoLNnTM/9h0u8i2H922
	 kL6iI9MPkZLqM/89mjfIYeqpY3HIinyDfu6178zNupFqhQNPqHapS/Mf3m03Bjzw8JwGW
	 KRjDZzKbqgYdp6ZIpQvQiDUgUHTDGjnjOijzZ00NKB4aA/6h9kzKzy6LdPfQ/NYmdgfuR
	 dkLfBw9kiHpUsL9Wg9ukgslytdl0Y++tU7AFc9U8W2AVRadPOTqWlQY5j0Zb3g5SKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
	b=AeBXk+aowcg5cVGb2ew8gZx+LOPvfTcto8xKbCUM+rCBY9HIaKX3F2dsBWd75RsWkiQO
	 jZg8lZF85SVsC+jkjDaUY+bGvZ/p7Yc9N73gq0YGnPMgWFsv0q9aMbZOCaYAfUzZEWf8v
	 LjHylohWFERBOsYBgFmy6EFlYqm4oMq+aUX64EtqlLRxW024VjGI//pkVflRf+Gj9bH7A
	 znevCBZQln2KRFJk6U3QSn2agcw3sb/BbvY+oCEaCAfNNCYh2CiFiIDRKADn5kOQAzGFo
	 6cUYP9nsdZgiF5sg40RvZEa0goacNFoFZrA7gQEkcYECEIzOsx1MJFVf98AnDCdt1sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URe/yDo+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E1606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URe/yDo+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gnwl3340956
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=; b=EN3iYYGWjgvabrIc
	QO51CZcIcn1x3YZfiQzdD5Jqoeg8nrAlCCi6Znrjz3SPE4tOXrsuGx0pmgQJNCGt
	q4DVo+o2oR9R/xNUZANQSDtUIdD3yGVdXnzzP5uYM00mmKKQIMF6XNZkb0T8Sz11
	pH9uLaVfSmoTNLL+DMhNMCUOtYCikudcgqqMvba0tQYrIoj52wxUOOJtXW1VTBcC
	KtVVXpDHSMhEej5G7wFzqWJ7XbudUGD4mvib2ooPhYE4o7EQkPy9DdL5iwD/v/cZ
	HKSA+hRZ53J1FqOt8FIm1deEmgFKaa99QScc+T4BDB4VOtEQefOcQXB2KbwT7vNp
	lDO3sg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hh57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:47:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso5495761cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263626; x=1793868426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=URe/yDo+/DX8iHp5fD5XH34cPlGO8cQ/P+tpGMdZisFYTMd2uBxI0XxQCNsPYWq/j1
         UVUZd8fnkU29VnPq+GM67SXhkNdG9rNjglgH5gsv9SNv+7Uxzs4LMhZOkLfV1cj2XYJW
         kGNAKYaJllVNIAXnm6NTE9QDeW3hmVvsOP3ERuasDKT93Gbk43DsP/c9MjghWwBTJNZH
         5GZnjTIabWJNB5iXK08T8sKmykeyL5+oXLAGFbVwX7Hdx0ahJ1J6520skQs9diMIP5mW
         afmxGdnXft4YVm8pHxKgBiiQT3Gk+GG0go/PQxnwcR3jxaCuTup856HzHJuOYLy3/fHM
         /l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263626; x=1793868426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=n+v0vD6WxHslBn0YqA9H1c8/OwwNT2jPNVX4vlqhWcCV+JD24FF1RVwdFGbcF0cXiN
         76laFPT9EPqpqMBHZhGKMxLlKbtH0KJ3hE6yx8jTnWTgHgBNd5gAXwOw9d7tC4t5E956
         dBoYEgkd7FJXCf802JZE2N2LOmravSPJXHNdhgjovAmq7/EDRyajXodxztZSj8lc03DR
         EqrBbiPm9Yb6W/GWdS3shT2wkE/npR31Kz+mJbi8ycDYGnN2RRfFxNiE1mo7OHvDc5gv
         Eb9e8SRuITHZXHn4hhtxw+E6bcbEkNVoDembujC6TRcqWJg8bn8occph+0+uPisuzN00
         zwHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw6r/FIfW59CNEDvuwFcG7o4jwJn60MvuA8/VNjZdeZc+nuEcrjoEzTCZzeTepVOa+yDz1aHA75Twk8Ibo@vger.kernel.org
X-Gm-Message-State: AFq9FYI0rx4Getc4uoTcij35TyCENWsSC9IcAvvxJaBVcPCKDH3ZEc1i
	c/HHlwbap9fddSvMbhOejit1knx0ICXtY1rQVm8JPksoyWoB5YrrmQ+cDpaBhgBeLULv64AE9Hi
	pzHBkDo/h0ESzmw/pF52Gk4TpuDSkkbt85W6NoM4l0JnrW+YovDmBi6CyJ1MCWcLzex2O
X-Gm-Gg: AYBFou1l11nQvsXIhzOwPUPm7W7I3YIbMrMDngKFlA2Zi0vIdChcG3xFPHNo8Qb4eUl
	coTgGuJhaY0seSERZ0Qrx4UpAF1ivOCRzlL+zdH8KmtuNhnFTILPiRyvT46z0OvmAz9lfhLO7Qi
	YYN1+GuafUrr2LkSwa7QF80CRSqrsIAgNznJLuvEe9//S3PDXDpRz/8a8LRNYuPp7RdD6qItFPV
	1OLgzaI5jsOIF7iSVqPl1QyA8+95KtG24AOjAnNsqcyo7bG6FasyM22e38MaBs6U+B0cbnVgGcq
	V1108n5to8RYybXAX3qGewcEjnIvH7M81/VczSwQ0pR24R4nSDlege7+EBthEhGYWZs3ScJ4ke+
	YStGwre0OTJlKKZoIhUsAdtkynm/Wa1p6UPOHyeMgEZ7Ff6sHr2kXXzLzXs5eIdpPWrQUio4=
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059951cf.0.1793263625771;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059531cf.0.1793263625147;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm710387266b.9.2026.10.29.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:04 -0700 (PDT)
Message-ID: <f7596b4d-20ea-430d-948d-69d42bdca671@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX66WbvCJAUhEG
 aL0LHjnm1FHiqsANA0o7u9m2q4atj+FEiMV/nyHIGy3W8wuSNDDGj9nsi/S3+vO4iOuaoJLCriz
 21JPCKniH6/BEBnorob+Em0AKbxM4Ac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX32qd+qM4TgIv
 +2qIZvoOg0k+4QIith78DFZyvjmK8z/scGL9S2T/DmfGC79YyhUIU03Sryg/MMZUxDojPjmgS7k
 w0xMTLTlNFG8ISyuAvaSdKhrl9UbGfqxXDfgvZPvkONloK5Tb4lJrS38qjb8WlVq0RxjUrE4guN
 xYCCw686sAWDiQUZK8fIdtnmf9mfJbdENlur3ujVrvp1RfbIr0uKcZPJW1S34RoITqXKYNmHITj
 UOLk8qqJ5Iieszd+ehWCMhg6CI8gk2yPicxZ0IDS8XAH02JQBg44ggshdCyqt5iy/Y2jTuQZR/P
 sz9/EaIsqcEpQ4lGgENZUZZ4dsXEmhwApG+A/Z2popR745sUw2VedeUtttLrtZM47MfrIn56l4G
 iMaTpLgrpt0ACC1k1He55+Hr0HssgH1o3ba+w9PVn11pB5NIIsxAemsc8YwuKO0aczQyP8LCulI
 LpUmk8Ne7wlsCbMe1Sw==
X-Proofpoint-ORIG-GUID: xkV1zqIWgbqyKpKepF24273FW_g2_gxm
X-Proofpoint-GUID: xkV1zqIWgbqyKpKepF24273FW_g2_gxm
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae3080a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
