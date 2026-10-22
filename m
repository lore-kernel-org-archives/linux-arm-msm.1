Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636253;
	b=JqDkgaaYmQ73l2zafR3AXevPAB0/XDKN1ORZzq3zoT0pa4b1q+AEC0ifID618XMeS82b
	 spApMbbkFetW166/C0xaucoDZHLGveaopAhVEQAd1Td7AUE2jQrnD+iRQae5lUah/hlye
	 Z+Gng+GiR3skkyrZybI0Qabfsdl1XfEsydgvHUNZVOiptpXfpGAc8MDHB89CeQrcwx1NX
	 wMTTEsWIR0oi7QriBVzjYljYrViGaKp49kWlkwAokzfT9ldBP4VY7LZc7t4CemKjmmxO2
	 dBXTDrd0h9Yc9hxpLDx/o8CaS6SNqhmdopNW73to7/lL99oywL6aNoTN8jVSeGcKIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=;
	b=x8+caLVu3jgZV51CfmaRdQX+Vv51NLsr2ELHzpCMahnDeuIErqNx0k5mLqGVjFynY3Ay
	 zDiYenIqhT9FgxA85hwlpL1MXoBzo7bdSt9ryr7wzpbbthDowjZWRBIPOwvi2uyxR5mAF
	 X+u8Z1GNbP+9f10OS//58efOwb1Cmoj0ZX3AJjgCv8+JKYcumAWFNcMV2Q5t7T+VvkY0+
	 SRX7/VLbNyJQpJkdmf7M2Yks1eVlsVB9PZZdkou1/fAb0EDl7uave0CdenzFP5NQJZysl
	 NBUUVUeMbWmqewXZSdYSRzQpnnRGjKJLoo+v6JfDFNScHy9PIPSlFUbyV+KF7g7VD8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HV6SHU27;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZLUuHoh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEC606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HV6SHU27;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZLUuHoh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iGdY1476195
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=; b=HV6SHU27fDigyi7b
	KHAdGoohXS5xQbTUBCnwvDux5SJ59xM7yBOcFsFjFs/OxhZHKyQqFVLp/n+duK3i
	7V1hcjmj7xgqHk98Gl6YQ+OBM+z8k4Qe3eeuOkENCWAkfnuCIZ28NLLk4WTGJ2oD
	kroBLFPhkabF/YcBUiTwP7LAXqhMrWDLUfqm0EWTWQXz4+0Cd6F+pEc3PA29Y4gn
	v3USmlMommUdx7C/QRlvKGVnpuWQJxaifzi/WthhAmA5lV71hwWyv35Tw416fV2r
	tKfUl3DrHQj9uNBeJP81nA0BA57h3e9VesbvFnylJ3o0ivhoSZk8og/vVoqImXYU
	GoJGng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ag9us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:30:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94b4a6e8dso13374385ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 19:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636251; x=1793241051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=;
        b=LZLUuHohhi4GUnd1y8CfyX23Rb2NcyEpHQ+0yywHgTLiUPDKDzOb51Pws12wFVhauX
         ujH6HrYraTeJlc9jYCsZZqqPY2uHz+R+5je3VwJDcBFeTlhdt3qP8Jdt6dSDMStN2Mmp
         d1TBESCMFwN5/levwXuHi/jBSjoyDHV/sJVHo/4YUdWr4QhlTdxPwwA6VOwkWuBjQJS0
         1baVqwY7YxP5ZPwks8vpm5pJ+IZhiUyKlKvCd9DqBCWjlijPha2e2jTFE2nyvMiXMZd+
         emAcWKXi4olkYmeNZqgiEUCzCZMq3bx88oeeBbiT04UGA8/cFs+TheIo7Rk3LLuIVw6o
         92fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636251; x=1793241051;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=;
        b=vgRCP+iUnZzKvPqFMa2uw2SwmCebO3aAeWl4eEVmvaYUnZlhGjBhqSa9jfzXojhuRU
         uPMikQVK9CsfZUgZaXRAEIMrmeJACnBEyXrwoyC2559/aBegebplEVDC+U9MESZWyj0y
         pBWVWgZ3tmbPafYNfylC4/zT/H/9fFQnD6Ai+XS3jcRXjDw544CxJB2wXRFNlFMU3e51
         lmShq8xOxOdz/r554BxKKE1B0RetUDm/naLDXWaRoN52smRLrk7ce89U8pdQz1JZsDBy
         7AA6d8hQJM3psQiuZi3O2V03mgVoN2CSXIE3JrTR6DcmSwUG5l45nWQY93kvPjJuQg8k
         1hbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+omhb4Oepzsm3WtXrxQL2zuZ4ZEEiy/2+Q40rSMayij4xL2HjYuyXK3hhFStW+51QYkhL8xtD5oGjQGvI@vger.kernel.org
X-Gm-Message-State: AFq9FYL/G23NJ2E8oUGYCeuQCgAOq0ywDKoAdfpbqlbmyBvOyFx2LLCw
	akJ3UTqKPsyok068cXD9G0vh5Z3ZVq3s9vlI1Ku9OdCJo38aCKMl+YsambhcS6s38BQSf65DZTI
	J2lLDcGMs6ACEuqzKMmLPkcOqmesTPizSAZxLuOB6DwuFCRHLEJ/vjc4GIjI3uLiq6AeB
