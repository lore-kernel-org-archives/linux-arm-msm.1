Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3744F555
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978213; cv=none; b=lTIJP47dwFKE6kGcrKYfg1ASmN2ai4zhZmoarW6oJp7lBBlvg2gngMq6Fv4k1Kze5ctsmCnO/a0GgxcgRP1peswi7VhC43FaXqrg1Dx7h/EycW49mK9zmSnGwiZTbAcRFxY3nxuJqgGqyjjAk5Kk6hsGQjaZZAcHBQ9JUcoycjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978213; c=relaxed/simple;
	bh=rKlnqLXl8V6UXo3u9TSsBqyAGh4ks3QBlOSYRYGHoJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDenuAiAw56GkLCAOIhYUTPR9tqaV9S24MBSws3HrY0V+5STmUjDVNtgOY62Ybm73mc1jSwfx/TfMSRiVB6uYSvF+d/VPDFGvaLd+LuXB68PW0uXj9+zr9Fh3Q8IDFVecK621Fn7HrOpimGUUg4Un5uZuGm/iX3c6jXLj/ogi7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMrqFDRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg2pKIH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMrqFDRe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bg2pKIH4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84Td54135093
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=; b=lMrqFDReR8779C9D
	AQKv4bvaeZ4mPeMg8aKkm5C31aRWydJhwn8j4C+3oGdFGiLhxEoLIZ+tXqmRPO9e
	eDfIx6jaEt+7vj0fGCamyd2qfTLX8v1XOYDvpomzp5LLpJEdxw/DKi4a70Pn4laI
	dZu/JgalzJ1NqzVnYnImlIaOWX69bt2p/vJbDCZePk7VHgUakFUcNNyWJbMMUhpa
	IngfVMM807+LT1t7mHntTR105mkzcP7ae+uGQEhX8ZiuXKF5OCGB/gWr+Lqo+fcV
	f18dcMTN8K1Kk90U5qaOePRpQS+7hLwh4uZ2t6d9fou1WAUZpGpwDANOGI7ZUtO2
	B+l/FQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj00v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:10:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so27310835ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978210; x=1790583010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=;
        b=Bg2pKIH4ESzHLS6pu+2BSZo0Cn8Jo4U04kduSPtjrlcvaXWHALehVRgcF1tvifptAp
         WMYSxg+J9Ticy9vzzxumz9/K/bIeQHcntW5PStBcMP/TWrUmQEZs9UKZQWn2IFvH59VZ
         /lR62LvrkQIyTXXyab+6UlC5m2b321Usg28Q3S7/kAZA3cRTYIzzb9zYppMkyPhcG5/3
         TG0h28fMTMUh93KjbnXLEwmOgd+5rF9G57onLS0MA12UIbC3BF5j9t5Wi3Yjbeytovrf
         Z2aEF1wcLfm+W2i0rP3d1VpF6pM1OOqqyWjkU2kd0jukGvPIiwDSO28JhMhCDNzrou9G
         V/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978210; x=1790583010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=;
        b=2Q2o+NaIWtj2YT2UDzY0Ph+FuHfA683CvrJFxMV8fava+I2ilPFPbE6/S6PyTLUWXT
         pYwsNJL+oTTARsuEnyxEYB1ht9jcbeoc4SvFT4Iv/LQZuLmy2Z7vYiLRS/hfh4UpCNJZ
         g+wuJEbZsjTp+awgw9F56oM7yK+7SapxaB9IdWj2fXjZTQH9CivHdkGLTSHk/BUO/wCk
         ZJOTUPzLEtBgy090Od69Mbh0kgKepInNy5zoYpRyufVHtBruct5+OoeRydm1bOcDH2EK
         hZ90s327yO0YecB2V7NIh5zKtReIKWBq6RRk7acyGVAZI3/iZI2jGXbggl83oD+SMQeW
         R66g==
