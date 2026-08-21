Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9142E8E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327791; cv=none; b=rDFOaAoEgXThzxf/Tq/K7/gUHu2SirobMzyzePfZex4S77ZpB9qFYQQOrRlof5MqNCeozds1zAnboFx5YlnY5KjmP+thJigEqIx+Hck2AXqHEsXMiIXlaFKWlCBLaMDZ8Ns262ICTbqv93XF1qYCl4q6udQdfvPaUqOlZ93hZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327791; c=relaxed/simple;
	bh=fyZaGRup6hPdizM0Mte1GZ6esSt8erN7rKBIRrNrYC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJR9532z/OYuodnRS2p+EPAYJKMbnPo8bVTdXsAy8UjDC0N1jbI2TTE7JKb+/FcoBFzukzo2xQS71GML3GzFxRNiM+XhL5gqpxEr7n4vTD1DfLGTNO4iGLZOPfbHcKgBzsyGWZkN8YIP4x0Vp+R3d7Gipa7kwim9E/OJSk/rAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeKHTRYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Buelvu5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeKHTRYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Buelvu5o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmi962417583
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SG9NDd2LgAPZDinHwmDiEH0f0DghPC3ZLUoy0BE5OTo=; b=eeKHTRYyR8aXSPqf
	3TwqidDz6pmBBqFByP+f9gDvNj7lU29tTGRIAJaXcCkMxdKqupmgwiCTPfLF9QWw
	F9JVvk/LrH39/PSu4jJ+4rKyxKSr0jprX6Vd/LD3Tzvt1gpzO29LtEe14M5xoqhM
	H84NUoBdtETDQTDs4H/PnrQGe23QJbfxvhaV3AzluayIcvVBBeyW4V+iR1VgLL/1
	h9F6ZOMP9yWSUr8+IlOVSdwGK1u3j8Jaji1Luft+Wo41pg5mcI5g2h5xAMJgS8Nk
	ElpS7dvGCpgvXZ15ohVbpKgHDnYa8qs7v2HTwuILVm31CBKUqxat1HXXFyc4NRxx
	FcDJdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue2e5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:56:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so8412336d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787327780; x=1787932580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SG9NDd2LgAPZDinHwmDiEH0f0DghPC3ZLUoy0BE5OTo=;
        b=Buelvu5oEdzczpDENCF6wtE48dIgO5MfoGGbmpEoJn6SbQUV0J/0aWOkAwBB/d/Ojn
         NV3jtkaafQWzrfgF/qGsh/pFV40UEz2CyiJZXQi6Z1y6lHrSuPGIArRaT2vIe+4sU2VU
         o90IRxF0peQvzFZNGZsSPC8T+nUyM5heqcPtEaVWSzN4PSKEvt2pGikZwGAAIY1ar0Fc
         3p4usV9N2RxBc/Y8vIGvIW0V7w0mObod/Tqr+jvYJJjYEpTqSnj1iM8KTmbKbJt7hH//
         /JyEQcIHSWrPxDL1ddvCPUzvxRwf12Pp6HousMEYklbrLYNcWv1hAVxPqCfKf1m4NdqA
         iIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327780; x=1787932580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG9NDd2LgAPZDinHwmDiEH0f0DghPC3ZLUoy0BE5OTo=;
        b=NumKtYPWrucbhsRr6P1980yN5AC4Rze6L23R+8ElHclW7y0rXbXTldiC03cVKmzBnq
         t1vfM+gM0r1ky7vkPRTR37c3gqXsTtdABKkmKpzy/XRGVJmN7/JJAYDEQrN+wHHNIMDa
         j1EbN73rWbTz6zMKWsK5/K6W+xs7q/FPOhuwJmcuXY0icWlNG0CQ9UMQAjc1EOWWa0V4
         RcO4rF9/nKcID7/HkPiEQLrfGzc7CBYgPlLV66mi5hzQyjMmx6cIaHZ2OfuBnj/5nGIp
         hbhZFHFq5Gt8Xy6a97K0K+yhyDx4xkcUL9YwqtJkeJUePyOwSJQleBFxWT61zdg7fZ/x
         jkaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpDoGJoLSRbe41k7oz1esP3QSD7/jo0Uadl82dHEW/ERFhjPxN0ntWQ1UPAyI3TOlLCLA5peD7vpdBeEXs@vger.kernel.org
X-Gm-Message-State: AFuF++nI9YJgULgLPMrCOTQVDtXZWw5dkSwuXB9UHtECrGIlqdIpvCvo
	QSm/3ycwSbpVlU8mp3il5P5ZrZmx42flmzWa3smLUuEHzDo/oSbIFBoH6NMQ3UdiVwkWY9DkzBp
	WHwVuyoAFoXNfKNPULNj9OLFHQrf+nvR5LhWJ2ruH5xYXAtBLQA2od4lJoeaSamrzY+pq
X-Gm-Gg: AR+sD10Fw63y9/3L7iR7GDj+ugcTjbLFYX/23UkZ09lHqmW+VCNWb3PLDW0QkM5QSp4
	+jLHh+S5u3p6Ei+0uOUYXPtJuSLVOoWJS+S1m493q54oodAQeWJJB1Cz5YBecGJN6wZAAN08svX
	RZtSpGfd2AcF0tbzbYhLSTXcCf0jsei7xE13pvq7EaQAdwT2UxF0CYJzf1DQ8pegdBPEDi0RbI7
	TLg0jl48+LIC1pSNbRRDmzbHQONuQaRmatlOcvyYdCDc/v56XepX0Qy9n2GKpcZv2jcitmAAXcc
	CZxHWNI7n3zfBotAc33w5c3Vghb+9cxS0mnHBz4/F52By0lGzGroinccpCebXauC7SkLnFZ7M8O
	t6RWuioptvhTyNMHlnzOdGhr9bCNpFcaY
