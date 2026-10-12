Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8949B457
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818524; cv=none; b=n1DCe7S9t7uQ+B2DbVR/aO+haJjR0CtRCqxo+dZotR6Q2yGphl74HlO1civiujaOJ4Cya0oTwgXxxC9g1EQkYDJr/SMxa7gL3e5Asq/9wTyKv1iI5lrg7wvau+9NcRZVi0y/NO6M0bDHXURctuBoOAmYVRcG9kZbEsj8XoNszAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818524; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxu//tsb8Nw6YRztPmSDIjtqxX8yKJO8Yfs6IPH5i1UtbnhFZa9T9SUKOERIaHFdAkFe0nGPf6gTSgW8aUnkcvabZb5mAMaiek/7z1CD9bxfDsqQw3WjK1WGwc/pyqJ1q4o2lfD51Sv6L5hsBlSXWUVLU2AcF+16sV51uhaQqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwAFGcaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdA0SGxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwAFGcaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdA0SGxq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0G2p1236406
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ZwAFGcaqM1+iBCaF
	IxVzf3en5XwQtItp9dTo9JO6FXcwWFs3dMXTHgA0ZrPcYzOLl92+hwzlcX8WP2UO
	r3vO6xX2fcpRL3aV5/1K02qX0OzZRlS1vdX0l8VTnXo36EDBPSX/Bc3sU/Q2yuW6
	C8yITBFhAbJSzCQzx+YhqPeWoDYIHeKCT8lW3GmXSR+l9qQUjHDyFcgP0/hvwoRc
	xCTP9l4z4fZnRIndmd/3C4W0h22UynMcpBC2valzU7ir7idjB98yE0n6Y1Sos6e7
	QibqHaIosFMeHm1GWJQGwRUgW8ftUW14rOihZbSwK/rqdfEoz9Biebk0PT2/6fd3
	99n5Yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkp4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338a4075d3so7612581cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818522; x=1792423322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=VdA0SGxqaRDz/BiDU8LqRuThRPP9y5iA4FfxA10fV9LwzcS6VUakt6bAfwf3CYHjT7
         5ssRStBK0h0ipCSjxQiJ9HgOsff5MnmNsOstuPNO/+fC7eAy3EAv13L5czRsOXTbxr6X
         ovL3sRbyYpFyrQVyvl2DgZ7nIHIwRq8OXbQQOwnMjL3ygfW6jVlMw07w96igLTh+25Q2
         FK1YALZYgzzabBSvUw1KkRKC+xmIelfxPEr6QTkfLT9Y41V1jXSwjeh1w9PD0jNHJGQo
         EvDm2thJmFZK50NV62ZuUBpCJtpHpFmfIs49i9+GQOTSdFGAC+SU0J0yQ3Jpj7CSuYGl
         QFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818522; x=1792423322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=cSIHDymh3F707/89rT3anbKlw66sYDa3Duu+Xb8VzKuyJo+fLoe7ErpHJNDnA0rdmN
         h6oVl2sFnI3Mjr0JNpfSYRz3t6Gn6cZwVppUazV7b52+6NTHMvjOrturmWT5TQQTVcNM
         bd3ix7uuwvO92LqZ0kJWdDMQyHN6/uwHZNVh4eWN6+szH4eWqa8tTxi7EW0nBRTBc9Nw
         gfWmZkYDldZWAp5/8biqYm4V39xmYfUthBjN+uKJ+MKMG8JKpeL0Iptdvt4Obbq44PjW
         UakNYeV+3H4yO4lkjf2V6qtF3V3nRoVO9ZyU2XiAM4ZcdJlXs9Hnzp/DCUzn7zpPZjWI
         lJaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxnnZXP8O7Hc29hKy6Ltc/GX5z1Qx/WhoXKafmDV/lcTcLvDTl62IK2wJ2zC4BDROU+S+gUJ7bbxfVk+eF@vger.kernel.org
X-Gm-Message-State: AFq9FYIQo0UPP7F/46LkDnsTJ6fiV2ze7NWAciZACAUh3h0BfX4aU7F4
	ffoajbbDJ1XWJQKGAi8HY9BIs+q8ulFqIFo0xYRzRfuIPCB/GKodoDWzM2GZQ2x55s3YleB79/C
	UDK/4VIhovWKI+9gq0/RiwifzQ3cjdTqmzF5AqrV7fMS27tqmtwjHBFihzEaDGqgeE18I
X-Gm-Gg: AYBFou2prVZMXRX7zI0hB3SQ6ARfufjH6RLLB64UK42b4quGJq4pZ//kEuyj7vqRR62
	UfFltKuVaNFu+Gd7cMHXtDZRsL0aSxNNqQlUqaO8K3Qe4iHcocWDHkhSeQ7KljbcvprMs5wt2PL
	5Jf7M0Qn4/7IMq9QT2z51i7X+CO4hPfIBOyg7QQXALDBi9EJ4x5BzEydFolUm0mREbVdrOzdRaG
	I2hOxPL3gGMEkZmlX0D7zgYdrFXTfV+os9Hu8bdzM34q/pu6pkHsylVMpESaX1ayiA9pYXpYdRB
	XXNBpkRtxKAGiQKQrtEY4coZZDyakl3KocqScXWU790odP5UvLQMOzRXI0SbVjneQrTVB/1auVo
	6mDGuWVUrV0dXGGqZrp/qEQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690354385a.0.1791818521712;
        Mon, 12 Oct 2026 08:22:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690348885a.0.1791818521086;
        Mon, 12 Oct 2026 08:22:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1435990a12.27.2026.10.12.08.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:00 -0700 (PDT)
Message-ID: <0f7023b6-4fc1-48be-aa70-9564c0e1fc7e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:21:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/38] arm: dts: qcom: pm8841: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6WKdb02Ku79y
 KXnrVW245sH1ll69AJjIv/S5nnw/vGVznesa+ByimZV02z3VUabV3UQZlQy/OYmitmNdiRMPO4d
 ZyZXYI2AeBHue3x43ZEobHEwlGxChEwW2dIvVrlA6UZLzJZJwRFzeCsG+AVY4omy5B7/BSsdQEQ
 x3JX5wlSjZXn4Vg5ltOFZzmTQvsio6fZg6oPu1elaq15ZMxWb44Fn03U46y4pMboDXjUoRZnsBp
 YXSNV8d/2w+cHQWmjSPjD1LOV8Ie+CR/3b5mDG5pwtUjNMOLLMrwAKLtV2puPdk1rEWyTsspGwe
 vdhuJG5aTmG++CnZcyDuuqQXEG6p3N+PGjFy2yPRKctSOrvGKs0jwH0sT3TQCdw2r86XMdPxm9l
 J8raJZ5Aa8r30+T+bvETkN1mdJ9hPwH0G/dpG22zjm4z516n5g/JNO0Oteax4YBS3yvQmV+zxBW
 cp4Qm1zBH0REV/S87hQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfb1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: HbPnLgPUAastB7u7ntLhX2lec-Yakfx-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6vVAJ5h4nAql
 bIwZW2fNdQtEdUW1pJowoveCcjoHVFRZTgoxALlIFweho5/vfz/Qh/iG79ig/3NrHDJXmj0n7It
 I+2hUbf+qrePHWqgIyT/Kd7yHi1rNTI=
X-Proofpoint-ORIG-GUID: HbPnLgPUAastB7u7ntLhX2lec-Yakfx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
