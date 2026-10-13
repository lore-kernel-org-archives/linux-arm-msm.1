Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653C3E024B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888158; cv=none; b=hi649PWDSvSj9NivpsMasBA9mH10PCqBSbsOOqp7yQMnNlZsHpdd2NA/eb6WMdh3zr8B8SI5TOsanTg7pIxXpZIHveQ9+uVXmFi9gE66LdzcbFuDNq8+k37ZkaoBBxnvWH5tCrWfQjL4C8CBtMV8sOK6rSIdF5jjvQ8bjiXF5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888158; c=relaxed/simple;
	bh=IU2l499EXoAxlldXkE2GeCQ4P9czIcPp7g5HYeYvGxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvp1istpPQWWN43vQ1RZZgx0k0NsVbyqBahHSyC2VWZaVKGsB+clLacrbMMlIqsvghmIUBYNxfRwHYr7ZOlPFPhc5Ru8E6fXeyajfGT99iLo//c/eDju4yOQ1alDaowCSX7GyvUDCmjPtRfQEKFquG6H+uvku41rHV18UEe8L7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bots7mYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JupnWjqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bots7mYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JupnWjqo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CUPc949467
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=; b=bots7mYeXySrmqK9
	+MtxRaKtc49fFiQ5eGaIDol7mfJVOxkbrzj+KWg9hzLidGDKKaqW1ksxExHl/W3Q
	ozaTk8nAkzf/dzifYNwZetj2FN8IicwYA0Z/LTKPMrFYurSefghBy21s8tPV8R+q
	o5L//j9iaQO2MJx0NI7T04XBfboFmE207PvHpQtmHYKMMGS14GthAX1d8EoWwKC2
	JuyM2KN0Fk5IdfioJryBiYDIYNyraySu3tabzWBGtJdeT8PI+z/66W+C3W8xps34
	7DRDTFyUeew1NTGVOie40RO2QhIOx6LHaNH1duppw8WvM7MNv6ZQVAxTH5x0eFwO
	tNgVpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6294jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:42:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf3eeb42cso19192385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888155; x=1792492955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=JupnWjqoZ3YO99dwzQT1vjNKEtQEiMbj2VubTzZK1iLvBABOPB07lMJgXAwjlnbcA9
         7MyrJZoLHcvDEEoF7bi7prIb+XglyU8lSWHcX3oujl0AcdLX1DkzpfJwTXSKeCuzsnMF
         YL67iqoRHM2scLfOaoUUnAaMT1A+alvSh+uPts3Lype0o2oehun85rprw586TeUu6qOl
         eMGKrRs6EAfokbPZY3GlLpLyvMlDDVmnV9zgb43gCHLwM2CFIzeZ6Drdd4qT2i9xSdLf
         2eio6SagYx71bJWjcWULzkZs7hGPDiIm5WJjHR48EkhVwMwKTpumFbPUPTRWfRNHwWQh
         lHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888155; x=1792492955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=jWVeD2K4aEVDD23yHCPzkkEKuprATBo9Vy6dAg1O6tz7fbjwPL2szuIloAkx7t4myS
         9QbnuZnvg/63T0urfSRR4VCafOVQuTT2/aA7INcRcaz6CH9nmlA29Cg9S1MkI45t+cTy
         m4GaGUuYV2QUlakGJBcQrTZVZfQQeqPbriA0ZSxtctu8IQAdj23ZLzKstRZNXpAPxM3W
         c/vmFiCGvdGFhj3wdK5czZg0GWpioWFWNzHrz0goDgvTowUY/xz/a8LHnmywvoHAGH7v
         vq3GXoiWgTyVNnxxtg0VpiKyZInZwR6LAGqkTAu7Lph+lNsLXKb/AL8Hd9FK5IRmzhgd
         109w==
