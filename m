Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714362;
	b=Gqpf6uIoBVqTcfUNz2HlvedPN1UYonoJYVbTCpBzeh2cjDoSkAJNSJrZ134Yk1Q2sWKa
	 +BhllYosJcYt8cevro/Y9OxAp2pSdfouTYdQrMf+OaXQzJHBA8c2SwQlDgfip/dWW2RJw
	 rsMnjrWqiS693MpI0HuxOSkXGEdVVIfiCKPk6x7EMEUbAqgtARUMdlkYh+3ERmGIocTZT
	 l8WQyjtvAAUkK3Vr8pe1scIbtPaLL3/j6p/h0H1stgIvmfyD4RWOm223QeoLIGjhcL+31
	 +LehL9onLM92K3fSyslftPfDx18GV/Rls0Q0vUSjwOP/e/i82z663YA8MtO3sjFX8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
	b=yZZAsO8gwKZZT/IolmAMtb9rwBajdV4miMU330uWGdiK1hwoZN4ILGktkfibM5SOl1Nk
	 4mo0XRSbVvmECkhGBt2zvpVDqhHkiU5WKvT3ALgAbw6HoTShfZ3pq5luvDY1OEtdLNfI4
	 TX6Mi8j5ccLMGwEMaARbIAVHWc+bSt/hC3WiGPpoe6dcMiswkGNb5HNWBndvLZvNDDJyi
	 tHi6TzjhCR8IRC5tObumY0fkKG9zto6yg8sVgHuCiXWzI3oJ92aUkJLe3Fyfl70F2Gglc
	 yZQ2vblzCg/A7f/KUJR8cD177sMyA4frpuZ3ubVAFZiYgrVH1i98vKHKnKXX92yV4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A46606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A46606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtrwV2834943
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=; b=ldwzgPvBGBcqnftN
	Xv8RY/jQgo8lMmw/5jLTZ+/bVcLP32F9M6jjF9LdRKDrJb6uzqkmNWaHvupCMJsH
	JmhftRmaAsNWOnzfz1ZKUlqP9g/Qe+ad270462y8rRxR+zesePSW2hSroXTNfCOT
	li4Q1ErkLIwM8i4pxc/NgMV1P/5ijGastp8S+UB32IBh5qosjSRTXoSNg3Cg09EM
	Tfz+hsOKRVWb88LsAf+zAZ0l2fk8YlV/3ql+A2mJH5tdwnyqXgQcI3QiB9A+iHes
	9f8xpI+R/NzLJhALop5oIr4BD37HuDJAVwLIx+8ttNGvK9falD9/gzStjnzA7ZRt
	y0I7bw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgmpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f040c6e0ceso67676305ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714361; x=1796319161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=Tz83se3p38C1v0D89CwewiTgagEy0CFroaeyOzdVtjWd9kUHUCFODHhFnD6liO09Bj
         xdSZ+1+WBFpu38kYr+5/v5BoTJvQtZbzT46kKM9qDRPvXrm/hJe5UddeQrqexcWbDgUs
         UanBdtWuygWMxaCT8xca8v35mMw4MPHwPl9xTdWYXpg0HgVJWEnXhQDW7NE4cuYHEmdq
         SGXzEO0/UI7kp8JtBHoJJ5tzgcLYaPZ5c6a84zmIL1anOTPomay8oHQrZiqA6MulRWYo
         prAAVJy6SE/+BcvCYT3hTjCa1Ew5SqB331gl5+3I4vtEHeYT/o1T2VZuEMFN0001GwGJ
         XF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714361; x=1796319161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=ZSxzED3YtE3tHySt6OLcMsuOauhruHzsMNrZmbCYfVyO0v2sEovynUkWtPtyRE91+g
         NDNTmEWMFqImLMkBrfCZk5Q/o0eXQuesltg6R7IWAt0AMPTsR3baGmCkWhfB+rp1I9iE
         UJVPyMCGZ4W05ooY/sMErN+LrwNPVuEzY3IhRzP5K1TybdbTKYWUN8kBqqGSugTWH8+0
         jt9JF+haRgm2bWF9QPiIXOASIUVwMMY/S+9Lf0ukrXV2zFzbX1B9LnMDEcCUFAqeqqfa
         Y1GbKqiEtGjGyn1JN8kzOI6ZYY/wVIw59811Sja+guSR0rLmNib5F6O7kVTlxus+y68R
         eosA==
