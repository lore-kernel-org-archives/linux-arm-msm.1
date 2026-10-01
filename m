Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEA3451A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858561; cv=none; b=eOcPNcAczt+Pm0sob2JDHzi9OrhjB/m30ijPMlfJsBUyZmDBYJEMXEfs7/RnXGvPqR/f18AKQK1EozGxPoCk9mhD5Qt9FUcdj2cA9Q/lbd/4M0qU0pxC3MiR4DugFP9OIC7qyogZnE6rn+kVsS5VFiFtHlLrZn86vqhCzBbpsPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858561; c=relaxed/simple;
	bh=sJrCCX8tcWClNWsB9aBPl/sbOgEIN6wKM2tSio4UL+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/JPcLzUvMqrac6sCDZT5qRFecZOq+ldqRBJITiS/Q8BtOd92MO9xV2Q7eHjNpnA1+5CqR6oRGdnIfx7E4o8dG1F8llKOrDT6pbWRYQI/4cMqKII3zWbod3g4QV+eDpNRZCLcPyI+mXGKTrdU4r97raoY7diiGLLyCjFsJaytnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebqzBtb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WpomLXNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebqzBtb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpomLXNv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CTijI2806975
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=; b=ebqzBtb4eUNkMlVi
	NcTjfjQgGqQXTiPBjyQbvyVFY5R2ym4Z3HhPvALAPuuSNIGTm53/8E5dZqPIe2h/
	Hm6jUfFwX2u47tU/Vy57CoiuGMQsWmzApOz49ySvNV0GyfpGHvhFVrl/f5Z8PGr3
	aLIWB2vGucALMRNzdB3188oZrHJc3eTVmETDEQkIEmaqNyCmL1VP95576zHH/XBX
	WCMNu+GsMl/PAm63rezgfFZMRXq/U00o5p8wcTafn1p/2Pv8I9LtoZbvmynnIHuC
	CpxTMUpegYbI+s7Uf8UJlOW4/up9zklXDmt7KymQ7kCc/WECzy49zJ//LwqTBqay
	TUAOUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkhnur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:42:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53320bbd5deso7088541cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858558; x=1791463358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=WpomLXNvJuqgD2zgxL661Ta8TalNDiMtY3sswLN5Sv+iOH+S4SzheNYIUM7Ee6HaCo
         OsGqCpPbrsiQY6Pzu6sxIxemsPvaKTZc4hkhk6QbS7ZbV3HHcggpPfQ2dljmpKCXeE+U
         2OyoqL3kP+kFeMrUCkX0ivNdS6S4+KVjQHiZxScHRF2SU+KxNetEZd/Rii0dRHiq3A3H
         6Yh26KhyzwbWox4RFy7lwy1VSXRBtBksTUVx6VjEO4wofVJFy5J28Ag99cgEBZZle5KB
         jb0mktz2T17As37xJfi8+hik7nG4ur9jN2bUW/1KE3nrNhL/Rw2YFtlRS7SBrxLcE9tC
         Jokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858558; x=1791463358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=AksJGktyc7y+gC4gVtQPhik7wc1mR+vuRDrvtiBKCy4/UcPjDtwicGUZCvFxNy3cuW
         59LPSbhNNpII31tavtRQ/oHXtmCJEUUgg6/e3EqlKenKezsDe7g/0YiBGlb8ngf+l1zq
         xzQfrj371VRj+oAzWZ8fUEXUfIgX13QmK3bemtIE9+BFtyRs237D9A0JPhepah4JgI3X
         Q8OclQRR4cREgUM7ot0RlqQHFOkdecLSufMLJQk3mt5anuLub2QE9g6g2IRnr/zq5vjD
         cye4MjkQUMeY8zCHZyV4ZgDzTMNe3TBLxGYKB8q/TWyI8q45Cwg22GRRmYjuEcfrjx+e
         MTDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrV+Bi61viDjLZl7eCP4sPEVKv0yZOiPiiRA2XMGS7ks1iE/MlkV/8gCSQJ5Ap/cDDH+pJ2tj7kbOnF6AG@vger.kernel.org
X-Gm-Message-State: AFuF++kQNWOqBaJt/FUiA+97oIVqkHz5llPJr1KMG26S249qF+QzOApb
	PiKdG5vXf+Uir4db1X4fCk9zrTK4p4wyXSOEsWubdXdW0yOCxZUG+LDi6n1m1qrI5Ti0oivSnb3
	1C98se/q9Gdf4oqvnHds2No0bCoan26qee641poehBPK9vi8/awWLJ4G2Z8rZtUKdSWWt
X-Gm-Gg: AYBFou26nO1rpZDQ9opoGUln7+G5kvv/r1qovFQ60gp7Hai/FPE8HojcE1LHrwAX6pV
	T6EgUQUqJ1pyBxIAGEyTHfQ0Ckz6fx22p5VsbwSc+Kwe9CdOZZxsGgE18k4sWZsgFLaOnLOtHaN
	bH7ccBmyJlanLAUQHyp6Jpuzd2+Az6k1LTk1L21RbC2GtSMatOyD09b6KK/unR2UL0/su+t8Wg2
	4CazUN3H+8kFAA5Pg6PaLhdbyP/FUzjiuF21fYlM1twl4yjGzIr+vMtdJzKahD7pT+cUkcSCUXv
	90EkLo2/rBVq4rPeaTj3qOvSFB2bpl1L5rvI+B3ikcM9t3p+rO0MGz6qUBE/38X13wqVqvUUJAc
	+GejpJNE1Bft7ERl9b9LyKQ==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853052385a.6.1790858558473;
        Thu, 01 Oct 2026 05:42:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853045285a.6.1790858557821;
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c93c31sm151473966b.11.2026.10.01.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Message-ID: <e5fc5d23-d6fa-4b57-b6c6-a7ac64412d15@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:42:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
 <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXzv/fLvegJSbj
 S59pkTdOi25Kjop/WjZcfoBD+zqcOPGKe6+AuficZ6VAgUUrHTbz1CApHI8s5ZG0Uu7zuzAqq4l
 BIHgky6YU/RwjRRFvSrj+g7tDlcRoKc=
X-Proofpoint-ORIG-GUID: d4b3t1BHKcPrzdXl5aSEHNHTrqZmBjj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX773DDJFpARsR
 mzEP4vyYssn/WWSOdnGb1AvyzmXS4KIw5X54pCUMNDWA7Vz98Ut5fWui332o/2vFtTUnn0kMvhx
 3FaV6pNkluOdVn4hZmiS34/ZPbHzg3jJnkSD54rOZ040dQ0/VutrWnJYaHfnku1a7YvRygzcp1x
 GP3hH0Lfuq/2Of6HTIXZ/Rwe0FkLkW1eyqPeQYhnmHd6CPeyjrBssqB6qElAN86wenNBZIDCP6L
 ppg0oLTf/HMzGhlun7wclKTGjn3nG+m483CcR/cp4HPPBBCdPxNsoMytlp8bf7QZc6FP6HruzAB
 Eu0v4nUj4/odx/q28DQ9FeQL8tOVgIGLKpYglw/oBC8TP/+ns8iYp+f+JZqUAABo1mlFO5RdZUr
 ONyTjGWTfuM9gKMH0HlzsaHmfGfrF4ljWCl3coJRIKDrfPPM8ctifSNKNwtlVqcc3GncGJgojsE
 Ufk38nfsnSSmcBcjGgw==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe553f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: d4b3t1BHKcPrzdXl5aSEHNHTrqZmBjj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

On 10/1/26 2:38 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
