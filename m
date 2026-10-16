Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7DE49BB70
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194920; cv=none; b=qdROXcRu9XwkJAsXK7UkwHYDd4Ze9/jXsU+rRQaBh+PDxbRQIs7hxopIYIlGypdljDvEvAXQjQZyZ3yA2d6I5dy8Ii4iBbo5v5MRWHZ6VwzbeGB0JBgf1FvxmnD3F9F7PqBRYZOwjl4v2jggpivgLmQizAVeLPvbkBFIW3E/RhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194920; c=relaxed/simple;
	bh=bM9+n/kD0gSlP/YIlU9Zq3VTnjdW7BpXbunLA84ef3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QDTVmfbfZ8jI0pca7lh2OPiEF4JqK639O++0/d8XGFMaPNeFP1nK0xovJ80b0HI2f57qmY75POHkwWF1FK/V33Zw1Mo+sTDOnGhc8RdKYd6PXwo8lr8ph1LFpx8z7BHXNETkOT93E1kLcWWafJysN0I2YNX0DbZvXdOvLsg9JLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7FkmJl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS37Fqvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7FkmJl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS37Fqvv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFJQ7552060
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZOY/FRwkyGg
	4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=; b=e7FkmJl5PGKkkeVXy3BFWbkzlXc
	29Hd0SIUT3Yr5EpDDf/FUnFFJGLeGrwQ+tImKWyHAH3TY09RmbaSO5j1PAOSzprI
	/QZY8W+0EJb8YhurcRF9WVnfFa0D3e5uYgsuuqRTX3ErjH37MYyUnChKqrJhJ/DT
	lMBKvf6MJ6R28f0ReXH/R1phY754nptRPAVSRG/WFu6oQ9yBeyQmThtHMhRz6ecY
	FbrYZi2PIS5OfHG0JMNljKW2TzPl5nObNNY1cAAaTPUykES+xhDcE5I5CF9kRJtZ
	S3c54f1Dslux6NKA2fqKTGSSITC6Gp/ad14UMBPv6k7PR21xx5cewdNiATA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrw710kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso668906eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194911; x=1792799711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=VS37Fqvvh3hX/KxFDRW+fwucU5tKhA848M8R6ZSppEheMVBoGaLDGU9L0bOdIfkiH/
         jB2pyI9YauhwK9603BiwcGjm/n1fVX4DfjjYDjuTbjX03fhJ3waJUv1xKwJ8b70qAkqM
         LAXI9ndh8+9Cm4Wks79Ci9a9KCLl2Q8N+VnNLWOwD1YdvwfhB7fksnhaZQ03MsWWbIGZ
         ILv3G1jcQHKlrFiuJNtsJEqpDka9beLNTgnVwLY3lzjT393WN297hqcXJos774PPkv1U
         gPXd1TtuY8MGF6isXYQ1u0eIJ8EFOWy5RHY+rS580qax0TNwKX3eoCJ8f7mtLC5QtyXq
         Durg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194911; x=1792799711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=WFiOZNczjmROaHZ2b8jgtQJsE96uc5W3Wj0DjYHPBicbZgGhraBCAuryXL+6WkV9Xv
         kMpKX2XjcopR+9GkxzOE41aAb0id8E7qzv+2V2lbSywu2DQVRG/nt/W2+YknwEvbI3Qn
         WGk351OOlGY6yBT4uFIaqjyVEZHFuLROJXd7K2IRgQb/i71lByZpkAQfgFPWJyxV5eP2
         HadXJaNKscXlOaQPHPYk+ariUIRvN0VkadUvTZp9G1oZ5B+5VqiIfNbwh9yIIJPnfpXv
         TNlftlSf423V8AGrhNb4qdb/FvsgqKdmxMdzUT20XG0qBs7s6diMaN3aM73UKlBTps6z
         n40g==
