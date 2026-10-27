Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116751;
	b=MDup4fz6ErlwS9d5cmV2zWZxa46qn/FYwwwgf+5f5m1beouwl6q5EDItGNjOg60ciupd
	 PZ1e+2KJLDeuUAtmbJolQ7Pdq3EiSOzebWPM/F9e3go//s2GaSXDasjurOgAp/bMHDDsq
	 QzvooBaRyBI8VxuzNUJURPzrw46yDYq7w5wR61bEr6Cu6/KM5krUpoEUovMQAbVx9qLKl
	 6Y7LbM4kEekTdWGsiyFV24mNolbT1md3jjRNR5E5jEeGtCz9TGbZs07HFT31FPR8DXe4B
	 rDTFhpovqA2pe+WNj82SOH2/aPkvcKoUzEmHutSLlLaH548t+cvJabTHoOXTUNiyMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
	b=LXw8gEqcXMOfx8R9tgkO8pbavDLblF1lNoXlZCnNfwneixesiypy1NHwzwORcYPlLmIo
	 wl+iZTIKGtEc4jL3+Rh9IUvWi9mA0ffYlAxTTQbgRUSiNmwI0igmawuVxXl9IMy+ii0eg
	 54aHXS9WA4xZqPUJ4DM/Z57xEsEP93fmZRQsvaXJOT8TruUoNps14l1DVhN3KME5LffGE
	 QhXQje6PNQcK2kWdD4o5tYEZI0l2FH610s130QB0xEmVdjdBqG0R9QG6424Dr15wKb5rc
	 enXKftcKHGUgfLN7K8z7iqsfgTi7dRh1zwmxHHYOgX5S/DdzfMQkMVMa/2wYafLOI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23120606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23120606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKsXA1521202
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=; b=I4phRJnzrUKYK7Br
	ACWx3OOv3j4NjeHcrYd6Xi6dk33MBsrOIp0fJlH/lEz1JMsJ2XXmV+omiIQjxpcq
	8oTNs7g0NG5bPoEQfOUwDUrBmAqZBbrLX+9N9UVK7IAxd7MpuKfy7xIbw9pgbw2G
	XtWbmpc++GA5r9ExITJBbVU8C4EdTRCxX/yxEof8+5bDfEpKfDLaU6ZM9T9VxrMB
	IC4DuXNZCpyd/4LQ+o3i5v4iS7wjk0gLWo1HHEkJDq1UW1yNkedYyn89C3jgEQnX
	KL8MtAYw7rW9G5V6R5kIsnUWCQqTwq8Abh8XtFima3Zg9QQ9yuROAvyYMYrqyzHc
	kzzJXA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98xe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso83583137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116749; x=1793721549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=RYBFzOY2femEOpAp/VinqOCHifwaLHqsGb/uVhBOAt4F0SGP6MRbCZaejX3XMvO76O
         ObHqoywn2wAsC89gvb4uMbRrAH1ThcPeX3/TvINmAWP1ugOln0KAE7CJU9VbmqEIDT71
         oVzfGFTYJZkAs+APukcSUFRM1L1ecME2Ppi1IoF2eNm3MAT210cufuJcyvwFreuAP2Q7
         cMiLBEo6kJPv63s7K4FqjGbHvlYzWtvl/SUPwVdE7/dOt8lK8Yz+g4N7JrNmpqJOyBWx
         TNpVLXjeDAFrrnamUy6GIF924ftx6ClEugDYU8asNwdALMnmjskfhM4lpwqHgXxId24c
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116749; x=1793721549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=1tZ12qfz9mHWGRjlax386g3ypAkYyZqhnF7ard7P/7cG9Rq86t5pI3t0zKbY8SziQp
         JA7W8isBQuZ/44xBFMLP7gD9SJcI3xQkrJStw5GoQoCTcMscQ0+JYuB9Fz33P+4EEiHl
         606KnGWlfuAdNbAlUgKiMKOp9lQ8W6Q5p+ubkBNHXIGj4IvhCY9vY4wMLKf3eBztIrL6
         cNyh/AQXXvit+mpkZI6geXQ2Ujmn99MRQOvXSZFzC+fpL7KIUveV0am8CuRUBJ647e3r
         uLssuOzOqHR8q6LHmSBgOP3IBNqXH960ZxtJuckUbyQ3AOp6KDmNH98eoxcHz8bZDsmZ
         On3g==
