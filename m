Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742473;
	b=xvCfFmZb8MAc/YDIv4YULrLizZ+MIiHn7Pd5sLwz/fGDFjQoxPQ9XyJkMMPU+Bp+9oi5
	 1qQJ2GotYtZ7tFiVAiv34iBR9Sn1fDzIHVyxheNKpoZNg/JfxVhlFQjKw/nhQeLtnxFY9
	 tbd4wVfqbqvIhoSYZmqe27SffghTPSupQEwpylY1lZhIkHDNu0A+7tvb6RZwHPz6p0MAy
	 e4wVSONUwrlimRmEdsoMsDbGB9/0YkaN0CoGW5rl458MVd6f3i6SmMQCHN1ckO9MhTlbA
	 6I99JiEAPAjJHKnv0GKR0tExweFlv3b0ps/N6nDXxAEBfxuQ6k7U6QUQt9RyfD1OAxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
	b=NUJuC9VLKAgo/80w7wLnnyAz4oCaB6rAb7nctEE2uvdblKy6y1qUP+TK2vzLnwT+D4LC
	 AFLOHtDQZHM5bV+d3lkuLgFUzEypuG2mIzo61NUsW+RtesfQmcMhVSKw065qLL9puukBW
	 UTUI/uEoNODXL+6YsiQXL5H62jvQDqqMyuKhsP14k2Kmaz4QSf0b89/ceHAvxFzyHWJFV
	 Gv6ocCZUWSBXCyNChp4W+3ndiLRNQFww/3sIzw4xKEUgNeszIo4moDmjcaVAH/ZdmiI66
	 OOC2YfgpM/zvKpcv8mP0wBRWvBoQJ3TrLI4Tn2NlkT6GESU+NkNVmq6Chzk1Og94U7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF62606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FM5V1048165
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=; b=QYsAMdE6mHAddRfH
	xBhiPupQif2snOY8TOWxIixUNAbk5JBRYUm2DGhNc75MbkVDT9vItva3t7UkgWIu
	JGzBL8+hXvL0M1rMy7dIQMAMO0xWKIAu83QSpGTnuW92XpWv0PxxnXRybEdGKOh+
	pTjeox8AAfWNSHDwiaRe5a432MHMYgOyoi0UNmR4Ywtdshghl9XA9fAKUz4zVeGp
	YrP0gLuOwhKlpFY0/u7g6nLgKjzBd2kW9SJNFnQzIpclx99PIVwWcTxQI6F69Jrd
	mC8PLp7yRI8mHqsnD3mBFcOrsjbTM836GGRDYXqDYXMFYk+Dh2QYPvNoz3SHi56L
	Ub1Exw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjnna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0e2566d30so10776137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742471; x=1793347271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=XOZERwUK1syMHRqTsdbDhSPSNLwtjsmMKCpiyuQ22rV394dfShCp66AQbT3X2oPAES
         vnA8Vbo8yc4Aig3M0/eVR1ajV3oBj5lwyLW3Mu65REHUufgOAJelRvxa1wIY41n2gZdk
         GiZArAzZwloML5xoKWwYrvDzN2p0rS0CBafluBWwWECIGWMmQ3gF/pgvvaltqlJF/b8M
         VPV3hRP2xBysmmSq9UYdIpZFOJ+V7H0hfgSI1QGo9AJ2i0MeyINpQcjPUGnKAeUlZ2U0
         sSUmPQe4sOsjmun+ThSPOYfCiYW2OilLS4s8ATHsBGk7B8mRuNALqXje3LqcNLvSqqst
         B62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742471; x=1793347271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=L5wEyOUHR2r6/0EQfZT1e/766K6e0o9r5F+Ra0Ge7KFbyrJPh0Dz6ipW1BrtH2XUB5
         ig4DV0RUHngpB1dlC/dIN0gv+jgTHm+XvMvuAVoCDXPycWxL4ZZhxgZz6OMoG7ZSjPAZ
         G7gtYzESm/HRjcbvl0u3JMOltFQ2wT/wZ9qImNstSMx7yexCs6d1bkx9TkF508R2zLli
         8ilUM+lu0TxNrQ3i5GVnjZXJmT+k1XMblSzov/gKTtFmACOKIA1MPdAZdi5U08q+E9KN
         1bff9rrke6BLiJQhMMgfF+FBMPeJA3Z4YzlanzXi78uY5wAygetj4BBH+yTXT3wsTbR3
         7cjw==
