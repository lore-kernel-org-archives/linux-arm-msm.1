Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A246EC67
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779847; cv=none; b=fpTS+SZwc4VQmbQyI08JrS2MLHqi3wkneu4DgCBNiiNl+41EBjzKyH6p6l6OelFgX54yjhqt+kF2pT5q+uaHSmxUDAPnn82yFoaL5dznVqsKQiDg8mZTKdFCobIAFDfA5DcGmXy3/uk5spGvVEClew5GCvYCtWI24T3VCvZNzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779847; c=relaxed/simple;
	bh=zSX96X3WCPvjM5dc/JWy2IMD1tZ0uShhAn1gR2rmBYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiXjjfp/jJ9F75pmLzdTB2S4bW+90KEDLanqJF2FI4uQnNMvaqaICklGF2RiIM8bmPJXaBwcsxGxrugIC19diJqJUiu/1M/Jk+CdPRi23XvZ8Qvaq7zGqfvp3rsMqs/bcgpmSK7b5fahpB6T0pnLDz23UwiMvFwHF8nkhpGjrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8uy6qOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRr36WL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8uy6qOQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRr36WL4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An8jq3350140
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9tO/GYw7p5Y
	IziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=; b=g8uy6qOQVIGVvsD2K6GsjaXCXFG
	r3Ui0eAvc91yHnD5W+GmiHJHMRvQcYZLnzqrMfjN38H4MrDFlfzeQPfmDWK41dO5
	nQQe1pYDQZW30w/eoJ/dXXVkHQh5kEVcx5Apm3QnlhDK6PQRz8wonyYxmQOvspux
	ER5MXktsOe5FXBNDy1gq3n///03usbWxWhZE+84soPMBxBogBXFN63WSsfl/4RrP
	bX3nf6KyqFQIEUqMYefKInvTnJeGzvQGhWb0lT2mu8YtWk27ziqOKnVMIvpIiVYD
	pEyz42YQtiuIVCSewASRTN5KcSUdBzZ6/9+egFztiKzeMDc8OF/THK5SFEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0gn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:17:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so570495985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779843; x=1789384643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tO/GYw7p5YIziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=;
        b=WRr36WL4spfijeCDFYneV64MuCJoUkLJzpuZUtcn7RwGurZARIXN2YztD6M0cOOvRg
         PCNCGj3CwIKMHBRCrowUaAj7cRdY8diAFmrOZNl4anU1y46fGsInQpP3l8BB2/RRLJBr
         0QVdPkjx0VpFNa66+tou8H4V+4Aopr6xk8B+PV6LayVTBNeK3Sw/lGz8Fn2hGNo6+Qcw
         psWTxZ+dgm8sXvjdLoGGpqHgGazDQX2hCAu3h6yrh6SP7MZRxYtw8q29S7B3Q1RgDGAL
         oIwGrqoyCSPQjdeE+wDZBidzjLJnSDPvZIqRLMVcQaDSUO8E4X8e+ypTnoQZ/qF4QqD2
         iHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779843; x=1789384643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tO/GYw7p5YIziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=;
        b=LYVM3zrHJiLeVmbdhJC5n9iEgxua0n4oWl3FmqYPqI+sNgdjRIXB2mL04dgTnXyYpY
         4w9LY50NQ52eDlHLRRH4PFJALyKJhIArOfnfpaS8V2h4V6JWjC/8TEB8d+ZAo6X+sTGS
         PNyFZ7WtYkpFtxPwKV1+v4e77MgB7V+QIvHnzxx6L0mZ30P+ZpbrQmyXiS00M22dKVo8
         TEqpn24lMwQpsFpWuVEftZl7+6l/AWFLt1zJRs7Hi0oZQnGFMonjy0wwo+mGIPs9x9N4
         +jv107TcWxKQYeNcUjHTAdLPHsW9C1M2wcYxht/7UKE5Kph36xJF8q4mwL5I0Ghjl1f4
         +6Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwJR5Gz9ZW2HBnb2EgX7hFigAhDonJo5m+8sM6pxIahRXlhQR4+cPOhITUGbMz5gjUzbFXWPoMA+XikaSUQ@vger.kernel.org
