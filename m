Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741542;
	b=Jm1wikGzjCUGOL1lqv8Jixzu4UsBBuYoPGeRbjTP6cZ/tP8tzCcsc9y3+aenQ5IB1g8Z
	 QvSpAdWnuUqOwoQzgf1kMSxU42+7luVugnDVWyHv2l6dgLEi6hHrgNJfM38cPB+qyYlgP
	 q6q8J2Oc5D7krxHXIUPALNwybKbhJfWqd1LvVVglM+dGgSmGTgIseSJNudOP59Ms/kMze
	 B+GOd3ldHPAM4WEXBec+/DtiRLFVA7/0UOP5TcOtglDaXMuj2ZJjkY72Kyw06KEbd87sg
	 yW2qrTvWe60I0jfRjsdWOQqQWw4EXPtRGkHrj+M3NzjpTiGzZNOPnbt6jXMxl0r94Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
	b=HlRo1KH/veN5u2/CsK9LeC3OgzvyGrDTRAOPWKcV605bOGmasDZqupyIqkSdgqe7OU84
	 PjZgCsbNjYRE5TaVJh7bcwY85Wvv5QRzu/aseged8q7Ii8VKOFP1sr+ql3LfqiiAmyJXd
	 WDiIDTundBKF320xOUoGGV7V7oiGCPF/Lkw3wbx59DLY9FlPGIvQnR6I26p2y7s47vX+T
	 xkHD4E8aT/BoVj50NzbDL6oMzeJhoRO5TMRmMx72AP5hYGdXWJIxh+IwgEHIs04scOvGY
	 xdN02wNx1bZL9/lJdRLvmmgDWQpllc+sV8JgdY7lmRtiPSLsMJPijJYHwqiEqu29Vfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEXLeA+4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LswKgGdD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF3606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CF3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEXLeA+4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LswKgGdD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FWxa588310
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=; b=TEXLeA+4HFpXpAk6
	6rglDtWweoCysV8dXNKA16v1pE6XMKCS3cdS/6WjmTWWF+V15FXAU0/QCmuEhuCF
	JpN9D5eI3wHoosaWB0RB/rc+7bv6UomnSUCZL6X88RA2AiMeVlUA27evPW+vruDo
	AtzgGVW6LK62uovC4vH51RaEYZlyxgt9i7KLr6QbXrME6xQTzo4cE7OErdK8EDg0
	P1HeE5uC1PR2gFkOM+o3kacgJ7I6jVnxFMhE4ia7KgbZwNb9BQUQVY9tg3LOLMtt
	L0cdmX46eGSo2J8TmJqNgnKsxLF94sxf9SYTOi0vJuEsE0q0E/HUmVKi5iU+4D7M
	V4Tryg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmat1fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:45:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a54501a8so1429866d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741540; x=1793346340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
        b=LswKgGdDU4Wh63hLYjQM9pRpZNtdiouDxKtpMCvDbYlYuwRB3C6cXmSnyVbKDSUJP1
         5LJ5HKYTo6wot1wCIplwUOiP9iGkaIcU/E7fOpuKP0q7ku8xavDEa6rfTjfMD9ma9/qJ
         7mH/n4yjvixlcQSeSBTxGRPlUvZtaBNukPOj4mG8t+Hos3E/JzxJyG8vliiO7L6UV6sh
         BS4B/6ThdJdnxRQM34bLdXhNip9tC7jRCwSrHwvBdiMb/07OJggEG4j9CofO4ObT9PV5
         Eg+aJF1PiwUfvTvgqpFgn5juTfS1vLeAY1dNZVG5BfmEl4HK5e1/IYLdcVjheuM4AyfZ
         oKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741540; x=1793346340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
        b=IcsPze6CnLlFYKBCGhh4teQon2IVIhjQXVJmW68zkOLKGYnKTf/WeK27I5z1bFKL74
         jsIhlfGDdkWom+or7PTWWS/+pjvpdn/Up4ZCxACBu1xuowFE664t1s5IzrXVlckWMIrV
         zVE3H6/edlMf9zXUnjXug9cmZDZPPyw4NIXZtXLbhJKxJudR2gY/xRUMcYMY6J9EtFDF
         a3JAN1uFHzbYq7oasZOgYm/7AvuqkbIXZoXdosspAAvLmKvlw0lxVeW8E+J7f9fSvqdK
         m7fureAWK6uDJSvxY8gBiieXNpS3tD3UI/nv616Jm7yKZucgV1Rk5pU8+fCpr9gl8c9D
         xQuA==
