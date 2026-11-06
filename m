Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987161;
	b=xkLU1yqvu8OLTMKKQ4UyVmB2y2hEsgdYXTUa1LJIAq0v/ReDeykeMcRLZXAvAxv9K/Or
	 dUUL1JOzGHfEmC9HfQlGfYUIrDeOduQoL+4gDu6HfuHAhaXjyBQAgZczHbh4GQnR/Buka
	 2mKNiLEOQz8tE+E8evThc3y6HV9jYE2iOocvueRgrII6UwlvlwPb9c5DNtMip2EhFXXOe
	 RLn9s+WKkDDnjTYMrRu6rY2+GG6twLsZFwlasf56op0z0pYNBW62mRI1RdI+aJD59kgVt
	 0P10cPNBrnWTQZ8oSbcpUOWwWpTNz2SNvkLx1+J9JR9fUwYC77v8cM/Enu45ScFQFTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
	b=yGQkJOtavnMGFuOO1Ml3KOi7FRC8V/kVxng+hJPJr3H5xt+1uaAUPGBLTLCGMnMkVNVk
	 2I6ndUOfw/xCEcatPCCXzkM8vxltnrmFb+Bx4mNoQ7B61RugXhcgbmt/NHUlXVeUqutAN
	 xeeXz0w1Xm9scHIEVs3OyE/Q+Tbmo8SbtqeRt+bJnjYZ3K/kb/4U5JYn70LSGD+4VLcVb
	 7rHVRtttJrmuYOi8+TIhDtYtBNZTRJlX/O74hzozoj8p6GojiybfeIGWypmV3BuiVNHj2
	 q64h50b6UVBWhXVV6p2g9yJoF8jk9EewxD8Ck7sJBbDacSLWVdDGbC5JHr3ENqKBqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68893606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68893606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExqCL1038767
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TrodIbEn58SSppDzbgs2/3
	QWhe/yl/+v+9G/XWM6Yaw=; b=pk7Qvy5M+txPoslyzKS2N23D1S0A/gBi3AU28k
	4DjsT+EwtGTPJ3xqk00yrz++ny5iEP+PbWcBEJn/SDKfXSKJCoUHrCkyWURc1PP3
	zQYd6cRxFeTuah1XDu26jP0kQtl2p0+f/cdO1QX/yeQr+a4fbVtQYG1dRc2PN06l
	gDUGXhJTNgBl+IHU2OBBw0JQYAF3E9HLwghqCFUG7pXcRlYi15OzEKyf9vqBeTun
	3dKXD9hKtGW1AYd1veuoUNQjCq375O9GvobP/LbRIniovYabeeMgcBNsQLLKGnUD
	qBrK6KxuNequ2Py9KqivcS4ka2zW6b+9zYNGvetNdCFy9wZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9v0pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:46:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed00709df0so8789595ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793987160; x=1794591960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=DpOtDS4zxS2cL+j00ayxDGwhIVWmDD2mV7xyqobDK89Lg59KuIhf/urmgTTvbW3JCk
         YCo9MRRXnT2/zhSeKUWpMhZuwDe4miYMMQFdgCYqcg49CkhKeMaa+sWA9ahQBrrc8K0F
         2tYwr/KTeZDTzxwj+5crJgsOdnuxb673c4Rc6rGE2BzZvtLIHzm0H1mhZhMeuLW22N8g
         v5nsgtY/zu6OKBat0X/MwqOjApg3lLkFs1ZTI/zPRJSas1sC8DJv7OzZOe8phmDyMnM8
         ClDP50LQ2jVhEJG7TJqJ6iXmAEIZgLAyZ8XG6MS1Z7OcVF+sjPGIiY5CYrH+ishzsUkz
         kRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987160; x=1794591960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=yNTs5mB7q9DbXHokGk0zOTc5CbInQ1Ri3drkOWpQCvm6lmrCon7+GZMkIE1cBVofI7
         0iQ3mTRAaA/xaKWtqDS2p20/zbjkGvtUtIryKPFYKnlONmb8zRlKtFMd7L5AFR6kFmOA
         G1QYQ8UtlSZHwL3VeH55qbaZA09/1/bgvKFkTa3nGlW9uhety3xPPl3cPL6UZ8OHhkKa
         vOplRGfAQpUNIy4xTvmYn55N7JX+HLZXPjjvCYBevmy8qi7PvgEItWlWqiMfo1gqh96D
         2dtmIsRxb8nP2zaGXr+zZTIFz+VL/sB1jf1BJyODU5VuDLcUmfszuYR3BwIcEKCb0Y4P
         aAvw==
X-Gm-Message-State: APuU4Z97H6FR6JyzXQtaHBowHeyydsqrgtcmUalnydYhrQ+ShdYGtjZl
	datfDiBZkM1M4Mlkzvlr6COyMicyjWpxt17H3sknYFgX8kgNUu/qulQS5BZom7tCCCzDnq1HgDl
	7ZbKWFCst2BzBp8rvjby4ISzS3i7ZsQQrYIHdFecovS5bJuzAWOYjq7q/RVTOlFcZot/K/cCa4P
	8b
