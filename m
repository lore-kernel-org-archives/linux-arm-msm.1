Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB149A3C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994172; cv=none; b=Hn63m3CTk2psVYx2Plh/FYMf2weFkaYbmxKyA9GEvB5nlnFAOPIMKPouIY91bFxMxvt8x/Z5TxcJzM0GzT5zuL12lymd7QdYVUSm3OF3vgIAyHnhTrMMB0kygpg9HDH8IWPKmHhql5xsC5NUvNvuomfhm42PXQakDhwbDunCmck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994172; c=relaxed/simple;
	bh=Q8tNA+Ne53BbQbai86auz3nmCKdXWW4PmWnHJ8YV9OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/5qQQHTJOPayaIgU5zHQXxtoiuQPiZOqmDeE8Ij+7TjySiqAyMcQCzfNaeDAdicpQOUL0zYlt2Qz3W4pg8kAuPOiymKlDb0hBK0vtm7aDN4VrAO3UaSqpvKpnzKRj6/DiY8M3FjvXvAjQDfvZQNNp5uzbRpVHsyNA65FE/Hh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlU7nzRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KO3pAnWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlU7nzRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KO3pAnWu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe99H419329
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=; b=AlU7nzRDBpSSuNix
	eb0wQsDhnrHeBvnGbnQoHxGgITZOsjx29VgEXZtQK4n9DhTCoHVCYVlLm4ljUmiB
	S6Vn2NMHZTfu4LWeu8f5Qw3o34ThbnEY1JRzndM1cqRtxj4kY0cg8C8bfwQO4qMB
	VnVeuOrc5HxMDmcrk1lVds5r4hML/B0fug/5+8nO8hUm50MKRBMKpY0tnNBcQHcR
	lLx3QhrWVXOqgtCsw8STV+Zd8A7TTGa5nSMOqWQc1rsLeKMd3mrktcWGIMRiRN3q
	/ZYbAstFIi9pY8KwBPl98ijK5c3DBbGC1G6VxC3Yb6qIfyzB9+Ae77SkBIRCTi6v
	ezt6CA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq98dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:36:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso90473e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994167; x=1790598967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=KO3pAnWuTqbZNUz53RWjz0LKQxvHvJbc5Jpgd8/BIsvHh/tq5IaeW37N8q98nP2MP5
         R+qswjEV3uUvxMtsq3ysehU8vx+hLrT5twoXKGB2FpdPe4BFUpkj3qlU3gI84P3PtpUw
         muQBRJ0dyTPGbSpZ7rTYxbP20zS/wzuSLT2hsna9z4LpvYljnrAZ1TmZZwzTWIu6cPAA
         ziFFn+jfJ/4gb2XXw16m76adkC6uaJgXQmIHc2wq0KNehCF5b1bBgVIcjtTuRzSA2xLc
         kSxHovt1vdluuWIjzBGt43VcbePzSSnNgDWSmuBtSQ6T9n1+LolX0QBE2VLVnuoAvfo7
         ovKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994167; x=1790598967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=IvhLSZ3+ekhrkLUHwc92RrQdfx8jpKWRA42n+YE6mv/LfHcO2ebqZZKk3ZP7QBZqT4
         aAor6K3NGLjqY7F7bd5sFa9KZ7s8roVSow6sKrOGl0tQY1NemjMm8+0HyV0EwrO8661B
         /A7rqJ8QvAfTAFHX74ZVxU3bWSREbYP0LdbAnxIZQgFnKTpEt2wvxvmDIM7K5XVZ5mL3
         ooHduxvahAMXNjbIqQIU8Y7rHY5CRlCBWfSIH0DQsvrFZQM2h1Q460eQ6sfU4j3UzUyF
         JHHEJUWg7pf8bNvZciQawYIMKs0F/CftMFQzvlYlCTk4epbwtyChyxIFMPHVnYEL1i9e
         SGbA==
