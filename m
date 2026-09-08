Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999452FE34
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879390; cv=none; b=eb0wsjeUEjPzig3xPPZ0iFer80NhBMjuSEuBcm+Rc8eKuSEU29dTaOeVGbGGYwuf1euNeyBQJpaHxQUEcI71HIowbs+FoYSbS85x2cbFQGQ30XevPUEtSUDdKY1hILnuUmfWh4sV0lI5lSFrb6pWEroEDJk8IwED1cris9NWY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879390; c=relaxed/simple;
	bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNIk6BvAOQScLRjjbUszj/Md4ZAR//2WV7oLBGlNbp8FRKl2RVn/IAoxTfc65gLVnrg8Kj4VQaVxM6hnr1qnFIvLVIHDj4CgSAjCzgWSrAVc0g88DW+Iv82m0Z3GpgVCNDcEYsCoYZxyGxT9YiM3AID71SyOqNLB2a1ClIaQFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FezWc5Yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MC/EN0eU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FezWc5Yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MC/EN0eU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej4lX3483187
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yqH5y7Vc7hL
	a+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=; b=FezWc5Ykvar7+O1Qhm+951qyPWV
	92IWKoINDKODMZwmUE/niUo3UiNWyN6c4W7gLOSj04c9SHwNV7PKYJv7klUltPbe
	ZtLknwpzvdM9KW29dShDyA0iaMrSvxKRT+viluOiGR6w8WZ/EDt6Rmn2GCk4vAY0
	RWShQpCAvOuXDcZVrD6sGHlNwdwnWECdmqCwoBR4BfoRPoebQCS+R9DIvItREdwA
	Sc7FgKclWrTs0cYxs657ViE3dNZ84jl9RwN0DEihz1ptALx/5LkY1XeFdD6aLra9
	r86foZT5WNizKCsHzSv3UOkOBPZORZ4Y5Clc2IRvX6dZ6Evm99p9BQ7bjMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujpcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:56:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so5162228a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879371; x=1789484171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=MC/EN0eUv4UFUj2u5pdV5OYA+WohfEgPGcBAtFMA6nlMnXaqklIb28OeDd9jwbFDwi
         0DOY3cHRfFLDCUco0F91EwdscuDQUzYvhC45+E4B0M0nlSLhoYiZZzQrcDPtaWV4bsjY
         bXnedgFV749bM7NlkFaONmfz0Ir9V3L6IAvxHeg44VB1WFIL1AdmMalVduYs1ZmZGDJL
         2gtSGL+xuY1WxE/DkyKov7nXtqXHU2ywUxAN3M8/Z0JYP3wyMX8V04sJwSowa16Znvox
         I9ISj8ugUiwk74Xp9Bea1ADvbqTo2Tgj6Ezcw7IYOla1VLqavhlZkGpLMYBILcI48iIw
         Rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879371; x=1789484171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=HlpQ4DWxOhttOzti1HxitRSEF62titrmuqapN4TX9WqpBhV+8Jp2NPU/+J92atadjc
         c7m+uuFBESE9gcTl0z78SB7DUaGlMruj1wqa78o5NiADCymmsbaZnLxhy0/finmEca8P
         Mg+J0zs8+aV6+e6uUJwrpSuqaRNbmlQy5ctK5xTTdJt5QBhRSVCLGXnJoLhPHF/PAvUA
         tNh79UPhX191erWchf2syCGoaFXn+O/kZYOOMNEHqdOog13j8ZbUwxPjKjLEz+icPDT9
         N3U0L0ixOHcWzGLs94ZxKjfYIMsk0GStgP09lP2ZWecpxXXxF7IJfYM6860zVdPF3jLw
         P+yA==
