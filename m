Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576794;
	b=1MtBwNgU0k5HKavEPr29QnEuHsn3dZaMDW4ivzilY8Mc7V17W4xAY6k8rZGgK68OlidN
	 hKP0To78wckbMAITNXdMQNSKVXxXPH8B8M7XSfCViutAnN2IqYBa0KFg0RgjtOklwWAve
	 uLdDTWNFOznvThuFs8pVLPI6IDteugUrH9HV4J399lj4t/dj8AfhXd5qzzIELJppwtsI+
	 x0H+ff37Ffxphls+jzy6u9p9Z1Jm0vBejxnoUnGoYQIn/8+o6iv0tnd/5tb83G8K3jZoq
	 2KJksVLOWSrNIF1/Zf3Bymnq4++ceUDeh+vgI8eaqO6/0oeYinnp7MqaNbti6j7HeHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
	b=KzKdPvHDLdVUxVEd7e2PZ83gmSDeZJ/m+rNnhoahG6KBuzyKk0h7a9CsTlNVIYuWIneq
	 V+YJucOZCTqzL0MfMUjUkBB/K3r4E8BHMPHN2SN15frJAAWz2aOgiUjFUF+xrZwlvPUED
	 1aBibIlKCjRVu0Qm4X6C/O39ouyKZMldzlnp2FeBLTPDFWJg15qngmGS5a5IA6l9/7KEV
	 hTuOoo2/ps1NUUWmSfwLDKeGyuL53ctAZ7g3f5loiyRBCC0HefSBgi9Z85e86TMGNbyMr
	 c6Bn9HJiB86W+Ck43DErzLPyXjlcLUEzFTssiJPwX3B5m8c+NhKIDOoGGtVVMbd+QQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C3606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L94ugX3484746
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=; b=jOQ7rFJfoJnRqvLp
	cZvlaCpXNpC2EV4vALOwIWs/r7eZLrNflrlH8fVX0JFAG2qr/4gsdlmRRVlJRWdK
	hIBYEDPVmQdcwtn/ZOjUg4jq0jU+WNez1YfLxGfflCiQLE9Ck63dacgTeyzEysak
	MFoY50OMV9UT7tcYk0UNEIM1YbQvNPS2sRr3eUxebEzeOciBHhrMSPTDIVt+jT0Q
	DBM5nfnUVakz23nftf8OAO45caF6prRog8cfaXbX5B7Bhv0e8eJL7nUiZd0CRbJm
	53SNRckMdyrr3Q2h4BGHt+C1pP5ALpysqOkwGBvxvk+7wLLO/BRN5CEtk1MbRFfq
	d2qvAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3s4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so1128996d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576792; x=1793181592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=N8ngMJpDpmqvmCXL7svp5vq14+su31741tUruWUGMusXuozXYSFIuY3PqL76btaMWc
         BQex0rHp424rgZlu1KTNAiQPLealRv6tJtQBSl7hY/15kEq1a1ZX4IBoH9MQOlmPpk3r
         viXd1Nm6VKqmznIPZON3x8uEXJIjWAJdgUGb7u9dyZpwyr4amjBKX1+Cwe3HeQBBdi14
         8Dio6Zwix8rYxf/Js/0SElRUn6qWAlDH1qyG0PJaGGTGvM5t5tCMSLVZA3ARUFBBqPa6
         i3EepNwoNhop+iZUuQep+nAj/+KYmd/DYG6HdgOiX9uvgMooOEc5FsnI8p7Kdj29WaXH
         OFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576792; x=1793181592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=25iiOTihr0BrCklm5fjliUyuOmR4jV+o+R8Qz1vlvV4h1swm3SgfiBZdtnikQyy599
         MVkNR3GPIP6Tz3GTmWgN9gyNEFfIbUJvy5Lp0AKhkXtVocadAW3u4ekKHvDAVXeI3flB
         beYV8/tmUhRw9oqfIJRo2n8HHhPjmUfCScJtl7cET4HHouzGAZIFIYn23qDtcngUtCid
         dTs8/EIUX7Xj/S8WFxrtSRzCaYT8lBrKzBuiYf7qutM9XuiBZyA9Dp/vxUPx79ef94cM
         PtJ6e7eSE8dZanIUbBcKNMQG624UMpqfFpTsY/cw1BnWGdlX4OIqHeKDUprki15Zs8/7
         cPng==
