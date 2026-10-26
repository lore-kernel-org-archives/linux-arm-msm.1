Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049686;
	b=sv7Kazhkzxv6/9ajcGo7idXTUu3BCoAmdDb4gk3TekMGnBiVfDnzblHhUBb7L2X4mwEI
	 lF0odyQX8xTO9e8tkUhytD4OltZW9N+sOP4P2SRHYTUU0xI5bPnTvboQcR/Gnu/8sd1Ld
	 kMmjUtdcaqRGM91w6M1WfXBXBhVInj1DeujeVg078nS6Wu30LRnO+ORrQCIcVCDZ130B2
	 Z30LWSpwooUKRv5nIonJbEBtC1PU3NX3aG1tUDMypU3AMpaGJdwSOBE6NjsCu1sLETrbH
	 XfLbufWb1+qDZwqOXU09f4FigqvYrdqlDMO/mvl/I8Ue/qkxnOhgb6fhIOMObFqDjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
	b=2rwDOv+KmboDQyfsEZnUuB83K/WLwVNWRD2eX0EQ1S+8Spd06/++4wR1B3UzRl7uNtvd
	 Wmn9OkP0wINGmiO6ZvyOcWgm33pVd1CszSMbU1ky6v7GDMqX+R52rgrgyI2Y506Ovw/a5
	 vfvanFOdDr+aLphKaJ/x2Z6eZy16j8Cjxvh+ZCeDQb3M18RMtvR2fo0/rhev1K067iJkW
	 rmkLax4ZF9gzzVS4jGygvrHI6tSbD/9mePjMneUOSPHkBT7qMSE2Tz14wcUF9/BbgzScP
	 YbmsIZ4xTf7KfHYDECfPY69niEJLLS+eXnZl6gxIZeNDHzOBh1LEfIhIslYhY5mEXeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Bwm4fN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrbMrmDt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A9606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694A9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Bwm4fN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrbMrmDt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoHhV2591433
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHMxSuPF5fosf0Ar0wJsR6O+
	6GOM6fMKV/qO+7p+q5A=; b=Y6Bwm4fN1EcU5CyP07AbKPaQ9Q9b4LqWyHpJitmk
	D0WWkNmOZOuIt0eELX85J9JybJC18ERBaZpYBmLq5s1YPE9EYJ2KdAaWwRww5wja
	/yIfSDTmHnxZ24gJzgjtGNu6vhjBh8B+ZT4PGqyTqwX7xFVDA8AUIrIsheE94YCM
	Qund8eg/aCf2r8x5YH25wod5Y8uripAQsGE13aJFOmpDqoBEzpTpzbI71Iabxwze
	XZBUcAcJtE4fvR7ftUHmj4kfhl+/8UzN+B+cwJOCd92x1Mkc3oH60oSFqaQTSfb/
	P3dVqGEyD69kZ9pIN2KjxuDJ/H4bJCP7MptJ9I0aA9PTjw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54gu6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:21:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso6427583eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793049680; x=1793654480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
        b=PrbMrmDtJdbNVBsCttKHzSskELAx+Fz7GFPfPKmS98yyNEblWSgv5TlAuInlHJGxFG
         QTFConOoAVEyDWYEjlWDdcqcfL0ezCjN8nd1duL71lLznnBOYwyeBNX73cJIcxWmcgWB
         jcet9bJMB9WlXFDeTr6Z8PMEDS0QRq633PDbhm3D4DVZEcLt2C/IVQxdaa2HEmobz50E
         BmtIvAOunsxOLmiCdTIEdH0PJmdS5kczzIIG1JIsJLBB8koaV6h6/tgFCGzkWlu49uJp
         WTmFQ660toVkOWL0rnhdGiQhcuTYRdz6y7I0KPjnNDTizYWRgIoNtexC0Y1l1QjLDUeh
         t4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049680; x=1793654480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
        b=O8Ulm6nI24PD6dGvzXfWB+hSkrTa7+6mX9B2FSSjiy7iJ3PtLxGJrfe4bWGy0EqX36
         gRr1APXH/Ym66ALCxjBSs/4d0HDqSy9OjNtJ+/BSqMTCYt1KLrUYzzQ3ujMAG3ScYLVO
         GuQupTBBx+X+mVtkg/5E7OKUVzNe5ZPpQJQygJ8qKI1ZLn3LS9KgenPeN7oXY9kJRvxk
         chuzPu6EB85mQTl11v0WX/TjN2q1Fwyk5ZjlpVW5YL96T/qdAw6WR0P0K35hFE+A0sSQ
         7JGT/LUF+dFZgjlcGKoiZo5WWXMSo5qc8a7nT4INgb4LD1GK31e5m/lGhUMXp23/zXf9
         erYw==
