Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254284;
	b=fRAqs5r1ZdWSMOML2gIn2zApnqhyaAQHL5wTy4YjLhjotpdXK/cgpHK28bZ3xq18YHy3
	 2uGLycY8NtsGiQbInVnK17aAEOeNvlVGVqx/2S++ADYq0bq0ZCSWJY21znvkYqaUNdgq4
	 TIUmT52XU2FYx9RuwQ8+9mTuqpmwoFbHfEzEecSCw/+pvbJouq2OBmWRaUN+RPL6KgJJB
	 cC4GTBFO/UNm3v+k+TtbvIOrQZPC/wep2XpLELdHcfcXyDGfXLK5Zs64z83mEH5kiWmBL
	 hvBWtnkYpCZRDUu3eCKEWZ/xS0wDNfoNRYjKk6ZygSdBDy3d2PjhU5Lui/5zW8zM25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
	b=JTs9EnDDxsy1CJH25IG0/RS7q7gUhEiO3j7rTxYIRXHU109cNo70g+WzGLCvYC18KRo4
	 JDBvxiPz0Pabh0uF97JN+wobZqntakB3/yn0Km4P7kSP8NzotSJiZWE8KUWzihDJeE+Q+
	 hyjMTAcNy9V2/Wg3D3gGNYG3nbg2sm/qzsW4LGttcscVSpMnS08Ydvj1k1rMuV6O0+V0B
	 7UKpRO5+2hhoUziI1+PvCloYQpqrC02NIvd2EMbf/BAM5SpRtUPp4bSLUMOIhsk8sYDiz
	 hf6x4yY5qP8oN5wRxiDUjCdwcnbR+zY6sdG/EZ0t7WeU0chxY0h7o4zEsfhBcgvB7Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD8zn57b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eeTWLANy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A6C606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD8zn57b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eeTWLANy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GnGU3340959
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=; b=RD8zn57b70Z6Mb+5
	dy7ND5ZWFKmsnY+JWFJbd+PT79oPzxN26Z+sjpvmdKDhTjUS4/1OZRGhG8ni1g8n
	so1541mpoo2V8MAlZmJqvErSmEKNMLhCmAl7odE8Kfeoc+dvrgRua29ILhc6XHxb
	w3eqfI6YYfNGTzPrwbD9wTrYcPCazYFfQXkm7aWhiHZyMerEPmoxGfT+0GbOONXm
	Lj6ZQB+E3GF3qmLkBiKQKIMcXUWn1+r7jHmDUX5xh/mvPL/QfTLGUixqYLiFK18G
	HNORvoGlceGQCyWoSksqLtJ2WpBoOY+90f2yQo1D/I1ET7raZqopkFReu+KqzX7O
	wKjF8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3gyck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:11:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so26265255ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 23:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254283; x=1793859083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
        b=eeTWLANylV2o0efZGkxNvtka9dCBkouPK53NZ734xdVplB5mQO4l8k0SbxlDPW5lOL
         jVFNMAQeXLyNPJ1OouRzzo7fCUlBMcrbTMaelVUWZcpAQBGSNEqsSNONVQxrJsXrPWqh
         Q5BQZVPY3Bsxf3ARdw25li6jY0BgTvzDuEjFVNk+DUTw62KNoLkcTWOHT7unmi7Uubul
         gT4ruVDcry4nOIceGiIQPs+Un0eegs9NTnmUi7T/oOZVMxfSwLhDdddt1S36GqvMy8I1
         PtMFD7o/ObSxuayx5EZ1C8MhsRpBfrnPDjhqoKdQIikq0L+evqBCiEmZjWehho3YVs1w
         RQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254283; x=1793859083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+x+sbwYe22bkeBVNltT0oD7sdL3tpcHA5d0YP5FAtW0=;
        b=znUNXs5KLY2gmFRazT5IRtlt0aB3oLPOApfaSkl0BU/TmniUCCfpWFLprU+OH3tQ4C
         V+oGB8Y97cFM4l1eJTTcO30YeH2+eoR0ibHE7hJVsAVsn5V63nWKxFddnfP0WVJC7TtR
         bEdi6EiOrbn6IDhMeOy9XgQgn2vXzFRTpu5bMM+KrGBtRFLMgyz0WqXvOwqnUMiO+tfR
         SFZWFEFdkQQzHPCwnNdUqRpzvbMzCoBXbvV9c3CDS2IW3J45q/16gqS7gAq0xkZUXZdA
         1bHgLlAIMHl7qLV8UNV5eEGquQ1w//J+pysuKlhSuaPqbXUJOD56Xehea6isRunN0BrG
         6dUA==
X-Forwarded-Encrypted: i=1; AKwUvBxWKFDZcfNl8OBaZPz+QPX+t6d42Hs5QbeaPDNFfE7GLOSjellZmbacEX/2m7YV93GozHmeQCcOBeL9adyC@vger.kernel.org
X-Gm-Message-State: AFq9FYJuN+42xvU72jiimJxrohLeaZQIAKXhbwMIytlcKtIBpvrC7rTH
	TnOaTUINZSahVL5hmvdcmOErBazqY5OJrs/u3NUZfIvOG4jlSduUgLX+tgHNq1HcuOywFJrlqce
	S9oSM2IonjY3eglrmrp6jyL3BsNZg2faFaar2AUBJ6Xzztg7I/MKMKv8cU03ka8io88UO
