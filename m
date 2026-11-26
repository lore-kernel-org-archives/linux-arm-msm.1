Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664351;
	b=d4fa5yVfET35CRED2iRwLW6MpojdXaUe7tMsv5GxpCGh1StNZXwtB7d4yy6ImJafQdVb
	 ESd74TJRNOSNcQKCaxHPjNF1AEBUEfkvWqjBq95lRj2Ml8/1v1c539/uwCDg7eB/ERkTC
	 6ac/4Z9Pjoz1jDdOh2B6+5Nb/7wADUEZcxGneDAewYUzPNRb4HumcqRu2pg168oNrr8RW
	 Rc5BskwyxVnSXLju1eNNTPIvixSJ39upJsYXWwhac6mSxLtxAgjMaqHsWJj410pdkY4Va
	 YAUGftobjDgBw+itrQ8S/DX2QSxyPpiAocrYAnuHTQ4mfEs9mk4LUpR7IADdiH3r+Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
	b=Jj5z97NrzLnU2YTvEM1ZaXwAE4xP/Nq4sh8sG578Mki0OcyfJZ4z+d5NgNjyWtvibkqO
	 9f001AcHeBm6uF/+j6FtfbCV9u9G2IY+0A03jQCRtfHyhTmY7z9iMJCDFH4KLLZ28kWrU
	 HVKIdbQvTT3bN/tqy0p3ojD7Jw9EXTfYEFfHwZf/W9dHYY6jAeYmmjz18qEQBo0iYvtuw
	 a92ZKZxbv3JWXrBhNY1KUMHkcA1Eai7AYaYCMQfQROjkAaeM84E2Afyc9ieeyuwSVxfCV
	 aDpSuVVruHoIQPPj2wlLIv9nLqJqsN/Qdnke3E7X33Mi9wWP06SyOhHbaUrNmNyMp5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0RVmqgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F5606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0RVmqgt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RmI1686564
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=; b=fTqPv4mge0M+6zzG
	qngl6WCXjIHyaudlNy2Naa6s4hHhbVkmTkgbAJ33kmEX0Arwc6gdNHTwJX0+J5wJ
	3vHLloD///qDRtTUquvRDXJvMs1FDEKz049ZYd20cFl0CpJIBauKgXbTW3Ey1On2
	207yFO0QCmcKyPKAm1lMmYhVIUqIc9j0VQxQvjeM/Hd67s5doGkgULtgtTger/mA
	CAGaQ4OyyaQ5sipNwBQhXYt9OPypgrmH+LrURECwE4qoNNqd/sZXIoPb2ZBOzfqd
	6v+pNDjgpqUivD4Y9X7W87ALaoF+GDpru3rLpW2tlrzgOj5iZGknDJZLEQr7ysHs
	sfEnuA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf93q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so3243880eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795664348; x=1796269148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=d0RVmqgtW228rkJLM9w64xdqLWC0qvcx3B6y25h952J0PWkOQTxsLkIjTnLvA8JcV3
         3/mV9WPyWaBfMpEKXTPD2fDQjp2TyxMbUkvgPcxqz790LnqAIef5WPKI9dQ6xuJVwyYC
         D60Yj17y+DBtSqF0HKWa0yZ39kqXsBxx9XtXOXdjbg5U/rfLZjtxV6tbpUlEmB8VFFyW
         n8itFQDcCim3sSx4x2av1xOaey3pOb37vx4yy8UU2+lof3irh0FmJDvIoTy5bjza3Bk6
         AdWb2NMV6D7CnkMGPJB4gojEkwpJ0MbE4+9+RefrvRhcRS8xYlCwZaNeKkEwlFqbMZ4m
         18Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795664348; x=1796269148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=Rpro2xxnCQOv8TLdxZwcpzd9MziJxWRw45GStQBJZLY2iShYGlUNIwKMwQ0+7s5fLY
         1kDTDoRewh03PSFjyzM0A1jnvdhvUZr9A7dc5kcNYldXwaESXeSJ4ndF1cfYN9TqhkDg
         mWQ9S/PaODbnOQT1WCA+5aPJGeqlOrR5G9loX6gb5C72faMBU03+ClgL+RcYQEN1am2t
         qEvzY5dgXHgWAGQ4vB7wXz8uDEUIdHgfzOidFeJPSKJOOSQp1SiyOjfueCYNDAZlJY2S
         UBQsF26NxiyL5CfCUGAH9FBfa5fGtQeVOwgaBO1TZZkNqV6iCqbYCrQMfBKl92kWHfg0
         J58A==
