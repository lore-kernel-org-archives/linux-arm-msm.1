Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79F47AF6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062524; cv=none; b=fKSpqrOLdgBIe5RF+1INVClvoNEJG7z1g3rM2eKPKGet5lLfrbTxdwZXDYoO1KPAR8aPstg0ANvueiXzFpRRI/ShJwCUJgf9Iv46n68qt8qjWiHg8fb+NdTVUu1vk01GH/ecagm/xp4y0Cw/OJB2gg2f7rzTkm3mfZlUIzE7Jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062524; c=relaxed/simple;
	bh=f2ckxXyZQKuh9nsM9vxf6wcauADxi7RuciAXr8hyfjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBA5duZBijv6R6eT/WsrgfBvWYN6qCcahHbFQgEdGJUfqplhbQW1VUI2u+wilKJpuXwrNVhTDvEPTXm+i2yyzdDZP6ok7wD0E2fcoPXfHZrvbLIGVgxy7AD1Q1lz1GI/eNOkVmFpfnxDTLBD0PU160QQjznj0LT3GJ4G4PPA8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spy10IAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zjih7Kc/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spy10IAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zjih7Kc/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT4r2809309
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=; b=Spy10IAYbSeks5Us
	4lnnfmwbiPTw91h/+TO/EPi+I/PJCJAe5BG1dWIM6cnA/hyu8smJ+NN0zg96kj5o
	nbzb5n38ExrM4lkZ6660jMFaZpJKpekrtOD0BWCXiI3wRDLFslXwRppTdMG0MLK9
	u0p4KuKC+5cuVigijTsXVITYrvPXPr8YHWeSmdU98AZXorsjFGR0VaioSfVjl/jf
	UNX3FNNlp1IaQ4ZchQDV64a0VbPqA+MFuVzQ6+ZnSdtSXxyTRQh1sn2aTiKckAhY
	aPsdILygwprRMkeN6yXUvm0jIlUWsTpX8V7odNv1A5f8/RroIxYfCjgrRKB2z/sg
	l8HXzg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t8c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b89618384so6420476d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062521; x=1792667321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=Zjih7Kc/yhyExhteplf60q3kKdmHpS3WmrS9vwuv81i/hxk2CNYmOgexGh5aR2cKVX
         apM+Ki53ZJ+qq6uQDjeTNuT6GEFN0f90NT1dEmaWDOkSrLSAheOuf0L+ptXj9T4ysXri
         +oCpZ1Z7+OvkfxiRheyY9lw7SJOo51Oqb4ZRf3gwArBtQU/LT9tEVgoAcmG1IuUC0Az6
         MiGDcrzLp3JjGhB5OpzxFCUqGC5do0VNLzeBZBVi8NluiaAOyf1W1pGEzwtk/dzoo10A
         wIv6fBrqVnd0l4xT1rqI6J2hj6bFelQrpbYEBQwS3ncrH6idSwW4+uRQcmOL0NYzDoOP
         +udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062521; x=1792667321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=vtubHrHc0xqs26l7f7LCQ61P74NhFdRQjlDhnQZbEFNI55R1BvVEXey0Q66/BJ7Zqk
         nepJoqSA/IoBsWOIJ3ELTV0C44Nf6WAJm+NPMNf9x8rNbPP+hbhr2rKtNEJE4Amhzp70
         mkjoyuXQ3E4BUg4ju1LzEytrlepoV1q8ifSWbXDgeiEqCjuDu3eghRYePZqKbJuXDlTa
         ymyjz10EDEWDjgRnMLA4o7V6uLqBjR5zt9OICj0XYaSwFux9vsVZnUbbygKp8tmwhM+O
         iLKiMtVhznU18FapG51q/5WVn8yryDBOU+xHi0xCdFPSUZ4jG1HZRpWI7qKHGswuIybp
         3/Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzXB2LJ84dZHOK8gSzfPIGl5ND9Hg0kDtqA1o9quOm7eOHpx1CLX1zIm/HFibk8lYwtymnUafFtC0FOCbnf@vger.kernel.org
