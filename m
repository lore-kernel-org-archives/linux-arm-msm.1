Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1255C1A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881715; cv=none; b=j8d5ZkJzAZOrwyT7rno7k8wWYFzbPrn4THnRtruM11JgHX/taXp1tfRRFu1h6NmYpO+PFc051NxDEAHJQq4IwPw361qNkwqlPpw7VmjI4o4FyTbtucY+W8U8UbCrik4DHcdjIDVjZnasHRp1g0WTDaat21IaIKbxYqKewSJKZR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881715; c=relaxed/simple;
	bh=ztsuEXkA78vbJ/cDjG4h6EM6vidYirOFvoPafcKsGyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA0rJETM9+al2KeqSUrXiZqjVqmiogxpOFBUIO64+vkdpBz/jWUxo9Nq6mZC/Rc8dHd91/8WOQong0nMBsAKMUVBKETBcAiXOsK0LbN3wd0ZvsN65FnLo4zCCN+pKcUdixdP4XMuqsQDLI9f7k1hrgdM5xnfoTGhGPaF2bHeltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku7Qaw9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNdXDma8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku7Qaw9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNdXDma8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FV2L73739293
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=; b=Ku7Qaw9/RpU9AT7S
	ldYZpRx+ImifiHDmNWZXMsjUjGqnPZB6gQE+dD/3Es5Rkl18unPftyebqqsJs0Ao
	B8y/SbkCz38nATer3K6reBbgwlPZXpXUZFStSyQKqloCRaem2zMMZ3JBINWZ3UrF
	eQXP6I/1b37caaDoXSbScuejX0oYQTqGacX3CB5Cn/BR2CIBCmaW6CXChn1bpgip
	3KPQbs+zGAG7TwVvVOKuop9euNCGi0RCgwBQfZQbikH/uYNB0G+tKUfs9yMFX0aM
	dgxyHRxSZAvpRTncJf31XBtyhOmcUPwcWvPQLFT9F1+AjcqvQDrh9Vp1W49YnlM0
	vP02Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7jds3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:35:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93771aa0379so928963085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881700; x=1789486500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=CNdXDma8PuXBjlo1YmoxfsIlb6tqKrF2WkFwW0FhBdhJB6L9S3U1HViVQ1UeVrof/e
         SyrNU6do1siVBio/MxmlEFucNJBQSv4rMxTfekE2/pCQi1+nzEa6yW+LzKlNp8ezSAYy
         azsClmRlIFe4D3/z0bYQSF93Hav04mmntIAtKrcJif5daCdE3AavN81WUBnEWN4gaSnd
         Peoc/ZDGvAKqFPAR2No6RSNvsiRe0QEQmJexPltCvMMK3vPUybkJG5rRbwoFoDHWNysV
         H65WhLWiWuCdh+CXdjF1sBrQY+GOuPAJiZuoant98ngV+sBakylfSm4Ga9W/zmiV44wP
         1fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881700; x=1789486500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=a+BRQW+6g0LrcjN2m2bQ9dlnZGPKcswVKNFFZ5Phdd/O/ZckqFoN8XHq9WYyujgmU7
         3dXYz1wem1nZLrDwrKbPYSM8t0qgHXi4uSX6qHNfgFDfOCAh062tGhnpCsOX21vwy1IL
         WL14iPerJfDVwaaAc/40ouUd1Sltfvjvz1kCXyDB8lLkPjuyMg946mJSK7FV0UtBrDEb
         aJ38/kgaBcLtXEPq+asaYd6e031zm8MhjmgO79v9y2u+p+5oQ8XXoD6U/5wE5oCxPZdO
         f7PR6vOu9zbZLqRrSGiSnQxVk1DQHjT133/XPmM1DnzPP+r6f+95dQkgNWVtQtGtevny
         il0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGa03Y6f+mIpXaibdUfUYFp1CnncXz0jdWyUKRdYqtOREIpMF/8wQQAf405DCTwYMUkp2/ZasFGGX8blEK@vger.kernel.org
X-Gm-Message-State: AFuF++mxZyHvlXbnmJwN4qLfocwaNUo/PMUp15diQ9lvTY+6ZRk7HQoc
	OU1M63skynMIYu/6sL8oP7FMhsTJinssxLq9W6Aw0f571Ktfhg9oN1P7gpTyPLH3hAKJnRvEPFI
	Mh+pDEIdXRlaOXON2NwaQpOcJD8wkIWC5F8spGX6kQpgr81sPjcEXiRystSDLuI+mb6SS
