Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAE3BADA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159597; cv=none; b=uaiPK+SChU76MKftRCJo4G5usydEBigkm48lwKEtaj2P66jwkE/bJlkZfjtMQH6HjFZvb5iKA6kaLIZx55SSSA1U0NgR4RXBzyuvqKojeoLOKSz8TEVUiAgS+impX2fIHAML8tn8AcUHDXyIK2ePeYEBO65OJuZqtJVTx8T8jvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159597; c=relaxed/simple;
	bh=Z90XMjj19ezM12K28AtL6SIr77GIYl4LGLPwkbrSqHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbQV40ZWFZ/5RICglJG9FNgL0uxZylWM2nyzPgb+/46BlaapHa6fUKETCgLALVn68jXAhPdOew/9Ug8nalk1bXrVTfvT9l4SYCG7jHU/VC31tHqWMXJg7P2ln0qUq3rYYyFT3o+yF7+RQ4hWF6FK3OhLWCCuu8a7vgyepG3QQQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHtmGhmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fip/lAcs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHtmGhmt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fip/lAcs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2PVb965087
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 17:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZO0qQBWN+bm/Xq+0wcCJywoU
	YOARekVlxPEPx5YksZk=; b=lHtmGhmtJjDPT53PpwZ66C6U1ryr7vwx1LkXnSJp
	oYKagEkOh9MDUwQV3mUtIxFstrjykfbvBQH2H8H1FOoN9H1AocJ/cAv6cQ3LrrRn
	jHZOXe5xU+XSMqHZzqGh+eq5XbuUxEIDyvMNFpSAmcCcdT5cQmxm5uy3oBVMpvEc
	XlMh4p3YU6CrgvdZR+BWkgftiOMbMFursNsSoqJJ2N/BI+8CEOjj7qKazt12RpFm
	XiirOjTnNiWEWoAbJlRki2Un8i6lrdOfLOfNydayNNulT7f5mQdRwuxjirDic+q6
	gbDnTtyjQV5HfZzxnglPOhMaosoBKC5Uoe/H/iwwDEWRkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3gq8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 17:13:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936a796a23aso118637585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787159592; x=1787764392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZO0qQBWN+bm/Xq+0wcCJywoUYOARekVlxPEPx5YksZk=;
        b=Fip/lAcsrZ8ilmMyblW9x7ZcQHgAi6g/Eru7FVg0L83RteIuqspzS8uK+On628AtI8
         JekqAvNEhdqXvcHPVdXRk4Mimx9gHOkRiBk1v7fLaAw3iC4bUiQCyAa47VeCgmpSDrxn
         qhGWFzPRdaOQ+m468LB/hjZ49wOTgId8Wfs/3r4iUcKs3XBxUYZ98t6ALiTeq5KqhVMR
         qMqCKdDKBQxMU6VPoOTdODhz1zrcEAW51mEfVCRdGPIAzuMtj6AuigXfoKpG6OdCaInf
         Ir+ykviEOYVG6Y5f0n92jfS7zk6QcHo3bMGaUeuuVmiA4zH/H4+b0UI75ysrfroKfM6T
         Gwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159592; x=1787764392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO0qQBWN+bm/Xq+0wcCJywoUYOARekVlxPEPx5YksZk=;
        b=F33AYmcLFZd3lDXzDgjgshd9qNl4TW5svFV48CXtZ2DoUo77wmisV+pA82vs8d3QYP
         bO3GJq5GUfxaig7+tYliEJQP01wjCLGeKgzgOJB8R38Lc1olLSBAc6yHD+tGcfxRqE7B
         pfnesAG5ns9SIbGg0DhwAzYOojMli28zCEolzng7afYXXgsRQ/dGgsrt1k0hIgC3AURb
         1Sz2R4WjiJfvEwRZjFIsFrOg7mygNfzh+HBzILgCL3to8BfCuVIB2dm8nXBSEmWz/PMh
         TAWBp3unDVpfrTF+WYDhzTGH93kmeZIfLa8qRLVpXZX6UZJB8lQdX0RdKoQIKLI86fLV
         XRmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Kn9F3aTNgsY87tHoZeT88Gt5OINgzJaDAtLXoUEd58c9kFo+J+516VhG71jzGxGtrRXqr6oct9dAchPl@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZB/iYqFoPUmFShtT4uNNB8jcuvuClBGXaqVLMSkw6+xmn+Pp
	Kw2Fp1igagmxmVwz6HKN6CG30hZEcdp624b8xrT53P7e9KCRgkgbzegAtXbwW3YNTUf5zKO03+6
	WykdIquM7CIW+art4Evz/uT6IOzJma25fZAo/3w8jF6KK3X489pNGlf5GT0h89ghGO9YypIivPw
	ldGbQMww==