X-Gm-Message-State: AFq9FYLQdgIfL17Hc2CBMGrRmM0Dnn+2cOFOBYBNSYbdzKGnLxWIZ4b5
	zsZMo8OXquiFGEQTdL8yV5ox/wHHKhDBVKAMPS5QWvAhXBbEweXc1FwGCHaLlhHws6mbFViM1kD
	XowD3P+8A/XtHoEaMdxUGp/4OEluEwATexgQXj6KpFLFWNNl0b+vvXXr443mGcE6kr+R2
X-Gm-Gg: AYBFou1MqdZKNpwV6NTktBwXUGZbj2RQh5tW6H3YstK4J41BfVhYRh88ZypAcGwbb14
	9n/zik6c5i/oqakUoI2+rAnjd9PWIjHyt2oufoguVgxIhUxxTHvOpYdHRu19xXbTk9FkYlzuwfL
	ZeJT0joqrqhUUDZWHYSKd9Itvbr5IegUCZR5QV+UrGO+tjGScaSxN6O+vngenm/sIxaoH8G0MpG
	HEACQZjt1/UxPZhX3RwATbKU16PPab5+z4v6G+EhWl7u3i8IoPj7yHLUhGlp1ea4akFLrSNKySZ
	PLxIIHudqmOWaNH3VpMgrUTyjp79xNS6esc5Kx3Nu7vaUHo3b6V+/Ui7kii0f5Gijca6DIVU+2k
	ZmcG0iRn/HhE0NCGYLiQnuw==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254355885a.2.1792062521320;
        Thu, 15 Oct 2026 04:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254351785a.2.1792062520818;
        Thu, 15 Oct 2026 04:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388545csm2280628a12.22.2026.10.15.04.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <b1570552-958b-4cce-977d-f04e03fdb4bd@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0b43a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hkRLp1vvXMYqBSLCnVoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfXyR4ljHAyta2W
 xf+4zmc1Fas+syII/YQbTvFljYX8Awpoyx8+4SoZjiXhlj+IL83AS6yS2GGXkM2SDu8ObE0v0m7
 nO3ZmR4k3T1u9dba9rIfm7UnWji9/nvP7CwSSFQKuFmIuuwbzBd2GCUNwTq+XX64SMfUBouli8P
 PZ+XJahMYm9NMh4ALqfxxr14QGXyYxqg1CY7T9YfA12hpemYpVWe3Vo08+fnIHHWbxfN8O/NhLM
 jPU6NXqhXRXUGfzghaQSLTRSQpa5cE1VFmzGRD6KYqxHThstLnv76uz2Ng/cRJI2ADiBgmnvcTO
 8NtHB8OPVBystKT6+PhSWLX7wRoqybH7vqn+SFVFemXcs3QI6Um0zRSkZ4KV/dIpbZI7GIs+g6Y
 YO56dnNCOan7/Bvu2Qk1aKDVnRMKI6u0mzTL//44ClzPYQe/o4J7CfL5+G7kWESmaTTDQZDEZIp
 22DdYDI8oVCiM1Q3HOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX27fmEOTrxKH1
 MVNyepCZM7Nya6EIT0WzqNlN6io5XzeiGq+8Ufkqtdm6869dFR2S2Eqh317l5+xKe7qF7uTVLpO
 U/UoYPmTiqORfk8b2X7zxQWJuxdE38E=
X-Proofpoint-GUID: TK3z63dR0nq-dOP64huqG1i33K2aiP5j
X-Proofpoint-ORIG-GUID: TK3z63dR0nq-dOP64huqG1i33K2aiP5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones

[...]

> +&swm {
> +	/*
> +	 * Nothing hangs off the codec's SoundWire bus on this board: the
> +	 * speakers are CS35L36 amplifiers on QUAT_TDM. With an empty bus the
> +	 * controller reports port mismatches and frame-generator timeouts on
> +	 * every boot.
> +	 */
> +	status = "disabled";
>  };

Does our driver need fixes?

Konrad
