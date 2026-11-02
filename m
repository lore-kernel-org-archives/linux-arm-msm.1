Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626464;
	b=XDxASTzRrRF1lOjU0GQ3LKA6qoBf9lf6GiiHjGIvQlFi10MC1ZHOBf5obR0ngUNSfl2G
	 hLMvT6jO1YGFTZ1YzQdf11Z1oM3IgS8SB9v3Hz388DJpfzqxXRR2hu1X6Doxv391DoRJK
	 8rLZAsJMwnVZzh/XETAIH0Y0kSTYFUl5bUjlLAEOn00LNRsr4qDsfE9ZfHPz1NTyY+MRG
	 CKD9anxYB4cVztYcoRyeCZcl5Tepk1twuLRXfFTCtipdUQPDY2+w3o3G3Y1uU5pjrdNCM
	 cVP7cxoNWAkGjnDQZzE2dq3goCB4h3oKlybnZNvxwScZw7WHb9kC3hadKMS1uDQUh2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
	b=F9DaWa+KctX7rAbMT/QsAAUMly8O5Oqrzrab8F6B0jJqk3inr9UH0i5oUhyeVFDhDXDi
	 kP76+OU/cw7HVCDDPf7u/cbXa2GZ6Muwg9OHCBdY79b27LKvazS8qK5xBuRTkNUy9e+a0
	 yzd0lKTpZD2z6J9MOG0TZS0g9KMLUdUKeehzKbdDoIc4GChdzzac2h0c7Y97ewXrUvOEh
	 5KxCnzV0pumnYFN8SK0Ske+HPg1U/zosIbE5elHTrinUKNy/zGKNxSw5WEbltWlqZQfWO
	 /1MTcxEBc0TnkN5z+HKIofLz4V4CU4IFzPnrNIcoM0jyOKTGeCosS+aoRtyAbkMSJcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbhJ8zdz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cF/SacPg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFAD60A2622
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFAD60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbhJ8zdz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cF/SacPg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAMmM388227
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=; b=QbhJ8zdzy6f33Sn0
	3+O2p8WWJKxzMRVwYycuUnhUdMHdh/MFByYWGx9/h2ycw9X2QmOkkhaMG5JZ/4K4
	H/A/XYGkbwj1oFL6PX3r0Zn33Y4l4f8zdBFEuQBU29vZ1VrjzO2XR8YTsKnZxNFW
	3ok+D8kwTW6PZCj1/ydDYDilvSsAOxjAbL3oc1u1q7fnkTwI0z24f364GxQEIQiy
	CkraZRSECqqw5p9RIm6625lW43d04XAjdXU+16DGcDHMirYT3kSOMPFGU2JJZryO
	iX9QnAD24wq/wVIe6ZeW8p4+DKN0baBLo/MNcUIlsojlcAEUpDlfNjh2fzPTUsv5
	rPDhvQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19ajg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:34:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9906ce36960so102610241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626462; x=1794231262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
        b=cF/SacPg4RWTJi+MxbzHBslMKeoyzoWmsx/SfJqJyym5879Pl5poJyJxIhVXS/AXTw
         KPNTl50e66hxG+qFaFXHp0ZEIYqlL4potjD9GcOxx0ABy+reYkgIi+m7KaLLGCnTz6bD
         dHkCp+ptRz6Us/J0qLen6wx+6PITU7ND498sVd351Jsmxaqt3SvAgSaSmV94CMxG/I2O
         bBj1T4PQGg7Ne3mefERtxoroXFouJyYUrouoxRV78/xPgaNPMd63GlQ6f7JOukrg0Fyt
         UZw1cNzzDGAI62ndhDLa+KETaZfw72yERsy6BqqjOAess5QCkJMfM39gj6WWij3cqlHl
         7DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626462; x=1794231262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
        b=JK6EpXKWYYKwEeUvDr+heRcJCsRdZ8E/ncjTStuC2tpcOkncOSOwBKejPIocM9q1zv
         /hEqoxwE+OdX1rotaE59qS0o68cm2sYcWsbfIUjGuRdiumfSXuABxJywOLmRktRoFJZ/
         FhoiNit8DNZjK7+mavC2AO3eE48NbBesah7p8r3bLE0VB64tt/BcsWK8sXlLc4JthTUo
         4BYEKOwAlP75OS3tMBMvAJImbcgRlNFEcW5uQLHGmrCwqu5v7CrGZUZmnlVJzBOqcuIf
         9kZ/EMMT0Rg9SrO4ERP7twqBIYwuVihTuCWZySgsaf6c7rn22pgXbZc4e047RK2RNyRx
         kE1Q==
