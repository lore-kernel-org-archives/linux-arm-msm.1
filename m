Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763766;
	b=V+BwL9pHdI/d1UQPLwfwq9zofhWXMQ2jCnGb63GgVsNlCXTY1vtLXv87VKRXiVPHfpoo
	 DAOqkRfWq29f/bzi/FBcKz7+YE8peTmNWA+tBBwknPuQwByFdLz/SVHdlSFXgdAjIV0px
	 RA+l0ZS5urJQ4nJoJnh5a1RzVfT3PL12fPIvmrNpOZv+kOReNJftjNIWcbGRpbEvINqW5
	 z8OOERn/aV9f6rM9SeD8GpJNJL/7ll3l8lWQBqqpSbJWTBmq6G8kTA20J+TrO6PHFkNYB
	 uYOshGquIlZH6m4X284ELUfM10t6GRtPuFJl5gL5obtD5Iy7Ctn8pnkMDohQAKK5I8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
	b=WC4lSee3bI7g84UfeC4HmRv8ST1cWVIYnj6dfyxSq0D2JGpMpGZ5o+6+i/c3jb+AMC61
	 da2SfjiKd2lmxq3JTK97ZMP+MWcGMCyLi7+Uv65OL5mLJpsyeV29I9I2Ag7EbbnpyrEMT
	 BhDHhTThVkw4Tm6sM1qgI49qicwnzH2lQf9TLiOUuSau/ZeQtO7OLgxPqpFe6dni/GEVN
	 PodylbFK/qFnhxvz1m4A/K7OWNEb0g7QdnPNW7z9ZRRa1gDkCixhwgGuM4eAQ2bWLhxmD
	 mR7MQ9Nmqn4YtwcX8wyyZqW9J4ZBF52XTzkFYPzaw/nbt7o3tqxV1XKFz9JfCiphOhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="e/Q4b6cz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcUAb8gL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A717606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A717606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e/Q4b6cz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcUAb8gL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAbik980702
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=; b=e/Q4b6cz/nvqDd1w
	fjCXcfgSF2EKGM5S6UwZ/dvsgoxzrLr5klVFwHaVKMRrDEBgiwYJyf5h7lZOtowv
	EWA6ggYc51bkhDA7FOf6vnyZ+KXicl9MX2dSwtMHzGDTryM1LGs7/0Lp1HNhIaot
	DAwW5BDR+3GA5psh66MD4/imdtqZVrBNMzSo/PtcEM0kOEXtAsmwCy1hRhMrDNB1
	6EDgfogK4ND4h2ERoId3VQJk2KQCV7RQXmFqceSoQRsMIWbsDwgATJGX5jv6jKnq
	annILs4IVhU8K/l6rEFsdmxkvlvf+vviprfj1F3s4mqP6+v2WKG5RLERLG4YoWNZ
	kppO4w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaudn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:55:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso58323137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763759; x=1793368559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
        b=RcUAb8gLAo/DVE6kwyP48U6JXZTmQNaqtJSIe4yyyjbwI+cao+Jq2VpA2xHEOEMMUG
         oh2cC9iG5Gx1tuiyGj45TeXP1yU4hA0lxmthWKnFpHk82ZTUil+6CWuKYXylV9E8+Wny
         zjSckd26nSLjeCLfnBQmau42/2ojD5sA3LmqXsHdWfcPgBN1x/lyuPLG68f/fYlZfPUW
         RSbvl2bP5w7X5SDArmisuJBhEiwoJl2yGYrHl3xMoRlNkS2i3sAmgephuxh7VoIb7tT9
         9uRv5W6RkQ+VFCOWuVs/dX9W+Noar4IBHlyxHfU2Bz3q5IfpxlrioqBjGtKlsAkqpp5J
         3mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763759; x=1793368559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
        b=NXwxpuxhFokzdSLkrk1VNetZcUsyaxue0DneIrfDtjK3rS04ayLVjnFVrlFe3aO/0W
         W1t4HU9sRK+WWCgRGIeAb+eyIiesOGnEcgVboiB5mU4q3vrwZiWbmxUDjBrhu3ibhxx2
         2pMzemM60aitMwbwKV9rUgBclcpd1ZG0lSy+n4Mq8cP2o3dTSpqrt5Qe3EjI2elbnLhJ
         PG6qrqqNbqMg6jeboluaE0HhvCVDsd11Asupb2xdy1I//fJuY3l5Mcwyw4Y8nM4lIUvG
         UWKR8/1mVbPeuaWW7SU8lSxASqNDa1wdLTGoq+6vkgcgYQ5/5N09XnYLpzRbAtv2P0E/
         A1xg==
