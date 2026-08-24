Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E237998B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548351; cv=none; b=m87h2saLqnDIU6rFSS2yxoyVt9OMW/roh5adn0b+NV3/L4wLLwVg/Z4/oBljxrDN+kXga1S/6uZHOCig0XW9YCXciF+F3jJwecMmucguPrtIQygwWEZ82s1hlyfQU3aFPsix1N9WqC2ZUGJJsV3EPu9QA3N1TNsx2TZ8aPsxRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548351; c=relaxed/simple;
	bh=mGThAuxhbTV59kIcu+8QTu4hX+usDq7DbMJGN6eliHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0CiBi4CT18p2ma2fSbqJOT3ugyc6G93gtBwXFnDZ2BzgYQ+Z30Z9ZRMMX+n4lJg+NFjQ3GBb4yj8PshKYIavnP1TfZMWHubh5N1fhbF8/BeERUk59ssdkJbRdjq6TCjDzTjLaow584V5CZ6ly27xbme6uW2R/JbyKRz1yKBK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvmpaUdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhD2OTpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvmpaUdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhD2OTpL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lWk11795354
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6747R6qvu1QuuseVmT1NLQ6X33S7Ag7V6qhBq21RWk=; b=FvmpaUdjDDcAyNwi
	msEUOUkPVZorDXXRSMswPmGdAmNl6djAcycbObOOEPvedR2NinBddNeblYI8/zUw
	+clFRnM3/d9fNd5SEh5OGGwHetyIZNr4yx+BPjGqSxTnm4pgr7u7WeW+TpMCm148
	Hb76Lo1Fi1J/4CoxaGo8iMTdE5sDnniR7/EIznoh4B0PaZGp/kkdv7vdQWJ7eEYe
	6pMVha3aUkMUY5RQvxaii2mdZwZOspSgxD30fSTLFpsFIGAIC8/j58ZwMbg1703T
	N2G318j/M59OJlfEWy6Ws86I9qbqq74fF2zndzGlfcSbB36iI6BYJ+OSAwza4DmL
	8wLnOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a5gqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:12:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso38397685ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548348; x=1788153148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6747R6qvu1QuuseVmT1NLQ6X33S7Ag7V6qhBq21RWk=;
        b=MhD2OTpLUvFKMQC0P/l5uyACnE95zIDbJqFS2Hzd1cH+F7MvWolSn0iwt/OBbB14Vs
         0ZNI9DXcQLc/fN873/60oB3iY1UG25/+MmXj+Ogoq68wUfQIzyfUFWOg+N4BqL52mJhW
         53J4IHSQPq/51p2OFy/8DMaKDzlB7wBxucDjv+y2gLKlTt4iVskY4R7qNig1anJrZo7N
         LVYj9SX/uZuCxIgjcKKE5fdsDA0TF0j9/OV8yaxVZcjDJ+LxeBr5UgQCjz1eLWMqrPJR
         dECkF17jvq1azmGbKfdJhon4qdlzNoa32Q5XNGu4OFqy4wDXB1Z+93ljzaMpMdt670uV
         L+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548348; x=1788153148;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6747R6qvu1QuuseVmT1NLQ6X33S7Ag7V6qhBq21RWk=;
        b=ByWX+flUqU25SELtEXcXWVROjaMlnj4mGwkTRvMAc3AuQZojVqJR2XKXdUXlvmZTFr
         sOInIxpEVTer0aPkf/gpysH3J7JNJym2FPkvHqlKUfzE6ALnUGCyMo2otCSVIq6ak/vS
         PFyZfHGGB2tkcDQJ1qaE0r7TG4Oz3ZnjE4beT7hjzDrhiukb0oS/MS5ufGjRyPQB90oC
         6kNZoQPYjZ4frbGiMI1d0dGBjWVVD0XQBTvdgQ+yp2JPpzkSC2T6+Du7PugCr2uZfmRx
         c166Px+Pjlw0J8jK/u+BAd+2gUBz2YjuUBmXWSq/HIicxCSMocBl6NiEIKSOVtWtAZIE
         qMrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7h04Y6Xeb39WQqNfVHemwiWzi7jEChZ5GNecmpkbdqFlzp8C+rczPM4wR7crZJf9L063oVdVQlsrYOc8e@vger.kernel.org
X-Gm-Message-State: AFuF++lGOOXz07llJpInvR6KnwReju8lvPVeGerBvDwKx/ALFhSZEuev
	dQHwYUDKHN/1Gk5M/b4m/4Qtmvyssi11t+dzKnPtFgQQGOKNPSyl0Y2ucbXcenf0Z+/yKNgGSZg
	fDpWHU0M+DotFqfryC2giRXnNHP23x53uOh9mJtERPA96Go3VrdBdmNEVYqbnlbIorcmu