X-Gm-Gg: AYBFou2SqTn03DEUOsk4CO0wzyoCPTC6WYxi6bInPMNXXy1T7skGCWAPEhBNFnbE3Ty
	4NJYTH/TiKham7wl3vrglu7USCNb8RgcabU4k3SPRuhGSSihYxBg4vuxZGYasm02qFIlLa/mMit
	lt6/dB7wxnb0E/xMUuat9l2zvqtPy/VJJwidKJvCfcKTbFMR3CUmZS56FNR0p5pG6mLlT0fZUMP
	D/lbXl4r6oG/DrVbNb1bcOlTz9o6S5xYlvXYtm9QKfOO6UG7Gn6vs+DlISQ+9k15iwHu41y11dz
	U5KH5PjtX0hV3aJbO0HGJ2p7+BTIXVtPtZ2VaUWN8b6JjtZgnJv4aGSD/FK+o5fDEytW6VJgkjL
	CLPOC12pvTxH9Sb/KFGp2xYW0bvZt+9VFVv1kxS4Uuvu8JPCrxxz/WQ0YZfi5Fxx28P55htBn74
	I6WA==
X-Received: by 2002:a17:903:2ad0:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb00468db9mr41459455ad.43.1793254282678;
        Wed, 28 Oct 2026 23:11:22 -0700 (PDT)
X-Received: by 2002:a17:903:2ad0:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb00468db9mr41459235ad.43.1793254282182;
        Wed, 28 Oct 2026 23:11:22 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca09casm28523965ad.67.2026.10.28.23.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:11:21 -0700 (PDT)
Message-ID: <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:41:17 +0530
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX1F9QsAyM9bUl
 PpY89LZXtBktQUeRhwLUgUrnnxVbC51eK0K+0YM/uUADcJUOqNkQsVMG4KouK4KIVbe2AQCd33J
 zN0/XqP+HV6h1GvWzcgE0DVLEOBO93Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXwuy8cl6I2H4S
 4RMKx3Cs3Pr5nXlT03bWwZiVQxr219KsWk+eUvwWRhdptXhYgdMrcIm+D0QUpFceWtkTbJvpRwj
 LFeN637E7rCwM59VZqi+HV+Li68FmBbcRzRHfhwgV1PJ6yUAGFeN3iC/igH1qLzWhJ0iGk86HcU
 hEEY256Qfm4lZJ+xcVlEY+OPPpIK7kkd/+a5//mlHkcW6hbXiavklA+7m5zoQJPzPyf2uCnXJ1e
 2k2IabBZr+VPZvyB3SY0qfewymajAbMSPaTbKz/XpFaFyIsQP2WIMHaJEJ17IceE9ayftAZqaRc
 cfoecplivS4/a7rxD6cx71o9EMfb0oShvolu2T7cIrQXXyWS2Svuw8VmiejoD3H1GqxzNYZFsR9
 kVWbbC5NfwC53YKAhRLaTaXRhu7vVzsYV6BarQp1rK8DfleBZFScOrXucNZt5yf2pIH+iFRMVnc
 1ztIKOwjOPLV15f/oWw==
X-Proofpoint-ORIG-GUID: dUgY-WqtBipRCfLQhHHdA-UhYSdfSGjr
X-Proofpoint-GUID: dUgY-WqtBipRCfLQhHHdA-UhYSdfSGjr
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2e38b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KJAbbvmr6X-roC8CkJgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023



On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
> On 10/22/26 12:43 PM, Prashanth K wrote:
>> Currently when we perform system suspend, the phy clocks aren't
>> turned off leading to power leakage. Prevent this by adding PM
>> suspend/resume callbacks for the qmp-combo-phy which toggles
>> clocks on/off correspondingly.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
> 
> Well this still leaves pm_runtime_forbid() in the probe function..
> 

Not sure about the history behind this, I assume its for controlling RT
behavior from user-space.
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index c39ced168d03..f624195c9b84 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
>> +{
>> +	if (pm_runtime_suspended(dev))
>> +		return 0;
>> +
>> +	return qmp_combo_runtime_suspend(dev);
>> +}
>> +
>> +static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
>> +{
>> +	if (pm_runtime_suspended(dev))
>> +		return 0;
>> +
>> +	return qmp_combo_runtime_resume(dev);
>> +}
>> +
>>  static const struct dev_pm_ops qmp_combo_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
>>  			   qmp_combo_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)
> 
> You can instead do
> 
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> 
> and as a related fix, we should probably throw a mutex guard into the
> runtime pm functions
> 
> Konrad

Yes we can do that as well. Will update in next patchset.

Thanks!
Prashanth K
