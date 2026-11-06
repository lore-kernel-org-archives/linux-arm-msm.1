Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977595;
	b=Q5BemKpCcQdHe5cCZtJOl2bZpmqfej6QE1TEFJFlsKc0iN22gH2Or00DKZDroy+I2YNe
	 3gnKDyS9XKybUa4ygERhlFly5ILvt/3XLvHao3hN1t1bxh41TZGj3wxFaVKlooKLlMlrV
	 Az2ho0H3/QQ20E8rwWq6Sr/jvHlTyB+HJbma1EET6E8Ad40dVuEb1MubA09q56U/SGEzL
	 9DYMgjPbaiSb7xITrdjtkV4ng+hCIOXW+GDdNGzyd0/wSzjdVFUd6TLT3OqCRdo8zxP4Z
	 nbF0WHAfixJd93dG4V1z0zKL3h6VwRdJDX6UE4TrH/M0iPihYgSEHgCD91MGeDOnGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
	b=4TsnmEJ7EdPVtd7fU4pxRYQ05oxErENitwRdEVZnpIjwgLMkZfrqfdls/0RUo1YLL/FI
	 Rcs0CkTuTsJJF736z//VCLUCaquJDE5NxWRX7pARC1KkA5hc/PWv7ujEhci88Fm3bVQdu
	 jdhT9dOBt4waxu1JId6paHeqBk4ZN38TjMflzcM9LHZfSImShJnNvcNDY4jSraiNL0dgT
	 1ZBacwXZ8vcyXfqiKVUsm10d9l3rmeEhHUlRnjinMudPmNKFPdRpF4P6qMi2td7Uc3u4J
	 EUiTrT6CuaTm+Fb52ZlqQnh2HenjSU+DSRaO0intkAdbES8xjpKACKyegjCP7epTvQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b0vOnQ/5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBB606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFBB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b0vOnQ/5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExtE73722887
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=; b=b0vOnQ/5IcPAh21P
	ESwufSWkqa2WlHgnCQvEueVm1DX7NhE1muU2tZuVygmfXeGKyHBoVldgukjvcyNA
	wHJhrGNyjOHwbp8v69n17tWUV7cpBxEh038PxRRAbHIV8q4a3sfKC968dFUbZ4nn
	UIhuW9YyJCjbfJIELSgP3F1w0Dg37TstYuzGEGDM40M6IJQjAlkJI7JCaN0Vn7B/
	EMMZfWkF0yt/Hcdqdu2RxVM3ryCPFthugstsCxni4jArW+Ci7CDxUa5q9AvIGfyf
	azg59TGzclW+ENIOPDNd91yo8o91WxoaSTEOMQ1DR/FJGosTbatnFAjLmMfjrafo
	wKjYIQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k8a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:06:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead2112f11so26878e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977593; x=1794582393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=XliKU0TKFQcUMOZm7HB0zOlU9QpTng+zHK5EJXKHPLYCNxrdqvRy3zizzAvSWCoknr
         /jfy5Tybkfj9ba4OYHWeLna+Iyp0nUJih5Y4Xzk73L60EBmMtNvYjPjwK8DFWi/qVVRR
         W6uQBDFnn4XcSdD1Bvff2Trn4cK8pGZ2v20+3oHL5QoBwmNORnr3SgIr6umieC5lXqLw
         l0aloE9vcJq1ox5cZyPRkIOUdgi+OpnoqMGr1FvAdD+k9gabmWLefrIMVXJKXIB4y5X8
         LPh/BQgeBCRPS4aOZy9plSsdRdn0ri9iRDxqtkX/x1infvJalRYzDRDoBJd25Cz5E4z+
         l7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977593; x=1794582393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=QA6kuUEZnromq/eym4qSEAzS1my+ZU+FUUUtk87rSUX1Tm4NqzZKid3U/1bFQlOAsK
         CS9Ty3zMv/N70Z9mFgV4XM3VUD1oTiixF5DY/P6AQfAuilOEyB9lj+O7F6dLC2aCocd7
         7hZ7amVBgXqOHq6iNo6Y/Mmdc6Nm6FTpMOVFjpVN/TzhRw/wCgasGJaDCGR3Sb44TKu9
         bsoPy6F13l1XMmGkzdAWP89uXmY6D0y8bJ+pV2gFckIcHBi1DWfyHKWlBWXMqHUnUFl9
         RJjk4KfhoL/qddSs9gbMl+ONMDIK9f8i20XL9IxVYAMX4CA1kdAnNo6hdtDFoCINiysk
         fheQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDKN4SQYlnUhRxU/olJjTBTXc2cokQyJwRb+9yTHld492UTA/jtWHxu0EKe3BfKE1fxAv3ykL25nzK9+/H@vger.kernel.org
