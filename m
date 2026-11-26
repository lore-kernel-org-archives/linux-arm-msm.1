Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682282;
	b=2ik4mqM4l8Mu63IouK1GUTE46NM4tc4sFeLnITf5kofTXJmy5F4hDFPJljUWAlgHXYH1
	 iYhSoBh+dDmsd4Egjr7ZmnsGosx6TYdlyVOln9Rv6y9uTu9voOmp+d+aemoIoeDD7paGt
	 qCdP1ghU+V/eeJqaZzN1lq9sU90SNTEu3jS+UVyVGb0t9J0+BvBFNSqAWToENHA5TUw9N
	 MMP7EWpicoM8dfys9QsWYzDAFIaII2sCInEmA71mu9giUhKukDQW35J2Dqq6FXyjDHflR
	 SPkvXarJsHQbJm+tElrOT0iE2Q/gxGH7PtHy/DToRflbb4aSWqnkNKtV5EW+eniqG/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
	b=knEJ7khcwQkKc+mm57Gq17cx1QRP3IZIQeR8SfM08tbGtCU1csyu+5NB0fnFngCR14uq
	 WIyH2TvziCu8d5XteQ6LQtCipdHSaowtv0o5cp4Obfd8vsV2O9ub1O299IxVH7dY1Gj9x
	 EzEsI8l4Uy9C+tJEPUTKvEILNeWkaHzu3qDs/9TBbHc4yJ9+UULngzBmQTcNqV3enm1eG
	 fREF7geG761pSHQ2IFFNLuaCnzPog50fVIeakFrtxGgvS81/6uIwlkb0YNH0HVyALmzSE
	 UpPbYSvnBoNTaFkYvr8EszeCWrcOcswV32ZoUFw0eMoTKKKMEcSPt1BgN27r9GXkbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fK/KNW3J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20FF606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fK/KNW3J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvLN2594855
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQPx9qKiYiOC+Qu5wRqDaiDP
	oYwCF37v4r4ojrWgYNg=; b=fK/KNW3JrLr3ekiZDOsKo3oXpjL6zpTkYQlblXef
	xJ/JmLp4vUmHcpOqd8zl52ccM/FCqDidbdI5/oPNjfSE+6k9idpYFby+sMvGm5j+
	1aDqoksZvM0QxOeC78NTMVnGoLkML6qrqiOfJxVmmQMl4Xi8TlLT6p5waAQFBei5
	2wK/2cnDYrjZwJKb+38gy2vWI6uL28hROIDoSx4SK761qa/e1bq1IVypUo1zq/CZ
	3NFH0VswAQfCvOq5nyXdn3/r29GPKGdyf2jnnaM2aIg4fpmLJmyMslL+2HeHIPrB
	qIMoI3mMLrHya1BvJhdwf0NX3C6wXzIyEAzsxgKZnyci7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sa81r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so17029021eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682280; x=1796287080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=TOq5g7ucgxhjxObt30jm2lqKyLr0CppaxoGxkuOwP7djCcnh6vTbrP/kk5hQNGjbC3
         xQmQERjAt3eBptW7yBbsNXk3bfjP2G2MAwTINYTcSSC6ceoCAHbX5rayf/nu2g0pmvyU
         mD8aAA6eUmnjEbjfZ16NVDp6mhmUfrFUM+Dgewh0ml2IXLB/6MQw98zSBDuKGB+UBfEe
         ODDO8ASfC5/2J1uurHjfGQENyvPrk0KJ+mQKYpbX6QmbsmgC+cIUWZicOadBov14rTFM
         ibX69BGZJU+Jt6EDopHjNjEKkDtdDMIOwl5cT0VCxftGLwP7NpwBkeZVz1w+fnrgRV+P
         hDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682280; x=1796287080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=igvslTePx6dSXwmvXX7zoJbZX96y54csitpXp8nW+IZ8wZINWfDSt02cb+MiRgwSkf
         MGIlLOebQFLuq9RoQLe1UzUCCcmYOyGGbsa/5ARTX4iw+0K1IfkRPeaP/Pf7IkKfaXgD
         AJsy8+rW72f2jVLxqHN5UC0vGk1sellsAFMeuVZL+CyvGnIKLcEKTrQZmX9WtFXrXOAJ
         dtW47vaFPrALUUtpg8RtQdhWHWqyPVnOoNTOkup6GbJmUJWX9cnc8LSKdA1c6dz9vnwb
         Qnl27SfDp7fo+kqqKukrIdqedkyZexT7Cy+vwmVTP4HJYntFdpUqWtBQfo0t/oU2Hnnr
         ZczQ==
