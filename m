Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618150;
	b=oOz3IP2KFjWoVAPaRt44qwD+Zw0BOdsVD3/mPSgVmrhKzWz1mX8t6yTkqd9BTlGxVDf+
	 b4Fq0Fm01f/IKS3f3XLJ2sUtbNS/n+IDv2a79aG99Wk1k/3OTeYXwJtklIB5G7OWU+UAa
	 IkAO73fBxK5Utw/72V+C6ZFJvATe/UxqQ7TJ65a8FrCbRvtC0w5fo0//RpDsgaZeFgTpT
	 sqcTgKsFnCfc7gDedrhpJKJCBwKiq67me8WLDZed0xbAUkzr5Hxb/uydwOk3baoyQ6t1G
	 LIDpDFAKpgudVKKMGZ7EfISib2FERB3NZ96Uvlc+qtvLVkMUDd1vo4pBlrtlqBTWweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
	b=5FzWGMnlyGLJwJr76B0oHWZigJdoqzEanDCyWyqSGoG3jUSzp/vq6dFQFkBPYZI1t9t6
	 xn4moQt8lB25/in34j057AdC2CYu5XJRcpFu+lidNdcisM2LAj7+KRDX9xA6SALqmCmm8
	 6uzOgAi+iylAeh66MzrdnEEUF9QDFqHcszTKjkq9Zku5FqgiUtu7alzHbqEmeRk7ANcqJ
	 b6xs7WLNrbBK3MpH8BuejVjtxsgCH/NTYfPxLcsoRBe+4Asde5MHUp/S3dWv+hTDqbkNG
	 kkO+nJLdY1Vz+eu8eV4v8sZSP2RDQgPjBN0vBcvxPjBTBEh39pBTt6vUiw+pLgacVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXntOdJ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCR95iZL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F129606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F129606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXntOdJ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCR95iZL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AP8M4039722
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=; b=BXntOdJ5XkVp8UT9
	7xS/6NWU1BgmZ/iXf5O1G8HA5eohJdXJuJ0xVmgpthCTllBFQrsuHsvSPg9WeAX5
	1YHaYSMQQW8t874bYzsSahIVBCY/EWgjMf/NqQEynAh9pOL1V4Gj0IL69nAep0vC
	MceTOSH4zvlpDeTszzc4s+9Jk2xY+kGZLOPskI5ChUKkgmJd0JFKJeCvrqMeX6EJ
	47LKIf6OIdo5tmPs/uYHpM/nKyov2syPmUIJjGEhk7Yzg1jicxMJmjcY+DflsEwJ
	CDkZVfirs9WpVkQ8XcXIoXFpAnqcLXIwVmgq1NogfAychqD+cHcUGDwH5TFGXxRB
	AAgTdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18ug6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:15:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6741241cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618147; x=1794222947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
        b=FCR95iZLnyJIbl4bk87LIlRphqiVeYDcWDGZfPVkL8VqDLw6F7KP+Ls5vkfvLJyR70
         6fWpCrgd46bdB8Yg9i446kD9GgvDjLN38Xzes0caSe4Ram0SUhJ9EB4sZmA+0lUWd43M
         JY3zjccmh9yiIupW33ubutrQOXvMTCUWgwGV4wWE7FMNRqh6Q90NLH85Tmr/zj+xckYL
         l4BRYB6ARL1WubK6NljR1jKJRhOJYvrUiAJ0vEWuV7x8xB0DooWY2HsQuvGSqEQto1R8
         Xrl3tu4cGcOFoxsXXLrSTRioT2LpWN7wI4w+k3sjVSa5Gt3Z0wZvqCYchSaI+8TvyA4P
         ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618147; x=1794222947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cTMTGrAlXbYE0wpw60PyKylklFI4cKnE7P1/RB0Lhw=;
        b=fcy7Rfgjx3gVkKwhektq2s4YFK3xg3lpEIqMnO/eUH4gUJYDa2q6u92bgmJvYx97R9
         yGH/cwm5bqOzq8PcEF+dH+a24/m3266mUx7xAgcfy2Q61OVTaQlXsvvFL2OK28htKhMC
         9tS3JN3o7EC3xYVytKiKtWKnOi/D9xf7VuLfo4Zfw+py5RuzA0vAvrOs+rSfqYeBmJHQ
         yGMfhNRZCrJCVTypeFJXm4vp6McCQkWHB40PAwMvQSFLA6WorWkzmDsa+j24LtVnzEe1
         IBU2gwsC5XF0RbAtdmXovJGMffbKx/SXJwysDQAhVy17dEMMtkQqQ3EDLGb9y787JFit
         B+aQ==
