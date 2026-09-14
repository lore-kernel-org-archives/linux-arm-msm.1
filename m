Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC8F484234
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390169; cv=none; b=njaKQQgx12ym9O+MNnZP0ZWkuIkMYFqCVx+DIKyWNdgh6TLO0WH5h87M/PN3au+fUVaV3Z03xSAhYoT3Hwzqdp7GVakuWd+Nex/NUpQJH05lcTHnDUjItYwA09U0qo8ihceJfYfT4BSfYjHHFBD9g1trzAXXklFsW+AZmFrXvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390169; c=relaxed/simple;
	bh=GEl9Wsz08G8vYZkWRMFCpqdpxIKvSTnuFhcT+3Eyy7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPZlrZSieuwCJFOAVahCixtSARHoORdT1vMY9owEQzG75+evd2IolV6XOBR5LzSwyxx9EB5M2IgPHxZanbsv34NO/Cyi+NCpKMHn3boZt3TFD8DYMS4nlzF/u8BVbQ6nZXiytWeBAKITQzmsoZks8gBEcGSRxJ1xzziploOmwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8ZvvfDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMZMN3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8ZvvfDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZMZMN3S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxTA1460629
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=; b=F8ZvvfDKdjGvRzms
	RRHVGaUF4fZqNxqMOzhcrK9sq/wBVK/XyYKbSAobGyHUlWf0THOPAea3FFJk7Fzt
	vA2f219/q/o3HcXFHkHEOxrN4V+dFyURXrjHWlCtnDuwehXtUQ82ourLJQ/w5983
	C6FOBwhi9F3A98ANlcJKo7eduHBc0grP9OxHh9gRr1/c81xMA72q2XQmSNiCGqfE
	8Rz15sseQsgWacBSZy1fgQQLaVoxhDu+ZSM55C40zyxNNnRXOq9JlnVOeFUW2n0s
	zMSzfuSIVg2dH8roTAU1dNT9nlTsi/cRgkyH2jwACyPtddzkQcFC0oARldCVREUL
	qLOTyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so602100285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390165; x=1789994965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=;
        b=MZMZMN3S01WdgOaNe4LSnNGYMwubquXYu1XhZ+3I45QKk37NuKYK7WNRogL6/M7YI6
         aUIbmM/F/XYD9ZQSPLswIodlCfz/c/bPxeqXEavGMvSXg/Wj9D5lC7/sY5y4JpeC8bdQ
         PNvWeh+8pz5FmcsFDTDz13dWBJ5jsBXa3hmugInt+vBpmA3L4mU3OLDSt7ppA58XMM5v
         Amoy0fmWrP3NsI8D5TRZTn8hXyxZT4y6SiiLk8AjqXWaLNseGiWbG+b+zStqy0lTHWqA
         1iUMAdwZ1ZGnefcJgz/R5bS826nAza0+SvGTOM0UY9U9VscAwDilnwBmEYx8blDER/v5
         Qa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390165; x=1789994965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=;
        b=AQgE5rUaEh9YLRFyjwkD++oTvz94IYRS5lpVawOttX7JZF6+WVo+VzgJCNBK33fpLe
         RUACUHwXaZ2N1OVoUaIz1g8lYnQQzGsImUsP+CK0DG1eBvueiwtkOU6saDTWGzUJCkuw
         YJN6ALJCSuPmg+la5nhnz2vePsLv4wr9H3evyLmUIZVdjMDxov3aRTfMDubqvjD2hStN
         4SuA3gxVTWvzpYPEQAF41wej/83Et+ZeAN6w6Od5e+lIUCK3vbHzwDD7yjbvL46mObup
         9PcXECjh1GWAUvIoHXov8Oi8Rd6Wxt90QD97t4emO4sK5nakJs3KiFekxQbGlUSTvq+I
         f0Fg==
X-Gm-Message-State: AFuF++kTNP4Naz4LeYw+rKFVyiPdyHxQUlgTazYStWI/W0x8RikR7J76
	S7pX7VpA7zNGEmIhjQHpjIP3u3uALDxPTK4nD7WNPEImq1+L8TN/1jeKP0lTfa8V9fA8Bsk9G2u
	F4HI6b+r4g21CBl2B57kMhZF9wFAEHL4112g8pmDcA2BeGcNugbegevTnGsNjFBGuDzQb
