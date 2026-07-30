Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B47432E82
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417358; cv=none; b=Uvxkmxt60ZQWCRuVdEtjmiMNIBWp5RIKYiWeZ2etTAtaU0vPlOdQeidorquBL7J26dEntyR4S/JlIpIJfZewpU+W3mfipUxFVYCWhGPIYNHwakYZbhEAtXaT3NdhPwfsPpaTrWJl6nOwm06QltUtvMHJ5OQImfnIEwT3DnZ7Gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417358; c=relaxed/simple;
	bh=0Gay+noS6i9xPynkESz97KDMVs372rcQgMKKEzCCMis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kjm3WPT53Hnq5vi7QwzMQHIojPBkAm/0lCGa6AwSTiIjl35J0os329uJ3etv6LlglRG3zsc0Hk+7dwGTPIYcpQTs8mgm57nZHurWjgyhOFr2nNIplGeIe75nzZhKZ2OUC4rrFv8mdGRdgr+e1yBNF/jYIzw2olkMt+j261Wt7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7+JR+Wa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxE8VSr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7+JR+Wa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxE8VSr3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDLVN1062939
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=; b=H7+JR+WalzLgxJTU
	dflmv7r2rCk7iDtUG88n5PpgLqp0cRtMaaIzlvF0UYzQRWUtsGL+iFBaNtIMIvex
	yr1ZcuOzJDFyGIN3R2YeX+IOQUwE7jjKoIEyzq9k98aJsqsl3zjixxVUIM3CcEym
	ZNGUIrJ9e+1/74VdKHaeD81aqPMcyGyRwZR+vdIJtZhRTDLcYP1fuAwni2p9r0n9
	spOpBKGkX/PZQ5PwYflz5pYOxvU1g8I27WrSVpMAg9yGWSviElnxzkpzHlVjVpUi
	bT0pBxlpEmruz1RlTb+50rBlFG9MxSsn4jiO6kTC8LbVfOQ8OWzSLM5bAV+HaKDL
	zB+d8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfr3pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:15:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so22529241cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417353; x=1786022153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=;
        b=HxE8VSr3t1zxVWJkjc1oR8ZVEt1iV2I7yHOF7GoEAAF4EdUIvD4Z8Yawt+Bk186NFe
         UX1mdyzo2FbXm+b8AkgyAIZ44gH6MWtkArkFadUsRcBI+4JDtBvLAnnSqBqn/PYRRNz+
         jOT9KtTH9pdfd+2u7fcLOmFUaDnegsZ7N1gajU7kEMItHKMJVLWZx1lh5g1t+mYWyang
         HFLRbjParEazfPbCQCkWtCI+NTuFuCayLtzsadZInzV3svMEx9chviUYmaRD3NqILtXD
         2SSxeX6pwACtRX8J1YXGxTk4ORhaoNE1gxltvmVDdlOEgJjzOFHYySnVydRkryl2qXsR
         w64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417353; x=1786022153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=;
        b=dVAx1d6Irs6L7lt5i66yvrOmWbOZ4/ag+oPhhivn/Fj8s8aF4HwT/K/0hW9yeozqoW
         WsCrVSuFSPj+RwpkjTSPPjJwF8AubVFUNdZI4oKHfhYMqKmTV7QI947balLCjurOfVlO
         sOPEUrzYzpul6ph1CDVOx4exm4MZb5hDTMA2+goDG4euYkXd0uh5j3J0PVvW4oZZ8HR+
         l93OizHAs1SI7QEnUB5BBFEe6nUhBHtAvdhro2jmccnWzRaYOll77tIkyA4cyhySEu5X
         3YJzQHBIw7qi/0tqQM4P2Tks+8ifF8648WaRNGq3iru39WRU5meWx19+xN4mwTRnFi3w
         VabA==
X-Forwarded-Encrypted: i=1; AHgh+RpDAODe3wMotsXz4z9K7jU4nMtuAj7TIw1W8XWAKB778e6Ytsd3DjdmmXGZYAI3X7jq/KzkeTJMaX8kt3yn@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8nsFjyBK/ODOgcNZw8mMxb49XuGate4ytQi6gbwzi/d/B0To
	/hIqS/KIJwyHx0lTAHD35u6NPl6GYqGOWow9pfsutxV4CXZX3dPhTh3UzeSucD0PwGEAu65fQAq
	cJg1p2trqK70IfYINT6t4qm9HTfcj6qv59uuUMEdmOeFAOV4gvKF3WDnTocRXM3/n3gQslU08hj
	+z75o=