X-Gm-Message-State: AFq9FYIO3o1TWSNFc1NPXrFRNLqUP2qFFu02X1NPjdccNEGe8wLRvWsq
	x5Dnij53+1vZqRCp3luyqWJqbiYr6BAeSBiG8Wpj+eahyhGgzKXJgBOj4H0lm79Y2yOZ+ugwZoR
	McMfF8lPglGQVx9fpbU1zLl3d3fS62092gI69FXIOHRgjaLXnMQKLwZQ4nXPTsH3y/MbL
X-Gm-Gg: AYBFou1vSdyhJmVSaTCk4AIlDVwcZ6iKaTU8ZP9OBgFVGp8NqHHykwYy1DeONP5Ipzi
	zd24joaETkLPpqC7VhVrs4VVyBmustWC+c1bS2pwgbHzeYSfkK4ps1fOZAxtlDCJIOTashXycTC
	+E2QQ/RdgvhESzpOQ81pp+Sb2WtbvYMQNfxunMHsNfqsiVpeKhTFP2Vvl7x/btLs6yz8aWTRlCn
	SZmnxaxUiylzbAuE7a+pZ1EjyqYrVaRH+0JA8+2mmTdPhysdx9y92dG1SqbeXl6yThlYlVs/F14
	1ARAgq13llEuI+VjqCUl0zcgfk75O6t6xhdkn8prCsQL51NHgT+ExG/swBeees9Chj5JY+X2y6f
	mv3uMUmzxTD4aC7/F6m9S8WDprAfyrJlaQ/Z7qtfldHPxhLCjrsioJFbFlmtWrdl8ueSqn0c=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532193785a.4.1793618147215;
        Mon, 02 Nov 2026 03:15:47 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532190185a.4.1793618146747;
        Mon, 02 Nov 2026 03:15:46 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10081sm378131966b.42.2026.11.02.03.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:15:45 -0800 (PST)
Message-ID: <ea962f7f-b06a-46d2-b6d5-f3c1720551d7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:15:44 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix use-after-free of work
 items on unbind
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5wzPWph0eyLpKdZ47xmBlq1z7EpnSoBK
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae870e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E2KS5iVw4tJVt3xiAdEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 5wzPWph0eyLpKdZ47xmBlq1z7EpnSoBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX1kDbp2U7QWwQ
 3imt8vvd9iEt+Ji1wbEeIFfsSJQyLBqEuFJ+NsQcjySOdA1d/KnRswDLrYtiKjiL3WhBUzV/hQj
 rfq0wRE6A2tyb//Kgv2mwmStxhEHKD7pEIpipmeSL4k2TZQ4IBhlnpi+ZA2gVDjS4yMCI9A8Uzu
 9XKXWZEgsfiJha9AsUZ+RWZB/HG26swB5G9sL5UC6W8K/1Rl5qsq0+C11Urfe0EeFXF1mY6sDjF
 ulgZv9Fx74n5bGht3xuo743S5AYQAGwGD/IctT4vAItDKCvYN06abv9Nldt7qqcb7LXBQWfQIF0
 Uj69FWueQscs04BDBYa1y7FIgULb7EkpemYFK0ZzyTIbdFuKXbCMrDl5v6787V6veGgPsj3ep4t
 zFUOgnAIjjPBeIoQm3+Uqcl3nd2D287Nnf2IqieVIU8I7pUCT1aPov8O5zs80bvUWbg+a+HDJ9L
 9lSjuk29yTKAi3a5HqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXwGf45KQFd5fY
 oF4jVYE4VRAqnAXnxnb1F5IiKu0eHylssKhixaeTRsc4Leb3J7IeqG8y/wBGreefDywH7lL+/8+
 /vGoHlY6RvXAFnDEWRxZw+ncDMozYWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 11/2/26 12:07 PM, Abel Vesa wrote:
> The altmode context, including the enable_work and the per-port work
> items, is devm-allocated, but nothing cancels the work items on unbind.
> A PDR or GLINK notification can queue them on the system workqueues, so
> if the device gets unbound while one is pending or running, devres frees
> the context, the typec handles and the pmic_glink client under it, and
> the worker then dereferences freed memory.
> 
> Cancelling the work items is not enough on its own, since the client
> callbacks keep queueing them until the client devres is released. So
> register a devm action, right after the client is allocated, which
> disables the works using disable_work_sync(). Devres runs actions in
> reverse order, so on unbind this happens first, waiting for any running
> worker while the client, typec handles and bridges are still around,
> and making any later queueing from the client callbacks a no-op.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org # 6.10
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-762f89d1-07b0-45e1-9557-bf643a826aa1
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
