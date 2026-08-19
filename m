Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECE450400
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136637; cv=none; b=SIpTkbKnItZM6qoi2mzdUNPUXpQb0QdeaLF43thjJJ2GTcUxZOIQ47H+pW6Zf93DdA70RVOaJFymcnijjrNXakM/fBGSYIYbdZAcJyMl+AWQq58z+648xEAFKfiQN1UKS0Z1j5eiN6dk4fhFWP+WqK54bnlVuMlHcjJVCKaaGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136637; c=relaxed/simple;
	bh=pLWeqxVmPvAmK5OgRYY2xNh5uO18zjVWsLOf/nW+/UY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VSZQjS6fbAE2DEcXVfDknKXYG1T/W9wR1RoKejzCr0DeFkGtKQKz9QPQkC25lD2gVXC26jNf6jf/MX0YUBVeyySCmSIj7nwdbBeG+8/GpjztbWPhvKYC55jCIRbBH+ntNwfzRyJVTR8JJF3Pa8LQvbEj/DdAW9mircPeoiaTZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zk5HBTPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cc1uzKpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zk5HBTPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cc1uzKpd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7nEq2947176
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ru3BDW+zbBTYwuxf1PK5soAsOVJiRJQNXfeOdOADGQ=; b=Zk5HBTPK2ZbVEjRN
	ZfTm9FeoFHZ0BGZobeOYfCqFPJN4DA6EOBe1ruQE0uW/aaXSVggyIKxz7Splnb18
	i/a2yXb7cPGNNYeiOkXNeDidm/jaz8exsopgs1zZEdxLZZMObkbb5tWhzvaiKLZw
	ALnYTsH5bbKNVgpQC91FANBmRRU3//NdczZkUf2i1/TNj1fc9LH9hlsI1y1DTH4r
	aR52jJebZKHcAFgfBdXSURlabCRpTYjafH3T9e2k4kY0Ob6GEldqcedXlGw+7U+s
	GiDT+Htx+q/JXEhWbKUKwHl4sBFeiPsgixDA2u4k53JESoKZ9yaMcYfaHcqn5kEB
	YqMZhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkat2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:50:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso1299446a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136634; x=1787741434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ru3BDW+zbBTYwuxf1PK5soAsOVJiRJQNXfeOdOADGQ=;
        b=Cc1uzKpdQjcolXa/N+4qsfmXu0o0LGTUug11lmIW04EalhR+2yxe1/z8UnBKIL4c5Z
         arVw358Vp0I4+XUtqUSG8n2RVNcxPXGkZFYYjUHvvu3PkbZLxPsSbIJiPm8LOg2LB8WJ
         LJEbqUX94S1WKtZevYqi6QzbpwK/zlqy9E5E+EFcFLonLj02BVk/D/kr9uNly9F80Avu
         Db3U1B5/LukOaU2XYGe7izmMPvk+qy/OEToJjutFHuzN/MtUdSNx+Vs6L6eoC62aHsi+
         9qzRq8dju9gTSmSodfbesbzppI8QbGX+pmh0pwAQGVJf3O5mI7Lb7ATUmAwn/LToprFh
         wk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136634; x=1787741434;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ru3BDW+zbBTYwuxf1PK5soAsOVJiRJQNXfeOdOADGQ=;
        b=Dm4XSl3C8pKJaYLqkm+HcSlYd54dCod4b72Hs9/gp3ZbRFo5RXWIF5ITziCpx2vaVz
         JkDTr3BDQR26O5wo7FarDz2j9JjcwEbNS8lGQNqyWLv72Z055NltvOEVM0XsPzc1U93j
         KTE5PJjNqJ9+mkhY4HTCzyAKc33q0pxBn9utfKQXYJcxyuO46f2wn6MeQzpA4SSlDT5V
         0fMUn/gzK534rjuWADHNOrbdzaCKYK0Un8vqtyuwQezy5LLh5Lo4N0P4B1Wm5jCSAa3z
         3+6e5grabrwQt1uM9k2i+rFj6UQIDDGLduqn+MgwGXrJtaIJDvN5NOTj3Li9qLlYycYC
         mN2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rotwt3k5e2jJtnXysVso9KmGAT92GK576AJTsMhZ+kCFOAxh8b/7XgfkCfiVUAOYYQ9DlYtFvbbgBhxlzXR@vger.kernel.org
X-Gm-Message-State: AFuF++mZpoGNHL0RFCH9Oga77siPGYVX5rKTWxCcNSgxQjuLWJTZsldx
	prSZATwwNEDJRnzvDTGYLRNrd/PEZrTPY/8PABoWDX5SBw4qd9zHlvBRof7YgQqpM900zDL4yoq
	rdvJBwR8yKfCJv8YI5XWZ+Ms5wFshFIsOWC7QxFA4D09/jgCeqDgvWmDttE0o058fosQSoMQ4b9
	wU
