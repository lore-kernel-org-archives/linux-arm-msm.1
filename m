Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93B3B47F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219093; cv=none; b=uKYaqLJoy8bTLkb7y1p69e8nVvxIuGs/DKB8FU40NsK7iIV1nGOc9E+bVyuuRjDArVfbHsl0tj2GqONHibzHiKkqUWp/uvTuz/bLj+Q9Jnj8/yLNCbkoCfCftaf7fkpsw32+h4kCnIpXh8jEvkWLPQlgOsi3LNRdNM4fKXKMitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219093; c=relaxed/simple;
	bh=6aHFOOKtboNgSiogTyncNEXqvun0rKOBVzzZnSx0/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO6p8D4JSJxY+n9g+VzmMRHfB76fMq5HilSkl31Ed/+cWQ24eVdUJD0QL0R3Z8RtsKOimsicsvzW2H/OAziL7UzeAYqeBkT7NVC2hCJtaVx95+6L96c8UhqX6jpwT0JhTExB7A4V+g1xytq02ZR5xJoSQyWiqfn8r36lPYERdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edEt4A6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXQQ+09k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edEt4A6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXQQ+09k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S46Rjn1821155
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyPUS7iDR3msB32DZY8rgImGvlDT2BnU4ZtxfBhBAfw=; b=edEt4A6r4exiUnnb
	b1+gRL/vNoxkem5PRI26EMyv3idsbNLpo8PDexU/opmYtT3NljNAS9PGIvfbFcKS
	nEwQzzdxLAuPxjkfGiiSKMdWWaqkDJ7c/rv7F1e7hMJKv98BNRrQt4WOXdJ9Hvef
	8lDyI6ocGgqzjB73T63JrSHtZMCr/yjh5RvwL9AbnevJpsdpxnoYnGkpxx0nUVyS
	3ZM/JIbSkNy7ouFpm6dEr+zi10GVSfSf7UOy4vj7X2o19gFin6zd0MWmS6bDGOp1
	AgzX5Itz7h+P57+5AF8lnQB2S5d+ACTtJqUzvBYcEvrvRWupIoJAhD+ZGzMcA8Vy
	sJIFkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0cw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:11:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso6443835a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 23:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219090; x=1785823890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyPUS7iDR3msB32DZY8rgImGvlDT2BnU4ZtxfBhBAfw=;
        b=bXQQ+09k+FSzoKbSdG4aW6NrQ/G6W/TVUKHwl6oMGbWlk7u+GTGJzNkvMSJVoAkXEE
         j3VRZsSuZqy5B2gvHriJ9NfFa3jmCbQFqrG9XA3qlygqklGJ57AGa/yH2uKUcbOmLfnw
         DnjndmZ0TJlBx4YBi3tMoSxziD6xI48hzDcVDXaDkcAqG9X+fOWWcbXjmz0nAM8RoLuU
         wY61W5jrgnQBywt4fWe4+2g9WbeT5bJflaG4/Iy+X0dPhsl3coaA6WmKROIJNt40VQDG
         jrHmzTjpityy++g3oQKyKoqpopT1zUaCl9Pc/FsQ//MpTfAJLlZSgSQV3I/vqDL6EW2I
         PY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219090; x=1785823890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyPUS7iDR3msB32DZY8rgImGvlDT2BnU4ZtxfBhBAfw=;
        b=VsFklU4GHxT2g4hXfk/2U1owu3cyYEkraPpJTVJIJyHhHvzjvtU0KoX+jz88em/0uy
         9t3kCyT0zOm4pRXuJjUNG1bnSs5YEEFTUzf8HNO0ywpOeH2do1rNTBGBvmmG0SyyPk6y
         gC6IB9/iqm+xeyXh32EoEbnGMXO0kMc3RW/9Tx/EkXAgkh7sM4YR2lnyeHEuL6fETwhs
         xW4pePe6GVrzFWmkaFcr7NQ6yzasQbTgGROZqQsGyPIaXF5AQ634X7+AQQkPD9iQcFxP
         gCSaJM+dXCwitnwptZgClgq89HOo8EGza6usmOPQkMLRixl1jnTQL4asJfa/3hmMaALN
         5v+g==
