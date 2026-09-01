Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A88340DA6
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256439; cv=none; b=bZSE9GTGgzwLZ7/QryrMb2RusbA4ziv90ZGMBuYIVvtWRnMnyyrPVDsCsNjDjYJoeAuUWNKVRy6uMS3b5nXj5PJsqoatmOmPn8MzWHP6+EIHK3mKURGlHfBgoKT+SpK460yyfGyxU61PhQE3gtZ+4oIUJGcdkP6G900sXF3Yapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256439; c=relaxed/simple;
	bh=kgRDL9cVWy0iLA/oSuxde/FSuoSAnPFNKSuKeLhwR5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBHF50Uv3sLG99rdWIOZyyYhEZJ5A5yQ4+zbPCCCNHOMK1d+zUt6w6TAUqw52U7BFZNENswGNXmjk9eXU4NNxbqHDxL852ydrEdhbvqtuWx/65KsYQeEHKdhCgc+cDGmdnX4/1oMacdIgJDiEKaiI2jobst6Ym88m5Rau8/ItsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdTYzgca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzUfYS8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdTYzgca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzUfYS8J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179M1Q1709660
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=; b=CdTYzgca9HCsxvTv
	9YLigp10IGplNb6Af/RQOTVyE8ykDq6/K/p5MUOnpPNIF5S9NxiUKx8C1juVXyyD
	+DRPx5EAqXf+ookn9tLSKhMJvFBWq9kz2ajC3I6zzPbEcQswYgU1/wkqYriPSHgR
	JQqJeVFugFA6BdQgIn+rQ3E/bjbTGQvGc+6FNgZHy55iI9Ud4HXsx44No8IvK54H
	1IPZ9aGRLZZEGjp4TAGU7NzEcllqI0/c+v1c69QM/zANG7HljJsf1sL2UatNzYlf
	gQLWyv9R2CUJ2p4tVpTC5KF8bJKge1SnlGoosH6NAfufWnwS1pjjtlgmazPRb6hS
	oT6UuA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsn2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:53:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6485172a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256436; x=1788861236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=;
        b=VzUfYS8JW7a/5KQqTOvWin5mudrcAKPj/AhvToIHZHcB3k96i6cU1n53vx80t25znc
         30gNoHMnoCD2c1RluSOJHKmCwi1ByJRczGTbeaEDGQ1337Mzn8f3QYbni+sE5q3uUXrU
         T1jQ/gNV8gLry4O9EY71fwZFO4V6EICyqzgr6mw/at+jRd+FHtPdJLwwp4v0KwADpBos
         A1n7+ujIRmlj3mDKnR4kPHReBQQZrFgey98KPN5chxyiK6qrSKsoTRWkezLQsesMoqxz
         1xrHP69I4uNNrJvATE4mIs2DmwJmTui63gERg0NeS0Z/rc07yuc/RIStWDQt76JsZ2TV
         w7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256436; x=1788861236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2bN8xEh3cDev+OdzW0UXVkB7nRlGhfeJFSfHXmMuuw=;
        b=bYtVRgzxaZCCodtspmJoRCtVbgwdpBBoN5g9VH93ocGxf34tTdEtASwgv46v+Nz7Wt
         u2FdqHmPZy4GzjIUgtzCd801KZxbj1fdVvP+ID0W7Y5WzzYK/VnUxmRw5Dia6EAd3Jx6
         GXUNq3vDUxzPIGdwIt6fuvBRXAFtl/sJvNExUoUYsf0qVGkFwaEWkjlWh8l8Dt3UxuyG
         v9X6vtboJYpyEFYOZXhpqDhLrAfT/aTfxBDzM5cg2F7blPTDDS5Hnt05OwF7SCp869X7
         EfDBCV81aNtcS+ZnYRG9K7W/DuKIqjkYMzWUVF2q6gJMiMwzUZvtyQ84gS2QYxhvSZ+o
         BU+w==
X-Forwarded-Encrypted: i=1; AKwUvBz+0dX3pa3Q2w9ylM4MbUcsCBSFujAH7IzKTEsyCTeaJrcxkCu1UbLyq2moECBgP/Y7M0siy6NXTYqjYPt/@vger.kernel.org
X-Gm-Message-State: AFuF++lg35+ag9VahOErx7mANDTP3506KIyoj6Zi0Mt8twdvlqkunfyB
	4voMArUjOTMaSk+XT7BpPqeQMmdse/aIkl83YB5Ai/NJlYHtgkZRBMUqS4oYSLUvzWxOBcNo62t
	6DTv+ASJfm2h0UTy06zbpLBvKGIHpvuuGtfl3E2BxcziwPrkYZkUZ+f5+HZai+XIZjxqiPyLbD6
	LP
