Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562336998C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971661; cv=none; b=C3r4q12x59aDeUkgKmgsJ4YGGjh03y6FATTWBo1GNS2zrNDPVg0ezJr7SuFrtIV9rHHe4XT7JdPeJyPCBg5/sUj+Z7DKTnITZmUtks0VpJcrVDRyNKhZ592cFK9N68m7mqDouVjCRaJfWAYL+C7Cats3te+q3MDgN56ZMXfbzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971661; c=relaxed/simple;
	bh=DDCwiFdOEWDOjIDRAPl2mASn4s5v4PeO1HLREQ1I3Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqBCjkpVNicGHUAHT33aWbisQKBKVPetLXdyAqw+xrJ07viGpmaeZTTZ7WdXgPCgdZIwBmCL2FItf2VNRQ2do5t8h9wBIrag1SZBl8uBedeN+D331LgC7RbAp0tq/DIIIg5YSqQOMmYTCV1/3+0/Ix6sc67jbbI3TSrtik+ZaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKHleN61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqrc/WZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKHleN61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqrc/WZ9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z1O8993273
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=; b=AKHleN61R0XMHr+A
	YHOVYbonYMvS0O6VQQJlwEeBId9nVtuq87ti1dPuAKd0uycg55iT69AK+guterpt
	zpijdCgi+HlpnaIKJBfvmCekVmnJsVqvZr9JVgQrXKaGYb96GHGleGltuP33n9rb
	hz+LMJnWJJ9WhIx9khWD+teGxTgmIOq/LrUsXsxMEiFX6j1CC3VCIX/I5krG+G1z
	sX1p2pxbVEL4R5GGQeuxd/Cmin7Ke8kYU9louZP02rnf9nihBfXVy6+1HE2l5DyZ
	7GrAr7YygdEGTjWJvzdNevgGwvOHTpUNi++xxyJloUlHxwhBRxqhuHIpuIMwjWK0
	7SLw0g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v8wr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc52c77089bso3981993a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971657; x=1790576457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=Cqrc/WZ9efRFf3UJVXZteFWfrHlwMm5lSnLBWW6xaeAfXXGa5Kcw70Yb38qXvziG6o
         EJDRdiXk7X3y4xiW2dY94KfNCuPnhFDuSjk7sJl0ZD4+IUBROQzgNceGapQej5WaZLFa
         9GQ/PmSMdmyVk3bXtFygsySLnaeoYocnIw7OrI8VrMV027zuIgC5L39OgPHC72aDHsWd
         +4mxEOXLQoGw1dqAwNaYvFrit5ok+LsxuGUbkmxw0wzrFjYTBPDgSX3b2tXQcPMyAij6
         152haA0wdmVRoR5nqYflwg8kvuv5GtsPonOE+0oIFZZqkln5V0mBq1QJpHnmqs15sngS
         LE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971657; x=1790576457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=YfCI3ELn1GjZ9mpvuIK/1LX0O4WkpYNzUSKC6MYyP0Y2Gx5F4AuwzxgjUcDtpHplqE
         sm0k2Cff18rZEgv/bJ5dN1JygNJiQehfsiohQVy+LIY4XK7Xk/FlcFSyc9C8ucM0ma67
         c3mV2sdJuuhqJFjJR+tUxqzQ/R4ad+Xndi8cUGwyvSM26nhZ7Gbs9Dob82F4f1t5BMJ9
         4lattMfyPXhG8UHqCN20HzLQEXW938c39huCnKd8s4uFBS/gktl7ivWf8FxFe3LZoxQs
         KaBC27H3GnESjOkLIG0diJ74bot+YhgBipIsZzqzN2iN++mKPCIexUCcqbGjvPaKjAxK
         9uuw==
X-Gm-Message-State: AFuF++nuuigCM0oUiwuWZGFGPUgUyKnMsnD1F/VGQhgM9w6p91iwEzR/
	3TCXug6s9MgGTcZac43A7RU72Ul2ytohFXQq7GXa4t7WCSKlHynweP8bm0CmDe5fgAcisW9lgg0
	KI3uv5GvwUV5je7GlrFEwbyGA0IhqJ6/JmYaWU9oBqaJ1yng3+1MbMEiwcfwBVEOrrLg1IJFWgU
	LC
