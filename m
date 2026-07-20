Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC9431A5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559231; cv=none; b=ufFbDm4KdtGhZ3fJwvLgtM8UHInGSr0E0R9tDHhN29Dh0DZ5nO5D7UDQPzEB+aNquYzqB2RgG4sWOfr6lz6cqEIQkBPPqOmOKLG5j7IWDttPwVp8j1oUDoPcDxxnDoI8bGR0V1F+9XPGGj+/05syfZW6720ds/uSJUi/dVGi3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559231; c=relaxed/simple;
	bh=hB43yDM5wPsZ0p8kCzuf9vWRzlFYjXS4Z9sUYHruMMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2TliAsNjhMy/wJXtr/JEBUAAgtxSMwD6oSSAhnxJ7Kk6tsvrDTzKvowGPEqYU9uMnyqjIIv30q5zb9mbyQb8Dcx+gqGhLzmv6nje6ckueFw7xNwRy5F0bV56UVmfNIwiqrKJ7opbDTcD1RyFl5V0MNlCFbZZSnN/GqRBDhn17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDkujJ+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROxOxa2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDkujJ+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROxOxa2e"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqNdZ2836901
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=; b=jDkujJ+qSnwsUxBm
	1EcSaMqdPQnJdXRSjJ71Vk3+7L4RhU343dllQrDcrJLOLenLM9zvKKfJUwSw6RD+
	/jqQo7fJBzIOa/doGt7vuNlKeu6Q/H/LY0VisR0vHWQdpzcowTAPpolv9zjLUZs2
	PfJycizd0PLli6LiQjrtsEFGe2LrA+x3qo+QBFTf4bv4R09WmFfvTeEJf3xLZdti
	dLWtCVWDE3bDG2hmdCckaEeih8xRpLocG1XoCX6FcxvkF+kc/lwQ5h666UeCrvhi
	bHgAHauRpOe5gxHfJNzn0u7dn+qLMHj+AaiJj9WPiMuPIkhtEUrxOjily4VOihdQ
	5dYpOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhsnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so244498031cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559228; x=1785164028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=;
        b=ROxOxa2eMlLmGqsHU8tLqJftBntKlxQY5HOYdvxtdb3arbz/qbF6+83xhyxb5i2dus
         +8c7YwOZLe5UfvrgFOtrs+4PTmL+vtg2GGZ0B9WmOlM+HY32IFIUAT68QDi6NmTeUqmx
         UWdqSd+Jm4GRsnmhaVSChqNBqCiDTwTf2YR4xPetNnxh4LZ0swXPZMKx1NnTe6cPHsgC
         fHjpAv1RtcgwYuhU3MpGesTizCHzRulEYl/h4CbKmVZ/0LaRWNdgV+Scc7623tfs7VSp
         Safmg1WlNuWCk6c9ZItxW9IWdTxDx/m+k5yMtOqdvF2D2N8TEmjAmSP9kBUD65Tj8EpB
         2Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559228; x=1785164028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=;
        b=S4xuZhAT5aai1wkSl5t6iyakMUO+F0njN5btc+AUb3ev8I5rXf2xh4IwJZ/ytN39w5
         YHGvu3kLcWRRlaiOS9lI9X4kV0YIQShB+/Kiafcxd7KYmb03NgYzC8dvyEUqNezUxj/r
         XfQrHz0o7AKlZR7IQH8eKsLk5MTUOpOE1GJxJlUPYXr6kevzH5+NOHVYY1B2SngXxt8f
         Gf744MoomynKVIEXevdqnayd7LSlgdBMy1NFjorV5oUYXwpsU/Jy31pcPRWC57IFqiPJ
         cdcn7HGYT4DMhm7GN8GyDmxtu1xWANlU3v6Eh3UKN/KmDqKKz224IpaPaJCpmwjNQ9A4
         3EXg==
X-Gm-Message-State: AOJu0YwH7LA2bxLGdv3P33LYu5i++idrJZNn+wXInEtrpob/h3mMUz47
	rQwjAAJMP6Ug2ua6KEtQrmX2Dtt8wDJYLZ+lPFPeIYLGHWv4WhwHasb0kmjBj3gVby+bS5PX0DE
	HHVPqCUn1PZKfWWhC+EnauuxqWR5qFIvRtpNU3HtQDTsBjoeLXLWC5+/2NU/TOm0Fgwsj