X-Gm-Message-State: AFuF++k6z6BJdWDLhuLM0gmUae3o6UoBAY7aEQO5KRcFdvI8zDq+z29E
	FhQ/78m/TlfdsjTekH3l5TuPJLwIwJEHyPdQuM0sBTNwUtw/CuYP748HH0VVyCX3Q7OViZdmvb+
	PVEYmFMjXV0iy80a7N9eA1UTGgC+tClMc6yllrxs1L5JMboGgmOR9IKL7W7EXTs0eY65N
X-Gm-Gg: AYBFou1dvnyjvGlUTn+a7H3Fdem+WSeI/JQKrBNV6DR2IM+k30sHW4BxKBAGek94gg5
	ZPIOCuxyS/I6YHjj8abxzcgX9kLDCfrfloblpBpx+VuyGkSnCpMT4HXuGobFxadJHxDu4A0FWJK
	hvu9wb1AA9zjas1tdQVzdLRHYL9AMK2nGIOmOSXdTQRyZpaBD7P8oLZkk4eSpwKoAFxxkZTtNK7
	ZHU4JwqYgsNgtgNCFPMR1ryarK+JrMFaPx8/sJ/XPBMGYUz4/SciVXQ5vLur7Amn49+kMX0nvJe
	sVRH1OkcmhM5oqVDNYPhF3nr7xsJEG/Sm04qLFYL2QrFAH6vUsvVGM0afVLTtvvyU3DYtfTIxDs
	OKJjQaRv3roGZZRhfKiFF90vDZ5rew7L7aoYguxgI6431Yo4cZRHEys9Pkg==
X-Received: by 2002:a05:620a:13d7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-93980462eabmr1638326285a.41.1788779842729;
        Mon, 07 Sep 2026 04:17:22 -0700 (PDT)
X-Received: by 2002:a05:620a:13d7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-93980462eabmr1638321085a.41.1788779842315;
        Mon, 07 Sep 2026 04:17:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Mon,  7 Sep 2026 13:16:55 +0200
Message-ID: <20260907111659.263324-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9d43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lJEbMRRrfWY45v_ev9wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9reYFnYNt9huCXuXEwe6y33ba1dlPsnM
X-Proofpoint-ORIG-GUID: 9reYFnYNt9huCXuXEwe6y33ba1dlPsnM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX8JUVllYgARFW
 ugV6Et+DA0/8cyR2vnKqjK0Zo02sv/42Z/c/Mgr2jZF41yjKofLSMxC7TPhmojExu+bEziANgDc
 FY3DerhPatuu+0ur7O5DONv5VR29Krs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX6+Oz1Qvd8v1K
 t42J0lo1OxgLl8eRANPvAFQw3NpKh/6EfrHNPGMEUH0hY0Dsv6FULOHvKHo5ZfrA5oO/XRRTFtj
 jsCk6XLSAy+g+wdCShLtqs/OU2c5KJm0BJaaE3lJdR27IZ0Lv7YCNhNGYPLHVO/0PktM/jd+MpG
 siwDFxT8hDRkFi31UjbVhNd3WV9R6aPPTmqqHav/v/pYrQTF3BdLsAU4+1xahVC8iX7rhNYbcsM
 yFiroa97141HsO9e5ft8pkwq9b+SHniovh4jP9iuUBQmypvJvZbcQ5cMkIb9VkdaunRoK9kZEPo
 vXTEdEg3HQDts15Fo0knYz1ePSjiTZZ5oWNaZnQBChoVMlNIU2X1KTvpztyDeXVtB7K6HYXaGBx
 YHafcrdqKEzMxU1wBWl8r+3Dal/15GB0EDuyGao9Us72aUKNvkR8sYuplv7hapcZB2qLQtBifK/
 iTzurnRqsfTDPTM/XZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- None.
Changes in v2:
	- New patch.
---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0