X-Gm-Gg: AR+sD12NEeTp4hisNMDj8T6PFqabhxLicxOgFAUPpOIXqd9r3XSlauBM8lF6zyUuAos
	Xg4bF+ZXjLR2eb+tUMtIxLm3wbBZ2rOB0I83RMKWlQI8T555KxQH5olegoQg0cF3qxAycW7w4qs
	AZNvNEuGUED81rb+feardsp5N36Oahe2KuChcPoDZed4LIwHjWi/n0gfscWVdRIZtirGJHJ+l+E
	nnl4OxQoS2ktYkT5Ufu+CDSfxAun6cbJ0MU9vSODrO+EHMpd+hOkCpDAfIAQQsyOAQta0y7W2Uf
	Hw/EbTd/4pSbSOsFPOlqvgTsD87UojfgBw7cbO+8q01WOOExZCWcsdWcFCMxs3Ux/nRrPbQscq7
	1LpDCyTNOEkLuUNeXh4G/JIkE/nMUEI4jrFJ1vIAT/gZmyoqDDnF8KZfwW2uJT9vzG0EnEObz
X-Received: by 2002:ac8:5fca:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52b38378859mr28113451cf.5.1785417353254;
        Thu, 30 Jul 2026 06:15:53 -0700 (PDT)
X-Received: by 2002:ac8:5fca:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52b38378859mr28112291cf.5.1785417352129;
        Thu, 30 Jul 2026 06:15:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm665133a12.13.2026.07.30.06.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:15:50 -0700 (PDT)
Message-ID: <c6b42741-00fe-4907-a624-ade8c1ac7e0f@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:15:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
 <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
 <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
 <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
 <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfX/fiHRINtVQC4
 pgdyQj3L7AKyirRGHDbEES7bCFumxSSaLAmhRj8UKHc8KYr88GKpevSP98dy/sydhGMkpwccn2B
 9AzwF3pduHAcwfx84Vmr9nKLQPePgh7PJ8i7Rdj/wJH220GaPzVop1qm71TH0aIzcr3KgPeq3Sl
 ffvZRF54yiaqYEXNneiOA17ZsDp1+Ya0IyOSD3ie5h9eLdZWGFqsHfbe2owpG73sXcHegpBw4IZ
 +Kh96IBjHPQA0DgpZpyR4L0GEY8sJiod3vJqvjvZoWbP6yQYJC+zxUBnEBR4/pQY8eESkf8Y1MX
 k7fAB8hGrcOoQdrQD1iRsZQEGnCXG1sXTHLEIvBwn3Qr166QuhOy78c4tRrKofj7i+2uCMufU1Q
 ko0GzFpaVhA3+EbxtYojnVgiuXmHSiQTNwHszjPekwI5jNenib8TUi695mU0Bt1nLY6DHIw2yre
 /NUzeJSqZd6CO81NnpA==
X-Proofpoint-GUID: cvCQzuCenIUNkGmvRcjEt71l2YFgdVAv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfX+omOA3bq4ofr
 7TRuiNkW6PhDh+GlZGc3w5WduvuCZJD4Z1JC/nrJEjAhWPUoKQhNXhElX9UBKM1IN+3FWhi+sFo
 iVkppHL061m19kvr93I7aq0hHOxIPQw=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b4e89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MmO552b29xJCP9fHLIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cvCQzuCenIUNkGmvRcjEt71l2YFgdVAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300100

On 7/30/2026 3:34 PM, Loic Poulain wrote:
> On Thu, Jul 30, 2026 at 1:57 PM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 30/07/2026 12:44, Loic Poulain wrote:
>>> On Wed, Jul 29, 2026 at 8:28 PM Gjorgji Rosikopulos (Consultant)
>>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Loic,
>>>>
>>>> On 7/24/2026 3:42 PM, Loic Poulain wrote:
>>>>> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
>>>>> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
>>>>> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
>>>>> ISP tuning data such as white balance, color correction and chroma
>>>>> enhancement settings.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>>>>>   include/uapi/linux/videodev2.h       | 3 +++
>>>>>   2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>        case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
>>>>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
>>>>>        case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
>>>>> +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr = "Qualcomm CAMSS ISP Parameters"; break;
>>>>>        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
>>>>>        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
>>>>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
>>>>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>>>>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>>>>>
>>>>> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
>>>>
>>>> It seems that this is generic format for ISP parameters, can we update the comment and remove offline. The proposal:
>>>> /* Vendor specific - used for Qualcomm CAMSS ISP */
>>>
>>> Sure.
>>> Loic
>>
>> Since these are not the full list and as I understand them not the full
>> structures for OPE - qcom restricting the full formats ? - I'd request
>> to move these to an OPE specific header.
> 
> Yes, I think the params struct can be OPE-specific and defined in an
> OPE-specific header. However, could we keep the enum in a generic
> header so that we only have a single enum definition? We could then
> extend it later with OPE-specific or non-OPE-specific parameters as
> needed.

The format V4L2_META_FMT_QCOM_ISP_PARAMS will be common (based on its name) across all ISP versions.
This will make it confusing for userspace to know which header to use for a given ISP version.
It would be better to have at least some protection in place to reject param types that aren't supported by a specific version.
I think the simpler approach is to keep these as generic Qcom-specific params for now,
and only split them out if we actually end up with the same blocks using different parameters across versions.
But for sure that can be done latter when new params and ISP's are introduced. It was just an proposal.

~Gjorgji


> 
> Regards,
> Loic