X-Forwarded-Encrypted: i=1; AKwUvByIw45K8MPQoSUvblfDYpW+YkGVBDPG1uT/CWPK9DAz3fZixR/5cg6cGohBM+Ph5xF0uC9tZvkzr11Sslti@vger.kernel.org
X-Gm-Message-State: AFq9FYKbWAIciA11Q9mpduF+muku6WQ+o+C2ZmnzK5Iu4+pmamUjerGe
	8RJ77D/L1PQNEkwzaohDXUVnvMBGiJn95+kDWsCUXktzGHkJ95bid3Fo7t3F+QCfr/lObf1OP2z
	p28L4UcvKGO2gp8Y3LlYtLNZAZYyjchjYGD0eYvws4OBq9uaW3H71Wilrv7l00GfUih4N
X-Gm-Gg: AYBFou0Kx8YOaI7QcVNn47toZZqs2kRa5IZXL11K2Wu67c7Kfdh6jjH32RtAxbU2kYJ
	quIJD43F8J+EpEnJY5W0GWV5iwHOpoSbPgTIR3InO6AixL4rXxu0C2ZS6954X/QEw3ssol85x1T
	LKbQUxaEfG7JSImCr0zr/znb58pDg9aQf6FEe3yDpT3jnSbxMGnWxrU2jX2hRhH+79l3bsQynUD
	2iRNAB/vy3+UmF3B34QemlNKJwJmGkQBBwOWFHi4M2/LjlmspKLysp4lncRk4hOERMrGtdftbVx
	jo7xWYIutvhKAs5JaUCO0KYwckeut3k99mP2gsZ+NBjqoPuozoR+yQXgw8gtronNnQCyvdaZmox
	gCLpItkSYbfs/gq8Zoq8vdg==
X-Received: by 2002:a05:620a:a997:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f6f8da8f7mr285887985a.3.1792741540001;
        Fri, 23 Oct 2026 00:45:40 -0700 (PDT)
X-Received: by 2002:a05:620a:a997:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f6f8da8f7mr285884885a.3.1792741539484;
        Fri, 23 Oct 2026 00:45:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4ced7sm70249066b.13.2026.10.23.00.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:45:38 -0700 (PDT)
Message-ID: <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:45:31 +0200
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
Subject: Re: [PATCH] scsi: ufs: qcom: Reprogram ESI after a host controller
 reset
To: Joonhoe Kim <26rote@gmail.com>, mani@kernel.org, mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com, bvanassche@acm.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022165006.1275-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022165006.1275-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb10a5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=PeIWiMRIC7RC5FwImpMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX4MZ5qUbPcl/D
 DWPtDOogiPouN8+pMSVSpvXwFoFBX+m5chxrgZ26yKfLruLD0Wmk9oJx0ef7j8K4YGU3UIeDpBm
 2X/97QsgHBxT9xS3cxx7iOvllALyjL0=
X-Proofpoint-GUID: 5McfGbN0HC4ZJ6bDF8skec-qcXSH-8-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfXwrg0Y9516dbu
 CxDw7BAhIRUbiAQ0aLuO08gM1mT2RlpElqLXigWAOQIAEvpO4I15+bMHM1RTKh71mggqWRHGcTp
 Hw3mM7XkED10nWbAzziIe+dZ58TZCAIQjpbSgjYM4PrZaZXe0ZKp5QoxIJpYaTxtYX9T380WdAi
 KvpKvnPteuDuZLPjENwjAtRv1/Gieki1xU+u/DVJ5MmlsCj9C6pEVgJkO9cDeqxvkjAKYjYJdDg
 HQPI9o9KBHjEYEwBIyuoUFXIYcomNppJbzJWwh6yS1Zo4UNNTQr29MSh27k0tro0pgsQ0JKKR9S
 b5iROMqach1XIijLZgCHxQb1oWMCKzkTKFB6PvNc+GpXIigsUgE6HCKIhknLh8U5RJYPHLYwLd+
 8E/51tTvIhNNXQXpekV072N4GEmtzLI0ZTwc3xGNnDNtHs0UvGlMPN1zveVky5NLY7rhJX8uEx4
 m7K2KkERtIWc9yScE/w==
X-Proofpoint-ORIG-GUID: 5McfGbN0HC4ZJ6bDF8skec-qcXSH-8-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030

On 10/22/26 6:50 PM, Joonhoe Kim wrote:
> ufs_qcom_config_esi() returns early once the ESI interrupts are set up.
> ufshcd_config_mcq() also calls it after every host controller reset,
> which clears the ESI base address, the vector mask and ESI enable. After
> the error handler has reset the controller, the completions then arrive
> only on the legacy interrupt while mcq_esi_enabled stays set.
> 
> Allocate the MSIs and request their interrupts only once, but program
> the ESI registers on every call. The MSI message is not cached for
> platform MSIs, so keep the one written at allocation.
> 
> Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor specific ops")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

I'm not sure it's related, but with this change, do you still need

https://lore.kernel.org/linux-arm-msm/20261007143716.2161-1-26rote@gmail.com/

?

Konrad
