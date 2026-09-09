Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B353A8A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953109; cv=none; b=LyOzAcISZWX36r4EdEyQ1nWpaTehEhumAuksHeGXQmmRgM9EFYvzgzMOptdbr7oef6sDoCN71cGriB72dxYBFjZvH/0baqFW8YJi/eNl7rnrLZ+DtiP9aFv+cxr6Mt3Gdk6O6AI1AlKl6Ega8jTd1WGXLxO9owjfJZyAleqeUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953109; c=relaxed/simple;
	bh=Z09T1KtKmhwNLXiWVpHaJc9LPvi/1qHau6NWWjZF04Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bViIgc5Ize1dwah2kGO8gADrP9giK/2V/NHYGxdHVpFNiKTY/tVFB28QUK2dO918Ih4rTzx69NSKckLkG8y8Rq0Rq7eptNsvzvhQT4Yl2/OdbWYpGtS91j+gsHQCClxbGr7B3iQBLw5G10GTpQLu8Qn4hdP3P/BH7lt0GHB3MYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvu35bdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEPsbGi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvu35bdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEPsbGi9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AqvTj2294326
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=; b=kvu35bdvj/2kTlnr
	AmEQcrS2WB3tRsgh3yjrsEXxH4quAHR9QtFzNCeisv/2PaZ9vXe4D51oR3/0PDtD
	TBewfHUy6GzQvW/8aOwW+ABXkzA3TskbuJ9l38r5ZIOeHHtQnKUkzo9vUqFEM0Bp
	KLABwX8LUA7loUJdhZmvJKM5mo38M9qdUo/bUusVf5dYjwRimfR0HnSjaxPlq0bL
	IZWJJSD8cttC/p+J8QPeXpVcZauWndKY6+DSGa/L+9+FXAGxjArMkgpaAWTI47x9
	ozQS8nZmxbiediOZTxetvFW7fxmSk6SKEig811q4vSbRpVMuPgRuhfjfzpNgq+PP
	iKpeDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru06ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:25:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390890ae83so72525985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953106; x=1789557906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=FEPsbGi9hGj0d2AATQNExfHwK3/1lgW+hbYYe/4t9OfLK0UVh9d3mG7QpTEWJHssH/
         ZY2vDIkfmNy2kUa41XVCiz0UBytzZVby3DHCYHhe5mkXrmzBRUbaacSih3ya6dGVm5Gq
         HylThGHX8Vg6jxTGGKhTiMlHSIrvl+RbPGKS5FwhxgRbyXZ/FwrI8CpB+dyPNfQHzvwR
         /WIuPjDJe6SwFEdZpR6OVwR7eRK7dZx8vRt1SmMxm2GrDmJ1LB3+KFZgKr9LQ7x82G+7
         9CzZ9j8x1yziptjskqA/3Nim94OzQjRJrEHbPUM/ltLT0KVluvWf3xfxmscqCgOku7q2
         KF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953106; x=1789557906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=B3XmC0wnFXhn7c2C/KUuhOJ52U0haLsdHp+aWZHMihlvVBgmJDni/YOLwOVe9dzgsT
         vX/NqT53Pxp5tKTeO2glA+3mx5Q8u3gZJTFJ4bvupLKNiotcu/Ti+BDVqWw7eyOyhA4f
         e8wWTGhZqY0e999FhxeOfn8hUU049GopEO9IFjBV51aChiuBDe/Ay7tj0UGY8nc2CJfZ
         JHNaf4vGOCx7HXDUkUABxUSeekqGJltDZUSGtGNUyIyFD+3DqLKumFNhNYWT+zi3DtQr
         d+aH7Odtu1ij5hKgkLM+k4rzkfuDaVa0fOHozM6HpR5DzbsU09Bk7k1yXvnmHaXmGl2e
         zIVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt/xV51VXK+z95th/tT0fX7JVvV5IfRGek3tF0cfon9gCWy6MMBvLRa9cbJqeLReekn7SfoNLOsxxGeW0K@vger.kernel.org
X-Gm-Message-State: AFuF++mB3U3c2Wo5Rpv1UMEVtu/SseUDzMyas+shzzjD7GH1kV2GO6bd
	GR/F1yR/UIpTvtTBkhqB9q1rSanK1YBhEW8V1a2+rmyvpGfBmQg3ZRY/X8VaPdaCZrwin1msPLu
	WhjR9GR2pHMel9gg24lEipIy8gn+iySC8PhJWp5KB/swe4UQ7n+gnxLPdZ3ewPc2eZonr
X-Gm-Gg: AYBFou2knA+cR7rJRuA+zUHof8+3rlU7vm6A0+ogKOaFM6EOKyjH+GKi9UuQpJl5AhK
	9E6kZn42Dsi8vUD6CkNPfNWAZc56Okin35ypV5rg4zebxwgHVIy7LGktE+eL/Kt3DbiqlK92TpJ
	1MxYd28MkofeCEUs58Z5XEvyon8ee6ShX549zt3BNme/M7oXSxZ0PCbvSzwpXabazIMRBCjYFpb
	JP0L+fm6l22Cj2+l87ifuf2e4SYVc8HNnuFtst+Gwy40GY7mz1hyYjHxmzfZmO7hyvjlj2+L+bJ
	GkZldrrn1ceZ9qFXHCwQonXgFc+p5+yeUudp9pRFbFzJNmTUzM/bp1HzGmc5PP0Ggky5zf8XbXZ
	aX5SOsLbl0OvIC77IQe7wTw==
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560512785a.4.1788953106005;
        Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560508385a.4.1788953105607;
        Wed, 09 Sep 2026 04:25:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm545162766b.33.2026.09.09.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:25:03 -0700 (PDT)
Message-ID: <c15d4fdf-0e78-40e5-aeab-56692623b6ea@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa14212 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: IMYIEZkA3CjY8WXsdqyaKpymlxf1Nhbz
X-Proofpoint-ORIG-GUID: IMYIEZkA3CjY8WXsdqyaKpymlxf1Nhbz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX2QLySMfAEP1F
 iw+xYHJ9C9olP3gd8IgzJo2yd9q1sRxSH3F3iZWKzoX/aH8ZwG0JEsgMq1V1/c/hao2QQaJlTtg
 cL4Tn6+XOuwwOPu3BPyddX31uJnoarQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX2iPeRVfMLAgB
 UqLonxYdDMGK9zapo2fz9ft2vG4Nmg6vIaNlV7JBYJ87oEZaoDP0EAVTql6ul+pHoyPIDZh7bAU
 c+DmBTqOZArJIl8LNAalFXZOqhjdP1ZQ7f8hH4jwcNmgxQp23S0YIWw1Dyu7U6m3sEMOjay5H2w
 yJpvN6bXNmAU8S/AddBMuBMN/OuVBkHeUIgZgo5fjuOwLW/aNzxCDpWd8F1OHUDA4qm+63YCBhX
 5/TUkG6BHm6vAloVkBR5Bs9+zivK5AecQFwtpg5oci+DcgZkS1hpQOQRGPx+nKSWhJldacVn8BB
 T863ELn2ahDiWpsahowYxqeVWWv3YbdMkSjBD0OjLSzh5YvB+gzOP2GJjdqwOdxvEjjYaXuO+na
 2re0XN8Nd0b9mZF5egy9nt4ToTPQ7v2D7n+As8vQPOrcNGtF2qtU0relKKZ28Tm+tm1JWiFP5Ld
 De10TimPlJrV6dXhxEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090127

On 9/8/26 7:47 PM, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
