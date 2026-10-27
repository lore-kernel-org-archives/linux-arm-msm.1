Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098261;
	b=It8kHnlq0CHSPExpRz7XpF9UgQ/3QoZs2TYASiIeyD6Q0y0zTcNOEUo71wBfm3wzewuR
	 rkweBUfEvherLnbDtQvLix/95kTnj7eSixw+CH+gM487R+/HL25i+8iKCzf8JoK6DauX+
	 q4ZdxidNa29j3VaJz5FvLoMeC6WPKNXZgY2sSEKLEpBwTkLFb1vQbbz8AYXnFoKH/32vS
	 2dfOa4rhhWyU9Q1Hb5e0i3GzG5tApMvYIOX2FujncEcnEBKRB13UJ0yQzGgqtnImpdZrQ
	 X2zCbSim57aMFGuB95Qc8WCwd/bvdQj+7H2T4BPmjFIx6s3ADEf296Qh3vtTwpKMwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
	b=MBx/2tP6GC7OjnLiHIIXAxqVk0ho9bdpa1qPIKw+ibMAeQ9EY5230cyF/O4LFIQo3FMd
	 hL+uhry/V0jkbiikJ2GjqQe4bE3/SoojQcVQj1IIixXEqvq5lxrgQFhLOpUaSkMYlYRZJ
	 w/WqCd/6RuQSwAsHb0aJH9BYsE1qojyfuuzHkFeROj2WpD4jQbY/Tqab0TfE0M1jbU8yU
	 WmKWtcl9EV2J0J2D5F+hh0AF+wn5czLe59l1HW7FUn7oaxbGMvMnTr0qvZyDALk+jVhL4
	 K7VtASa/Uvz8tqSRxSsdTYHSQ+C3hC97GCQgwwsq1VbZcMUJD7V6f47hY+P3LxjnTBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fE5XuFVc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88C60A3817
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E88C60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fE5XuFVc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1uj1614691
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=; b=MSykaSTbVz4cVpJP
	W00TAT5epw9ybQl4cthSPnp9x+GSgX8L3NyPaFpoucf0Kn7bIEWzWipawrbAwDT9
	ZkfrWRnF5/d2nvJ81oqbtfD1fo1oKAuqcfgguJadZfgocV4JLiOjLbLQzTdVOfZP
	8+3K1HJj1oYQNSrIef2ByCkxlyyTAaJ6LNH0HdDkecXGl2xp4JAuvJbyBq7TtafH
	SD+pu0p4+usHV8/iVFpewdhdJycp0FvSQ9VbP7ykPpnaQjuAL4RSwU1c5owvZ30H
	QGfu5ZfOw93rRldrE1RdWygi/hgBBSUkvMOBCznzIZ+2RxPQMeYkOb/08d/lRzDt
	eiugHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rsd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9178ba8eb30so9549656d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098259; x=1793703059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=fE5XuFVcE8XtOue6YjqTXYWeiIVHqS+AFAKxYZDhytIC04tZU4JVF/t3POPZjm+LjV
         DMFECLuZ9MyLeWM4e9zFm74012AdWJ33F/3MJHvKbq4bbxcVqyk3apHrScqG42r46dSy
         ZqX2Qowlib3B7xrsYHjIx9Pj6DbZ9k7dgYaPZbkAaTHHPCPg5Mq/c8YtpRfotsXfantR
         OUu7qE+k0o7fRmQ/QZtc8TpwIXO3oXeLXfK3na9TpeX2LAJ+T0Gugv0vHGMecx8VD784
         OXsO8V9juvq0berqbHJCZir7iLsECrxXlByH4H+gau+jfs9G/FJ6JQgHrPNdbLIIH9Q8
         7ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098259; x=1793703059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=GWz+GYXj0mNfLbISub14X7MgFBpatX2FcbnET2Mil6JYBmqyYRDldxHQzJ6c+wyUx8
         OZnnsmzTzSKnxaXTD3rmGmK0wqHugUcK7Meqmxbf0Tz0+up3bUGUk6nbLPfW2XcN/8b3
         k8hdzx4XfOAym3f0QDWM+P4Mzj8/5w6brPwrj3P9UxqqFx9JJShdkI9eVJ0wMLvIEuRQ
         nIxA30DYzA87qQh2tgDd8+AVicxWlUW6ekjrH1CAehNVZ+66NZz4XCxrCjVsODgqd5Ps
         eoUmYaLXZJfyFEuQwyMLMepmfT5o8FZVTgNGbXUUAjuPeNAXF2agOzEdTUMzSm+n+tjq
         MzOw==
