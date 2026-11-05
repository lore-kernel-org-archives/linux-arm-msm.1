Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894180;
	b=kGp6ATqeq163fIcSB6Q4PMpbo48AM1w0vZAGceqZoUgIxflidRjJ0x+TzRArjuRrZ6EK
	 QCapLmxkKFJ4/e1HfXKU7p2tQuccnWWnVjyyh3XM+6/OlsdgRWShyPM8NXBmBlSXHB1du
	 GRPYCq0hs3Ic36O2rd0D+4CSFkspxDzwec0DZzmuKqUqs0uiidH89/QPptl5qb8CVohm1
	 PBskGoqS3fRCpXmjfRFn63GyL9QgmJPUHAWF2pHd2B4k9tbOm8YSy+HGYyzuI1oraLqkh
	 m2pgrIjMbRhkuGDU9kcnmK3WxfojWKsAn/vHFfSQSuw0mHbcabn5n4WI38R0lrtSZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
	b=FH0uHkogmr1cSxnT3h2IvQ6AK70ohiYGHYVLFWVa+QCLKLpENEJRd3rTDx5ynMkNOIgw
	 HrWk1DW2Vk8l89F1UCNIKcBYKMHkiHQ3lhAEKxu1mvUKIq02DlwoinSLis7N6Mk82CrUr
	 lb/Vp0r2nFbFclk8KnnneZTK6hUnLheAAvWuGECHDBDGY+qEmhfWUg0uEoD8vP+wVbmfs
	 vpdSxaJ7O7od+mBvpA3wD2uXD8QfmeqNcZlo4ull4zwaGckZkS7/OxEEpPgotEWdQSTXO
	 0WA0KrRiCZMbfZLYzwVFoRBdOX5xCTLDv3e5GJT+yNPsBIf1/GMkCZ3bZohbv1GMPLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rb5A0P8T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089F6071D59
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C089F6071D59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rb5A0P8T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQFdg2004485
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 15:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=; b=VGBnFV2rEK4ucWip
	EowChD/fmUTCxMEcHGvovQsTFk/mw6GNfzfQyRCq3ob0jai2N79faah9M3C5FvNu
	AuT3kNRGuRprGpL/VWoPaeW4WruB02+oul12V1KxW3ZpAlSGw3qGA0cfOApRb4eK
	7XtD2EJYplGqjKpQWhG7Uab5DaXq6wGZA4XPaTa6i5D85uXZZTden856MxEJH1c/
	uNzRD6nZam5vz7rrEvkbjEiaHSDSQdnV+43cahZkERYBdSfQIMeKGqwMnn3delAm
	aL2EKUsPvxmwvPizsvDTj0dSsoKF0qvBAK2a6gsMCKOo2goLbAWQE16hSxJTZ+sA
	9CZAIQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1fvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:56:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabe7151daso107898e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894178; x=1794498978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=Rb5A0P8THXfhHl5lQzJE/R/lfLsbmAMChCOv3AwtbiRLe+OsC/42uC4KOWkqwVXf2X
         Qo1edhHqNDzt8mwZ3pJTx5zNtTApv7uogwtkmjmuAcCgiY2IlZW2q8sbbWSSkKa8AK5R
         nyVo8/ILNfCV3LdsEqPE4dfp2quTI8mKxkJlPq2tzg1W5FMxgle0bGPLplpVm/7uKIXX
         pxNWM8V8iGaYZ5iGcN50SvQhq+fSLYxTKkPltOeg0ohviVkUdNXgSWZgPOFivW85KJWw
         xPCXDazbuoMdWCxdyt/djPM+iVGdMYuvqM2hrZbqb9OqdfENfxWTKkrie35oYrn/7XWo
         DrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894178; x=1794498978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=PObHO3o7aOhvg/M98dXChNKSXted5/oYgrlpgLw0M4EsgCVmcahXHFJzC/HVrBxIMG
         z6cENrxdSLmgqzrwUGb7CCHaYCReBhIOuoo2mXwWaUPdzz/nOABgCHkCzNuc2y1G11at
         ErcLfmitnXuzvLLpg7kOs+bfMayShsvZGltbSu1jrFwMWpET9z4LvuK3+Ns0Hn54zu9V
         hJhziXt1pbiM6T88scgU6JP3i//a6HXFZ3iOiuy9wuSYEWa3DOF/yt6r7g7/FKc/IemS
         BFxPMchISFxTmU7UG2r8uDxJnV/equJpsnyBVsqVmwyHZNT/3gjVpImTIrXQ5OiMkY7g
         s8RQ==