X-Forwarded-Encrypted: i=1; AKwUvBxhzULbm9xX52Iv0Ene9t7yMe+bGXLzqGYyo5gDty5oYfKm+Jp7CbAjZ2e+LIpr3QC4V0n3uAmGa+988ndx@vger.kernel.org
X-Gm-Message-State: AFuF++kAXVgU1EZif6rMUwBgBJtTbIK6DzSesY4FFQLV2rtaEcqEjIDj
	ntMm0tFs/ZtglhIiQ3w+rIubUYV3lZRGMENV4deZMh9n5Jb7czLyN0ivwrTSj94doLe/MLGW3Kx
	f9aUjKxDIDY/4YwIB4ehNs4s81GbexVUX4YXVxnOUwAXI2qnyeA3gQ3SolOTAHXf1ZpJNqpQaZr
	f5
X-Gm-Gg: AYBFou1NLivF7Fsk9c7KFtDizDwgbK3k7JtN3aw55/LjOLw7VHJqG72DwDcOFVgHPpG
	/dZpQEdUflBjm/jrlTH1kshaa9TozX1c+KQ+wFK7wr8GpW+aRIbghB9FAuskCUfJ0zkJkw5UEv6
	EQlSBozeLNThiLDOeywLo3+5HC550odNoEVOFueO3gMBfY76z9GNI8eBeoLyBQYfntFMB+YYQoA
	3NadsyDO/GuSI9zCobl9TdeRkTCb3YOZHgKwP59O/sYV2aq6GQIvH/m7g3+b+cA/ym8MbkNAuM3
	4RnW3JjnHDBRrpnvT/eHDiESbJ/j2NURabpLThV2x99uGfV3ysRJ2FOmnCiufxjrc6CUoIvsm3J
	yiW8lJneXSUtt2xDHqL1OYSScmJ7GZQ==
X-Received: by 2002:a17:903:26c8:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2ddc0ffe9ffmr83871385ad.64.1789978210211;
        Mon, 21 Sep 2026 01:10:10 -0700 (PDT)
X-Received: by 2002:a17:903:26c8:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2ddc0ffe9ffmr83871165ad.64.1789978209832;
        Mon, 21 Sep 2026 01:10:09 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm17124286eec.12.2026.09.21.01.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:10:09 -0700 (PDT)
Message-ID: <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:40:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
 <aqyX3lJ1eNBmzbSP@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <aqyX3lJ1eNBmzbSP@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX3xBU9VYLwM82
 owlBymzdFk41+7yeUkXKvTecckqbk82DGZHN+Wo5PuLBIaweKpEmIClNwug7nfx9Iixtu8K+IVB
 ubVgxN3ksvWQrISxNCbB4M7dkVGSyaQ=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0e663 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kq3ZzjkpYTjXZhaqunoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: x8CJsVpYBmEPiLoeVpcbsAGMjxZZh5yJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX02f7TJwBofBP
 Jie7/2XMVD/Q4XXS9huzD97GkD58HoscQzy/Ys0eol1tgoC8B8EudHKckSXHNzHEcmcrgtqcgsN
 Q8PeOWBFlla6As0HM9WhqsngYBUYenKk+BvXO7pBJ1bS0dLo7Sgx66uos5lONOJ3sGTx6i8FBhM
 1aC12DNCi24oEyUTegCK7NeEdUMlpVwrAn57aoqBgiWKHDfW+0ntF2J7hTrkEBUMC2PwyKutEng
 t6ZdeU96MwaN7gPqbwsIloHnavqUnVCjGQeqXFg6ng/BC6orU+h+hy0k5vNvFENz73eCe6183Dt
 CWie+E7HXGnvSSBdwqpMxUQzuphDy3zAx9+e9gAg5AVQnL0Tkkt0GH58WxROdoluQxVGLMYP/+8
 UUG0wV1ro1eAVfd2wPZojBX0Mu1KP6YxIvQyJZsL9pMppTwjU0PtMfwe63aLADwkCxrBzUQzgQE
 km0ouSQoujtuYYgKbNQ==
X-Proofpoint-ORIG-GUID: x8CJsVpYBmEPiLoeVpcbsAGMjxZZh5yJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210116

On 18-09-2026 07:16, Jarkko Sakkinen wrote:
> On Mon, Sep 07, 2026 at 02:58:41PM +0530, Kuldeep Singh wrote:
>> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
>> is enumerated as a TEE-bus device, allowing a client driver to bind to
>> it via its generated UUID.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
[...]

> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Thanks Jarkko for the review.
Can TEE maintainers(Amirreza/Jens?) also review this change?

-- 
Regards
Kuldeep

