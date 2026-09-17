Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06106456DF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635826; cv=none; b=uy0FkaefXI/3dF36P1QPmeYrU2nSHfRL9MBmOvMXPk2NJlJPtWr2AWL1O/xTGgn61O4cqMf9V4eCKDXSfsMaaPqD1QfmZoZ4TRudZ1oh2PDNOWPFUPOtG71qaKdsSOmcM5jmBzVm17CodLffRabjWeGuZl/sZyCrPJFp8Qrwqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635826; c=relaxed/simple;
	bh=k2jqd3VB7Ii7gobWh98v2nPkTWWWHJqnFwtRiqht5QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6Qt1e/NDOX2Q+Gg3tPy0HkVlAmRwdIwnPIdGp2wAaN9B82vwG5zU8E/tHauHhe8BexiYvm73Efb3PbDmmH+ys8uSIoCE0OWdAW6E7dE3vGr0CWYnjsjDHGB2XWGsmTgHmTaFsPwrMvW2TFzfVnxUODBL9kB1liGnoFt/6Y/c58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M44fFOy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DR8RNiKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M44fFOy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DR8RNiKe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60sVq1031594
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=; b=M44fFOy7FJFqVmKU
	sxTYyPNTq/3XubtKzX3oRmju5QJjqu6uEgK91d/fBisAreqdqjhKxsTogQuDJgPG
	unWWtAsIe5/I4krfGjSIuJfycuEsMdPPOo/UBa+z0ZBG6RaHFsYABw9XGgHZ/Qgs
	uGjnEmzLROFncKWmduJtVX+EZG1YlR8j2e4heCfURdZ9/9nwmlaaS8RJ54lZY1+T
	5pe/KY4BKO2QinB9WhpUyCcW1WXySVUCs1mFbif5y/mp4rdK4HYNNr+Ju/Pn2rY0
	IRJB2AcKrcQ1Q6pCrfroEFxs9/gpf0BjyqpkcScFbTDN0jLBz9uB3LGawUuk8hCk
	xzAgtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hbdn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:03:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so24006185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635822; x=1790240622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=;
        b=DR8RNiKemfyB5nY7DwtmS0E4TgjKYwwuni3AoG5MucM/tGKUjxtkcqkqN8IGaTavoZ
         XgLNekRqQkdezUN11YEvNXcc8qBNl9VDsQIK9wE5IDikGquqXGYXL8n/Kie8Yu9uIrNT
         jgboDJuP5e3VWwc1ex+d4RSR2CzvYW7xzNI+fGAhkVxU+ZTOy4y2kzCeAB/aYWtKbPk+
         B5Ot4htGdyGbElibIGwEQwKAjdw9fwsBb/VPZKnNaunmeQ/XIm0gwGFoEvrDN8Z4VPrv
         2VYFCWGhI5TV+J7KdhczOqTHsbjMtmLpBo0H+K4pj62fPwEMG/BJzv0f8Raez9PUD0HP
         4I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635822; x=1790240622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=;
        b=DnGB+MIRKlHf8iKXXlz/db+UZyEhnwlX3EpNCJPuoBFdU+Kk5PPsd6EW3v44nT6ntI
         JlwyB3lhsAgqFU3bz2SPH29FaTN4pddyU9oFZ4KZysfUsg+FtzhdCPmLlzcTW6yxLGya
         PUzWwe4NcViryQ82XOR+vScHIEOxU2c+myEUxM0kP6hjHC5pxdWlJACZHs67or2aWvXc
         AELGiG4GFrnHJtpU5IPEhkE2b0ZcADb9Uevp0q/t9eMqAckRZMySEcOWnzEIV/BjetiH
         k81KZAS2pYyaij4cv0Afo1w5qB1a6Dwm4EZJ8E3r7sbV9cVMgBtkUZwtM+rYnTbNHxSu
         bQgg==
X-Gm-Message-State: AFuF++ka6kDPallN40Sh933rAXJ/pV3m+LtdyPjfKXF/xBQMpDwHmJCX
	C/wR80JCr/82o7Gd5whsQfslWeRPke2tbuXMD10M2Bu641mk8/9Gur4qQs3woT6uZkBZcEsmfOq
	f52F4qB9ea4w+rmTCfNAPFhWAKWShZ+yan1Mr4wvDtq8J9bZHefEUNSPjikyWOIPsi7f6
