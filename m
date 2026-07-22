Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C835AC2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729900; cv=none; b=RoAbkLIarozYoC0jY3rdxyGfWGHLNHeEiNZInVS8emEiKGFdGnsMawOUm5C98sa7w7S1IbhNzERZRVizwKoR9Eo8NoXefV0Nw7ftSj0m831CTdHjH8+oYTdNY6bfXDxvL8wOl6zs3Ihs3H8dRsb7bUMsjeDFJs76meTOjlvWEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729900; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhyU3KvHWNgj6yx82HL6MThZ57VzzFuP/fQ+aHPWLmHCCy7JO/AZmr2yeZXOU/JYV1H/S6dI0g/hO3DrJ429d6ZeywENhfo8PemZNh+nWXjyy0d9EABW1/7/YA5z0+6XDy94vO+RHjpmx8Eh+28pDwAFBpIw3c9IfJksxmS+MN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iav+R81U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdiuM/5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iav+R81U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdiuM/5m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRRl891398
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=iav+R81UnCP1OYhZ
	mxqeVxDuvefba52ZHzCQhbYd5Ju/zboK8KLJc8JYitIzTREvm5nAb9BYHTaue8on
	bxfEXkKXSc2VGnMZ39Z+JAfw8DCj1ps50oPg0sw9hj39fV1zw4YXipdey4QZPdk/
	vKcQUTabLsb2LVWcGuT67BqyL9+yt6hmodTMPxa6To6TMnaSUmZTJ523nlHGzHSM
	5Q+ya3TIeMDpflC6iELf9psSSqrNnjEC47eQZLLHxgsxqvJSavHUZrCcOLIYjFYQ
	8cGzQf5Zlw5hd+bE7lK0+/GcBg/Y9nORrfKDcuSjRkScLxU31qQO24m24kcIpsbu
	poD/aQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm1093p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2980795a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729896; x=1785334696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=DdiuM/5mOJ445FZT/megVWJcqSDBxtYaMYei/7h69m86PtHLEhoC9jRtHm77RRmxsh
         ZFtp7efeBfdOJR5L78+pIpb3puC97qtPsfQonN+VWI0VCTy9Ueoyrel6DG+JVOLKqQ9i
         Gjk+kktjJfhJFLrEeWnDhFx5exhKRfL/TTIopbkxVI7nK0/gFI65Ik9h987ik+I/JQ57
         osYT049Pmpq99VAS4eAlMWSLF30wjulxJKZq0OzFn4IVdVlc1i0s91cHiqqlHZhhV9sY
         rwScn3Ur/9FU9cPK2peKbxm3IMk724acAZoC6zRtJFonDfx0WkAW53sBU/3biIov6JKB
         mf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729896; x=1785334696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=CpmVNVMwxcrnpKA2kQrqyTGIwTTKhILGy77hZWwRmbz/ss6QJmdyPD/dm2XY2XVUHO
         Ft5Zpo2BgF/PY0G8BITPSBASMqhOUjcohrHl4mqlAaRD8GZcjNwpArMojuvMvw/JPOw7
         3b6HVa4ury9v53YTD47hraNk5ag0swhgYLKAk47MYaX0hdHL16CLjjfA+JnoVcvaJSQ1
         cI97OHY7xsEP1Gr3UpgxCRQf8Ox6/E4zhXga+fWCsAFlC9pxgWoX9UtqOL4rDmqCe20q
         mcbmowNlIvmlRShqCBhIyhy+54Zo92KR4mWpvSfDqpMNUv9OfFd/ukjYLF+z6vQ4s408
         GpXw==
X-Forwarded-Encrypted: i=1; AHgh+RqYhR7ie1zO5EnUpkrsefrQh+YrJHNM0UPy9uq2SFAdqXWoK1ZdX/EWgg5gd251yaWx+BrC3cQ2+k9987jB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BRMPTFYU6hJyNKTH3Hd6KZH4zUZGgj5CVNa80wXNvWES/hGA
	xz2133rC00ODJ5YXXKIY6EedgpQJ0xYCw3i4mN8GyI333DdPKGS2lc6Ynb9l4OQ3epMplPxfpJ0
	1NE1olAAOT2XA2ZkLtCXHYLswgJmCCdRXf3zKnmxTPGmB0EGsmYTigU+4NfiThDS7I21r
