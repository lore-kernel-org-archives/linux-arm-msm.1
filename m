Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA931F984
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609929; cv=none; b=i0E+x8XUTrGdmkCAvXK+EbAPUX3h5mO/HNmJhV2LPoObANqOVIoQ6OgpSXIs2PF4u2WM95Gp4pSJM8GRzw0YBovtKbMSBGAiZ4jIZPCxh6rH3RFioYBA6agzhXIQQXePFNl5t4V5UmMyaJitnNGTeai2HIcZPLPURgDMxkkw3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609929; c=relaxed/simple;
	bh=qnoa15ze5DUpKabscQR+og3fSImuV2NRNDkI/+NulA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQPKAFPpvio7NF14pbZwSD9zdTE8sXHp9+QDWXopRdwD9oqm5UoXZl7hJbNeJt0gZKiRPOD+plCZzSv7jwptR3eFsVGgEQhR8pOg1rli3vQy6D3lUXY6l6zjD2WLrIPFV7BcdiwPElIj5NWXypHMnXImKxK9NKqPu0kcL8ifnXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooS68aOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ON9mh8Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooS68aOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ON9mh8Uk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5h2lE2189882
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125
	ddwWZMu8=; b=ooS68aOBmrURZgb/25YyGnk8Gmn6EcHtdrhc6GnwQPNBgjU/XXd
	Pjmd4JuAV/yqgzsvrqWaVf5oAV07SKru8xcJr5yFAkJ5xU+1EWyL82QJS16WueyL
	m+fRVVCeXmh3vxFJY8+drJrSKvGg1PVkM+KJ3ITodp3bqm4zWxyPTA0/09po+myu
	4qDMfMSt6PiL9D0YrJzm9vN9u8/SIjl3V4FCITu4ZU8Avbq2DZwLq++2I4aLpdT6
	n7Mb06qsifO60eSqc8nMzFvHJ8MMk+NC7LFGNxWa5ot7sBHUYPS6ECpK3BuC3t54
	1Wkr5FotXgsbLT46av/DzvgjofaQpMRnKGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18180n3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:32:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso24758531cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786609926; x=1787214726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125ddwWZMu8=;
        b=ON9mh8Uk4TMMPq3Ge94GV0I467rH46xF94+aLn1SA144fgulvca1LxaX4lKYnuzz+s
         9L1JQ7JhGdrC4NdT5oFuo+unS0Xx64bxEL/tADTX2bFtCE268EVYqfmHOT+FfcgwNzk1
         Dx8JoHei8GWCE1RWL6lhF+6H7nad0vyaMCEqDbDF8irlG05EwIr7nnCDN/EeHRMsBSnp
         5hMHo/cfsmB5p34BOjkbbRoG88ZIZV6sK9LQMLkvA5AhaPzqw5IeHVfEAfOog2xZXrTJ
         fYYvAQ5/D2TRE12HOSBdTxknG/HYIcTNoGFixc0lc52T/IbudROt+dAP6bPi/VGwHpQd
         ACUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609926; x=1787214726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125ddwWZMu8=;
        b=Uo9DuMmt6E9IX7s3Am/1MgQuNFQjAre08oSYSmFnP6kW1FPbkAoWfJ5m41+zfkkUvN
         ZzRHQoMr0iDCRvz5kuWhETDpESqIykifOJeoMrW4kB94fxPr0RQ31JmYN8VnRPk74Yi9
         sqSksx3peD8oArpaJuRn/jETdN2tN1EmtSryX1eF7mE7nudh6zDLE6GsKk7znV1FdXN6
         UcQQcN0g6swS8pOG+04zs1HjeTPYK1KaihNZ17eDmyVOeRx0JHocYoxPCzI37u2n0Pzb
         y7TAtRdXpQ/DK2CdSiwH4e+PPgG6GVLj94gN/sU1zOXwDzCJABoh7EmMhZQGt4w/5G/x
         5aWQ==
X-Gm-Message-State: AOJu0Ywa67BwzH4fva7oBte19iRcvHvlJ57pU59X3+UUuBqMdRpNh8Dr
	DkYAWcWo+OwKwWPJWV4GhNXxxwCJaGWloldvY+LVvzUnlyaAxikHuayFFZcaGMANo/UnRAwBHSy
	EHJGtdri0hCpG7Kfh6RpYvyJwWGTYvkwxqCcFsCuGLa3tq/4XRhL9bn6IZ3eRZ8l3MuyE
