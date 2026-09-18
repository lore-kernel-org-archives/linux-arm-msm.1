Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4127054706D
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723834; cv=none; b=WXyERLOk0czZyHIRcDaML2CucYvJG9gIDaX8bkgr6Sx2MrrKW65yv3vHGCfppfifAZfWVLnELM/omCi0BCjpReMv4C6P8lL6IZLrNloZrQQMet5/pr+yDjRTLeJ8f/7gml1O4FqVPtxLDh01KmNCYt08S5t4Oku3nDWEzdc8dXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723834; c=relaxed/simple;
	bh=xVvPBhcxFPbVB1dpikehNudtA6+pusoKbTL5cGXpAfM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LgU07QH/bAl2V3sEeikTqAxHzmJuhqfjpm7Gjc0Gce9sYdmTEaHP4B5H29it6KN9THcetGPQ7bW5jPYl9QGp6D8CHRrGwIy36lbqRa1ltLz9KL3fwBl2NTy9+CP3WHZlpM/WDI1jQ8u8cr4GCcifwMyHpTIs9iMnVx1OKfmWnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLPoiHxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iu/nlUaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLPoiHxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iu/nlUaE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I8kZUB132200
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=YLPoiHxsIe8HtJiX
	oRFJRCjiOGzRoV9uipka15Bze9kbzS8DzAO2GzdTk7SGkPMz/qKuOT74bkrHyt6K
	rWWrh0X3aG6oRE9542rI9flAMwzY8xHW4ZPa/yYPwwmJQZojBBeH1DLbzMQPHF+6
	9FKrkHY/AeqYfFldo8GkzOvTpp8EquXjwbv8JQZjEtlmZHEEaanMTbaHt2ZCtUlM
	gYWcp7P7Dg9YNt4OTIumt21JY7BICjqNpWPn69RHGGq8JAFV+Z/xsOqTrzotEcQi
	JuYhYVpylKaFAIYS7LwfInhuNiU1pemnFoMSyuDAws5Ov1DJ5lI5F50FY06FzO18
	sYAdSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390619-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:30:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91049eac948so8818046d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723831; x=1790328631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=Iu/nlUaE6BuoTfsIvg43be5okbo1xOL4iT9IbLjTYwg3vVTS13FIOhBucfnY4LJNUh
         v3nNkhrUfShrshTyOhy0tpWkbaK36KIu3l44RYtStkeHUSjqUODYYjguswrO4Z5l4r6t
         mWVxja86RzfL7UAcZ066vCgwclMfO4UaoAuQzBOxf8A0Y5J8DTjNPoDB4a3yYIzzmDSA
         99xP76TN5G4StFeSDInnVjmus7hVysubGx/tkUQDQOULqr0xlo6rVPInxtZn7Q6WsZtx
         qseORdAvWZk2BFV5uvaranjz02LTttPYbJecMzuj1sXleJsmYIMVyJzjbU5YHyANI2Ug
         IlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723831; x=1790328631;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=QEsl5GggCeFyfurPJqzbeHURvNUGK9bzNcC96/DpksNDsR+xOtkIls3ODXshVQ+3/k
         vcIch6pjXWNkdIvNwlhqO19jVMtl2MY58Hkwph2gjB6UkTXT7pLgEt1O02UVDx4BndKK
         5wPVigQRaW6IJa14XjSES5fW35qxMsu9P8BpGJFebjEwLHUwlqqqD1Wt5Y/jvWITn3UC
         E9KHpKZaEb8k2R0pqplatEnxfFRJmFvwlJeRCwMCLpGla5UazP3aDvrU5W9YrHv4Id1+
         hNeYH5OwWYkCWcSRDC7TLfkL1M6N3sBpAI29TUz1LKo745c3Yge7VakMJYBGvmcAQyjW
         zm+w==
