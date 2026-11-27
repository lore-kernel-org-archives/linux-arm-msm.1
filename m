Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783115;
	b=mEwCDR94btGzAhc/tLuLNcXPwlkIwb1AKP/MbKOkiZC0hl3UxLlbpitU4SzYgBpdfqY9
	 Qg4qq7R+7WnC+VCJCVrSP7XYjAREidMYuXMrzS8buaeh6G4uge8rwyyM08gUQlqlnRdkc
	 QXTFl0xVNE2i9mFtDTwdOGDhL4HpGP4iM7QoM3BQ1vy+dxth3zALIXSwlyb0S9FSe2VJc
	 3Tg5wlso/bkO2VofMUzMH+jCcJrBOfKOepBttg1tUtTKio38aKQQnm4aIGakIPRJn5Y9s
	 h7Z8x2z7w5aRuakRLOEfpTTytTRDGmpZny/D7PDCEqkfUIERUBMdQPWPot26UH+Ylbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
	b=d9ATyE7Ot0/wLDaa7gVvwIsdMwMsgx3XSEsk66LwCP1ydApj4llG5sRkHrS5JH1jYKa2
	 GxqJQ/GIsoF968+hPLqtswg+PR3Nn8pyhJJQvFb3zzXdpi3hmMc/xz8TkhYGEPhsyDrMT
	 fuzp4ykR5SBDB2EQ9K3AsfDVRx+Sp38/zlutXdaP4Z0jWbZb5mjiZTPCVJBTbBIWVaMuT
	 hDWaZ+0cwLzTs1AAUSJFf1vCSn32USBykhTKARfKyrI1WZDBklPhZC5PLyjsPQ+ARPWxr
	 P14D6X9rz1lfGShcri0MZb5ebhRiPeza5E+pFlODz4njcWOnj5bnDGl63j2tIwFI2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C00606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApPK7273655
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=; b=OsVD7nYemQhekW+f
	MgqDMfW6xtVAqohPNaln/mjk0f598jSdZ3jjOLaW912eROmGX8PQz5nJXPGZey9w
	l5B3qubGjlPmYQrNzOwF1gbwa0casEQjd+DYCODHkpz7FLDqX+DDcrDdtOnUzFxF
	inYM9cv391V7CHSyJxl1nJrmwADZiR6SPcgVXAybDl0MAy5xmObe5I2eOeplFNsd
	m9WM8zkFpJoG8GzwTPd4w5gs84DQPJraEqYP0QiGWnCtIbyhP25NykOV1KlinxsI
	gVGCqMquxW4xtaH8eB7Ky8HP+4w2zOSXjuPlLavcdkkqhM+xv7X8SgzV9GLGnzIn
	+ym14w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49b0fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:38:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so8863191eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783113; x=1796387913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=K7oTcFTgsrOKKNvyzFPX6UYCSKWWB7QEPTfnuYn7drrq9d5q6TNIwZ905xZrumFLD3
         yhANAtknJcKw5/SPwfIoAXJVtUoyasynNDMNXa2bOiO9vFHFcLZYZj6Oh6lZxOVjprpl
         R/DyvJDAn2D2KntHlj/dSjwZ1LYGZjTxcxI6XQQ0KH34Xu0L/LJzBYhqFDmtalqWOd7o
         wFIMYlQqXFiJ/8tZxVUZPeB/Bi6ZBtW1hwK3bTAsIvj8K1CI5GbEVZ4n0FzUsWjURBZK
         lc8VNtOA89TDj9YVWM4Ga0EnB58z9C2xn/ZLb6g1gJU4kfNjnf8jje67siyPoU1MsgfK
         zfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783113; x=1796387913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=K9q4+BxRdoqvolNd0pS+CkOJNnNLioqqapS8yzFRBWfrx9eK+aPYu6aLo1S3Gc4Y6j
         yBuAwkrdx+K/12B4BztZZkcX0J9Jd9X+8m8aPb3W8XoaixKXwdqHpQcn6H6Rm0Zfo2Pm
         huTDHs9rG2X2O2UxJynHDL09oLJqwxFzGpQk+Hoqv1BAD4BWpAMoNYaLRZ6IFvy1QLXz
         ZegZg9EkzedG3RqBHl5o7O0S0O5Y6JFwIpMjKyYY5NhndL3unJ0iZAGMY9wSiOuzCcGy
         GxzrMZoQEVZWzgkPM3hSN73e0+HTDqeRyHlQqFYLMcunzv14AqgWpk3wFUyrpKofmPJv
         xpZg==