X-Forwarded-Encrypted: i=1; AL+hErFRmuSM5UOVSoKpJ77VrGHhFmS8N/YkpIB8YspuWg+VRRCu+afETRp1evmiLVjvIqbJfi2vkUuJkwkapSpa@vger.kernel.org
X-Gm-Message-State: APuU4Z+6EsVmZW8qsqQEL2sHNyXzSTxtbQSqgk21igNKfZgan5UiqQTG
	y0R7lbIMTZW2Kwv5/8bWgJHIxduJlaqHL1pPBaqH8CnUNzQ0tryNzs4ABP84VwlN9/ebt/61476
	THd2otBYWycsw+GIEUu8YGiKnA7IhAaGUBOb8ngq7pMh6CLbPjiez1BU3jw6dHSqo/KSR
X-Gm-Gg: AZFdTZdkrxQkq8SqI/ljHvDNOaaf9Sp1NoMcIBj5+TuR6hWpUL3VnWoar6WnsJHcYa8
	RU55arv3v3dT3NEBySMC6BpF0nmbMhq5vdEf+VzgfghkWIj3kzar2AEVY/UehQPo793Y9rPBzcL
	bPP7MTENsXQ0/2c7VLf0hIlx5ATBj6Fd0Dy0zrTJ19BfnCpy3ePo1QWGETXi1757+OGuc7QeUDy
	fnRGXhvNWKztMwZ64JReDAJFoUMsbHr5F9bAewG4I65YUDvtFYXM8J/xGW4ZHUeVEM870BJeOhF
	B0kOG/4JmV8tISmDP9F2+1U0TyjL3JHKOI9p/SPlKKHarHUFMB9KgtU1yKNk1w21KfTaegreje0
	r/di+OjJoo8S2OpGV0kwIKByB/bdhnloaNchncu+7dPd7cVR4hqei02sC9W7iKS+4oDvZ5XiI+g
	W5Spg357F7ffq1V5dy3r7fZg==
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18800996eec.26.1795682280036;
        Thu, 26 Nov 2026 00:38:00 -0800 (PST)
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18800971eec.26.1795682279493;
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm27849473eec.9.2026.11.26.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Date: Thu, 26 Nov 2026 00:37:57 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <awfv5SLoUnYlJUWi@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07efe9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPxKJPT4JOKwAKEPVQYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: fLfjCcdBRS6JiZS5drFG11ROlU35cgk7
X-Proofpoint-ORIG-GUID: fLfjCcdBRS6JiZS5drFG11ROlU35cgk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX3CwLmbCaNbht
 lqPq4LEAGkLvfhOu4uyfves+e6ZQU2dXpWnFXJ+iO0YvRCtweiZUeDYUwLWE4s9EjEr9h1mwO97
 hnK+zl6+tPn8gI6rB9YrBujzjqjl0wKYbnRFgqj7/0n6kxWd/3o4l1SLzETjmef0QOk9RV/vJIr
 /Jny7CQqpziwnmocvcEl4IBC8FZ173xONIugHotpq5d1rseubYsBhF1bzvAi4Qene/gbMXMif6u
 3wARLmtwpgL5NdfLvkDyok8Bd7zB7431+Zbp3XYmHqxm2tumd4n9LCWyK8vQfXbkxCk2+j4CCqk
 tEUJApDxOu54JvDncqHB5TS1U8aGAGhRRqP3b4n1VycwbV2I2WwfPA28Wn+/+LwYmJIsl1feSy7
 KKZRao221IjyOW8exxv7rMpNMnrdiGUnVmWe8LahrZov3Woynox2+5mFolmoSbjSKV6qfnGuQ/h
 lHXvs5cYUSW3cFEvzJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX5uAvDc4FA+xY
 /toWkBgf9icxbzHc4aqGO/dWqdnYcYO+Mzzqum+2gBiv+oiLeEIdzyJ8nuTkatIjYq8OnlyOkge
 9gEGd25Mf/VdiHGiAcCeN11mFNTkIIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033

On 26-11-23 16:17:18, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early

Have you run out this sequence at hardware? I find the dwc3 core suspend
(dwc3_pm_suspend) has not guarded for is_suspended, it should run into
some problems, eg visiting register with clocks off, etc. It is predate
issue, not related to your patch.

> on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>  }
>  
>  /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