X-Gm-Gg: AR+sD11PtHD3lZqbOneXhCsSiKe+8P6bAJ7hH9t6sHJGLmw005MXn8UhI65Fsh8vdFA
	xQvQ0rcoNvvwpx0vvTnUPmIEiy9jvnlFCb/b7VZLvYZFZgfCguBBr17jHt1vQodB5ybceoCRwi0
	V0KOThHnVSgjtrKDbb8S6di8742nUaye+Rhp+Fzpo6XApxOCB4vhHZiXmnsaYE/db44PTDRgCTT
	P2rQKjYc03FBRpikTOg8bbz9YcB/00ElD8SWZb2smsJCd0KeS2tn9dakigpsRqLbIyGVSCcUK37
	VmT0tnOakqwc0zVG/lUo6wusXPF7yQNDJbLwcj/oIJj+VPF/gXd1kV2jngzn3S3oQruMjEO6O+v
	13fMtQ/Ek2BpCAtOMttA8j/gCfpg=
X-Received: by 2002:a17:90b:1f8f:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-39580840520mr7573141a91.1.1787136633756;
        Wed, 19 Aug 2026 03:50:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8f:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-39580840520mr7573006a91.1.1787136632948;
        Wed, 19 Aug 2026 03:50:32 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb7cc17sm2630469a91.9.2026.08.19.03.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:50:32 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Eric Biggers <ebiggers@kernel.org>,
        Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
 <20260811151759.1258525-3-neeraj.soni@oss.qualcomm.com>
 <20260811190851.GC2895176@google.com>
 <877c20e3-625c-4ba8-beed-305393b18cfe@oss.qualcomm.com>
 <20260818171227.GA2249@quark>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <7ed514be-080d-ec2a-0803-9c884c69f4fc@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:20:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260818171227.GA2249@quark>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a858a7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kxn0zb7G7q0rBOJBbKkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX3z5Ui+g2+JjO
 vSCTVmgmWlTLAvuyge5r2N6Le+W0++wbhEknCW1MsSquiudWs6RvsCZpSLgOwcfbaTCIQr5jhqh
 XPveqE+mlBrDrNCG9g4ihEWrJX7ERVUa0mt8bPJmCy2yRX+0yH1vm9oGjVNSvIloDVd4kMIUiDx
 mhjxxizhBH427xQhGZAgX/tTylBL1RzKq38Mskir2a+vYx0Go+9fC1XB7Bg91TX5ImHMqHGZuYQ
 66QePJUAqZ9mcpETj9XTWUWkE5E0m2/pUtU4O2RXNk9aMbRmrEEhQvHrAfIWWvY9tddCUr0uLwm
 nNuhs9njej5wXvnPXFeQ5mNo5gyKkG2/8ePiyHaPfDJac+w6QBcNZkRcM/jy6vqb7rQ+14khkF+
 ImPqnZqfkjFc3pAujWPNh9IP2VVKtw4fHG4OjRXOx1JQU+HBtaVGV7K4MuWdGuKyeS4YeIsi4dC
 W5hzibpJGlZa0IvHbHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX9eL/M3KyzPRv
 jRQFnXs1sl5MtZVlIcEAhtk9dlX+d9NPomiEf3RoXskyr95iK96n/yZ3r3gppdh6qr9KecoSAdl
 NdS/TTUZMUFFVbdNA13+7H5GGG8Oi8o=
X-Proofpoint-GUID: sMRYVk8o5Pijy3QZ4eoOeE883fyGtpJw
X-Proofpoint-ORIG-GUID: sMRYVk8o5Pijy3QZ4eoOeE883fyGtpJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083



On 8/18/2026 10:42 PM, Eric Biggers wrote:
> On Tue, Aug 18, 2026 at 01:00:21PM +0530, Ram Prakash Gupta wrote:
>>
>>
>> On 8/12/2026 12:38 AM, Eric Biggers wrote:
>>> On Tue, Aug 11, 2026 at 08:47:59PM +0530, Neeraj Soni wrote:
>>>> From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>>
>>>> Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
>>>> needs to be restored when hibernation exits. ICE keys are re-programmed
>>>> during sdhci_msm_ice_init() but it may not cover cases where the
>>>> hibernation image is already restored.
>>>>
>>>> Unwrap the pm ops and use directly in driver to add the call to restore
>>>> Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
>>>> same state as before hibernation.
>>>>
>>>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
>>>> keys is not needed during MMC runtime suspend/resume.
>>>>
>>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>> ---
>>>>  drivers/mmc/host/sdhci-msm.c | 32 +++++++++++++++++++++++++++++++-
>>>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>>
>>> So with this patch, resume from hibernation will be the *only* time that
>>> ICE keys are reprogrammed.  Are you absolutely sure that is enough on
>>> every SoC this driver supports?  What about resume from suspend-to-RAM?
>>> CQE error recovery?  What if the hibernation image fails to be created?
>>>
>>> - Eric
>>
>> Hi Eric,
>>
>> There are two scenarios where key would be required to reprogram, first is when
>> rail powering the ICE goes off or SDCC does BCR reset.
>>
>> now during suspend-to-RAM, rail powering the ice wont go off, so key would not
>> be required to reprogram. During CQE recovery, key would be only lost when BCR
>> reset is performed but that is not happening right now, to be taken up once its
>> fixed as part of recovery flow. And in case hibernation image fails to create
>> then device boots from normal flow where there is no need to reprogram the keys.
>>
> 
> Okay this patch should be okay then.  Seems that the commit message
> needs some work though to properly explain this.
>
Ack. Will update and post v8.
 
> - Eric
> 
Regards,
Neeraj