X-Gm-Message-State: APuU4Z8J/rtBX11drz/oIqllHdddv8g8qOvOxPIrdnajvL6knMLOco7T
	sSfbamd+N9pDPlGuOqhDugMt1omwyTO+3MnSE7xsFAcNJdjDsh6tC0msO/lpcGNsazz+0xOD3Gn
	sy2WyFTqgZ3Z/W2rRT9RyjZKsfEH3swsgmIu1eoOMTkeh1LcYm8fsWhwg9QCOR7qhCFVt
X-Gm-Gg: AYBFou1PFh5WGvok7Vdj8FxequUJHQht/n85Xm5Dje02QBn+d/4uC6Og7qFjldZHR65
	HcKTPgcBFHNDpB+yP1K++77ZVF+5Wkz3Bvkj8DENL1AnY3lUXl1lL8qnWxfklfYPMWf08BKBnBb
	z8lLdeV2NKl51haVMhQ/93M8wWP9e//NmPNsH3Ojs3ZkP+KQQLmVmarBNmwb1VehZlJ/xhJhPmk
	W6qyt/4Y85ksanJoZ1T1D3dgcyFhUGXrFFEb2nAQGLCS1Tb+TpyX39JZ17dQlBAHlSbVHfWGyx/
	co6ycQv/0RIuqJaxxgK3wIpdX1x6EUKWAo/z2D6Hsuhz+bJotSWAtNhWrVLvFb8PZt7yAGhLvwC
	WRMW61qM9I4RoXmBrH86sRo1l9nU0lRXrA5/zmf9HlRCKiuDOzlwYQnZlYymiy52tb+gA0A==
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177082e0c.0.1793977592988;
        Fri, 06 Nov 2026 07:06:32 -0800 (PST)
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177044e0c.0.1793977592530;
        Fri, 06 Nov 2026 07:06:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d487be8aasm36689066b.15.2026.11.06.07.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:06:31 -0800 (PST)
Message-ID: <23b5c705-cd55-4c0c-9c95-c61afb286416@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:28 +0100
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
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
To: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng
 <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XSVFy1EJLkf4dvLV8qY3EmuUoYmZG74O
X-Proofpoint-GUID: XSVFy1EJLkf4dvLV8qY3EmuUoYmZG74O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfXzHuSaTUdgmc9
 lbRUXEkQT4v3/THvTgqsjOr39kvR3X/xUk6Otdf3T6yk7APXv6/YEjgNK0ysjtxnX1GezDxLgm7
 6chuzPpvDZnd1xpL+M2o7+zls34UnKQ=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedecfa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UEx5U1dda6wf6Co_AVQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX8v3868KPE/5+
 VcsmQNvQ9uNG7cYshj2CxK3IC5Jteks3Ze87QR5GkoZWD30oyQn1sWtRbZE9ckkiSBv53ZrQxqT
 JDixluDyJXhibkaj/d/kLGd+tHo9NABjp9SWjb6AUenZj/qtJ2/yHTeJddbAKFHnuQSfhc4g4i5
 U49eWiaqSZU0GWFGIYlrgrSw29id61hipo05bPawMPc3n9mm9hPVc/UYjMcKJd605OrpHoNO88v
 jJ2CjnDa8it+DjDfBknaE/tYB7Co+FCRkFhYHgz0IsqCinZangwvq4xFhg26/429zyL30gv9//c
 v7YNqNwg7rl4qrfysXa1ZmoZkQMPuKZZg8fwpZ/j8bT6McSt/K+Ns9RnCNURXPsSbcYbKgXPZL8
 +xEWFNXGbfDfhQCUWl6LRo53qXqVhtNY/pShINSAzAA7NTjivX8wadj3nhNlLv2zXe5BMKtz6wY
 T7bJ19Bz6DKTHPyTVBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

On 11/6/26 9:27 AM, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. 

Without much more insight, this sounds like the place to fix it then

Konrad