X-Gm-Message-State: AFq9FYK0CRPGO6M9d4HD2YmQIl+CDDFOFPdQgq+kqOlltsef+9QZcs4A
	5miJHV6twGBDc4a8P/23orgUvVPs9y2OaqwsDd4AsaeiPfVGH0qGEXT0M5ji2mJ+n0qP0gSQ7HG
	d3sV6EMq4jRX2g0WOJ6SKmcfX9zLXMeuccbVmozkOvRYCnJSAI8CV4sILmMiX07WN+n/D
X-Gm-Gg: AYBFou1NuxqKFThrjfprxbvZJkfWKvREPaQCJ5I/EgsA9Wud55D/axDepxDfuqSANYR
	E619DKYjwmjEfTvPGOx7puYxwxJniyjBNi2pI6a8FPtcO0UB6H0rlYlB5d01pvO08QBsFMBHGxQ
	ci78801Z51+8Ond3faifRYGWow8fjx1uXlyuCpYZ9sKqKvusDMH/LJ2s9esuNkLBiQiFbq8PlUD
	pvUstcWR81S35xK/QXPzNN2UPyfeAbL75pmRFKB/7oolUuskhtgmSliAyxKTr5RhZN3uG4sWnbg
	5Ypxp6PvXXq7HALYOeX2GNzS4wYhfUrC9I7llNau05LFVuRJ2CEAB4uHW48yUI82e4R7n+CiDPU
	jBdU+hUM3pl7RW1E7H+1aRA==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364453885a.2.1792576792352;
        Wed, 21 Oct 2026 02:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364451285a.2.1792576791929;
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315506bsm685930a12.29.2026.10.21.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Message-ID: <f09674f9-5336-4e0a-bd68-cd9572c8d0b7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:59:48 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_wcss: Fix missing subdev cleanup in
 q6v5_wcss_remove()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX5MFV6IYfTiyn
 7uUO6BHJrozvF1z0RWOCOFHVO9QSoUAfqxOlPs8nqRfD79UWdkiUgrnxXLe6mx+LZ3XrPwdBnHn
 1x10tdTylnC055KY2sOMNgRj7KckMjkJMr8zSyf1eW9zLpLtXYWHusT+tp6C8G60mozFhmksfIl
 W5omNZyci+JbQOI0lLSVCNJhVhFHE3JLnpzfGFw2Jle7GlVe+0e9MG9LeUF3JmLY/0KViIvJGqG
 aMZOTEfct571u2NEeOGHrMym2KWbwbHR45vVzTJmAKZwPxiigAUiMI81DNjTbB+yplcSHHOJDsa
 TK2rn1ePJw1TSdTrnDO5pF2Vltu7o5bQ+BQypDcBNqWx8R/ou27UriAMvo2+PLLI/T0M5OnFzMY
 /OwS2kIcJz5+DnXF0vZN9ATCc8Oj0wc5ZHUYXSjWrkEwMz+mLOvJeVqoc9rhDbnsawWhFokBKM8
 tpNvRK0OeeiM/HBnoCg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad88d19 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=o47FBeiU2xnD7M33FAIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 3QtL0_dyHL722iLCiHsLOTOZ7sKtXz32
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX3VAJnifLGagp
 sq0aYX97HjIyMZ5xQ4ZkDa1ahdJSkc3+gnG7grcrMUQsg/01xlIWy+FpLWE/S6Oma6ez8p4GPjV
 8bcrUY/SmCesND+Gpr2KRwNKMPKSJ3Q=
X-Proofpoint-GUID: 3QtL0_dyHL722iLCiHsLOTOZ7sKtXz32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/6/26 9:29 AM, Anup Vishwakarma wrote:
> q6v5_wcss_remove() omits the cleanup for the sysmon, glink, and ssr
> subdevices that are registered in q6v5_wcss_probe(). This leaves these
> subdevices registered in the rproc subdev list after driver unbind,
> which can cause use-after-free if the rproc framework subsequently
> accesses them.
> 
> Additionally, rproc_del() is currently called after the subdev cleanup,
> but it must be called first. rproc_del() internally calls rproc_stop(),
> which invokes rproc_stop_subdevices() and rproc_unprepare_subdevices()
> to run each subdev's stop/unprepare callbacks. If subdevices are removed
> from the list before rproc_del(), those callbacks are never invoked.
> The correct order, as used in sibling drivers such as adsp_remove() and
> wcnss_remove(), is to call rproc_del() first, then remove the subdevices.
> 
> Fix both issues by calling rproc_del() first, then removing all
> registered subdevices. qcom_remove_sysmon_subdev() already handles a
> NULL argument gracefully, so it can be called unconditionally for
> platforms where the sysmon subdev is not registered.
> 
> Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
