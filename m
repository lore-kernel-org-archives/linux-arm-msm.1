Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2483425B09D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950561; cv=none; b=ZsXWnr2aQjBH2tjnbyJLnBKZkcVSOmtPTjKpk5PG08adzfjovnJifNClslTrMwLjVqcG4QQ472/pDJjwzpqn2cR/SQhPKuDI00gosBbtz+03FGJo9HQ9W74qJ1PzNjvZVnQwJ5YYcRytIqss+iLZkPo87bGrpMPPoHjMniGwxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950561; c=relaxed/simple;
	bh=HH/INY1dmHr7OO3HmDOMe9VFvvq8NM4zAw3nsD+GINU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkKci+OM3p3FkfU5Z82DhnVx6JIT/fk6XfQbUFAyyeCg/2DauKlmR2Im+BkUllHkDeZ7gW/69XNudRI0cHtob1Hjug0jLc2ZB20FEj0av+WodTupOKZS54Hl9vQZAoABVDAPgHqw5KJkU0VT3/mbl1Fi9Dx0yu+7aBbHo0Rw3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2F6jXpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy9A9aWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2F6jXpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy9A9aWT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DK6rpj806704
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=; b=b2F6jXpt1yoBCAgX
	uA730UdaMVV19gd99S4W5+2Umi43QcBbszWoNZLXgi8CrfRw6GlQnKSiAfGiIxhS
	yHwNvqae6TijEYTnk8SDZZUCPZrsY/GHr5cXK/I87nBHZhbn/JnZNL/jWDYvToh9
	I3gYerH0mhDqlnAyx0aCRioOIzcvDPY2Y6GzNvAPljP3oa5P98mRwCYi0UPl/tDM
	8eCwGDXUYa8t3k9xelTmURDeW2ULegq8W0mujCbSy1GCqZDHVN2SJ/P3NWyCLsSm
	0/GYVvpdFKPhGEBNgvWz+dIgsH2MIitOzXC/qXLq++XzwMAycXeXXaoQd6zMS2DU
	STkWyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud69fyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:02:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so856298eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791950559; x=1792555359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=;
        b=Xy9A9aWTL/ly6VpCZnlq+W0YJWL4WQNrLQCrjO1Bi43vJRfEn6OaHLT3zlSPZXqqLo
         v6vuUqX0lSMoBQNtbpxKwPRJYJxB9KyvWKU4gXr6N39m2kKfzRBEYe1/VfPfDXvN+SXi
         qePLUxwtZ3A41vSgYXLw2sArE+lATkW9sg+9SrL3WCRSNwSIsPhcYKe6RaGmcjmB+MNS
         wvEhaWsw0UC0CZvLFFlyGHZzVbKTcG1XT8wz3dq6mLoijdKN0S7EM89cK1Xj6k+0cyjR
         VjlFLmDsAeeshIk1v9bftm/NRZ6W5hXKzNfXM52/pNUK3lL3h8Jgz5ZvM+UBzdkpSLnX
         6Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950559; x=1792555359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=;
        b=tzrgZ+dQgkH2aTXEvDikVYvadr9MBJ4tD6j252exLqUD82gutmMBOkoLAkIfWpknJu
         sGw0+O+1fEz3IPhROXI1ooC6JotTj3zTPBG9LmOi77HShzkw2eiKc55fA17O6nqV0FIj
         6rI9EhiNN3Gv7MkzHolLUrR1Kc9kk+hegXb9fkVAJhwCJeuO2vupvgNHb2nF0ntpDH8D
         6I3iSH4nt3dSdQrIK7d1pD9s9TAxeYcwBoCcIgtrB0+xGuq90ijT59DzexQvJO6IjTR8
         /MLOvqZ36O8kqJ8jOYQ03k7IM+rX6V4bVpql/PHqqTfHRp9o5C9HLM9WCfpveLxw+mQC
         H/Aw==
X-Forwarded-Encrypted: i=1; AKwUvBxmJpjxkkdIs6TwKuO5qDJwirPY5vKcJkgEamdLft8oMJ7Fey/e3klhPzv+odLFspCoonNhtSFXwXbwAqTl@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6QuJEiaX6YmscNPwCakZgmSAv3IC4OOAJb/RuS2lzMUPrYtNH
	IcZkjgtWfmmwWkwfVNivzmw47WRQsOjan7eLnuobfWUeK4700fdf3ge9noJyeptPr8bGEaOw8kU
	b0FGiZUhAQ7fkZ2N40PbSoAJHW/Wdaoj3wNZvkJvkdKVHCC1YSRg0dMpQDYW8jLZkL9zi
