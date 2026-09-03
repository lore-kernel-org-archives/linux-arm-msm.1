Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E2439F74
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423535; cv=none; b=sHsPYluTeTUMoOPjSxJ726wKkTQa3yhujzZRnP1Uuq70+jY0CzBD2TbTjEPwpOe11Fja31xwIdGMsLiWiP4w+i4CxkDqR5+qrymrGb4IYpbyVrhtwQrhyfEegvH9Iv3t4GviReviAu+nf3Nl6O9IsPuFW9jIjI6p36ZqVR1ByeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423535; c=relaxed/simple;
	bh=xnFgWawnXFx8zIyhj/RPtiiwIwTFMQlexPNBv6a8wJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpAibhW7UAiugQUhsSyru+DV2gMnuDn0yFTYoAHwPRkmjGTzp29GjJn+InHXG3lJOIPSv95zCkNRn0DpKhonzT7OKvFdtR51QzFAw/vFpdsbaE8DQPDszgwrw5PgQjHeiopLaqx0VtW03/0hPLoG4cZpxw15gXV84lUnslJ4AjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxvNqD8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcDHaIbO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxvNqD8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcDHaIbO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837LpTU4124024
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=; b=UxvNqD8s2D3kbW3/
	IDzmY64Fxue25fu1Ufk40pOa/vHiAa/hE4PEU1LukolUFgxrWWqUzG+7cBADYgHg
	+TPez7HOeAZ0JHrq9O8gsBxIPoPEbvTf03Zc6w/ItawEcAsY+pizjUWzMF2RcqGL
	6DtOL/Oxp1/znNlGalJb7xOMFydo/si3aexepMeutbZpdPulQDdVotx6j7DvJ9lV
	2fZead8FoYQy8MdAr6vgvIYwnvSxTXMM1eLjvyGDl9pNMLIzJOslfm1e6ysk+K49
	3eXtYWL8k1MXEma8kLzP6m6kIY0XuwXXTgGY5BzXKt5fiIgLOry5ugwkmO/rSSY4
	Psdd2Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg6yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:18:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3104457a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423532; x=1789028332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=JcDHaIbOgunMRCw27SuQO5zgnZJABD6/QMJxkht8zED+5qUtYVn40dgNuVpoYfOtRp
         S2oPfUvCtegAdtsUs6rpDO2y0zWe385LrV8NNdlFL4Hx80cfyDcc89CSoupySCwoQqcQ
         fbI/JBfGARRlBMIgXHPA+fKpstG+3+RmNowJIlB588RPjZW/yguVKKJ58lLbodfmOQsV
         cz/loQSxyBy/Cj48ReoNRc9hbLf52uCIiXy6qKH0yTC0nfJ6CXOjDdCCymicfhl+h/kB
         TMVuMeO9oYyrIerXF3v/VNqRjdbwtWe7XQEeMrgkxp2L4XIrloe7VFaZK19SXVVZoodi
         4pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423532; x=1789028332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=o+JZal6Kmf9C+XX0sXFdAWrEEWa/csL0VGTOHhAchmUpKo6aFN32uMigKYk7unWKRj
         ubXddx6uhabLsnZTzjlnt/BCvHNpFNYQHdymiViQCoLH1PF4VudGRaDgIH14Twhtl7Q+
         OwYNv8uMwpbPIQSMtn+uU4qkQ+L6m+ODv66u/JozslJbRBCV7bxojmXtaac+UCZ5GV3I
         hc7bCELQpfFNr01AXOr/KwjjISiVycIzNmSBx30mW16NSbGOt/gwqnkMyurH3XA3J232
         f092/0J+EKl8Fi6cHKdKC5OKB6MmRJBhnpIWFDm4SmuD25KwoLcZeUyYM3h8q8oGv1kE
         AP7A==