X-Gm-Gg: AfdE7cnoYrRlQvp7moi4dR1oXecBf2KfOJNC7agM8xIkZyVNSZ+xavX3d/ZIsRu1E10
	ewJLSlzSS+Wpg3MxWAC1r3i2bt/DNB65oR7Xsm2QlTiRLtcWdFEZeuIn5E6n3/gVoOWIcRKoQdG
	y8LLLGTi4sGpBECfk1CoKarCTJu8q7wjz4DS08otOepoKJGuRms9xYnQuHv5rz+Olo3GMimZ0bk
	TyX5HVxrre9b8wruztTgmrJkPrXUaCVNT0dkQM1FPFfgc8HHb+4LuGzcXf8yAHSCs9lpp18JEFv
	LB1jBHyHcIG6PDmAz3NLurZ2lZvaRO8n7TlvhdcXx4WR1aKqFhdw20ccu/4P4EYG5BfyGNTLcuX
	0nXtIPSQn1Z3jVLHQ9a0Bu1afFfQ+MFh+KaXJ0HQ4q29lpArchiuAcR8dp2yfVol/8Li3TyMa3E
	zjpGEpusfZvdLm9QZbM+G9SBbcflIMwzQJ0XpPbebW4ArYErACIy0=
X-Received: by 2002:ac8:5e49:0:b0:51c:7b11:419c with SMTP id d75a77b69052e-5213f36e3bemr143371321cf.73.1784559227929;
        Mon, 20 Jul 2026 07:53:47 -0700 (PDT)
X-Received: by 2002:ac8:5e49:0:b0:51c:7b11:419c with SMTP id d75a77b69052e-5213f36e3bemr143366741cf.73.1784559221716;
        Mon, 20 Jul 2026 07:53:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4800215a12.30.2026.07.20.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:53:33 +0200
Subject: [PATCH v4 4/4] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qcom-usb-phy-fix-null-v4-4-4d2a0f06d53a@oss.qualcomm.com>
References: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
In-Reply-To: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e367d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXyow+ywey3CpT
 rmEFW3SX2StqKFVKhcK4qqdSRTjm14Qfo7HwgMNMjc4MDbfBJp67mNh0r1z8ZJEgiEThHbGWQEe
 af0FZpXXuU4eUNqMAxfgoxHiHwnp5ok=
X-Proofpoint-GUID: QyRcB5NdSfvSZ26p1Qq9FaQE_-CXSTmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX9YgFuQtlLo0R
 hTpZDWvI9CLrzs7mZwZRsk1dqaUX5/3waPYENg4TuftXIWTamgmSyvFmabL7hlaAMfvPSwLbDtI
 0U6BS/0ro8rKDBDr0iuGD7pWKMgphEmHUwQBsiqnyhkFpUUpm7AiLzSOQ2lPK1sv6un6FQ/Qej/
 JdqrMSoj3pGntFYkfyDRh6zfxzfMtH+99ymzYXmxVJsVdkrcksmITXvolJfgznkKDG0nnO0EoAg
 g9JWexBM4ASSVpxCUgqLBBnSr2CGRAt1pR+mv1BqyCfA/f8EA81i5XdXmxiH2liLAkUfhvF84YZ
 CdIsUzGygMAiRq8ppfa3GH1R4XFoPj5nnoOb9AuX1vkZwb/n8I/dKUnKICiLDOUUKi8pz6KWaBZ
 GXZEL0OD9wtyMHbE5qbpqDnFw0S2XthTw3IzqZpk6D6TykUp/3lcJzKDUVnaz+f8ndbcwG33aa1
 SjgmA2oYfe8mmlvCzqQ==
X-Proofpoint-ORIG-GUID: QyRcB5NdSfvSZ26p1Qq9FaQE_-CXSTmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

Runtime PM must be enabled before creating the PHY, since phy_create()
only enables runtime PM on the PHY device if it is already enabled on
this parent device. However, the runtime PM callbacks dereference the
hsphy instance, which is not yet ready, leaving a window where a suspend
callback may trigger a NULL pointer dereference.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHY has been created, so that
no runtime suspend can run before the PHY is ready. This also prevents a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e03963bf92e5c822334f52636abe7..b1a85518fed0a7a35516d16da3ebf69afe760e40 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -599,8 +599,18 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
+	/*
+	 * Enable runtime PM before creating the PHY, phy_create() only enables
+	 * it on the PHY device if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run before the PHY is ready.
+	 */
+	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
 	/*
 	 * Prevent runtime pm from being ON by default. Users can enable
 	 * it using power/control in sysfs.
@@ -611,6 +621,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);
+		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 	hsphy->phy = generic_phy;
@@ -622,8 +633,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
+
+	pm_runtime_put(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }

-- 
2.34.1