X-Forwarded-Encrypted: i=1; AL+hErFtqLJBCayb4o9A1VJToxZysiQRU++GcK83DiDmlyrYsTeIQ1HOUkjRJbBScpK5nZ5eiAGiepTn7BATFmWM@vger.kernel.org
X-Gm-Message-State: APuU4Z8x7biAFG3TjKst5WdXwIZTdarL/dCI0+AbRuTRhd4Im6OTKOPq
	4Q8SMOR1DDnLeYx1Ytg9aMywp+kMa6bpCnnD0Ymnj/DkTT3uXqbkdxD9y42J4NdY2CLEgSt/2+O
	e+nXUU9NN+Qac0lFwKkR34dZEFgLWb0EEEEoY+ZgVjI9ujbSR0zdBj7zEEDPC++RDGFrO
X-Gm-Gg: AZFdTZc2CMtZx8htK9jNVSPw3GY8tNwaDF4NOuRh1jtp8r6UYZBgP5AThPfpmuu0I9z
	3zs/jwMyg+nRJFvdOw+Jh/wDXGtwdFZqRLaDJGMHlJJu65eq6HNfBXKx7WuOHe/oz0Zepo3suVS
	WajIAp4winfkiVQiHLfg1Ar5TW4HAHQYDoq/VDYH1cKQMPnjX58RUszLDTk5yOcuPcFH5xjAEcw
	jhvIisu72vp85lCK1NgwUbfTh5Mu4cPWj136IFOYVy3GIyWFZD6vf0AtT/dTr2N+pBAegDSRj/T
	BLlpk5D1BQt63XkcVwUjYxYlasf18BmfqBweW4Zhl5JC+PN/Xsal8+tsMbuPf3LnYyA/UvIBbNS
	gKtjYsclFT4QK3vMx4NPDB4Gyo3M0ru13as2EZ8MagPnxBvVTHhD7HcThvkEgPkmqmAGzKWWMxs
	1GpCQJ
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744958eec.11.1795664348425;
        Wed, 25 Nov 2026 19:39:08 -0800 (PST)
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744935eec.11.1795664347990;
        Wed, 25 Nov 2026 19:39:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm49729022eec.19.2026.11.25.19.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 19:39:06 -0800 (PST)
Message-ID: <3c7382f6-8665-1632-acf0-b380aa8c5aeb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:09:01 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qYmuWknCHrUSb-P_q-WeIF7W2J7pTVmp
X-Proofpoint-GUID: qYmuWknCHrUSb-P_q-WeIF7W2J7pTVmp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfX9/rbMPAHCiHs
 Extmwumy2wpNdwIRFeJzLlUajjrONPk7AUfW6umjNc3D9o8dnUKs77l6jSHzxXYqQdvHtzWRMYy
 udPSHguOzEodyFKJRPPij9I87xXDUnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfX37uJhdHICitN
 SMiJIBlOoO9txltHyREMbLpHdxiuD+IdyBLTIkN8uFlH/R6/4ETQ9mwWZDEWQ43t1zFyHoHOcfA
 RupF96/nCLKdbsiaaaux/zPD7Ao4Uf1t9H+VXbqTcpNvOeqDrAtre1eS+oB9QpnofMv3lYx5ZMj
 bsfICsKv5y+WgeFSp6+It+/bm4dHxA9mNoe/Vo4R/Jzr6aOpm46Jz5iiQaRCAh6W1/z1ItKknZq
 0rHD+p5lU6M/UZBnto4bBslrqt9GtT+aSjFL3JNttm75YOmEeci5/S3OdU3m1VdMaIBOYxUHJ/o
 CPejpPL4nOF56acdBZk2ko2cNk+kUg2SHAg1sxb7OCcSSTkldIfooW6mYCs80DkmFvSpdsrBaxv
 4Xn+tRCKO8IJprrvL39tObt2j962nJ6S5jTs2ddF4fjQku3RbubWWD3FzpFniH3sBAhApYQkUJI
 0zU7BrZa9XUsj1lbr5Q==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07a9dd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RiDGyf5vU9R3Kc8e4UgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260013


On 10/21/2026 2:15 AM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
>
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..6ff5eefff391 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

