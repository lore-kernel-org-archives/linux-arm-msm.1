Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421581;
	b=JSHUXp5fP/JGELY+M4T6wyL6jKfXeRd2FAqZ6imYmbOBLHHstT1CMgQjeXWj5G+yoKV8
	 oyxMkuVKSfcZdLhRMI325OgqNYyGqli1s4IynLclsf8zePhEZGL+H3xGZnISTww07Cnuh
	 AoA7NBZrxIJciz8GCjnzTgTv1VvsovFKIoUrJInvtN4zm8xFFsB45Dt8LkgLIgNbx3Sz1
	 T7k68aKx/0Wit+IKkAeTR8fwLpaflATGYp5NScT2lm4BnjTAQMHNXMFTI01WO98FzeY24
	 gqeHl+RNxPcnXqwxrUwAmDQljtd58SlD39Of7CZbBJLJ+yFghkgxJo5Hx4bvgEsC1mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421581;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
	b=uk6TYJ1SFYewzCA4P1H0ho6K5nCgGNwmzQLm0txqY9WfYI2SskW4jWvg2DUeA1O8DGLU
	 tPWIfBQoJ8uAxsJzktjVnLb2ghcRJSGBbT+4Fn5hQc3CO8rjXNtcamj0GqoqINbu13DD1
	 PTr8tS1flJEidx23AkebyOtmvj34oalRtxD+xrRB8mlem3qCsuSc8hcQlhJYa5n0iSMSq
	 mBATGeeDbvibiWDd94cK29ERVJiVzTfGkpH7RFOvhV9rJxO04gPldb5QdDJ4ryUAmAENy
	 WRiZkRauCDjKxFXL2ziPBHO3YMGvtWXwqy+U50s8lJQ7VXEfJ7m7/9/qNRdCbR+r95w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E24606AAC6
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE54DCB23
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421581; cv=none; b=Ketf0L0zUlYSbbTHXQRn030DL9tFfkLRCLq/zN5tNPzTuxYTVJ5WLJhu6+pMFpm63BEoszjFAPm95ZlgDEOzSmBSgAL4gaQvyNdnFAWtNkmzz/WMON5cwzWAp6niL4ELwkUJ0C3JctBGULa/+1tNITxvNYmQLfcy8QA04ATvFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421581; c=relaxed/simple;
	bh=Q8ELXF6LLbtqADEm3zzC52Pu10rc3XpBpK4nD5ZwOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB7APtzZWCs1XD527Dpr9cP01uvd5ujOBsAPL6ksKHtipqSlsHGUY4L2N4NpJDgXuly9Ji1kHWay4ylGdMth+9YARbLGPzSC+ZFUmzsEp4WVrcdTqb5bKkyMzzdMbz2JFlOyiYrIiZ5qMGQvRTtNiom5TaeGTrooqWR3rkgYlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pptyslek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP+22tCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0IY03401105
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=; b=Pptyslek4ttLiH5m
	QQHolh96lkqa5dPpnl2zIbUN3kvq6bimL1s4DNm1dlnyH/0sZcX4KF+RHNiH1m1j
	rUusEkRTyh3ZrSGbYObcBDDDiYINkGr/ciZ47ih2biuwHBVgJMtTpCbJi/OZIz8e
	g7YFqFwIkJqlHbzwVxk5EnaEdH86nUgvSWNKjVC7U+u84ffDstcwA7hiA7Jbuubg
	/DrgcdXgMkjFt7Nz32G1s6clnRTtgwtROq4IoIHIWizxKJVsXH1cAI97XZl8pYoF
	xVQqD7aiGnQaOcpq6kxo3XDpx4n0OfkZLv3JjD+jh/UpmkxtR0+J8ij+QYgb0mob
	6CkQOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so60063285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421578; x=1793026378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=UP+22tCeXsHmvSoohOKJedsC+lnLk3AzOE0gsVg0VTMaftWiE9Jpchujxo5Q7RfhQ9
         1guYbcqKA0yjFJ4wx/2j8CPYQNO5XjPVX/kEz+Ac2hPhuxqnViWLIfEoENzcxYPGCUDl
         26tg6vAJXg7N4oGa6m5GQREDqfmQ1qAwA2oOt+ZvWTs5kNrXPIne/T/WNtsWKUWk7k/E
         2At610cfYw/qSTLuWvoVGeXNN3Sq4QLOW5a5HAm4WrD+vcptF3+ySpL6qbhlRNPU7JDx
         oLL2zFlj6QzEag3MhO2m7I3bfRKBS2EB/SIi0mar5dq90C8nPFsgazrB27RQYNXk2NVZ
         HQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421578; x=1793026378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=kvox+/Z405umE/0UVHX3r4Heol2s2gndNba+t5kpNi4OWQ/J8ggHnCqR0pp40Dllv7
         CyLuvnta7VyXF+VdSA6Ksr3QAOmquX7i83fyeah+csQ0GAVgvoU2mjtAgH+Hm0OTfjiW
         d9lR1TFxRwJYL4hmuwZTiXv1bN/FpsHdA8urntUWimhJSoEgmihT3S2XopnjqjuVF0jy
         uakmx//T34MTFsdvZRXw6OQYhY9BDmJzdvcsn8Ycy6amsgzv8dgyzgoDkeswbmUe3g/o
         D6HD/Pmsf7AiA4MyZl+TV/M5dGRHk52UECafVsdw80E4OhYDse66xFYMBTZofuPBsaao
         z7kQ==
