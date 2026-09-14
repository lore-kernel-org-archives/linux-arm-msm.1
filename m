Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09960420E9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381545; cv=none; b=F1obCMkxTn+sDHKzpdc2SvihlvzMzhvZ4Uynv7c3OtvR2yvWC1tuRTe5BljVB1KEC9fBagKSI2UJ9osK70Win5FuEYXownyqGHcsB94ZiNhjI6dminD1QGaPAnpS3pQMfKPG8lGu9HCv03LEbAzURIs9P81CGkQ6o4n5moHRjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381545; c=relaxed/simple;
	bh=OOWFS0fW8PalHpuUVagUzGyLfGec2bM6XnZpla9OrZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuUQhoANKtyeovwOltLO0RH2b3Lm0gk0pquUqHDYnqNnhVtAaywZ7SPPnIukbBG1Jt4XOyxef53vOsWfK9pXgK+nWrATPeCV/Zr3Xg6Sxp8g8rjEgHob/SyKk1PRF36PFCW5GpgvJBQNgqHjYslI907VE1I1IEY92GQKqdgn2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnzhIN5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXMKi8k8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnzhIN5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXMKi8k8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nMa33663328
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=; b=cnzhIN5Vo1Za/wEv
	iMIWGnZ/ZNlCOPEn0dLGgl2lbE/Y6zmJQxqkHWj1HZ0RlzzbH/X9oJIGFfx6uUss
	YlfJAlMxBA5Sif3PUYnaLeijGTGtmxszQkU5gPELQQpalkZtnGJ/+2zFU/eEn0F9
	K3FhQN8CTJfXQu4/ZmQS4G5KTDbhihEpcU7MsX28EpFVnt1f2FcKX8TgC0T25+Fx
	XO8+has4seybPo68RyZrU3k6oeLScIuHpDdZHbogp/55tx0WYZRS/A5tMhVgaPSs
	Mfn89sTqStt53pqGs326mWxWdWnwKnTFSnOBXcQuUfazkO0apCT6m6X0fLivrorR
	1yIsiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0k84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:25:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so65142385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789381542; x=1789986342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=;
        b=LXMKi8k8BGD7f0yXH++i8uRRGqOmZNchiFOtB2cT2zErtL5YGzWqjWGAc9Mj4AN2jh
         cR+KxCAP3BfRhXkvN7Vpa8mDubIfaXddtEOfVYa16dyZleJ1nG6ofZhwniIDTfxdKPKT
         aB9PQEk+l+qgs8jbbLQGNgg0IZ962RWb3afHbaZvl6BHn+GThPRoEaqkZ7higWHED2e2
         ADqqDvHSbRZBTbDw0Dq1LoZMspiZq/TbHQXGkLx9pgbcAH+HX7hg8Np1qm+iZUoUggaw
         ppF5ZTEeNjCP6HAGLkx5SCYFSIPxnSyiX0oPIu7ArALLZRUfpSgLISeeD8+ip2PPEyLt
         n5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381542; x=1789986342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=;
        b=nxylBx951yWW6A0BY1mNc+oTYEmUz3bmzxVT7KH/RAbbhFExAus8oOgFNPh70xuk8y
         eNwVsA7o4AR7Dip6MfkZHLR/LgDbt+gyt6NnTyxCOH81YpL516BDbcYYqvwqhr1FjXIK
         4gI9HOXGOk0si6/2mXknrVZwL1HiSjOQstC23GZpKNXXSe8RCDbngckbazBcH8EpBPu0
         5nazsO6btNCH2crb8Mft1JVXNqQNFtWkZtRcMoJo188W1ORWo8BAHvQLz2KDbSt7N0zy
         gTYzTf/G4zV4cCuXddh7Pr1ErCW9Z8kuQuOVRuaErR1xUrGsmG4Mpe2Tl7ZoOHlvkqrg
         gwig==
X-Forwarded-Encrypted: i=1; AKwUvBzYIIwnNaaTbd92Y05SjjFXozEJD2rjekPPds1zUmJTao3r9hxnUjl/NJo5uiFskIOoFQyPs2K+6vypEHVZ@vger.kernel.org
X-Gm-Message-State: AFuF++ncjoUMCnb/DkTcWKLeWq3jzMKiAClmsl8jHKIT5NZ4vldVA2n+
	BIB81T/VeLAWX7+7Pikh1Ak1Mkm4jjpmjDPu9KMqmIIWuZ03rFP+Z7cnAbvPVuGko2M2duaJ+j5
	DypNNVJcf0iHguCeINjGKymJl7+tGX566o48EiTP9pyAUBQJzRB0YeDusBVaQgvnadeaa
