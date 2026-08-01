Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAD245012
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569900; cv=none; b=Qq/6E0/tVE3kT6c+HIwjyIvjGmeAKeRn9MUcLLqVY5Gu2qEkN2fD0ycMv47aAfe3ZMlYEj7b/pWrYQX6QhOPnzXTw+lEz3nvOmQMFCykoIGFp5SW1i22R5SOTxrmYCEDJIFp10+Dp2riu2Ng2YEfu6C2Q+WCl0XhJ5HjfCxhRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569900; c=relaxed/simple;
	bh=lM0hNnMe7llCRLpDTIpK45I2Bs76ozytz4T0sGIxc88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiNtrnB+nSOctSdTRKzNAmo2lkfbi2Xv4rocVqNhkgbmoCJL2Xv010vkk/2yuk6/K+z8JSBJgR1XaMwesV7wHwK9auU2pU8yURGMcmbx6tQUZjgYlI3FGSPEnv80YTjcxcihR0D4F5q+P1qIBZNb7uLtP+dr6DX/Q5P4g9PAISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3Ny8H4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY43rVcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3Ny8H4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY43rVcj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713Yaek2002407
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 07:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3judZbl8cBLqAc9XcoVqVm2N10AU762ke6ZkjfT1Es=; b=G3Ny8H4HwRcHY8dd
	Ri73zkMzf17r4Fnt8tlSc+wnfIOKZkl4noDQ8r2z/atnb9kgHkhcpVOCkn6mvfgs
	26GwO6/VGZlXs5pRRwmDP5UQkvJ9VqzXQ6+ainXpTJGYxQNSt1uPlih6c/nqpMci
	PqZ16sgzsxLlHj5MbQzNanb79x/0wHwfJzXknPmACL0e9g0lvw0owqx30N/lnyxY
	xP8pzsT6xGZu99DJ4RBT1OoWrGT+g23+dNwuop5Q0fyYgIzrMWc1Ai4EgPwVzXNS
	0KAeLqp/iCZU/KZoSgSruus6A8Gf4zVMkhcokoPqwF+4HrPOITTVh5cD5Vwm0UPX
	4tQ1Ag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9118ebx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:38:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2373588a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785569898; x=1786174698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3judZbl8cBLqAc9XcoVqVm2N10AU762ke6ZkjfT1Es=;
        b=aY43rVcjI2vG/bThKpe+t6WeSJQNVfqddhaGe4g1KyoxDuayhTNkLf/J8WhrPbKkfh
         UoRyeTwoveAuPoU2WcOOpkQZ8sIxoqCJSOoYowrxgKCNlf+tDxsQ9kIdVa6O506VIH7U
         Mr+VmkhivRqhK5RK3PSvw7Tll+lToCX+oB80Wchu5trcc0sTaMacALCVKvVYpKG204ud
         MsAk//5Rtyhx7R520eWvd0OA3+ArE3KdH1TI20KKW+uOrq0cGSwiYmV17huElxkkFGKq
         vrduxWUMwr4E45zG4OWanwpekXWPUR1OpPcmpZcsX9leDD3dtE9v2jL/RNV5XB3ojbvy
         ExoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569898; x=1786174698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3judZbl8cBLqAc9XcoVqVm2N10AU762ke6ZkjfT1Es=;
        b=ldbd6QvwQhiQ9noRRM7qGVSE1Rxiz7AQODwC0dNw1iO4Zw5d83xNCvTjWGD1Xz6cTP
         7hQV+crMgRAI0g+4+2cxzeZ3Hkyfs2qeIvhzI7tYI3F3SPz6XhCpOTFdUQahUnQbY5g8
         XYB7iZWUt/VasTXgn6c8EVkUQGnqrK0Pi3sVzMhpDF/l3OuvNJx3V1T5eXNwWVGvYZ0l
         v4VHO1A6KQ3Qkjmj9AKi++aaLBcPiSUDPjb6d/EDfRI+nV96YTDc0m2zAHTNbiIpPIsB
         6NzBXqq41g87Uh9hJp2ibwbggfzhkNVc7m8tCPU4C1EeQbqx3PQjrbDGJ8gCGYqqsDMX
         m+Qw==
X-Forwarded-Encrypted: i=1; AHgh+RpZKjFPMlZtyaSeuZgGgZBH8MlcBEDkhzLCyVA3di1DV5tR8/v3TMpuXtonyOC3kMgpCbVu6FjG4xikmIAV@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMcaX36TT330BEg5AV0mUvS9H8C8RPCHinMMtDjnGhiLwUKd7
	ELytdc/6WLyhWZXSq/HhA0paVMJzR9nZ/7jP4B113C4o8hJS0ztdGu3ApFke09VIxT0+0GYUTwl
	Q0xQSvcJv66w49BU5p76xm55kiFpNFtZg9F9lRtMTSuDFiSdSoK+W3GTw0qzKM1kLXfs7