X-Gm-Gg: AYBFou2Bww+keMviT8D9l1qgeCTU234Y/oeqZYJFPdN4FdiStLxNn3tHhIot8SjMPOL
	rmzgf/g6HAYoO0HTSOniFsJ8ie38+7B3RlCIP1iWMFVRYVQhrBpViCQQPk+0iHNyOVv4t2U+Zk+
	08Ge+09dmiRFkVXiURm3+2CgmTnGvrgd53+xcEliNCs/6/cj4+F7jyLXbPwi5YK2IZFIzIciMnz
	cofu5cjV5zPJyNCONOg238OnLU53Zt5uUGm5Np+iIVFZtvnKGUJqsq0jGeXApXz1ZRBOGUtQVMM
	gHL2IJRCtMgkF9P/nXHazi0eu93FKMtfU/Q7EVbV3XU/iCo7FcjRsb2ezqikclJqQ4m4M1BgW+8
	Fb/6LxabyZbCYS+lFSvzcVqa/vo5LmgU=
X-Received: by 2002:a17:90b:33ca:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-396d0a36c74mr46467397a91.0.1788256435751;
        Tue, 01 Sep 2026 02:53:55 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-396d0a36c74mr46467337a91.0.1788256435196;
        Tue, 01 Sep 2026 02:53:55 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm53854905c88.0.2026.09.01.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:53:54 -0700 (PDT)
Message-ID: <5f01f216-588e-4270-b949-2f4b11442f0f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, naresh.maramaina@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mMXTr_VyMb0kM24WxqJ3kNrgK5xSIFfn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX5BVJHYbpVgKd
 pJhFs5BrE75uclVXq1Nl2BTCvsBgNIBjs3Vye6J7NtzGW0sFWwdq0ZGgo2GV96Y/bNf6m2QCCzF
 48RS2zyNjhAKLrGTWeQmem6CFDo5MpA=
X-Proofpoint-ORIG-GUID: mMXTr_VyMb0kM24WxqJ3kNrgK5xSIFfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX8Dvd2uDKpy9h
 kRVJIrOC9L6mlNQmvcdKy2Yxbn0eI+tYa6DJC+WZBiwUtjgbXch5xDwjp/EGYQBYl1CSvVt8OoN
 esetgHx3Cop5UVOuSK8ZzY4PcnNfnv30lIjP3e7UNWp34aG7YzkdWGw6IH/zewQLhC97bchR6jC
 viJ1u0Ji0meKd3Mb7XEDQHc60VxGBy7Yf49jZWhyHL27CC/n3oufZzuJlqprPlRjNq05vTY0nRA
 PDxqEKWhYZ9qKK/DfidlJfzEJi5/dR5Nw7qCEWqKPKsVOu7HAY2sSWoCNXbd/zaEiZJwRpDuEOK
 UCo7mavtiRDGnJYVWZWcG7w2dhdXHhAduK4dwh4EH7ync/EXhH1GJHugPXF1rV9rCmnOnBKjN1c
 8taWTd1spzx6HtolLkcsJ0fkbtCZWmd4zX4+Jf2g6PHqsI2tP8Vod2gM5BEBj+9I+rSfXC609Cx
 Vd1V6M5kIch3iapSswg==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a0b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=avww7BCoVOackQtynkMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

Hi

On 01-09-2026 15:20, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
>
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..fe961b206645 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -20,7 +20,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/panic_notifier.h>
> -#include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -2008,7 +2007,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
>   		port->rx_dma_addr = 0;
>   	}
> -	dev_pm_domain_detach_list(port->se.pd_list);
>   	return ret;
>   }
>   
> @@ -2032,8 +2030,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
>   		port->rx_dma_addr = 0;
>   	}
> -
> -	dev_pm_domain_detach_list(port->se.pd_list);
>   }
>   

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,

Praveen Talari

>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>
> ---
> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
> change-id: 20260901-probe_cleanup_uart-60bb7d0df5ae
>
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
>
