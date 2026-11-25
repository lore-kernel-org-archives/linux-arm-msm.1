Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600059;
	b=zmQMU71SxVaeNcb3fR2gG0n3Iq5TIJ9Sr/y/LuNpz8htOqozGwuYPySm4uyRSg1PvmV6
	 CeRxFHBcx8Uqv8zj2R5vVRe+V5HaFr9eypHT3cp9xdg9l0VXd99yQ3fXQX2AI61JnM6mN
	 UHaHSLhwr0QYLdUt5XrQcjL4mPr3q1sNkvSNLLn0kTU36n3npdJeB+Prfs1La6jHbRb6O
	 bldQC9kUIW5wvsIUSWrV/NT6pcL+oyDALbTBbgd8rQVWhj3/15xUoBOMOmnczyAdzQZzs
	 mCgQas6YSSCMkaUTKp65OxOKxgp4e2oixHPTm3UZb62E7wqQuSKVy0HlV6DeZcW5UjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
	b=4TOn3vJugdYdAdDyeDw5BmEm0hMXeD8eahMyaAOalZvFr7oZ2t1qDCZgt1iUtjAZlJC5
	 ie/AIUipOdmNZrJWkQx6nqrSd8pHPPq65jbro99n7e7meLbkUOa6s+UMJAXliKoPf0h2a
	 L9Fd6OHvIdpnxgDQnH0ImyoOoV6Cy3K0ZgEdt8u4yJPsAwpN8X4Y3jAyS8OHa2+OM1ob4
	 OVWsbl+Obxj2PPuVrV5+QZNT45BJpJ7V/lPp/JyhtrpKwcOHhO/Tj+eDJU8uWySNGYVqf
	 74RcfT9uHBWy1rgtQWfQXGxT6PpPFP1pjx7KYin9xLEf++lsfXRSACViEGxMldg2whA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wc0v6/T/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BA606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wc0v6/T/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9DtcD3682341
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=; b=Wc0v6/T//zOgi/kV
	Dvnswvuqy8DOPsBRut8jHdj3lf8SBHw6Rg0jgoG39nISG6LcbRjYmnyu1EJcZqSH
	RvAtqFrd8xSy5lWjeeMNwT0dQxT/SXjKgQiFmNtnuDCBHDLdJgX6P03eMcPztGXF
	gBtD5LfkQJmvmfUJshiBwB+BLEh4RYaxF1ZoHWQeqx3c0ColoeOu1gLqD7Po6pO9
	rKGZGxTY+4nimE3YIrdBL9ONTqZhofqcq1lRb2rw45FKJ+OCtPP26N9VqzN2wo7X
	+8nxqSBYlcTeESdO5yjmQ5lrm34BhNLrlgxG43TMejfRbh2DiR89GMmb6ocD2owp
	2LyLgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2r5uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:47:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso6208203eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600057; x=1796204857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=I8o74it+Za/xLr7v7u3b9UCBNHYvaqdZBN0XPNAkSR1gb01DqMMstfX6KwDpTOFpFw
         D11qI1v4JU73d95w+UNCl5qt6mOzhJz/Z1W5I7aH2ialqUNCYe3yB5x+RFyb6EcgusnE
         iB4E3qAF6VKLu6aunshk6TQDFDhBHnck6XwWyLSlXYnnTvTjbxBvXbZBk3NVs95/WU9B
         fbsLv6EtOBZUe1F/Wz/Ll5h87JgpmU0VpuLZGgTM/YXRi7iALAnUnj5Bxl5deFxpGnSo
         GQMZfhRNerbjAuZ10hudgK/Fb06Dar2spy/gewdBlzBs0E/KKHaBHz8VHoNsiVwB/0x6
         iKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600057; x=1796204857;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=Fw/ORBTYurNrUCOCX9ykZCLJ/COGMmSB4+e3Rg40i6QjT9l2C5xiyNECzw3Xb2XNry
         oZT+AUTQwdqQNGiPWOjHAiLLIKl1VQcz39YrbA9/L4+DpmYLxJlp5A0HP0EVZ8olwXtb
         As4qssXNUvTy9Q3mt+tpS52x+l7xw1IueiJ1x9AFC4u3exNvjO5wRUTPh0QawL1pibeh
         MEtfxkhYR+4bsCmBo+uTUZT8xnP1cJZCQCfPlcdQ1ttsDXzjfvX8f8IwfHRyQyp+v/WN
         YXee3GjUs4gdpXFEoWXpJQTMGhdIg/ycCzYhT4bNmDP4ZrvJOBJFjy+y0/GNRbQmbHM4
         jKRA==
X-Forwarded-Encrypted: i=1; AL+hErHMbhOGBi/U9P+5V/B4QklytiDBydEbhJ5TXoiI+fgMWw/A0nJb/LwPCZFTss1kj1WzzbYfkZ7uE0Xu6p+0@vger.kernel.org
X-Gm-Message-State: APuU4Z+knrFz5Nj4ISoTcEmbRai9/Q4q3Eu6FYlDI4bFDVWDUCI59hqi
	MMrWNs5BNPPSegIV7Fcja52VoMeQuv2CxnsoeZqcSN7jKpdZNc7d4863U1rVeT3xqiqs8OTSkXD
	Ub/x55LaOytvAGK7IYlo07LTnuwTSmax78/bzsTC4ufSfFO3LESKOI/WjhBSkwSBtzKaK
