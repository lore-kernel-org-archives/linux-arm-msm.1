Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116759;
	b=fWuTJTdAPzcRrEjQvvrFqy9zMQcYW8Am7RXwzX8jGUvffqCK3BrNrIpfmchuM7upciUg
	 QRBe8FV0LDj19lSUj1sZ1uveDcrvXorRoYxY9WTp9hmBXboS22Hqa80s5UpkJvrcKas+T
	 uF6m+ox8D7QrXYLDajgpeef7VyvSjFo9zN7ZblQoqbABr1EVeLH7qo/14wfG3lO1ReKYj
	 v+BNmFlUj/z0BU5nAAGlWhFAnGdBLuK+bnm0LMwxSzqSqmwLQOW8kMPBN4dT1pPIUH0Rf
	 lh10GMw0X4RqS7pimw0fTHUYirVu+PF6yRZzqsEyOZJ9gUFX8hZ1JAr1X0GlWXLLZ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
	b=LAzuQlp5GQvF2kqz+n2ri2mwdYBWXPwEJosAcSOHFXuwlLP/NumPMH81bterTnmDbYfV
	 PuBgZeTl/Cwn64/dVo/r0bWpGmIErw+bBwUlKJK+NzJfo51Gy8B1ZEY6NifdFHvrdlN9F
	 W8IAZAOSOTnA5tsIkiB1SPdbE1nwVAZT1yXVzikiQ9+vUpks6GLlGa/8BCUKj7Bmqx8ap
	 3w7129IQLZ57dtf9Yb9QZJ+bZY3Ek8hvyUZUQcND69LH/7j+Eyr2jk1sYc+CFl6eCoOYo
	 V/0CZdlPHXiw07Fie0g53Krcp0ETU641/K5VCoirNoLnNOTLdtB7xEzKu0nEaz5fjtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DJ/fLSvV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWLrXnyg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C9606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2C9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJ/fLSvV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWLrXnyg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKxr92054869
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=; b=DJ/fLSvVDixTzxyr
	lhKnPF5a2zP/KnjzLh7Yd+DhvE2u2omuC00jIkW0HQSc9LliwxU54k9RyKU6Bx+X
	DE2DtIb6pU6UD022/Ez2UUo+x10rssW/zk/pIYyp/+rsh97IxLVTEcG7gbvWAuFm
	NERBLlZu72FhqP5sltVo+rPBY7nXApqFnysOAfYcHakBYsz9NETKTO/Gb/RS+qor
	25N2Ilteym8LkmynVKZCssGcI3HMeTkGqP1TwbWROqawGPB7a1vl6J2S7o1zi7qm
	4yGP1XOcNcO9e4BxY51qmcfO7PyER71cziPAtz6xO15jGhKM1BPki72g0Q9PjH5Y
	vbsSCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmcgr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so64708885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116758; x=1793721558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=TWLrXnyg5jjbvuSwt969qnGP5cnAR4f7KumJ4//fvWtsgTU6wLmdXSC73bw3LTr93U
         VXKqh/69PDlxqDjNd7U6MXyfy9oqXiPc2gxa2UqqMbC2kYeQi4BaaGscgrgVLG3DlmG9
         LWyudD4aggc2uJZhcK8Eo/w5DXI1yZ0WlI+QhC5C6QdaXrvnDlZZSRH6PZBIaR/SeKhH
         vavK1vCJzMcSHtUEVyJrxHrNLlnIdo4bYYSH0AJ0WYjgkuZ4Rm3KYiNNl1WemgjoVe2e
         AcDyEAyVPiQy0kqeomh/VWfbmwbtl/pWWDgWqz99DM5eOFP9onLJz7A3dLqHT6p0pYBZ
         qSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116758; x=1793721558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=m2vrqiblKqce+0shsesojQj9c7ZLtBiUK3MGodZHi4yopzyfj1wWSyyfjPIChlVjkL
         2/8ixWyEdIijWEKIxJ1yDiZAbv+qJgACkXUrWPJRco7MS0NWPPMO5b4K/UtLI1vJ/pUv
         TGexxEHK5kKOyarbkgRHX+0mdO4mYt9+3D9WyFqLoJ3bAG2bUSnclvkRouOEPb7O7luW
         S2jcZlI87gMULdIw812AadRB6jTcUFpngsSM25MhUx6P0gFHhshHFAeW3MQ5WA/pEM2L
         cMtVUoUSPKbkAuqOwWe79fCKDt/p1Mnm3Gzpvs8RWqafpTpTd7qT7YdGE76ggLrqm2wz
         zZGQ==