X-Gm-Gg: AYBFou0RkuVFfJb0p4/buV0KX+9J1E86BLtgZxKIn2rGAE6A29GmqryEm84fqFMbBOe
	rOusSYuvS2TaSmeMmf+rxfenJ7AUbPP7YYo3E5QlPrNJg027TqTENw75ow7UIbbGKSDYluLJw8X
	QDh4/33nfpYEvKTI5gnDfJAZ7SBYUhUA+IE+FP2cxGd3JxKyDqQ16zSDjwOKDtbvQy1B92OJcaQ
	SF+UrZ4bsygyfOHDbnvrdZPzcaoqfZ6IHWIdUyhhSSkG1nVBq9Zs1AzAD6HzToQEOuyWPYN9K1p
	sgALvGQ/x7T/b1AFJWpEApSsiNlIFqrMdcFIXolsC6ucsLJySHPqcVuA6mOEP+L70yFJYltALYT
	l2yPesQAyBg/tMjti+GcOqLMY3Vx1eW8wRtjNIySnSxn8lxjJDtjt8/6bASqfLjvrmUlP4+s8
X-Received: by 2002:a17:902:f78f:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ea43c5fedfmr29905415ad.30.1792636250776;
        Wed, 21 Oct 2026 19:30:50 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ea43c5fedfmr29905255ad.30.1792636250228;
        Wed, 21 Oct 2026 19:30:50 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm17649855ad.39.2026.10.21.19.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:30:49 -0700 (PDT)
Message-ID: <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:30:45 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1cdgiE_UjHwDjXCIaNQZdpQdgKFW7Eyk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfXyVmLysQPOeL1
 pS80pmgpqklXb+Y/AAiLPEURXIpSrjsegjb0GJvecO4LcHQf/UusfZMYf9itRK0aZj6PXWF/LbT
 HC3O2S8g2sP4diHXsvB2B9bjLKIwV0g=
X-Proofpoint-ORIG-GUID: 1cdgiE_UjHwDjXCIaNQZdpQdgKFW7Eyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfX84wUZe1Lq31X
 g6R72gdVCY7qg9bmqqJiYyGbEMRsMe2nMqWxUtyo9BxXPgZNlYDET9MjD5SopgSBX/9m+zN3fEc
 U1jkBoaCbt9wmq9+VrI9wB2oxHC1fWuGxU0xwNggyHeFdE8zwJHrkjaMX8Nz9MVJ29APT3tcU0s
 leWzPooFiqeyA4e3Mmk97OMPHZOQ1WzXMYrmFyUzngx8VHYXdASVQQxxJ3tD8p1W1To9Z/TOnWH
 ueFV4rfEOV0A5d8AgkdwV2W9CmlAHPaVvn9j3aqCA8XGIncxydeOHaAsfaqXp4+gshauPjHRVsB
 4lHq4wQ93SGH5ZBHull+iQeDI1MEJtvnPWoTWEHNg3CbK8wYh6BG7RKjHM2mIcQfEfDXjKEStPW
 Rn572iWW4GdEVsq+00B8geMFAq85/ENGi5ovijimawx3/s3VzuKnzcgauZuWMkHu6/hGs+D0+k+
 IxIo7hMG8jP9ijDqfNg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9755b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wP3v5rCdS2J_7y42CfQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220009



On 10/20/2026 4:53 PM, Shawn Guo wrote:
> + linux-arm-msm
> 
> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>> For WCN7850, MAC buffer ring size is updated to 2048 in
>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>> to increase peak throughput.
>>
>> But during the RX process, a phenomenon can still be observed where
>> the throughput drops by about 30% from its peak value and then recovers,
>> and this behavior repeats during RX.
>>
>> After increasing MAC buffer ring size to 4096, the data rate drop has
>> gone.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> FYI, in case someone else runs into this: with this change (merged in
> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> working with the older firmware that Debian trixie still ships
> (firmware-atheros 20250410-2):
> 
>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Probe and firmware download succeed, but every WMI command times out
> once the interface is brought up:
> 
>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> 
> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> reverting it on v7.3 brings WiFi back with the old firmware.
> 
> Unmodified v7.3 works fine after updating to the current linux-firmware
> image:
> 
>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> On Debian trixie that one is available from trixie-backports
> (firmware-atheros 20260916-1~bpo13+1).
> 
> So nothing needs fixing on the driver side. I'm just leaving this here
> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> kernel upgrade knows to update the firmware first.

Hi Shawn, thanks for reporting this. I just had a quick test
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
(ath-202610191908), everything looks good, simple connection and ping pass, I don't see
any ath12k warning.

The firmware images I am using comes from the first commit adding WCN7850 firmware:

	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")

and the md5 values are:

linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
d3750b67b1013fe82358d0538fb131b0  ./amss.bin
c79c410d585360000c0490f16fda43e2  ./board-2.bin
73056f1d2aff886ce9bff313f455e963  ./m3.bin
d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt

can you share the md5 values of your images? and have you ever tried the upstream mainline
kernel or the latest ath.git tree?

