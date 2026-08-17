Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C20429037
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977958; cv=none; b=iBjXA6bsV7E3BOPklcbVzKBYIqQBCCIQtqHDgYs9cqPWJa+lrK+qNCqjQtSiIpilPmYk5a6dA86pPkSvPjp4zP7e8Qx52ndcvOTvleri5EeZ02sXvCpEoM3/sla5v/0ktGlNJ8T76u0T9vz/IEwvSC2ZZm0hmMxlxbEQH5S5uEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977958; c=relaxed/simple;
	bh=tGAuGTMWkft0nCEFvyEeAqJF3j9/Er3FzDm1kAmEHhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhkzAEnojN7jy9rG84ojpv2AjpBzbDaBMe8pOvpf/WzNPKLlygKNjhUWK28CQWWBk34XAMliIvhF4uGlt3l3ndOKA3bQGW12qHaY4f8l2dyJ4pNo/pzQ1y31IsWUZY8DPhqocj6EWybkkgUk+JnwgbPzu8mElWMSkYpcG34K1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euxEn9S3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtCYxhD1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euxEn9S3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtCYxhD1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD66rG2749151
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=; b=euxEn9S3u5zgzabi
	8PIeMIe728TUZlG0v32EutagdjWDta5Ah/viXPCtN5GGQIH+Woovgolv45LwiWTK
	2sT2WDkOG7zcG3y5Y+uSceCCPmDkxKgJOKQyN7ck0XHaO7RWT0M1REdiP+vi7+vW
	M/cDCBz3pka/mzL74QGE46tgUpJ0AW3A2wWs/fif8DFcS2L+sqKQGWKokaKTKuJD
	udVlergFgDqRSex6MqO27/74x7RwFSX3h9Sh4b7FhRrIcbRuqATVjan2qa7U/3R4
	C+U/ZBhdoOi9qgmeesK1GCKztmMIaSHad6vAWxXK5THkHzXSd6G/K+MfkfCuHmrX
	Cuvzdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779bct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:45:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso16523285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786977955; x=1787582755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=;
        b=XtCYxhD1/N6yeLUcGAAmskK2d48xjG66BTe/qHR0Y1u88yGk5IYID+CWUiqmXwqnyG
         uXhpak63S7bkI/YxC2e+HmC1qMbFwb+wtdztarBMi+DZmT40E3gbxrnnyLRzZ82abJd3
         SNVSiEbNe2dO0pn1EB1yja0MwgP2MgmBJAJIQOxoIECfRg6/mG2CFVznrZGunMWgU9FF
         6VaO/sGEQBmPi8IPeUBNNeOh2uTppCJBg7XCKx1SO8mOcm9Yxb1OhkuenlFww4ZRvWWS
         0VoYQc98qw17lu0CMwjdCCG9bQ/hZ8D55t21GnX1HSR85zAIJabnQYrLpYXuPPhjI8QG
         a5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977955; x=1787582755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=;
        b=ar4+8bGDAbnjbjuvTrlpo6slrkpOgkuOPHYcaKIJkp0AdEP2loVpwqhJoG2voMm1/T
         91ZdsB3/P3N2KL9YsjMTj/CrgWct6ziYVJMGo42mB7e6MQrKOQPA7nWqqr5QrtV3JvYe
         0yCH1riWu6W1LgIpujp8x+TLjyQejUQCT3mlgWs/jy9wCvdqYt7cg7wLsvtnw0uMtkec
         L1dtzzr+wi78GJWYqoGI0P+p9oNHwG49zCReV8HLczMPxNztv/b4OBPzdwdOqZveZLTw
         Nm04XERWvxBnpvxs4zWqxHs4o3jlcjqMy9+z+eF1FznAi+WmW/JeCfoM8ggwRLqoIonG
         bsiA==
X-Gm-Message-State: AOJu0Yx0eMRD8lPmRyOsCJXMntW+BgbmmWtqQ9B5WWVbW/eGwxqzWqKq
	2mzfSc5IKcK8j/g+ivr3VO9NzBN/xi453YyGEl7kJeYWyQvGkkK6ZyyMnjtJg4CKPI9rjmsiw+9
	j3OnQz7sAI8fbwceV2c5cv9Tn40bYBDoglIw8iHLEWIqVJu1d1LuR0iJF7iM4miO353h4
X-Gm-Gg: AR+sD13h0kxTIVC13D83zmAbkuLaUq0MOpwet71nzTHIADsduPu+BOn6Q5P8beVst2C
	OMA97l2fgoWSjRqfz8czmQomnnYg4rUjijtxKMZpBC2AYSvB6Vyl78asZLCNv1UAjgUwlnMX51W
	kgUZ8kNYOPz94mEaliaxecRxsPacL1c2qGxc3aqTk7WE4rDj3RcTxMqK6AxQ+nPkQpuDOrIIBOn
	Rdv5PojGeWaBq9DJxtTSAN/bdoFrwg8rtlqIXP/QiYI35gDKSQtBftVsRre5kpNLTL+1BlrMB2n
	9hz8OuzRT/m84olIeIKPrbIR/mJd2aMLKmyAQ7S7eHF0UY/uhQvvGOsRf4/Nzr0Pt+QxkazqghK
	PA6M8TGlwF35wFmyZiqJ2CeHk
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr335649885a.0.1786977954994;
        Mon, 17 Aug 2026 07:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr335646985a.0.1786977954558;
        Mon, 17 Aug 2026 07:45:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73a24sm39987666b.31.2026.08.17.07.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:45:53 -0700 (PDT)
Message-ID: <93fe0515-2b16-40c8-9deb-985226e3e548@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
 <20260816081213.5495-3-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260816081213.5495-3-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMyBTYWx0ZWRfX4x6tCjl5ogXh
 RPe+45uFcRIBtTYbBYhicgfJVe0PpvVzxDff8ehZML4lE0rc8iu7tVtfzHyVuOooWUYmSdifTm+
 z2kTHDZCttTTalJJ6V2dvTMyKbxxGcGv0aJgNYhi0ACOzG0NPSR9lM5YWkdF//X16C844lSWZxX
 KA/LOnt0jod8D4CvhqO8GD6lKlye5Kclp0r6gr7PBZ/JbgQhuUXMtWnASm05tJFdmf3Zk6RDp/u
 8UdudqS2nIu+/I6TFe1cU8BMIj7eVdw1aO+h19a1/lcwMtSBP0zaxtlxtanGYPUrc1Tvlw1Hkxw
 Vu906HLO4DE09fjlNWNOwHdk159vYDumSvsFfiM95QpkdndIamIpD3f63PD+CsniWMVsmqAfAlH
 fxKiWP2CrUvR3F8mk0qKB6K3ct6ePriYZenpOvGqAnAcJREdGhwe30gwvbJ+A7WLIBU/U1cDbHK
 aAwA7Wk8oDxVke+9p9A==
X-Proofpoint-ORIG-GUID: r2oIriTN2blynm0fh6BCE9e4iQVisQOk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMyBTYWx0ZWRfX2F+AwBUaj92g
 UYayusehS49LA+L8rSpqGtnYXc4ew/Yeiewq1NmICjxrjvxsavGsDi/D8SBJ0/rpvjDoGvnS/Ua
 rx/0/cb56V8gxoBZqJh1pSq3o2NnTew=
X-Proofpoint-GUID: r2oIriTN2blynm0fh6BCE9e4iQVisQOk
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a831ea3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=Z0LeWUw4VpMA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170113

On 8/16/26 10:12 AM, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
