Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579235;
	b=sH9IOWGaeUjgkp1sn95ELLg0oWko9VSXDKz7zdEMReXAehRv7+zvpU9lQhRjLnLvMFSO
	 jDJYq5Z275DlwPBs6m6WmSnMwQ+wl4SL1YW7U4LdKm5kRhSH7lBw/yMFaozyUugze7EEH
	 PMtKKUg/WfWrh0m2uMW5hrqUROXSCwkImya6U+xy+vebv5m6rKgliAO70yjm3yf+GeM3G
	 vFi5Xl0UT4EoHk4ofjsusg/Dez4hZzcx4CsQiLF10vymMYfNC6Two25gfIxPNaCEHLoCu
	 sOnEKBDCfNTzXjQkfTmTDUFyIsogblTPpmtGrcj3iikPaOSjRVPL0qEoeq+NxeTwfaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
	b=e8zoksLl6qdbaRmNpNaeb1O3afCSo2jwT6WVuux1mh3MhGyf5xukFjIHtz15n3xOF+2U
	 AIx4056XLFpqGBRKbMooAxRRLVWRi2b0L5Xx50wXiUjpJFnYQ96bMRcd9coILjA0i4eNT
	 32caCzr/9QNh6t1AeHP114bIuRRvo/b0dCx1oF6cNzIQYIGXce06TCnnL0qqfgkaff9qc
	 OsXjJdiwUnDE3J5dMG8JjagqnfM9oeOfaqKpGxouOjkupE+kT9CNV4FzhICf3T8HCQ8KN
	 tysZvtMIvY0PbFCyj1qLcRWd4GitQIGroQn4ldlIRDRmUqmYqcMVMAUJtp1ka0+Yf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1da2Uq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhVo1uNU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F530606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F530606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1da2Uq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhVo1uNU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJX9l1422156
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=; b=BE1da2UqOx1uy7es
	X2wfqDUEfsXMOZm6cNjYguPfMSk1Cvc7jvPEm7r5UCn9SFD+07zMh2zXOkMksZIT
	JTUBr3xX47T4zQ1Q3kXpvKGb4iz/i3Od8W/xRQBLxIKpM+4ENQhF/WowvLO+WB9a
	U+oFCYYaQ4HsM4rvdRP+wina0FtNf8ST7t1Y46WGQdpAvnhIl5wWUUB2OAdOO2Bg
	oYqFXJwl75HTdEHRPMFYC3lMRdtf8I9XlWxvllqlOg3p2LdVPgRaoDanUKb/I4eI
	QpTC95Nkq8aqg5Lk2fFUFhJeTha4ZwbbpvZXWFk6iyzx1GMefV3KQbWgxu0wc9d0
	Ct2DKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug27c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:40:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so1760121cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579234; x=1793184034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
        b=QhVo1uNUfp/KvdqJexLKXP++Mne5887CFBbvAln7modiMjTPWhB33nzJz+lA6yxLqB
         VSEnTzdhgDZoUCNgptpAX+TjfxhKrD/6RgkcGMk6l9kRifgwo3+eUSykEN6xLJrrhbvk
         rFxnQjSATrdbfPOzsz7Cqn6gkYrdVAyIr8vl0MES8g9cVK+xA4id5rC+TXjiqzRmkoCQ
         iCMlkP1jAktfe8avJTmL5AmmXs9C2DQjReCmDSndRbRKeIaOAQR/KfHKULcTAqn8/TBj
         4Q59AU+i6+uID+5WR23ViO0oqTBxBkoA4jq9T+p3m2lo1ssZuXmQ0jvajj+wNbyxppAh
         aG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579234; x=1793184034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
        b=EUfWsl6P8pYcKpA5GWiAMqLNICiNzSO2YYvKnq1gCsRKEGhz8TwRDy9CQ0X5Au2b8E
         TMz5YgtfkRyu1PDMp0ImjiUi+Jpr7uxYs8A+1DuYvyA7uLyKYCxlZtQMkyXSI1fOit56
         FMZ1gF8CTCbzQBco75J3igEoOl9vFCfkKib8nka9UIJffzT4ilSd+1rBD0ICBTv75AKa
         ZFfJJNMltNpPw5Q6NsbPOtGc8qSyPPrxcJYldBDjru9NeFDrUgueSK2QpJAECcksh3Cb
         qc3B8gELfhAXetX6cK6Z4nmnSAfWASdfijRQGWGZh35lde8LKdWlnTOEhhOpwSeHflsZ
         s0jA==
