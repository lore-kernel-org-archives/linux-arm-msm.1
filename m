Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2443CE73
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788467; cv=none; b=OJIAdfuoQkjbRYhPfZddV6oZXHMgE9DI8gov0X4crqv7S8LxJzzOs5w+1/yOTZ/s6/NWiabPKUO0Y0u75Afl+7ZyHtJCB/2FWm9MKczi2WfZSxY+QD/clmO/IJ3QZzeMPmYkDUD+xDIT3rivbXjQHAtRz/2K6BBoSZpPUJ6p5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788467; c=relaxed/simple;
	bh=opX9U3xt0PuQKXFWlKyeTFaXRUY2tzH0i9LU8vWzjWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV2+6DafC9/1SGlMkM3tYedOEabF+SUN7jmf9rfVKzQX0131zkOyoP8NpgXA6ohhvTOEbHlU4meFL9U9Sxthp25nQp7dgQBSln5KMGp/Nmae5Avhx6PfkCqbT2uaKnaoKrWXNIHYqKVe22xrA3pEdTPboNMjt7s+iJbNWLyYnsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY2iaJYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj8+n29T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YY2iaJYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vj8+n29T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55omQ751193
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=; b=YY2iaJYRkj4ca8fx
	8bZ6jZvcvd0ssbY/ugQTGnY6/UfhK/9Z7J487hLYz740D7DnS5M7xBzC3fLOFbfh
	9a266wndxtPqoBqEcME7WRu8N+gUqT5WUi9rSi4DhZkn69IDapU1z8EBmlA9LNkC
	DKGLdGz2f3XynnBVkgCAorA0/nqXceY73GgfNnA1Ma8TesCFDSIrI68qNg8q1qVD
	iCYcEGXYVoZ6x+adnkT2N6XEHaCsdFXEcLTSPdtxO+RjTJ6UVcKC27KC9RbKuXvS
	02p9gkiWbafP/mw6qwx5yPM4ouc+lM5S9Ald7WqvuAa4w3kAKr2HJ35hsU1T3vt1
	zeonow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed4ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:01:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc19d8e59so7410585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788465; x=1792393265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=;
        b=Vj8+n29T/7Z0qE2P8lm5ABleBzTUmPCD9sksRbXxiJlNGlPA2qWYXDKNWlTpSFEBqN
         vi1FmQWLedDMy6RVuwL+c30+bdWEKWQZhD5kcDk1+dQFqvHUo0/ofVjAJFHdKQylW/g2
         25ylPMJ4TA3AlH6O4PVBvd6syClXq4yZqfhKSbp92Yh5bERY8HkwvpjYb31sWPzBLPpq
         ggbhk1hgBd2Z24eIpyCxzdCN4jhZEkV4LdKbvA2rRvGNhvoUNbTqxAvqkGPD7TNooLkb
         mATgSWwl8BPCYLI6ULAaG8ha+Z9DJiLztFk6L0sr/3wi0Z3yratQ3oOunMP5x2vmg7f+
         aOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788465; x=1792393265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=;
        b=MhdbJb4t9DbfEFUWFQqYRh21Bq67V3LHY5pxbfddcNWnF2aJKq7Hu1Uhdtg14PSe2J
         9/AlSYg+zqf8jRB28+j+mF00hnLxHwbkffPtPs5dy3rFs+dcZNevp3qH0lffnWN2e51N
         GjywAgOpPtWbMgiYOKQZBhWJ+i2gNVnXiGKDe8SG1hsJBhgI+BThhm1lrEixnPPC6Kfr
         wr0JI5QGQI+0UrvIIbV4jytF3BODqnHEhmz53u9oRvqd2MoDW0kQSuwMnrYBVqYIM4X7
         iQruh+N8EwsKZgCff/qUm/kKBqN7uJEnIikhxNrRkPLFZoyR6tn4mOK7QwRV1D5yswj4
         1CDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4DmSpCr0PEbGyvt3sy167ZLoR+UjOiXr7OTTaoG6KVuYUgaoW4QWYV8OijWjLVN8w/H8Jf82+MWx5iXPQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7mY1Ky0HcZRMPQqhwFmxRTwLsjooZkopHxbQBv3xMhBjTHdoT
	BFOW+jyNVaASC5S+ORSpHLllgkYXOZnvwNZgiINhHtHnQz+xdaS3K2PodvtadaVjnltlvud7nsR
	hAjJIv3TYshpI7M1CNvtfNx+2AtRNOvS7xwZFCXxFD04hYw6iRQ0MhUkCSro4eypmhfz0
