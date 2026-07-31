Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EA332EBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466637; cv=none; b=VmwCCgow4eN8NFDU8Kq2F/eCEUPk5N0ny9mkH9BXbKCNm6T8NDS/xgs31hbIE4LFDqwkBukpg5RiEhHyuGFb+ndVKbfVS7wazdPqTvdoFjaRj6F9vU1LzvudgCI2/Ptq5ngmRDulaooFCW7XaDf5Vl6chJ1yO7OlJ/pTT2CWHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466637; c=relaxed/simple;
	bh=LmnQR8NaplGQQzKv8oheJA6zLjE2aaxrrKB3KJJBUt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXJuYNeT503k3wolx5o6p7RAjgJK4dZqcXKBWbXWKscv/zG8hSqkTdcr3yjAluSZxfoeMdDbi8VweHKFA60GJFQQxUWSmA2zhSIAxyFkrp6bWpC0n3NZfz7o3eAJzp2hqt2UH6IiKpwQ6/PXxrTjmK4CEKtQ5K/sqYFk/JPeaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JT6IOEGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MF1KyDF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JT6IOEGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MF1KyDF9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2IXIR2781280
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4IPBnr3FNY/KYyWt0XIIlK3/6t869pGazAy
	1UqhHHsE=; b=JT6IOEGdYRZ/Dl+UlSMT3iYdFs7JcZiwgx97w503viu+mTi2haG
	hWYNJRJ2MMui+18sfKhEYdyQWwxCbkd42rmEr1OCN2r8c8Y7QV4AahN1Ed0m7kdp
	fEpDp9xsqIROstmAfepNJiVK4RvDm8qdGLfzvruQj3O6WPsyQlZZHk3L1BWTvT5M
	L9HwilWojLuCxXPHnSyCut2uyYcSObQdT8bzLYdbb3IJawFDKEJrP96XByius33A
	dweztNCFyVU+D2zVf0VLUbwqR0mC0siI/x65R1CNeECviVV2MeDfGy+OgLTSIPij
	ZP53/2QTkYMRwzig6lPYxKBoxnkvNf8t/yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjtag3xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:57:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b13so555975a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 19:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466634; x=1786071434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IPBnr3FNY/KYyWt0XIIlK3/6t869pGazAy1UqhHHsE=;
        b=MF1KyDF9+Ta1RGSohMtENGl4ccf6UAcNu88l64GXR7ErbWG2p9bUT+jzl91w3H5/hv
         KTNpBHqaoZ9JtaN9SBu7rwnPaCn4AgfmfVFe7iYG9YbFwGdWL8hMY3IqIpN71QT0Phks
         jP+aIhqsWfTw38wtsSACUojg8/rAOr+tiLkGIqgj8IXkjlfkqeqY9oZn5uasmEz+ULGD
         jEhAlRyp3EK8ReBj1iNmVA+tfpCxnsDs9RHBmKAK86kmdihJ1rzMWT+C6MXYbv1Akanm
         tpmtYLrm+OgSFKan4/PUuCTFci/jxcvEJitP7sPA1ZYqM6bO0yvAnVRspRPxT6/KXVKj
         0X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466634; x=1786071434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IPBnr3FNY/KYyWt0XIIlK3/6t869pGazAy1UqhHHsE=;
        b=RCoiHgxpwiRsueQfv9jvK30GMswyfQuhHKStEIfWtCMmseTXCKRnP4gc+GWcj2Qb8D
         El27dyiozknhXLXOE46G4GXQ1L7Jqt0KrKqjwvviF4BdKnio6m7Mg+xWKCnZ4XVqsXCL
         A2NwsZHL2bBxPezmU4Hhu2ZfH5NOzjwFNXQml1DLPPEz6n1ZmdCtXQ4fALwLN3JRZ09M
         EdW9/JN0XzR+lciZdPljTqhGclPHiX30afP8s+s/PUYDyWl3AUTHPfWFqTrBV0j75vpR
         oQmsa8dehcpoBP6y1oH7/yj0kDvicdgC6tH4ZAeb7sPQP3UkMWcZ6cRP8Tx6Rgh3QffZ
         fEAA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8UCqP9BbVLQbPQkQrQnzsTOMfs4S35SsqMWnp6aMf3HNW55v4nv4g5uQwQf+PF5sBstJo4EmsCX+kJ8mV@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6l3r1GLAZL6rOg4xOmwr4DgKnQkJw48VLOVjA2Td0qU1RaEr
	YHtyjEetSEYeCtOx8VbdnmTGeVzCXf9kyd+LVlNgB1Iob+Wl6lkqjTs+Tuo6jtYC+8IysGIIiMZ
	tCDgv0q2SyZom0bjuLqMljXeT8uu63UypAZE8xT+LSzYKBzJw9xzNEvXJT7pa5wVo/VKn