X-Forwarded-Encrypted: i=1; AKwUvBxpMj50hqwHQtFq591tx1vmt5dHxbwGvE7P5HEA4cOajzohg62LQ+pizBl/FhrXaijz0tE8j2MbfP8K97g0@vger.kernel.org
X-Gm-Message-State: AFq9FYLBAR01+yFyEnp5mfClv5gINK1e68HeKe6m0CXXfIwW7WX/IjPD
	58XSe6MjczvPT18qR6nmKx8rmwcL2oGv7RNC+WgqtomR4N4WJshYhZ59Sk+gNDku8WnDkkkQgtI
	7f4aNJZe4ZMSN/S0WD8fXrmBmGS5TyxPBGfr0XVcduj9lua43qHJOvfLJ4QjtYiwIkWpf
X-Gm-Gg: AYBFou1H9hqF+yfbhB7mE++mUExzrRjxwRvXxer+oJvvRVq+rm1RUWdlREO2HYYHihJ
	4Bk2xAt6psVX8ryZ5yr9DlmykxQ+a/HTRvdlAUpDMSCJW70iyux5LfAfg4TQHlD4Q2zfr22rMMP
	Mn2QEurofjY5KTjfbNDZk/u++krkpKUqwcJKPiJMx8uhule/iMBWuGmjshXiaW18z3O2Pge3SSM
	9AWBw8jpOBP03y2yMK94nlBLzDAoTDYTttMpp7GpJ3h0M0reRju3zs7n4KVDb7tXVePoncyQI1/
	c7bx3FiemmnaMIRdLNZAB2e5hYf4qFJGsgYsH/WoTTcbPtTNvwBQwVKSl4tpQBfTnLzWr/Y5VuA
	kRjXF4ZESSmhmiSap9tNXbD7S08WcMxu8jW07areKec6S8KvDw5qgEA==
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615143c88.19.1792194911133;
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615102c88.19.1792194910530;
        Fri, 16 Oct 2026 16:55:10 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:09 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
Date: Fri, 16 Oct 2026 16:55:00 -0700
Message-Id: <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX8m0V6XdFjuYQ
 32sPQOafP1Yn3beeqxNyAeOmjtYUbZ/7W+teLxvMSSGC62H0FoysAV63zAM8kn/4y4d0qlIp8Ul
 cdv5oCF+TSZkppjzipbieA7dtx0qPqE=
X-Proofpoint-ORIG-GUID: 7lsQrq_u8wpLLxjmxrwYFMuvX5g2yZM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX5d/Nr24RxoUB
 Z3Q6Ub+3wsMt28C7KHUkmDXqfhUf0ljspJGb52L2GSba8OScinwyJQnReLGmLnYWpx4FVGat1pD
 K136X13JrQxEdt5fvg0bj8sqEVaoTKwUAAqj123KtcxbUJUeEOXfP/s463NpAul7Y1bY0rfrDq1
 N3WKMzc0jgHEVhVAiEGz92sbhY5cXn6geGA4bxN9XqMplgBEGaElwKKr9eCcwAD70HPVF53TqmV
 GKcJpvlL4On6kIbvGWaZMwaskIjrtwBWukB06o1h2vLncC1ePp7WMkk0JjPUoyoZ0aNw99smQ/h
 uWf0bNmaoDTHPr1km7CJPCzNCiP80IR+l/6zbKr+LBj90ZzIJuOyXwr+N3o/KUYi/WbWL6vNeL5
 LmKaMkj/HBb05xkr/9UwEicceFRbTaAWkymNe5LHlFgFGCWD0txaHda6Fvz6V9oLBbXScOz1jdL
 +lTBC4FzG9szRrazr0g==
X-Proofpoint-GUID: 7lsQrq_u8wpLLxjmxrwYFMuvX5g2yZM5
X-Authority-Analysis: v=2.4 cv=XKKl2ghE c=1 sm=1 tr=0 ts=6ad2b962 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=sspf3fhusXUOSPWbX3IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
and SA8775P share the same CSIPHY: in the legacy in-tree
CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
and common_regs_offset (0x800), and camss.c gives both SoCs the same
pd_name = "top" Titan Top GDSC. No new register data or power-domain
wiring is therefore needed; only the compatible string is added.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 821c6a0a916c..cef4a90ca539 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
-- 
2.34.1