X-Gm-Gg: AYBFou3mbCsoE4WlH/Tu36uEX3G+3lPKzbaA1ngs8xiaYJaeCwPNxzZ94AOA4mRvhTa
	REykNLXXkP3uwCvHd5XFvaST+W+2P6oh8G99Jx9kJ1se18PNwlVRllnAGJ9TpwYQxMfakwo/Ghh
	GDkkj/B5d2kiWcPGQHbriYEn4XvvZQ4w0MwjICqcw0c/s9PYidtxRR4pv5+LkuK6BZx8A6HVDq4
	RnOw7l0t2O9Yw1QLOPkN/GNiwxkH3pCo3m2leuYo3BRwrdNEDQR2RfLKtjU6/459HFyDdd+rx9g
	ATM3rNWMtJDEqShJ0PjmVdXOU+Pq7OGUrkWzzvF4VnnqckYYUYHPPJAfUf7KQ7ZAaUqsBdi+DXM
	UsFfPLlrF7SuD4/CmI7l2iQ==
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr211355885a.2.1789381541937;
        Mon, 14 Sep 2026 03:25:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr211352085a.2.1789381541452;
        Mon, 14 Sep 2026 03:25:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm404140166b.12.2026.09.14.03.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:25:40 -0700 (PDT)
Message-ID: <b96659e1-d2e4-4272-8e78-8042cd5bca9b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:25:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: typec: mux: ps883x: support TYPEC_DP_STATE_F
 like qmp-combo
To: jens.glathe@oldschoolsolutions.biz,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260914-ps883x-disable-usb4-v2-0-523c32b4e4d7@oldschoolsolutions.biz>
 <20260914-ps883x-disable-usb4-v2-1-523c32b4e4d7@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-ps883x-disable-usb4-v2-1-523c32b4e4d7@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7cba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gxl3bz0cAAAA:8 a=lhgTqZXDA9jZt3rOk0sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: AuscIk5X3MxNo9jPT8ROg4XIZ6_PDpF4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0OSBTYWx0ZWRfX/PM/fB5IURIv
 U+9GwYFKlrAu+LsxJlYc/yzqzyvQnAr0/aOQvebT7+FG1HI0xtlRWCRKmM+M1bv9dbOR3nW+0CB
 C4HufudmonMFNe/A7dA8aW6Ci74H4iw=
X-Proofpoint-GUID: AuscIk5X3MxNo9jPT8ROg4XIZ6_PDpF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0OSBTYWx0ZWRfX176nql3tJILd
 bJI5fMPh/55Aw9RqxcjIjXsNoMTVaYZ1Juw7DSJ6kACDliFdzii8nykk1ILQSe8diY8uPIr56WN
 zoFBtmobyMPxzSuhQzH7QfvR+R2qnyW5/zHaNlAxm+TBwhYyEKJSfW9uzigq0YoRWUwE2XeZNky
 70U8KKzCr5NqIh61q4HezhSdMSWoZei+wL+1eovzQFyv4kNnMx0D6WSUbItUL6kAr4xsNfiHqLM
 p5KjXVNp70QV4w+FKBir2q4EqnOsfX0OCE9ZNwaAl6qAgWfq6dJkRBtewAreMfaDOgXFechZcOA
 z0OSaTGqzhQuSat+Rde9ySZHpD24Q5bDn6q73Ta/LF4MgrKlmy0ZpjSM6Nu8eN4zrIrOh8XWese
 6h/ecIFC68pUCPlPm3XSvimXZvJlwKI/wAA2gR4gs5jfZPpNqWxgeEfNXx5LW2rXwQxZ4GgEmN7
 Vax42m16lBRL2+XIcPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140149

On 9/14/26 8:05 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b).
> 
> Keep the handling in the existing DP altmode path in ps883x_set() and
> mirror qcom-qmp-combo: pin C/E are DP-only, pin D/F are USB3 + DP.
> STATE_E is grouped with STATE_C the same way.

The premise here is entirely wrong, you shouldn't assume wholly
different hardware should be programmed the same way

> 
> Assisted-by: Grok(xAI):4.6
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 64e0a61b776a1..c185d8897e3a4 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -205,21 +205,24 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  			cfg1 |= CONN_STATUS_1_DP_CONNECTED |
>  				CONN_STATUS_1_DP_HPD_LEVEL;
>  
> -			switch (state->mode)  {
> +			switch (state->mode) {
> +			/* DP + USB3 (pin D, and legacy pin F) */
>  			case TYPEC_DP_STATE_D:
> +			case TYPEC_DP_STATE_F:
>  				cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
>  				fallthrough;
> +			/* DP only (pin C, and pin E) */
>  			case TYPEC_DP_STATE_C:
> +			case TYPEC_DP_STATE_E:

STATE_E must not set the CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D bit
I don't know if that's the case for F too, possibly.

Setting DP_SINK_REQUESTED seems to be valid on _E.

>  				cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
>  					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
>  				break;
> -			default: /* MODE_E */
> +			default:
>  				break;
>  			}
>  			break;
>  		case USB_TYPEC_TBT_SID:
>  			tb_data = state->data;
> -
>  			/* Unconditional */
>  			cfg2 |= CONN_STATUS_2_TBT_CONNECTED;

Stray change

Konrad
