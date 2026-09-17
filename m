Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078B3CB8EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632079; cv=none; b=TUZhl3Voie8XHV/v5m74JYs3W7rNTR2K14pOLAxg63Jv8T7p5eh0jGK5uquX6wGxYGhPysQh7v2quznHedXOTxF9vy+IUeAekicyacPGO6Mh/ea1+Ke8DWd9/o/77EKvAUxCYep8kcI+IIZyW9TUe79lQthrY1L64d7xMssZqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632079; c=relaxed/simple;
	bh=5n2spNRAVJiYvE1gs6ZNcCsL0cuyjrLDepDe5iIv0F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB7n5x1uuHUI41SGaHRjV+xAyf9dMyouureQU9RmAa8ADlc/rKYf5M1dmN7pNzBZwTwHUYiX9MWm1K32c8nbKqXJO8eUXXpjCHlD1bz244wgkJrResyl2wgr69ZoncKMxYqyHnSsUzdizEiPCdAlUra4RMfvAoOfyMDceSvM4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFJpSvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQal7AkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFJpSvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQal7AkF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H6064j091703
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=; b=pcFJpSvLfUHY2h7G
	qjfi3pTGF1CAYG91LLay5TK+kU8/jehpV+wOEaB1/hoNfY9oxu0+yAqnQPEqnMds
	pjC93/cs790/rg24DNlkGgzjmgufw0e5XGdA9cz7ZdR/ft6eZe2ZrYOOx8LpOBnD
	GSq1xwGyX3HJNMLJzF+fhDf/uKUHhLcbHjIsvhR5vDq5bGyWcvaXpYZlTnm+pGEV
	jfCIdlIldEo7L+4HvqlUWeOyRKyEELShmFqcF1hT8VJalJW6cDqLwfDhtX6QpIuY
	z6rHKzIt5kyG1IiJR6uq8vDrnSLv1YnBwLMZocLjKzPAa77Yk429rR+dhZ3j/pRj
	qpTeAg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw0ucg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:01:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso16879e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632075; x=1790236875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=CQal7AkFj88w3U6e4+Fup8Thu6LPfdLVtk9Mn/oELPXJHApJ2L3qse0jtvtuOH8O35
         dJuJKtqMLSwvEc+8c8dlBkXgCZvgIQAHnasJHvqGTXzSbRHd36zEZtOX5/voplhSXHSF
         IrsJsHSK5uD6+swaOWmogaE5BmYV1jG5EpupTdcYLzf2Gez9KF/OtISyO4Nbwz5WFx6g
         3Jy5o9YRaTFSGBhbUJLEeoa/u3BFDRCdFRDyeCE/t2g/DbXA1ky0eWtfKP291opkIJwi
         ZOHozgP1IGgkoS+WkxRxgyDEaJG7j9xFxe+ZUUCYkHkmGqtLcjsJ48Y8Zzacgz7oKxTa
         6SOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632075; x=1790236875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=jxhdTmr4RgxBpzrAfAKJJ17hICCKzpnTIICbhqvMvT5jo/6AS8dB6cQYtvRRFyfuPT
         baM97pYfpTDLpnfc7z5iSoqe4GFV+Vf+COPJ+YzH2XYIM1WZywrzj9jxuK5wqWPeoHan
         T+mLJAAbwIao3MJv7yM80uemgUfQ3TB5wxVbOt35A/qyBaN4I14rrswk0CmoWnDal2iS
         9toKzoYhr7GGS07RN+4v+VavL+TKvvnYoaOFHUtlhoGjF4kxqNqDhr6eRverV22jBRrX
         UsbHi1G8Kvsu4bjiqKOKkkkYJpZukjfBG+xgcTb/gJ3WVeSxchCo9zFBREsEINoiFmMi
         Nz+w==
X-Gm-Message-State: AFuF++mPMRvPSrguc/fsfeJHy3KCB4/1pWCnMmYBvZ7QTC7F42Gbnmve
	pgRmjE7k9sWDbmN75bVZM+LeiZPpuSAZsvZh5bZ3j0VmJpiNTwMdaSiWivMFLn45ueQhRmLBKO1
	3HATzMicmb+6sjDBZXu7CNt+X3bYgIZ5KuXBT1fj49zhKZ2j9X0bhlgQf6rOPFvH8HxrN
X-Gm-Gg: AYBFou2KRyY+DV/2jVdj+uGWpKn7nJBif5GeRtMyTCRjQQVYSLyl5IWP1DanKkGBK75
	wsYZN+W91RNaKeighsrbvCbWbZu3BySLpu56L/ipGK8H5s9bksUShYc5FdHlbyVXAU/7ipyryiS
	/lT8Kqw9D4lL+2v85V+5J9jbswCxt/NsI2eiKFXF5nhaBydLJsPyr6vLIiANn1HqhgnqzbRq333
	rIRStB8wgssVzj/K4YNBYK4amnDh35kwtE8gdeRNq9PPz5CZ21a3v2+ymyx7n8ilKh/h3aG69U5
	SgDMyMDp+cyAzc9QL8nDHAVPxA7MqUh5nM3I3YsafTn95E9cqhQDhm3OZnPDhFuuX3bdX+wSRfc
	G94hui2KAgjKiOk+AB/wo5Q==
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895432e0c.2.1789632075658;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895418e0c.2.1789632075297;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d29a1bdsm3362760a12.26.2026.09.17.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:01:14 -0700 (PDT)
Message-ID: <d2653084-b3b2-4c52-967a-2b8cc805749e@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3_Hj8uLDnbkUWhFvE5EcwzlwiaAtWsOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfXwOoBYjFJ5nnT
 ek3EnRHMmz59kKRpdCPNvyRa8Jva8JvM4qkm0H8FrEyxAi2rWs7WSymrsmPTWflbxYTeFjF+1UU
 pYDxn76TfA3BJT05P9Pv8yf7A4CSw1BN40hjliywB+BPp8EjlXUrL6mbUAouE4OcCVPE+SrhucF
 j2qYHZWBTP0k+MraqwWUbYD02zFZFBvppwbTi3nMFfVZYvh9mF/ZKf7gJUoS+X3A2rqm7LgNLKp
 Uy0Og12d2V26v93lXtENuKbfYjC9PNP+rpgiwS54GLro7hf+hfduKgmg++N0Qub9BQJ0yiXam59
 WxbSh/kkWa1H/bA2xq5PdFQBtvBEnZrb80UVaSBgVnO5o+42AWqRpnFm+Ub7SNvB67yi1XWGvRV
 QiZzjDEOJ6KJtRlBNjukOJuNWodFQD71p0Xp4Y0D+yNq+ZxvgWAVn3lPKk154cK10vwnpTsNWdc
 rFQgGvsZTeEcBZFPa4g==
X-Proofpoint-GUID: 3_Hj8uLDnbkUWhFvE5EcwzlwiaAtWsOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX7jSLzs3/QAFb
 6CIhQHCNROJS70951sKWW4ArCRS8XxlzELGpkgaGo3cDWLrVwylou8cSuTduG6VQE5KI3CjRVlE
 OhO+buXaYl6+Pwdk/ARLJ2+TINQHa0o=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aab9e4c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mAKI-E3sSVMRA5yFQh4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170108

On 9/16/26 1:45 PM, Abel Vesa wrote:
> The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
> The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
> rejects accesses to it and the clock cannot be enabled.
> 
> Correct both the enable and halt register offsets so the driver can
> enable the branch and check its status.
> 
> Assisted-by: LLM
> Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
