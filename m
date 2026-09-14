Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04B421EF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388698; cv=none; b=WYuPseWsGNYFoHeoTCOP230qzzpfV3ffnJugjK5FqdWRRDHZCevou9FmvnRQi8BUSvD6S1YP2WuOyfo8+UVtozZ47yMJfV5yIsCw5E66pk/awxGseMbqwk3FA+M3e6FhdFGAxqKGWhjjxEIRbxuOS61G123NPB3rlGwbQpaN0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388698; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHtOBO/dmWk8XnTO2RbaWphdjsVx3NDHVf44UezL025rhHYLz3T2YSlK5LPDg8nDOUKSH/hnAXRYS62t5flD/bEa5zCNjJl9LJqjnyS1APbAxdmwhWS6IjVavQHmc5WrFa5zi8H8EZfKFp4mLAE7ItusxUUC3Oro0ZaToOtACHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orAJ8nvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0h0+vYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orAJ8nvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0h0+vYN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5Db1216233
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=orAJ8nvziqXVDna+
	14nYPxHLwwYD9PWfjcWwoK4WlFeYkXQg3MKt8K97GxytnfROYZvVnj4ANTPPbdOW
	KPSWGN0L4Ne3nUmEd4UZzqXBB+RssqpsQo1bejPV3zd2BrpJC9QQF3OLLU+8Rw/R
	4mZGz22nomRxIFLoRcKCZ5VE15GIFnBSdqPDlMWdcHe0xJHFQBA5xgGXO82kFYcl
	Z8a1gX7GTAhDPbHyzjG0LUgUaxMgr3D3PhtnqvOqYFPV29hu+uCzd/UKgfw15xDs
	wAGXTnuobbl5o+5S2jfwGoLhp09GOACclAL/5PwuXAAqEcO8h2ibbeXpvxOsuqWq
	0kzrvg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0af0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso22530e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388695; x=1789993495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=d0h0+vYNvCwj6WRNui9GF9izETqjzLEFHrV+5O1HwfPICUl717r5pb7NLVxNz+dONE
         q4IxfwhGPefFqyBcbXAOP2OCaV0aAi3rShTc50Bovm5diTW4CQMfI3F2OFUfBWffh+uB
         VnQy5upKgAORsYZyx0hzTl2E3+gN1Hd6JGXAvNLyQqwWwInJ2Y9voGDwTzDA/p2WsqBu
         VwTEia/XLVTUT7jyr+97iEksU3Gk9DNpKz4nJPEgwK2EE/LrRquRS1tmmAVPSoKMy6eS
         W1clOT6AvBfgOpc3M2PU51dQmH16CLTEPdbQcrVl1Q93VRZUJubA+dfgUsSx5Lp09Tle
         tpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388695; x=1789993495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=j9kFkTtF0W2pTwG7bdbny8GsxhsSYrFZyMIZrdkNGf8nULdPO/M6Vms4nlToEHLAuy
         cBMvGzIFEzRKRjYVqPRbfSOjgt4OyOimgoL4VDS3S0LyWfPuNtVeuFQLr87qHPcvK8j0
         TfiHc9WB0ioDrGa/irbaV0l7v39W5KueJT6N+2YhqoRm17GxPXShOhMB8m508EkfgDmV
         0nUtEDmJzTkr3J7iWhXNR5HsSDW2GBWYsLA9Nfu15Is5p3FarSY2QkdU4Sg3gkmx+Htn
         DMvCA6mf8jvKeRS0FuXw6fGpMfdyX/OEBD1MG9CW0wSz4FLu9jx3H2GgSG18u319tmIC
         pCAA==
X-Gm-Message-State: AFuF++mnEafDgn3lWHmRxBZCF09Tz9GlHQP6xu+Nt904WqT2ZaW/Xf3K
	IqObjLvfja712JSHOipjtR8N6shlx7E3TBlYiM6lw8vtY4Ld2rA16y1il+tHOTfbTEAa5qW//+C
	ZlYwZcXXd+C2962S8H9u/XixU2JKfZmSJcpaF2e74GuBj3h9hQSnaR1hG9J2A7n7TXL4s
X-Gm-Gg: AYBFou0sX3cr9Q0rtKFz8YANlE3fPGaawWc7tAdwSBf9PXW23L9o6C9gFUipAHW6sKR
	wKsRaW+GiCVEjpCMHD7CFHjn3DyuFNLJ+/Z9MCwnSmUXpangSNkeyll/3b4SsMkCZAl7mNw1WBC
	PV/LOU+WnoRZgV/5lA3oiwRACSsfapPCPVkrjTxuS6StVUMRq7QpuloGWM4JQc4JRsSRjuaCk74
	6L0EZmFEfVsUuSuCZCNYaxcu8u3xPsJC5QI+OcNa0/auLqxtOLkc7c5+MXocMngpXcp+f5cHn8+
	di+gejYJFp3Oj+/Z6zKL0EJdoJ4eoAxj4ie1G7KCaEU3B1cH6MYY8xwKCHC7ZEzNN9wqjJ0EKj8
	6H9JE2NPnDw4OjzaVAnXpyw==
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124203137.0.1789388695277;
        Mon, 14 Sep 2026 05:24:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124188137.0.1789388694856;
        Mon, 14 Sep 2026 05:24:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2356557e87.82.2026.09.14.05.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:24:53 -0700 (PDT)
Message-ID: <9514465b-8b23-4913-845e-8a0ebd7aac83@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzLFgekIiNmnM
 d5Z7QEnjZ3zHU9gwbGj9dgEAtAQBYC53qjk5JIPCdD3QMP3TvujT8jV+TV+KggdZOQ9sbI6UVul
 Yq0d3gibk5ir5yg3bQDAcfIpUtM3I00=
X-Proofpoint-GUID: X43U9uBS3i5DTpzMB62ShX8QLNXc-B31
X-Proofpoint-ORIG-GUID: X43U9uBS3i5DTpzMB62ShX8QLNXc-B31
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e798 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4oubQjocrp3q
 0aleYKwHwwlL1WVo7Gy/jw4A+q3cpqjS8Ut6aAFVW60Dff59ABrtU+6AZXlVIug5oIu2VdnVZhP
 i2iTrVoWnarzap0VdL0W9C2RLgz/EcV96aG/RqfbDcWGdHBkI81I9ltvo67IYpwQ2ast2/i0osX
 hTPQr/MMfNvXZBUwnxuAc2TblHS5JpgUjCyF4+3i3/ks82OHokhzVT2WrB5mMh0p97hk7BnhRXi
 4eA1xbeBaF1NkIi8Kcwbuh4md3C08QJtNPrqRMw3cGm/U2kwtAOIOhieRwY+Vl/Fxz/skjFgg5L
 7ttlLcQ4Ggwp0MHAe+K8o8O71UKbNzsK/0D4CIV5BozLMKqpEcUXnoaiN83MUbLU0vomwGv1Drz
 rV3yNVDSU5eauIgVY0UNkdpVpbsQCyg6QYjvoUnad6abVziwRbEPZ5ZMiJWy8y2LqU58WBnSvXf
 w73hnRfm1JXyhxcAeow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