X-Gm-Message-State: AFuF++kKF1nRpDg6rFdwa5/g+4oGvD8BRLDh4Cd29T1cYuFRVUnj0+5g
	l3XwhfPva8lt88e8TIFJYWTwdt6zuHvOCw3opQKMxbD5R8qrpmC0a5s6CWRQ3ZemQLw8st2RriE
	58J/fLAKmeF1B0FkekyHEaOWaoiaRlzYBNip/juPUXU8loFfYIARDUy3qveURi5R/3Uwq
X-Gm-Gg: AYBFou07LzfdCwoEbNgpeQ9YJwLq4tcB643F6HgdmSM25TXqgJnvIXrYac8gdoR6iqh
	+sZdIqfTrSJjNOMlgFfObpG9YENS/oYDIL11lTZZNnucFEjLONCNdDktz86QHBrlDk4O14Na5X6
	GB9LgQHj0iN2KbT94qQAZLZP4TZOmbGrp16+sUwQZzDpsqts3N4HXi2eQIj74yGfuULwbQ0GDmY
	AyV066YlqIgsuLaJU7K9oO/Hlvg+Tpuk79t87rkM0ipYcyFOeu6LYSPpsUHO+22fxaHaiEeCLAP
	JJBH5dtnBlH8vETVPaung+Dxg2dGu3lZQsMXHaiiyqVBpIwKxZhPkZ4tZiN5TpwQ7IsqgpnwQ+1
	ACyDSTAO9DbB2A9sF+A==
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457511a91.23.1788423531401;
        Thu, 03 Sep 2026 01:18:51 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457457a91.23.1788423530935;
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08300ba2sm4456477a91.1.2026.09.03.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Message-ID: <2bdf5393-e684-4db9-a408-a821c7dcbefa@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:18:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
 <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qGGIDw4vodBEzLp8ZlWve1LThzOwZ5Xg
X-Proofpoint-GUID: qGGIDw4vodBEzLp8ZlWve1LThzOwZ5Xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX2qOYFSjyPEXQ
 c+Zlc/1NTNIjlX7Wa7Wxsn6Yh36Wan1Ex4KslHnJvPmdYZSIB01mpsJFR7/klRn3hQq7JDt7+9u
 nTOeripTu1Whao1FemX+OwKMDpzM7Rw13OsT7QeUnneZhx+cE6Cn5g6sq8endsTIN+l+rERRiO+
 1z+QwHzng+x9+MKYFUTAi4DA5B6CCL3rDbOPW3aTQce3pTU4u75zEHsPg8GJIxjMTOBCRocLdtm
 /nuwcF+03rc7Z+hj03dCuNvlkxinceC1r4xmg95rAS7as4Q2jtVe4qMYZ/fXHflZzBiOGikBMMj
 1mzqTdnlYu8cVY/V/sGg+u8ZRk6qiGlv/EJDhJ2ASMXT3HOLS05rsV00HmNlZcwQKY/iCi9agDU
 e6TwnYl+6A1memGztiIZa9HqguYqgj/hUXcxzb5i+u4fz8Qr76ERqBnBWvqeQ6bVtHShga9bIqQ
 XStudRBZIZSnP4ChoxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX3CzV72Zs3DbK
 U3VOesMg6pkL//SPXglgI60Z/SFKGgH8yhGq0z6ufo5yPENC7gJVqg/InoSLupYCVlOiGd0wuZX
 jGuanwFdFQWeXLWoV8azodwc7/6Ow6U=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992d6c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Zjq2ePIxWaVxvOnSyN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073



On 9/2/2026 10:50 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
>> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
>> is defined as 16, so the check should use >= to reject index 16 and
>> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Indeed. Either the maintainers pick this one independently, or put it up 
> front in any repost.
> 
> And add:
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures 
> for firmware described ris")
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — this is an independent fix to existing code, so I'll move it to
the front of the series in the next repost and add the Fixes tag.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index ddc15249ec1e..cc9fa1d78925 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc 
>> *msc, u8 ris_idx,
>>       lockdep_assert_held(&mpam_list_lock);
>> -    if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
>> +    if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>>           return -EINVAL;
>>       if (test_and_set_bit(ris_idx, &msc->ris_idxs))
>>
> 

-- 
Thx and BRs,
Yin

