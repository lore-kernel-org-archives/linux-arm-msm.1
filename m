Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0C449B19
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046916; cv=none; b=Jm7DMddyptJg0Ja1YTDiHs7yFcV3mcqGKaeoRZoCIXFC/6lc0/JxsAv9N9hyW12ot/G7pk7cw5pBNd2Us94cYZatNH4FLsudsjibnEui/8pZJAzQ1qjH95HxxLhlXV2D7Bj3Mf93/Mdk53O/5I4qEwvwLrsfMHbIbOHT0+DUmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046916; c=relaxed/simple;
	bh=OMc49UYmUguEYzyKyIv2wi8A76vXj8J+ya6GNZJJ1g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2rth7iYkj47x8+sOtQrYX2l6sVNbiK7I0XS1G/QFDTEiiwwukxMaEVdzdsc+9LQJr/5eQibpt18S3YAOC9LjTI9YhxNm/qH83XMERma88fOQfHPht5gO0aXtgBqExP1Z38/IE5gthbK7a24v64+5KkJJ6LtpY6kd3GPzdfkPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpjmYld7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brXCOkOO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjmYld7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brXCOkOO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BOg6325600
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=; b=ZpjmYld7AMP9ZSy7
	xWnL1sO6gTN3wzp4BAEoeLdFKIacYJZ27ojLid9WHJLUdr5FJr+Itu/HUuLEd6DJ
	NQLKxhihJv9lYvUmmZq2F16j/GBSsEEI4mjmmkZpcVSD96H3SUsF7BckO/Z8ms4X
	lE+gG+N7wgJt27udUXq59hrdjJYD4NMuCyeMRf30S5Wiweq4DnIgCAzniup214Mf
	8LFtG1H5XFFGFebPUnyaXPHk3576+Nutgwx85hLbHwcEMAtPjvVmOY5YmbKIRUl+
	QBXFt4wWCkEn3KhqNe+Y4G3aHS/9JUHFuf7ouQyUScbjKHNP0TR1cG5MbdN90Jj7
	r7iJQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtsqpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:55:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so117389985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046911; x=1787651711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=brXCOkOOiD8STcqBUzF6PgizfhoVAyo1zpvEPm2kPPtCccsnvZXCKqDUGmksoCZlxg
         5Hvh3tiGTIsW0IETn3QJSffBwuoHOskhqij2HrJD+YARxb5UWvKCZLLgKE466Rk0jVDK
         jWA1RXkczf7lO03lX85WqWf/Q+jwbOH6EqID22Awmfjvdrkb635PP4psNx+og9+LqP7G
         lYwRm91Ku0H+sfnk9WiWxxr5Ld97RhYbFfA1z97YoslaV0ZMaVRPPqdh96kWBhgvFAe+
         +s3yfOXHlLMPf7e+c/LERm8k1saTLbtmcp2ezCX9nPtxm1FxvX70+7sApriLZGsGzZiS
         OPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046911; x=1787651711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=hwry9I1+gQuz5gFCWR+Q5UDYSEueu0/B2vffrMDSzWICdJ40zbBECcu3w+xuEi7D3d
         7LvjKnFtwgKhp1pztko40f962duMm/jfj8HefwvBIJJLVrveQ/iAWyGxdWg3unqo8aej
         iBDOPak5NxBgN2ggheQZczXu049xvIQeMlMNrrPVOB1XFQqSdyN/Ob6kRqjoaOwzync9
         7h7Es2RBELGIVlOcT4TB5R3VZxcABxBKymppjmX7wy/xy0pnH1nbj1Y/8Ks9mRRU7lqb
         KMpybkV1Jp+0iFU4OeuzZBqVWQ1iXY89/PExpJcdcBAcXrjO4ODUYr8dIPNpUYv1OXiY
         jtcw==
X-Forwarded-Encrypted: i=1; AHgh+RoyyrcYRlZ5na+ypR8dWRumLQ0uKu3EhGXosjba9SOrmumJuDekZXSvQYexBP1EwzWkSpoA1HkV+fMilFLN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kLLSTal77czfPA0oCPF5dIi5bzV/FHjA3lPqEYb23cOfCbcU
	psgWchxsVhz4yb/WuspDNPjhcBlu1wklEKACm1MCvUwR7lUI/5OOdMIo3b1Z8DgNIWXBDa+33wz
	lWjqowbizocctVJeX2BEYnLLv1tPw79ZMc3eQ/lJ2s93es0UkarH1grbkXpB27rRHMLbM
