Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DF497B69
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260264; cv=none; b=fMz0AVJSYNU9wNBMQgxHnw6BFGF6GxKffrIpGkIhO8aV2GvG+HRNrzDtZF6Yvpyx/1MioXtUxgbVkYL8kI0nSrmePLZRcz3gF3CeQPNZEHo4i3aoUBP4Z8gjHKvm/uBHoru++Afj4YkaMuJHAfq9WVpj1ysu/qljMP+5Ne86rA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260264; c=relaxed/simple;
	bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YIDX8OjOW8f9mw3gIxkrFTY9liux1e7Og2RIExQcoCi4WCkHpoT13I+nG8KDgNvsJMZJVeeUzjDNTKuipkeX7fIqaFnBihTVXg2/dsE9Dx0FZQheU5NkP14/XXhBbLi8JmpIt40KtOenFXgnNrp2sgfvlcNDYbB55pK4ML8Y0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8ksqOCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3jMpEzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8ksqOCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3jMpEzZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5CmH1631262
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ldpVhahcAZ5SyKKj/a7T0l
	AqAoDK8x+z9W+veZE/Ybg=; b=N8ksqOCRAcbu1+ZgQpRSUb3UIXuGOzoTPH4pZS
	xLCydb/IwGzn57lRC+x9mDL8nAnXEsrOgzd8MlgKcNOpzHaygJdXAJoD7NfE9DAV
	0ffvKtdVrTPpplVWz/KFzZsS78ZhpT7K/po3o7ZtnDoqbgtALiJesQhOSLwbY2il
	V+XDheNPuo3wMiJe4PBZhNHLfc75QXvVVTa3OLb3HVJ32hgevOQG0k/gZdEZQR6g
	wsd5PsAbEzTtd8MnnLUMUFqKRnQik4rB3vUKvdtiVNYVUIS8S9cDO/KH5fSEI5dp
	vkajSlHpaVc46vNUp8sZVSgpEwCH5Ut67xE6LbBSxBZkAN5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90bhft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:31:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9336581a2so29610705ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790260262; x=1790865062; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=H3jMpEzZiQoK/uaCoNPhdi0Dy+5cCU5Uh7eeKOa1jRTpdElV1r0EuqPqXT0oTYqxan
         1hj7EefxjtCyw1x3hw0MgvTpNcrCQOyRANYVQJMhsBw8dINJVrzHKHxZbc9ipTv/UgwF
         MlO0lFfrRd9pwmC2dpPTuRXrPlpznk9EAXojH/8tiKnuhsFvir34J7N8roJLfwDCEI6q
         qlGvie6mGK9Uq/eiwWC23X4n3jFXAqAshhRoBR5E0lsWxBIZnUQXqPZr1TjPNyUafVFa
         8vd3CqAl2gRKy/XWpzV0la4+SfYUYQ+EEJnIzsr+NQzKDkfe3SLogE1gGXVePdG68mXF
         7/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260262; x=1790865062;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=q5We30pcmdu5drMTjQ4kfgZjtcPj599YOg2qZ4Rkj59gWkMCJAT/IBQjve0UpyogTx
         BpRj+Rs41nljl8SK7ctKNo/6esKbLSZNnddBhTDuz1XnsPxQOp8/qQyGYepo7RM0iQ1O
         MAIYCQVu1IWqMZuW2Lv7g1uRkdHwUe6mSwwyR5EjPtH40AEIi+kJbz9klyzpYztFHgSI
         geajOuV6lLlgFSjgEySNG/QU/kG3vnPwK48U3sFoKn7cQ6dEb3pCaIsLkH1vkriMrC3h
         Ybhc/D6RCvBUmE+QE7aOhIjRtXpgN9JZdHXKgjnli3DmCIQKfFYOBHldx31W+z1sJh63
         +rJA==
X-Forwarded-Encrypted: i=1; AKwUvBx20EWxhxZGfZiJjxJYWyn1nt8f7onuNI6jgmBm7BoBDA52wE6i5UBOTBu72NfUa0jPzXtPJVxiBa8NAt69@vger.kernel.org
X-Gm-Message-State: AFuF++mqRwH0Vu4mjDDayV0knYvlw6/upjncOnzUmlvHqbR8D5YfKnM6
	Y4DGAtcWdkOI92jADGY2fsiM8nZfqEPJD3oHuB8n7heO3qMr+XOH/k484ZkK+X93vC8CY5zc8Eg
	tDd8/AheIUHPCU2PLkv7QwC3477NYekarht4Yung1t3+wsFAiVTL4Mcn7cG6FF042Mpa8