X-Forwarded-Encrypted: i=1; AKwUvBx8oIRY/3L5CtarOAKyQp4rObYiKOlcTsjBTabmRfy2eq5g9DMHcoRZSIofoJZuijVDX8+u0OvgGQy5GVOo@vger.kernel.org
X-Gm-Message-State: AFq9FYLbNfWYsvy+9P0/+TL3CvbobJrodq0VGUuKme2ePVHW0o0vJJkc
	1Q3CJ/xvNZBtXmMH9WWAlT82yl+GSe6o6l5VMmDsaIZiG5k8OWH7DSau14uRBhmT5qoUmokazBF
	bTuCqgx8d72HKr57GqIyCyLphjlMWf/ojd0BhvZXsboVI81CxYjGNBsE1//Q+H4XteZGT
X-Gm-Gg: AYBFou1N4VTdNdOsKMDDLiuc8VIv3TATxaHkCGz4MGbF2M3/eKeG910IhS860ZMGhmU
	vPiGMuYbY24/TzL91IidDWYdE6j3cq2lAM8Q+SINwvkLJKTfALO+H6B0Hx1mF53cfeSH0CX9fcn
	83aMRjxAIRpT305HwiQ2zpTv2nGDefLoGy2P9+bMqiAKpakgkThvEZJGpXzKL1/wBWMfceJ5c39
	gSeb+sjDtF8Mj94LUuujVUh9uT8WiS9W28vhBJoRSgoWIaIGcgRqBOSjF5RP8d0p08GXLGRHbxO
	ZqoxKkLob5o63n0mYnqWCFz3J2MgxhzfyvpxmuxGl/XXF9OsGDjUZ1WwXKxaR/AXkLWOKdMQW/d
	vRrJ2mJou8KdOtkTBZ9/c+boe7g0M
X-Received: by 2002:a05:7301:78c3:b0:35b:91da:7cb with SMTP id 5a478bee46e88-369e850f691mr12863694eec.35.1793049679669;
        Mon, 26 Oct 2026 14:21:19 -0700 (PDT)
