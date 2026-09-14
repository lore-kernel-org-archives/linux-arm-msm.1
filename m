Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBD3D565D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388785; cv=none; b=sCExKFuNsrCnU/ZUPg1baWQJ/npECWMpu3T88FqT3jwYLSfoTQqgIZ6ZDjJDXqHkIMjO7kGr7cGHVOBHGRM4JJPkN1koBMDKV/ERSbVeaC0elh3orLRuK2T5vtkdyofUOJnq7sjFDe4qb9c9XyMS6tT2/QnVxEtrgSzDB6BY4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388785; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4LL+OCoeTV2/5Ed25hRBHMbP1Z7eT4KNMoPwk+nXiHdNtbeW6cLHzY4U2mZlgjZvIi3puEjy/XlUqTpmbNZVXGQe3ISwmNI+u7bbB2zZP2gfxbNdLpxjbEaKMYfegDJWoW9vEdv52NNnSGiux1mJ2i1l2ouugTwviqF83xHYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrP3BJj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfLHaVB6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrP3BJj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfLHaVB6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmE5O531222
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=VrP3BJj110vimTQ3
	c8H8MYjqoWuEJZz90FbLkiKt6ycOs38D4SdQuq4D01DwnMkbslGGz2Hoao5hpg9l
	Ga/gYA3P7S1W8qTgUVXdQgtYXHyjyl03m1ElfX2ZOU19o88EYhakk5KhFRy+dRXe
	iCqqUEvKitUyM+jWI3P5KnFPSL9bt/TGeJ3OtUHXqO+vj8Kq8AEtGQY3VtjkwC1o
	OelRbTadjSpMCmkFWQ5SX9glaRGTfz7WDNw5CaZlqHxB/ZkXMqdCFQ9SE8favH4Z
	M4H9u+/pcEAVe4dw6l2zuwuOkxHxqLmpJZPGL3STErLI6lXn/ozVf0x49fx/jh3P
	hZcxLA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstd75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso105146e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388781; x=1789993581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=WfLHaVB6+33ftmy1GjqL2+hCSReIKX5l+SP3CQ6qYEF1Pssj0S6Z51JCImeJ3K7I84
         NiyRFRTaDPBGtUc/DaO0d4Ke/vHxa6yjeW+x1OyikdnpeJWNS5V/AvhJl1q1s20T2sQE
         B7em47CTPqPnGE/VrjSdIt1dtsGuOK/1V5dwy9j8Agi9Y5Eh880gAC6B4jqKASL7asXE
         PxjU9TFD78D6qtPpf5OD5Qa224y21pBclaBwua2MTsfcysCnbaxK5uaF8OmdpNrWjCsL
         asucXkvX5NMZYRPXxTw09dYFfQME/ID80cfW0jYNBjcKJ9CCvlh22HBM5W6AeElKXMGA
         o0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388781; x=1789993581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=MXDc1gNa8T47r416sBFXQPSZrGPDmhN1kKpwOX+SECZBzdev2aGIUwCXPJF8fJua1v
         yGjWMO+nr/jOowySY41LjM5EJYXKoidH9KgCbxe/phL6RUBX3I3y4Qcnnnac45KOpTcU
         tNuW1gJvUnsBp19Yi188804onDY1AltqQFKwlFhPiINckFjz5lPhogSvXO1dvPq09gXt
         glU29uAl9JjVGcV1mqXGk042PFpmT0YUGdPly/f+AgCoQZT/uWmk/ayMYTXm5agLR+v2
         D0+vTZ+pEWCcDfOiFYDs257NMgKaf/YzUrEPBr8Si9Yjc1ZE5tM4CtSt6xS5CCzYgEf1
         YneA==
X-Gm-Message-State: AFuF++lBLQdKSmudArO78WA/IOeUV0zNv6+WKE9EBdjNi+rTJokzzx3d
	/Bb983J7+1+qw7Q9IBljhgOTQu+ME98Y0A/ijMelqmpMmvkj1ycJd6eJndL56VSUdzCHogHNNBS
	bGk/I+H5u4zmtJV05NJiPLJ6QvwlRAzcBYXVywfhXZSNQghN5SFAMBZl19iagy6eGcsqh
X-Gm-Gg: AYBFou0qftkWeXpUFoPgC5uFffJAtzpd2z7dm+JNt4FG6oDgVEK3GaZYhQd/6o+Ay7u
	JEL2YDm+R5plPaASZooeYzCeG1Hhu+llOMa09W/6MSZGPBXtsSmhyk6uAJyKTQvxXfnuXKmJQ5x
	IXPZiDucKoCnUMwUf2GdXvBXQMiQVjUmxL4EGyl3lOojwkwucpsbiIvtLTvZlsU3n4nqAPFPU72
	PO3Op38UmT/jici0VA/xu/Gs2Qw1sid75MZLHDgDN8W5dt+scrdRxLXfAQacqoZvvAKD1osfevm
	mYuYRCnSF+BrWvO9b9HaVYZXlEcQcBE/ygymr5x2Mro1gWMwgNXcM7vibH6cGftrM7n86J85bhF
	wpTCm24apFajKptqBLKr2PA==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357634137.0.1789388776699;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357624137.0.1789388776224;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0472d02sm2502050e87.62.2026.09.14.05.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:15 -0700 (PDT)
Message-ID: <b13be329-3cb4-4e1d-b355-a63fe23fc091@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/31] arm64: dts: qcom: sm8550: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8LnMIxxOVeXp
 rGWsSN3LEG0u+h27qD47gSaipdsCnt/9HczmOlzul3DggHZ7w1FI+JBYFxIBRPcvxPiuVDhoDxV
 8mTGLU8sa+ntAKKBjF0IqVHGlOh7Aq0qz24tursldVeLxdGKvmLRrzBtpPDpP4o+Ae9naxSTa2J
 35W3uR9Xaaul5wD4OkmXy20Lbr/BEgHXQpIssOqTNKaG7VIcP0DSmbF05+HCw0W9uv6ZmnDt+V2
 rJsrMKwIX0upyxdxbFvxa5uwrL2sdg+OwcAu9UmFvqSMFWAoS63+hLu1epGCrPCe8oVh+5NTNby
 WXI/FnAH/TceS9lyNBVObMgxcRgKxHGRbP7KWfzVM54AELxarmmJJfRBjvgvVO9ckKfwtmfUB1o
 552EP+Ji6yGhzq96CD62FgMJ3VriOOXFW7KzEE5qQLy5p33pVWgU/lBpVvm4be52F2FYVk3HmQ3
 ijrLwQ028biPV8IUz0w==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e7ee cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: xyKCXW132n0W5_4ooI21atEd9jMIpg3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXwZCfsHoWSwro
 tIVNyyzjl+tZd/8Ig13qE8cu60Ffd5SBZohrJ5ESpvEBpIuWk0cYsp2T7vy7KfLyU90M7ZxDCEx
 xYpZGyJXgv7naYKE2v2enacaprOpBEA=
X-Proofpoint-ORIG-GUID: xyKCXW132n0W5_4ooI21atEd9jMIpg3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
