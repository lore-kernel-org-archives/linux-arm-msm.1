Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742072;
	b=Y6oV3IRZyMjhyrkWeQ8y7nWD5wj+GWXTC3USpO6yLtyGuzRix76HIB5l/NAAVgGDMwzf
	 iEzN1G/9y9XZ0EqDKQdVin5VLFQT/PyI39DcXdMkTkgRCfivys7SWGGtvCaVAN8PAS88F
	 wsT6Joaas3oW5c+l/uK0GJLnnx2p/KZ6aN7ApqlxKzq/4J8akHHGWCxzSvPRPMQg2BF6s
	 piMzK3/BGYHAuZjfm6+3VAXTYYvMjTrSSiMGvitzFAqYr+YRDdGZOe4NDCYGCs04f15oe
	 d4qRmy6e808g4MY98Dmaov1LyTvShHwPiaUY0NqpD0YTMuiBF7ZhWtMQDI9AL0GJUpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
	b=iS0kV9MWamO066LCdpp1nkUHCNwttknVzTiGhHtZ2Wth9yReuefxSVxj9YVo5O8xYhco
	 RjHJWHEjhwHURRgV+PmLPRDTdbmDoOKErli7OuwbE5hxtF+lDk3T2EUrZmA/EDL/BjnDi
	 4Q5zNRy8CHEVeCGSr1lKgYC6GHN1uyitcxwNJ7uBgPRKglW/z4XNEowUbFmWJl5J578Fc
	 A6Cyfmbkvb8sC0wnbvN11zE86+XBP+xdtGx6coOVdfE2g1lyR0X/MJjWUFaua5Mki6Hae
	 ypFu09m+XL7SEcNPLKkhKrC9GeW8UcVHziZop/uW8WEgFHm4z1KVmAm8X+I1aYK9M8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3UbJzwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i3aOJONr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E4606D820
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724E4606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3UbJzwY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i3aOJONr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL3eV3678033
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 21:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mWF4Em/s+/j
	7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=; b=f3UbJzwYsZb59Z5cK8xXeu3TMXJ
	7qaeeZGm0cuCdqGGn6Spdu6UEw0IiqLMZ6n1lQkXit13pIEol/9A6dyawmJMmzN6
	bd7aayDEYF31v5AvAfKHRXfq33qR8coZ8HSClQVR7mZkXseXdiI3Vpr2I7EdDz32
	RMWPdNbHFO7jqmJQkCTmG83D/rMiJ+BBRmyc/IiG26iK6MakxWmfW4iGDoadVumV
	fwn9RWVCXJkJgVEw54vKaTRyLco6eImGqzRbDHmjreCCU9qttw+4atEZCPsp2KO6
	ruNF0YUAFhHM3oQpMnrmpSkdHifvTi02DTDLKGxj8XEyDSeaMhE6Hkp4cPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bhxhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:41:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so18854232eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742070; x=1794346870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
        b=i3aOJONrhWI9HBJfDx1fX+eh6SO4lDhqQ+U0KDkip6m8ZaZSs73RCLNS5h9A34rMad
         sEFpzrgVZm61HJNgX8SuEnuZOJO7kAtrKXPD85liXhHOTsoopVqQoA5/Mp8QYtg6M4xu
         et/yFlLq4vys7BPMjRgqiBVqM0gc2xyrZN0/RiaVZR/anCMmg1l1vQOtDOpg93iU3ydJ
         3wwOKMCN3knKxqMRnJps5epgM3jLi2YZRLHi6Du8yXLgx7LHzu45dZ/Q76zohhAZKUV0
         2ZtVeQg8M9bNvR9/s9LXN2IsEJfvKP64i8hWAwbiaw0YOnBcS9aORALlvOLfBX4h+QA5
         l37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742070; x=1794346870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
        b=uk6WvD7T88diS65oemnWCAf93psUV7NsMkerCNEELeoCALJ0NJbANUmJ+QUZIp6gYc
         YLfMAjlwOBie45h8ONn5s2PqRAlWsyMubn3Jt6j/1S7sXZcLDWCZUmNwYBQtnnv2WiUF
         ktVqvdko1k5q56v/CMtosPyqvzT9etcow1YyG+TjFJO58KFw/LywVHYk22KFxTNPdxi5
         kBTTZNgbaitEUF4f8WV5518wepfiOGpP9idbCOWw8oHLUb54UqNjSbNYqFV338pJER7k
         L5FXDoy8s/74jCOUOdlgbRY4PC3tx2Vl6Moi59SaeZhn8DLHPq1Glgl2KvEKqhqE1tzg
         PAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWZlT5Ed8K2oS9rEu2H8oJ9hyab8RMhaDYczZYEUEepaBnjAZV4tW1ZvZ1QWJTV+OuxTMGen8WFuGJK0kF@vger.kernel.org
