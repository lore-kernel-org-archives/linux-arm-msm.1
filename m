Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BE4AA1D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366105; cv=none; b=J73tSgqi3oom4DzggAgxc9wl5Knz6rGcR2AyJfuXSvWlSCJiLAxiJapJwRV/9+9FZEaUmGq9QafYyJIQoyoLPeIbjGZJ9NpUCVzIsKltrX6k+zmdfK32JsiftUQy7Nk8UfJciKI7hpq87EGsMZLM5+iWfu32sp91e5ExYDqONn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366105; c=relaxed/simple;
	bh=TahGuo3Lcj2WLJB8fMf1qgiFJz56dvCExcf4jVNRKao=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TuTlXO7ROWO8r0ijH26pMs1UwR1fzdvkcdwpmy9s6SDZZB3Tudal67agRvEx1Y1XjzLftVdA6d6da0QDimO7OnFyh5uLtMAiaYZas6GbL2oeLrYA1n0B9f0Dh4DfSnfIOQK1vdZ5vBAxpqWqKccuxUltr3H15gUBrGOc/6x1zyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHbFwbGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkknHQI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHbFwbGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkknHQI/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZFhI1347736
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=; b=iHbFwbGEf+ovYvZY
	zVUMC5QvfDjAzZzzfQYexmEIpK/9gg7Nc9fdnoz0tKtT1N2IVpWDJdLD6u9nU/ef
	GU/L+y4N0suvaYM2ICxQIz+AVA8hHZRvuU1ir3IX7Q9Olf0Qxb8RZ0mF/jPetPar
	iyvhVlrnV7XCVolvmU4wRBGoVZ5K4vLqmaHICCvSg+FW+Wni1YVzjo08bOYg2QlM
	lgDxmu7VyjZybKWaC1zn1aTO9Xbm+twMtMUr+GKZQTnjuKkCP/zvlbkPgCdDoxWp
	D6kyKbev/ufLEgprAf/lL3Gd1U9Ks9njRBuh2VZi23236xK+f421l5qNrLQ6OLyo
	F+dHwg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4rqbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:21:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so22013e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366100; x=1788970900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=;
        b=PkknHQI/7+D6xqQGdnLbWKysZt8pIvFhlPWrbXFuKAH/vfinhy7CNdE37Tc5yArUvj
         9szgepKraMHm09vYf3ytyapTWkArXNeJawqrkEKxlLoZyMtUmd/uAuKAeiWwvdGHNCCK
         yXmIsBsgGB3ZmiJZx/pZqquujNancONmke5Wj8V4mFSPvy4n+KSB7Ypm7hKtLGqRPluX
         37D+QDw4RDlz40CuAPddzCQrzHtt95RZhyTO0cREjz5CSTcXi3eP1sXXFRneRuoMW+jS
         b1mEzcKVxA0wxGNJyIWZMqAwBAIQg5AAsIsz8ukC1+jZFjEaw9ukMQ11s3JQvBpbbd2o
         pLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366100; x=1788970900;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=;
        b=RjQ4PGy/ujpDmnpsuoiga2F4qKLj+NLsr2zd0geq6cgBeU7dDG6AXySpWiP/yiYZi3
         mKNNhPleZZThqBSGquW/WZ5WSLf8rmgVBZrNAq6g+62vxrErDWQ8y/J2sW+nY+W9KM2x
         y0GETYViB2j3PIc1sw+eLTxQE+sJafBcspH9x6vJlW6h/9C9A79nB0+wpPKOiY5bRtUV
         EB173z45yBx3lWcF6bUEv/+F9MYrx8yBZOssS7unG3IKP0/4c6HgfSKFbVjSzF1d3cRI
         1R/m0m1IYfGekZCskxfL75Kfs4c1KaVGPy/60LQnAbG3AxYKU3mheTfaKYlSJ4o67hJm
         WaVg==
X-Forwarded-Encrypted: i=1; AKwUvBwLadIyxdlBns4EZnhFlos7nRjrnO51a19HLANvrjfyUrW1E6tIpLIzQVFieX7PLaFx1oSOL+O92pUYo1Od@vger.kernel.org
X-Gm-Message-State: AFuF++kGlUWQlhLb+znE2MRNFrRcE0eDgCewuTWbCBal3xOMrPO97a80
	GwrJQ77KAFmP3vEOR6iR6S751kP1rWLI0Z+7hUYodtu55QFM9gEkMSUPtVCsdEUThCfhKj+bZdX
	ubB0bZ78P8T8am6IANNE+Q+rUmhB3dkSrZb9nfPqQ/sNxUCTsojPloN4jhtS6op24f9WU
X-Gm-Gg: AYBFou1Wu0VXJp3NASAf3UcMFw4/lTI3e9GLRHH1+SSl/L5WlvjG5KJiUW/ku1alhtZ
	HGKhcYz08C6sleBe2wPPxCr6TgXhg7uBbSqPDQUkLj37f9+6rPvxDCrxKkPly1FvPYhbE54Z9g6
	2d/VQUr2fV5wLN1RWN2kdQ8BLr6Y4hi6RbKprmkfFqbZgz5S/SAptwdGLpx9fI+5yd+Qmz6J5l0
	1IBgZq7QShkZ7eUVSl1hRBYUvQafmOdS2/Ats5/q7m4ZESlriTbf+Csh/CMZVxl0ZSaXgp53F02
	v2xlU2FjOU/pNtWwGuIeCCgjtveqHyqLOox7RGs8CWZ5waZzGu7FynMblImKlj7f/zp8CKEM06J
	n+B4pMT4KdvypjN5NNblXlw==