X-Gm-Gg: AR+sD12NnG/xvS+PO8SdoI910TfSzoWKLRBuQAVBiMMk7KCbz7frfrGRxvbMH93FIHr
	KDIaaXQuk6jMbeAF8p08lP0fvzwZlLL4/M6V9E6wg/ic/DPMUXmqzB+H2f+3SdAMra60W2Kl2V9
	Z7fx97LPpKOrhD8N4ZlhTw1iqTN3ZjYsJtzWgxXweXmKp0mWd518Pd1R33EG0eyIj3KaklAYA89
	XqSLP2e1z7tbmkYJj4j/qAutcK2psscag9f1exJ3/wRiyMhMHUhXEqho1kT9UR0PKWKcLzdmUQA
	SwV7iGq/GvArAwzb+xjsO1JTlGF76vi8GrOAsHuzn6qwFmouOgYgYZkUXcdqgpCm+uP9QrDkBY6
	gkt8Bn7pRx7/9eLzu+oHseN7BaXSLVl/GFD9fMg==
X-Received: by 2002:a05:622a:1a82:b0:528:3882:386a with SMTP id d75a77b69052e-52d73c49386mr39248311cf.11.1786609926415;
        Thu, 13 Aug 2026 01:32:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:528:3882:386a with SMTP id d75a77b69052e-52d73c49386mr39247921cf.11.1786609925943;
        Thu, 13 Aug 2026 01:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2842sm4400526f8f.35.2026.08.13.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl fixes for v7.2
Date: Thu, 13 Aug 2026 10:32:00 +0200
Message-ID: <20260813083200.10387-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfX3dtCjHaVdAEP
 LGCIKKl5VZyUfKQd7umcNZoq7kVGNAPi9OUAHc7v2BhE4HQ8oJNSVXUGSycp8EBtaSdvgVRqS8P
 xtdA8UeLQAUQISh7nDJa0lb/qJJhr2c=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7d8107 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=LDc0BXCEZu-BGFyMREwA:9
 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jAHSRpNJcqx9nUXNEerivMPHr-hwStkh
X-Proofpoint-ORIG-GUID: jAHSRpNJcqx9nUXNEerivMPHr-hwStkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfX+nfSGmselSmo
 h43lxoqGwjQ6LRc0VQVnnddHtmuRxGgx/K/UOaNi8R2VzpuWbOZXuecWNmmhGE/pd+eU/516x57
 UiruiGC8e9PIiOZp0f1Zk9+fJcT4D2caaXKAikNrQNzIVOx345lsqvZp8AtYo9bawTSp92m3skw
 YsUizp9ORvIWZjCQwy5EVvkVcwZURgGVNSlEqWr7re+zCnhZGPXknjm5DaDyAAQcnO25LOWlVtX
 KdscfCsVt66HLj4tF3T7jaKSj1u/PsIKim86NzDyjmY4OjEGvFrKeLTcRMMuNJ4me3q+m2EP/Oz
 HJCJvLH/jYrD+jzs3Y5eP6HvTauowM8XBOApSQkC3dJXTDjKMlQZw2roJ2FgG+yRLUmVNM1qKu+
 9MoGHke8sS+38aj7ca7H6NpVtO7oYl1YSiiWZxdLC8IrMETIjTqD27C+TZCkT9wB9OpaeByH5fZ
 f0UGZhqo9lhs2Q9+aFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130058

Linus,

Please pull the final one-liner fix for Qualcomm pin control drivers for
this cycle.

Thanks,
Bartosz

The following changes since commit fd46760956509f580f7d3d25db4de10e7c6f949b:

  pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function (2026-07-28 11:11:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.2

for you to fetch changes up to 1e7b04c12c077e8829991833a9aa2cb3bdacab61:

  pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing (2026-07-31 10:31:21 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.2

- fix intr_target_width for summary interrupt routing in pinctrl-shikra

----------------------------------------------------------------
Komal Bajaj (1):
      pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing

 drivers/pinctrl/qcom/pinctrl-shikra.c | 1 +
 1 file changed, 1 insertion(+)
