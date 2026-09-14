Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273B46A5E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390185; cv=none; b=DqC3RFa9dYEX1NHNsrZHAwvXj1cKHllsHbPuc271EeV34p4Jm//VWP0OZYTqFgPybx3NFBT4NsHf/7cLEBLyFJvZcQCmHPEbtnQmt+HTytYd2g1TQNpx/ES2nJIWVSctd646tPkyEnGakel/xkUC2dWtMfQPdV3/BXTXIfzsX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390185; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjBD78AVnzP6mUAwOPVtPTtMQNnICwRL/+v8/LidrsGzY8f89N4J2WWnup+VS7OzNwZ2sUt3Z3VgPuYe2M9sUDTlCtT6uUiCW/e9Z1koJLdU7Ga7Lo/7PuvzknHojVBno+9d7TqDYzfxTxCKhjj/NvYUSba2WAkfg+xOvfsOSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDaShxoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNrRTCDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDaShxoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNrRTCDu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRM9l407210
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=lDaShxoEBJVT3/Z3
	Rqe6PiifZ5pkg24csy3U1Lc7JW2D8/P1Wztn+SffJif8FXTs6zFqiUSPM2CBby1w
	k+dKX9EPBB1H4UvKNPc7XCQ5clDp8FADbVxMbjrRn6gH8pulkhEUBcTkA7Kh3+zQ
	naIhxl5SRCq+doaaZk3swJKLBfCBd9QKD/gOmveRBnTLrdQ4dl7ZClzAVh68k59S
	61XEuylHUW6IwW5n+ig0C/+CIKxwW8q/gFEf+AdKNQsbwGjt7GJ5XqFkdwz+P9TT
	A44cWJPcTSpN/q6NXJ72a2mhywXCwHD/oECN1WPU+7p/ximpWHoCMuDgtm7hq5K1
	Sr8LjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so675515185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390181; x=1789994981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=GNrRTCDu8OanY5/HX2c3UWdmCrgol95JsbBzMQElCEeZeUVUuxDEkSACtcIjXdeTdD
         KDj6EE9LN37Kwq0qXety0m2eWQPs3tSwSsM2dRNFKXSktmw1BQbDSZcVBLQY8PY5C3H2
         G7eBHei4JZ9k7RIRtUmYGQkytkYmhoYAckCKGDCFSdaPHbsaqleJxJ79lNZ6ESkeL9wd
         LmyKy6dlbpXjz5DaTAcNtnWBZWUZKfVYn84Krdy2A0JYDt+6Tt62ztjDUqL6+w9jNr+E
         zPcQtYsyyNTRVVjWtM6Ep760Wx9pFPsXFb3OdgSZecegh8JARdsCyg+vx7NP0pdQOLaN
         SUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390181; x=1789994981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=iNwyfwYfmM9KbctzcF6YRCxPG1X0wdUIAtPeDv0JieTHUrJbMFISKjA+ehwjKgHpZY
         gX9BjWelaz8HIqqXLXWtbSY2Y7v5Hw5ihPOiT13FD5+02+gRslKMne10ozjskWkK1mj0
         CXAV1HGEEV3Kj9FdJaiUhPWfj9I+crHBxBQFkPWqD7DYCPL5K7TA7ZNECrqmceqg57Ez
         nimNGo687zbVLKPmXGwcDptkRY1/DdNxjF5nTJBeNkkziznOzypDxfqdbulE8VRa1zNf
         xUcC6znLiIyxLE3vOxlxuzB9rxbalZbe/GBcGtsl0GzF5/MAsDEhYHCiEk2Bk72ykKBb
         hglQ==
X-Gm-Message-State: AFuF++nrNpkL+UvuiNQO+PHMpSfeG4YVbf8KBH+IBIFMQsinbRj1gYs1
	NsYuRDdRwD6vueD5vZqzqkbScA81g057ztb5N5q+0b6EnCYsQWVxdNj1NmaeHnoyVK0WbCJzliR
	QMzpmTVmze4KgYwH6f2MFK2gxQyo7jliY67BVc0ZPGVFzHkig9lg2lc9IUYgry1CPqLeo
