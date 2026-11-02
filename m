Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611478;
	b=e/xv31u3tmHBBG3HNRLRgbhuZ+DtTL308Fb5Gf8zVVw8H8j9CoIVahNhoeSznP6hVe4h
	 2A3FxAtwWGnSt4BopbjXDQurasA+MgXnxwJuENR1lWn9AGb+ipAj1YMU3VgRSOjn/lbEZ
	 /kidKCiCQ3zX54ZG1P04g5UviVu6J/TFzldkmoeNCCH6fxwK/710L3dXMv1+kDeMQXF0y
	 xJhW/+bXrfgeT1wGoWEPBgUc6815+oNx8xqOpihaYyP2jIjz+8iFkMmfMS3C3HFPer7fB
	 H0sJiUGcXADIcsFJhumkHFaYW1bzNZcgJ0T+RyVYgv0DgQQ4NKQocJM1ywYzma2aDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
	b=SIs5wxgngnWxjfYwNkAuDdKUNv5dHsx0M+cv8zDH1O0eEaN9CtDlpeGGCDk+mp8h4PFQ
	 XPFCBaH9egbo4QbEegXjY1bkXkf5lAPOWB+QkYqTV23O+Lg7HzWA/7qI2pzQxX4i2kCH9
	 Y86Qhgr707YgNl7LZxtcegBMXfIwQfTNwxYJEhcIB/qwqjrXprt3Qlt5Hb1eV8mnbwqx1
	 IOm/UboE0BdAbrxpUqwlm/Vc+dAUD+w7da05ktqMdt527E35wFFuS5hNSnUgJVj4B353M
	 AALhpDdZ7SPNxEQ9TrLH822l+ri3Ne7HWn5ou1VAJnaYfuez/iFHQKVe2heEZLh+geA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIHDK7zE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FE606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIHDK7zE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1jo2466135
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=; b=QwR+e+7pNnqvm16o
	xEiVCtCF7c1/iJDndPTeiQi4VFPw/s6aibuTC7Vx9FO1PE9BxwiNf5nnCnTZvjsl
	pyIZOZ7iGinxTSqlNirbD+G+Vg08qlK8cD5yjy9vRa/w8dz5QRfroOpP7LqCokib
	8YhQ7mJ0wNeMCUCCtN98RnCUEC4k8h4vZ0EGp4uFnevCr7aZ4iOeu8Q5acrOmdEv
	8jUOtedsRYDHuL7+AsAVPMPtkqukPc7oW971eYTzHn2gxcyjvjjY3jGA7bwzX4Rp
	gdHluJtV+8mFEqru3oSaRe17fZ9bm9RZ3N0t+sCHL/EmLO0uUqJTBBs+qJNf0pVL
	zvMdZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh2up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:24:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso4496461cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611475; x=1794216275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=fIHDK7zEhDvaK1YlAFxTfB4pXnhrm0CEZoKZZzhxtWZ2XVzlHp2nT7de4nTAY1meds
         /cfojiyUjC29+YV4JDZ9yqdvO4DVvdLOAhFMfMsYEUJaOyRyqO++s0pYUX+70QODBDwG
         IhbTYyXG6nVZmJRHIJm2JBRn1+BEH01qnLGHOuu6pBFUeQXI7zV1A7JuSD3m6aBnbEg2
         c88wl3PetyJzZ7LfwJO+VhRsIKNeNUKKy2+BVkT7GqxCalHcQZcG6e5Jz1wHWzlZYJzE
         sgUcOxeBR3AifvO4/FLdDsmwFE2HhWXgB6loOEb7MYprsAcfi6B++MhbnZpmpstjRBZo
         JmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611475; x=1794216275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=MDQYgoiSnvkahY7B9njvF3neb6ATOV/p67YJU//uGK0XYmBeA1rSfuu8Yt7ndMAq+P
         sCF7aCj0O/lxmSG0Z/QSCGBjwb07ekPmKlw6QRTsGabnDOY6miQH2zLncp0fMnnVnG6G
         OwGw0AtL9SooYHm3qEGFufXNXYyhimnqUwrRH78mB+FP7J+RCsgg+RN3FiVNgPYcS36K
         eK5q3eUutwRLy3syT2R4GZvQnCiD5SqhPadKC8V2y1kI3xT2BTllLSNU/AuIq3EtZcoN
         1+a7C3Sr4aArc9cIiF7jVz5ooCf6kV2J8G/s7tnY/Sz2S5xRsfAGJtLHWKp9ftYuHMm5
         zkFA==
