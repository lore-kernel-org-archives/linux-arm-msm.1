Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50D331EB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125734; cv=none; b=f4jAgwVtZjNGflVzDZTbaCve3MlSJr9ItdVIsqjxIyXRhlK/RChISQhL9M6dYB9sNORozCgH1TJ7GVmx4PgtQxue/Oe5c8FoiPuRQSJD9wT3sT9UPJd8e1DV2AGbDxJ9PNRkzjZAbfSPUHQsCjJOhxZSse/M472IGPZpUXZI2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125734; c=relaxed/simple;
	bh=6L0tBYyplIQ6seGPWW4VFRe9yuGstOvOQquYgeMV1tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhTDjZ6wsjk9FMShnOITbjweE/p7aj6A0OLg8pNU4hpV/g+/B+0qnq3vL44H0UWOaEFc/+QzY/Srexo0ktgw9QoTmqoTqtiZMGb7w8zc+z8tn6tpzrGcGHk10apf+yyb3kc33qNB6dXLrDSZL43eDb6xriEjzhDAfxs3rA+/WQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBE+kOSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5e1JbqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBE+kOSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5e1JbqV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN8HSa1402779
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=; b=GBE+kOSK/CqNAn+o
	9BjNRHLqUPyaS9JsxcDhjZWVYqYJAdisIGuTVTfe8PUgeYWg7tFfBp/+xJnseghN
	wUUcYOCb1b+Iu8goskOlo0NoP/JqjnDQ/G4trRGeMlG+yt58Z7SushnAChxq3lOx
	2pG9iDsSShi1o94GOE/pLkm9hLq9edFJpsKxlSQDKV+zPoutoq/qrEodfxT4P4ht
	hK9keksXyJVwAHD4ISEV12QPlrtukFOGvdQ8OHzotsnnUcn2wKXqvgric4LYdrbH
	Vfvtj79m+tJ2LpHeZcfwXZTrIlaiV9kbwn1hXedhQjW/Fs9AopcGhrUx85t+nD2j
	iKhnoA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318amt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:51 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so928023c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125731; x=1790730531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=e5e1JbqVnmMOCC+I3+RlNoed2MfmJSaPoyDZ+ghhFlpmu0yojdrFCoDxx9U419Heqd
         uvLojRnIfyPRT0S1tVK3GHlxrdyEK4gRjTiYqeyuUSiLVZtYTWwgYMrDaTB8AURp9pvO
         WOqDXZl9V9kjACetyvz0Ced4/4PUgh17zuTFdQ4SJeU5MCBN/1XhPGz2m4TIlvQ9cPao
         yJh/Oz8zx6Ig5Gf1rypjC3MdYik3v1lcA4EORfQMHGgG7LcpLRe59pkKqE2HTZUedcVG
         +ZrfI9p7S2Bij1ndHgDIAKfJ2jFWYMbOdU7RAod6T5s5ctGul1tWNzrS9czm+G0mKRiO
         WydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125731; x=1790730531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=AuzJQ07t1n8z3Shru5eyRCDa3uGO4R7Ur5YUaHwIwzg5p9FUjAe7n9ziPJlZ8NeQ10
         aHSOz0MAH+D5bvu7KrEi25LiQeZlLnu5UEp+H5IE5dX3oK8XY5+WqjIh6OxjZoh4qYJP
         6fa+09DAcZc61H9LfY3XPeCaA5ZK5K2rgRWHXXu0Vyh17DDFw3GvqpdJVROj/HpykvTR
         5mvItsNXtYiuF9ds4+e4qKL0aPKsPkf2ox+s8kNhiY6SkFyVKveXZi+aOEehQ3sNyRi1
         EeHWCZn2ykXlWiyiYneSkYrIXY918m7b4RC5APG/7ztAg6DiCP0gUJeQrBSEKJ4F/JuG
         Fkrg==
X-Forwarded-Encrypted: i=1; AKwUvBwPMo3aBd2gt4YL1DS7VWIrpueK81OA6IWy0sobbEj4icQaDfV5cMzBOtZyn4SL71hdy0UzByBH0NNV4Pw7@vger.kernel.org
X-Gm-Message-State: AFuF++mKWHBvH93BlGydknx0daGphH0vTzoCa5PXjrUQxi9bkXKwN070
	NGGIw3Esxbr+T0AH+ww7CU2zvs+Y+ekR61ZFn+q5ZQA44rGuyx2uWgprkXE+9V2sp+LPLvpiuNY
	gRbsduPnVJNdb1JxgLZO4zqJnfYUjhO0O8utNNEKa+Tq2ceEP+SMW3ILOmZgr+wVf2+hd