X-Received: by 2002:a05:6102:149c:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a1f5dd312mr919814137.1.1788366100521;
        Wed, 02 Sep 2026 09:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a1f5dd312mr919808137.1.1788366100067;
        Wed, 02 Sep 2026 09:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002df62sm165902966b.15.2026.09.02.09.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:21:39 -0700 (PDT)
Message-ID: <73e4b46b-6a26-4124-920c-7638b449fc1c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose CHARGE_NOW on
 SM8350-class firmware
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Jan-Michael Brummer <jan.brummer@tabos.org>, sre@kernel.org
Cc: andersson@kernel.org, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829054546.86210-1-jan.brummer@tabos.org>
 <20260829054546.86210-3-jan.brummer@tabos.org>
 <a2f3de2b-90f6-427d-9994-a8b1ec8cbed6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a2f3de2b-90f6-427d-9994-a8b1ec8cbed6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX4dK0lNdgGal/
 mumeUmumZ3LqMm75fORKZEz3ExPDmrR+9Itbst3hbcIe6yTyYvJmfSk91HdcXmu10OFNyyu7aBz
 KiTcNpHPqNTDRFabNdahLcwXjrsJME/P0/KoQEkGF8sPTW4O71tdvVDg+6sjJ5sNduXqtLvHVF2
 yBNeaa443Kf1pLRRnxE9AXWAsCXa8u5w1cWvYzAz66CP5/ndTR9/n7EdhycIp07A/D9+YVjVb55
 EPnVtlIz30HvlviG3KqDPVYBBKoGxALpl5Pz0OPO0qp1NRI51BY5ey+KzZPcRbfZj6U6rLDzb13
 R7JW1cHTpravHRvSa5owhU2sfbhEIJljTM6neYVrNUbxWfHtqjCBF6Zgqlvnyi/nXYLtOdMnvBx
 7R9XyIRR1mWzR3jL8Ui0jsnNrWhr2ypOsjA+yJdodCbUprJakGnH/OHxqeuFP1dVZWRPUFOqS3w
 R/bcWdxjWEZPI+nIRvQ==
X-Proofpoint-ORIG-GUID: E8AJT06rNSzB5byH_urE8cvoi4LfuR9m
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a984d15 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DYa_1O34AAAA:8 a=cKoaJvaT5YP-QF2Gj2EA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-GUID: E8AJT06rNSzB5byH_urE8cvoi4LfuR9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX118KnDMJ8sVx
 ruPkAQ5TlGTk2PDog1tKmfP0ts4UUaQSXACsLZ+4AwaXA9Ke0nM7wuN2j2y98EiiZpI8KmU1ZON
 WdldbROcK2RcCy/XWST5JcpO8lrCJZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020144

On 9/2/26 5:02 PM, Konrad Dybcio wrote:
> On 8/29/26 7:45 AM, Jan-Michael Brummer wrote:
>> The SM8350-class firmware does not implement a dedicated 'charge now'
>> property. It does however report BATT_CHG_COUNTER, and on this class of
>> firmware that value is the remaining charge in uAh rather than a
>> monotonic counter. Measured on a Fairphone 5 with charge_full at
>> 4116000 uAh:
>>
>>   BATT_CHG_COUNTER   reported capacity   counter / charge_full
>>   2434614            59%                 59.1%
>>   3525354            85%                 85.6%
>>
>> Map POWER_SUPPLY_PROP_CHARGE_NOW onto the same firmware property and
>> store the value in status.capacity, which the CHARGE_NOW/ENERGY_NOW case
>> of qcom_battmgr_bat_get_property() already reads.
>>
>> Together with the preceding patch this gives userspace both the full
>> charge and the current charge. UPower now derives an energy level and
>> runtime estimates in both directions:
>>
>>     state:               discharging      state:               charging
>>     energy:              14.4347 Wh       energy:              15.6003 Wh
>>     energy-full:         16.8807 Wh       energy-full:         18.1505 Wh
>>     energy-rate:         3.39313 W        energy-rate:         7.3492 W
>>     time to empty:       4.3 hours        time to full:        20.8 minutes
>>
>> Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
>> ---
> 
> Ok this makes more sense now. We should still gate the other property though.
> 
> [...]
> 
>> @@ -1442,7 +1445,10 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>  			battmgr->info.technology = le32_to_cpu(resp->intval.value);
>>  			break;
>>  		case BATT_CHG_COUNTER:
>> -			battmgr->info.charge_count = le32_to_cpu(resp->intval.value);
>> +			val = le32_to_cpu(resp->intval.value);
>> +			battmgr->info.charge_count = val;
>> +			/* the firmware reports the remaining charge here */
>> +			battmgr->status.capacity = val;
> 
> Let me try and find whether we can rely on this - on newer targets
> many properties are more or less just front-ends for vendor
> plumbing (because there's a ton of different chargers etc.)

There's a comment saying /* remaining capacity in uAh */, so it seems
like this should be OK

Konrad