X-Forwarded-Encrypted: i=1; AKwUvBzTXnJaUZBxAHtwPmoSHAKQtIB7KNxnacD6HTQojrYPI3MMT/75cC+2FppSoKZ/6Hwsc+26qnzNxAKCxDj+@vger.kernel.org
X-Gm-Message-State: AFq9FYKyctTmm5A5GtVg5sCjDJC36RxsCKvBCFJxSfUtdDnBrRBwgFlv
	VVLL8E1zdEWx8cbTIcWkSGBs1BetrYwvq9OfgcGUL0/DLMkTzYB2HQ4htYKiJACX4UM21AbHrSJ
	mcHOms6qaO+dN+kKRcERMYlraEPfe0d/d5sInqbCa5xSBZ33O9eSHeHHbXkxkPeomlRKQ
X-Gm-Gg: AYBFou06RihEd+bkf6+OD0Lx8s+Eaqzu9YKX6ibdbVlbNa9F9Lmd39Ph2lEbi+ivDd/
	OfN9h7Rh48jBO/8bqrGOGbinUMfCIQ3eimLuMCICe11WyMmHTMKYJ5PIgl+acqCHBvLcPXerXGN
	8PTbg3lyFYeuiAbchJ73ZHN8Ao9ZrxMzfXXnCe4oGg5zlikoSOL2PMZR5bpr6lAHGxHgMKKK2nx
	dB16ALPIHvkGlV9X3/Q/qI84NPYZBDXSFjuUjuJXZiWAmqI6YumiKLWs63SDtmqXSh3Dma4LARM
	mTWbOqqe46jsfSu1fv2vT2/yPtBRgJ3BB2XWKtk/c6KrmreJPcfMY2e80xUMdGrlO9hD4F3JQwA
	3Ky3cwcMfK4W7+Jh8nSw/vJm9Mmz9pXWh/DcaKb2eBNeWCXeCxhMQKTuRHY0gnGwG30lWqDk=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543678185a.2.1793611475302;
        Mon, 02 Nov 2026 01:24:35 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543676085a.2.1793611474893;
        Mon, 02 Nov 2026 01:24:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a91csm358465966b.61.2026.11.02.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:24:33 -0800 (PST)
Message-ID: <ab231636-67a3-4d00-84b5-1d7671d96120@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:24:29 +0100
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
Subject: Re: [PATCH v4 17/25] accel/qda: Add remote memory mapping to the DSP
 address space
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
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
 <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hu0tmcrO-lZ4in9j9Izov2DGIJsw3jig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX4m9aEXfBdYYW
 nsvf/xK8VmQZRTxKGI0joFDLaYscSOrs0bG3j53rSM43B4F0z0Va+wnL5M0Slgm8bhlgfhzMEAk
 FFyyhgJaONUdkxUqZTZjMOVkMBwe5w2bavza3cvVSe5pgG841iTH438nq+LNbpDVErEit0pLCQu
 m+M9YW2EXy4WmgIXYSigbn9LRFviB1T4SdelUGZFs2BDbCbf3u+z15k8pOhGg4MSDO54n9ypctr
 IbilEWDVM9mHyvpzwtdj4GLgFuDrJsn7loYzp+CcIiWaEMbNxuvkqlwBD2YPx57PrABWfzBxdgm
 5tByLcBsMG+achhxegpv9lhirYrMTwszsRC0O0qoxp19ULY3RgBk0BVJFesS2DS75SIx7mkXFks
 yfsDNIu5Lk/J2dHAJ2eiLBHP0EWWyu3pPpBK3Bl69d8Ea5hHYEDyYtvVEoxPRX20074nahPX8jP
 PLEJDMDIY6Yu7/X+Brg==
X-Proofpoint-GUID: hu0tmcrO-lZ4in9j9Izov2DGIJsw3jig
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX+TzaPaPdW6LY
 eQ8NNSip8+sTBiGpK55HM6KPo+jlOW+HlpHIImN8eCuZPFvVUTfPNDB7Ow80+JLgSxXNOtbElsS
 KHtNoLN6otsbus1NvhBTxur89us2wRM=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae856d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2m-AKP9SCvF1DGFPBvkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On 11/1/26 11:21 PM, Ekansh Gupta wrote:
> From: Ekansh Gupta <ekangupt@qti.qualcomm.com>
> 
> The DSP can only touch memory it has been told about, so user space
> needs a way to make a buffer visible to it ahead of time rather than
> only per call.

[...]

> +struct qda_fastrpc_mem_map_req_msg {
> +	/** @remote_session_id: Session the mapping belongs to */
> +	s32 remote_session_id;
> +	/** @handle: Identifier the DSP tracks the buffer by */
> +	s32 handle;
> +	/** @offset: Offset within the buffer */
> +	s32 offset;

I think this should be 64b too.
> +	/** @flags: Mapping flags (cache attributes, permissions) */
> +	u32 flags;
> +	/** @vaddrin: Address the DSP should map the buffer at, if it can */
> +	u64 vaddrin;
> +	/** @num: Size of the physical page descriptor in bytes */
> +	s32 num;
> +	/** @data_len: Length of additional inline data */
> +	s32 data_len;

And same here (and in the corresponding uapi struct)

Konrad