X-Gm-Gg: AZFdTZeYwoTYV2IskXhEnTrwX1NLMJaxUwPWpCTzhpBwy2EKZBOPikdYGbVu5YdTpUD
	0DVjIkiZDhym4ErTUEI0VF1ItDZxHl/wmhtsVXl6zfdpoxQloMGnaktxr6a/if1m8D9yOn9fAQa
	ov8ZoIJ9q4sHZGTp1f+V4DUfglbhIQVfzBTJC5hEzahTyxzuXqjsMi3TgUnsxHo9FLrslSUAw+b
	8hZPZAEwHcQ9SebCG4FSgL0+UiAQ04K0pzl13YahdiZfNe9PZJecYmfg+CRRDu3W8s5lI4qy7WU
	KdPDxS3rqYY1Ts/amyjBl/NAnekWXH2TVzLkHDBmEtKN1/CLAb1rULpg0QYcIFL7tSAxqGqgfJI
	82KzdQcN1brQtZj/w6SGmNMniHdhQbfMfBcGyjqZS0wv5fpq+LKji/qtgqEY9gucPZ85k6JKqck
	F8R/faUw==
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788256eec.41.1795600056828;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788241eec.41.1795600056302;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm54307397eec.12.2026.11.25.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:35 -0800 (PST)
Message-ID: <3cbcbde4-39bc-dc36-72a6-b5171ee6730c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:17:27 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
 <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX7ZfOQwMkWIUv
 /ZqGXYF13Xh2n4xEnQxl0mNsYbPgTb6otNajZyXdBOsTeJ857oED5b9JXuivaQw6ekrvgsI0C39
 co4qKeOCfxW3hHbqqBnyZa1AHeTOU2c=
X-Proofpoint-GUID: vZk1gHaEszdhAFXciYYEOpJfC8oTeflU
X-Proofpoint-ORIG-GUID: vZk1gHaEszdhAFXciYYEOpJfC8oTeflU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX5POR6xLO1Rde
 vuzSpy+g8SI3IIPnBpTE4IDRoinFJvEU/m/XcCcOlS95pCm3f5dPTpnALAtOKX7XnvXPWuWV71g
 M7NQEeOpnnZ99EYuk4Asw50BSolALCc8Yh0CsxArKzdIi0F5BYnjYVkg8mxr8xIpknjr/6g44aa
 bICqjmpmdBU4eGzhqF13DbNpT0nS7JJgOK4c6rKrXKOt9PRfDMuwYyBTHXYLCxorSO4tz8DwWOT
 vmJXq8+zFmNoRRaBAplqJ56qbMEiDdmR5tPNBiZd9kOYNYO7S4xqgbn+hRHI+p1QrvB4OLZ58xG
 nPMjwMfBBvZyCYnUT1AgTY28vUwWEmgcGLP91Mxh8U1j7fNxhg3944VZivW6Lp8NcHXB/L9K1Qw
 8Pyf9LfvKRqQVYKkZbVmE2LVf3iVkdblkDEBb5ijvRaD/Cf9UwOnSnHspi2qXXpBzLtqm69PKil
 ypZWlfRj/PMyK/Ue7Ug==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06aeb9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dg-V5EUWANZTljz0_-gA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250038


On 11/25/2026 1:54 PM, Mukesh Ojha wrote:
> On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> On platforms where a hypervisor is present, all Secure Monitor Calls
>> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
>> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
>> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
>> authentication SMC to TZ, and upon return maps the PIL region and
>> triggers the co-processor bring-up sequence:
>> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
>>
>> On platforms without a hypervisor, Linux drives these steps directly.
>> The SHM bridge infrastructure required for this is already upstream [1].
>> To isolate firmware memory in its own Input-Output Memory Management
>> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
>> is specified via the iommus property of a video-firmware child node in
>> the device tree. A firmware device is created from this node and mapped
>> to the SID.
>> The presence of the video-firmware child node is used to detect whether
>> a hypervisor is absent: when the node is present, Linux manages the
>> IOMMU directly; when it is absent, a hypervisor is assumed to be present
>> and these steps are skipped.
>> Extend the Iris driver to support Secure Peripheral Authentication
>> Service (PAS) on platforms where Linux manages the IOMMU, by creating
>> the firmware context device and performing the necessary IOMMU mapping
>> when the firmware device SID is present.
>> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
>> @oss.qualcomm.com/
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Looks like it is almost two month after which you posted this series,

As listed in the cover letter prerequisites, this series depends on several
patches that required review and any follow-up updates, if needed. Since this
series would not work without those changes, posting this revision was delayed.

>
> So, I posted a series to move every mdt loader user to move to new pas load API.
>
> Please review this as well.
>
> https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/
>
>