X-Gm-Message-State: APuU4Z8saeEjmpFg2oSAIQFjV+1RyviOmcJq91YkTH17bPrUwm0SQ8jg
	bUhw0EQpwg1FYNC7qPXeoq61bm3cehIVGyj3ECw9BwlNNkeJXUN9SuLs84PVdahI7xJ17kNFKnj
	TlwdeWmo1LiiW0g038JVlxatUg54r2b4bznzyGFceyR5QIrUT1NhGmSnwI45xjLzgl9Cq
X-Gm-Gg: AYBFou31k3zbk3AcOdTSie8Bk0sEYKKvJZRYo7Oqtf37xPjFdxb00B2c8icJu7a9Tum
	YTcUjrcyy54iP5tNnJV+fCS08YdPgzmHRnM5iVGJwg15YYV5VncToG2t9boWyYxysZcnarE2aVk
	y28zG7BjDbLXvhUlHuXhsPdcpb515GBDDnMZeE4ZM+M9KcpBvMm4BefOD9MuEsQicNWXlOn8lCb
	SN4YT5VC6OVORt0kw/So39q6XGuk260Df7cEPRzb0K7JTPe2YeH8kJPwnc0JMCEHKy/RJbJyiPi
	VI12BpJsCvSXGBCoHGs1saManlFNvzrSixicKVK9vKcbOk81UswjUx5fFEaGYmG9w1pn4yUXS2j
	efBIo81K3odRckg5tnp8A1EtOnACiXzcZWwF35ZSyRql+FaPCsNUglnM4CU0YdSqrEMsNh9BFzR
	imH5BwiZwB4kRWMqAfmlp/Px5+3qI=
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr22434979c88.0.1793742070212;
        Tue, 03 Nov 2026 13:41:10 -0800 (PST)
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr22434945c88.0.1793742069598;
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] phy: qcom-mipi-csi2: Make OPP table optional
Date: Tue,  3 Nov 2026 13:41:03 -0800
Message-Id: <20261103214105.3605181-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX4DT4hyI4XQA8
 2COof0EJU69YV4q7l4xwp8w3eXgrBZn/qbP0+fHPT7eEteEW861MlIxpoi9O+23w3wk5eH/ycTc
 Iq4N1dLF/es5qD7yE2Y4PLrupQHmbCk=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea54f7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: keMbhfJHQ1agBfOe3h7ilt6mEktZWkop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX6iFLo2/+IC7S
 IcwOKMjEhFcu3pCDZVyQBi5pJQMLx70vKxTYXp8SahCy7In8RLZFdpC7Wxp6v8moEe9bSgIlEZP
 DTqboPqWyJXz1qbed/VTGCSws1teR0yfaHNaq+41NtW9VpRWjjkVpUKkTAXjP/I7Yzf9P7QCZ5Q
 iCuy6ZDPxIojWXrlua8nrj4CFuOXNjkPnBxU59qZcFWEFz4/nbJK1R8hBGdZohdlV1VThfoUsUV
 aulmzlLNdEUJ3NLV70BucMo8NZ4fPbNQnciAq8YFlf4aDznFCdgXMu1LL1tNKJ4e2Fa99Rg2dRe
 ut0Q4vX+ugpKybIzjxN3oDzSGaTZmQzIjXQSsgX8Y8DN0RT1v5OWWNHZy6iGsXTk7b0FiW+s0GA
 rUt+23VmQAWiIXzVF/Va1w+YNV8UHVMBjRfkn7TxfGzeXxVo//sj1LFDdIOLBFOjdXz+ABuKcZZ
 6POeEv6H3dJQHac4bzQ==
X-Proofpoint-GUID: keMbhfJHQ1agBfOe3h7ilt6mEktZWkop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when soc_cfg->opp_clk_name is
unset, falling back to clk_round_rate()/clk_set_rate() on the timer
clock only.

x1e80100 still sets opp_clk_name, so this is a no-op for it.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 3de25728ed28..181813caf282 100644
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
+	if (csi2phy->soc_cfg->opp_clk_name) {
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
+	if (csi2phy->soc_cfg->opp_clk_name)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (csi2phy->soc_cfg->opp_clk_name) {
+		ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
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
-- 
2.34.1