X-Forwarded-Encrypted: i=1; AL+hErHnZMKa8J6gxEG8fvIXi0e6sx4hxyzoN2pdpX+r/xw2ZG0wFUbFbOBs79aFeAwePsGbUR+q0ozGHyxlALGj@vger.kernel.org
X-Gm-Message-State: APuU4Z8lLrFq0NcbRKuYwfKATACShWQ1W5gjru1XLLJyy8ojyYC8fWSP
	QzTn1LWRVualHCh0exTX4v+XjVdNs2cnYxpWNAGX/tVz0UEXa9KGqynZWzeb6n69U24ueoL31ID
	C88Rgi3206uiE+727VwnwQ3Y7WDfPh6ByM+oxLNoB++92OqlCpOWvvH91jpiXjOPgDoT+
X-Gm-Gg: AZFdTZeiFtK1EyyWJAfJZ8RHuSsijMU9Q5/MIAPCcqZ2G7N+hRy/W6HfxMTC0tHyAsX
	/KrpQWRuRQvGfzUcVDikrd8cOCsrJ6VIL/owO085zDakeA6Ez8XUgxS1xyaMQ3vpkFrmoa+6Grr
	VeZ7fLf3XV0UbLt3mXNxUyo1QtvFS7bFT0BluTazjhaxHm2gD2Vy4hX2rv+VNG94UpW6eLYNw6M
	tvptNBuSR5NQWuZfwXf7SldIxWat8uznryiYjLhp8McfSAfQwa1sDPnZBZsJm4XjQjonK4/uFVQ
	ufCjz2dFeC+TXkit1QxAGvhNAQHbLnLs2TSzA4CjRDRim3HwBIwXY+3SlmOeUNHIOPVMvqGuquX
	t+hLcoUY0BKsaX8dOwu0SmHQ39axfIb9e0CTK1himuLstTrcFgJuqYHtLv8DGHMJDHxgCl4BCEW
	OVZ/uyk/v1z4hxQoC9/Tfdc1VYp+loVM2HHnHax+gS
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757965ad.73.1795714361071;
        Thu, 26 Nov 2026 09:32:41 -0800 (PST)
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757755ad.73.1795714360588;
        Thu, 26 Nov 2026 09:32:40 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm49779685ad.31.2026.11.26.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:39 -0800 (PST)
Message-ID: <e01e6db6-9581-4003-b874-bb0a49bc9b8e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:02:34 +0530
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
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OeRCZhAio8wiWfctUy_EYjR1nkyU-NQM
X-Proofpoint-ORIG-GUID: OeRCZhAio8wiWfctUy_EYjR1nkyU-NQM
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b086d39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JdB8cOfk_NMNDU_cp-YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX5gCSk7bBuiwK
 ggu2I7xICU9Ir0pc8GSaEuQsFDjp8AnJN1WUxCEPgvJiSR4c+75uBi72GumLf9wHN7gZbjzvm3N
 tSoq6rOys5bYfNRMcDpQkl+MMvAGfRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX0xWh7LUwfSQe
 w42QPwSs+yipZX9S+AJotUPwZZHTUVATpy4aotgJvetH9ThB9WnOK9Vv+D8AB4X+NrvxDMhZVAl
 txzHv07fiEKs7IX/XxRZEt/2Kog49pyYGMINaWivB49XbCJrk/fxH1HQgF/VRRWbXGxUuJEm2xl
 CerX8MOJ1vD+Y0jzHx9WuSC9JTI+LEdAjXF5diZrr6HYoXFnn23YnUWD2Kr5AFX75qWICjogzZu
 C6z7SWBcHAknY74m2ZlANoQjSKm2xodi6Xxcw9W1R+MkkDmaR1EMiOoocceemXok+z8T3EHt/zs
 yyCRSl2nP5avy7bGhDWkEff4qwqV2ITmRIKsCabwuf63TVyKtBQmh6D51fSB2Kp5ON+reijFK2D
 Nm10HbotAw3BvcOEYznXbwpBPtl+eLXIPn5WNAeMABBJ0mAndsGx67yfmvXHtMN86hDIiS4rUly
 4UW4bIxqdKCj+3ht4Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>   	}
>   
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->is_suspended = false;
>   
>   	return 0;