X-Received: by 2002:a05:6214:8002:b0:90c:87e7:e2b6 with SMTP id 6a1803df08f44-90c87e7e436mr42803686d6.5.1787327779621;
        Fri, 21 Aug 2026 08:56:19 -0700 (PDT)
X-Received: by 2002:a05:6214:8002:b0:90c:87e7:e2b6 with SMTP id 6a1803df08f44-90c87e7e436mr42803176d6.5.1787327778984;
        Fri, 21 Aug 2026 08:56:18 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.109.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb4f75sm65109296d6.1.2026.08.21.08.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 08:56:18 -0700 (PDT)
Message-ID: <e76ec63f-db1e-433b-882a-4d25d9a0cc98@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:26:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] spi: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-spi-v3-1-8b62c4bc2d21@oss.qualcomm.com>
 <d1dc6098-65a7-45da-a8eb-109e42f5f178@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d1dc6098-65a7-45da-a8eb-109e42f5f178@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNSBTYWx0ZWRfX3ASDI5mONFpz
 3DnGvwvr/ci108tbAYqYddnv+0k0fRSq8FmUVXIG6Tvp6GOUbv+gNPaAKcUxsSP+by9rWPJd5oU
 yw2mWa4Uff5JNF2NKhQwwXwhE9FDbqg=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a887524 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6P0G4DzZkXptpLBtTzfX8g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2n5QlrmeVAYuqZsnN-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: nAF_jzEn5yzEEhnJ2AlYf3MmPLOOL23c
X-Proofpoint-ORIG-GUID: nAF_jzEn5yzEEhnJ2AlYf3MmPLOOL23c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNSBTYWx0ZWRfX18przcCoUT2r
 e+TZO133mdz6HJBx/XLXO9CTPefUVUHRD9OU0AEstvgiEjeplIuPe8Kj/atf+K6Lhc2bvpow1KS
 F+MGholx9nyy/YG2IlSoAx/tzwSxG76s28ttMYY4fHoWEDZLZCWzixWlxIOiaw8S08it5d/dzXq
 z0LQT0J95ABIeX5Rzqtxi5X4FllUTZonsCN9U6gcTIP7xsbpIW2AUrrEpXED0FdzXf72A+MSs9d
 0+xUJeFiOAEXZZYdppIgvTA9GxHehztbeb+oHNr3DtyGle2eYCtFXYNU+R/JcH0a8RnlSSoTKgY
 eRE9CseFY55ErmdnCAroEXbUE4taw/8EJKD43+yO6PAbMnYr8ank3vsySAw+OI32/e/NFoVzCn2
 DxItLhSBsr/seBKcU+01x284sNJIMHYyydAOsE4PTB7OUyLkSE7Gl8MOic5mhnkijktBHcJ3QUV
 OTW+qBwVatG0zTBPEZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210125

Hi Jyothi

On 21-08-2026 15:59, Jyothi Kumar Seerapu wrote:
>
>
> On 8/18/2026 6:58 PM, Praveen Talari wrote:
>> During system reboot, an active SPI transfer can leave the GENI Serial
>> Engine in an indeterminate state. On VM-based platforms, if a DMA
>> transfer is in progress when the VM is shut down, the SMMU can raise
>> context faults as the DMA engine continues to access IOVAs that have
>> already been invalidated during VM teardown.
>>
>> Add a shutdown callback to suspend the SPI controller and abort any
>> in-progress transfer, ensuring the DMA engine is idle and all IOVA
>> mappings are retired before the system resets.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/spi/spi-geni-qcom.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>> index 6c57f8309a3b..c65c1788325d 100644
>> --- a/drivers/spi/spi-geni-qcom.c
>> +++ b/drivers/spi/spi-geni-qcom.c
>> @@ -1066,6 +1066,13 @@ static int spi_geni_target_abort(struct 
>> spi_controller *spi)
>>       return 0;
>>   }
>>   +static void spi_geni_shutdown(struct platform_device *pdev)
>> +{
>> +    struct spi_controller *spi = platform_get_drvdata(pdev);
>> +
>> +    spi_controller_suspend(spi);
> Hi Praveen,
>
> Don't we also need to power off the SE resources here (e.g. via 
> pm_runtime_force_suspend(), like spi_geni_suspend() does)? As-is, 
> spi_controller_suspend() only stops the message queue — it doesn't 
> quiesce the hardware/clocks.
The primary goal of this shutdown callback is to ensure that any 
in-progress transfer is aborted before VM/system teardown, preventing 
DMA transactions from accessing IOVAs after they have been invalidated.

In this path, spi_controller_suspend() invokes the controller's suspend 
callback, which aborts any active transfer and drains the message queue. 
The issue being addressed here is not related to runtime power 
management state or resource leakage, but rather ensuring that the 
transfer engine is quiesced before reboot.


Thanks,

Praveen Kumar

>
> Thanks,
> JyothiKumar
>> +}
>> +
>>   static int spi_geni_probe(struct platform_device *pdev)
>>   {
>>       int ret, irq;
>> @@ -1241,7 +1248,8 @@ static const struct of_device_id 
>> spi_geni_dt_match[] = {
>>   MODULE_DEVICE_TABLE(of, spi_geni_dt_match);
>>     static struct platform_driver spi_geni_driver = {
>> -    .probe  = spi_geni_probe,
>> +    .probe    = spi_geni_probe,
>> +    .shutdown = spi_geni_shutdown,
>>       .driver = {
>>           .name = "geni_spi",
>>           .pm = pm_ptr(&spi_geni_pm_ops),
>>
>
