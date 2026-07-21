Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF130367291
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647187; cv=none; b=P1M3O4rGPqtbcXDullvEXptVHOkDoCcliZno4EcVvw8nyJGBE0TC5rRgw1CXjUtdWqsnzmlCs0bnFscZVjuz1vNF/RfP4AfjJuPvIRmbiBM/MJi7hvFNfw7o75jWWDgZtOzbQttM2UnzVvH7Ghn8GFaqpFvjaDyhh3KI/yQndPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647187; c=relaxed/simple;
	bh=R8sR4cqsPipci1y67lqmSetpbPF71MsFIqVHTQu8qYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNnHSx988Pzm9nbhW7E8aMEV+sgmgbvVrBKaGvZ6CblN6gKJDqkU7lBdt5J8jPFnyP2vk/jotAwhWIOvrZoArU2dWJlp81QbZJI144wqNnqZSlkhQ1Dila+PIZIWJddYxdW8XRMaF8u8X4rMrHJFVu62Yj2C4M+uENnXfFgovxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEPo/tUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0vkp29I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEPo/tUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0vkp29I"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg06i2962649
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=; b=cEPo/tUbvol8NMA+
	CZkSAHloVdMHHr5+U2G+q722fHaDvdc4HKqrvQ4qwn1LG5b1o4Z9TmLNWjzTm6ST
	1c6DgOl5JYndkk72KvmXPunEmrKqA9CjCq6d0mUfXKj1d90YBaxPzE83Jv6AXMLM
	eYy1j+lUhdFTCtHRoyLSonfXRyEoI8LjuoZylTqfzTEboxKBWnBrB/E3LdC/R4nO
	1CSk9598XVIM6Z8vAQsVuEN72RU+Agui/hPDmEPdDj5Wf+xjEW3a3K416mDsexmq
	aQD81ZcFw6diUNwz/YuTCNi9yLSZVLT6wAeBES9Kncn95WqLtl4j+ryPM6YYUVq+
	oZ28nw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nssgqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:19:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so21931491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647184; x=1785251984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=;
        b=a0vkp29I1EWFhtAOghLTMwbS4woz4y5rCOr3ySimRlXhHs8f3LnhMHHKsSr6v75yD6
         4/NT9J5DMS7kcly1vcObgEGgFbJzkB6cX71f7FmNs1koPH6IDg94AhSsjTUl0f3UPgNo
         fsWGY3iNm1VgRyR0R/8QYPw1BVhlOhObcJ/Xa7WAfItJ+xrP1O7QsYbsXjJUfU8shWJP
         37XVwlgm1n+DqtfJOMitFlNQi8ijjCCwfFLMImh86GIIpoNcD03fGZJ/v6RqCChAw+V4
         JifI5AceOK8LXT03vEClk1azRb/VTRvccIgblzOWKTaOw/OY0xjAtt4px/8lCTflecqY
         BjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647184; x=1785251984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=;
        b=KEwhx+PnkV98XKjOqUmbkApWkK0kKAZN6SLsTZVX9gEw8YvRo3BdJT7oYXJPNm9QUH
         8mfrWPjCPJIxDFJ73DxGvA9iom7yt2pvMN32EwJmqSmn55N0x/r2fmzIT92AAKWKz53D
         HiIrG5ZreSRmgB+01ICfBiH5k3PuDl73EITv8DcDOE7/kC1OaGCvC7GLnxmj2dq9QwSE
         eDQEKod8e131dkEIY3qfsKv7tzK0JvHqRKAZFMY1qYsE6zQKA2ikAkHh7ZlbdHv8vWJq
         elONigGWEus9L3posG/zyZd1y4EpsSFZb34MH3WGICFrSkNsZ757+wy/bADGMb0YL943
         Q74A==
X-Gm-Message-State: AOJu0YwXP7W7QdBE2No+TY0cWRjGjkCZuJiMWEL2+Ny8WgeQAqBQtQ2Y
	pjmI3iB0aX+4nH1UeJfZrjvbdiAeBjYMRjGiJIe21HBzWJRHxtN/ln0Xi1uGwkDHFJizALT/ouy
	YzZi60m8qgbj5lEcGF5IrxtTBvHUck5O3TkHxpOohZB5jf4u8jR4OQtDA9Qnm0+SO9FYT
X-Gm-Gg: AfdE7cmJIwChGBNvViQ2hF8MqpztKSpDbvUkKvJFARMPEvUiFX5kWOnisMeeIzoLUr3
	TACbPhO3wbYIl7N/65PX0+DFvy/e4hHJBU6FnHWsRFHp9O9tDnpWAIVtVaqfMdzabYwYVC/WWgE
	BkoeEnUnzEMPeoWY8aH+BZvulsU05kCC/tahvzFIgGe+ZC+xDV6wfwOxszUcX88Zms+AePD4OLZ
	LY6bsV7U5BLVQZc3xmt0es8NcEj5EaHIXi/AQa99kuRfsKOsvK1z9eOw7prCT/HuoWolhLzaJxC
	vLo70BhdaNloHaAKeDtMWWS7a9r1KRQ8y3GSJ0hAdb4Dy+Fizq0GOiA8q4mKYlinU4EXuyGpSDR
	8i1fp+5u2PHRpSo6/xxVPGjSd
X-Received: by 2002:ac8:5d8b:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-526750fa557mr26892921cf.10.1784647184055;
        Tue, 21 Jul 2026 08:19:44 -0700 (PDT)
X-Received: by 2002:ac8:5d8b:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-526750fa557mr26892621cf.10.1784647183431;
        Tue, 21 Jul 2026 08:19:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm587290966b.63.2026.07.21.08.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:19:42 -0700 (PDT)
Message-ID: <180c27a4-5058-4072-ad23-709ad6d6ea0d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260720-interconnect-qcom-clean-arm64-v3-1-942e8ee7ebda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-1-942e8ee7ebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uVq5KBb57KIEURtyWeOGwLL9PiEvbdJf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX0RucWCjOzdZv
 DNERhgnhYpyGtLelRivAZp7xbhWj+47ZGY1Iaw2LzlOrAKY8j4nph9epS+ivDEO1r6p8Oji+mE6
 p6OqTj4bHE72MnPWoHLlwn49PqmXA70=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f8e11 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=N0nv3qFBaOOCOp0HD7oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: uVq5KBb57KIEURtyWeOGwLL9PiEvbdJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX7ULntWZtIIll
 lgH54ctUDzPBzdCFX1CD+CbgtAhJdTMbvk0lvX9Ox6fT7BGpvpjIW8A3TkIT0c6rhX8gUmer9Ys
 O0HpYuFXrJg2eDXu4zMzGrqb3RR7hbeX3Cqc7kkPpWoan1CQx6vMZ6wDL/V+4aJRRGlDLSDQm5G
 FlxnBl9TIM5Ln7Z+tzuXELqa/gEd+AAOhbYJW6U4cK+ccXY/ItqY6KDigw+d/1NqgOcA3d0wB0u
 n2dKIjfh2ALcnTY4CctEGxTnqv2qpoN0hVP9NDJLBJ2fiBetYHjwEMJltGcLtHwVYIcFwLc6mZO
 1muuXtbM/6vyc8cB7ma1ovhmbXw7I54Qx84cvPj3J+L+IAzKKJRe1DTlivF462ENyz9jvlFl3gS
 hN1pOPW2UFvH6XAnfsBgkaHjSbIUkpl4S6EyINiM34CWrBXthEHYO+ZMZP6wJHWa8eFQXAsBtVi
 MQq/rfDKlgYYZPfvljA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162

On 7/20/26 9:03 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
