Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82B3128D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 02:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724138; cv=none; b=rb5gcLzXJocKu6HhQU3Rwn3qKfGd/4Wr8FyUgUFmIspHFmmeByQtBR2hnCqKjpws+h2YIlzVu3rARXlvNunyDDwCfeGoRVdElXF6/vCXPSPI+Lqgfox1jyfQWbEj1t9cztAwt8eB1ihmbeVWuNbhDbNldOiEj2F1aZ/yRbr9moI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724138; c=relaxed/simple;
	bh=tyH8YUCMtNCeB/pF3sQCmf8CUaRazOx9uuMVM0I7WEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7ilbRbDgBiEKZjDl6K4mAfKQ0R5zA8V2RNXD2TCI0gNB9vjoJX2LQ8/VpB1GPUQ+Z6G4DhEsQQ/PJXc0peCGLhkEmFzJMPPka/KpHDjy8ERTyhiJIRQ2QjlF0CfKsWJE4z7BhRb2VrGR4oXe96y6g7CcXY+i2T7doFwk5pgdFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqvY8j4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7AaHnBB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqvY8j4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7AaHnBB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVkZx2769995
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 02:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UcnaAsmBAt8oBVPJlBM3vzfJrChEQ532xPOUjAvvays=; b=pqvY8j4TrvxZa3gL
	UUhMaUffXRZNMSzq24t2XXk3m4TSENUAhhoiGyPuE+YEFYS1M0winuivhCo26863
	W4yBJV1YV0aLwMqqmGCW+Ou2vhEFfU9D9fhBANJd8jPE8l8sm74jCsH8Jn5BwF0N
	bXGgu2ON7duf+q75IC0X+dK0b0eF+GZ98R925QyXSHm6MEGT4jvfPjeBoqYyoLbz
	Ci2z/135Eohptog8jJLz57NnbYbawhf2vXlB5sHwLM00HLIwVs2xPfkRaswF+jVD
	pJAmjB1NkAsYoGZxwmKvFjdGyXroRD7LoXAqh0W/ExwmCc3MIIKgxr/Frzjvvq9x
	U6FHVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6m6b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:28:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907ca5abf1bso20593056d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785724135; x=1786328935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UcnaAsmBAt8oBVPJlBM3vzfJrChEQ532xPOUjAvvays=;
        b=P7AaHnBBGZfiuvmLn96ltZn1FYlKqaSdBfVQlOaWmTWxPiS83RGAl1ER3kYsLXIonM
         E1Z/W9HbwFVrOlA0ySWuMB14UXQFQDn8CfFfnirsit7BxFoSchaLDiD52nFzC9YOB6+3
         WQaKRkHH2lt3ugC7MtMnxkxoiJ57CRT7Z83NqT+3oRf6CZGqh4yEMTrWvwzkfW2pvJY6
         s5zfQSi/WxAzElJGeQqPYXsu98UNdfg1xVB/1jajxhDJpHsK6y7oltIVgY0ziKZbL9Cv
         7qLv7wdqEVpZKk0LtB4qVKWKhlF/NMNN4OowuIazrX8eYKWLdsYwo8KqX81Au1MOp59m
         vaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724135; x=1786328935;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcnaAsmBAt8oBVPJlBM3vzfJrChEQ532xPOUjAvvays=;
        b=kEcHpYRhSOPKqE3trchPYXFywgIW2W2/673+BkyTSIAFgEaI4eClSf/I23YuTdF6nH
         BuWI6NQ72dWusXOiu33hsQc0WxXjgVNSFqbIC46WyC2y5ZY8AHMDUA3l7Npsk0waEOFZ
         yQbhzDRUI3O/C369Q8CpCE4/gYtRK/PfuFDfLflFl/R4H2POGdalghWNgvSLpbXnWKSA
         xAAkZzKCD2SUZIrJO2zW5huS1FqvMRuysR5wTW3o2WiEoLZ4BC5hZ5T77kjIL9nCzYLe
         Vu7QwSKVDCoPh9E/fXxkwWWrKyXEeqvMXCyG8DwLZW/GSCUWob20tO1lA+mqZRsUqzA9
         G6MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7rAzmBWvHACYRzn1Y0D151DCrQgmIRjKizLIgxP42gDFayA2Bvp0BZfj06gfFqDWesbj9VkG+MpE+Y6jG@vger.kernel.org
X-Gm-Message-State: AOJu0Yybemk8GUx1W5vETEmAjs/wYfw3c8JKSGiU19eEG8lxyC/xwH/C
	xuYkZ0kd5GvA9VwL7eJ+hU8eKi5sklDxVZkUySgLKopU5SAivpyqNsFwPznWXjFvqFS+KpC1eRm
	h/mM3VFT7YkeKfa+wBuWgb1mMHAizwxeuSig/0lDmNyHMEVp/lYQ71hL3N9rqacR4U6+b