X-Forwarded-Encrypted: i=1; AKwUvBwzoHyLP7sbhE84R87n9m6NM2TZz2JNXGQV/pP5vzTUuOoOAQaIHQP2V9FcxaKMzkso+PewgXO0ROLqxi7L@vger.kernel.org
X-Gm-Message-State: AFq9FYIE3qVfaJMUDl8LnIVRdQmx5tWPEz7l5TiNNaqsVKcDNL3tVBRo
	+13rAW4VtSYQHeSOwfImapL9S9HknthlfVvY2oFr6CnlgRper16CMn88XrPWP+PWaem/sGJL3xM
	qnOd/wjV7pIvR+sMIF5ww3odbKNdvZN8EZhhkpTYlthRycK+avCoItqhKm9pjYtQE9l+q
X-Gm-Gg: AYBFou2kOZstIEUa/PTHKjJClq8WJX/QAzEmZWh7RfipycWMg5Vi1AQZUZvKUO6Hggu
	ad2r7cxVtES/9G5NOTf+sd7v6MqnIUYfIQEqBKL0z5ENiHH4w3MC78gJ7EGy7uBn7QdwqtKfkIh
	jEht2Qi1XxVaUUkzZE3rZ5k4nMFth4ifK3hXth9CbMbo88x1WZu0Ox6T7UGCXVG0G9bNHxamSBC
	yP3dEoruoozLw3j9LEtSO1DLWLzwpZA+XRbc9bUvJk9aPpK/za51eQsWL0IAapsvLqbFG1AFzRb
	rZZch+qbSCJizq/xBSiMNPZNdqlb4yhtWojXu17um294dLRkrfe2ZscD9dMXtpOym9JPcSaKF8c
	QPy9lVY7XnnqGB3qySc0yQQ==
X-Received: by 2002:a05:6102:30d1:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7ccc2d92dedmr890636137.0.1792763758695;
        Fri, 23 Oct 2026 06:55:58 -0700 (PDT)
X-Received: by 2002:a05:6102:30d1:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7ccc2d92dedmr890631137.0.1792763758271;
        Fri, 23 Oct 2026 06:55:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c01274sm1156244a12.4.2026.10.23.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:55:56 -0700 (PDT)
Message-ID: <625f7af0-5977-41e3-a76d-fde8f998ed97@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:55:55 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-pm@vger.kernel.org, sre@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
 <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
 <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
 <63cf18bc-5c89-4a55-aa15-2550dc47c155@oss.qualcomm.com>
 <179276336012.97124.9436748752781883311@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179276336012.97124.9436748752781883311@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb676f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IP5-ssDr8azhespfttEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX/GxE9i9Q1p70
 PeQFgJhAMWLLCimkpJCH/cqQ7lcPsi0+c/CrPA4KucMpKeHnQQ/CO1bCHl5KDzoftQ2za8Ix78y
 pJiO4nuCzO6R92FABEc/OfXBTIrbegc=
X-Proofpoint-GUID: UmzZe5ylne2Iybedbx3u9oGP3uUryn--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXw9nkaEZpvyA7
 Igbm1HB5XOZXWW0Ba9xiBD51F2fsdG1ghQ7te/DWhbKeBBxT+ihLlEkp5BViIAQ0wPt+gxwOrEV
 eqPhrXO7LfC7hCChVNZvuQdrOo2D6xPAnLF2BR6cjNn3SAJY377r+O6aJVjol/LVk+LyrumVOoo
 +YjgfKx2wvKovazYKNusvTxhCs2EIo09nyQFERwWV45TMvUubm3R0anACWo0bovgPU8OH8AkNPB
 u3UkDRz34QmJoY7HvudDMxBBC5dRyK3h6uVTMx5OZXXIhktocRi4kHGw0LpTyUAmv1liH3KjRLo
 HYflgoqvrAjZ+1IJNLI3ZssnHi+1X+roNYDX5+O9Lq3cdH3O3Sje6sN+0Mknf4PYx3AuL8lfeYq
 Wkxe6/qt8gucqZbyj8gf57W297sT9aD6scjHEdq6lkn2j/pV+2cRey/BW33+CSsoAfaxia3J7qb
 UVO/mzOl4HEjCUGL72A==
X-Proofpoint-ORIG-GUID: UmzZe5ylne2Iybedbx3u9oGP3uUryn--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:49 PM, Qianhui Xu wrote:
> Hi Konrad,
> 
>> Did you try reaching out to the vendor?
> 
> No, and I want to be precise about why rather than hand-wave it:
> 
>   - This tablet (Lenovo Legion Y700 Gen4, TB322FC) has no vendor channel for
>     kernel sources. The public support surface is consumer warranty, not
>     engineering. We are an independent bring-up, not a customer of theirs.
>   - I also asked the person who is upstreaming the mainline DT for this same
>     board (separate thread, private) whether a downstream tree exists publicly.
>     There are partial downstream trees for sibling Lenovo tablets, but none that
>     covers this unit's QBG/battery path.
> 
> So "ask the vendor" is not available to us. What I could do instead, I did:
> boot the unit's own stock Android and compare it against mainline on the same
> battery.

I know you're independent. Vendors generally have an obligation to
release GPL2 source code and have channels to request it. Calling
customer support will probably get you nowhere though, as it's not
the correct place.

Konrad
