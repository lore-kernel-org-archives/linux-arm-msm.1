Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173FE385D90
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422489; cv=none; b=fR0ov286pjT22wi+0s2UigDnypBB6xY+o7W1fMPzES0UY/G4RUfXwf6mA1yKZ2Bwux6NxcxOoFn0DwPzRpZQpjHxR84bs+XP3j4b8oWtJ9EZlP7mpz/XIHl0bzdtqgVMYAC+nmXorYfMQCd+0bXlm+8KRPWCDLhDOpkA5rPlB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422489; c=relaxed/simple;
	bh=6MRqnVTlxXGBzhgaGNkyW1sNAZ4bxwtiZcZhRiQo8Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/oNmadqkvoZxMGxYaJkmy28aALO5jgGn1wWzYZEGOS9pXV+sXAo4I6Gyw5Gm2Jo8Ee6i8Ic45ykYpjwhlJ7epBngKVyM5qGRSOBnJrczp6KK/GRGsPhY/UGCrODeTSgLOqtTMkfXC+23ozqIBxlSKZcrM8wddp213mTuYuVrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH2KB9XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT55MxGo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH2KB9XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT55MxGo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lQQZ2596699
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=; b=EH2KB9XUXauUdDd6
	1c/kq/v+kzwIG4Up54zwXz3Pl3REZfAhKegVSni9D1vTSrcbfDPp7ToitnY9WcRe
	uM3LEQ5Qx/Dj1FI5LoAL3ak15oa3+E1kX1Tt1co5bcSeg21D1YI6IBur8033Ctcy
	gTimGjm4N9VQYRy+a0TMdFdc+m+mTt4eE6uzc9i8jj0aVFz4eXJuGOb1wj74idCJ
	4s5IblQHZW/1D5VCtk/xEwMS8/Q74kcEJVNuyW93tUyga7ox52sqVkMnboSpqUBs
	tmbdHIBF8PuzpdHOLycwD9azE5OrdIw8asH3/nx7lkkaZkFlLnDtnbuwQ0CGZORl
	DLmq5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja496n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:01:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977c5e92ec6so18058241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422486; x=1789027286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=AT55MxGoWGB7T9b9vc5CVN/BgKHFpmMtTTQsotH+2JYjPbcFqsd4xvQ4dlYHPEV1KE
         dF15Tgt0bEy8DF5U5p2vYPIV9VrVGMjU/eT7uzSm5BQMSAIGBgAYJvdQZnbKhsau169B
         GzK5Zkh3/4Zbg4iCVmse8MOZLmQzd3xXQuPRch88Eyl0XSGi2lnKfc45i7o832Xxs3KB
         n2T8iRWvovkoL/RGbfd2+KOBLUA5RrxVUd4l6uKoo7v1VOB9UHO20DEvL4BjD3IDd1Wj
         vGxQmJKKOrtAv2kiZt+faUrUEepfiFnYhvwGmi0jlJZqSzNUN8U9vIMCBdEj/Z1SzVwd
         bHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422486; x=1789027286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=jZ+ZcJpIcAK3h60N9uoT0EbOHz4ISNGMZ3KA+/dc7dGNXugoaXPH1SNP+2ulHZHk8R
         dDE/jrlOB3zfmmgeOW46nI6uFsTQd9V5XHwYY7mhIQh2xmloAMPmZYSZJ7frPWqqk9O8
         P/GBOUnbi80UDWFfV7tLiFRQJODJu4TOpZlOVEUZeUYmF7eeU/viGNbIjiLdmId8xJwX
         24RlBCtvBGlcFQ+mg1hWJpM3d+NrjXCk24rds0a6SzfCXAYlT52eDDI3u9whFNGp/5bZ
         qTjvF2l8Ok/l0lEVhKvSdOkBrGXxkxSsV9b92EGRbbGCpWvhrur/02MXed0xrfYHZKrn
         gnHQ==
X-Gm-Message-State: AFuF++m2/pPCzEzKzm9jdEj7ZkxYOvyXcMaEFK9Edt7qAzjkBYL3fCGw
	xFXj3YBEPszsfaIm4y/yq1T9IPcDSWAcPuv+795+OQTVlSLFEz3KwUyDdSaOr8qI6rKdkX4xBYj
	hV0K/fPV9FYVya9zWanE6VR1KE+AD0rlbAerrbP2deHBwD90DhUXJ1FCZsG/wIHAiH7jU
X-Gm-Gg: AYBFou2/XB1bVYZ4Iez6gcqX6sFe6GQbxPNwTJ03BNP2+n6jPh2f2GDgmQky6LYX098
	q8aZXrNi2kBdH7OFYwIzmeM1o2ZUP1LjVoZaIqr1S0NNJ1ZRfMA3Vdh6EOq9qc+LlC5wrOhFKmy
	JDq2RjyArLcYIGfZZT/+s9N2IiDOcjQTT0KT8vCLYq4O3fRgGXNASYUe1vT4cQIgL4HGlDKdJie
	ISHy/+0NIZhWNbnaDskzH6YJSxuflvZv7pG/hVqS7GG8OecsGDygpmsQ4E7tLc6Kn3Nw6z+4qXY
	fgNjljNpC+ZTdF/+YhpOj48pfo/7IcL9buGP9hNIxgObrGNZQu/GR01TLKZJjNtEYwGg844G7cs
	fnei6TIOu6eueD0nYXvwUgQ==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512212137.1.1788422486130;
        Thu, 03 Sep 2026 01:01:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512127137.1.1788422480769;
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm59563266b.59.2026.09.03.01.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Message-ID: <f7eb5a26-43e8-479c-b20c-cbf53ce54940@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kiTIUfAy7EV3YnFQ8SZ5eNXM6r85tvJQ
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a992957 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MCBTYWx0ZWRfX0wf9Za+JOyu+
 Go0BoDmpBON7tVBb+eV0GJylgC+F7PQQmXSXl62kmSSHV7kZyCmjHRiFzUhDOUdu4Xm+YdbuMjg
 dY4VHe6AML0K3use7DRAWppoaNe5zmY=
X-Proofpoint-ORIG-GUID: kiTIUfAy7EV3YnFQ8SZ5eNXM6r85tvJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MCBTYWx0ZWRfX7WVNHsCeLrGh
 5Td/EvtsGiAFns+tuoRrsZaDoGvNFZEzIWqUCjJCy0dZ5nRBmhmE+gvM9akwCdzSNqmL34Ubs8U
 fHEn05VuA1Dh87/Ii2h/LxVkiOCwLAftfvWFuz8m2knxBKv1enoOPplMFl2qzwBsY8syC6QwOon
 m8vLl8sF9m9A9FhG7AudxkjKcZMQa/dQLfTJ86npnLO5K3GfjukSShICY0sjPzBPKz8Dh6FtMWr
 uqwQMNMYetYDeOhs0tjuEGdAdglTS8ZmB4flotz8qAJRhYcND4edC2hwXsMwrfPJUmT7sR67HTB
 Qj7oi//rviN+B+JPek0JqzZgFRIfXH7D0wLB/Ssne14Sqq0NJYdhSa9/3ufkR6ogT/chXJ+8FnJ
 0R6uygw8gA373t8B9RyuWHL76Suj4vqcthBTob4JVHYm9HX2kF5JdST+4zQAyH+lOcypNBeDUBB
 572l8FXVCyIsV8cA5Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030070

On 9/3/26 9:18 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