X-Gm-Gg: AYBFou2SVl4KCM356Saa9nju59CJY83qEQfD/xFKi2duldmG0Fxt9t3Ti/L6wQpL9hG
	Hra/a7KI4W0yfK9Kfi10wM9vQTgyPHLhQLjeZLsWgEnpMGrpCXiQQqafA7fGFZFHaDFBBf/ynzt
	rgE2NrfjPwkH5tB94ce098GwmYfNTPBojgcVwSR5W0CCtGH6WnQEXwbYp51tvAAhzTxFYFkzQNi
	Sk2pYIJwszK8zIraMGTfAg5Hd3f+YluthtX8kG20EOPR5CIpLCMilQ7DEw8ywojQemzz3AmdwCL
	Z1npNJH8y1cEvRzwnExXLooTl8HYL+Po0vYN/MukszYaaoAWgOtxaeDfBJA6GH9jFve+sf7wetQ
	LjX3p18/mOaT9S0mOOp3IVd3V7z9T
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248789c88.14.1790125730711;
        Tue, 22 Sep 2026 18:08:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248735c88.14.1790125729855;
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:31 +0530
Subject: [PATCH RFC net-next 5/9] net: pcs: xpcs: initialize runtime PM as
 suspended
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1703;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6L0tBYyplIQ6seGPWW4VFRe9yuGstOvOQquYgeMV1tk=;
 b=z3cMy7Tu8YHBAgVXBHBIIhABLigrMPxhWRGWgadww+VwRWN+w7Titd/SaYgoc53VgWiAjo5Ar
 wlhZvZF5Eb2C7XVC7uM3dKyoY9gjV2ZuDMXUWq4G02oNKHRWgzghSxL
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: aEkmM3dScl-hdMubyC06SE-7-1GBkpWv
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab326a3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_2kQZa-5yrNbEit3ZwwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: aEkmM3dScl-hdMubyC06SE-7-1GBkpWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXx0cLB922yupH
 /neamDYoWMnvIXgTwm3AlIQFlUyrSAiuT+iPwDm/i7L+xKX3J1EAsb83RIx+6Ah8d/mJVr+WANo
 M/2eOqYUlJsSrKmUbisIoOgdb6La69U6UP2O/kUcEtuwzGHdSmXDG59Df3oPfglzQH6ZBpnU6dV
 eD8Hz6eIRXtDCraif56caxP3UMCw4quaq1RSuT5iIiPjd4AXbWbMvepFhFucjA73geLd9fKpeGG
 WzTYQk6KS6WBfeaxdheybbzpLV0xX7VY2BtR0qC3uPpM1xSQzUAJJKtPwvnAFNoWftLpQUt+eye
 HiOQPBFMy2gZKRtPXLohtioTThyhl5Pf2izkvQfe25A8LeAiddDtmVQ/G2Bd3EiggUZ6vovkmJY
 x1Y8Xdr+FvaHUBXxCXNx7WU15Tx8dOPo6o3umDOazCbBKufyNe536GpbIbaCG4MVLYRulKQyXhR
 GWaVLmjOX1wTKQvBHYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX7ukVMwIESJkE
 O5hycPb/UpEWH4T/0w3rjf/Sx1U01p+1ybgBbja8LZF1nygNIwQZBM1Kwiwf2ME0DVpOdtHpXn6
 2+VPfztWCJ84YWBPY1A36BkxkfxRk1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

xpcs_plat_init_clk() acquires the optional CSR clock but does not
prepare or enable it. Marking the device runtime-active at that point
makes the PM core assume that the hardware is already powered.

On Nord, once the XPCS CSR clock was described, the first
pm_runtime_resume_and_get() accessed XPCS registers without invoking
runtime_resume() to enable the clock. The matching runtime put then
invoked runtime_suspend() and attempted to disable a clock which was
never enabled, producing an already-disabled clock warning.

Initialize the runtime-PM state as suspended instead. The first
register access now runs the resume callback and enables the CSR clock,
while the subsequent suspend callback performs the matching disable.
Check and propagate the state-transition error as part of probe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e013a5253a22651220e62352d03faabc3a3c3658..328c50940d46eb8e7bea06ecd1a20214e3cde61c 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -322,7 +322,11 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
 				     "Failed to get CSR clock\n");
 
-	pm_runtime_set_active(dev);
+	ret = pm_runtime_set_suspended(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set runtime-PM suspended state\n");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret) {
 		dev_err(dev, "Failed to enable runtime-PM\n");

-- 
2.34.1

