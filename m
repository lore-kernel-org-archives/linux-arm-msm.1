Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D247A4562AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049911; cv=none; b=tDG1+KLPB8u1AFIwc5EWJkIPn3DMhXwXl6KOFjbLTndKeJZMkCcWgEQBmSlPz0dQxks7GJAq33kQR4uHwMoYxfWtHELOyU6krRHEwXqvJNimBRUV5vNELqD2i0m6SlGLpgPtoVbUpohUOqhNXNHHUlPwYzew2xNV+0VaqTv+gsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049911; c=relaxed/simple;
	bh=rVoYBv3fBgEBrkPq42bqgSGwNns0dc+7cqbF/US773U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qqXxW5TNb6igjasz3TGg8mpPEMoPNNxxGcmTgmRNOJVkVbhEPgUFLbtwzYKcQEPFky9UkuViyYV4/amsG3UwGpxMuLZDwcTs7jnWUq6xIbczuQpQqI/RCVTmjjc+u+oiwMe29sN2OOxzt9pU0YKCOx3T9fpWStVoABurkoDbKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixCJEtnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEC6JGXm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixCJEtnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEC6JGXm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABaxi3979146
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxwR2/67vG+z+lSwPYPAgUEvkCbjHjSIX58d7WwEMG0=; b=ixCJEtnGrdrykqUn
	tmTGMHIC/zfoTwjWArPpMA5s/8ALCydXO7KRs9/UD5StISTOK4XixCtlx0nKtDxW
	DEG+XbyxuxoPk5bX1f5+GsVF98Ogh9uiZ8wPxWg0iuguX8gjRLvibcCxgpQa4/mx
	ASrgGhQMYDLU7acAfAfIetVKkkAisWlAwnJGceQYYZ2dka6tYXc2PQYojitnfmjt
	EIWpJ+TIcYymKXNC8TQTAfgqfFqeYZpjCxWafl1TSf3Z1Mss5UMTiNvyTFvpHuu6
	veHMSW5bpm6G2xC5d0W9nKTNgSZQm8v9ubUIcCqO8N/B0RasgIPB+ZcGBAbfjewh
	O+6AFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt0wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:45:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so123192085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049907; x=1787654707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxwR2/67vG+z+lSwPYPAgUEvkCbjHjSIX58d7WwEMG0=;
        b=TEC6JGXmiw1MJg4rrhPI7n/KdZZ7AOmlUqFhVm4v7TbZvIoIGNgXaTJqNyRhfFNStT
         xbJKX1UDdhfzzjZGLqMg/Iko6ezPrtPw0Ug94lhD01RWS/OF3+z2mi9WJ6ECfyugfpCh
         lNjGGJ/OqFcIXgxlL/0JUQZR6owb17RqLw9ZbZ7qn5vlwo8wCWaLbh+Bg67xiWvYl0Gu
         H74UX8hEdObUGSWH+THqcaW7HJPVRbVN4wYuk7WNYGgbk9/VTMK/F0izbmJGChmbF+Jq
         n4vUH8DVOifA4VOnR1VylRbvsMT98uFBAxQ+gnE2ujAWnwnJ3kliIcxl/dTitSs82I9T
         94HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049907; x=1787654707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxwR2/67vG+z+lSwPYPAgUEvkCbjHjSIX58d7WwEMG0=;
        b=iUBSeMg7/KSDlwgJvaSrgg65NvUapxvWp69fpYa+g2hEfYxkqJu6F4ZuBjlNsACF6E
         DD4Ps+SzcJZiZdSo1Hk5jXQlm9JlURdV6YXnnTmqQDLT45eSU0Cok5V3Pq5b5BLS2Egr
         DA0Wq9m0CtsKCMdlPfjEtFSGVI6WudGN5LIRwqEcEaf2zfxW7sRvUvF/KD+0G3Rfdw7f
         82v5kMvnXus0PVyAwP/93PcEittJVMYJ0LF+1CumUpCg17tK7Xa7Q3dyzIuHk8CA0iqH
         lWKnIRRlH7KjEx/PHqXi6fjtKOWpi3bXjyrpVtRqQykyvJ6pV4pUB3G35r0KvzAjww3U
         5UcQ==