X-Gm-Gg: AYBFou1FxlNPQEwc7EprRsi9+ZficGpJbn6ZsyP5RZo1yQ8bfr6HYDS+wNEWAKRjbkD
	d7SKkcqsI3j4D3YCxrq3/qEJIfc4mpy1a11NDkO2Tid8ZvhQOaFqvpUiMeqpXNhQ4pjmUWQn9PL
	YWqSfHzY28w9FUyQSAXI5eLislGi7hx3rh1FMAzaXe4mXSrum7zQdOBXtZ40zADAAoV4Uf1ejZa
	Ub68XTOUvNlANdnDOl5XijmP9HP9BQ9tim6oj9phzIxayL5qDYDgDjAIUXlxj+W1XQIAgkuS9R9
	a0kL9RXenWgvzG6yOfOSlvU0rprk7Yxlls/3A79ilaAOqaTlTzIBoRrdPsOpztYoVj7CcTxWBRJ
	1LiVzR5ic7zvfmN2yUZOloABAZSUJI6lWZhMv7RIz4tRgiHUZ0iNwuq8ndHm7w1sns56GvRUlaH
	6h6c+R7g/mQ3o=
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36074265ad.62.1793987159865;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36073845ad.62.1793987159266;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40d19sm7745575ad.32.2026.11.06.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:45:58 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 23:15:50 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE0S7moC/yXMWwqDMBCF4a3IPBtIRIPtVooELyftCN4yVgri3
 o328Ttw/p0EgSH0THYK2Fh4GiNMmlD7qcc3FHfRlOnMGqOtanK12K1wg4ibvAvwotD58qFhSuQ
 1xeccV/7d1Vf1t3ybHu16peg4Tjgcwf93AAAA
X-Change-ID: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793987155; l=1666;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=4tVJv4tMHBDkmKDzpNsyFItbWpkgDiyGlM44OHU4nOU=;
 b=MexmNNiGC0gPRwcx1+1QNBevNDqkf1XsI/zBTSXwUVwa4rkR/kkHO+dpwK8IosV/0quiR6Er6
 WUsk3VRaZoZCCy6UaGmCbx76syN2fLk83YB2fNb6rFbb4Xlb5BS5/xF
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX+cLxWGZ8NZYs
 5x54E1CGlHZol4fYG7Hfr1Cxpk2g11W9OoQxZzKLBvs8qAEIS8O7jGqOSwDLKabYfHt2OfvliE8
 BBMgjZa6E50Yc7WdAxtYTT8s5DvPhQY=
X-Proofpoint-GUID: I7qTDsXDDob4VaBSNLbwZfqtPyDVOIZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXzAIKkQMIfRUW
 pK2RlYUNIVQLts5DiW7sf0dHk8u35les6NoM4dTG8OjdFv9PBDWhUDNRcqEqn6ciOs/dzURX4X7
 1/ljfi2FFxiKWCSgOvwE87ZCfDM4/2wOcsDJB+lGYKB91aRQo8SEay1qtv7xCH+8FVJA12fRrEQ
 Aq9g/AqfO6do7B1QxeNpdrZYgRIdk+EUODCnBIqtomxCMRy3B0z5GmAVbaGi3eqY63rsLUn2OAl
 eZH+mDFa3oS7hujZ0eFXBYd/loJN+76Tml2OCwq73pQ6EI62+oRovzad4IXA//lHcFFtHwpCa1R
 7tgkJlBiIbP+Yl6eB4SYn094xct8ki7iZ2jGaKVuo33il818Ds3eI+a0dk5H47dwQnJ0Exs86KW
 asW0EnzS2KfCkzqN6IVGDHmRM1vYlfoNyppwbWLr8avhMUP98/YWx1QzoFRp94uEnrvj2TurF26
 sQKuQq0YBPZQrJU7bfw==
X-Proofpoint-ORIG-GUID: I7qTDsXDDob4VaBSNLbwZfqtPyDVOIZU
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aee1258 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vl1InCOBUffSk_vTzvMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
(index 1) properties with of_parse_phandle_with_fixed_args(), which
takes a reference on the returned device-tree node. The two blocks
copy the integer arguments and never release the node, unlike the
other parse blocks in the function, which call of_node_put() once the
node is no longer needed.

Release the node once the arguments have been copied. The leak
affects SC7280 boards whose device tree sets these properties.

Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..e7ea5e838602 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1846,6 +1846,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 		qproc->qaccept_mdm = args.args[0];
 		qproc->qaccept_cx = args.args[1];
 		qproc->qaccept_axi = args.args[2];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_ext_bhs_reg) {
@@ -1892,6 +1893,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 
 		qproc->axim1_clk_off = args.args[0];
 		qproc->crypto_clk_off = args.args[1];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_spare_reg) {

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

