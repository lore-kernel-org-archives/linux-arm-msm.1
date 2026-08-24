Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249F43B3F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581020; cv=none; b=tQJkHYbQHgy2yhjOPKcqZG9ZadtwGl10cHQWE79+uJwT0NrlYTUJ3d0AnovMH/LBeajAovtfHKyG5KThLucZqdPNXw0Jh8Xa3iWM78bbsur7iQkTeEpkFCsIzArEcGRczIFja5EaU9q1oBXVqfVoZj86FoDLpOcdt133GfpzPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581020; c=relaxed/simple;
	bh=fuz1AwDiVrmz2H6qeqwqyHnsETUV/yZMakfR4Wcq4iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJ+SKIkf41je4SzGXaPAHhDP/KNSv/xexbxK7EffY9j/PfMauPSnRmuVVvuXuuqomnZdy+Ob412BYxdl0VIbExjL2CPO5FiIa4hKZpyB4mdAISyfc7BPeVAINSf71D5HKN77HkRQLYCfeCNJekdfdygZPfqMinV+Du3ZNHMVjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUykcsMl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbe3dMYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUykcsMl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbe3dMYu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuxVs1880562
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=; b=gUykcsMlJeSHlcUm
	/1k6rbBHbuQ/FVBh1Y3GazAmQq3shBdn7oVi7sPnJgLdyxUqwrpk6e0Tbuz74jS0
	YkHs37ACHPQ4Iddobo7q2Cmk9f5pr6/y0cZ5ICn/xCaLKtTmbzcitfnB38S1v0Jf
	J43vMfL29dZY7SC9g1200OzOBWTo8v+dPwAoWnmNqXY3+/LqbAj4QPocFZuWtRTo
	D2WpbNTrijfQhD5yagBvG9YrDrS1G7L87cefcJgYxolOhukN1fSgagIeUEXzs4lw
	w5+0bXASnkEUU9ohV+6ZLaLMe77fUsxmNheJ/k85RMHomwFTtWy/RcxodXaNZTwB
	j1AlvQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf1m16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737ddaf8c57so61104137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581015; x=1788185815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=gbe3dMYuR/Rnfg+5bhYPYCN3r8i9lyPVVTSG3XqQPuT7gMoXX4h56n+4p9AyAjGcZ7
         +hIesCOGkRGDLkkC/9uYe35lZqgSZ1cHPECTbovfKZzOU/GozrILgBXVDnRMQWWanG6r
         Z9W20HvXBzDzOah0G2tkZyEJkF5niPvy62A/ABTcTwcGgSoqrDcOl/Tb8MK/3wObBhAO
         hueO+V/LYl6jrEKPuDAWz20z64ljzK2b5afR6s96M8uo7SmVzp5X8pNoil7C6tOrVPd0
         l1HwbEw/p0pIIrjAx+SK3FPYSBqo7aPyha1/SUMh4yECUYVYOZmfkpyuTwv39D8mMjqy
         9GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581015; x=1788185815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=TRngtoyjFdvqYHHTvaAiN98Aa//N2QCi9xC6x8TQC1VPHu43LI6Ub6RwWVK+Xo/esT
         BCE54wXrNloGJXje5NWX+/Cs/xGu23Kql0G+V1EtKbhRSvEb7Oo1xK8i5dGZoFv42ZiE
         kDS+0D5MXQWPw03zLhiB1rHs08tZHWCdBB52tc+pPLL0ApY0aF2DVXq/NOc/m2Ewuj6X
         lcnrN6hdYJoahI2emH2W2D0A3fzNmzi0SW34/X8hVqBggzFR9QddNpb1jjTkO51iDhkR
         jd6sh4wBdhS5k2PS8oABSyP6NGx//J44ypt7JWKuAFDIzJmVi1hk4tzIenOfGUZf12/a
         mtMA==
X-Gm-Message-State: AFuF++ntpiScLLWZAB+tUl1tYlVxY46dAeQV08WPsYGpM/No4A8FaVvP
	owanfclm6hBsB3docLSYsJIxCkCnevkpoXGCgU4/dQgDa9lLNs0LpH6TMputPnb6H4L3wLhtd9F
	sm0OGqQ/N3m8zn/4CFz2vV3SrB073/VTS6xVFd/P8017NiujuxKl/pRMnT4RjJJJ1gSGW
X-Gm-Gg: AR+sD13osHIx0IPSIT/vQBw/g0v35FqfF/+37vAfGejz6sv5tylq6jvMV5xKWpt6k0q
	obBfiLdkLDrgF7MO8qMkucIQcvNAl7beMDQGcJxNFm4bzZgXHwxn6awhu2QyAVcR0LzVEY9FWGS
	Dew6mWWli/jBIIE1m3XSBA9MglzaMpp//GKc4Sygdan7CH7qDVOwiC3c4NppQJ0uM9dFmU7GMnq
	LTd1fRw0f7k1YtXY8rKB3QoMt9etpBly08ycu/W2oSt4jiidQrAJJC/8aEX/xfm6Is7EZIN/jay
	/4RXD57AH2r4P66gZC2n8HuJpnq0MiC3hsoHwPtFFSprcrbTUR8eV5xbWcpIzFomTs4GQpI3PW6
	trlHrOYw4+uhovVa0P0nJEbyt
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109785e0c.2.1787581014773;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109753e0c.2.1787581014362;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm10832671a12.1.2026.08.24.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:16:53 -0700 (PDT)
Message-ID: <993a82a0-875b-4b1e-bbd8-05fcc576cfa8@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX2iLDCjT6kkOC
 I0jAk/8KAhvUljIf0RgPebQe1loeD6jAbP6EPMPrelmVGpqNuJ1dDWhBaLJYJVtjwghgD54rCEi
 KB1/xdwKontTR1va6CZCVJ/d0DLuzAs=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c5257 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GSCxQli8HqGggX-HJQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: D9PLl9hq6qtg7KPMkQp37AaGy1tD_L08
X-Proofpoint-GUID: D9PLl9hq6qtg7KPMkQp37AaGy1tD_L08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX4ppLawtpfj4z
 4E0H7u05Iv1TN1qnNC8Z7pK4XLTkwCJr+JE+HeEFtnEBc9bB15L3Zr0BZu9XlNE0qb2a+iloBVO
 /OczjT6FYN2yOZ592AZsBBwq9dvc0s0K0d+HY79BdQyvweQ00F7yfO9G531qNvua3dO7nQ7SkCA
 gGyMcSQnoOpvA33+18MMKw90NrxyLXa+uBHrULUig2pPD676irr7H0Q/s7wziUXo5DLAff56ieX
 4NabroQDIzYQ/AmLlYpgiASUdoqsbWPwjoCardzAR7kRFpMu4zJYDvoT2iVfWBt3NP7aNPCI2t8
 PsjoNR+gsAO7z+Mhp7xNtPRSHzSDL7nzrUWLAItHHYGgct+YqlwAEREPq0RQBKywj3y/qbJqYrz
 r7QYGzxBsw7sUgTrZG/xB2nBTZ3U8TVDITKN2TKsBQfAfNjaVgCfvkgzB542IRMljNgrbhaLtnQ
 onXdHwErs6vE5X190Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> @@ -8760,7 +8765,7 @@ nsp-0-0-0-thermal {

P.S. kodiak has polling-delay-passive = 100, lemans has = 10,
any reason for either value?

Konrad