X-Gm-Gg: AR+sD11LpoGhKRxYs7Gl5Ln3LSGKJfIjrhqjqkfCZ24qUENyporjKRt+fO/qfh2ZdDw
	XqrwpmR24tQ+bSpyUJO7mxOd4kcD3vHc/Qa0CoGsUk0yXQjS9V9atP98htlzCm928pCuKtEirmX
	AuCajUqjiKUahI7ddq9VftbFACeBulvGNmzC6i771Oh//wy1bY8Ap9kVHIk3NhQ9sy0LTVA+FD6
	cOzdwD+vOxxfvYbOCUs0UHun9xDJpwlw9nn928xdOiLGjvkvnCcJ6tGqjx1qc8GH26IgFK80q+r
	Er7zoic+Csu+NBt8gbsL1Vb5lTwHao37O2Iv0K4zdtpvFtzvbJJSdEUfYwSXTYz4vBD8YOWSokV
	1ncRzM2EjLKOUgkakTNwOxzL/6nbMNYZGdnjUX2owaahGb96PFx15evHNiG5v
X-Received: by 2002:a05:6a21:a512:b0:3c3:856e:dccd with SMTP id adf61e73a8af0-3c91b1538d9mr143354637.23.1785466633716;
        Thu, 30 Jul 2026 19:57:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:a512:b0:3c3:856e:dccd with SMTP id adf61e73a8af0-3c91b1538d9mr143328637.23.1785466633310;
        Thu, 30 Jul 2026 19:57:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa748fbc6sm558519c88.8.2026.07.30.19.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:57:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: q6v5: Fix handover IRQ regressions on attach
Date: Fri, 31 Jul 2026 10:56:52 +0800
Message-ID: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfXyYzqF3m5yipR
 RvOQj8xZwUXm/X5RokTAeVZ3fEMnKyf28NW2G00ouaqBl+jfw/aLi3IMa162mD5E5XeDIN7QP9F
 Klgn7KD+7oyrv0615vxhOh54VRQkb7o88ujzuOde6BxOfFmIyGtZHd9CgAF0Aw5znB7823QgJtM
 gPAJwQZ1yTfl4zOF8D6qvxbMTeiy9PY93IIsGqxnLmY+zjjdTCmszSV+YqBD0qTlHiBRQEQanwn
 D1bjiPb0EK+SVfoRQxNzLUoAoYkfSlaJRjl+IdfLeIPuYB/GC9d6ESqkmqKQ4VBTROWfcuPcv4D
 lytsLsEcVEnyv0mm0qnDM18Yx/eavLrAKXpy2RVD8vVzncT3/8EqikswvNgCn/7XG6sB7qBUOAQ
 lg0ph9U+Ma/mQZTuuDKk/LzsHUAciqIqyKYczxyuwMFotCX0UbG10g/dnACapLosFxfRXCf7PQ6
 VqpbbyQ0dKL44P4ltcg==
X-Authority-Analysis: v=2.4 cv=ZdYt8MVA c=1 sm=1 tr=0 ts=6a6c0f0a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=21MXtNeSJGEjaEWU5sUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: A_JaWTcDGC1rZzjGjOUwSMf6EuBQz6ON
X-Proofpoint-GUID: A_JaWTcDGC1rZzjGjOUwSMf6EuBQz6ON
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfX0aw3En2BOBtd
 8lnfJ62fTi98jGeFyAk/LyHKEB1mBxzLcqNGmoRsBKXoMJYWEjP8MO3DOZG02jWkCbyn9ea6Lv/
 0ESRrL25sGEhnzO4O1jeKwnOOoC5WC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310016

This series fixes a couple of regressions introduced by commit
bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot"),
observed on Nord SoC where the ADSP is booted by the bootloader and the
remoteproc driver attaches to it.

Shawn Guo (2):
  remoteproc: qcom: q6v5_pas: Fix unbalanced handover IRQ enable on
    attach
  remoteproc: qcom: q6v5: Ignore stale handover IRQ delivered on attach

 drivers/remoteproc/qcom_q6v5.c     | 36 +++++++++++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5.h     |  2 ++
 drivers/remoteproc/qcom_q6v5_pas.c |  4 ++--
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.43.0

