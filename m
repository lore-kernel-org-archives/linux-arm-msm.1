Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665DE3BED79
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140365; cv=none; b=Wy37hB/9kYmVDnjjossEM5NIaLxydpWIO7GsT8k3A8WQ/6yRVBqg9rNC+vbaGghyqqQoRjDt5AAjI+XrU8aIZOMKa3XuQZwX0Tp0sHBOp1rIcDfyis/BvdFqCtJN89V1gisrFXiCnY+9EfnezsGYoKncB/SgGS9KLTgv/cvifm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140365; c=relaxed/simple;
	bh=8s4Io8pWq3lzx7ckQDPfcVabNJCkzJTutlACkcE9C80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aABq13Brdt8OWzI8Q3BrH/CF8Je1aUm9V7/UeVxBDdvt9s6MZJzhw/iARJhpL2IgvOJhEco78lavVtM7iuRrxHMW8Rsiv18QdGFmNhDyhKRrkIkU8du5I069Al1EcgLk/iN4Cd4vjoPwcCrzxd/b/QeUag+z5hk/vQc+1liFN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiEn3dOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7Stj4SW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiEn3dOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7Stj4SW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G5ft8k4126284
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=; b=YiEn3dOfWoQJA1n+
	kFrEdzdzcWPsO5XKLdwMLTyGgKjPJQA5/T5jWHXQMBmNyFlDlZD15LmawWBWtw8f
	OxWz7XMLcxbDYbb482xREq6zuMdsrNsppZ2hGj1GHrYuygbJQOWBD5WJ8GfyqmR2
	cGxuTtaDeu2f7rezEgPzW4R4WXPBRgEJIcbN1MFe3S+mGwguyDlCsOvaOe4x+hb7
	mhq6yERSxR6JK6HPoD3QIcC9hH2fMbu5UAx9WZwh+V8DB7I3NbcNRSpl9a0Ha/cH
	XZmqS/XNHYdvk0aMi19wGP1LkY4l4MEqUnvfu8xO6/yIfFNzeGOev3zY/CxpwILA
	BHmVwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3kh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:46:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso17350361cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140363; x=1792745163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=;
        b=F7Stj4SW2gTVR+Wldgz633IIBSpzr85VNN1EmLByqgRaaiqFpp2gkMq+08Ej05Lohb
         8fjhW8n1m46BTltGaHqIewZf33oWlYaLHOnWlMc1p+MNxT16SKZocvVwEGfTxCTz3Z9r
         DwZPunVtYqdf23hgXazVT/OZIG0xtOsnHFMcIRyFk5IbP/+vsPnhTLSfatF3IEqDPDWo
         +Sw8o5fObVxEErW/6Omr/RHSeI3oAXa2AbEYT3W3KfzbE2M4XL0ur1tBRRN/olCNSTuk
         6PLSzmTwJIIpmhQ4/QfquQ37dgGNx4swxX97Bk4gRhdJJRq0i5kWRNPK2a24ZatvXDgx
         4Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140363; x=1792745163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=;
        b=tvvHRmaFRWE/oBjorSCc41/v9pnYh9m+aIqTD33kbD7Zte0ER4vB631m9h0FfhQiV/
         XRMMfwG48zUYUlpiODUudNofYxSDmfhDuxLg9ORjfzJ1k9cSVk3/e6O56UZOY/4+YkrZ
         CHJuT1rdVY+X2XYetXEvgIjP8iQCZNfB5HYSz1elbW7qMURutDWZjMz0Dd5sdOlQjGOR
         XPyaq9YdPflPiv8Lp4EcdoUW/Yh0gz0SxbGvyBVRbXoD7m1eG/BHP30J/8H2hPnUrlPj
         s9nd8zrlwvCFYhRm14CWedB2913RN5cHdkD27U/npdKzqdmERPoRb8X45hWYzv/5C9nw
         ln5g==
