Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922704;
	b=WngjmXj3+rFbtQjrywh5zoIKghLm1EcAqUh7HrHAUPKowycingoj4M9VWA8+o2N+NGPD
	 LWuzHFy0ADha+46gnSWqAz7PpGpngY2aNR14lllEYBFzGQJHbzl3bzzq+NbDiqXoxmU/Q
	 d46EgLmihvWofi4JdRFxDDc6LJHaoe5TJx3Vempm2C7iwAf+EihkMk4zzS3ohbabs1ZeT
	 7SHJHLZlTHiOs8jlx9TzqYz/kr1TC6+3mHbXUNpX59axNIMChNvxYv4/TsyyKmGgD8vEF
	 1AOEIJ8rQzS3TYhieD9BVcPzO6+YeKA9oq4bENQ0KPZXOw9mE2eWdFyyMcUKZI/s5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
	b=Ucrq1PU/quWNkk8B4y1fM2Yb/Ene0u3L6NQAyuTxmWTaPcMJ0PzkoHesnZx8TO1gtAbT
	 PlNBz5Fp8+du7c+hVQFlsy/YBZqWa7gTiUYdR/ixy1gcuaTF/Xn3X+WGJDSBFwEPRRWqp
	 HoVbrmKvkYSVu+Ctz0waTkNumoVRTzWkCqGN6HN1sEjSGX7er1fyoEaj5danCFndcJL5J
	 /PwykqRmxYfR5KeFnaqJXIznUldQ9j+XrdRiOLFmHjSpqnxOD+VJ8XiKqmo+mULKIs+3Q
	 XtSiiAqohUZy7VosWMkGlQL6Q0HuhL24yzhjQpkPqSDVkEtccKuT9XJeOtOwK54TRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295E606A337
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D295E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NetMt1170910
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 23:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZPLdkk8872+
	3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=; b=UkMr84MRhG2lwl6GRudk0/V1aKS
	k6KLoW94KwpoB0/8NXIq8PN2pxR0aylngS8LJuzs+1ioj8sPRmPgOiuJuZq61DMf
	Nb78RcqMZoNje9ftXFatgSbVwuvSUsZwZ4Bz1zDzk8Lvy4atOm/D70c0D7pr6SH+
	/uUE4vmoAGYVIaBcznb9huBgRNsta7bZJtxMd3YSpxWgyFTfc+lVbsLtVHreYEm/
	2hBdudXpsOqHnLFHEhy5V0Cq0rsba5oIrS2KBwzOh8LX3NClFBfk2brdXvhB1/dx
	RkTlGEJ+C3EcNoR5cNO0dqSXB7DWUxTiGbJ2LgZ7RaRrbX2kTBUzsKMEG5w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa81gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 23:51:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so478419c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922702; x=1794527502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=jViDaO+s+ivKsMA2QnAHSoZfkgIrZrQTPI2rYIxck7cIOlBNOyEIYeX4Dn9xxB6xpt
         0UWqtFrewptgL5IGTyroBcLjdygbiQeH7GbzmalXo2GtVVZ/NEHa00gWZJzgGqjY3LAI
         w+wMwpcEfTN9bfecGu8hwI+8Rak5qLqQ+YX6nu0F/cTCKRyjVjPlzvrbe1bUaoqTQxBF
         hG1jxQ/gC6m420RNCYWvBg3c5RzDeMTQuI3Cr9g7CgTm3DaK8EjH3yiUyPCXGFwgnrC8
         eSmLzLi2Ik2SNCGZ1e4sr+R9l+0t7o6+1IBb9IO81YuCdez+zOmrvFFbzbhkiYM/ADJN
         ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922702; x=1794527502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=OLIliz9DNQqeZHyVx/RF/7QmiudxouHOrh1skoMJqcV6ZOm15kFiibsJCfpTgH9s6q
         qQxKavPTeFVe40m39b7pHOyPI9S/RIPuq7oC11XXrDLyPRSaudeP5DakZAy+QnTEkeyS
         FhMhwGwSXc2FpX63yRuz1aMUCRnYKjBcK2uP67VPz3pLmbqTbCk+Qn9blrALwIXuJyiX
         QYz0+7kAZWAsyWzIQPMnd2A59nrBCqcB8eZXLqSUJvofBmYK/lHyw3W7LPnx9eKZ/5KM
         tNzPOIR/IQtbpP5cToraonL3qjpHlkS+yxH/cpmRjbhM6KFAeHP4CfSt89nH7QSgeu+y
         WDQw==
X-Forwarded-Encrypted: i=1; AKwUvBz6ikKxHjhbxmDZiLFo/69vpJ6HYzP5PfmFkvtxwmoyZ7I94qJtrp1L61zCaIns4y6gWdR3QSGH7FeC6rBw@vger.kernel.org
X-Gm-Message-State: APuU4Z+SKKOPahc4t8BOwqUrt/q+1V348CTgw+q1ByBfG+KfydGyA7Wa
	Q1ljayh3ykihCFiLnuJM7xRyJQEN/Yd+MPi48jNeqjuZ2SEmzMaTnMET7xBRTfYsmGd75fUQKv+
	JlKLEMobcwdD2Gf0rfqvA0LsM0nPQhf14M45Ltff4wlVCXjE6GlJBWPfTN2DsHkkXqx6N