X-Gm-Gg: AR+sD10Bo2J5yoWoaPFUrCDbeGgu3A+9q/SOAKwso3jZ3jlzPRJ2PpUAkN4KnF2FaxG
	4X05yI4YnN1Jajf3DUPpdFn0vA3ZBhC8pjCdmxm/dTi788W1jMbYDF147arhFwS62bAxLMHhEY6
	uGl5FFRZUG+kfnkMM1XC7EegVLPFKePvBpZiNcUotHoU06uR7HftVZJk6gGTYgTf9kiF/sfNVFm
	gsP2ie3XgPKTqsezr13Cn0Mti/MVjnZtNk52fW2fEy4vnqrCcd9JNzxvreijOMpgLtlb2WG6HYg
	C4BCMMmIe3xaAg5Sg5VbKF5Rg+gGlcz4zHiNhkEFRQhdf+suTNWGWal1vqI95DOwpptG7ONQJSE
	7Q4mKJT/YGTrn4BMIsO1XZfk7cZUBQrR4VX+JDyZ/34gSPhklPXkZTCLHLPuUVSSh
X-Received: by 2002:a05:6214:1c82:b0:907:dd19:fcb3 with SMTP id 6a1803df08f44-9084966f7f0mr171113386d6.24.1785724134742;
        Sun, 02 Aug 2026 19:28:54 -0700 (PDT)
X-Received: by 2002:a05:6214:1c82:b0:907:dd19:fcb3 with SMTP id 6a1803df08f44-9084966f7f0mr171113046d6.24.1785724134282;
        Sun, 02 Aug 2026 19:28:54 -0700 (PDT)
Received: from [10.111.175.212] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90843606e04sm66132856d6.44.2026.08.02.19.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:28:52 -0700 (PDT)
Message-ID: <47c6a733-95e3-4ab8-bf25-dda778dca7a8@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:28:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
 <20260729-cci-clk-fix-v3-1-f3c731d1596e@oss.qualcomm.com>
 <016603e6-8e87-47d7-96fb-5441ddbaeb28@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <016603e6-8e87-47d7-96fb-5441ddbaeb28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxNyBTYWx0ZWRfX+CTfuU6e2Oa9
 7tCwTqePFjJRxZTPvKPukDLeDA1T4oIK909qBzXLjQRtP8UVTVLCh230aZFvefWwPqjHBXFjhGS
 82ErQgpXRE2LFFlxs8VlFHxhdk5UH+E=
X-Proofpoint-GUID: _YkPZiYN3YJtCQE8JND0S_TlwBxNLys1
X-Proofpoint-ORIG-GUID: _YkPZiYN3YJtCQE8JND0S_TlwBxNLys1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxNyBTYWx0ZWRfX8ZqgUZxMvVtS
 wv6cAwsFnNu6eJo5SU0ge4a4R/c6Eo0PQhvEsAjEDERdoL+iwbbacf0q3KRiyMweVfpzRWoRaVQ
 4OshFgvSeur3bI6URiEJnbT7CR4Sl5wTGGZ6/slOPEa7QKW0TEDwQjlRSMFzas6qNzxcV42edgj
 B4mjyiaEQACasJSMfKEWgl7l7tM/AC8ngd0j2w0EdsjjQJognLQA9AqlIq/EC6cRiBXRokwgxyN
 3coJfZ3y7P3SbPfQ9LrkwPkkwOP7hq6O0AKtFfOlEGnn0xEpUk8HQ3cotc8t1FZh+KHnI127gPD
 YyhMtiGdao1Pdkox3PPk8AdybxFuFMt/m8waCHHw6dsha7OSr5ru3sOae0EmseLXIvEgLuuCdzh
 bshlvdgPoliMR8LPn5Z77olp6ZUf1vT6Fat6sRVoUOOdSJdFh+HqzNhm/2IxHCGV9s+dLo1Ecvu
 SPBeN3ihFibYOf5CT0A==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6ffce7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fpQvG6xzPgmDaOYBn-UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030017


Hi Konrad,

On 7/31/2026 10:06 PM, Konrad Dybcio wrote:
> On 7/29/26 2:25 PM, Loic Poulain wrote:
>> The msm8953 CCI timing table is internally inconsistent. Its Standard
>> and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
>> clock, but its Fast+ timings are essentially the v2 values, which are
>> calibrated for 37.5 MHz. Since all masters share a single CCI clock,
>> no single rate can satisfy all three modes with the current table, and
>> the DT assigns 19.2 MHz, so Fast+ timings are wrong.
>>
>> The msm8953 CCI is the same hardware version as msm8996/sdm630, which
>> already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
>> the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
>> the redundant, inconsistent standalone table. This makes all three I2C
>> modes self-consistent under a single clock rate.
>>
>> Note this requires the CCI clock to run at 37.5 MHz, the driver selects
>> and enforces the proper rate in following patches.
>>
>> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> Wenmeng, have you actually tested this on MSM8953 device?

No, that's not the case. My testing was done on Hamoa & Koidak, which 
uses the common msm8996 compatible.

Thanks,
Wenmeng
