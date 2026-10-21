Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572529;
	b=2kTfNMl09eDfWd4npAJWoMx8gbjlUMDyCEV/naEUJ23wd3DfbwA2UoHCiZ06Gg0muWLs
	 lrlP0KgToP7g8n4xtfmEmPVt1PerHOkeklEvuPL6GZ4oXXnktRSroc+7X/QA4osKVuOcg
	 cRygUAMA9qqxVcYt+Gsihg+6w8AN7URUqbW52hMQeKphF2fc5MdIqRJ0+l4DP2cKVB//Z
	 isoNRetw/AkUOHH/6PBM1UrY/SJKkBE3IggYSDAiV/D/ZZJnqGSlNV09jVimVzOj4p0L3
	 Vn4D2vCPfOsxKWwsGqsF95pIGTCWMisYGa2dtD+hLxbghARbMqr28c+E6ghFXza4iTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
	b=yUwPEdiuqmGiUjeTvWFSaCLBTXSAw3lvW9HPZ+8wE+6EUq6YharZKirMqv2NT1BxQ3w0
	 RPHsg3BdWbrxlOz+ppUd6oJrg1/cb4t/tiWLgQuB3CHONTYDBUeGz6zAVNF5wSEoCNFts
	 9YiJ63RV552xV35z06xteIScBvLZpi3mvu+gLBD1q9fzWc3UkcH84dMI9J2Qhgz5StG2x
	 vyGGkK7/CetNl72qRYDrhs9JExH6Frnp+mUFoRJycZvpSBwfeZiOS1x0xhYtu/HwSBSQU
	 3/Ky/tjqBQdW+eIJqvq5QqNYWYHldt9vLQ2N7Njez6K/ZM1ZErNjQ8jxnNp7aN9ggQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddrk0P7T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgnrJ77C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA14606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA14606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddrk0P7T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgnrJ77C
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iqRQ3018337
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=; b=ddrk0P7TZCmiBLPd
	dgOH1GZhbZG/Sh4ouG87H4ydMiS0DehQ77U6wTT5iUFQdOUp0JPiXwnz+C+WUrzP
	VEcxjtQ7tqtDkQRhxeaGTiCVnhoKRVqlAAmOPAI6ZBcxQ2pqDKpB82rTkCzbjIJH
	0n2KGXKLVKGZnQlB2ZkLTNJRtZ8m4i36/bBFPf5k1Ho5eu10GH9SGa2BB9ih0Og/
	UoEuL5USjjGQM2aX9L0gI89jPmRyXrXGyowQ6EmJVFe84kCXTu8EC7rXDHCS2mYF
	/hfZO96zHU7sjpY3duqRyLU4is9hXp+aDbMFUEVkFYCq7P7TwwylC8LiZvPNnn8T
	YKOQUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3ec4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso15344585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572528; x=1793177328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
        b=EgnrJ77CR9xkWKmucfP040B1gEk+BNHIpuydCQmgbn4X6mTL5L1A/Zjm8gQIxJblMX
         3F3DMMgOR+mEuyYYG8FR+3g7WkbeDNk1M3+kLbuA7lQTreJ15FnyqZ7c16tWfgZOERmQ
         eQm3o3LltzGN4/pOAHFtiOcNp614H3VoxqDC9/4aCXVdPxS4hev4E0zOrgKGAfXIK1ge
         JwZUV6gxorTAfwECUPd/HRm3L7bsHtJ7TcBtYrVSl5Kcx8LEawxv6CkqKLdY3job0iX3
         SIho04BvEKlitA1Bm8YV/cG+wN7F6954niZhmY0tNfe5hzntzauw5ZG4hQwbi65a4NbU
         u0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572528; x=1793177328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYQse/yDDEeSHkDsCSzLZpVTju3LUd2J+KjtYalRUN0=;
        b=U1baeFUj4bc0MulLurt0Fr7cS/2fdQcOHa02Vl9mTJMHJ2/lgNONnxj7Kxva4ROo+z
         Nj+hTmnUk5L4eEGU1O3yc7PBBdT6BWj5HJOz+NIA094BlQ+rdAzjfkOJ4bE+aO4Tw6ru
         YdBvdgjf+cV+YVDpeYuhcCIgT0Tzb5GDRdql1H3MzsvxxK0AFt0r///tx9Kp7CQxOnTM
         JqdQQ69c8fOZV8xAtvBdlUJcN5thRYLpI5nkIC2d/yfiYQqM4Qn6jdxvw60NItMqDFi9
         +Zh0wX50sZrgG63HklWYSQtiP87Fj2MYZEGK3CUp6/RFZXHL7I6LPE0BddVr5kBBoNsz
         lfqg==