X-Gm-Gg: AR+sD10q4juFpqcF4zaMXo4pPXg9Nnt+K+mADVsBDTCRHw7iTn2/9v+UOQomcTOJCsW
	t2Y5LOY9COzrM3ucPeMWuzTgH6toKb32VHWj5Lod622/Dg79LTVsTkVBiqNAVthtchIsfnCHoA3
	3WtCT+ybdr44MR0OhdaPM3wYNx8KuUJ4owOz/wZH+AQps0+7+51M3ykltAsfL96P8wAoEL0ESuR
	eZC7ihB4N98n6PRa6GI4JBlykymH3pPai0xElM4M2yi0fQ2vk/Gkh67fqzsOLztNtAMP+LfyLqj
	TkzUW7qEW7yRIHlF/h/cCPu/p3446H0gTcJkA8PvHje+ru8xSMCUUdC2FOolpmI3O29Voq/XrjG
	NDS1zRM1UfF8LoHtBHM0dVRUN6YNL9Mvk
X-Received: by 2002:a17:903:19cf:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d61a15e3e6mr370760805ad.9.1787548348228;
        Sun, 23 Aug 2026 22:12:28 -0700 (PDT)
X-Received: by 2002:a17:903:19cf:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d61a15e3e6mr370760325ad.9.1787548347751;
        Sun, 23 Aug 2026 22:12:27 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d37cesm25654613eec.15.2026.08.23.22.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:12:26 -0700 (PDT)
Message-ID: <8260df5e-700e-4719-c4ae-fed211dd000b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:42:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <235vlp2bxpqpvgtcqlj3gyh2akclnit4p5lo2boagn4xsgzfeo@qnehnkaye2ru>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <235vlp2bxpqpvgtcqlj3gyh2akclnit4p5lo2boagn4xsgzfeo@qnehnkaye2ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX17pkGxf/M3hY
 fGSgs8q3y2YBLKX+gx8rNT+cPShaimTvbJgRUOT1QAV7KkQUqPyeV+EJgdRt5/B4uaTFYCJ8zo1
 bgAGFEHvG0TCZkJHEqtJirpIaQgJaFGZU3d/HrcnxP/z3gS66VjXCinceAu/qXSi+tzaGWLPJXJ
 Ika3oMFd8mkacWybQPEB3InkWPaNPvSCcipU9KebnJCw6HCbZmpZ+2gGSNOs2er33y5UFhxBo/I
 zbH8YNYoEu73pVcH45/aUsuuS+31lYXjgesAfOTOcxu4sRKZJPDVtBqsL0qmG134pjMsGMvmU2Z
 1PcEfL3acOSOSswODm9SqhvAp+mWmQvrEXkfnDZKIjr6aNW1mOk7EjxcKzglQESqy9m4Sgv2boW
 16OX6Su7C9NFQe/yh+hQpW/MGT7OK7CdFnMimakTbVhKqXGc5zq0TylayRrQ7YVGj/PnbrIQ3BG
 +dsldu0066XplPkxsSw==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a8bd2bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OMyujwfoVTX1xui5GF4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SuqCfTv5ALkdBWWkiVV7NFNaj5_O6pf4
X-Proofpoint-GUID: SuqCfTv5ALkdBWWkiVV7NFNaj5_O6pf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX/3RtSDVXKK7/
 1DhjzV4ssB9sKn22GIYpUTPmVwnTh+M57mZ41abxPhNbny1xO+kj3sUzpZBIvBKOzFQRlFJ32Gu
 nM8mNIHYJE2HeWo0buz/Tg7zn3bDVEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240044


On 8/19/2026 4:11 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 18, 2026 at 09:24:14PM +0530, Vishnu Reddy wrote:
>> While testing with some higher resolution clips, the venus hardware
>> triggers a fault due to wrong input data being received. Corruption
>> was also observed in the captured output when the client dumped it
>> to a file.
>>
>> On debugging, found that DMA buffers shared between the CPU and the
>> venus video hardware/controller are not in sync. CPU writes to an input
>> buffer can remain in CPU cache without being visible to the video
>> hardware when it reads the same buffer, so the hardware receives input
>> data that does not match what the CPU wrote. Likewise, on the capture
>> path, data written by the video hardware to the output buffer may not
>> be visible to the CPU, so the client reads stale or partial data,
>> resulting in corruption.
>>
>> Add dma sync API calls to synchronize the data between the CPU cache
>> and the venus hardware/controller.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
> Missing Fixes tag

Ack. Will add in next revision.

>