X-Gm-Gg: AYBFou3hB8MdgAgIyVXLBAnQpRHiI87RilvTZ8LXzBogwiUCtnyOAQKhd1BAXeceuV1
	dfB5w9+4k2eO5wGu0bgE7sSNlC7yC7Yj06Bow6umeCo6gOlta3i6eOcGTj0yk5Ki/Jh23h7hJwj
	C++jDl3RI5QXntJWD3Bbudrrp8r8Bn+p5HO6efNvRYZ10IIYLJLF5ylwdXKimSMhcnpMhhHgplV
	sdVA8USAvlW99SaYCGM7rcvGgRyfLFF8RxeFPY6m1i5+ncY655tZb5iQ/PQOvsSxwBKpDcQMPoo
	meT4tWn6AEk3sJ+7hA8VazNokMDHa6Tzw6RvELX0JSBlhUYvHGlsRslZclDgEO20LX0zC4PJb8b
	go+joLe6FNgUNq2n7ph1P2J01b0g=
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563034585a.37.1788881699522;
        Tue, 08 Sep 2026 08:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563025985a.37.1788881698939;
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm35628669f8f.16.2026.09.08.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Message-ID: <9c0adaab-b725-4ce6-86cc-e57dc33bfa9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
 <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
 <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa02b29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UsgDQBPQtW9oUzukNeMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX1jVKDfFreEnl
 QRATcmE4QWN2yaf2nbw9/tq3UY3NW0YnQK3gJyNPDUFxdUR1eveJ3v8QnXQ8vpvD+Q1WGc6TwDN
 UYUjsByn+eQi/b4TIsYo6kOiQheMthg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX9D8M8Wm1GzDa
 oWzlb8U5IqpCudpGE298CVFmtBwnv9iTNvp2tDD+x5GHDhU1lFT+ORY/p1lIgyXw+pDObmxUoIG
 Gd2nor9xq3m3miJA+eZe/01K/KQnbLjJU5JNYWuQN/8hskmZ8gFrWqe5AeL3xHJWxp9MNLPT+LV
 sGoleCi1hx6a7wJWw0rs7k4MAf0J+OQ/q2F0WYq7OQg78saw7gJKZq5dKbuKaj2q25jFIpbvgcb
 /sMsPwQbLSVid/POz7P/RC+EHpkJh/An8UX7R4AIJComtputfPTT2dhsEBP03l6likKLcREsFdn
 Et6Rm53rnuUvQ2y2UK8IdH1sWEPTLH7gwZ95vYQoKc7hdg+7JmQh2Dk8rguQv+5rZIDJ+hTZ5Os
 +ioXp9T8v1CrHPRSJ3tcu6BT7dBMI9R2SwOJyVO9JVhcocQgNA5t/Qj0DvcDGmNnRC8EW+aEY5c
 C+dnJPYiit2uDQbeCJg==
X-Proofpoint-ORIG-GUID: Xdz5MrteaJjtSotbvDIjpVZY-qyQrhLk
X-Proofpoint-GUID: Xdz5MrteaJjtSotbvDIjpVZY-qyQrhLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

On 9/8/26 4:33 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 04:22:53PM +0200, Pierre-Louis Bossart wrote:
>>>>> That's why the current series takes the lower-overhead path
>>>>> (mechanical transcription in C) rather than proposing an intermediate
>>>>> DT format as part of this submission.  If the concept-DT direction
>>>>> gets traction at LPC 2026 DT MC, we can revisit.
>>>>
>>>> This part I follow slightly better, I would be happy to proceed,
>>>> pending reviews with the current approach, although if Pierre
>>>> is or not probably remains to be seen.
>>>
>>> @Pierre
>>> Please let us know if you are okay with this approach of C structures.
>> Now that I have more context, I don't have any objections with Srini's
>> proposal. It'd a good step forward to use common class drivers across
>> multiple vendors, we'll probably find a couple of bugs or harden the
>> SDCA core and that'd be good progress for everyone developing or
>> depending on the ASoC/SoundWire/SDCA frameworks.
>>
>> If this means that in an intermediate step C tables are used, that's
>> fine with me. In the long run, things might change with additional
>> options such as:
>> a) ACPI support on all platforms
>> b) DT hybrid mode to reuse ACPI/DSDT tables
>> c) DT native representation of properties.
>> We can review the preferred direction when the platform firmware
>> plumbing improves.
>>
>> I believe the point about binary/opaque data was noted by Srini, it can
>> be handled in multiple ways and there's no reason to block.
>>
>> Best to start small at the SDCA level with incremental changes later on
>> how to fetch DisCo information from platform firmware - that wouldn't
>> change the system behavior, only optimize by making the translation from
>> DSDT to C tables un-necessary.
> 
> Super, thanks Pierre. I will start working through a more
> detailed review of the series.

Thanks Charles and Pierre for reviewing this series.

--srini
> 
> Thanks,
> Charles

