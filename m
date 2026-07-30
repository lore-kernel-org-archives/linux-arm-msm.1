Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E485243B4B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421218; cv=none; b=O0r/rT/XdExCJhUkQMGolDO5wJbPsp0jRLxwoB6ALpPkCm7K3ElE+G3dMNt7G0LRuWNRcHQwbhchtLpWnT8zmuhe+qAhQmD2Qzf/77BlFCxp4KzP98g0KVPBWdbzsP/EWoskL+jlJP6owRmo761P8GSArrbNzWPmkFOzcEJwGsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421218; c=relaxed/simple;
	bh=LZlR3a/k6EAZUZ09Nxx69uSQDfIu8A0eAAisk2lZdwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBuWVHbUwPMZ9jXmKXqf90VZx2yRdgJtuv7VWfJ9Lk5rZTxfwOguiDGcFjYuOinCuLdJzOqi/WOaBnO6iXk2PvB4tIA9WspUhH2fICagdgIxhThFWzi721uqvO6uNxGGxagapmBNmFnWLzr7MopKGwijREUxReyI6Cq890lwoOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCOlpCB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYRAgzF6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCOlpCB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYRAgzF6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEHEML1060995
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10z4NSUtWihs47rTxESGh7HjucqL91Xqba0aBFVCwR8=; b=cCOlpCB4CLXk4t0G
	kdcPXX2qv9G/f2alEiibc6dvyVF6xohk/JId1qIRWcf0sDmR7qyJGxwC9A3yox6g
	HpkTNY1CWERt5Un6ljERubnSoULRMfgM2CnwN2D6jeuaG22oKz/qD8aLdz7x0Cuz
	TjVDC3c2Kk7x82dBNN4zDUH7AR54sd8+bhH1Xo9fK9xd5ZSWCr9lCSoHh/5dcgVe
	0Q0pS7qJI7Vem6oBF4ic9WXvWlAv0uDBN4NMSfKElyg6rRqmuMNgEpf1Rq2PcX7N
	fuQPSFC2ehLUmt2Ti4qt7rC1VulhxHHw1/1auQMiRklG/2lxZlwTOy4Bm0O8au45
	sCeY0g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr88980cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:20:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfd77ecafbso64837e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421215; x=1786026015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10z4NSUtWihs47rTxESGh7HjucqL91Xqba0aBFVCwR8=;
        b=DYRAgzF69+2UvMUgkMUT1JCaIdQDG9I6+ZZ8xbDXJL45tixNXSMDQlNXfynZyqYd4O
         KGoP6OgpDNfAG70e6j+6c3z8xNI8vPXBGDsd+HryZZhzFcXIY45VQwdOpwA9nEfayCB3
         Lf5bQbGHa7JX9mCu1KvxtZya8MYl13zySvtR4ltdN50rmi/MsbLq4Z5ZXQk3aUWZpRqY
         d50SWn8xaKMWQoMr6tXyZRPSKosbIjwEZishuooCXVgY4jvBk/OMAwhh7FBOQm8PEtvu
         /y+azkCKEvWW7qZGK3T4tW7TMLK4dOEiXlMtuyZymHR+wTQEsNvj4iWfMbyQ2lMZdmkV
         RDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421215; x=1786026015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10z4NSUtWihs47rTxESGh7HjucqL91Xqba0aBFVCwR8=;
        b=lJyL+Tuq0+CGNbDgg+g+hQ9EqKuni9U0PGTuhbcrUESpR9RwNjHF2shq8vVuXia4oE
         xFHVYJR/MyDVdzNUX89ixozz1SGr9sW+uu3gZs/IsiJDbHXgA/wE1+o9ix6m//K07TyG
         gCOk5z2u8drKzSyMJYqw4awGWrD2UEaDJtQ/1v2bvx6/7moknPw57LFqiTuQq3nQG2S5
         ONyJRuhCnkpHZsOTjesqPKkJeAbesw6YTzs+lr+q8nhibjjmeDUaxVySpZt9vthun7Pc
         F03L2gm3Piy5KEDcdU61bh8diPkc0tyGvHUFXP//cUopfcBf3772kZPiq57n67l6E2eC
         lGuA==