X-Gm-Gg: AYBFou283PYSQj2hhcKVO+KYAiqwYKxNDSZ2H+EZ8u3zsWAembIPvURhWQjAPYIz/2/
	Oe/8OAR1hDS0wzoejeBB+jWNuRA55kh/k+YE+LQ+U9HuuVjq3VQYhQvzbHj7sOTZNt7RE7Qpxjr
	CHrbzOl2shkXkEjjAUwFA4t8fL8emmW8DPLqZ3M8tMNFYYbcwRP01gnap4SVCwspdG3aSrtqgHe
	Bc97Mm7CujksveqqqlfhYEpx3b8QSvEaTJTBNglMDG63LHO+z0oxxIaoqLRSe8doeh+hckZ/bfK
	gVdasJkCOoOMNotTajqPaVYbZ8KsUG94aWIzXTEW5w3gdIqkZHisw5heTwFiY0aHacZqWjyldNd
	QvAVh5acRCPv2R5vYl95ekg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1637430785a.3.1791788464568;
        Mon, 12 Oct 2026 00:01:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1637426285a.3.1791788464004;
        Mon, 12 Oct 2026 00:01:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa94d4sm424903966b.62.2026.10.12.00.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:01:02 -0700 (PDT)
Message-ID: <6e67b0b2-8bae-4568-a276-56f9db360b80@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] drm/msm: correct DSC RGB and command-mode vblank
 handling
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY5PR01MB1060041363FC41A7F40DF59DBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB1060041363FC41A7F40DF59DBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX7BEogBd9MDaz
 7GTNGUViaukROg+LmqBjxsR61uKZIsEIL+YAKnYhbZYmTIN9gpqGQm7m+IF1/HmpYtYMyMzNLGK
 TFuun2Fhi8zifY1VACRAclYAaaWHR5o9LM/LCODrCnBh6hdTKGTh0dJuBdC8MdK/WMXWo5e1q9S
 33gTgwLJDwJzvBtxO4JQ0dzeD7W7nm34+smx+xGEfB3ItYYFkTpwyO+fR3uqkE0xhwaYwI4ezSG
 /w0j46oEFbbd8h6nmdrAlGSyrkFDauC2jJyHi+N0WEk4/tvlg+EA23krkEOLf9jtbz9nIiVS1z3
 kZ9YBPgLDu4ETNWIBKXNklAFzyoJBn1p2nGTd9T6PtlitGDWinb44PTxPsDQVRggm0TbIQHDiJH
 6wqbhep8wg8EXrTj5vCP8aXdZHyHei9yMG1eo5OzqGNbH3E175L2FRda/H252VgERJEejLzvSuC
 mo7UHCCmIB23lyBpXWQ==
X-Proofpoint-ORIG-GUID: rYRuqsFbRlCKHMYPoMR6dD9pdGy9xlTF
X-Proofpoint-GUID: rYRuqsFbRlCKHMYPoMR6dD9pdGy9xlTF
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc85b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Ot09LXujVt6j2_2-7twA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfXzSDpJ4KxgcCB
 0Af4+IS8OqQTSM/QNEwHqH7lAkR4mnqrWWorV1DpDpX3rBWrcarOLqWLtA8K/tyaDizRkMHG/r5
 JlC2HAUES1dSFRw5t+IPalXaxy3+hxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

On 10/9/26 12:34 AM, Zhang Jiaxi wrote:
> These three independent corrections preserve current target APIs:
> select the existing RGB DSC 1.2 RC table only for version 1.2 and reject
> native subsampling in a forced-RGB path; retain the commit's vblank reference
> until completion delivers its page-flip event; and reject video-porch
> scanout-position conversion for a command-mode tear-check counter.
> 
> Command mode initializes that counter at vdisplay, puts RD_PTR at
> vdisplay+1 and can wrap at twice vtotal. This is not the video raster used
> by the shared timestamp conversion. Returning false only marks that
> accurate scanout-derived timestamp unavailable; TE IRQ/counting and the
> current off-delay policy remain in place. No always-on IRQ policy is added.
> The completion callback consumes the current count/time and does not wait
> for another TE interrupt.

[...]

You sent a number of patches with broken threading, please switch to
using the b4 tool - https://b4.docs.kernel.org/en/latest/

Konrad
