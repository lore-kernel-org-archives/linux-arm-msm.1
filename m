Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616746;
	b=vHx/plB+U/fJ98x7HHYEGwRH9LVE4LbjjhGuKhSVMmAUUmk+1WmSnDkrQxUyrZt1b6p3
	 bIh5biOBzqVgtG3kmt8bAlWh5N42mFpcJx2VqSjk/V7VqRABmOzpQlaxPxa0OzovRbGFU
	 ntQFsHO+HyNP+hKWW5pFhy7BT6h6Q/wI94GQyJW3uGC+FDjuZms/5qTXe6XeBrwM+l8cJ
	 jCLyxB7+ennOABqaVDV8WM3HHl05nwdfVRFMYijCAm9ROIV6SciZwjdUHiaikE5gnM5J+
	 vucb7j6LXv8GOij+v2VX3BD+C7iJTN8LrPC0lcu5rRY6hTuh2ZUKrKVmBYuXVEPYYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
	b=Nsc6AI+QgPDP4EVT47Ij9Mzt5JToia921p2mbFEDCcC1I7YsUFvCeMpiU3/PBCXYNGGn
	 HaOFV1phxWBrBXABfouHU4oRBDavJ/GT80+1UjtYZtaZs0oB26NjWnXLyaTyZPin4iL5k
	 w9g91CION1EUL9wWYZYRWHeF5gXJvCX98TFlaE9USIaXeZVB+Auo9uJhWt7qlNGphbkIu
	 OTOlmISO4W8E6VhERWBY/308a+gD7jg2hb0gD24FrTsuM1S+0FuTwldxZiuaSqYo2QFc7
	 qlXde0aGJMHmnZobYl4nQR0r7sH3Cm+maQKSgFOPmV/DQjalGOXpeUOaOtPWj+8Fovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdAlc8IC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQlGD44u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBED606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BBED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdAlc8IC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQlGD44u
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AO6U2880892
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=; b=fdAlc8ICM5cJKU24
	MEyeQiZ+Ko0T6Euviv1nufX/eAZJCEpNNXX6/iPFBHQp2YeaBdyo0wDL9nxcdqEb
	KiAPVbKSxlXjOTIYMqA7M8ipYH6KsN+mAFINrBJ5DnUJYM3fJNgBd1iIaY1AsIvh
	w8X3mSVK0wI93WCwx2SSIBV5TyFioLSzce6Mm630ql6KoplC0ugiZSHPOVe0LL/e
	gFuEss3KDTEMziSmQELQ8ngrTDPlpjGz38N8FDCCSgepsjdGmqlUGP62KW2DxKVh
	5KJLw2DbOwc8P5JU4iqpKCfkhIB67ttFbvE/XQr2ijYTF3KINVmn/ogcIarmmFpg
	aLcq4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgf0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:52:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3950867a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616744; x=1794221544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
        b=kQlGD44uZmeJQcp+eNg5t3k6wqC4gOjuSVp5gY3CenSneoS/bWuSPTdbQoIL12kCtQ
         yrIYvjCbjkO6o4m9eNyAIuM40rfL8gyNV0MHfuv7Cik0mqaIMFAn19u46gIaAPT6Bqnl
         zhGUXy7g2u+r0WPbhuYi90hRs3L916bA+XqAxQLus82EHpu2G+CHnUHT2Abmmglvbwqu
         ThKK0vfRdXeiOD8WGc2pu8ooMKzSYHCJUHQxNWp6bzsndB0U6hIvqNJclbX3KSphcSMa
         TbwPoBAhiRadZ0mc80NYWfWZC9IcqbcITQHcYEeWSK4iVOvzB5zyquBcBGssIUVTChP9
         meDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616744; x=1794221544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
        b=gA1sdcZdftLEX+/RafWQMqQiUor3pfDyXnuvDylkUy4K0A98q/DQVWLykiVeso2MUz
         nU/lngKLyiPn2iwwWVxcFV4swlSD5oyURfKbj1jmBn6h9ErdLQ3nDlMGUIeOTDEyK9u8
         RiDIS4CaoHOsRZEc2ocTNoELT4M7xNvLz8A2BFBlVq1AfKQ/brfXJQKJspHVoW/qwVGI
         d9lEGJnNKINwBezkz3WCnv0iara+5KrYUTVqQR1NTXnpAYM3xkXNmr4LYz6UdbbpQbLK
         k0EoARqUm4Sjn0x8h7XSHajRetJyBiDjn96LYRdfjmKmpxnphwk3vyGw1zITdWXLxS+f
         gcvg==
X-Forwarded-Encrypted: i=1; AKwUvBxiZUmW47nEnILnStDs3Qe9531dJrySFsOdCbHKrJ57knLKOL2Pqxcj5tHtnGEiJhEWMvAKIpxkhGVCXXI0@vger.kernel.org
X-Gm-Message-State: APuU4Z8fnojiWcgHLCr5YufRggmbevKlOackY3gOpI5UjfLLcUPuN9Nk
	eZDUT8DkrcFB7Gka7Z4dtbNavHAgdAYdgfUYmHpGxlJz0fFp/pMfCwboncywNrVcm34WaP8veTT
	Veh9L/OCy3LSxx1KIjzjj3ca0uME6WuED38rtGCcRvi4UbDqrtNfeQCkmancaEyYMw7yc