X-Gm-Gg: AYBFou049yw7fUer5M8/j5VVrrAxObl30q37eD78DAxOTFleU3TDu0Xs+t7qHhvl4yi
	8YC19If3sqEq6iXRg/7eLS5Qi9XKS++LapUegv8I0sKIp+B6liupgmSrUIQ+gQspVqFdvopnBDU
	//Uk+80x1b296n90sok8S60VDyiHZPJj5i6snB8BjofF2jBDyZkZy/VUp/sOwa8M/1HAYmzB5lm
	eCWQ/6x1k0c4NoTl4raooNHvdJTYQkV+LtYEb1XvlvcPQPrAfRNsX20LtLQ5xXaNxJSgVpC7oL/
	xbTeRdJcPiD+AOEX4+VZIF2nIiiX4+Fd5CO7tgN3SecA/hJwoUNfV6kDvBweeCTt0KXLGAfe8n0
	h/F88Rzy3hZYAXSSU2VpzQEdr9Jf5llx6
X-Received: by 2002:a05:620a:444f:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bd3863e96mr28970585a.0.1789635822237;
        Thu, 17 Sep 2026 02:03:42 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bd3863e96mr28966185a.0.1789635821769;
        Thu, 17 Sep 2026 02:03:41 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:25 +0200
Subject: [PATCH 1/3] pinctrl: qcom: hawi: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-1-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=867;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=k2jqd3VB7Ii7gobWh98v2nPkTWWWHJqnFwtRiqht5QU=;
 b=GSrXki2rvImvWFgnICiYooXyvdFLpaoCy3PueoBSTU+IV33/vv3OpPk6lRNFv3RGqVsa4dNbU
 u8IjIUGiIe8Bo9fomEatUuK0JEbbIOfVVNTOmympk9gFaHP7zKVi9pd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX4Uq+a+hrSTFT
 I8GPC6ZIYk0AbfvCaaC1BOhJ9biV1QTg5/0bMIQmAb6Sc/KbGBKWXy43KnXV5kkua4AAnB6aY1m
 1eWg5ymSUM+8BPW/Zlszv56pyRNcGcySXkNQvQXU3ae3YgCqB0b8pAWN2koiTQAbvXeLg4rF5my
 4Pd1whwLkIKtX5B24Q/bg7mP6PElba7xIvo4tltCnT1/8eWM+UfuOJSqLpeVf3JeAswOFd5RH5G
 RdQXMBMqFSTvI8clH4WDj8ufeSxpgUG942+wXebYSc7OuOJDwtZByUPQguon/OW3ShB8qyaM1LO
 SflAS60nnp+EcP0IqaW2NuGjbVO1rWsu2TRxrj2mU83ZTdEv+8L/IHDJiwT5XCU5tjA3ZUi8+fp
 FpH5MVBhsP7OGXeM9zRc4f39qShM2XjiplmscggKKYZYlS3V+xdIu/e6BtuaqNcpWgSGVCiAqtz
 KVpLtSv03jiPsYtppYQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabacee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1hUXCM4H_6GI46Wisq0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: P_b2YGzQ8FkMZw-YrTznoPH2Y7U3PFss
X-Proofpoint-ORIG-GUID: P_b2YGzQ8FkMZw-YrTznoPH2Y7U3PFss
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfXwe8cgGZZcsbV
 /yaZLX7bmCnj+4l3dDqptdy6Q+ehBCQO3WQZkSCzAekCxYKqtp29g+5zcPxRgriJZ8VfvenDm1a
 4q+mQ6LfGo/YKvKJplEVwIubSgnRy5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index cdde69e954a76d7913f26ff33df21ea72349f74a..3486a6d63d10e71b0ad78f10b0a88bf6f47db738 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -47,6 +47,7 @@
 		.intr_wakeup_present_bit = 6,	\
 		.intr_wakeup_enable_bit = 7,	\
 		.intr_target_bit = 8,			\
+		.intr_target_width = 4,		\
 		.intr_target_kpss_val = 3,		\
 		.intr_raw_status_bit = 4,		\
 		.intr_polarity_bit = 1,			\

-- 
2.55.0

