Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769350;
	b=ajit241Qebc6oOQGrsnPd1+AjBqMq9UMD/68PC28H3wvplR62R4i6n2fTQjs3869220G
	 qhf3wek50j06KX5qAi4g0VGEe2EJluuu0474RX6k2uY4rheU/XxBgCnhQRHdXCsQ8fXhy
	 FdU9m5QJpRHzL0S40a9JBpFpRlSXnYr23toa/dMtDcvyhFKaYt6PJ6/dZm4tWR+xdDJC2
	 EMmL54WGTjy0wJgCSerFcpJxwjFRwl44ZcaM5qmGH6mLhVMtwJOi2oXkrBsYAOWlUn7gr
	 eUe7eVzWTQk2NiOmJ1xbWHBPrIk55TU6xhQI9KefeHBRS/khZ156bWcm9txN8SFjUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
	b=HBh45RbXoNtkkacziYP+qj/+K88382ce48/J1JZK2axkN6VJAk56giqphGBttSXfPzJK
	 J/PVnGVw2pbVQaVpDUu/i6YYr1uk9xT+XypC2p9dvkWiKLH0VSVHfIm3dhb9OJkQgoa+l
	 fmtgJPuR1E+HXIRG3KAhZHnCtwUTIRlbbRbhu/ytX/EnVs5gc3pGGVFvfFKjjHnR8rm3d
	 o5eBeNdPiTzQ6yQ3OBFHu1WAeCqZVBffDDIRHWRrLvV4Ygzagc2HdSWipInGz0rDuZVTF
	 YIk2+eVQz5a15FmhDJQDfArOT7FsVAGmCwrSd4XEtYndEuU9MhKN/G921q1uROhUO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GOe0/uRS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5760A2600
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F5760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOe0/uRS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbFp3983840
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=; b=GOe0/uRSkU8GHkm4
	jfY1ctRutj19A+SOZUVmlj7w6bpKHHBs5Ul+CQoIEquKlzW3A5X3C4qF/g+mxVmt
	y+6XU3zuXX1Gw9LME4mZ+dP+eM50S70LnO5vRK9hdXAkcoibfxyi7oiHuZm9s+IA
	+dS2iIak2VcDw5LrJf64jnTzVz9FxAvEVzNOga/MeVrp6OqJwCniLmAoRYhTwk/Y
	KYaZZiV5b160jBOWucV5PMB6hdUAvQ36DDDZK3NV/lhammz91I07v2w4kM4OiEUl
	ax5F19uhiTHB8QtKE2dTt4G1DbnDpMQFXkxLWASYOHpuTJJXHcssKCLhmZRvX+Bk
	CG40BA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso559546685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769349; x=1796374149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=E4zxEdJrYDJcXogKPmvBdZQm4r+9Q2zTkUqftWp8GhTnV0w9T82Fs3XjKBsn7EsobO
         ITE4I32R1KRQg9UTTRLGnYRMI0ZADJ3sHKXOUMcxlf6TELNRCRqPSQt+S4U+T/zkPgWJ
         BbHxZIQ4OBEC8wzEjXTb6dAUCZOe9aBVXYPuO7dejzNyPgWEVpNSFZ6W/FwTESTTWJ8t
         qaDIeim4INVkOJdURvbl8r+EuOUPpncIMc3H/DiLrjXn6U8Tu1q30oftnaFSxf6Z0RbI
         Q9fDL4W6K/eoYniw+FQDp080gBXUfAF8FcC8yRIrC7Fe5SpI9YY9a9tQ+6FUHJZUhm0A
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769349; x=1796374149;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=sAcm0dqyjCcAtaTkRmow62OAP14FuQr6+iYTB0QMZ7sDHgbtoryVm4Qnq51FqCicrT
         cbJu62yKX9ee56zgLq8zUMr1l9zoPa5uFh9Pb7ghksNFACzpDVQMLQeSWUeHF3TAwmrT
         hWD8szt75gGpObdQAsMb38y9NQ5Em4+FmHUzQxgQInqIUsA8mPomqhD+aXtUHerHPjKn
         mD/h1YIaBcx0O8dOTp0360O8Yr8qx1Z+W1F+NsOL7DuhBUZGCbdATC0PNEhumvRR9TgU
         sQ4t9hxgpRp7mOuqEhpao/dMLWf1aLI3KvVStNZI+caNWht3tn1Z3aJky1D55HMtYSrH
         rHOw==
