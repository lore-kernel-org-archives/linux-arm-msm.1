Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A13C9EE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740106; cv=none; b=FJTDCqNx55yo8ZHLqWLpwcNthnUlDVW33Czz29e6EMX2UstMK83fkCLbZ5yCVlxTYtRSlA/3dTsyNs4N/1XeSeS4Dczf34VCzmgW7a20NjRf4pR2wj7ei+OxqJDh7ojnZiO/nr38OBR3rPBySWKmksNXdi0vEMjTX4az1n7Q7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740106; c=relaxed/simple;
	bh=vN61/FzjeMiTrd9k096ePQGc7+pdAfly5/tEHivPF5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ3i6N/F+Zz3iTz0KrySMoG10wvqPj0KFzIPmCY2OXj/P6mOEExYbpMmxTgww+Dy+QovUzb6JY+VApuFJK/teeUzyGXhr4Cv4GcGr2puKWQDvtOUf1RRpwUfN4hnA0tY9AFx1duhzhNPuQ7epurbibkvFIQWzDRQFRsclVaR2Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmJUb33w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVRvGxEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmJUb33w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVRvGxEA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGd2I3732609
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VSGgkwbGZVC
	GUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=; b=cmJUb33wC4Z3reKp9so8LVqyDBa
	vj80nBsihaB1z31K0n24ZNdgfReVI25wbtVZpS7FFFTDc+Jtd2H1kPQ20wvN8eTQ
	yfUuiGV5eBi3qhP2Sy1lKYUOKXSmZdFaifXN46DE6QqzsxPSW4YnJ6Bg5tS5xPUB
	r60zQdo31wN5o4cF3GTRxzwI/8qll7DwjFvnj/zjFuZwlgBseL0LGzjLWYHl0J/g
	IIuLBQlRlkM/imNwG8YefUVRnRU0Ple2FnAifE2QmLCzYWH7wMi/f9jeQmHsKhfK
	olq7SE6GtInDKV40xEa6n1A1bte0/+dL7Hj1H151nwDEwQ9T+7N0wc/Vqxw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqr72m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1219762a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740103; x=1788344903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSGgkwbGZVCGUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=;
        b=QVRvGxEAcbuHyUK3UA6LOJkYDmAJXw9SH76jM6u+KNcy0/qDrD77toPGuNngReQcqB
         NvuWIliIIkMOnseXQOEgsH7uNntyiscuhZ0318cVCpc/+nl+5ko3T3ceHXdV/ZVnfydQ
         6LEFZOwmeiWqpqvjuuMNJ5E0nJoKU2INPTJfwqIAPbx/TNRQ1K5Qk5s2X9PoBHWOIJIY
         W5VktQKBvnj6CQo7id6esQhTC1byWYje/riHNH/hUcvZMCe8sbjDkusaw4dxArw6xwCr
         8H8J8wif5qQfaiSHCS4GwkBhy0VD1tw8mdndO4kXuyEIiHOM08jd7nJg6ihl+E7LJFLv
         Oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740103; x=1788344903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSGgkwbGZVCGUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=;
        b=a5PudTb+RNl+8tO8izJhDrpRUCE0rtvE+byNgq7yrT6C9Yv5CSFQZV7+TZg0Fp/AbU
         5dFKYWVhMuH3hGAUSNeKEcJEYZfY6mtmINPlAYUn6kIkz6/8unmnV6YG6EAiqekORgt2
         XxcvU0wYiUZMBNwAY2vwiTJVH1kEmbch+uDS0e1WlWd0yFxFxdymIkPElAH2tg6hmOAQ
         grXTZA3WbvGBTmv4y3JFVL58AHmCcLQbyt6WqOsiS9dAzjf54GcB8POdUVY/l4PHaEke
         4yuUtL+0XqUwghXP+OKWe75Dsb91buiJzbQbN6/hy+wKG3mTURgG8rmBUsRp9PWWP08y
         102A==