X-Gm-Gg: AYBFou0v/FEI2VvMFHGXnyUi/siowX2u0oVfmMtlllHWYen+CBwBtNnI7Gdnjgj6+EC
	2QqO5o9E3/9nsTrJ6/zeBL9AXG3aM/XAnBKtO35qfNuKmn7x3NilV+XBjdiQvYKjzChfd8RipnO
	1K1AfOx1OHLiaO1tck+FE13zRDBlIECPfyht+gWc+mRf4DY03Osk2VaEc5p4VfiYdqzcBM2p4Ae
	SU29/sF7lIsOU0vV7SikGkw4/41qbDBDJbcPrwV/7YlW4nQ7ni0FVM22jxxrI5V4dqLVrdIPz9d
	2kH9BbQsVSAM3LFXgbWJI82aRYgj0GX2/VO2w3vjVcOLjnlwrx23BG/xzLiXa+nekh7Luhs4r/6
	ru8u+mIDyrJIcMgYkdB0qiVv557gZe++rCQMNj3pfONajs2m2nmZKCj/lq/TQxbhSpoawY2wWh/
	4qjBjObA01e3oTP9REXkWbTZJD6DZhJOPi5g==
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578839637.57.1789971657176;
        Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578785637.57.1789971656651;
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:43 +0530
Subject: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0ccc9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6Pt1XdrthJ013FYkzXMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HPCVTbbWL5tFQXhHsJPAaDI4ux0r3seI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX9Ub8Gx8lQwD6
 w8Gd7op/WlhtZ/ZcBei7qyS/9OGnEVtXhxvwUSrJw2pOg6jW4ojXWzYMRCbnBjvSelmrV7rFK/0
 WfHvVVtlEXyM0VKfEgcrfkUMtl8rdxI=
X-Proofpoint-GUID: HPCVTbbWL5tFQXhHsJPAaDI4ux0r3seI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX5joIUUJOg3T/
 owOT71o3zm9Ggm8pYRycCK3+qaPYvowjy0zwWK04dtooXn4fxPtYipgAst3bhXB6HxwbKtpBe+w
 rPgMUn1fCX3mQPFcUhu1DIQQRJViotPJIcpCU4m2v0Z6TqF8n2IrxjHgVY1DPcSHKt6rc2YEX2G
 VZ5K/8WGYhyhbW06sMaLYXf/1ox53DRUla21jaEYSNMbpaN3LZp1fY6Dvb1nCG0uPjg4mL5+VZH
 tVdeup5FbNKNFzIWAVZzqvSkAfpeYY6tbRCQKq6QAKm+rvJosYs6G1Vwg+NkDs9tBzD1tsBAX27
 oyb6VOUt0qMHHAxOjJ2qEho3jv3wzpxKAz88avAtaKO3Wpk+eu79t/c0X9NPOR8s6tcdH5gcVWt
 If0lYgWWWFtcAlBTz3knER6AXpjNFZyQgUunUUVwfs2iLwjTeEZVQvc6I6gFVUbbYUXX1mCArzp
 quckyglY74PPiQiHMgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
These resets are required by the NSS block for proper operation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 76adfa8bf2ad..d15bcfff1759 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -2601,6 +2601,9 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
 	[GCC_USB3PHY_0_PHY_BCR] = { 0x2c070 },
 	[GCC_USB_BCR] = { 0x2c000 },
 	[GCC_QDSS_BCR] = { 0x2d000 },
+	[GCC_UNIPHY0_XPCS_ARES] = { 0x17050, 2 },
+	[GCC_UNIPHY1_XPCS_ARES] = { 0x17060, 2 },
+	[GCC_UNIPHY2_XPCS_ARES] = { 0x17070, 2 },
 };
 
 static const struct of_device_id gcc_ipq5210_match_table[] = {

-- 
2.34.1