X-Gm-Gg: AR+sD13T+K6SK9Q9dKyqxfASRPzcn8gCxyqbVdlFaJQ23mDZ73eJdBiyuwNnpIEQHZB
	TD+p7ILfoicPHzie9QGchl96UspS9HTmQ9rKGkrvgeC4wxTb/GB9q16NK7DrtjJpNp0vnyCGSkJ
	pzzM/qfvyyni6vJZ56HYwfgTmG3cQOnwG46pSuvDk/DozSWcLjiMf4F5BW8lhoZo1gd6Iv+MQAJ
	6O5/HbTrBSAgqPm4IKhymecgPDgkvO08Dfk1nqgX3qVXLT4kxjU/td6FlrtdN8v69ESNiBMYMRe
	rURuHMxD5QXygK5DjIg+tXX2TFRbNBvN0bR8lna7oXLwDUyO0q1LQyLp3Nn3EByh4dtZrIE+oi9
	6OjhNoWjdk2yafhc9sQ0vp6iM
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156451cf.1.1787046911162;
        Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156071cf.1.1787046910745;
        Tue, 18 Aug 2026 02:55:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9f47bsm126108766b.52.2026.08.18.02.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:55:09 -0700 (PDT)
Message-ID: <23470e04-eea2-413d-b055-7451fdfa65e9@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] phy: qcom-usb-hsic: do not run the sleep
 calibration clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfXxw0Uet3HiRKH
 5ar22BQ+Y7jpRc6l+We7rajnJoS3oMBzWBPRxzMgL2kjgez4XsbnMuApFLvyAgMoFvj+k55c6e4
 hpBGxNkkWCL2FMCTKQJJJUKW4aCM13s=
X-Proofpoint-ORIG-GUID: mLswsNO6pYuOt6mfOb2id3mu57BVghfI
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a842bff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-c7pCBK0zC3Ie-k0gBAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mLswsNO6pYuOt6mfOb2id3mu57BVghfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX2cAXpeZxH2WN
 UetUYxVR3BWizRiCtRz+xsUtLe33yisUF1hJpyN6AXy/BeJr0DXu2liLzpGj4WxreRjox5zrnBG
 GYrz+djZoJN3QulVOihnhFpapvu7st37CWw6npW68vpLZLLsTdNUuGlxSSdaouZgghbYbRWhr4c
 db31Q1edoQTONf3a4DQJEyhO4pEiLqXO9/3jnUUi3sEZcsTImD+Y8R3aH2+Zks6nT5uV/jT9q4a
 ZWflDTDH7E4apEvzv+jfbj3KrqzYmm7nCAPqf4X1R5y64zTMUsDI5ytu1iNknhe0wZIeyBddqH6
 KfKPaJNSIl28UFkHf1n8p3iwtPBOPG4pxNv+FEhkZnM+15lKnyldRGSLPQPJUTJfQ05H9z3gEPx
 auEaT+CpzCtMSa0W9TbyZyRx6QDBuVBuriwJU17dOr6LDKmShXcaAxz66EtrhDdY3OHtAfVSrw5
 gwJfv4AdRf8X6J5nk9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> With the cal_sleep (32 kHz IO calibration sleep) clock running, the
> HSIC PHY engages its sleep calibration: the strobe/data pad
> calibration converges to different values than with the active
> calibration alone, HSIC_CFG reports the sleep calibration state, and
> the port no longer detects a device connect - an onboard HSIC hub
> signalling its attach after reset is never seen (observed on the
> APQ8074 Dragonboard against its USB4604 hub, by comparing the ULPI
> register state against the vendor kernel, which never enables this
> clock: with cal_sleep enabled ULPI HSIC_CFG reads 0xab and the pad
> registers 0x0f/0x0d, without it 0xa9 and 0x10/0x10, matching the
> working vendor configuration).
> 
> Stop requesting and enabling the cal_sleep clock.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

it seems to be used by the slightly different xhci-hsic driver for 8084 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