X-Forwarded-Encrypted: i=1; AL+hErGN1yykEvz25OabIAL0ajzLHTNI+5YVZc2znHsONXSkGM3glMozosuixg6JKrlmwH+H5QWch0/cZaF0mjXl@vger.kernel.org
X-Gm-Message-State: APuU4Z9vV/u9z50AQVH0+TBMu/hfst2f5PF9nXXPM0q5aFPAFRnIK0ru
	Fjf4LDaTBtliMMYVsZe01rb/WqLGjhSpGxbt9iNUVSWHw5giORjXBn4MT3uYc33l49Ok9ZarPog
	AHgyoMGyYq4GSdwh3DIPF93fJmQWIjWLh4UAXZBQq0dO8V/KVU8MJAkqXnYA9FBO/PM9Q
X-Gm-Gg: AZFdTZfQadYHTiSyhv5Ra2GT1wakxkM0+NXKUDfYhfEkc1aRGYqvtTA4JRteNPEsTnm
	moWmgbM7X2suZdHET4ffYu/q7zD8zf2sn33yhhmTVAZWfjvvVkjc81RVfdKv940wUOmS3Ea9fxS
	HlctA9vfSW1JxabvkQ2PFCZyBISZs8whilrT7AfMcq/Bl0/lVMJY4PIPTjqXkdcqC7iqcb1todC
	ZMa7QqNvyo/18m375m2deMi8687MZhTCNK/fwXAGQghLeWNLHzhqBM1I1KbIrHunoNnygsZ8U3t
	c/kSXGL6V9OV9jiOxvXCcqPHxi3qmmGQaYWUckx/NMxJWPpNGdIlibLx58icdoQ1vp83OKcixv/
	iiAfZTgBwgEQqW3SoINwRYG98dFfvHwaUSe8QuwZt+ForpGlGOdeWQA5JkGapX5vZd+GZ5YlKl0
	Bh1CpP
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901032eec.10.1795783112963;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901006eec.10.1795783112393;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm88060568eec.10.2026.11.27.04.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:38:31 -0800 (PST)
Message-ID: <ffdfe000-fff5-4498-a4d9-1de2e0f23707@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:08:25 +0530
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
Subject: Re: [PATCH] Revert "media: iris: reject open() when the session limit
 is reached"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fC4yKTbPMTQ5jYXoHwOnNtMyzRSou_Wu
X-Proofpoint-ORIG-GUID: fC4yKTbPMTQ5jYXoHwOnNtMyzRSou_Wu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfXzmG2a2mwbIyt
 laaT/qh1Axes0lAJxym2Vumw6/bpkCrFdvHSxJXnHz+IVm1xtdfKu+54aEDbiA4doNGfcehviPr
 LgPZNCP68EA9d4xiqAi0Qgyfr7dhQRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfXwqxNkQHKx58I
 FbCE2z/i6CRLZ0FCu4zEGviT3FBnB6ozxi7X5BMg1El2HCp/NcmC+HYd1FMXe23yLy2m3ukszhI
 3C8KqAyc6364c+bfb1r6l7upC+q+r9ieVSMIcbilmNXs5TRQNxydEnYkrOvAGIy7lEiY16xjpVB
 DxUJ4jhOh1cS+lb7Ym5L+lVCI2ZZgHzxMQCxpCGxPSFX5wKtzKB/lJLu+kYmOJN+K5ywAL/XLCu
 IHjGb9s9KGQyZkuraOT20SUAXGXi4ot+1FfgtbwG1iHFaADoQDzUuDEGQmYd+Fhwofk8O8dVpC6
 OugdPP+ZyRh89IZr54EiIvsUZ0bJjqkFqsbVqvt8+YpA2hxqjtAes1yqMezH2P2ZVA6SUMaQIf+
 IP28eIcu1VSaH2bPikYf6+ijLDyGJ+pbVxASf5FHNB++EZckTfR6TKFmopvg5HaAj8J3UzOKZ1G
 GXm+TEaHZWi/Qg3jeBg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0979c9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7GKYziPKAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GeMy74hU6CVubCBKRZ8A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050



On 10/31/2026 1:45 AM, Vishnu Reddy wrote:
> This reverts commit 397ebadcbc21 ("media: iris: reject open() when the
> session limit is reached").
> 
> V4L2 does not allow drivers to impose artificial limits on open().
> Resource limits must be enforced where the resource is actually
> consumed. v4l2-compliance verifies this through testUnlimitedOpens()
> and now fails with:
> 
>    fail: v4l2-compliance.cpp(773): !ok
>          test for unlimited opens: FAIL
> 
> Link:https://github.com/gjasny/v4l-utils/blob/master/utils/v4l2-compliance/ 
> v4l2-compliance.cpp#L747
> 
> The session limit is already enforced at the right place. An instance
> that did not fit within max_session_count is not added to
> core->instances, and iris_check_session_supported() rejects it with an
> error from iris_vb2_queue_setup() and from iris_vb2_start_streaming(),
> which is when a firmware session is really needed. Failing open() adds
> nothing over that and breaks the compliance requirement.
> 
> Fixes: 397ebadcbc21 ("media: iris: reject open() when the session limit is reached")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