X-Gm-Message-State: AFq9FYKCGNu0A9vno2f1f4YgTHAuAu9Su+1NWz3u21bClYKNSyuwX1tY
	VB2ALQBqdiWi/4XWc2Vir2vtahHu5oWbJUdypGlRCQCVWXYM/Cc12gnJl/M+uvN5xn9mdfs/4Ne
	/sv5T4s+9ZMMn2g4TdAeK+XvPtrb9pPIfJu9mFnOHEnwFicbCGeR9ehK68RulHWFmkVU8
X-Gm-Gg: AYBFou1EGGUDZUqVqaJpi6TkzUUuYiijkldGxEYUettD3mEDpHWgbXMOFm4WU2UF6vI
	F4+leDjlcIoS217Uxy1hawxOIg5xa5DAOjnlIjC8mUPJil3qjDY5ryf8P0luIAH6gtOP6GoTfqu
	swQP9VbdE63WNWENiZfdD2L2VTjdpccQXeECEhb5ignqtSJriy5zOXHL5B7bdnnuKFEF/1OFhq+
	CGgQRDLoVZlkmZIC5ze2PNv6O0n4s2Z0gnHmR4Nz4yj7o2uEjIN/ooPyE6JES9LdVLQd6zWUFd6
	9F80Qc+sGgS5lxHCXXN58xFbc+KOYwcsH9IsAUyCrMOxyxY0zRqdmbAMhOYyUnthXH02+2Tw4Ss
	ikHoK+oVrdXDXkvpRcbTj7A==
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413331cf.2.1793098259608;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413101cf.2.1793098259161;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm430409566b.64.2026.10.27.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:50:58 -0700 (PDT)
Message-ID: <5884eb89-5afb-44a7-83f3-642efcbcd284@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:50:56 +0100
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: patches@brar.si, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-icc-sm7250-v3-0-aa303226298c@brar.si>
 <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzymgwHME2Y7P
 05qWn+ca2bu7R9pF1+NW1HwIRm268mH50u+mXcfimYvHVly7vlNxp6j3OAJ6e4ZtQqA11QLBWoR
 Rpyu653YS2KcBAMlFQr051u3OUmkgC0=
X-Proofpoint-ORIG-GUID: fWdB4T15XdOD5BYlX67RAWqYPUGvQMf5
X-Proofpoint-GUID: fWdB4T15XdOD5BYlX67RAWqYPUGvQMf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX7quhbwGGJf1w
 WAfiabawvBNU1h7QK6pYQikPneACKYHYd8Z89XuysoE+jL/fXbiPXY34KXGKLC5LgAKblg6k8A9
 fP54iu/AIXcJrjkLVS1LWRmRpujsWBiEU7sE1D6QjDvqn1FUP2qZVqGlKldWNbZdD67X0SECbeA
 jJz5wrA8+LTS7Y/GSx6Lv13ZK8DNvvdUheLS/shg714LbEkVxGr8+sWi8gsabB9TJzJLVbXYN6Q
 iVl3Md9HeyfF9snHIzmFw9Uoe5DeVqzDTZNl8zvDBcYR8FPY9baNMkaWZEgTWhpTKwuUZZLxKHI
 0XTCW84Yd9IesV4rw6D/UA2xIqB7h5LZbDj6G6XbRiWrDvpqx9P/OfRhqDV9CYbeJuSPWUNFUeq
 A8zUkEuiCOKNdUwamAVkYt3C2oZ+BYWQqzb6wYTBq0VIJXPd7WN0AjF0T3L3aLu/jCkbelAj8be
 l9PyDhCYTERE8xt92Mg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08214 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=w78OluAnvVQzWo3CabYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 6:48 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

[...]

> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/interconnect/qcom,sm7250-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_a1noc_cfg;
> +static struct qcom_icc_node qhm_qup_1;
> +static struct qcom_icc_node xm_sdc2;

You shouldn't need all these forward declarations

Konrad
