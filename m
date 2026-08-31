Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77073D9DA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180277; cv=none; b=PYNDwQ3mRAXbgFKc8aKTj7Pbz5k2vvyaZq/wo+8qpIyNkWXg2aq0ytxwrVywPNuDr9jKbNt4Vjv0uqVCBtessZZL2XVzV+iSCQQ6f3fcQfcIiBolbGv34jjFSgFiH8mDl4oUpmjJhUbuz3eb1SP0rQBZLt0Y5rlygwTn3QRtUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180277; c=relaxed/simple;
	bh=sGKmCuPxmyzFf98LzZ0RiPxg9naiQcwiPcV/ZiT557M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bQCWNSAfgfwkr0YaqynnN8c7cswzvTiqVsk0/nX3ua3NKu3QpO4Z5TAFPBl9CTpKXE6lEyH4k5MHm7U8ewcpkZJ7YqXUsXDGYQ5iJ0/d6qc7oUGh4GIcAB5fulgJI5JomIK39vWBOd8/6N0Dadjx8JcbJVF7iqDoUbePLkESM28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7ech56X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5ogYWrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7ech56X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5ogYWrd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAKCW3600903
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=; b=Y7ech56XXcnYBjKJ
	XAfsW9r17NnlDFeItMBw/Hs5A+cBW6miseNOuKkYKnZaJvn8wlVUWpOXeEVApqBP
	H8rklCW6t83ZhK3Pfxiw/+lhP5HQHio6TxDpDB9ygrRzaMD4r/fsYJevak/Z6xeQ
	mCrK2+Mq7+PEWla3ZzWQzbUc/h5wmxu0NPGVJ7k0I+rbVsWY8YAijhFW4OBhZiTa
	S/Fjd3vRND7gln0OjZKQxHR557KXVfF44VGQ+lLWKUhUR+r4VU82YfvGP0bpwiAJ
	Q/EOV81aNRBMw3WJnPGzqtgQfEIDHZ2bptyKhl48DGCXyvPAqNyuc7zGEqJ9aWYh
	Tri+aw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jggvad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:44:30 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e4b52404so4172092a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788180270; x=1788785070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=h5ogYWrdTJ489POzUyggKmIArkn9Tr0ZySvmML3pm/jhUogjLQQMy888/IsYL9ximD
         SAKYGneG7uyK6tR92gT4I+RfBav+uEjI44U9kMQzi4gn3tebYrHUh6jyXTrnvvuGkHSB
         i2jguFzmlr6MDc8RrNlWoRXpezPbyzkJu/hMPJbkjHWur9XdiZ0IAxji3l4/M5gIJsjR
         dKegXuD4YMJXeuGYHOm4hYVxizhZ/ALeFa8zZJ4ZGbWEa5XNXEwt+rBFaWe2pqeoukUt
         LXCh0w2GYiytWpFDdC8W2mPRCoEfirHUtmFNPozoDdciRE6/N4jziZ/WIO+HrsIQWI7x
         PeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180270; x=1788785070;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=E0PrylmrfCNmiSBLoLf5mmk0DIKp9rnjzYZAr2HResj85oFogp5GwFIJBR+DcdPf/X
         itjayiJXeowHFakbe31S2wEwdH8PQEsPZb5zqNwUQRaR5D6xhMrc0lhizTRTgVSneZPt
         ZaqjnumHon3KNeFJHnAlLcj5zo2gUmr+ag3lX3yqwPVQS5MHqqC+CI7jQT/2P2j0rN0v
         5OgvrS6pPThxCdxgwqbjO6Aqz1Imu5lR3qCnlgddhM+AcQVzwhNEy6dYAZxstiwsOLUB
         nqiSgkrHQK2xoeeVmQuxwxcqmi2OjDCUh9R33B0ktRMrokUUOG2Havw14lJfPwTOWgt+
         CAOg==
X-Forwarded-Encrypted: i=1; AHgh+RqVskxgy3zoPcDNtsbG4uom5yPZEHPWA2gISOJNCo5GQmhc2VMosg3puEWV4mXCGz2ImwfktNVGYGoOXLzK@vger.kernel.org
X-Gm-Message-State: AFuF++l6Bivp8t1XLG3eEUzouFoGNEXBVqY8XFMShKTMq2ztQfdrTpgE
	HRzWBVaLaMaXKto3gvV6v2hn7LoJlNLlMkKgiowJmX6KchfJGizs8dev0AcSPkLziSMv+a3ipjm
	poANrqW6JJifJAB5zMPpWwaC8TjkwcKfvLXmlgWrch6TpA7inxQrMbyXxLUf4EHKjUFbi
