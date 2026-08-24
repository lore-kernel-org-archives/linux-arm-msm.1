Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255D429CEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579086; cv=none; b=tsgzpI6rz0CHFAKGXAFEKog5cd/VU8HIxyjXefk9jX3u5X4L0q43HN5CgegEv1btVbcbb4Rlk9K6IFGq6N5NuaA7lsYntjFSMt6py28ic1JvX146RKPsOu2hcFKpRNbR42MgEiMTQJDRSX8HTCcXitqPtpQAIdP6pPLanTHpK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579086; c=relaxed/simple;
	bh=hv/JP8KtSbG5GQgDD9yQqGtkwO9PPFQFjzg9Nd11E1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYB7RT6NzoSSL0B82AljvuFrpISaxcrpM8PgEVkHVT55Z4u8U9a64wsILaxus46Mgfy9rFL5feT4siGw66l4pLA288cjjN6DDMD0XQMks93mD2nwYmv2mByKdS7cipg9tMNn8uvfpwV57TdSw8HFPSlwSxOi259WK9AwAi1HpEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwwZxt21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8r0Zoaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwwZxt21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8r0Zoaj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv2Sf2950653
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=; b=KwwZxt21D3myEBAm
	7DSZX8i8f0fMaPlwsDRkV8fx9kZ2ZROElB13OvNg4neVfR4vswEuzbtke7fOs0JZ
	GcgCVqqzDEPprFEGJCfXkZXjYw99FdivGdY6ZGOeJgYD4JpUOLzLarWYuwYu5smB
	zAsCj2DCR56DyLGV/CL9OaPK59bYAD1ov/nbXd1Ji4ss3cTuKOS90wWT044pYWpg
	mtCnaNt6RHKGDsYjGIC9Y/Sf8RAGsW+beqGyIfRpX7arTWj4BjxL8YIiDk/Io1Jy
	GE9HH+aFvTI3sWxh6IHNkvltdPsPGtaQ8YBFR366fypckhMla48UUZp9R+J71KlL
	Pt4VUA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r1d1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c46be4adaso45981241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579078; x=1788183878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=h8r0Zoajedv9kyh+8ujt38E3Neti5hAd9/HCNHJDc8dDj3ikzVaY4Lb2qYtbEbb1O8
         4v+dJz1qMIIAlYghieb4zhUwGWDTIJlssIpadbFaqk0OazdK6hiYkvAGisc2iNGDHAJG
         sJO7fBsHr42/OQtiMRyqXMEUn9pYd5jH3ShoSzd1CYdlFimqm+MKW7F5Sj8E8+qmkGxM
         6eZU8sCRclJOndeZWhbGWo0S6g2Rq2Tk4LrLaj8WziUopOxFh0CklDul7PfNGShlbM0O
         4XHOFeD6hrhpdc5qC2zq4MZJ5/WLSzMgIoFhiNMb6O0YZ30Ywf6TBMI+lUY4N361mHfw
         hyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579078; x=1788183878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=l8KwsbhO/yhkHaA/S7OWzTwvpOuc4J3gdQXYtQfbvstl4J+4SjgVr96Hy9dhPv943c
         Wm9JBA6BgJnk6BUWVg0dwhLj5yGoE0OVYmm1AtkSJ0+Ql5l1UEe7gXJth8oPeCPlC6Is
         geJEWQWsSRvt++kn6KshpDFXgpf0O/dNR6Q5+Ksq7TMJJvqMkVKZnPFeEeoiEjZcjEx0
         oBOBuUe+zo+XMyt8LFyp1Ig+TV43oa5HjDLkMIIRQDw6dtevvOPy2ep65SXcoiZlZktW
         ZgcTk9iiA+A7VHksIvszoQUM4RlWWxKBC+7WE1UlCfTCAx5LtuKAUJHIFYPCyHmmJzvT
         okIQ==