X-Received: by 2002:a05:7301:78c3:b0:35b:91da:7cb with SMTP id 5a478bee46e88-369e850f691mr12863655eec.35.1793049679050;
        Mon, 26 Oct 2026 14:21:19 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm34200662eec.16.2026.10.26.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:21:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:51:13 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Kanishka Chakraborty <kanishka.developer@gmail.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: maulik.shah@oss.qualcomm.com, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Message-ID: <tvowy4h55xpmava6altmub53fte2zfhv7fyfc57q7if4q5uppl@axc5aeuydmye>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20261023074838.29254-1-kanishka.developer@gmail.com>
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
In-Reply-To: <20261023074838.29254-1-kanishka.developer@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfXygXtoukc/+BT
 +/FPvdxvnHSvjbVrI8b1sY0ljZVEyC1sGWoeag4xBmx8z7Loaed7KfYKkILS3DQTZnSUa+IxW06
 VC0IDWbc95521XbPXNRFtMXZpQHTCnY=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6adfc450 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mbw87VQuohrwNmpuYmIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: c__0fGDR6I6SV6b7V7BvDP6a7RQTeXAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX/VuRjC8tLYOc
 iS8HxiLtjAzIiDZ0W76+ZssYFgte+KVWDJk6E9UiEYPJzNKq+fhJjwkWLopKpPJgC+Ihyzk/LXM
 tgpINF5MfN0hyrtGigm+AYmYL/uAnaeBDr6BWCHSL/coFiRz+LYA1EuYpC2xrj4D5aZ18FIxkG/
 bB9Mq4xTipx1vmvF7hAuKoJ3fvc71CCy+jS8gvo2I4SZo2xc0PJnMo37wzPiuuWuSmEpT71QfFD
 hr7hhDUWmo/TiaVtnlcpNgBFQRpyFjMZR0vCWEODe0Bnjp2OyVKH979OzJtHA5iq7oiLcCU9FRA
 c/pa/Pj7MjK935q6vnda++4je4UrVB7qZX3DTTv+D8CACsheALmI4ZmXIVoTNRthD1inF/STHdN
 sOiHVYL3R3pxCTvddwtBq+Ia5ClXmWusXDbEL/ISjDPuvYLUE93l10Y9s2OmeFm8wY5g8Gk7NR8
 5r4QY/O21qEUB39G5vQ==
X-Proofpoint-GUID: c__0fGDR6I6SV6b7V7BvDP6a7RQTeXAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260085

On Fri, Oct 23, 2026 at 01:18:38PM +0530, Kanishka Chakraborty wrote:
> Hi,
> 
> with this series in v7.3, SM7150 (Snapdragon 732G, Xiaomi Redmi Note 10
> Pro) no longer boots. SM7150 support is not upstream yet; I am running
> v7.3 with the sm7150-mainline patches on top, but the problem looks
> independent of that and may affect other SoCs with older RSCs.
> 
> Symptom: the boot stops around the time the RPMh regulators register.
> The display (left on by the bootloader) goes grey at that point and the
> initramfs never runs, while the kernel apparently keeps running (the
> watchdog keeps being serviced). The v7.1-based sm7150-mainline tree
> boots fine on the same device with the same DT.
> 
> What I checked:
> 
> - Reverting 09d99ff7fc3c ("regulator: qcom-rpmh: readback
>   voltage/bypass/mode set during bootup") and its follow-up 216e8873bc80
>   ("regulator: qcom-rpmh: Fix coding style issues") makes v7.3 boot.
> 
> - A log-only variant that still issues every rpmh_read() but throws the
>   results away (vreg->mode, bypassed and voltage_selector restored to the
>   pre-readback defaults) hangs exactly the same way. So issuing the reads
>   is enough to break it, independent of what is done with the values.
>   I couldn't capture the per-read log lines: the display dies at that
>   point and the boot never gets far enough for USB or a log.
> 
> - The apps RSC here reports RSC_DRV_ID = 0x00010100, i.e. version 1.1.
>   rpmh-rsc only describes the v2.7 and v3.0 register layouts and uses the
>   v2.7 one for everything below 3.0, so on this RSC the read path writes
>   CMD_MSGID without the write bit and later reads RESP_DATA at the v2.7
>   offset. This SoC has two active-only TCSes.
> 
> I don't know whether read requests are supported on RSC v1.x at all, or
> only need a different register layout there. Would it make sense to only
> issue reads on RSCs known to support them, and let rpmh_read() return
> -EOPNOTSUPP otherwise, so the regulator driver falls back to the old
> behaviour?
> 
> I'm happy to test patches or collect more data on this device.

Hi Kanishka,

Thanks for your test results!  Maulik shah has added a new patch series
https://lore.kernel.org/all/20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com/
to address this problem, it seems he also recieved a suggestion to fix it in
the way you suggested to have the -ENOTSUPP for the platforms which do not
support the reads.

Regards,
Kamal

> 
> Thanks,
> Kanishka