X-Forwarded-Encrypted: i=1; AHgh+RoOCm8TvWoWiQ0LcHzlS2MA6UrytNT48ksseaTOrEtKyhVROBlR5VefnyXEs4JjdDMnSm4WEmBkq/Y47DI+@vger.kernel.org
X-Gm-Message-State: AFuF++nmhmUqOueF7zywKfu0mSZkJO05Ma9/UcyyOV8ph3hvW7BaL48Y
	6ZL6AcTNK0312lfj7ym0WlEq9jWL0yCNDZypjSd8rNoguMhIVeoruiOLfS4lbF1Rg/tP2DzYacD
	tIba/LrtwkHSZiU8emOvqGUGEgJHssgDchxP/ZblxoN1SCqFpWar4uW3XVkxc7OgWy6A5
X-Gm-Gg: AR+sD11ZJ9JfA4ZnIRgziw4iSYb9LteToG9drbIKyiRRnY3ixbz29oyKdY199E7U3UL
	QlD0LJac8wTLmBZ2Rlo9WpMzSi0VSAsELzvStUOwiqdD/Vnm6g1yRy82wT/pUWfUPxVwz6UlDSJ
	t4St8ws6tH3EbkdJWvceZNSyJcmGVLc+jTXN+Z9qhSoJHlTkgpo32phWYp1bnrb5yBtJhXWCrvY
	kxuf0D07jMAy9PY5BGCQpcZKqwpuWG5eQrDjv/0iW1PXoOfr4QHyM7lTbc3wUaKnSz5JORTr5ZV
	vbXL62aIFKXImyT2Giq8ndU+MM9hUVJnqcjGK/Nq9/aWW0Z3nmhK6XpLfC1Bfc2D0XETPWGvyBC
	BbmXBB3v+7KWn3eJKFqWKidYrMOsCJx62zLhSXhI4oe8ZojhxkHHmdkAzxWhp
X-Received: by 2002:a17:90b:2ecd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3966d484a97mr12789355a91.14.1787740103414;
        Wed, 26 Aug 2026 03:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3966d484a97mr12789277a91.14.1787740102954;
        Wed, 26 Aug 2026 03:28:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
Date: Wed, 26 Aug 2026 18:27:44 +0800
Message-ID: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4CSnE44XMPHu
 CLR6o2eCANzUnlSAhbHr4ZmkG3saJZ6S+jL56xluTJiuvBI8ch71IVftcWwdWN85+zkW1dbfZfs
 yeK+BGFcHvL2xUh/OzmrV9YIxeQKtLQ=
X-Proofpoint-ORIG-GUID: k-NVCKllbHfZUvnLM3m6fLXIgUbTY5J1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX1w7V4scOLlnr
 TN33OJrC48l0RJTaD3S3/JOd1w2/pC14yAthm50nHdCWvhxUyfvO1ylKfhWiJ3rXwAInEDhFryT
 7RoBSD/kQ6CzW+gTZteneMIgKd9ruLumeW5aEfYD7BOPmLGbDU5Wjbwryv1AQuNRLITpNFXlY6F
 ryTJ1j9q5g85LRnOU125cVzNKuWmzBX36+++mL2atIStzV9nY6FtIn1OAHR8h5G3odBauVG0IuA
 lwNi8d32Sz22cLKhivuJDG9dXXuRcd7x6yrOLyrClxLvcBvEmaEXsQTeRdXzTXR69rt/hqXw6pO
 dP+bXuCF/Q9iHFRsnObToDnPQXyoaw3Q0rzoRro/SCFgnqLaHnH5cMEPY/q3gxjx3cvJFKsZuKF
 Hk63nxbWxL1teJZyd3kq5cdEFbFoyC06XSoz1BU4hWMUVcpUXDg44420QnlP1Gb6f/jhANsfyLa
 CqXIsJJvD0RPysIfGJg==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ebfc8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lHabChWoiVafOPoG-uEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: k-NVCKllbHfZUvnLM3m6fLXIgUbTY5J1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..717c44d1c39a 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nmxc = {
+	.pd = { .name = "nmxc", },
+	.res_name = "nmxc.lvl",
+};
+
 static struct rpmhpd nsp = {
 	.pd = { .name = "nsp", },
 	.res_name = "nsp.lvl",
@@ -331,6 +336,7 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 	[RPMHPD_NSP2] = &nsp2,
-- 
2.43.0