X-Gm-Gg: AYBFou1/5UBaxYYuxkpOoS3m/tLc2MgbtFU7tRDlda5T771uI9wbrkIASXhR8E6cH5Q
	na0h3A1utOa+tS3P/AZn2H2G7Byn2Zyo285BrrMRbUFQdiNf7SbiN0AVG5EuP0ekJuv+NuosEYp
	5AA+Oe1lhJn3C7aqyYNLOOoSIpAvy4q0tgAbth/cbW4ZGAxs4Wl6dePByby2QGvMdvGBylNZm71
	3aiz1X3OpsQROdAG/uoCECogfDNjTEhrKQW4IKVGZXZPNFqaZ3VDRtd0nK1UU275b6LWlddRZu4
	au8fCtMjOfn5CmgTTe0qvQdDvVTJoRZN/UWUtr1luV2jMzF+Y9/6xuDBNu4+5Ab8hMBTBBtC8ol
	nCtCCsYtMWhafKJo1mtQT/aoRt+L6
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr20245658eec.7.1791950558552;
        Tue, 13 Oct 2026 21:02:38 -0700 (PDT)
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr20245598eec.7.1791950557704;
        Tue, 13 Oct 2026 21:02:37 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm49774934eec.26.2026.10.13.21.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:02:37 -0700 (PDT)
Message-ID: <b773e022-922d-41b4-ba1a-17d570551a1d@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:32:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: fix NULL rpdev dereference when
 session alloc fails
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
 <20261001-fastrpc-probe-fixes-v1-1-1376d93b8b3e@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-probe-fixes-v1-1-1376d93b8b3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bc8F8sdBs3cpwWlfdxdBwG5h4XRj5BZd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX8eSqMQLKa1Tm
 94chyB4FEILBD23O0KvIbohMKS04v0UMHC7qmzzoBiUbz4wsrLEPruojGzjAmjx2Key8F8LKX1p
 mE02neCqL5UrLmjIp2qWRo7t5EZPN3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX1WqxJc2EkQ0p
 0txd4CX0QeKPSQ1igLjWIPvguFn++5CB9PLjDiedNC18f1eFCCXjQOtSuGqh96ACSA7Fc1BCFx8
 SJ0WAYR8vY4Ng1ptmy+MV/NlLeNV/E6L6uQe55R81CZ+q0bwkdiMF0MyDcCh58ufQgzFm8IhxlH
 Nz0CDmXNhTs4Ip76mQ5WjroTraIRkf7GXn7UVfJgwQrPjN182/xFRupm2rWwR2hmrCkBGH45T0L
 sY9UpgsFo9Lx0qaNsVYFiomOPUJ6XknXBuHuq7DLbX3d20quNIE9H+eF3k9HncwrjpR0Gq7fgft
 8BLa4EhFz0U6EbacFtyebvQ/YBlGw1i/Q1Xi1C82OY3qjUFk1iQ7/nKzcrb6xI9goppKb3Su9qZ
 QDtM6tZ7bDKmEXwehorva+z3kBVrOj+VRzwglqJWvg16AlTuYyTVrI+EEsNoBsoy+fmI7FNUI/E
 qAGiTl4HOKvCzgPof3w==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acefedf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Hi5JtN4IBsk8tPmk4jsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bc8F8sdBs3cpwWlfdxdBwG5h4XRj5BZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140015

On 01-10-2026 16:31, Vinayak Katoch wrote:
> When a fastrpc client process dies abnormally without closing its file
> descriptor, fastrpc_device_release() is never called and the compute-cb
> session slot is never freed. The abnormal client death on the DSP side
> triggers a glink channel teardown which propagates up through the rpmsg
> bus and calls fastrpc_rpmsg_remove().
> 
> fastrpc_rpmsg_remove() nulls cctx->rpdev before calling
> misc_deregister(). If a concurrent open() enters fastrpc_device_open()
> in this window and fastrpc_session_alloc() returns NULL (sessions
> exhausted by the leaked slot), the error path dereferences
> cctx->rpdev->dev causing a NULL pointer dereference:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   pc : fastrpc_device_open+0x1b8/0x258 [fastrpc]
>   Call trace:
>    fastrpc_device_open+0x1b8/0x258 [fastrpc] (P)
>    misc_open+0xd8/0x1a0
> 
> Fix by moving misc_deregister() before rpdev = NULL. misc_open() and
> misc_deregister() both take misc_mtx, so misc_deregister() will either
> block until fastrpc_device_open() completes or prevent new opens from
> entering it entirely.
> 
> Fixes: 7c11df42d0c7 ("misc: fastrpc: Fix device_open when no session is available")
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
