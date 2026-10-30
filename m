Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359505;
	b=NrPPIK2AmueM+Rjb9B5kIuuO45h8BTY5FBW3v/RM3RH5BLRAxu+1Oc3qvJgtGEfgUM83
	 EU4h0/k/Hk0OQfrJuEYOHffmvzCzjpLk9Qf3Kpdn8tVQ00GpMJuIyVBVufQfUSD4L2qCo
	 IVYDtZ9SPAfQgWb9c4cSUkRKeYN6z3joAknfJg9622MZ4yla+LtTUjnDQo6+v5KDzuvIC
	 edf0o5qhQN5ztp0GJCKWhuq2zZumT6Zb8SAcKrl+aNF8J2sUcG6c2EDaX5DtY2CscAoMZ
	 s2Ob1w/Kot0sc7Ihk7KIi5p37ACpUAS1d0DQoxiYdWiqQMdEJiQGVACP2TORdkPJPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
	b=Ae3/VNcnouGXc4aaiivLNbSWYBhEc0pyjOxV98GI8FvkBMwL7AT2MyqD7ys9LxSlM9qg
	 9vXcKcOZRxfCUGg8gyOhr5BtKhsPLG17I7qDsUDPdPixFJu3FPqINnssmvHCFs1Sf9EdT
	 mPIsfWLVWYq/5FVjSTmyPq1T97v/R5JRH+rGx7QkAxpAOC/6c5qIfwT8BHA3h13lYrU70
	 UvJKShYbPS9L3vHIGe2jpsX6mcSH8TuOdpidzvYV174/B5tD9rdRRiX2RDxoaToQyTWY2
	 w8GT5hY2RipLKkNyHpZWUb1Nt0ZEw5AZbxidpNd7EUYJgk0YIz8CkcOzuh0TNn6267g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D6606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG10o3089257
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=; b=F6Q06qH85YmQbRp/
	mAovKzDurDlFMxNV21b93Z/D+NsjJSl7nznr2xlXGIagBnsvB/EXPJ92V6Rl1bf5
	5wu/gsVUWrVJHCRggG7tYo14x+AOqvIJVdKtsk4AhkD++8c54UqMdaS0x3WjLhg/
	rcSIW8pc7acgP5FloK/TjFXrXHeJ/LreuGQj3MuawAkFopP+/r+ea0bO4wj0KhX4
	013/PVbndtHn5QXQPL6Dak5VwD4o6P9+/ohFR2MxyY3gPioyA4Ox65kUxahYmnPw
	DHaB12iLFtFvHaRkKEiEy7bbYfsYpdprO2qarXLR9Evi6EsdSuA2euMx67Mly80y
	/4cYmQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjrmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 11:25:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2179185c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793359503; x=1793964303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=MthHSyokh/pEjj8ctzTLe0GTxgnt34I/YRpD2kntoyGtC+rLRB/OaqNPkAyHTFsbrW
         kSrZ/xhtFcX4b8OB+4lrve1Tqt/tMaDLqCDKAgi4i5nWIaWo/8Jd8+nfP3qunIgPFZW1
         PXqNCADSSy3ZARgwyjiIzadOToxPlx0g+0oPHJKffajIMCOD+HqF7mxeqSlTwOPXKKZE
         oyXEO3cgxRFYYQUpizG4nEwBMsGj61U0GbKHratCFqgUHGcrjf4gt008T6w6W3zxsc0d
         lPG6XZevu/oUdNCBfKNjndDeYnJZ2rYOCZPd/iVmtN7Uut6oKxvMMGotrAYevMqJqi5Z
         siYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359503; x=1793964303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=BcHLUBSDx9dYAenhIS+zkkhcA8xpw7ATI/IPyAD29g0RJDzRYL7rlho5jiA/COXOQs
         KU/Stx2QvCdIK7WKHoooZjugZ1inMS0xgJH3C8XXsxKGaRfW7cZRY1BtBKG9bfiyykDc
         4ZOfuuQWlMo9ytlCXrxBz5omV4RRTGrOJh6oI0YLFFhJW0tuLJ4tucGbDqIM9kTIeVvO
         4PPR7M5gSd4vhj1Dvbc2ifVnQ+L/2CbbPpACsJHKHfor07lVMI+Yg9So0WBPO6ubB6Yc
         YKdIXDtAaxYvR5KNdR5BIFL/G4l6I3HM7KdA7+JL3oxA3j62lN7LgrHtBe5YdmaWT4uu
         Q1MA==