X-Gm-Gg: AYBFou2noYY6ER0EOQ0mzDJBriBDj3L/fNwd93ncR6cjXExVdxYGJJBLD3xbiJI4fmN
	bfdKJa6L+9j13h8MUArHXqD2l2WGs9wbyL8jxZDKEUOFkVqKrbTNq6THXMI0NOr9xHmZPXRf7Hi
	5Ax3f/4xxYFB1Z5dOpHZqmJehwvGuaZkoC++ldzQh4R7FIoSgGMHQ8V6ZQiEB2sfrS/ACtu8r5G
	mmRCr/bX/7ypXbSm8Ltcjxk4r8Ju6u8ruLAJh+FTuQgfbejxLiZSSLyrSMXU5gYkbi8/PbHodyK
	vT1865YAB9thp2fe1MJDMJR3ZR1srLN9WAEnMXW7nO5LjrPtxmn71Ma+6U1w+iJg8QGgFoJ6aax
	1ZBKLNLH8
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366174685a.18.1789390181085;
        Mon, 14 Sep 2026 05:49:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366167685a.18.1789390180464;
        Mon, 14 Sep 2026 05:49:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:36 +0300
Subject: [PATCH v4 37/52] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-37-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zv4/eFW1FaopVgDUJQnp0OgwORb0ycN42cz
 S5mNGPoVSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7wAKCRAbX0TJAJUV
 VjU3EACmDWvnk10Eo+H+mpt/O611ky3FFY1ZKuY6ck/5cx1nrH38gXUNnMUw6WBaUHbFUzv0kwx
 eM3wMGx8JdsqA2DI56akEs1qFPnmNtLawv4RvM0qNS5SD3iXJqGqLviUZvXZxxTY5ks8grKePHz
 H/bWp9TU9HM3lRy/mEBDovspamc4Fa780JH46WcgFRogAA1BZmoKrm4wfyb2DRgEDUWTFp4d61E
 Fe4nBEJr8qPfXf5kv1/ZtmDPYos9N537YjwXa+AnvPQ+WfKzlwh8AhC9PParyJGKa70jeo6q+1u
 UAmjWRyVzj99iTnD82fIwDsiwo20j3qZobBXir1Oq0xQ0MoNpmUc/IsB4n/NqRbzGdYtiUIpaTz
 e4MYO92TGRZwWmEgCxOGPRle+5iJK2q1ZTT+VOnxDMp0Ll1iwm8OncwVbF8F1u1bBBq0t3npEZi
 yIKoW2uxTqT3oVDgPtnwYn1L2w01LagqCQAfpKz5Ul+Bz6OL2Locf3DtNPSujqRhPMwbnXdX+YX
 Bdp15hyolgBI0RZ4PC7/Rp4y1X7LP9yvW2QHeJLYuMql5ZsGLAvZPMvu+34hxn49matq5Bwp9Ag
 IuiiqCfVWI61867WzmUdDKRp7hGeg8bhz7rmgHb0BL8LbOji8iPBwLLYJQj1dxarKYn//n22Ck0
 yImIZ5fLfFxUlUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WiQHN6-NlTd011c2qIkmK8DmV45pp3sn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6zjypO/ejG04
 qmv9Y9plJa7T9pqgCl8Dsh47dp8n/qfjdOm3Rii7F8D6SrZy5iMHVs8RkMNSDkMQw7rDCQGQoFr
 4oyKwOpJNRwMd3zwkyqggOqBzIlnTL7fqdWDSO+saVrRJrefAny5nBhHBABfZLBCsre218F1e6k
 PIrJeyHbqcO3qsljMnbB1G5xrS9fMtc16ncy/dr/5y0qLsdpRHgO8vqqiYHEBL7TzRJqaWYHnmQ
 OVjVIydJAYAPBVYfjRxKaGg7F134p+R5JDd8LudfXN3pbN12TuujqsjBFZkGA1Uum1Sz3oBU2pd
 0ZS6qq7g28lg/okHzs6xdLIFQlfL4ZlaYb9DEF5MxTD1mTq+ECBzOuMr3SMCDNIcy7gaTNCIeex
 1oHBgiqsgqA0gaxjJIvVPB/Zmsw1xtNybOu3WnFa3p3QYkkPSCK4IODE1fTuXZicjfP+Z44IifC
 BZPeGX0tRg2xUJHKcBA==
X-Proofpoint-GUID: WiQHN6-NlTd011c2qIkmK8DmV45pp3sn
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed65 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7epw0MjqXWRg
 VaA4mYCosFE173lbPF7jju48H8rfGQntsl1aIsIsuA48NH/ZDvpiIQnysBnhO2y7ReUz4tljedy
 zHlIoND/H+k151rZ00kS9vi1jBkxfYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