X-Forwarded-Encrypted: i=1; AKwUvBywqA9yTi+7XVRImkSbDNEXeuX9mBU7CLP3dQrEi5KqO8A7aCI/PklpDWOczaBVgg+YBWrD43dYoyHje8JZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+ftONfX2amu3LBcQ5OD3pl4s3FF/uFdwB/R/qSlSjketgu1tBs
	ACC/pjfX2DWGA2sCYdNuoYKODHi7Bl+AI/RN2J90/KrA9B7ly5HnR3MM+K+ZJQzTrH7eybDdeOj
	zfN/cZ5eR2t7uUBEj4DyPO/qSCHbEF0TIeM3e/MlfsKfzb5vY/feYgLSM+cbNtqrSH74i
X-Gm-Gg: AYBFou0bW85MG3MauGG054cvrswSZUhJti+pOFHCOh5dt/Fr/GoGrE4UKAzIbs4pVds
	yO/826sDWubsjrBSKdW0d5TPByMJMsTDFXxF090mhNkjaicsq/9mpEWgrnms/5adb+CK9XOLOfW
	fBUucWNlXvEnDml9YHMPyYYcwhsqUsm048zqsa0Px3/o+zVLW3ByCGZKJ6v58dRAADA0tQA/Czx
	u7HzLSRCHKDJYCw9PrDaQIALpo4ZW5s/3wTIeQqHb+HPUsGrlEamCv+R27WxRN+bIwIY7PlKZL0
	tYg6JPidVIzqJaEjBQXgsluwXc6JhidMFvnVUwA4W0qhbqpRRYBCbXqYkL7Ic75aEfG+fZoNo7R
	5QcTBOsY6xLhNQM6FrsOKHTp5/oz5eJakpuFt+XjZ3dDAYOiEYMzBkzLStIePD7omR1krhvs=
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr3358547137.2.1793626461612;
        Mon, 02 Nov 2026 05:34:21 -0800 (PST)
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr3358539137.2.1793626461135;
        Mon, 02 Nov 2026 05:34:21 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3219168a12.36.2026.11.02.05.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:34:20 -0800 (PST)
Message-ID: <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:34:18 +0100
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
To: Joonhoe Kim <26rote@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, val@packett.cool,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023123512.1912-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fsJBPbr8Mnyjw8lVkViv9oWmx2cp6fPx
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8915e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=u3WzlVLRiEZ43SCRuFYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: fsJBPbr8Mnyjw8lVkViv9oWmx2cp6fPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX6BDKNHkNLmyl
 x53H41IEe97z+lM+XiiUTZazfTlaEbphwZgovYUPs4LBL+ojm6CJ8dbkc3SFEPxPleCg9V/a3kR
 S48bo+VdG3foQ5I/p4uSApoRHi5Vz5L4f70jtRazDIPo8NtfHxV2YQJ6K8hfVYLqSBqLF8GaCbR
 jqlBtBWG/0Mhyb6H/J2i4d4suz4pVLzL/ZSdeAGvuC05mb0s+72u5Mese1ib6kxPJV2zshskljG
 T9grQm2YfqLBocd425pIRltXjD0x2kWtvSKIeKrxI9loTu3ksZjPIdJjUqFUOKkvHK/8fdoe2sa
 0bUOqRUD/EZTy88deUWHwTQmHtWokQswv3OW8hu1AaQBuOQrF4FKjvSiO7ZpLDNXgYhTj+qTKfO
 3IroVOc5bTvvwSf+nGuHIQX/yk+sYsF1YDE+XNtyQje1Kta2WablHVCdXIbK+rZEyJECpePr40Z
 gKyWiehEaIhGoIMMqrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXyN0T01aABxp1
 /R9v3F2oUuPoCcp1R4skYwxl3lMOS+NaGIzmb7IQsWABKAoKkxQGNyeTPOTpYWyb1DSt5ALpSxT
 CkIdts+rG/MEgny3Fvr7F+9W53XmIT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/23/26 2:35 PM, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:
> 
> - The USB controller can exit and re-init its PHY in DP-only mode, e.g.
>   across a system suspend that loses power. qmp_combo_usb_init() then
>   programs the USB serdes, lane and PCS tables over the DisplayPort
>   configuration and times out waiting for PHYSTATUS, and
>   qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
> - qmp_combo_typec_switch_set() powers the USB PCS off and on when the
>   orientation changes in DP-only mode, e.g. when a DP-only sink is
>   plugged in the other way round while the mux is still in DP-only
>   mode.
> - qmp_combo_reconfigure_phy() powers the USB PCS off again when the
>   port leaves DP-only mode.
> 
> Skip the USB PCS in these paths in DP-only mode. Keep the
> qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
> so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
> leaves DP-only mode.
> 
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle fails with "phy initialization
> timed-out", the dwc3 resume returns -110 and the following xHCI resume
> hangs the system.

This sounds like a gap in the DWC3 driver, we should bail out of r/w
any registers if resume failed

Konrad
