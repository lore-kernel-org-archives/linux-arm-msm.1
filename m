Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B14D957C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983858; cv=none; b=QjUglCdzDOcJdOHApXZb+cDE5HN9uMW1Ff0qbElRTiMAa6Hq3IOZDuAk6ad5sbr55YaoanhkKH9S8kk/1eh7/6Kjv2SHzMa/PDd2a6Jy+VNwFWb52E9A6gOQnPOarHPPaA+j5dyr7tV2aoBwocI0YWeQDxPdKapGdf4M/kOHwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983858; c=relaxed/simple;
	bh=NAhNj+xAYKXjwTf4Bu4MG+U94N39qFYkCb06SSvAYiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrMucwoPoS7l2+PALiBgF3t1aw5kQWlbvyYaqsWUC1oltHXuXJO91R6eMrKnf7YXLwgeb0ME4+PR0YdfQLY9nN+ATMFuuY+GrYcYI+8inmwntT7n2q9qOFFhsxtQ7lQ+pgRf3a5cOr1DDo6tjey5D2etY4120TjuOiGLHziFm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCdxPO/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9MCNMKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCdxPO/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9MCNMKZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDE4R92874017
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=; b=KCdxPO/6K+SOR16t
	VvioE/s5u7GQ6HhRNcXzGbSjQ1HPMDslfihNbr9hqD/v7z0JZnHmE2OvtGZISgQ+
	yc0/m7lwjVj3DbV1vgPc1UYX2hTVti7/VyimwojtDshyUZfZ2G8ObqVCT5G5jrBd
	kPuz9LuiG3JE5DCGBvE3VZZqb+QCs/qp9rtio+6r2lOl/NVob94g5Icfq3mpznfD
	3AAshC4ZLiiaom1h1nXlTxI54zlizxOTFret/w1XA0dDbV95RRs9BdCHNf7T7MTC
	c36nVMqWP9f8kK41Nee0oCN6c2KbSny0EH6QIC3Uu/kquJWu4Gr32yngJDjjFmzD
	AHLu0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjq58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:17:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f0aa07824so2559285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983855; x=1792588655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=E9MCNMKZtih9Rdj4nmZNXOxYgqH0I4ytmcG5J40MLCOr7lbXGR2ycwS/brxI2UeszP
         9tOigd+bzfvFGFuVxxgWuGFrt5MbOL87eTRevAo/vuZVvkb3yY/rfaG2yPuCkwikfPso
         NGoshtnDodS8vQgmE6aikkjwyMrfFURnx/NVowgqkJbvCJt8mCmChSQFTm5zhj2iXyeH
         q+4zz3uZPOpi5wl4F2eyHTxl2fN0XEaDOyvC3Duz/L7+nUo7sizkFmplY7iyDRKq3uDJ
         OwYsEu1SRswBSBUKpWi39RQxwxBPWEvw/Sd5spK88YJCixIvi2UVukbavhA4YWjZ7AzX
         5Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983855; x=1792588655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=m9FMJe1b5VZdVC12yQHLVnE5al1k0SewSv+2jqyXv+sn8DwZcTgeV7EuUrE0QDxzO0
         42dFQ8Welj7otMfjqCWa0x4NcFulpXpByOBr2jRaysBbW66uGv8L097RtmtirO51ShlS
         Z402vAMRupKmBaQwYcJdVDhz7UP31eWpdr0cd64VKpv1039fur2BmIZFTGdhK7fLEQvz
         0gsnNeSIVbfsUlngLsDYkCoH7sjHRKEyMV+YMZVCbrDg/0vVCgmKLEgr8932ZYrheZln
         mZtPelVMNZFCzpiy5xcL+Ygj/MSJ110NncWsXOxlMYWIyf6/vNcE/bWmABFJpbnh3htD
         cQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBylLNYDgkHKQl74Q7eiUpqtgTtXN6RGNiCHa2P2wnX3Dq+V14eJyaEPAObjXN86iq5i/cEElqEZmYkb3Df8@vger.kernel.org
X-Gm-Message-State: AFq9FYIGOjZow1GHyQQXGhYyR2bx6ogfIzwtvgYsdZ4md6M0REnqLzO5
	MhjLm696vh8OX2VlmdS4H10+KoEu9vJRgN72bupjgZvqBKW2GBdUZam7m7+0eda4uYzUn05Rv+Q
	TjT2QSTVHptPCOLLa6YhkwuVmsm4GdzXS+8bNvmFcG8S5CZ8DtPWJdQZKTF0cuzoQcq1E
