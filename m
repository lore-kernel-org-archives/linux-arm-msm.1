Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152C2236FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327373; cv=none; b=UVG3ahjnFsKwLgpxhWrOxYVnUhXcfMvpziRJV30c3BBS9k3jMAb4i69v9tnFIoKLdNBkiECe0lEPnIlMYZ9xk4Du7+nGR/PEBPF6t3ARx1dhFXacaKGM3CAupmfP1mRX7B27YV8ifma4imcprFmlki0mHgt7CIaWYuRrqMrI/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327373; c=relaxed/simple;
	bh=nGyW3duk+6ZjWguUWIuUGlJV70n/H0euWoTxYXsXVlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfkgU5teepc4IuBmVj4xP1j6kIefrlnzAd3QFQgixeLnNSVI8/1wYIaysP6w2sn0RLeKfguxWap2iyqh487sNXSe8kEYJ/ImuH97+LFMo27O7OD3i+uaVlzB+oAT1OQZHZB7LTNSlsNVeFLd7xLIJPy0atRLyYK4KahIKJ01Tkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGmy5Xin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgR1xuvN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGmy5Xin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgR1xuvN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXVw71218101
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=; b=jGmy5Xinb2xSD5pU
	kHsjiX+IZWn51oCYB4Ppb1FYqIy/oeen87suhLwu5Sg+VL6rlCk9VM0YMmDBNp+s
	8rzFlH6B/5sJlruWHdm2vF5PJGPQ8g+sqYoI4MMUj+3x6xl5Zurw5jrJN8XR0tPf
	uKFxDzS+xx8CYJi3DGNPHJqCTpqBLbZ6DJfBXRHc1yW8ctg6yOS/yZJc07a//Skj
	O+EVAGfhlavIZQvVKhNQPP83+RoWapp3IBI4F0A5kWHS6hA4sLil7zaWYoBBL36l
	31yCkPRzQT6/H69w88ZwElwuLcmpJxSYPa3x/JekTsGiWqCFJZhVS8EzK0U7uupk
	4wt/Yw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj05m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:16:11 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e8723ae1so60803a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327370; x=1785932170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=;
        b=PgR1xuvNfa4oEPJRNQJYE2eToCETLg4H2OLEq2FI55skhV4zZtsKCeuBzl2HtfpfiX
         osb5x9dcMSeIkIQ/2D6wTy0ZuJ3Vsp7pqv/kxOg0QJb6eCBMEFFEhFfCeHOKILJ4jGZp
         3UIQ4JReMx5NLA8A6cKgM5ZpK6cn3DQ0LuxArIYjANoNuTDTvllyrIBBizobJ71qCU9x
         Fw6juq/RwFzhfbx7BiUAH1kc6TZzJHjeADPDu0xtGZKlbjAcchCEpwSKPtGiAkero3Xe
         elEa+0ZBxAVkDm6rJi/rNOej5JqtI26tadZb7g2BKRaVgcDqaK07c4u3+LiB7kAmyu+j
         BUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327370; x=1785932170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=;
        b=UAONXlNtut+gEX5YdmqK8nLDfX4R78aFoXPsTrAOQgvVmfmac4rl9gZ8yuLsEfS5qG
         XGBBuIcJYp78+p11Er/au1PjIwK919IaojMfMs/Qtr0NKhljg5Bbn606hgX08GsuE5kr
         Jh0EgDLAK40IAEbAh3YSupNvrp/4hWboIRsXdE296Xu3rfwl2VaZn28kwQNu0KeeJAJK
         6E4BEjb/G3LuAFQJb84FwUhagmKVIB4XIDpdkDvooPp/D0OiYdwyZvNBBQRwhtLzZueD
         6lZa0aoXwV4Rk7NNZZVs5fd7eP0Kx+wWFgmScEg3BT9YjzAVBR/oioDCFIyNOYu4n5tY
         MDyA==