X-Forwarded-Encrypted: i=1; AKwUvBz1xT+rjDE+/iPsCaf6e0OSFTvYSRa+RF3ij5xNDe4u6McdQwdm0YOJLfnDUQtCSKWoFx+yrRJjGVDa5ThT@vger.kernel.org
X-Gm-Message-State: AFuF++mmpMQ5/aYg/VoQ2PIJ7Y2MG996sq2WRk1oSWqyxgZ9kmktNFmz
	Pmjz3a/1DnnMBIWkgHv3Xdy7wFqyZeZ+GiaBptjvYVeJT++r5wPpCp425k1BHJDniLy1o/OIVEr
	BCbpRk+1jTn7wwIEvDuwWisH6bUKqK0PU4YmZBzGn3U2+xkPqe0yZ2EteBZtdnKd6jpJO
X-Gm-Gg: AYBFou3jjHkikBTFapeZfcSzGnaZUnbXWF97ubPtf/P/V8mYY+6Qs20Dmj6/dDeiTU4
	V0kghuOCGaagsEMfosHRsVZPkSM2COhZFSDU5/42HigyPJ4Elf5otiznck4EdTatrOahQD5VLTg
	y0eLrl+1odOu072cuzCI8HsM7xRb4y8bS7VOXQpH3Iz/j31HbJWJpcqfri2Hr6Im/PX9WjRG9nh
	c2rJBLDkghLewX8XPogJs+lHX1xQdYw8WRqJYTGnnQYlT3E1/MnTuLBSAzQ3o28WFyOvj4VRsey
	kDsRa+uxXqWEJV+z4wyluOVEJjV/wLHCkGeg9qCwzC52bUPOboK7C9b8hGOwuYMW1qWmoI5Camn
	kl+bvSGupK7p4ePYFmkKZ90lmi3CbABpcVpRJDLkMCB06bKuGfnVfbmDYsE2uKpnpA466AnQxLZ
	0+HNxKq5CeG1MeNrhFVy8yrjpfqJoCXKaPVazeKPqQZaT/2D7I+7ahPgEkhn1+jiBVZw==
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230312285a.70.1789723831365;
        Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230308885a.70.1789723830923;
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm36747966b.53.2026.09.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Message-ID: <6f1870b3-c01d-4434-a7e7-64c82cb8db41@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX6qiLRCM24TRs
 ZHpTxnHMLAzDWDKPsafP3E7iSWHQnqADPuvI8geVHdalHMy5Dsy5+dbe6qAGkF2r3Axzkoq7tI+
 vLeyMM75Q+NVeBa9ePBVoffsIfi3m4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXzbj4NTM5VtgD
 2eIEmDoqo/LEPXSk2ybRQzvU9hyluzP0IYjV2M8t56OeAnZrt4AiUiS4N9hHVjXe3xRqCdXjLZg
 JVGKy3rG0R2lW3wjD9Aftsh6PIxbDG5eiptm9zbIRKRhwbSN44sGdmyiGZxpDit4eJX+gMHgwTl
 SoBsrYfX6ZFBga81mVWswiRbkG+nXqLr/ZMTree8Y31HgW2IjC+9oiHj9sZN/Ulo/JbG2fm7nWA
 O9qZbWfHRyJ+qA8V3GaWl55+BzuZfuF4LmUtzfYzARD4FYkraCdZq3n+QZor/jEthR05XCh/UQj
 vPzshiQkovFukd+OZxT3phqdRs578nSEMHAdAO9oWieNtel6Ms1Rq2ogEVKL8P05J1jNTnpO4pv
 c3eGvHuvZFGxDgnscdzrgcJUYXLwjxuOUNhRweHgKLnysq/RO9M4AuGEIjpKPAFIe2vlCDqoreK
 KYa57l6N/rzcjv2+EQw==
X-Proofpoint-ORIG-GUID: HaKLl99afd516TeMTqsCovnB9POkgcDx
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad04b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hAX5TG2nhHmSM0hg0PEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: HaKLl99afd516TeMTqsCovnB9POkgcDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi Sudeep,

On 15-Sep-26 16:24, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v6 of the patch series fixing arm_scmi module autoloading this
>> combines:
>>
>> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
>> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
>>
>> 2. 2 SCMI bus code bug-fixes.
>>
> 
> I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
> rebase these changes on v7.3-rc2 or above and post.

Ack, I've just send out a v7 series which is based on v7.3-rc3.

Regards,

Hans