X-Forwarded-Encrypted: i=1; AKwUvByoo333zHXHtduFR7x9EfSbsZO9iWl8TPxSsla7XDaEgTANb0AfBl5R+xcEeCyniF+hnCqxuq9wIMF/cJCs@vger.kernel.org
X-Gm-Message-State: AFq9FYJzq+aXqNxzxwNhSV6i5z/+1uz690/zUbirrAHa5LnUcoX8CN+q
	SF+ubNJUfZ5GHDC4UTjbvtN32Ua5dqRU2bdKh1FRxiLkxvvF4Gu4MhKCDQaUb/Ug3aiO3qtw9BS
	rOl8Z339jToQOiZcKz+hKW8BL0DR3L+gjPTSFSZDezORBaLeoSeuD2tElLfPMItBQ4+IX
X-Gm-Gg: AYBFou0OAVQhCZwEGfFcRDr4+ZJJSDgl6BA/zWDfE6fxiDOiPMTvkbFiRIQNmKzZQWc
	lE71Tqr8P8GmnKhIr6AbbhmdlwmotkqCcRUmR3O6o/QsPs6wDZd6luhO1f3M0aZ9FRMiBboFw5V
	2LkXUukOkcILCYMsYWReeJNXfJCLcMTYlcoZGApQNMSD/7Cd0uMUTm6yBWJi+fCHb2eHQjRpLxh
	qeh4CAlgQ7cbWMskpASrMTp952QxkpaoTc73G9JTjpk4JdkPdK6KYPNoen35tEeIIref3Qf1F8+
	0bOi5+wK9/5DQVvXUa31jqpo6/sWs28HmRhTCD3Km+SuUOww/Jd4kheMjr60g1GDosP2ehncyy7
	SoPbfzu4qRCmK5NCOnuLVnQ==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255082685a.6.1791888155055;
        Tue, 13 Oct 2026 03:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255079985a.6.1791888154559;
        Tue, 13 Oct 2026 03:42:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm63300166b.30.2026.10.13.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:42:33 -0700 (PDT)
Message-ID: <8a5e7e29-4c15-4547-a6b2-c6ed529b13f6@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap
 no-map
To: Benjamin Kelenyi <benjamin@wendy.sh>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0b1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9KSy6GpRFk5DsmjdiqEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX0XhpG9A6GlEU
 ArLqo8uJq74gIKRXuRE+7im/JCElfsl3QiZdomCGj7xg8W6voaTeXJxmDXia4I06GumG0IuayQ4
 Tn/OZWtmWRgcGcC6Z9VVBav8OvlJVi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX+6iUjzcfJFsX
 tELsQ1D8tDleM2HLk3nelEEOpalpUSMwEHiRcHtlAFp9gQYVVTw1l694itJrti3XAZRINdV+Esc
 xgM1T2ibbQ7eMtj34l1gAatwp3nYLJaCbXXRakh9dU3HWM6opo85J+S4as2X2rIYTnkw2di6PYu
 8fyehswVN5/T7fSb+uT3IzQbi4x9grN2YAZluQ0TRLnRJfMKzAQnlvKVVKwWv+PvzfjYiQ5STOn
 Y9Yn+uZi5pGvfCv68jzLqKADbvD+30yjRUlEYF7r+N2vALXmvkGaBp7RByFHcP7fvusVMIspBbm
 ps3AjngONYWUNaNo+/rRNuozU940RvSZ2lrcRzIkDI9vG0b68hHbo763zCMsvVhDVePPRaURzU+
 zsAGiK/NFKj3B79V0y3ShTYIkRkIdkDmbLoIznQBUxZjDQFqPHIxR/Yc2ZJoE2+l7qHiNQ31Ikt
 d6N6q2Y+P9pHZGzUlNw==
X-Proofpoint-GUID: 45M4cN08RDyoY0gJvIwcieMXHGjBAp38
X-Proofpoint-ORIG-GUID: 45M4cN08RDyoY0gJvIwcieMXHGjBAp38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 10/1/26 10:52 AM, Benjamin Kelenyi wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> Declare the heap no-map, so the kernel never uses it, as the other
> platforms' remote heaps are.
> 
> Fixes: 3fbf3b85bf86 ("arm64: dts: qcom: agatti: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260908070331.2189A1F00A3A@smtp.kernel.org/
> Signed-off-by: Benjamin Kelenyi <benjamin@wendy.sh>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