X-Forwarded-Encrypted: i=1; AHgh+RohsORQ60ABiFvJTisaGf3NgbJUbkhjJqzM4FsoVlnbOvf3q+kpIiZSoMI6XuPird9x/Mg0fdkNmA/D3sfY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuq0lwIsz9zq72c2jD9ocAhI0R0SIQ2PT0yz4GO+BWqZFiiLKM
	hwZRCjPvYeUIW92iJbOtdWsPjnkB81BlvZrGcQQ+yIJ0NZqVWhg4l/W0ChORgq0xcFRas4nZ6aL
	uXuU+Iz6t8AtIG5JYOj3ctvaA7jl5sc1neKNQfwng+rAHrc5doyPrZurg1lmIbHG3MkhX
X-Gm-Gg: AR+sD11IXTcgk9WzQt0TSR92HE2KW1nRhHLJpxab36UpgADGTHMKzisQ3EKbBhFAyno
	dpsfuGJt8ugtrytsWXhG8j5IzQc8GDMw4K8Pq1EFVRUbVxxo5HjkvXLKdIDCo8TA6XrvrGAIpKu
	7rJfCaU5V+RCKv4plZlwvsVRHJlGfts1LqyK6mA7EJRuzEiRc3k+NBNUJRDR2l47yOuHE9Ki+Gn
	mVCeE3lWf8RVVJEM/+K5CqETMYpwK3NmDnZnruZ6W3Cqqm2AplAkDJkxBYwMcmCtzNfs2pSRDIu
	qnGfbWslXuHtapuMD3sLs/64gT97xpHxeJ4O1X47RWzStvwtt7nkMxLOd4bYpH5Q632q3vbfLj9
	ze5Lw6OBBdJ+ykeOAQ4DKBvuh
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2299032485a.4.1787049907258;
        Tue, 18 Aug 2026 03:45:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2299026685a.4.1787049906788;
        Tue, 18 Aug 2026 03:45:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85173cfsm1623828a12.6.2026.08.18.03.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:45:05 -0700 (PDT)
Message-ID: <a602af90-9bec-464e-9d4e-73ed91ea7103@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pjEdKO0ys3HPe7LpVmkCaEoKl5skhv2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXwqPycqJXInNs
 YHDZdaCabB62Rl9aeQ9rgwKRNEF6NBj42TEaVxeaxM7A/0TlbnL2gc6+6T1e2Yd726+DFYJCtJK
 sVKhJB7+Ge7DmhSsULPL4du3ZsKQdkAZuA+h/Dgoa2niorIdrDIudy+AD52xnHrU95dCure9JyW
 eRUS+jBodqdjuk8dNz7JP2IyUYLUrNhNRpycUj+8z/I23fn97auUilvH5H3GoAZFo2piSstVYE1
 d9mmCHWsON63xEWMXJmXkfETT5QIlPgW+yOKZeEiIeoc4TwWUTDSRMZgirnjsElR+LxCQUb5/VG
 i1HSH3MXH2WDyz/mrPQJcj63U8sVnIv4Qk+hZrfaBR6RB+zWI3MRX4Xfj4S+iwlXGLmT/NCzOmD
 qEDmtuzuMYSuBF9gP/LJ0OZCxBYLfKSyyxek61ZdfJySmSL3c9ZivZ/Q/Z1Wpjq2Y+pxucaF2Uq
 pt3dUSDV54cfHdqAuRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXzJaM5QWdzzno
 ZBIzzwvXW3C5GOHODSip6EjGf4n9zmpE6wW56qeB2WaxDzN+G+fZwXKGR/6dNxPlGK13aUKrqhJ
 gtAxc1YB57R759q/E35fKzlC4/6MKec=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8437b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d1Fdhz7F2SYFlaUOAXsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pjEdKO0ys3HPe7LpVmkCaEoKl5skhv2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

On 8/1/26 11:03 PM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