X-Gm-Message-State: APuU4Z+Ro8EwIQkBxJ+PgJrHf5mR952IlqmQzepEZEVrWvE6wWQFF6GB
	9AwkkOpD+m29AbY/Atu+KrvfN0r3DABfsxVHj9VCkQFkw/RCLh3Nu+kZjuhifezOsLFr/J3VOur
	M8nwizla/oSTc2KySWym+7GDplXSj7+AK7w4ijUJaszs6ewmPCN9JlLkHkO9982qnGJKU
X-Gm-Gg: AZFdTZeItoYdZdvOi0QggfnWNkxjrVvpsJxcBfRN/b23sfXX71D9G12kVKSCbNrnqyw
	5/o3kDX3Krb8QiIjwAnBa0DufHekfzPcPlFp93qBuHFKTgejmmoBO/nfAJJS4+Y0QHH8qJunPeG
	OGMnn2uJgikAaink/xaVec5/KK9JT7cQ6TCV1bA9yDbH6pZK313sGtFXNpsGMNfwZfaYeAyLumP
	hzFdpJboGE3hDezaJsOZKTJz4ju+Ka0wE/NfiUr9erCQel8hwWPXkZ/LM1inWk5IV6P9nt8ZJnp
	ggV7B3PBzfE7HFpUCjAsPWfohm6e78508Hfy+emoXPEBGY26kBTUANlOZBXiTmXccVDJ0GpvTgJ
	Imco7DTb14KqNqyXKqM+5EEq84uxhuYRFsFH+TTbkPfDPBXvboogdtYr+95VEPPiAlkrKPXoFI0
	0H4A==
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923739785a.50.1795769348597;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923736785a.50.1795769348204;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm821554315e9.6.2026.11.27.00.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:49:07 -0800 (PST)
Message-ID: <d24318db-c2a7-4bd2-9216-1ed5eb90a226@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:49:06 +0000
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
Subject: Re: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and
 WCD9378 codec
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
 <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5ph9z6Tk1AJn9v7XMp64_PRT-IGbUPCP
X-Proofpoint-ORIG-GUID: 5ph9z6Tk1AJn9v7XMp64_PRT-IGbUPCP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX6pVMWfjBc01M
 8N1RNcc9I/zL/zfxp4vz/vAdPKo+294P7230RKzMI5w6e//wRxIYY5vRHompPRvrTGv4pBf8d9K
 b1KLEZTMHaDCbZPItQ7anYwuoUcRP8A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5eUQR7j3H5Sv
 gFtromnhUfYHAZkBvTpaCn8Adm/xg4ENe1BUvFCgBmyxLXe6fhGMkA+Z1OVDKx2G+f1NYmLwO8I
 rL1JnydU4X+IRsj2lXRPjGxgqY/uY8cSlKQ20BIxaaO3fLwfTocSXLKicR+jJWWVZfDWqNLtxLA
 VaaRn8rZodnleHqaLhCSt2ApTCF5EuKLtsfX4/ndf+dMA4SxfMTI8t9DRcLCQ3iFYk3uw3T4KBV
 /XtDoNwR3+jScBYbqZiCG4Q7JbO+v2U/EbmA9oVN+uV1DHNMr7igq+snd6umwHvuS5AS3HWHEte
 EWI2W2wo5Q3MgLkL5OZj+jOnqsmroKJCBOOGu2TnPmAHefR0argOoHlAD+atFuldHo+8BKMaKgD
 2GlyBFC4HK0ssfi50QZQBnkaE1jZhkQP4p/Pe98W98GKJA8yd5BR5UgLXSgXmkdARm9pjtDlt4X
 EyVNGuGk/zBcqT/e3cQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094405 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=R3xOvuxQfeku2NNc9hcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/27/26 1:42 AM, Krzysztof Kozlowski wrote:
> On 26/11/2026 19:38, Srinivas Kandagatla wrote:
>> Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
>> CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
>> working headset audio out of the box.
> 
> All of them? This is board specific, not SoC, thus please name at least
Yes, this codec using generic sdca class drivers, all the glymur
laptops, like T14s, A16, CRD and other models use this codec for analog
audio.
> few upstream examples.
Sure, WIll add that in next spin.

--srini
> 
> 
> Best regards,
> Krzysztof

