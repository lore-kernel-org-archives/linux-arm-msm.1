Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705654;
	b=Oj4nbg71IyMnb6f4AVOEwXuuou/JESJKHkuvmciGIim++Ai0KrTWzcJ2xAl85jWDw3FP
	 r/PrireszTM9i+pGtQ8xM0NfWiXFpQ+HeO7vHZ7uteCAiih4cG5ylzdZ0ogIfr0g7vDZx
	 8BmBn7U7jwpwaYFQMDeYlDeV+5MkMVWPTstWrLKjS3UV5v9C7jH/leWmlmnTtX4Ng2vG2
	 ZaOZ7mFaNnXWZvNQliYNHp1j23Z3nGysjrcjWfweTIgIXOhJpbtnD7MapQ/YFm2I/jM9F
	 0OEyDEC/TOozBB+FIEtqU8A8vrSaMN2xUAkMXCrCvLmFH5Nnea9Lvd1UQxe6js9ELPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
	b=0t2R0isf+G0MjDQkKXQ86pWhtssfqb1XVbbM2bk3I7+P4HX7ZrmAvhVSa0cATqm694fq
	 C5GM18MOlwlAyBrZ+ZifYZgckXN3Ml8wAtc0pUVUuBL79ncDgr0V3+yTibpuQ+raX5ST4
	 o6UvGoDhYam2MEJCGYyBLKz2djptA+oGYe3OlJdzunjCxf6r5wOAS+oUUVRGbN/+h1nHo
	 fmD8wnf3fyHSa3TiVnwFxjr6Re6U4WiDI8cfgsgM6chB3npD13ZzC5f30vkywK9Ed1Iu6
	 2V10iZ3dtalrePCmMeayYJo13YOgmiBQbd35W6/sLcdyvMBFueikRnYjUJk0Xt8qWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AqoUVJ/d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MISw06+I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DE606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AqoUVJ/d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MISw06+I
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAWuC2201939
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=; b=AqoUVJ/dxBv4VgJR
	hreNW27lhBeJqbDR2aGvdFn6GgIwlabmn0rlabfPbX4e8t0LOnvyYdwUVAxCZmjZ
	Tm44HSDuZMgeN3FMWBE3KizomIQx1ckXtqNuu4cfEkk1JRVl6NlHDvLcIFgnDukA
	qqBy2wBnU8eQsxWJWZgeOu6Ujled71yjpbP15eOaL8Y76ni5hgjyVscKiOhceb61
	p36gErY18Qm9Eevb567PFH6eAaqFf5ZUpzNitRVm/0ik+FYcl/tQgFjhouJviqrS
	7CFs03CQgQNSVYX53ANs31qrYdiGSjL7BtB1ZNEMkbT3W+MRxG3lxkwT73C38+Lz
	6oZ+oA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3gs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:34:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so46110085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705652; x=1794310452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
        b=MISw06+IxoqnQPS1QDrCXhr5U77lvKE0DudgMg13VAp4pEy69qrkecUlGJVaA7wGma
         HnVGJ9QZ6OAj+Cf0G9f4qLCSS2pV/jEZPVDTGZZfE24YXU/ljSItDHoTFek0+Cj1aWTa
         PRHhm6WW4BP1GKjbxiT/beuBcKVlInHz+GX20pTyCDb8qfF6bebOOeTWz+o/xk9FhZGR
         iz+iVXuMnaZ03lLWP9rnkZl/TVjeYu3Cm/y77TmB7B87S35VubWd3A1kzYc5BH7dNzoY
         dAu69NE/UfbPDA+BY1uMG/MGMKADHobteMr4ELeVSRWyolsuupEvrOardFVRRcfR3z9j
         WQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705652; x=1794310452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maurfOk4cR0ueAIurI11kBg56ZYvTSPe0M+xFKXxfJQ=;
        b=g3TSWppSlWHuN+3CZIscQap8rn5adm/K3bvNebXldroG+f7/aBDS97idZPiARJjZrK
         N2GfN0O0GqCGS64qEkOhK4+o7DuSlRznLCjswo2gpCquMpOPOxBSNtRUMQaWGuAW6ESf
         +xZDfOubhez5SohADdTOS2C5h4XCRaD9GWR0EkONkAbKBHJdl4+AtkfO5yRlnVgFbX7K
         54hQZQ98VRPvSGUo0F4uUteqxJFJ9v8HSylvPfLWZf9iIpRFf+UWm2psR+vzDN4Y66xc
         D/dggcZP/368nQHvJ/ZS6FxM29frxROPgQVfCzWhSGQfhl1Zqs7Acki1evnKYvYzI9Fd
         7ODg==