X-Gm-Gg: AYBFou2pFDFqTIYUoTjQWft/2Oa6gLkBqqjf3CINcGnyqt4mpmw7TxYdLPNAfQ1ycL2
	Dpgy0DoX0D034ZknvZWQzC/K8S+4hsDnDsd+gU95R1Q7Z9/Sl52/2/Au+oMbqBzW5voVMxCxY49
	oUyxiKtfpsyaGvamme/naL7c0f9NJmF60vG7D2lwkRD+i1k3JoZjP6wMJpmxYLI4hXGQqpIUs5L
	jZS5cqKHEyLBysbEDa5Ca5Pkddx/jMRH8J0zgYtYrPVGrOiF93ffGhtgKiLNZxkswymmMok3imf
	XDDHWvBHegJF5d6rS8M0W8vQGtmJfp/rdl+dNkon+T9UikP3opImEZLlbBgR4rUQLvBZyHbbExf
	3j8leLR06jbttw6rdPuGiR1zBVngrv+Ntd8dx3y+Bb65w
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943695ad.24.1790260261344;
        Thu, 24 Sep 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943235ad.24.1790260260770;
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3160sm28994415ad.40.2026.09.24.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 20:00:54 +0530
Subject: [PATCH] media: iris: reset AHB bridge before enabling HW mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB00tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3bKC0viM8tz8lNT4tMwK3VSTlETD5GQTE/MUAyWgpoKiVKAw2MD
 o2NpaAM/taCVgAAAA
X-Change-ID: 20260924-vpu_hwmode_fix-e4da1cc447d0
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790260256; l=2029;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
 b=Fsx6oom71cJ122h37d6jT2FTuZCNGrBl4UQN7681bQwbDGKwbchyDpt7q2uEacGxdn2OuJ4mg
 v4qtkGa+tvNBQo1BAKCz5xaxwu39eRbgpreg9nP6oUcHU8AGu//lyfN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfXxs2xVamf8zwT
 +yDvpW3ZTIgX5B1xTUy3FQPMQ/s4jxjaDHJV3R6lxCXNmZErvOiIraHmm0794vlbIuOPm42cAXs
 iZHCuz5fW8sW6aUlnFXdW+Yoyd75NWY=
X-Proofpoint-GUID: F0Kg8qDLMV4NOq9E0vcBG-MD16sBf7uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX6GgXJ7dw/Pzc
 qMgkS+JHVk8dpVoi2x3lf0LYKbgaqNg4zfuwsFYnCqdTUdRCLhaM9sBj4W+vd+KAywmQSo5rHEo
 hbtLdD8QSy54uVKaSIl+UOT0IFnMq5poH7biMcX48GcwiYoCPMtO/HpWhAJ0f+bicmnDN2+D8zM
 JgJTQ50LbJQMUDnE8FXIhZhjTIVMLgMVZp2uw+kDX9mMUxWoMyZIRt64y1nBG9dnM2TVGrS3C1D
 5IR42QU68N3OiR/KXr5urxwVSPccsIL32Vgz+75usY7G+x4TW125Dnlt/XIYFdD+IQVPQJTM5TX
 fSbhBsJBt5tSSJAzUpQ1EK5TBmrDl0X9V0JplhbbuyYV2aEwweQ8ak0+eDEs7ISgKydyAe5HsJ9
 LBEhAel9cKFHWFuo5EakHHqbp49cfKEVrnkpv3NDMEC1kCivYDZIWVa+tCnMjryRs3urNsubFHj
 OCZaoY9C7VoWjFSq+nw==
X-Proofpoint-ORIG-GUID: F0Kg8qDLMV4NOq9E0vcBG-MD16sBf7uh
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab53426 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKV6TwXv6a9nc5w5uhUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240059

When video power domain is switched from software-controlled mode to
hardware-controlled mode, the core may be powered down without the AHB
bridge going through the required reset sequence. This may leave the
bridge FIFO in a stale state.
Reset the CPU-to-VPU AHB bridge before switching the power domain to
hardware-controlled mode. This ensures that the bridge FIFO are in
reset state before going for mode switch.

Reported-by: Birk Skyum <birk.skyum@pm.me>
Link: https://lore.kernel.org/all/20260913194707.91885-1-birk.skyum@pm.me
Fixes: 95a337f92f0a ("media: iris: switch to hardware mode after firmware boot")
Cc: stable@vger.kernel.org
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
This is tested on X1E80100, and is applicable to all VPUs.
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c1077097160cfc8324e807b4aabd9747812..2ef8004e976e34ac3e5ad1971894253fee77648d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -311,6 +311,11 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
 	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 }
 

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-vpu_hwmode_fix-e4da1cc447d0

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