X-Gm-Gg: AYBFou1SLSiCLoj2Pc4ftc7oCXxsQdcsuUonkK7XwCIdAmBR1+8nm7cjAdFhEI+I/OL
	P6Mmla0i/knuySw77xdUJBq1j2YXFC7pGcM9SE3a9m2aotxD/49ECWkEGHWjXtWA39yCjMu47bu
	6OfSIIt9itfWLBV4LYSk0tgP9ep8JODLPDeUGz0cANtrBdMUzUlwlB8owTCDzLTXIk6L8He07WZ
	lI++Uygpr9RNpd4VxYZq9iFUYmfUS1Wx55QH3LFWltHvkxmSqU9YD2uTgiEesUCjO+hsYzlU10W
	pfzwMkK3i06HisV2nbF7n/ISJIZK8DwkWK9mGS/cVdpZh4sSrlDQvlBVaWFmmYbNIiBCLACQP8I
	E3ehtRGz1
X-Received: by 2002:a05:620a:170b:b0:936:df48:d507 with SMTP id af79cd13be357-93a297e903cmr340040585a.18.1789390165095;
        Mon, 14 Sep 2026 05:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:936:df48:d507 with SMTP id af79cd13be357-93a297e903cmr340034085a.18.1789390164538;
        Mon, 14 Sep 2026 05:49:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:30 +0300
Subject: [PATCH v4 31/52] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-31-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GEl9Wsz08G8vYZkWRMFCpqdpxIKvSTnuFhcT+3Eyy7k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zpv3ckJ/OepIlrV9VGZn4/JnKT9WgjdobLn
 Y7IDV77iOiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6QAKCRAbX0TJAJUV
 VpCCD/9wwAwgdfQaR7FiBzyAuc3ubUN6No5Qu9VSZ2ks+wBAc7i+kadOhnQSzXBn/JPMOWjW7Iz
 +9GRAPHdxRBn7JpnJNXSnF0RzBp//6CPzEnDsfozR7YH/WqZfwmRy3ZFj99CeEroPpsf3M5jxcP
 XKiIHueuCU7L974znv/Wkj3XWfswwoyPgAdxQcndVmBCenV6TN19FB0mAl5efIzV+LuK2bwy1UX
 g3RailILV0irW4w6Dsp0bcLzlvR4Mxi2nlfFnnqMaZmFF85+hh8jpOElEjgL30QBCCpdD48UaM6
 ULM7brEJIjcgv/gjrCf5nWtUObNwntdHZtx/HcXazyQpJ+lOjuCljkM7gzzmbXPllTO5uNVJMR2
 t3jx7eyboC9sFynktnRDoMJNO8g5cZF4gl2zXen98oV3MKdljJwElAzj+Hv7FZLg29Ds043EceL
 srdReyXpYVBlJnERfW9wqWcZ/zK3LeNUq2/7Xu8nQ+TlVauLvAdZa7faiarT2mAdQF9mJJ9ZJtY
 5CPkIGuDOm9rzzwjCJlag/j317lsDDs6NwIEHLO5L2+6Q/HZZIey5kv8WkNzTaMkEQjHA1Pz45M
 Tj5yEYrVCVzV4qda3xYGM+m8QD21TFhbkiwKq29mRnlYCngtSkbcnN56jBbGVCavtCobT/K56KW
 kz/celynst/Wz/Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzh/n3ogTsAhb
 xhe4cGNTZacPFXdBrG/yJqLzJg8hRBlJeLVacfo0GrEPH3xdJrkvzU/IWiqMoEO6SIM/eWDm0N6
 5Cg579b8eu4XsdEie38SBT+gurHNhj2OJvWy/9P2BzUEyAG1yYW9o5dGGzb4AuOEL9qPanT0V9L
 eAQN1MLyFNHi7m3hSkEnnKUGxwj609XPQVgm95Bj7SL9GHhUhJGfLHoWYNzhcyrWtvakLAnywf3
 bH5XPUZY0cfvzLhZ1nObEZD0uWfYEoMZMkC+cbAXqkGYV07B2BbBRJ8R3ehVXJKpvkVO5vH1LsN
 hhjT+5IvdAoE4Cy665+DmvqbQ+smPeL5kjc7ow3Babyx1+x0uDluC8J2k/V7wezYmCQoJryupFk
 putPU+x/HvGx5rdORBPSBXDS0FTwf7cQfgePThiOXSmmfIZZILYeQJPHLOahLrV2eppSBuPR+8H
 xcaN+5ZZYL7qhVPPcCA==
X-Proofpoint-GUID: yR1LkVcGRtv_i8SsUfCup0m2tP0imfHA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+m89JDqsGQoW
 MqxWtvwtjC+sYceSql8ZA41TNBTYeHv9hk91Uoko59nT6C4FM6CToF66bVpke/2hweUSAnR9zsG
 glskGLOqtdsOTaeynFRnErKs8feHx14=
X-Proofpoint-ORIG-GUID: yR1LkVcGRtv_i8SsUfCup0m2tP0imfHA
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed56 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..69350fa4c914 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3787,6 +3787,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8350_match_table[] = {

-- 
2.54.0