X-Gm-Gg: AR+sD116l32PAMeUqtHPac+AT+nu45TtLSKDvxOb8tPaPT7a4B9LE52vrzrPGEonUEp
	nl+ePG3do4xAuqQu5afT5MSeWS0Q4xQoSzEXy3N4zL/R/od3bRAXDWcByP+TSGRshZXkbNHkCRK
	FS8fY5JsgHzy6qHzv4qdkLXmAI7DWLnLJVyJq7pXrV6Inv7y68kxlwiJDcHOVwW6vphgsaRBydp
	hJ2IFF8xPE/3dl0v1xiJL3WS7Ikd3p9EYKuz4fgAZHCOQzG1Pe9dfNIivyOVkUBUqf8gI0wD030
	ZDWLKVMBMGy/iqDcg6FEC/JjPtdHlbo37EWGzIbSK/mpZFsIaUgdYF82hFDcY52iQ87XNLgyBKP
	OCuwKnVUSNziu+lM=
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr642946385a.10.1787159592361;
        Wed, 19 Aug 2026 10:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr642939885a.10.1787159591748;
        Wed, 19 Aug 2026 10:13:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9dffa59sm95601825e9.3.2026.08.19.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:13:10 -0700 (PDT)
Date: Wed, 19 Aug 2026 20:13:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] serial: qcom-geni: keep registered console runtime active
Message-ID: <ao4dvbqk3lbjwrw4qgiwjljyi2oe7nzcx5ooqx5whukiyvet75@6kemkkgoonvi>
References: <20260819-topic-geni_console_poweredoff-v1-1-7f7bb3aad8da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-topic-geni_console_poweredoff-v1-1-7f7bb3aad8da@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85e429 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mVIPQ0GnqOHn-2xBG8YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMyBTYWx0ZWRfX5gsyjyC9aBHZ
 9Y3msQE6WtkrfgOHCOUXUyGO7AVuNIjfQVKh2CVViXcInt56BtBkUte2nA1RQilDhgOblLVOTJs
 OqEdXXZ0m8q+6o7EkBZ1XwzJONKyh/qzvd4hV6i3JXqqCibxGxJvL5ZHM4S+tbKYdhx8IR7LhKD
 DpDAMmIrcNz3Sq6tWzZHamu21Gx0BGmqF179HEUVymn8AW/jmOMR37m8Lhdf6WflDXyU/Y1XEu9
 9s4jNGi/1ciruTxg6GI2+6tva1XtFPsABvC12tBMNUHgfVBV3YF0egGKChvBSlZIE9+A52CnwGr
 E0AKikiVQzHawkWtl1ofYvNN6y2S8EwlIhCLikBNBjKoxHc7wQ6am3bpc2kF5eQOU5w9Hnyp+0S
 k1uhng54K7FdvmgWFWJDALhJW5vM5gSIw2/0I5WF73UszNX7F3hxaxPIXlpyO0KdZACDLMfpRyM
 pswBQzUfGDTMaAHb/5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMyBTYWx0ZWRfX5zaPBAUX73JA
 uBt6tbSt1fwb9BwlM6O8xFixkWIvVOhBkq68NfuLgrhHvaJZ0x/DUWEfa4ukjpXxF1YJ7In0j7S
 2JOxKtu8uZSfYO5Kyo96BUOoCayWszM=
X-Proofpoint-ORIG-GUID: Ee78qcW0VtcvV6oQ5NvISxqbZCuOCOZJ
X-Proofpoint-GUID: Ee78qcW0VtcvV6oQ5NvISxqbZCuOCOZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190133

On 26-08-19 18:46:47, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit aee1f94dab13 ("serial: qcom-geni: remove .pm callback, use
> runtime PM in startup/shutdown") moved runtime PM references from the
> serial-core PM callback to the port startup and shutdown callbacks.
> 
> The serial core used to leave the console port powered after
> registration, but after the callback was removed the temporary probe
> reference is always released. Console writes are not tied to an open TTY
> and can run from contexts which cannot resume the device, so a
> runtime-suspended console can stall. This was observed on a Qualcomm
> X1E80100 CRD device, as the boot console became flakey across boots.
> 
> Acquire a runtime PM reference when the console is set up and release it
> through the console exit callback. This keeps the device active only
> while the console is registered and balances the reference when the
> console is disabled or re-enabled through sysfs.
> 
> Fixes: aee1f94dab13 ("serial: qcom-geni: remove .pm callback, use runtime PM in startup/shutdown")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