X-Gm-Message-State: APuU4Z9Fua6/rNb0uqcM7QZv2C5IdpNwfBBVp3a9mSgq2lyyzdbrYEmk
	ccNxA2IpAkbveFoGJy3ZjvkEv5zdpQlsU/6iPhOm12Y8jIyusZWM+9mq8tfTCA1lLY1KPVYwpUB
	EAMck6XYxQy/ICpsPMSFqtfTu54iGZwAy1Tj8E8kHyBa+wKremSG6CZxfGCtvGkU7W0ra
X-Gm-Gg: AYBFou1fYlGzRqapMqC2lyj0dpFIQGuKPpuYQiYbNoamrvnYKJ4UNWm7bdLTeN80U0I
	kKcMsKzrxDTMK8LrYF7Mrgz/46/jNG+9jDrOaB+SqEOeT0t8oETvxAAHhY9vKCkxe2WGKQUZcOB
	JgjQCl99kKPLOfxQDKcVtD2KDu332dZLJKYip9N/4pnlHss+FZv9goRGYMbueXbnTk4O6Qgk5v7
	fIbBbTJKTgAPl3zSExe+Z+T3l1z3OYOIaaIRicfx5DUVhu0I+4qE/kggxtOT1XQTcP0vaRv6NPv
	WOq7uLdHZgP2AXpjdOE/d3eLw9sabMFUeauEI/mryeuLexEIRFqwZYBvq/T9FJiX4QeLe9YtnFy
	dvgdiPAxL9z/6CCPT6OOMcFiiJw8RvWEGqoJMCUuc/AWWs8tMOixHTmf6dhA3O4JBJuZAuQ==
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr2304381885a.3.1793705652284;
        Tue, 03 Nov 2026 03:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr2304376885a.3.1793705651744;
        Tue, 03 Nov 2026 03:34:11 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec0751sm77048966b.26.2026.11.03.03.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:34:10 -0800 (PST)
Message-ID: <4974e205-c6f3-416e-ae31-eac2d8569b1a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:34:08 +0100
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
Subject: Re: [PATCH v3 1/4] drm/msm/gem: Fix VM_BIND range check
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fX62GQwXblTioCPdE3nng-Gxhaa4fKxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX3O+v1kfEfA1e
 RpEIJrdUvurWfPXRvddJdNT8KovKiigfZjBLdPVdi/AGblU1wnA+5SC4fIgtv8+y+9Gn3KaTWGL
 tdSN4LgPcRBKokYwGJNkg9aW4Wz+UHR4l2T4fk9ZqUewknNzMLqAq53tnE7VmaCxgMvFJcbuv/j
 SNml40Co5a54eJfRLsm/OxbQiW1NPbvm8nsqviJW6dNwbbFzYOdqlrAMvToB/78Vx6ldQxuF6dk
 6rGk/Bk1Bawk3V9WrcH3uvmAoXpa9PtdRQN201wzi/ia6VeF8HSE08KVMTVnbb22PsKhjir1jRF
 J2HFh/iKfSqcU1BJ/O3H0+k7h0UTfXqxYvryAZCubRjga96erlQuKCQkRJHkFnVK1qfX5B/T8Od
 AYoDgdNHILz8e5d2FBLz7rtPHewFZQLhcfv6r3paWJCj3krCas3sQkNWqWfyf+t1UiZjKfltd2Z
 TysQfc9GW4AotXuo9Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX8gPD5QPet8SO
 WjB6n5sFXS4IyThW/LmRkOYlijW66vDVDsfOj7H52KQH7VzjwRLM0TTBHCZGbWYAqkEEr8Y4YXV
 wogKTlujWTgS+0KF3WjNTAK5HXvJJ/s=
X-Proofpoint-GUID: fX62GQwXblTioCPdE3nng-Gxhaa4fKxt
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9c6b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=chFjt-TYfWtG2qqLwSIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 6:19 PM, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