X-Gm-Gg: AR+sD12hdy4+KD5ip2bpZ9ugFMbGOAdMImnnlFNIwHSSa2eiPHztYyfnIUdwYIUz1jp
	k+1BoY4SpJNTxFD+SvBhxEBv93nfUHXWGQbIJt2aT56JxiRj7MU8/LCsn7ObNuVgTVXIpAVzD1u
	x67dRVd3UlprNh8fQALBUiouAGqLy9PCe+MTHCZ/fP6nGXbamq41WfMr/V9bLI+QxKkPaLPiRPA
	6aGt9NaJ5YSb+GVectKCQebpKkhcNzDwh/ymycPqekfkFsyVUZYjCHaUYugdc7MaLD96tPbCNM2
	Qzq4BcqW8q8GDgE1R6aU4JuNmS69oAzRN+3PQWg0CVuNl2rOA6dg754MWLuoOJnUZGsDTaSB6yD
	iLlkDZycpba2SmqQWxHb/FZLNfRyNPSpcRw==
X-Received: by 2002:a05:6a20:6a05:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c92a53b04cmr2587311637.19.1785569898216;
        Sat, 01 Aug 2026 00:38:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a05:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c92a53b04cmr2587273637.19.1785569897772;
        Sat, 01 Aug 2026 00:38:17 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm20729985eec.19.2026.08.01.00.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:38:17 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:07:29 +0530
Subject: [PATCH 3/4] media: iris: Fix power-off ordering to disable power
 domain after clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris-fixes-dma-pseq-fint-v1-3-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785569872; l=1839;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=lM0hNnMe7llCRLpDTIpK45I2Bs76ozytz4T0sGIxc88=;
 b=ysE3G7dmHlNskzCWWJeBtiFW1iEwM8ls1jFTJx1nT/iwkZyDEDNyzlmJvNLMasB94v6ScXdt8
 d87ncQ1GtGwAPEPRa+Xv95E/VJJSRw98uR2tOmHzgcNYf9N+zV3AWTX
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX/OvKjcZa9ATJ
 kATI1/NsXvczRVeGxwkSYJ6TW9UnUFH4XYt1BGwQmMHScRLdBnaQ9MJdSYsv05j8W3SwnV1qANW
 QMuPotmOn7OdKo2rcNxRZiDEsoSvXk8=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6da26a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ou1eOjPKtcA3bHzkrowA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Ws050feXBzjLSihNP3X3mMImnj3AlPUY
X-Proofpoint-ORIG-GUID: Ws050feXBzjLSihNP3X3mMImnj3AlPUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfXxQFyO4ni2GAa
 +KOXY+4DIa9t4EvLVgXrIFTniv/u7v9H9dUD1Y4YK4LBG/KA6HZ0gKdA0Bz4yssVp7jql6TOvm7
 OwB0yHsqv4NTiWoigNB3x7p9TxiLjmViO3zCqhLkg95DOPzueR1693321GEOg3YNoCXhNps0Be/
 GKQMvDhfANvTzs0NYdGHZVUwn0nRnuvm8/1TE2j2CNmsBbUnNQcDotQ77Wcwi7zZXtOIcQgECqA
 ED2Th27M8h0GG3aENmfal0fWbB2/qj8rPVA/NYVHvRKjRcvcOZ8DsJi3EWrRIEXNA6kEKMc2H3a
 OTTAYQxdC69XHK74y/p3pz9h3qpa3xyto5edP+L2cGAGwzrF1KD9tv9vGH0OtQxVQcqwoLd2oJx
 cUO7iX++1qX1Emqs0Mv1eSQgKHAd+m2JHHsRRxaI17Qm8e2t1RSENJrkgO9HEPfhP9pDgUeB/gz
 NzqDHq3vg9s20iohlVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010053

In iris_vpu_power_off_hw(), iris_disable_power_domains() was called
before the associated clocks (IRIS_BSE_HW_CLK, IRIS_HW_AHB_CLK,
IRIS_HW_CLK) were disabled and unprepared. This reverses the correct
power-down sequence: with the power domain already removed, the
subsequent clk_disable_unprepare() calls end up operating on
clock-controller hardware that is no longer powered, which can hang
or behave unpredictably.

Reorder the calls so iris_disable_power_domains() runs after all
three clocks are disabled, ensuring clocks are always turned off
while their power domain is still active, and mirroring the reverse
of the power-on sequence.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..3cd493b06d84 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
 void iris_vpu_power_off(struct iris_core *core)

-- 
2.34.1