X-Gm-Message-State: AOJu0YxR52M1eCozNfxG60EoB2JvY968B3+yNalGpF7r6GMslpDkvo7L
	Yg0uogDt3qK6KJrE3m6kox0wu9RJ5+6enEuNy+a5TiQUlb2EViZzupJli7USj2uPTqPlMQ7MIq+
	z6VytsNLt02W5oHvsF0V86VAz+pLRBzkEqcqqexSH5lPdX63mPuAEwd4r4lYi8MnRD/TjpRtZhk
	U7
X-Gm-Gg: AR+sD11TXHLjD3e6LIce7+4bSIiuqy0cT2NLyFyr3V6iAUiYqYRPIkh6CHtlkvgv7g+
	awx6cfMgScPJViYoGh/Qc8byMEEdFtmbg0Pecl6h+lqINfu5RPnNWUKLcjfLOaE+xcVhkQLYZRD
	6/fkEA8Fl0fGNLNWisb9TPXKp3vT0hAboXR/8xVo6qthyEIVhrHjILxlt7lDzSHQRXWp3go+Mv3
	MqHVARS0zHRekcxmfZhhDtyHKFffnuhTixbgmF6jCvomBCZ78rXIGczT4tEbUpuU//hNEo9Fmj4
	lRESc1FEevkoHUt/0856o1zfTdPx08/H1OANTOcrEUXoH29tyS6uxXySV4+g8lTwv/nM1JXct8v
	IB2OJwEeCfA9jBWcmvPjj9p0e
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr184399137.2.1785421215177;
        Thu, 30 Jul 2026 07:20:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr184357137.2.1785421214581;
        Thu, 30 Jul 2026 07:20:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db942e13sm382219e87.5.2026.07.30.07.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:20:13 -0700 (PDT)
Message-ID: <121da706-fa30-494d-a5b7-b735d9bf82fd@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board
 ID
To: me@dawidwrobel.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jianhua Lu <lujianhua000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX8fhYCVzd5RMX
 ypoWom1j6axYYn5F2r9rgNT4RKi0xRXTEV+wKEBdnl/pJTyd49S5amH8ctm/KZMweL4Ug6sI5tm
 CCqmHXY5IIwdhCKlY+bEsk8ejSFrTE+T3vqfenQgZ9RjQDOCCocrAfsjOvClfYLDs9LYsfXTZU3
 DvTTWv7m4sPa1s2bRvRyHUzU6Dzxiiox1/+DvhIEprxL3F7Fl+xZfPVQjS2K3e7bR+D/KT4olbE
 nSG8pqKW0dQY9s+Qekp8hnJJ8iwfIPBRSTrqaqoniYSvm4iLNgBFcrjXRZ0rXUdKZPH+VQHC6il
 9zCrGtzva0umNIiFqUQ7mSKFJiuVPs/WdptSCAS7o4vWLSkB9czjfz4AZkqzwzy2XA0qKo9jbve
 hPZOZ4dd+YR2EtbwdAm/JrK0ssqu1IfuZkvSa/NsLSC4+fS544J0kj5tjwR7y6mDp1mGX5M1WTH
 emp8Swk6b7VpmNC3Igw==
X-Proofpoint-GUID: goFHppZgk4VPA9F7I62rx3Ub8pkznQwk
X-Proofpoint-ORIG-GUID: goFHppZgk4VPA9F7I62rx3Ub8pkznQwk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfXxyF7lDiryBnk
 OLBO8uI5x836YC99uqDojmfxAeeZYX3n29EMgIyxN6SJH9AdfFGNV3u33rzYLrPW27yiwSvvNTc
 6wa67rVaWQdr26WV0/2S8J2t8gX2RqM=
X-Authority-Analysis: v=2.4 cv=S5HpBosP c=1 sm=1 tr=0 ts=6a6b5d9f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=6l51KXG5dzZpTP5ie3EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300109

On 7/30/26 3:44 PM, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> elish declares the same qcom,msm-id and qcom,board-id pair as
> sm8250-sony-xperia-edo.dtsi, so a bootloader choosing between appended
> device trees cannot tell the two boards apart.
> 
> 0x10008 is Sony's value. The downstream device tree for this board,
> elish-sm8250-overlay.dts, uses qcom,board-id = <47 0>, i.e. platform
> type 0x2f.
> 
> Fixes: a41b617530bf ("arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro")
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