X-Gm-Gg: AYBFou3VcvvOXdKwLFuqnVRLqaLbKAf2CwuukRmX9gnAcF9y00FPs85COBRXeeUEmeb
	FHT61X4SCE9PrfCZL7DzdkcQmHEWt3ZDnCAhtjQX5VfUbbXRdCPg59w9lrZ5invDBrowOaSsNtD
	2/Sjw7HLtNO0CsKn4c3GO9lsuxf/jfRtHUbxoNJp4gqbFOwXHI8D1k4fGDT/oxHoKOGCGcC8V/6
	pxHF0e0gH4MdjWbGU8tMgi73H3xeqIwauBZFqW9bY1WFwGG2ujBcKPqelaXCD7trS7dYguWq++8
	1umuirX3SJFS0LciuiNWST24oc7NsyEQnmbUsmy2jcbPNOgUgEZrMQ7R4ul1S5VsIim1k29K8R+
	oI19pj10Xrj+vo5Q9L2dMEI28ZDP7hWxST7/zZU2ztV6qXudsWM2X3vJCHt4eT1UwmxSt4G0ncz
	ovgg==
X-Received: by 2002:a17:90b:5623:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ae89866277mr8172387a91.67.1793616743925;
        Mon, 02 Nov 2026 02:52:23 -0800 (PST)
X-Received: by 2002:a17:90b:5623:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ae89866277mr8172345a91.67.1793616743488;
        Mon, 02 Nov 2026 02:52:23 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm4951335a91.7.2026.11.02.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:52:22 -0800 (PST)
Message-ID: <c8375e63-e358-469f-9e9e-8a174137f914@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:22:11 +0530
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
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
 <26ca5c66-a2ff-4aaf-9c9d-724ac66480eb@oss.qualcomm.com>
 <da2b5192-a081-4469-92f4-2ecfcf502e4a@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <da2b5192-a081-4469-92f4-2ecfcf502e4a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86b68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oPeKDEZYKiJIZNr3YAsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SJFhdXkbOJA6C4JRhrcQtBbsRaAeRB2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX7IIfCfpaaYOU
 TZ0iJwKNyo6KRI1R9g7FmWlaxSBTBDb+iEI2K79DUDSAeIImWDzkz1LZMKbbaGloKct/U67WsZW
 qUWYGS5BjuJtqXO8iOoHlM0mIbbDZec=
X-Proofpoint-ORIG-GUID: SJFhdXkbOJA6C4JRhrcQtBbsRaAeRB2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX+2NrSyqoxAyy
 oz9lWSO0wuX+PTEtKL6PcqOzAx6AE5HjsujA/YFzVGBPSqnZolV9rX7UoeHXRokZZo57rijwM+k
 gYMMKSjnn1bdUg28b7ZvFRR9lUkTJCPfndmjR6BOW9MeborUrcEUAsgs0k0z0ot9r1RSQ9jJz+S
 phNgLdkHSZszEM0wF5iNJaYYwnFmm/bQzzRqhWR/6JC4cwLU3K4SGS+qMDoZvonZ9UxWA05+5LA
 bVLkP7/yGEJ19gpjdRR2YkwUnK4tIJukX1Xop8iXggVSbuuz05EERLrxgyhDWxioAoOaPHuhmH1
 LHXCtUIaT/G1zcok3JbD4KkOkAx2mX2mmdwIj2Khpqo+9fU2htnLACHbnQqqDWgXdL+gSN6Nib1
 XjIdw0JS+ERfzgkfZ+FKxTrPSGQQwLcroak4i9DwG8tRV3oTi5oD102PDJcYcSStoDjmSYeg3eK
 nbHT/4TQ0YX36TiE1Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020043

On 02-11-2026 15:42, Krzysztof Kozlowski wrote:
> On 02/11/2026 11:08, Ekansh Gupta wrote:
>> On 02-11-2026 14:23, Krzysztof Kozlowski wrote:
>>> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>>>  drivers/accel/qda/qda_soc.c            |   66 ++
>>>>  drivers/accel/qda/qda_soc.h            |   61 ++
>>>>  drivers/misc/Kconfig                   |    1 +
>>>>  include/uapi/drm/qda_accel.h           |  282 +++++++
>>>>  33 files changed, 5877 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
>>>> change-id: 20261102-v4-e8feb321263f
>>>
>>> What is happening here? How are we supposed to work with this?
>>>
>>> v1: 20260223-qda-firstpost-4ab05249e2cc
>>> v2: 20260519-qda-series-78c2bf0ed78b
>>> v2 again: 20260817-qda-v2-78e2d1f10529
>>>
>>> And now completely different one?
>>>
>>> This makes the change id completely unusable. b4 diff obviously does not
>>> work. Any tracking of this does not work.
>>>
>>> NAK, really, I already complained internally months ago about such
>>> practice, so apparently not enough.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Sorry about this. I lost the original b4 branch and re-enrolled the
> 
> You lost original branch four times. It's not a coincidence, it's not
> random data loss because then after first loss you would solve the
> problem. It's a broken workflow.
> 
> 
> Best regards,
> Krzysztof

You are right, and I'm not going to call it data loss again. I started
each posting from a new tree and re-enrolled the series every time,
which is what produced a new change-id for every revision. I've changed
how I work so this cannot happen again:
- one long-lived tree and one b4 branch for this series, used for all
future revisions;
- before every b4 send, a check that the change-id is still
20260817-qda-v2-78e2d1f10529.

v5 will continue from that change-id, with the v3 and v4 postings
recorded in its history.