X-Gm-Gg: AR+sD138UDeJNllp1oqjRD5oUfTcIP+MQ9Ir2aTdDZ0vc+hDZGJeEZ6srIWnxfG0DOb
	YapD38px39f8NAdsKUW7wu1GyNejgzEeDWz/IK0x42Z5795U6J63qSkfMBXQpp+lQmulG0e9dYD
	GLJC06zgydWzYt2CgOf5cBDrA9ZxGxkI4fZduCfsDhMC6Vr9FbHh2+TJYDl6KFN7Va6X6wP1btx
	zHT5T3wYTbJV7DUGJhTjY7baWrQFqt4YpIZsPx+F0HeYI8fWEyEGcP8wLCsqjvIwPze8xgSbmUG
	bASNr/0i265XxG/9a+xmQObWWtT9HtKZM5vWhd+hhphVRLqt2Tf8kKlem/dQM6o8Y0JnGI1+hdU
	CNxKfEQ+Rr6mt+erf3g==
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477526637.24.1784729896132;
        Wed, 22 Jul 2026 07:18:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477491637.24.1784729895667;
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm9953369eec.7.2026.07.22.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
Date: Wed, 22 Jul 2026 19:48:10 +0530
Message-Id: <20260722141812.596004-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com> <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX33SDPh90ESV1
 qkPCQ+ji3DPC3SjJ9j7qrgihZcZwDp7wTWD8ulAajQz267bztzWJWQsZFwWnDeFJbnjY8h+SsT2
 BClwwfxPsZxbqt9whtdUSsD605Bu0TM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX9JgmCacC7V70
 +epr2tamExG4ZGm2MvzEifjf+REGsPQVWGozX5DJdU3s7mdZ06H/m60aHtvwRWdO8OikQZumwny
 liWPIcg18sSvMZDKJlThVK7fcp7Ua7e0Juv7yYR0HwrWITZ6k/bUxEpAo6EEW6hojOOEkFX24/N
 xHPiCFEJ+r8d2N2qokvJ/ea95XgGI3TP+8dJ18oBPhlZ8V1HR/S+NwcmBLtjCNV66JHHnJhJDor
 8t9u9qV3eUnBnTv3CCA+trubhnxe6HRPQ58vflRr2V/2eAgD6XJoh32zqR1OUsqTOlm04LOHxMG
 VA7PRqH4K5Y/ddSNAMetRy4f8AfC12v4DmTOz0fkCzLY5ppgv87bswUazG9elKC9XZL7VpjzLnT
 TtVE/XI7Ps+baaOzSjJEs+dfYnGOpwRrjaxlT5fJbDn3V0w9vQufvMP6o0Kcki3CULuvG6frkKX
 saEWGBu/dIWbx8QS3zg==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60d129 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: iXJKHuyvK_UN9DNs9W80xaH_RjqFXOUb
X-Proofpoint-ORIG-GUID: iXJKHuyvK_UN9DNs9W80xaH_RjqFXOUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:00:25AM +0200, Krzysztof Kozlowski wrote:
> I do not understand why a clock controller is part of sound. This makes
> little sense and desription does not help me.

Ack, will update in next revision.

> Drop last syntax, explain the hardware, not duplicate schema as text.

Ack, will update in next revision.

> Drop description, redundant. Why would not device MMIO address range
> cover full block?

Ack, will update in next revision.

> Drop description. Not even accurate. Consumers reference it however they
> wish and it is not any business of the provider.

Ack, will update in next revision.

> And this...  [unevaluatedProperties: false]

Ack, will update in next revision.

> Node names should be generic.

Ack, will update in next revision.

Thanks,
Sarath