X-Forwarded-Encrypted: i=1; AKwUvBzgHSKinEo2Yuh2VI5bzO5xqTPP9Ujf20VVRKjWb8mUR5WXkOpJyhmccWJAJuySb+a5RisKHhJRhM+Kc6Rv@vger.kernel.org
X-Gm-Message-State: AFq9FYLrO7SvyF87UzzmUwAjKlZlQ3kRfmn5ZDBPD68mztYhAbnyLOwg
	uS2HByB6fLzRTf/N1Af1iisc2GAq7czJJ8BNB3AHrPXxPDv1VnODR60s8lFKez3hW9Z4oZgYssx
	Z19dGbMqmhPfifTL5ScMf1fDE9QEBl6Y+dmPa0Vhk9NEIcjmQFxkAiVyF11M4Rgq/fGup
X-Gm-Gg: AYBFou2Q7FCEbC8xpr26AlnsR10DwX4uvJgCFmJcij8WBS4BrRlNazTvENJbGj1Mre/
	SDt0ZOeq8PSTfFn31HHjCc0g3vO+6SuBgWqCj8qtwK6gqDjEWAHAazullQlUYVNH6+lX0a9Ywg7
	D1R5iygW1cv8DWXAuiiwwYxqrlv1w4THn7NwoE20h0uAoEdtpetPo+U/TGu+/0aE9vt8dSiZ26Z
	UqlGuVAMqyHV8qBRr6KDhvAYBQ0RMo6Ck0CXdMYbs5fWiLzOTyfFKdSJj8P7YlJN8fdyYleLoqt
	5jb7QL8rsqARinoeERtJZTtX3nIwK8L6e6VFK1rmUmb40yZ2B6l0jhYe5IAlUyLWtGtKu0wS25Q
	lI2AFegN8FMC2ZmHOy7TXKw==
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522685137.1.1792742471545;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522661137.1.1792742471072;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c848c3sm71563466b.38.2026.10.23.01.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:01:09 -0700 (PDT)
Message-ID: <5422680d-e642-4a85-9119-6a5ac5443d50@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:01:07 +0200
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
Subject: Re: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in
 DP-only modes
To: Joonhoe Kim <26rote@gmail.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022165143.1327-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022165143.1327-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfXx45YV2SnIcrB
 ZK3z7ljPcVjSX6nSI3wIXezBTUlSNmete5DlauS1mJ4EdKKG92446zd8qWclfKDqdzlNHBIPril
 9SZVNnqMQzJ/IArvvqcT7IW0wYW0C4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX/VBdK665l2Vq
 HAx2TY9hRCGcg5nZRCUfZkBRk6VfIHSp0qNmgJwygTt6YKV9gImeJ3Ijd74izXCSziHCP5ZukX5
 KoZ2WbbL4cdA1uxVy1DuUsSL/1wyDZC6GxFRZZIdcBfQxI9fdt6S72U5ZK6IUEkuAUcsG4tEhfc
 XfzENOQg5B0JQ21MGXinKIaUP1BTCWk9XlzR073d3J/QNTYGKElIFCu1OxakozVOyrQnEu/XmKw
 n9GzVQAC+I2bnET8HDFoOt7Jun68HbmXh9XMvG04C9vqPmODOTlgBRaz9v1hmoMYn6bmaeWUdy7
 0P+4OvEABDg+31EMC7Cbo0MXMwZFQ4926YlrzG7ao1ha+ES1kCeqXZ6XKGYRl8Z46GzXwF6H4AR
 +RrkSQDdjXxgqxtyQdVzNh+j1eTLMhCFOHGiJQJJLpFagg9wwZ/lAqe40Nb1pBUH4gvr9t1KJOb
 w45cHrS1kyUt9Df8juw==
X-Proofpoint-ORIG-GUID: eJGHR1Ela3gzWCWTWkZLixPevWv_kgqP
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb1448 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=JsmhxD-A5SsRL_Tr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PfqxLEJM1DhM-lXbwakA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: eJGHR1Ela3gzWCWTWkZLixPevWv_kgqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031

On 10/22/26 6:51 PM, Joonhoe Kim wrote:
> DisplayPort pin assignments C and E give all four SuperSpeed lanes to
> DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
> assignment and stays available. The FSA4480 sits on that pair, and in
> these modes the driver turns its USB switch off, so a USB 2.0 hub or
> device behind a DisplayPort sink is disconnected as soon as the
> DisplayPort mode is set.
> 
> Configure the USB switch the same way in all DisplayPort modes.
> 
> Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