X-Gm-Message-State: AFuF++k4v0iJuMlzWdBpWe3TNf35F0xuiuBoyTIDba8mav1BWFDeNoDO
	QMVtry5u3CPW+F5c0K5KWUsQXXXFF3T2WGyTr/3AcHgdFNLt2upxoiGEqBD6pS7xGY6EgBKilV8
	qxmQuVcFSCsB4SA9yGqEjhld3PvYfyzvz9uoAhCrvUC0lN/Wmoh+xmyW2gcwlTIUc8j80
X-Gm-Gg: AYBFou1gWG7Eddv2n9w6yDC2uaQ4/gfQTx+jXCqBoUTqZGdaQY//IFW/DiqgZZM5+sg
	iMTZ2tq5yv4lJ2Cg0O6urTCxtXEjkaKjS4fw/OznI1nlrXkoxw55BzC+yZHDcRZU4NBMhLzX3nv
	p+r77Ta9RUH173mChpBUJnEdhmAW4WnnFMh3898AWb21gv+ejC/U0sZoCNjlY1BWZPXaTgs3Hxr
	5RA7mpOaHvkpDYgzw17WSQw5hjAnOD4dLhmp11z0AKZmXRAGcmpOkeBKpRYxyHgrCH+mprc8G4u
	fwWnqta4clKMTjiwLqygg1k4tcon3CFL0XVpWJPBiLHjr5b2vWb8aQ+PMSth7fgWMvHvKbPgejL
	U4UbgxqRvVsw0taAOZlobhw==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310897e0c.3.1789994166581;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310850e0c.3.1789994166135;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7943e8csm1941019e87.30.2026.09.21.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:05 -0700 (PDT)
Message-ID: <6495b9d1-fbf1-4ab2-bbb7-2ea20e82a1e2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XFGNf8TRAqHOpaIu2KQpTWYoVUZiGM3x
X-Proofpoint-ORIG-GUID: XFGNf8TRAqHOpaIu2KQpTWYoVUZiGM3x
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab124b7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKJJLf0VuBcF_oTi_k8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfXyxuu8nqM/UMt
 ou2mC46eSupLI9q2yvqjTO8SIGMJ21y4b79O+qeno6JfL8yvOC75f7pL3+kg9/Lrhv0hGrL2XK0
 DSvKzrLP8/Oyw+3kclsnHiRPdZ6ja4bzZBgb6Lm3ZE5x8lDaGcxe5M5XzNOT1ngJFP9AkNrSENl
 WqTxb03cYfUseU0f5FGphgtaXIQh+DxMk+B353dIFPVPTEaioOSpmBVfS027IDkIQX9KJcaQYHr
 T90IUIWk04bI67za9HXsPG1TsSnED99EkZVB/Y96FEbnzsJF1fh+AzRhHqShUj/VczTf3zHw2bS
 wLdfRKgL3ZNmj86mO1W5ip0zz1JYafmgO/CyhXfDBSVawOojqLHQVJ8VB+2HUOUVnx2bOG2gtTa
 23ZhaPB+l6t7loCkfxzL+j3Qf9r0BydHVpGoXpHjqGR0XlwsQ1tkBYGFmMXKi4Js1ms+2lkizxU
 a/QLRv0X6Wn0jzjGohg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfXwHPyatuHpE1B
 cBZGwKliMlAN4WQufV30PN9oXgEznIry4mZ3twIONsfFwiFwfS/V1KrvarkcgNQy7EhqcZY3Arq
 CNDHvViILxu51wLjBMx8oMVjSKY4Lwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210182

On 8/31/26 5:01 AM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (!strcmp(dr_mode, "host")) {
> +		path->curr_role = USB_ROLE_HOST;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	if (!strcmp(dr_mode, "peripheral")) {
> +		path->curr_role = USB_ROLE_DEVICE;
> +		of_node_put(controller_node);
> +		return 0;
> +	}

I was thinking.. wouldn't that also get rid of the virtual detach
functionality on fixed-role controllers?

dwc3 currently only registers a role_switch if it's in OTG mode,
but other drivers (such as dwc2) do it unconditionally - see

https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u

if that's the reason, we can change the dwc3 driver to match
since the maintainer there expressed he wouldn't mind

Konrad
