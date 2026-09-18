Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091804B44C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726179; cv=none; b=AIY5INlOa2VI2+oCuMwd4d+AGri1qZh7a8AohdFEtd9pCdXxpOTLpTkByYRawvQB4J41cqDjmetNMcWwTs6h04bfcJCwX0/ytmppu/06hZPNWJvXdPMHDeseR/br/TNWDsoeU5PMx7aGp00KgiHA7xpN4t5IKVcmjEc+fFfgbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726179; c=relaxed/simple;
	bh=sbCiK3lk9rToDwJbJpH6HmjQ99+hXCYkkLWlr3Lp7UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWqNLnOmw4bvH7+VJRpZELtQY+uSn6Ebj9TIZ3coYkfc/G4h5M+rpW5jwNMyTumAcvZjLv97jm5YzphmWDErsZbcZyxJpCiuFrE70oNR8le4OlOswa+nxwKUiPatEb5tXI6XJfV5X/hmTL1I64+kgmpQig887z4eBvGSX3v2PBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuzjbV6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXhqp20S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuzjbV6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXhqp20S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dXDc3916232
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=; b=cuzjbV6WxNE5tOB+
	xRmQjQpo9FzGX0u7vKfO3KJi7OX8Onq1qWFTxMKhBfn/Z60OlFmfakZDr0qImtIU
	V9MTHVJeonc49XIf4D+17IuEyDmt4mSo47JM5ePzgHe8iYWMpOkkfAj8G9BlAZdS
	2QcNEbgXVJ9JHaMgCZrC0es95Yur21ybmFvwUHQwsD8EokUdUBbZgiDcZZRIwjW+
	HB6mR4A5CgR0hyQr5FGpdhqLw56eat1zIkD/z7ACYffLnIb2jR68DskFcCIz/DYN
	iejhdksOahX6j9UOZlxgqsZHQ1ms7KTaD8202Nh7QU/QnOntYs3l1Jpr4jGjCT5K
	gBioUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtm3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f8e7ff71so15168185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726175; x=1790330975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=;
        b=DXhqp20SkMonDQE3wAVeGH4UmxQst+12AfyhTJ/QatoRFWhtR/bYWCaP5Sf30vZX77
         Jtv+wynxmCDvVK82XB2QyiniKkCiYbQlMpFp7IA1Mce3asy3krVh50Hn72RBxIgrA/Fy
         Tomuuib6l1icBup0K1vUi74VGpkWlitLgxdC7q0zUtzSArwQDAweNxee3RBFuV2cri8n
         VqcteV5lJJmpBkraA5UbyHrcaWlG+TdiGXNeDw9qgsacNR11Wsx3bpaZY0vvM+xlpN5a
         czwZFtk7WsRdmX3hUohSwOGfHCap6tyyiQG8cplMl0jW5SsJcxjqQ4YfTunja6B1e9hJ
         FDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726175; x=1790330975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=;
        b=tE2SI7oTLd7r2uXqoBUlJRwR8fD4CIsWLmSeKaYniEXb3bh1LXe824kgPwCW/oTpTg
         Vct3ywFf07cq3yvQhH3isV1gKgyUR3XVPsV0LfGH27w+nJOnd7zvz4AmZrLuUzaj0O38
         lAVgftPAXacVqtioBfS/wUXDB1LYGiH3BPwYMLgtH1hddRHyKckd9mQ8rZqgy1Lqfj9e
         48e1B56CSbbcNzkHiv3v79JB7icHGQgUcn7AVAvyNj2VzWXImZXlzWkBsT7pnrj8w1GN
         1x/oduiqChdSOehgQPOwqerAiPqd57Q8X9Rmnb5rBSAGjh4uY0i04AqhMiW5X9ccJ2bn
         JcjA==
X-Gm-Message-State: AFuF++kGMR4c1lTIyXNAF7lgVUv1Ww6kTT6qmElW7rbv4dgav7v/H5tT
	WdKSj0TtKonVzS6Cho5fUBVAW9NFRr8q/OmXw1tV/4UePsj5UVGI5Q1HV9j8OiuqIU/W4084qTi
	XppwAj7Lg3fvx+HKDjw0cMKkvH5vScoZ4Sq8mTTCx+cGJNsoE97oHuXsLV5/6FLu9PrDn
X-Gm-Gg: AYBFou01j/tBcFVGUCn5MvX+VWC6P0qrQqFxRnq3whv2Jo00nAh+2MdGitjtzyxnvkU
	HW72jy7Y2V2Bi7I60YkYID75sKG6xmCHxqPl7bTixB/lKISjHlnwxyR7kNCFWLPlu0zKc20FWul
	u2WqsvrvKbmxI2dgzY3cOkLKlF9xc3hvwaVxTHcNkKWbvf95g89FZJtKooLJIJVJAhoicx81YMW
	25th/QolAHF6J+Qr5x37u5g3v2Izj5ELkSSofeeaPzxqmwGl0gimExP4dEP1ydWW3jsQXMil92H
	sOeT/NngsI0M8rvnn6XCv+ejcEWvO+SBzJKo/20NKLEBgA/32O47Jzf5PZgDho2VTLCXM6kc8JZ
	vUL2WJ8CYTpMPk8F1PnXq3w==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24640476d6.5.1789726175109;
        Fri, 18 Sep 2026 03:09:35 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24640006d6.5.1789726174703;
        Fri, 18 Sep 2026 03:09:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm627029a12.8.2026.09.18.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:09:33 -0700 (PDT)
Message-ID: <162cc52d-80f6-461c-95bb-4ab6b842c0fd@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfXwbICiitxc1mF
 AKoBI83E/vBuElm1U/QikQ3LGc7NwggmYDXt84DVpQCE0OkzYwnnoW2taRcGYyM7AcvsWn0fKtr
 Fk4f1D1upyCQ9dboeFej43ap62wEv8+Y9fwWEgrCVi+u/jcca1KZ+PaWuPbdNe7kQfLrqRfi0IZ
 7sHJpI+MlRNSWg0VMnQ1pbGVd7jumKEiRrc9ilnO/U0y8EaYswCGjQ7lEQv77xhGG7MiMucHxiL
 GqVExo4HJxSGB2kfmIZBaHFNWZwQwHU9ZGTE0yxdn/hPkpRXez3Rtcw+oIiNCpvUaAj9+R5RTPi
 T3OWNavl6c8LGcWyFIiWxy2bibSegnhiGDjl8ECu/N0dSKYjbEvHYPTZxMcDRH7irOQ9KXl4EJy
 8r31EtMw9GF74SL9KKWX/VMjfWObo2O3q1+XXQjbD8GSWOgxT4ub1ddfDoU7dv9cTIz7KfS1nZ7
 HL9bMuX2kqTty2zA1+Q==
X-Proofpoint-ORIG-GUID: dS6rhcSEmgHuAobKumwBHBOGeC2M6ZHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfXxqnQh2Hr4z6Y
 Lgxohh/VthB9IIw1t73ZbEd5MORP4Dzacur03EZXUgaLSGbARkuyCbPMK6VC6en8uA0bNRKDyZl
 8DGgmxWyYQqnPz63LV+A6uW6yDEvFs4=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0de0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dS6rhcSEmgHuAobKumwBHBOGeC2M6ZHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