X-Gm-Message-State: AFuF++nP+GvGDiZkfyCwq3+NpNv8j+By1F9NkVpKAXSDC5AkIOrx6+M5
	zP1GXZiyDT7GU8GaOipnfxM/XEFRTYL95Ai0UjyQeSamcI+Gfv8NxeFqLTuOwgY72nh5fjBEA4Z
	cjKVP/6vy0C5QrI94+chNAgWnmx4pufo+YYeg90hIxM8Be5J+8Ct3fefkcV0+bqFBnlP2fd2DlD
	JB
X-Gm-Gg: AR+sD13wiSYfBSrve9JP2BSa0Kc6vGuv73yJ07iY+3frNQJWdzZEoU5dqrn0HQ/UWaa
	DkJPp23p6+OH6npZYDu0hO64GX+cg9CAX58E1OiwhJGFlQdyCReHgRrs/jw/5OpLO7nfZc8TUgK
	Hx5LX3dmmhfJlSYXdKpUsWGUrPsfGRuHqku9juBWBVffl/7MVILGhe2L21vCYukd1gcS24Ae10e
	K0SGFe7iBJj1stv7Xy5H5tzIt/jA9laIWzERErMdN2GWYoqQI7XP52owTF2KZNgIUYRgpIl9aM/
	dgH0xXQ+CJKitZaClfpwZ9eGt/8zSCJi0oTWKuoYLPzPLMx31p3t2fbUuxiKPUsk1VGP+YT8CRN
	bA6IhX4N7lfgfMQMcqV23BOcH
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943902137.0.1787579077834;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943880137.0.1787579077333;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1aeab9sm10043455a12.22.2026.08.24.06.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:44:36 -0700 (PDT)
Message-ID: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:44:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX7iV7PhBYiU5h
 62Fsho5yDBgzwLeOEDOutxJTUGRA3sumYn6mfi9qVd0zfxzFS02VGtzT+G479HtBSQUkZDRVeT5
 ULHrmiAjog7hDFTcvam5RBe1mSUOafi76pJ8VqiEdAAWERL32BYqPFAZUGA8n0mMO8qSt7Ybtbx
 9CKpoNVei/jCF13VVLqn873wGD0b5bo3+paNAUXw8EnTO2eT4YzEQwJn9LCHEPeXdwbtG048Q5R
 W3RAfqCgYqKSOHr4yJpoRwUkVN5iBM7ymD9UgkmzMudMCkCoExecVzL7tksAAyTvi1C59rEg+lG
 qPhPfCxS7jTBilB+XHS/uGLPKkedY03psSsOYMVSkXdTpQtg+m/Z3L3grsfYpgaeC58uAckqY1b
 6vdeCjaR4d4IEQYVxbZv1aAxuTcqHHg5QGVzn5OjzsCA9pfamzE6WxjVPOyE+C3X6pAOwSyrtgw
 RimXdnnQIZXmPmk8BjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX+GtvKuIycmjU
 dOpwmCCBd54YQ6KXm1v/6qh7aDQfXRal0hLBvnH9PVfHm4JjlTEzYZcxxDy61EC8MZ97+dNnabF
 efudynzQ8CJSxfNUNNYYPe8ZVvO1dA8=
X-Proofpoint-GUID: z9Yn_YWyOtm699haNRZz_22WzwhiyJZT
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c4ac6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=zBKxk7NNTVBP4RM8Aw0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: z9Yn_YWyOtm699haNRZz_22WzwhiyJZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.

[...]

> +	if (!strcmp(dr_mode, "host"))
> +		path->curr_role = USB_ROLE_HOST;
> +	else if (!strcmp(dr_mode, "peripheral"))
> +		path->curr_role = USB_ROLE_DEVICE;
> +	else
> +		path->curr_role = USB_ROLE_NONE;
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (path->curr_role != USB_ROLE_NONE) {
> +		of_node_put(controller_node);
> +		return 0;
> +	}

IIUC think this is a bit of a convoluted way intending to say:

if dr_mode != effectively_otg
	return

I don't think there's much of a better choice in APIs here, so let's
maybe just do something like:

if (host || peripheral)
	return 0;

directly (i.e. without making ROLE_NONE the "desired case" as that
is very much not obvious)

Konrad