X-Gm-Message-State: AFq9FYJeuZiG9DlPktm03Gyxzlo49YfG2dpb1w4c+qkUWJVjme9hJ3et
	5pK8XYd0vBZUXtAAvFyh6+IxGPBTu4pYDQAeYkY3IfdtSCAOkHdWhOZbXc59ZWmNthQlDpQawP+
	v4ZnrYktHQU+AyT/Rx92ioPOccoARksHRjSlvq9rU4Pj5b9O0UhhBwha8bsvcUMQ8xydmEq3WZ6
	LR9hPAYQ==
X-Gm-Gg: AYBFou0I2RTN8I2hHfJ2xelQrYWiF7DfTIx8/hskMWpLvhfefrxqeFtMhcmhy55yIbg
	l6i12QbN/hoxeT963HeqxkqBjPe1k8b9w70+vhpiqZI9PDPvH8q6nJkKP3rOQWgpZ6hNzIRjSgO
	9PsCCLjUfmOfX/Pp+Tt68ZbCkbgg8QyAxsPrUqTwb5bw8Fino4Q1+Ns75AAZzO8+dgqKR8iwlI8
	5W1UYn85x7zKJgzT7ruwBxykNQ6riI3/R0cWonfZwjBoS+qAD1iUqK4GVT65CWr19Vsy1hGIODS
	zM2bzEnEZI2JB8y4a+7WO02D8wIVGJY7C9CvpAJNELgSdxrr3zEVZoyGXEn3a4F9jMyNfX3jUHl
	rgztcFcpm7wzf/2YB3eqpsw==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr390412985a.6.1792572527773;
        Wed, 21 Oct 2026 01:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr390403185a.6.1792572526007;
        Wed, 21 Oct 2026 01:48:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd7039sm58003766b.54.2026.10.21.01.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:48:45 -0700 (PDT)
Message-ID: <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:48:43 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+8x+oO57aLrU
 IpGxys87k6Q2/FkKZP9ojn4ZdPuPeczx9fUVqoztRBt9r1Ah9Xt0jog3P0GAgtLY9zYb7l2LM90
 yPYtb5YF6JmWuH7ySzNbQ141dMYlaoSRP7FkvwJBmaKWcLwdFjbmSWwCDxaIxPFTCdoLxp1mQhy
 IM1NjPz/pTD35XdsZFDegd0NcxcjIx/0f6kvos+XYsds7aRxPy9kq/pLQxuW9BXvaKr3AK1ddyN
 yVPFITeXHRqBCP10uBPRPhHuwqhpNbIz4JKsZfmvr2Bqmy/9zebV8D9UrwsrqAMSacIq4xZ6wDa
 0fS8dzpGxwFAW1K/3591pM4czXTNJgn6umNFfeGN3SoO7PrcwAakoMoL2BStCUX+ZmS1NqjkV+R
 r30AVjodkCJ6h+49NwFPwezhsjiCH9WLWSpXXuC8nGSSQR9DzQVLDlXeRMu0SOG29Tb3kGj8mqj
 Q2oT0imG4RBbbkAh9Eg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad87c70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=F1JjogKJRsLEfutlwsEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1edCLeFju8qclkPp_2PavqeNqPLMJ6of
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX8B78OkDBFgZN
 hZm1NKBTPajvDFfCQeC6WGurIks7atlo4JhaiC9RdQgby0pwwP+nHNNcYr7TV0gO+nnfGOJJze4
 LA5YBRMkpRZTxL8vM+gEEHTnRQnQK/U=
X-Proofpoint-GUID: 1edCLeFju8qclkPp_2PavqeNqPLMJ6of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 10/13/26 2:21 AM, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> The SM8750 QBG firmware fills BATT_POWER_NOW via its maximum-load updater
> instead of an instantaneous measurement: the property getter indexes
> context + 0x6a8 + 4 * property, so property 22 (BATT_POWER_NOW) reads the
> offset written by the maximum-load path. 

I'm having trouble parsing this.

Is that a description of what happens on the firmware side? What's a
maximum-load updater?

Konrad