X-Gm-Gg: AYBFou3/y5V/JkOXBxK0zifMdBToCrn8c0GBHCdzGcujcdNDjEVk2v4aA5Pjm1S2T7o
	LudNQf/BHdxL8qgfnglzBLrMzkfmIjM2kvdCsWJQn0EFveM/1LAw1ly0vFSfN8tdx88GVi0vvfC
	pYi0B2r4L+Sgtpd23dN+9nn5BI+IAqpUzUkCvuGWLPtzpjXBHWJjEXAuatT93fMwhhtsrC08lKw
	iuvC2mFg+IxbRziCUbOeP2fExDLfgrdoqz4WgoFHavSxOQahwZUti3pPngOEdNRGWb77Y4++uSY
	l57rGHcy+fdhkLz1VIhekUFmJ6a1D6iCylDlo1IWg94DbM94AL6x+dcJPGnU6ouLNZtxbortS9T
	K9mK4yQhYlq7/h5eIRuVJhX/fEX2p6SCpRe84Gsf04JORxcdoRz4DHyU5hnTzRqwnxm/8CYg78j
	RAK4mulnBPoY3v5QZvCBm6SSRk7qw=
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666762c88.40.1793922701696;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666717c88.40.1793922701154;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:40 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] phy: qcom-mipi-csi2: Make OPP table optional
Date: Thu,  5 Nov 2026 15:51:35 -0800
Message-Id: <20261105235137.2635442-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0I9ghU74NbT3gJBdiXTGhnxHqiLIiZhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX+n28AKFIgOKY
 lNYlPPtwUSOpzkKYA7v6RgKsLMfEROPB0c4k/Hf2+vN4xi3i6BAhD6EwhBkKess2ZJbTtRbE2gV
 jhuZqYwVFKCrUzL3Lhkyp0xGDFQORguUeFxUJJDmynySetI11z2lI/RSPMjwLniS1vShu66fku/
 ADQZX8UCpybCHnlPV04Okq8XSGm8bJvL7uwNF1fqLcjtgvvn1d8xX+RaPPqmfKS3F0A88ADWlSb
 iYAcnhSI/nU2wQ6x6/9DmfLaq1jPVsJytIbNm/DJr9T6xgPcFfQWJT+FLa4LrmG3MM3f/0D/XDH
 P2EoHHYskylKTDDl4qHyskkMPluvBoVU6jyudHXVcHnTKtd2KQo+ET2YU7p097flPin/LqAgeQ8
 BDRCM1zRdv1SYmvz/EsQSBxv23DGGmHEEh/taW4yzMot349EIw4OJTlBPTj9qvHY0d+IWL8EfmG
 JGHx5u+SHOs//XrpcIg==
X-Proofpoint-ORIG-GUID: 0I9ghU74NbT3gJBdiXTGhnxHqiLIiZhX
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed168e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfXxzi9iHaAonln
 cv5OAZhVw7fLP635z9oGsaE2+1N8RQXa0qxsm4cc+eYKeDMs5qGR+k8qRGlSadW0dXYMfHgkRlz
 Vrc05LC6laxTcj/rdQskou8uRTRfRFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Add a
no_opp flag to struct mipi_csi2phy_soc_cfg and skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when it's set, falling back to
clk_round_rate()/clk_set_rate() on the timer clock only.

x1e80100 doesn't set no_opp, so this is a no-op for it. The "core"/
"timer" clock-name strings themselves stay hardcoded literals: every
SoC this driver supports uses the same two names, so there's nothing
to make configurable there.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  3 +
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..8bebc943a771 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -32,40 +32,43 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	unsigned long opp_rate = link_freq / 4;
 	struct dev_pm_opp *opp;
 	long timer_rate;
-	int i, pstate;
+	int i = 0, pstate;
 	int ret;
 
-	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
-	if (IS_ERR(opp)) {
-		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
-			link_freq);
-		return PTR_ERR(opp);
-	}
+	if (!csi2phy->soc_cfg->no_opp) {
+		opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
+		if (IS_ERR(opp)) {
+			dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
+				link_freq);
+			return PTR_ERR(opp);
+		}
 
-	pstate = 0;
-	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
-		unsigned int perf;
+		pstate = 0;
+		for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
+			unsigned int perf;
 
-		if (!csi2phy->soc_cfg->genpds[i].scaled)
-			continue;
+			if (!csi2phy->soc_cfg->genpds[i].scaled)
+				continue;
 
-		perf = dev_pm_opp_get_required_pstate(opp, pstate);
-		pstate += 1;
+			perf = dev_pm_opp_get_required_pstate(opp, pstate);
+			pstate += 1;
 
-		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
-		if (ret) {
-			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
-				perf);
-			dev_pm_opp_put(opp);
-			goto unset_pstate;
+			ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i],
+								 perf);
+			if (ret) {
+				dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
+					perf);
+				dev_pm_opp_put(opp);
+				goto unset_pstate;
+			}
 		}
-	}
-	dev_pm_opp_put(opp);
+		dev_pm_opp_put(opp);
 
-	ret = dev_pm_opp_set_rate(dev, opp_rate);
-	if (ret) {
-		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
-		goto unset_opp_rate;
+		ret = dev_pm_opp_set_rate(dev, opp_rate);
+		if (ret) {
+			dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
+			goto unset_opp_rate;
+		}
 	}
 
 	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
@@ -83,7 +86,8 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	return 0;
 
 unset_opp_rate:
-	dev_pm_opp_set_rate(dev, 0);
+	if (!csi2phy->soc_cfg->no_opp)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (!csi2phy->soc_cfg->no_opp) {
+		ret = devm_pm_opp_set_clkname(dev, "core");
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+	}
 
 	num_supplies = csi2phy->soc_cfg->num_supplies;
 	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..6cf9e5b956f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	/* Skip OPP-based clock/pstate scaling. */
+	const bool no_opp;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