X-Forwarded-Encrypted: i=1; AKwUvBwOc71MoI/tg6Nb2PKNnL5UmlD0RQS7ppPvK1gjigmdsiPdieIt5ETVuAJjIIhcLPMHmnhDVJlgE0tD2NiG@vger.kernel.org
X-Gm-Message-State: AFq9FYLlSShQBPidvU2bvCYRG0SLkVoOMv0K/3/Vsn8ERlAyt57zRXzZ
	drNU4ew/D/NP0Il1ieZ3GY/lqXm8iko1ZJjct37gPgrotZopporc8s8RLjwYTSbB/666zsAWnl9
	4TrjGeJDZbxhZhA6bLuWCp8I1rnX0h7u5lQbhbeypkNLFBUG5u82QjEcJbYB2kFmP/hws
X-Gm-Gg: AYBFou3Af8CkoCZ+flZ9dY0/4R+ayQaOGKEcDsgdbKrZ1D9Ea9RGcM9RgBjbAEhkyyl
	mD2OYslbYK+Tiz2bjg0YMBPpGv1qLkoFZisRz+qjcItrHMcr5udlquOrwU9Rr0v9DQJpF0thxRX
	pMHRQ4csrowP6KrUeV5c7veHbK/X/fYh7BTnPgsPcIocld5bn1Ns+RWiI3F/kK5HcQBXVQfOB76
	rZFlJFl4ZlC3V1d7FVeN4p7Mh0+BKqjIn/+k71WYRZ671ExAaVUJn9e624JwD7q+E3ehugAhKiB
	VBm1xjeGxXbE9AVCub44K59ClYGq+mbZb3GOp0SFnW8MhWezRq5KF/QJ3DD4Mg0JMvq7wMiLlZz
	BljYnUoomGvKgzL9AMuQrmA==
X-Received: by 2002:a05:622a:352:b0:535:fd16:4393 with SMTP id d75a77b69052e-5369b900b2emr27770851cf.5.1792579233640;
        Wed, 21 Oct 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:622a:352:b0:535:fd16:4393 with SMTP id d75a77b69052e-5369b900b2emr27770511cf.5.1792579233105;
        Wed, 21 Oct 2026 03:40:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd5edbsm62672566b.56.2026.10.21.03.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:40:32 -0700 (PDT)
Message-ID: <7e16a0f2-4372-4e8c-b0b2-e906eb5947f0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:40:30 +0200
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
Subject: Re: [PATCH v3 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad896a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=onP3my_JgYVhs9eJtSYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX6J2jywz4Zurw
 7cRX7AKVfNdmq8qaR391arAVzS01KoiEGyJ3XIn22b4kkqCQLj4NUou+CvdktqDQS98ph/1e9jo
 RgfOd8U6Jjp449CHgoxlifutB5Xr0S4=
X-Proofpoint-GUID: P2OvJWQ5PUx-dAdVmOg6zZcNmTjTp7iQ
X-Proofpoint-ORIG-GUID: P2OvJWQ5PUx-dAdVmOg6zZcNmTjTp7iQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4iOFgahosxj1
 DA8KixffphiBTPmx467fbC8sf4nskyilUTwXTLW4K28Ul2ZcaIcFdzq4G3JObDVW4UMHEaWXwbf
 imb76oDltigwJyn6iMs8lJem+qoAJte61LEsdSpWtuj+g71D5z//uTNll0DkeHfPudeTXlXGhqb
 gaXVjsSj/EvWboAEF0JWvTGlLuGjYHJNAgnqXiyyRRbxcSRRPyQHZKFR505L8f7vdJGtv+awQKa
 Br16ziiRfdKHwlNW92n0loIeujTkmOt2dQ4hpxhbc5SP3+eGHTLQD9bbfeDzycLOtej9Vbxl3Eg
 BYs+PqV+69YE2tBJYUv+lgoUNy1JB20Vg7h404cJJEbP+a+i/mqsRIVtsrAIuTeGSKVVYFIcqmT
 WLSrhRE+wPBi+bZU9fcwOqbYrVZH3TtQ4mE2o4NtyhVmZTi2zf6eAfk1QeFxtRXtLOh7/fRY1Ta
 LKrSUzVpNVPT8m2H1uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
> underflow bits together with NACK_ERR, and all of them were
> handled the same way: report -EIO and halt the queue. There was no
> way to tell a NACK apart from a FIFO overflow/underflow in the logs.
> 
> Decode the individual overflow/underflow bits for each queue and
> report them with dev_warn_ratelimited() as such errors are not
> expected in normal operation.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