X-Forwarded-Encrypted: i=1; AKwUvBxP3O/jdTbn6baDbILaWwiqRVi2oQuF7O0HGdR/T1g6Q6IE7JeLJXLzNlVlyLAhdVbk4Rubu7kr1lkUCoHl@vger.kernel.org
X-Gm-Message-State: AFq9FYLnelK/wFdmcejrR7W1w+FjamevoTRCSkDHGdul8o1QxKxfCVfV
	40ZVWxqYSiCM75ruicFXZwy+dPs3ht1iL4G4bbwkjtINwzw3o8zBWG5hkdF9Cn3lpHFaLrjxA1I
	yAFkPqfUtQFUz0uuJP3JG0j/oZbn47R4+0SG/ZdvXND+Q20RQsZWF0zLxGYHojZDkbTHH
X-Gm-Gg: AYBFou0rAxsQjVEGjXNsCfMe36LfsTmFaR8edvbGeW44WDTD5yhXA7bFovB7DUVUVwP
	haI6nyMNWheaG5+aobrAR31JESN7ZuG/uHE8sdr1JiMCXJC8zINtBNws57ipbiZeZnODSg1MUOc
	Ez8EFRHT4nZeFDYLwH69h21t6hmfO5Rh+G3ZP9XztYMTbD2H6A1F2Detx9ep8UYP8hOvL7raJYq
	mC2HdA3Hq7+A37fFlObz/ilvT7K7z0FKLRn8ppbGAqvT5jl4ewb/nY4JSZSPAsNUSK45lVAuSmV
	2SX5NtH+VoE44eJQXbjvqDp0N14DPk6zR7E9Uak3c4nDSfC0ChXc9E1MOUgYTMH5BMNthYNPPML
	az0Vr1QRIuSmlyFBdC0IHq3oLRPpyiVAJYbeYqWfO/W5hTWtGU9qRUm1q2yhwvOqAb+24qzEtmH
	eaoOc=
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624515c88.35.1793359502876;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624466c88.35.1793359502028;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
Received: from [10.216.63.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm6421408c88.14.2026.10.30.04.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:25:01 -0700 (PDT)
Message-ID: <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:54:55 +0530
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
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tiqXN-0CFTgyrLk3hiQeCAMzSPrY_1ak
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae47e8f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TVcAculkLhaLcnG0sCoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfX85R9Qr62bMEP
 eGKfqFdJG3dZCg3+y7dFDMu++wLIkBBNJkTjnP3/BWLBFogOYKxPoI7dGPf56xF1e0kLq+gQDQq
 k/xNAcdL7T0iTLWiOvSy/5qQddMBqxZxvSwEVaHvYwoftNNSjtKObG4BG+LH7FpD4C/wRmTZhL3
 cBoXrllXUq7NSIFLbq9zvgxR/AM3WrVBFaZuB0HQxRKkWkDYUAfPRtenELL4/McbYCCRsEKwIt0
 jzZlQSBejb8IEiav0to5DHN8LuXtvWPuU6ZTuJpKI5rPXNNT7GLD62gU9QAWBH2rXghwJbCjQtj
 UxGSh3IM/gBgUQBa/TJawS9gfTXV7T3RX+s+W4ZxiGALyCypzThMu8zthWsZlDLaAyvBl1FvVGx
 Ce0AKcPQbJXTiADI5CbvoW+Ie/IRAtN7yshTU2wPCUnpIml3Q9PlAPaIgzY4/7v8t87JObUK++0
 EgEci27ChE/dRTuOVkg==
X-Proofpoint-ORIG-GUID: tiqXN-0CFTgyrLk3hiQeCAMzSPrY_1ak
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfXziJfiFPnQu3t
 uhloO729lv00ChLCylMWRGGM4fhFwS5pv/mmSSaP0bmddAXkkXTnjqYW5C8QfMw5R2zv/5k5/vC
 M/TQZWT42CAvBDXzExbibhlE3H2MHiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300045

On 30-10-2026 02:54 pm, Peter Chen wrote:
> On 26-10-29 00:29:31, Faisal Hassan wrote:
>> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
>> clocks. If clk_bulk_prepare_enable() fails, it returns with them
>> disabled.
> 
> What's the relationship between clk_bulk_prepare_enable() fails and this patch?
> 
Hi Peter,

The wakeup interrupts were disarmed before the clock enable. If that
failed, is_suspended stayed set, the next suspend returned early, and
the next resume disarmed them again. disable_irq_nosync() and
disable_irq_wake() nest, so each failed resume left the disable depth
one level deeper. This is the rarer case, so I will reword the commit
message to lead with the runtime suspend case below.

>> The next suspend returns early on is_suspended without
>> re-enabling them, and the next resume disables them again, so every
>> failed resume leaves the disable depth one level deeper and host-mode
>> wakeup is lost for good.
>>
>> Re-enabling them on the error path is not safe either: the
>> level-triggered ss_phy interrupt can stay asserted, and the handler
>> can't make progress while the controller is not resumed, so it would
>> fire continuously.
>>
>> Track whether the wakeup interrupts are armed and make enabling and
>> disabling them idempotent. A failed resume now leaves them disarmed and
>> balanced, and the next suspend arms them again. Disarm them in resume
>> regardless of the wakeup setting, so interrupts armed by a runtime
>> suspend are also disarmed when system resume runs with device wakeup
>> disabled.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d44f093ac243..d4fda4dd81f6 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>>   	enum usb_dr_mode	mode;
>>   	bool			is_suspended;
>>   	bool			pm_suspended;
>> +	bool			wakeup_irqs_armed;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>>   
>> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (!qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = false;
>>   }
>>   
>>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = true;
>>   }
>>   
>>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>   	if (!qcom->is_suspended)
>>   		return 0;
>>   
>> -	if (dwc3_qcom_is_host(qcom) && wakeup)
>> -		dwc3_qcom_disable_interrupts(qcom);
>> +	/*
>> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
>> +	 * even if wakeup is now disabled,
> 
> How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
> hardware default value makes it enabled? If it is, we need to disable all
> wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
> 
> Peter
> 

They are not. They are requested with IRQF_NO_AUTOEN, so they stay
disabled until the first suspend and nothing needs disabling at probe.
The issue is that runtime suspend always calls
dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
of device_may_wakeup(). The old resume only disarmed them when wakeup
was enabled, so a system resume with device wakeup disabled left them
armed. The comment read as if the interrupts trigger while disabled,
so I will reword it as:

     /*
      * Runtime suspend arms the wakeup interrupts regardless of the
      * device wakeup setting, so always disarm them here. On failure
      * they stay disarmed, as a level-triggered wakeup line could
      * otherwise keep firing while the controller can't be resumed.
      */

I will update the subject and commit message for v5 to cover this case.

Thanks,
Faisal
>> so always disarm them. On failure
>> +	 * they stay disarmed, as a level-triggered wakeup line could otherwise
>> +	 * keep firing while the controller can't be resumed.
>> +	 */
>> +	dwc3_qcom_disable_interrupts(qcom);
>>   
>>   	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>>   	if (ret < 0)
>> -- 
>> 2.34.1
>>
>>
> 