X-Gm-Gg: AR+sD132IkIFpCeTWvoNp+1HVbvJs3yOxCF7dRD3EwoaNOy3Oo3RJd8xoSB/SHVmTyE
	Jd1c8Zv90rPyacfktdgnED12FR69n0Pu/7/2BsSlmXKqBCx76Tcmi/WnEJkpXfTCLVrN7XVK0dc
	eBQr5VetaFGi7tHEjNLMTeF1mkVGOw4SqDiGX2pLZsNOGFvSqGtW+zjI7/lHDwgt5i/pAdPm6f6
	IgKkGcPPlfTOBZdu+HYAx1ObeXjnolTmyZH/nG+qZeyZZoarDCwwTxfiB78yXN2Dm8bCpojlqSc
	M+bmOmlkvoWcJRcqutIJdBCF6EjRFMG6zaKazgSBkWPF67nQo1Of7jqq6nhSszfOqll9sLpLpLM
	B5CKtrowI+HCOk5fSErgT1H2eKXzw
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699793a34.7.1788180269639;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699765a34.7.1788180269258;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7e92c1sm8011113a34.8.2026.08.31.05.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:44:28 -0700 (PDT)
Message-ID: <4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:14:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
 <ajLbyqELjduwbKC_@baldur>
Content-Language: en-US
In-Reply-To: <ajLbyqELjduwbKC_@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lkF6z_jnHqiV0OtukpUa81Nskg9z7xln
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX3ur/ph8PZatP
 cZbBUTsZ/PZ7BSapKUcBOFFfr2GtK+IJZ4ceGEct40esQnpWIm+p8SCbL60pPze5GLhWWYQRwet
 FEtWWsTi+YKoDRk/oQVfWtUoIEPgAsw=
X-Proofpoint-ORIG-GUID: lkF6z_jnHqiV0OtukpUa81Nskg9z7xln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfXwCWgzcGu+0rN
 +2leVl4pZsx2Q8zJFG48x2hASCEpWuo5dEb9WmQMWlLZRX09TQJ0HhxkEXwZWG0QofYZBiXo/FA
 O/TwfoHPsfM+gffVnwScxgdKAVWw/vcCbw9OmSw7DDKJNuGF7xrV4n7k0S8kcpzXFAYGrcvuDrK
 eogimCulyvirjGvYtm5WZddKKpOUzmMe3UP9i+OHYR1Uci1mB6msf6F6V8CrRvny9dXtQ6a4z8q
 mWpQdinvokyNg4t/d8sgnokbEZPq7dXNhkjEpm7osCqDdesG234+1kX+rVHzziqT72eCs4W3oXK
 IW7Q5vwzlYL1Rjqf0Kbli+YUvs8jS6qd3F8AQZImnzg4S/imIK+wR0Rn2CQZSMDAlsTtelkNAxj
 QhuMR4iLA4clcw1HcS6pfrD80V9iaB4KsJaXWnM4wP+jeuobBVNsok3lUQDFv391npGcZsblQkD
 pXdpqhbq1l+RjYF6BFA==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a95772e cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1-MWVyHvgWiywHnngEgA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310110

Hi Bjorn,

Ayushi is no longer with Qualcomm, so I will take ownership of this patch
going forward and actively address any questions or feedback.

On the Kaanapali platform, this panel is already in use, 
and the regulator range is configured as 1.65 V to 1.8 V.

The NT37801 Specification v1.0, Chapter 5.7.1 "Power On Sequence", 
specifies a VDDI operating range of 1.65 V to 1.95 V. However, ldo12 
supports an output range of 1.2 V to 1.8 V.

Therefore, the regulator constraints have been updated to 1.65 V to 1.8 V, which is within both the panel's supported range and the regulator's capabilities.

Link : https://lore.kernel.org/all/20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com/ 

Please let me know if you have any further queries.

Thanks,
Arpit

On 6/17/2026 11:11 PM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 05:51:09PM +0530, Ayushi Makhija wrote:
> 
> Here's a link to "v1":
> https://lore.kernel.org/all/20260323102229.1546504-1-quic_amakhija@quicinc.com/
> Which makes this v2.
> 
> You also ignored my feedback.
> 
> Thank you,
> Bjorn
> 
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
>> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
>> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>