X-Forwarded-Encrypted: i=1; AKwUvBy3qkgCbc2tRN5CuZQ13NbA5ZFT0DMS/p6Tg+Q6qko9EcBUj7Bmepyo9MyoTQwjyGLBzMbzdX5Pt+v9lN3j@vger.kernel.org
X-Gm-Message-State: AFuF++n3cvfYIfuo4BjN8MM98SKOUuBgUXX2ryh8U9YRBWBKUBVdz1J9
	uNPHwdfX3+FkzqsKPsOFseI8hypUuvAz9rN86LuexwN+G/RzNX0WNGc5XlJmauT9+AmPdsJFlKC
	LhL5BvYfThtcNOZcBfAADd32frr4cUgbdUbuKiqXt6/Vka0lvQsWUN5ZC9Tdnxszq6Unp
X-Gm-Gg: AYBFou1EV4wPS1Nu37LaJ89HX3zVtz8zCecqXCkTgIbBArZOyOYK+dAXE+dRWUBLMP8
	gKIFWgxI2Ip6yxmni3bPTbe8WIGeuxhAAUfIPkkpBPx/6l7cmCAarCxODa6QZm5ZKO3u719bF49
	kLVJTYpeyWJx7IsJagTDz1tC1qjbLXzNeat7DkI6U1qMluUWEpfosaI+xibIPCLR5hrmtIixU+9
	Iok8L9DCdjryV7ZveAUpfEq79ORYcS7+ozEP7SAcVMcz5NMGoKLl5qxileUVUQ+pIDlaEZqF2jS
	O6fEvWhwez0pIgjj9Zf7+PoJk4q6j/UFsBPJKu2z3GL9rFB4brwGmlhHCqgRlRfTT3aVMb7Zv+D
	fhqq4iLGXrEUAnCBEmCOJwHmgOmDCiyyuoPJ+4OtUmjR2b3MQq0r3g4kyrgR7mlK4I5j3zFWKG/
	3xwIjQfIds0UuX27Pwab3F5Q==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822434a91.21.1788879371155;
        Tue, 08 Sep 2026 07:56:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822380a91.21.1788879370578;
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm48697022c88.2.2026.09.08.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        sivansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
Date: Tue,  8 Sep 2026 20:26:05 +0530
Message-ID: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa02211 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=WzJbLqzC-FkCw_Mzoz8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: LE1Q54_4larRoP5RwcAhiViq9uE-b-dQ
X-Proofpoint-ORIG-GUID: LE1Q54_4larRoP5RwcAhiViq9uE-b-dQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfXy9VWhLwENJUP
 BYruYP0atC6ok/uZA5DV+ZzIuLKAFX9RFLOMPFyqXmr5LxrBPYFBvK+SMBFTf2797w1dyPVftBf
 ZEsqng7Skn9V4FI61oOTxHqH2r4mQRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX0PeL3giHkoc+
 D1Et8vLJhbKbx6KYgkts830i8/6ixjUzVgsqCLbX5oQR6BxWXWi/98vv7E2Zexg+AEGAZrpqh68
 6HZzAvbBRKBoiaWsx1l6pyy7b/L4+osQRdPC2+UCcksnKZ/iGfokofLy8d8bQPLMhuzdieFbwbq
 ijU5AwrY9DzVNZ5qXgS0ARXZQsrJ4DVZsvi20zZYEpWzcoytzEuprY3OnEqDmBtS7KtzrFOR3nq
 G/n1rXX3FqRs96ssHQ59JgRKaWtI5JVdlchdAPe1uBuTvf8VmcK3/F5N742U4E2a0JuJziKSrfT
 DWIiAEIalacKCFk+fQLe2WY2x72mEN681czSSrvD2ldAdxkOhH0rAdhmtwrEIwP9fAxxTv5IXGj
 jIIUuV8aFitXKhtSQjB2PFgLebcKBRN9N/J1ldW8nCLkML1Mhcqmez2OH8oYvPFt5R0ThXI9TUE
 q0jlbbuXPUFr5Tdo+tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080160

Hey, this patch has not received an ack, please let me know if
anything is needed from my side.