X-Gm-Message-State: AFq9FYI2PRSFJrKMszvCM6SWVTNKtwTQketsnmy8td4K6glNSZq02eaB
	6OBboLS9hMb2JPjwmAMrKXIQJNJQwj5FMfQNM0mx6urxbWCHT4gBaSsTXdo+rJc8ihaOolybUyh
	nQTFUnL9YNUFaF3u8M8HSYaBbBVfF95dAg6JXy5VWIxcByAl9BAOfj7RY2k/sb4vftAM2
X-Gm-Gg: AYBFou2Eu2AKET4K60GIYjTR6xuIuJYp2b1tHNraOJoPBStjTKdCz9/dVIncJ8iyqBC
	mwU9WvnX0XtQEsOOjTBADt6Pm0GmdZmO01nYga0oxrml06rn6oUbBjS67+7fYY96FdmcgHGzhAG
	GiUr5caVhf5u8olJRViAxGo9t4QATaXQOX2daBBhJZHz0Z7fuJEl4FmQlywTd+JHROLHuMtua3c
	2yzivV2bx+VTAk6b1buVxTR7CnvXBnSxGqhP41b27JFom0diMW/6ukqcEJMoGcQPY7OYRpHU1Zr
	oi+QnRip7SYCjVPOBH8+se6zJ08ga6Hk/MwW+ctR4MTiiYwkVXOvolxy1b0KXe2tJDTr5aTYYoc
	mV94WclhpPtFfkmsOxjg33w==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564199885a.5.1793116757608;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564194185a.5.1793116757056;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:16 -0700 (PDT)
Message-ID: <b35f912b-2067-4eee-bc83-25028ba51b8d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:14 +0100
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
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Drop export of
 qcom_scm_mem_protect_video_var()
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX/c5zrxzh0BGj
 dQ0tHm0gbLDazssF9QK7D+5N/tZLYp4ioaAa1xBXFucS3lxsYK1Saz46dIaL+txeRvh7OdnDoB7
 moybQXnBANAfLeUymaYqB22NL08fYcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX/N5ynqRSvG5p
 NwysJD5ATiGSuSz7DA0sSVzoV0fyc1+AUD8Cz5RN8fBG1IeX4ZCqLRQI4bI7aaDursVnaMJHG7I
 Mvi/xhSuJh5RwiV/DnWSlDU1YKEyiP1UNH8iaegI4eMEZf8onryytA+/GTJ9Z/2rJ6CP65ladrQ
 jPbzQ3TajV6MlFEti0WE9eY3avWqIDJmjJ0WdINuI9Vb9edoY6xecZwf/mcCg5YewJhlkKXxBJu
 n85STKxnNZwTqGnirDlumST8nvS1RR+uUj8QnaTmRvPW+ve9xX+rVxCpkUQkF0t1QY3WN2njuNt
 DkC5wOXYwK21ev59UBkwRxC781ZiTBL5A5l8Brw8ZUUZWvdx5zC8hyy9pgUOMrtMZgexw7oB+nI
 nEjmkrIkL27cRRzu3lnf3IsBUUNQbkkMDiJHm+EakAkEqiS0e20gsg+EKAmQGbHfSM4UAL5/iS+
 nIn3t0KiRwci2EiguPQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0ca56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YO-PTOiLJedIpx-aNNoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zobqpRunbb-7Fud1vyV3uJtmYQRZDmcR
X-Proofpoint-GUID: zobqpRunbb-7Fud1vyV3uJtmYQRZDmcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> All the users now go through the generic PAS API, so fold the SCM call
> into the SCM PAS backend op and drop the exported API along with its
> declaration.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