X-Forwarded-Encrypted: i=1; AHgh+RpdPSgDHi/0meUmb1jPYb4Vkzzi9uu+yzcNc1Z613AMZrNQJoz1eGaCcYsbAaONgzqJIFWQumgMxZlMhWgw@vger.kernel.org
X-Gm-Message-State: AOJu0YzLp5H6qEI+r1Wo79DR+WHMrqqdA6lalVtGDyWsyBf+YL5d/jS8
	ULQAVK3nOR8/KWpj6bdTfotmButEhqTERSe2h7RKcgmTTZJryw/NGtQuZM4iJEyaWVMQr51CSn8
	MeJoTx3Cq1th0o6d0H2Q5tY7X31HQgNemCZuLx9OvJFET2BhlH9V+16jknBqAVLMeATPc
X-Gm-Gg: AR+sD13oNxE/W+9SxyX7Vp/W16gmvAeRuCXzna+pYxECKBEhP5btg8s8LIRxFDDxvjW
	rt0Et1spGWT91xb/NGBpCFmN7H/+N3sJ0ZWj8YzbvO9J6VVPXbUt/HwOHON6zL7kKJ+gXFkRzJ3
	c9/GgihjFpa7SpW+MPdOE8wAjeBhPkmeVAcZtASqiMe7uBidOucPHOb8VvUTCvFObw0k5cjcirN
	8MaD5hgvgW9PoYuOlPFpyhgMQpgZJ92WGMLnczVF+TTrfFShjC+eocq8/RxFPXqO4LhWO7jYjaK
	J9NaYCBWn69mWPPFIrZgy05kRE1nEufMPi3Y/g/WsTEesWqnLCDrJ/TqQRtaOIspeu0X6fH1kk2
	HdOyx7bLwvEL+/obPuxwRHNHe
X-Received: by 2002:a05:6830:67fb:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7effee11f80mr3116005a34.1.1785327370604;
        Wed, 29 Jul 2026 05:16:10 -0700 (PDT)
X-Received: by 2002:a05:6830:67fb:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7effee11f80mr3115972a34.1.1785327370182;
        Wed, 29 Jul 2026 05:16:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be3a33sm768977a12.10.2026.07.29.05.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:16:09 -0700 (PDT)
Message-ID: <0ef4c658-be67-4df5-af56-ba1517700985@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:16:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: eliza: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69ef0b cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: swQoWamfGVqvjgGgrp5gLgpLO0B4f2El
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfXzNKjt62NYdJV
 sBr6qwjD8EhPrDxRpwFa4uL1ltpOnKVjnhb6Mzo4ADabdxO7notgzH6Tlg27NSrTAdiQbRdvR+1
 y5MbEAuENrP4MNPbImM7D5Cp+kxR4Qbaqzd4zdEoMVP9R5LIAfJo3jxbM675nRCd0YLqqGlJHja
 Q+sFnRzUmNuq+pUdHU6emZjGkCEnV6DTv+Q28oiWskO/EMbTt+DXaVjD02DmjniXvdU+afzOW+T
 JtYAMTYcGXph3JIGtF0kNkC1cScOLaeREud2Sh9S8LX4hGfTIoPU7nZOg7WxAafFxi1qvTFibhi
 WydL9US0+AcprRG6lTnuGVCuAyEk7T8JrRxqNhy86HageIbIEFK5YJxql6RZKw9uDKQPYtX3lMp
 gsHkdBnhMBkcwOa1wNrjM1VBLszWaXDQ7pXkV8QsAHtMEvUhycMDkNp9HuMWqGwYVQ4foZlqumm
 /d+s6ChAl1rdXGVmLjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX07LrFRy8u4pZ
 s78RO6CJm6qaDb+9AgyNnUzR7J5r5t4lz8/e2Q4eXFkR6+9nC7CSoQAFoH85QkHJq/xWIxXPISP
 QEW43S0OZ6T1DKuawKMmrGrN60goxUA=
X-Proofpoint-GUID: swQoWamfGVqvjgGgrp5gLgpLO0B4f2El
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101

On 7/17/26 10:41 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling the GPU speed
> when it reaches 95°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
