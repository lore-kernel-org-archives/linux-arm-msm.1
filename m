Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79850AC1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059146; cv=none; b=n264XBCAu+7JANTv3M9T+z0LugOljb/7IWyGrKkeHwF48OrXSga7t2C54vJhcvEbNt+Zv9h5P9cXUaSaT2ksHEyPU+c2oipS081ZUcWyJKSaKbDhw4GbEszdpaL0Zp4VAwXdGnQmdUKPtOvOrZSGeQzYvjtzksX/KqPoBCrHxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059146; c=relaxed/simple;
	bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ3lBoLJopRTyu26SjAHYLMxVfYsbnmwEMDYBrSKc7fqgBJ4YLKIzgXDh3TU3YHZ5em/H8FIwHFJgqUIkH9MYRHHnq0WYQTfy1B9d3ozmcIAb0lv/pH7aiJHkGTu5SbM02lai0EtPSdpK62hzP73xDWbg8WiJ1b4Y+eJYmJDtzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S64fWGTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcG0ibSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S64fWGTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcG0ibSJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZfr2966413
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=; b=S64fWGTZhKkuUcdF
	l55dEcT7II9eUe9EARbFSFHRFhqii+pPfEOQ1OLKXQ6zBEiZfdwAIHUxsUecpYIf
	ujgGbvusM34UgNNOztN5xoYpBC5SpDhqQ8weyaMmoZznPGafbn/EvFrdWRA4gH47
	lTz39aCbJ5j5Sljy1GJ+O3V23UR3i7JnK6SBFymVlDyuhbfHoqAIcgf3gYmFCPIM
	rMTxMrwv1G+oJDKQD/XmbVfXJWnmKmj2XyBgAqNJsEc4gYi06jvmJTv6lmhWImee
	H6FyRNbyz9USEpAIOlquAX9dTi0IDhwD2XCDmGXvVFrMHZuA912ohYN8SZz381F7
	II0wTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wugjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so74347185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059144; x=1792663944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=UcG0ibSJCLc8w4Radz2Z8glSkrf+BSKWh/P6wCN0Xk0PuSAqAH5Vv+ocUzFqpPW9bF
         bzn2TmBZ3F/8Q2+o+AguEj4or9vk+Qg/mJ3V9SoBgBUWJuQsMOWbgJTex+cTxw+KKZtC
         FLX5zbm5asV8rz0q1rvLbOu8ChmLdxv65qtvYRKgmYJHaYV3i8r/ElmusJP/rB1sg0FG
         sl216ei2PKZCV+viGOePzmTRcj1FzTFp4RVyHdXiFZkKF9RdS+r7RP3KHPCxXGSglNxN
         rNBbVjM0CrPBwCxj0VXO7bWKStuq+jXoEO7UzmVmXr3+y3+ANergFkNvn1tbksoVdmyB
         FjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059144; x=1792663944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=lPBI/bM4g8jyajTLLEuz2ocq1qAARenvBASgNzN8zx7l2+jzYKqbiyo5csJfhGdxhY
         IC++IVD1VEYmogiz0yAmXAgWCmf/xSJ1pQNNAvxb8Qx8kDn56MdDW9nTdhi9GGt84EvS
         DB126BWy3EkxE+OvTwF+yprMUouW5R3P9mcu/EVsTEDDUZxRCJwj70rR11QV9JTypwv2
         1pftRjH2cPI26D889cMVEP8rivUfktHZMgkEnOWhQRHPCOtfOXOagJlRPLMuEMUIAk0t
         6ngqpRrQZl8tk8PUuJdrFBfiOB9BTM4Gkq6GG4x0e+VET3fisPZGXuKcee5ToIhilQut
         5tnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxAcruZVGqoDY5fmLGif4vQxpy1LnxhVAw8UhH6TrNHBaqNVnTmgu0O23stfzreLM4ovUWchPvT2/XENko@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZXcjgZHsFfc4qOL+YSi3VuPcKNh4a3xdVU5ELkH+t/mZisnu
	dmJzdraRWqntDg3H2IIdoQa+KOrfeLXXn718anOSXirbj2Unkfbq0GhZvA1NMQ8d0QBqlvDagMB
	m/2vEuN+KgH4vVsisO67F28/XX9gGi1/+szP76GaJ9hQPE2PWvn79IGQVBgaHIrGzgkMt
X-Gm-Gg: AYBFou155Up8yppPO36d7BfY3Gc/xSaBxMQ3amnxEMtiOi7ALFIDHFQZ6rgg9rC/Yf5
	ZZDlfVSOxOFMHEpYNo2SFc40ITE5CsBVUJDAB/MWgsteeXJK6zxgDJJ1VedYk6NLYyl0QR5mEgx
	XWvroVhKwVT2vm5DEQwcKKAPZh/jHv6b5scGnNXfweurH/dDfHPbi9NsOrcuS2XzDIjLlORvMHV
	tgC5PHn8zNLYaw7XotlCTtLx2tvcb47t+gVqMbnVX1wVCbFwOWj8/lOd5ut+sbW8MxkEWzYOgJo
	bgSUFsfRkiQ8JYqFx1mLugHuMmtIJHxztMS+jpPo2va0ukgOJBlVOr1UBeUovroUgoxbLDZMMBE
	IN+5GtQFY54em6u0JAhtZHQ==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693426485a.1.1792059143969;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693423485a.1.1792059143491;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm105680366b.23.2026.10.15.03.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:12:21 -0700 (PDT)
Message-ID: <8a31549e-63f5-45ab-9dfb-59ef49cefe5b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX+tQfVSIbJrnX
 PHJxfNIKf6qpzcFF/n/tN7A8XKzLpDmeSH7G8J4repGpW3FJbPR7vdzMLD4Cb7/VDkha2yTSQDz
 +qASRtW6SGaOpO7GoxD2s8fFhJKGNIU=
X-Proofpoint-ORIG-GUID: diegLSRHSPKDorkUIvw2nTXs8W4Kjdq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfXyFvPnyfMuXM0
 YKfyinunaRuJc8gcMWSoa6jk5vSP8zaYVDaSOPBmycfkRgWAGcs6yH2NR5cE9ymZtAOE2PLCkDx
 glf+CObC9n9RmhSRVTK0abkBYniDgSfifddYLBTEIZRGw4wZRx/ZTqauSqCJxMfNi9s4xPbmjEp
 kwt1zlyS5E3TzuT86qOfqxh32QUbV9O6007klzmdyzv4OdN+hFw85AsEtO3iiOccNl0BvnTJDAr
 vZ1HUgo8JuGBJyG3XELuZqCv1X4SvRAxxIU5EeaPXz9hz8d+MVshe7hnxj4Dwj4xAk9PfhnpkUr
 g7j/aL1ykTtHUPloN7/EzQ8pdaenhrwX1tS9tLW94Tj5IVtyRDbvkyvPQh79sLVE5i3LIlL9l1n
 wLJe/mAjcZOcHfzxV4O3WVblx+w7H/Fm0W23pIkBOBTgr/jMeOhlMSTgD08woxUSFHlQBjlf6j9
 W8ij2Uc6YI3+hcqH8zg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a708 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KhYryj7Us4LvWG6v_dsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: diegLSRHSPKDorkUIvw2nTXs8W4Kjdq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