X-Gm-Message-State: AFq9FYJMLZ7vrp6gSFl7hWswvsU0FdCCGfna+7x8EJn80QuPlV8DTiJX
	ba+PpDBj6HNoyk2cnyaVtsJO7ZB73jsYuNdy4oND+BCG+/NazfS13pQabbeAnurmqw2bMX2z5+J
	ecbZMwv/C9X7eiKQTRbb5BR2Xf9qT0pRYdv9orgjtiRN46m3OsDBNsT0N0J56XGKhmS1V
X-Gm-Gg: AYBFou3iAMKpEk9NJ4ayvC+T1Hvh+rjisL+60q45+27JoFWBE7WTB0jDiI8QF7TDHOR
	QUrK2LwcwWhRXU/ryaFj1fRdTnD7V2UxLFHeFuWVTuStdgCVpqerkogzdAGMkuiRCg3tEtoPups
	Ek9p1S6FkXe4CYABkInkLs6UbMmR7Z4RBTZL3pRwY4S6ZtOKLV6x4LizYMLvbdeNqJZqW1dIrna
	DF3JGLsdFgjo53pN+AFKlG4pmk2WQt0RTKL9EDu2gCw7raTK5kH5QLJQS8uIIft4NecBnvW88IV
	fl9UOvs3ZLWzryObsc4qSxJI6JVrD5/VCT076uUpZyBZSdf7XQ8+PYqn8XePWxVYbQOnyT7R53J
	zd/RVPBiW52DIQVKtBzI2dw==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr423327781cf.1.1792140362557;
        Fri, 16 Oct 2026 01:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr423327371cf.1.1792140361978;
        Fri, 16 Oct 2026 01:46:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm53174666b.31.2026.10.16.01.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:46:01 -0700 (PDT)
Message-ID: <0561f6b1-bb3d-4ce1-8034-46d36e320afc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU OPP tables with
 memory bandwidth
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
 <20261016-sm8350-cpu-bw-v1-2-044ac6dc9565@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-2-044ac6dc9565@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1e44b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=rBtVOrUcsPcThs3KVNEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-ORIG-GUID: R29XXVWdd-kuJ4TiORDuB5SEkVbwrBtT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX5o4W+plQM4QS
 I7JSTPhAwgo80361kGfhG4LNsUn0gQOXjUXR4UQn+Z7+KOHKkqs+2yqcfF50ExxQAZWLsm5kNs0
 1dbDF6Jv2ns+vLkb+WZI2D8Kw/I9zV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX1gHFOtl5kkNr
 +WzjvnzANAKUJAy/4WKo4eT68mB6r84UzNkiGxHNP8WxkwQq6mJt1yR+NJwGeUrxdjZNB7DDsFl
 Ni62UlpozNOZ0wffekETZxjZrrUsgf3nqeHYz5QqR6FjCxTkk8OcA8/ILe9zmNoC9LVbCW3eY+5
 KQovuUNSUHEoHw15cD2Svpf9NpbiG2bewrIRmDXIl2cxOIluLchQbum5fQ1M/M42zIIT6hJmkdx
 4q70EHOW+pZzxQs81EhZqeXNyO5bDhB2iBwk/qvvZnIJhygP+vBzeASPsNQ7O6+tFkOq1qZ2yHb
 72+q/KU95uGPK0GgC3FlFEFHkGFKGnM+VvDfV4jZ+4LXGpCVQwAGvpAQSN1bM0Go2kjpo19e+1b
 IAEDjctIEstGoisE/r1phEmstmW1ICLiAXsoGCm004Gvo5JFXXBHMdkZhqPC8iQMXhmPSbtxax5
 965PhGuYszDO7z/3t6g==
X-Proofpoint-GUID: R29XXVWdd-kuJ4TiORDuB5SEkVbwrBtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 8:01 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without them nothing votes for the CPUs' memory paths and DDR stays at
> what other clients request. Vote for CPU-to-LLCC, LLCC-to-DDR and L3
> with the CPU frequency, as on SM8550 and SM8650.
> 
> The frequencies are the cpufreq-hw LUT; the LLCC, DDR (LPDDR5) and L3
> levels follow the downstream memory latency tables.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
