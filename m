Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19965400963
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766267; cv=none; b=Rv/bmA/NlviGf2VUkMem9ZmUJbRKWY4TnWTqLwrCFm6tOfBO86z1sUbyXN/BPgHV3pIcYbms2Ype8bP0FGUuYQfRPBosMEINJ/7yfW+YDdS7oDaM5qM/JTsfBW++qEHw/ceaxlmd846o/4YDsuVWXPwtReAy1q1rusK4EwYjm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766267; c=relaxed/simple;
	bh=Af5e8yXSwNLY2OSQrodDZamrY+TIc/R6pDX9ZUbVXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyvqkTRjgYnSCHCaoscl9jzqjUhmaSOqm8tYtmtFcstYZUTjD1pPLtWEeeslj9iqjQP8GygTRwt4r1reSqo2RVLDb93vg2M6heFeVKwp6wfxvUCR1fuOkMwubf/AguxQjvGu80yVhHbfGdaUSW6jQWF0eQNXIzE7wQcpGszFUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPzDHuBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqzwAIhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPzDHuBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqzwAIhM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777OrU3363569
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub8FEJScFDDLe+jCWLvPZ6YRZ1bKlayVREYrYiZMyY8=; b=UPzDHuBsdZ/AU7BB
	s2Jf/q0+Sc60c7+j7Z2JdaW93vdzrGN09uxW+pFFT8rRBpTiVgU2LZTpipenqiMP
	oCDA5/EQW/srShamluwOSbjphyKxblC3oF7pQLc8n3zbLC2dtim1XRDmY9fl1Obs
	zsm6KnS7Ebxg6YNV03jV3P9SCoErRBI44OC4/kCbZHG9iReov6Fwi+IlanRFXYZZ
	iyqoB5FuODUWIM+N0tNtgYU3a5wAeA44jJam9aUzyrQ46GoIfHhtwrYJBC+eMknq
	cmn3MSzkr5ZK1fiCba+Xkb3xqBRul82342C7BcYxORJXqjZmDKKmtt/PuQvweqtc
	65TLYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj0sq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:31:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103db79014so10631696d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766264; x=1789371064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub8FEJScFDDLe+jCWLvPZ6YRZ1bKlayVREYrYiZMyY8=;
        b=YqzwAIhMZRi8XjwiPyOBALWL9ViGDiKUzH0wV0A7uCnoAz+7dgXzoI9wm5Wnl52Xol
         +Xei7JvOVpNFhuDADUG1pR1a1TZDfFbo7LD2ssHMnMZwYzYh6D7bONCFArPK55+x8N0M
         Hd/aXh4WkvbjRPEq1VP/P+5hMbwQdYaLWmO6mOrYSB3gepj03WkHEonAQkrw4rFbWRUV
         0xWbOedKnNlHP/N7lw2YuiNMV+DF2ucoNLCekdkLtiFadfMksPJ++RN7tV7qotiOBjIJ
         eMmgB4QM9M06sTR2wXcW5UPJaH95XlRar1TUHueEk4nny9ANbSDiyjIxz/vxa8iiq8+h
         hpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766264; x=1789371064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub8FEJScFDDLe+jCWLvPZ6YRZ1bKlayVREYrYiZMyY8=;
        b=l2XYFrOfSkQ97u4XLYojfFfmsKfQgQoLSH6EJ9652D1KWVg+uml/RNmmFTnXMQonCj
         qRDUiK7SRwGCK7g42rnxqeDxne40Q1dBvlbF8nIddIDyYgS7eXiVGLzBgnInWRquXuR2
         hYls92kLTKG5Bsm4AYv6xfocLkpBmvLP5+JKzVJfgaiLYCynaWnXG0foG37PQJ6gzQnI
         1niWD9k05d5JBGAe9UzjOUAIvLVQlyjH5aSFcj/F9S4n1hOrtjW2TqDar+jTpD3xaKgb
         CFHJAya9/Nu7G6BxcpSREhniCw2aRMW40GcUPwHB6pmtPbtVN46xfVtnkb7wyKE3krx1
         USEA==