X-Gm-Gg: AYBFou0URn7Ixybpr1435OMcYvQyYONLWf+2+Icz7SHYetURHn5cRNvS3gk5WhioFdv
	mEQTnPI7rLJFbPGDkK5SNN6+2NsGr2bGcLFfuwkssc6yM3xwnUDE6Sv9V1q31livJd/lpWvhEVy
	EuMMUvjlbAgqwinYHPjERIuNyz0kDS2VL8Meo7Sia7NjbSfCXi4mXrS1/VEMU9u1HoDlkb5vjtW
	UKRQdd8HcgIrKZCuolU/GlaMfa8xf5P30kjRdqetEAGAhhpXByX9uUxXiFq0JCgbltLqmpQhIad
	Mew225/gGTj7pGXk8n8erJbsdIOpoLYFgr1cD5JibIx/cA/vgyorKD06dfUZevmjQoYi8IN1SEv
	KQpy+Xot/9Bq0GwjPlTuGFQ==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938896285a.4.1791983855460;
        Wed, 14 Oct 2026 06:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938889785a.4.1791983854924;
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d704c1sm632732e87.25.2026.10.14.06.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Message-ID: <230a39d3-6957-4203-a54b-88c871092e08@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL"
To: Birk Skyum <birk.skyum@pm.me>, Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        Daniel J Blueman <daniel@quora.org>, Sasha Levin <sashal@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        regressions@lists.linux.dev
References: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oB3jj1Rt7CwO57BsnEIt5Pf12J1_a9HA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX1RYKcwfh+j3f
 wkIPMHiHGeVYvHkiDYoPVOZsY9LS+4OwDdEXllPbAy7fA/CFLrCs2vZn09Ir2OrzGQXC0A0GhaA
 NeontuzxdLcF3DOSlkhGrVS64y6JrCc=
X-Proofpoint-ORIG-GUID: oB3jj1Rt7CwO57BsnEIt5Pf12J1_a9HA
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf80f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zjrlJ_9gmUhWjCpjid0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX1QRzPMfjBFZf
 mfJDGMqri5bXU8vUh6HdMkCFgVLc7C4omPwlgo7UKat7iStaxUwcp5L1Bjsu+MmW0OL0T0RNCWD
 W+N6T/8r14Un3RJ8fvjSv+9I1+757KbSKxYE5QomD1JnxX9Il3nQNzGNrlnMsnzACKrxVp4q8Jz
 e6R7A6VYUb59+Nf90UtIn9Sbzlq0xh+Z6eX/Fy17u4ocgKftpaoZLsE+cRK/SsLx14rpO0pMTG1
 UAdbPaaqDaVWuVfZiiebfYmky04oLFBfJunePS/6vfrTn4mtHMl6oKJN+USfjNgMHqkQL61yaiz
 lU76FpgEymvp+9J006yMNlWnR96RxJ5eSbnWlmE9l0lA2nBgsqJN2b3KlFlGsa08jNVAtz7Q4at
 18CuDawQF+gww1Ei8vPDoG6Jf73PeqHQE/bcZoOzm5RgQBqZiLWixRbF0+EkY2pycfumSyaGmHs
 vEsyfOnCiY5WI7YVQbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052

On 10/14/26 3:08 PM, Birk Skyum wrote:
> This reverts commit cb97bf3d4f91453b881acaf8e9f0cc47bb40b604.
> 
> With that commit the keyboard and touchpad of the Lenovo Yoga Slim 7x
> (x1e80100) are dead, also at the disk passphrase prompt, on 7.2.9 and on
> v7.3-rc7. The first transfer on their bus fails.
> 
>   geni_i2c b80000.i2c: Bus proto err, noisy/unexpected start/stop
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -5
> 
> With the commit the I2C serial engine clocks read 32 MHz, without it
> 19.2 MHz. A fix for the 32 MHz fast-mode timing is still being
> discussed, so go back to the previous behaviour for 7.3. This brings
> back the hardcoded index 0 in SE_GENI_CLK_SEL.
> 
> On v7.3-rc7 with only i2c-qcom-geni.ko swapped, the keyboard is dead
> without this revert and works with it.
> 
> Fixes: cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL")
> Reported-by: Birk Skyum <birk.skyum@pm.me>

(this looks funny because you're the author of the revert but
it's fine I suppose)

> Closes: https://lore.kernel.org/r/179173732257.29426.7905170638383807320@pm.me
> Link: https://lore.kernel.org/r/ae03e7a3-75f1-42df-b0e6-0e64358be647@oss.qualcomm.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