X-Gm-Message-State: AFq9FYKIeGSCLrvN0C5uW7o+wGyUOWG2TlcCZKp34GtWUN6kbNgLw6ra
	Zxe55gaxwwHsvYYNfKOAmzNxGzRzfTCt/9DD7nLC3e1fJItZe7YVtcumXUBKT5N9+Vr+tOIr6n2
	LYQY0o+ItxjHjMEWDatQRH4eRy4ySZQyslGbAUMEmwTqCfMAyTMI33xNby3FyfZtbleTU
X-Gm-Gg: AYBFou3I3MxJ11zB0TcA41RfWCDNVIz9Dh7isa7rPASU1twtMStHyNRTSttR8Xkv8A8
	5FXYyqoa+BDJDtZ9ZsxWW6HuKtq40vuxUJyiRIplmCw4s69rpA3bbSgiQuMTuRvptZSzW2KwJCH
	8XxMey1mNZa5yM3TAJt5/SH2fLOAW/bglzQVsRktky9TYZ/1XyJbBlwNDzNXBh6FftUxdbTUgmP
	TvOhPcBJ5eEIqyA4EdWKUwzyRZ9k210tOnVL6ydZFo7u4655hqZWw6c4fUR2xXfZRpZg88FVTPK
	rLMgIZzn09QX4BLu90DAwjOZ0ymwJtx0NYXV6DHRm/9MK4143PsTTPHWQy1+rU9JBne8rvUTB8p
	LW3Jvek4IvGquFMWKknbZ4g==
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653038137.3.1793116749447;
        Tue, 27 Oct 2026 08:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653024137.3.1793116748950;
        Tue, 27 Oct 2026 08:59:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:07 -0700 (PDT)
Message-ID: <f6018fd7-8ae1-46cc-94a1-cca06ae318f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:03 +0100
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
Subject: Re: [PATCH v2 2/3] media: qcom: Use PAS API for video memory
 protection
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
 <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0ca4e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ws2DSkxJg1jgmxyaqeMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: huet5xTCMClvLWMowRikkYjBWMJ9K3tQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX+TpFK2T8Lyv/
 Ted+ZKTqVK0eWDlto0cc7Der+ZDsRv5ejQwct7go21SsidlovYVlNt2uVBmygM+HJgMmx3fKst1
 VP1dz1BYhSAtA72dIKoRab/Zl6iEUuuwEgjhvkMdHVM0V4kbN+iB6/uJxCdueNxHZQLT/gTAZ0a
 V63KksFTkNzPcEQcY634EtoBmp33/SknkBlIBUWFAIAzSeSYmEAscOlXcj+RoYmGCzUhV3p5ggN
 FXmw4Q0BCUaJgFl+6kyUPWcjv7xj3X2XQ96ZVgsqzu+uqjoYVgLfYXIIQqtHdnyw85Jw1v7czbe
 NcGeqXxPTdq6zLmGjc+0xtlzAKQPbFrij0rVNHszwY2LbG6+3Of3L+QWBW9kCXX5L5JdrlT+vUL
 LePrMIp+85EJCKjqDJ6Vj3pnR4EmJgO26BSUtcq8uyqcTg3eMhR4qc2k/YwJCvQ/JgpW/ffzhnM
 77R7asUyPK1SO6ZTcjQ==
X-Proofpoint-GUID: huet5xTCMClvLWMowRikkYjBWMJ9K3tQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX2TLpW5qBBeoP
 pg1giUpfWOVSmtPPDf8RKXrshX/23K0Gf8SGXe82unHFq8kkkmPHJu0YcJJQAdvXN6pTMQkhAC9
 eBPS+0ZmLkrZHIAaGVWhxiKJA2nY/7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Replace the direct qcom_scm_mem_protect_video_var() calls in venus and
> iris with qcom_pas_mem_protect_video_var(), so that the call is only
> issued when the active PAS backend needs it. This allows the video
> codecs to bring up firmware with the OP-TEE PAS backend as well, with
> no functional change for the SCM backend.
> 
> As the video drivers no longer call into SCM directly, also drop their
> Kconfig selection of QCOM_SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