X-Forwarded-Encrypted: i=1; AKwUvBxla7cd6x32AY1Emg2CF9/rWBXODBfZc7ZoX0piLz9ehoHGb67pq0tB8yfSl5y4+BBe8QKYdNtyl7wn1Mtf@vger.kernel.org
X-Gm-Message-State: AFuF++mCco9pRn0c5DpINGwPMinIEaDhbsQblQaVMFgvv8rL8kjpzrXw
	FF8vG39lHE6K+XrPzl7I+NJqPdBovWSWHuYG/fSsZKSWZc0r8CY3oJOFjSfAtne5He7eg+Mo2hH
	usAGgBObzRA/5nPvW7H9DTKF0mQSyPmW2YFyEqmojLPie60zBDrEjqBsTyC177wvj2e6P
X-Gm-Gg: AYBFou3F2t41hwwygbfg4tBwNWuAfu03+C46NY4FWi3T2usiEc2ljnHvhAeHUvIr/wO
	J+YG5lwNwEmGVm+xGUqgkkjWecl+x7uDhG1LoDpHWF9Gs/Od18p3pv0vQ3+ujwjWrrtD00L5fl3
	eUHVuwWeji85u6is0L0NoBKFCN/OmITdBNjR3CKXCCaPx3u1HQY9tVLEDNoYrfAvnjK6jICwp6L
	En+/i3knTy0ej/hsi4bv8OH81wwpfQAuP8niLvEHA5wMfR23NBhzE/Yv0efaC34w+QfeTttP6EO
	IVEU9YbLHUtruP/cYs86EhJSnti53wKpP/Mpj2RqQocxaKPKKu2y5/JL9WFXUT17cGKt7CvJTDZ
	gM0NXcoyZILMWu34Y3KtlKA==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1150648785a.1.1788766263944;
        Mon, 07 Sep 2026 00:31:03 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1150645885a.1.1788766263535;
        Mon, 07 Sep 2026 00:31:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm428217766b.63.2026.09.07.00.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:31:02 -0700 (PDT)
Message-ID: <ffd50f94-69ff-49e6-a7d7-3a7c83d2d50d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:30:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Fix the skip_gpu parameter description
To: Karl Mehltretter <kmehltretter@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260906170301.2393-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906170301.2393-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX+44Resz5C0qK
 IWlJp69yvHKrn1893GzeSrh0ttpH0mUiurJ2vjsqTyHjQ4UXx4JiGPkApdAb/ss8xKLvFKVHXQq
 oznXWt59LF3Ihgl9A+4OO5vfmz1F9VIpQL6pyc2kTfAYiTJqU+BfXteoaqtvk8G6myujHBHeB5m
 Qs809FYk4ZsXimR2mAGgC857HWdnoshLtGTcwktI+iX+rc2n1OT3RZF8/MgR+IRl2XjRAPopJPc
 IRR/d7il3nL7JVzfmXGqmxYn9eOk7z2Yv2lFW1OhBfqFN7uHgRXpxhWUHqLrwZD656fPRCEog42
 uPDHPBU2ksndUuu0/rV8kiVYXDSxajGYaJn6VaFOSxp+X3SlUZtEMNznFlbqeIBebA7GKqHSoRy
 fh6SRWXVeV52Lfo8PSfRd+PvXgqW1YJtHesyzCmlQRmwcn4U/CZE72CS+agmqThHAB1md86N/6l
 zCrYz+VGEQoCJfvfzhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX07VwNPpha8bZ
 4ov95vjuIZtNwrolR0Ud5l9iGt+y6hGyuMfxaV+/0SkFr6xlghmfbLIO7SjFBwai715IFPiDXwv
 KaCvp6gdy0EZBGoIkZiJs0eWNt3zM18=
X-Proofpoint-ORIG-GUID: ajUlsr2WBLsUjTFR4XXQjUqbfnwvG2nV
X-Proofpoint-GUID: ajUlsr2WBLsUjTFR4XXQjUqbfnwvG2nV
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e6839 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5ybYm7-rvbIEH7tdHsYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070079

On 9/6/26 7:03 PM, Karl Mehltretter wrote:
> The module parameter is skip_gpu, but its MODULE_PARM_DESC() names
> no_gpu, so modinfo describes a parameter that does not exist and shows
> no description for the real one.
> 
> Use the parameter name in the description.
> 
> Fixes: 3f17991488af ("drm/msm/adreno: Add a modparam to skip GPU")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