X-Forwarded-Encrypted: i=1; AHgh+RrC4dVcmzA8P+Htzi+nPszCiNfoQGGCJowoV5QQ5tm/2Exd8Id+2mFnOcpvmtfnEaFGg2n5sutSv4Ie+39r@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/ZTf2oZlxy/o+hT3RU0uFaTbasVpG4Y15rOSAje7zuArg30n
	BTAm76K9qYGhW3Df75a7mZs9geDZf2g432sH2w8MXuJpTIINcZHuQEeJkeiK45QgNlwAMF2elsn
	0pYK+K1UD8KGkQP4OV/0JC2gLnBpnqrt8hC/Dg6azegBjKrc4rrz+j8RkbijHpjpllySC
X-Gm-Gg: AR+sD105UGx3HEiMzh+pSNBvVCgGonsaeeVHoHZTDvxHNPdoCDSWN/FspszwOq2IO+M
	xJ+05TrksybEqI2eY1lAVPfTuTGxZh2NWJ+mzkAqPmrG49+GxZGNSgrMQPXA6cY2wDBVuT8A5sl
	ayNg74okTDY/Tj4RivtgwImLC4OEUTEK+JRbrFugEPpVLEwpZ7g0PpFqtVfArPadc88mwtGexkd
	CiTufw7eHs4slaJf44HbnyPniwm5pt+R+CJJjDl+77CzDuGV/uljGQn4pxn1wLt5xv3RQ8SwkB5
	lRX8aAZXJdY4fQ7MfbsBghgJfuZJeLzXOpLmHIKJ9t4/pXqp3eMUtwMXs2bLT/jwRcOJMFAVavW
	grnuAoE01uR6JyKwDMrQxPAAd0I1PzZI=
X-Received: by 2002:a17:90b:390d:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38f6a40bd5bmr1149424a91.10.1785219090484;
        Mon, 27 Jul 2026 23:11:30 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38f6a40bd5bmr1149405a91.10.1785219090089;
        Mon, 27 Jul 2026 23:11:30 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642e34e5sm744240a91.16.2026.07.27.23.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:11:29 -0700 (PDT)
Message-ID: <d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Udit Tiwari <udit.tiwari@oss.qualcomm.com>, konrad.dybcio@oss.qualcomm.com,
        herbert@gondor.apana.org.au, thara.gopinath@gmail.com,
        davem@davemloft.net, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20260517105233.807935-1-udit.tiwari@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260517105233.807935-1-udit.tiwari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a684813 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HDohle4KqOvtihE_74YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NSBTYWx0ZWRfX59x5lLVexRBh
 0i6AMcAHOCfsGreFYRqdq+MsNuyfGZ5o2H56gJHORxSRYwS6P3jc5Hcvwc8PYdyMRiC2rkn0YXK
 XN93pXtCFB23tvqIbiwlJENtxcYV+Fg=
X-Proofpoint-ORIG-GUID: H2LwARlSGdgBoQl4WkyEfrB8Xk6aG92-
X-Proofpoint-GUID: H2LwARlSGdgBoQl4WkyEfrB8Xk6aG92-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NSBTYWx0ZWRfX/Oke041RUAAl
 TsUbmhg/wanVnO4jtxIY4UfVwT5jlGWVx/PtRwOTsM8kbpRyVNK6VeeTYI6DcLke+TDmitnATeq
 VdIykDfbR997nfwGLiK8q3MkuZOPmuQzgrEzgw21ASlZt4F3TAgckBXyPBDAB96gcARMFA9Paxz
 cC6hH9kfaGp+bwzM8w/mW4mVjZwCyv5VB7PcX9BgDrc4jchJM9SlHi9gMs85l/IHOflVCNsecYS
 AYaXvU+X/98webocfR8c+h5C4B+1GrcPRhAT7MAoMo2aQGn18+jMmvsOxEn22nRL/R1pUkErMS9
 O+yYioGMNZG5wFQm4i9BGENJwHhMJVedySKTpFhP7bHo5364ztJf6wepdu2uuVK63JvOdXztmWv
 yG/xLYh1S/TB+22W9ecueEgsHjlbO6iV0k04c59CYh3DYeRUTblckTeWyt5tJXyf//s6xqFd98B
 l67WMtjwME82cfQOWvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280055

> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
> 
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.
> 
> Signed-off-by: Udit Tiwari <udit.tiwari@oss.qualcomm.com>

Herbert, can you please review and pick the patch if no further comments.
This is required to fix interconnect votes summary for qce driver.

-- 
Regards
Kuldeep