X-Gm-Message-State: APuU4Z/nTLJw43WJ8nTMD2k0a0TCMcknVvDfam0IQNsIB1LpLFFLlbNX
	RBw7CBkVKEOHqirwG7gg/GKX5wYSoHomJvUyTfup9bJ6E2FRqv553Ol99VoYY/Sl3K5//5eGYHb
	9hTqG/6sFX1oiEOdJe5Z9GyAEF5Op9Vo8XlJ1nTchazRGCEmUe+GpCBjXQlYZ0PIVOULC
X-Gm-Gg: AYBFou21aNZ+Axf76zwcIrmYd7Lult6PdezD1HtzSRg2Ctw2OiaDLZa+wKnQGRfC2Rk
	qqnhXba1XXxkUhfHKomRuyuSxMsZStbfN6ULCbAkm4NoJOEMHYcOWRsoDTf1bE7FMpp6wVCWdNf
	XkcAxLPgh5QcNKHPRZ3Yw6mSahiAXilMKpeTk66ZNgcAGMGAnA161WvEhTC4f7BVp7pfjQukEB3
	o5GyrOjzwFQr9TQn8IxDcLzhlgb24RbA5+54IgH8ogmIhfPlln0zeuCE2xbcNvcajcbdM9WuFrJ
	CLuFfphl2tlpt7vu1+oH+13xF5fCvSN5up+nGdL/54WqPWPGax/fdIGEn6mF4usgucR9nzIy3tE
	VdinegsSSU2n2/mNOYvzs3+SeXoAKSuh9STgNYwmrBtdST2zH4YQSUyFo4Kqs+eJfdpwK
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492638e0c.0.1793894175392;
        Thu, 05 Nov 2026 07:56:15 -0800 (PST)
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492581e0c.0.1793894174381;
        Thu, 05 Nov 2026 07:56:14 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4422d1sm186151966b.39.2026.11.05.07.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:56:13 -0800 (PST)
Message-ID: <076f0e7b-8fe6-4e9e-a0bc-a80ee83f879d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:11 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Clean up subdevices on probe
 failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX9mCHy7FA2Vze
 n5eJIQqLx0IoIVGWSjXp2jt5bvOxtIu8eo0botJn58oDVDoolfJGE9AFDlt7wzsmLT0gw2WXG7n
 KvUAJ8pU3QeShIPwiBbmYBE11/ZI1zQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX3Ot22amKXBWy
 mhD1krHQPNmac6nPPZPXu8NvdZLRnem3g5/JfHAzOtI0uPQUMX4hF2Lc3Pnc8yyVnUorA+iQYa8
 p8LprLON5RF4TV43lUViiJmyVpMFQoeCtnD29TP0R3UxjsPjj+Hq4URAcSL4wHXxx9AxYsquCkZ
 Z8U0XaZ1gQXOqZ0QOd7Swl854q19ZDCzeiAnFpJ13xlPSnkONA6hiGsJGMY5zRWzOgUShpFd0oG
 jrZjCKKJG5IKvgPbCfNd+6Y/Hgu1WI4HVOIozuu2Y5TzdMgDYQZEDAg9xBavskiMqmD45Ck57Q1
 judACyaNleq6nbb9dww0aPoKy5NvKUBKWmkYK2UxTvxguDKV8EqH3uTlKWyMDBidSTJN1F9uqb0
 yjTZFXl4fggqfDh1/zi7Wu1sH4KmKQ92vI2xFP6NGKJYJEsOTr7v9iX2zvZKZDYNo7z0cNUy+bQ
 R4p7QbQ13QYkAdxOejw==
X-Proofpoint-ORIG-GUID: OQijDYfNbpxMbVR-i2QMqxr8lEVm84RB
X-Proofpoint-GUID: OQijDYfNbpxMbVR-i2QMqxr8lEVm84RB
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca722 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xmF1v6_2wodPUg2ca20A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050063

On 11/5/26 1:31 PM, Anup Vishwakarma wrote:
> wcnss_probe() registers the SMD and sysmon subdevices before the iris
> probe and rproc_add(), but the error paths after them only release the
> power domains. A failure there, such as a deferred probe of the iris
> clock or regulators, leaves the SMD subdevice registered with its
> smd-edge node reference held, and leaves the sysmon instance on the
> global sysmon list.
> 
> Unwind in reverse order of registration. The sysmon failure path skips
> qcom_remove_sysmon_subdev(), as wcnss->sysmon is an error pointer there.
> 
> Fixes: 5a856bc63ce9 ("remoteproc: wcnss: Bond SMD edge to remoteproc")
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