X-Forwarded-Encrypted: i=1; AKwUvByV19dT0cIgP0YC6fd8ElR3g/nILlL5iRZicJFSi6Za6Q7LjSIoPdS/xX48wCXx0sRg0kBjDWnQqTlEGtQF@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ7koXOlheFeVeJXchwqNjMPZlFYvQBhVUc/VZhcHWvDr5VvTp
	ciaiBwGBj7TZsdPu1Zvf6Grcw2rLlFLRDXhZzSI6GjXVjx6MCEDybp3hAkvWUVIFngkU1Z4EvQd
	8EB6eZJkDKaUSAtR76KpZk29276gLFyht7cbiu80KhQ2tUU6OzFGa+ZTEhrIH37uiW3Gc
X-Gm-Gg: AYBFou3PJZX7zQS6kgrLw/uBQlcA12VaUBiIlX8OoaBAjO9d+pP7X6P8HK/Yvhx/oQ4
	5VUY8Qzm/OVV/Imc7sokljIBeJV2nbL3a9283Msqajo57bIHM52PMLTJo0kM0Np+uhGyB6QYh5t
	okT024KtyhxcL5gthnqnXnwCAfZSCjk1FI9y/KcqX5JUZdW+toWRVBvPT2BkDu/98B8Kc1QZ/D0
	QfaDSChT7STaMnBJoVYpl+TiMiuszIpWXg8L+18b4IXRaAjHzA5qMKyWT+eDxdSgr6ZxDvg7llB
	hSwRRbytqzyfHSR8NPGK+e1B368kjePV/9jI6ZhMwj1sIqGJHZMWDHrNRrFLBkVLp/OvAlsgc1m
	OCkAdkcweGCkkr776q99yuQ==
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459382085a.6.1792421577986;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459376185a.6.1792421577483;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:56 -0700 (PDT)
Message-ID: <a334b115-6fac-4417-b6da-fd0a2e5fc43d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:55 +0200
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
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3YoX02yCjqCz
 50HRRfn5gNPheIQOCpmquZD74rpCw4XXsbfF6f2wHFSP4IPT06i4hliyJKH6TzbV/miag7iOD6l
 xWNIHO0PLTylJ2eVb05lbdOs1mqFLTs=
X-Proofpoint-GUID: ix3F5y-RUrhfudM1ZdUx4sO6ad09ZGO-
X-Proofpoint-ORIG-GUID: ix3F5y-RUrhfudM1ZdUx4sO6ad09ZGO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9dX+CynBeji0
 X/xL5BKs5WDG24nV0aD6/CgXuWw1rjHEmMM2KA2iml6MfoH2NEwIJrnNNK53mrhwzUPJ8Fqlwby
 /PmBRnEGCMky6l/+2dN5kUxUveLC/3nB3xI+bBiHgpyzllk1hmHGjjjCO03eB6zS54fawgKlKCQ
 gCnyIj2ItGLQQX9/bP3WLal4SWpSkYDbGIkzSENyR34IEQqAQNsPhccDlQs0E5ZWXmWBnE67mvH
 IMpqXwJPUePIO0M6nHCZfP7GVCVTUp8+dIGU9fPHTFSZsJAb+jKcVOFnDsEwoqkTGfZa45n4mKS
 IaJbB9+rhAhutjku5VIXVDf8WqnXqhuORpO78hkp0PaM1u+mGNID8J2PCEzv+y8d/wtMwYayyf0
 puCKn1w/6xjJkJkfVGxVC1G4EaB1lVMMVyNkio5E6EOwe3vPcHqrZUysB0Kuydmg4O9ueUgGWLH
 N2iq3xuT1NO/wG2sUhw==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62eca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
