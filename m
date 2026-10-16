Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE028498E3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194911; cv=none; b=pUCIjBaLQ/j+JNFtZTSh8BkzI9iGWLHXhfY98OGCWVYb7mgR8pPIub0aHBSJLQyyIBKfGZX3PjyPl1gHG5ROKEEHdWEBK38oK5u/bNf/N0+oXRR3eN1XMQh6H9x8H0SNOMhBusjN6fPhIMhzHq0u7hbZpos1RGvBLzAhCkF/HFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194911; c=relaxed/simple;
	bh=CAozqtPQPZKufMufzZhkO1oHLhecue2atEYYPYV4tV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L4FptzuwwQ8acqPKgMKAU8IXwdFg+DUPKnLUi0bv4RQZjKJqqbn+F56gEVgvH3gf9Mam9aogf7+0hytr8QuhyQNDa84keJZbMVZ4FlUHdgZd2/I+jnDT+9YTK0+dOGUhDrP9gEJxf3fGwO2BXuXgc1tKprBVoi/3G73cQZH4Ync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmsSD7Fl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3vNS8Xs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmsSD7Fl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3vNS8Xs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNExhx479688
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=okZccNziGZb
	11f9rRH2SWAplNU9oARw5u6BjkiAfS8k=; b=CmsSD7Flk7pKeJf7IUDLgnJTQwv
	T/7gSPaR8eYJVznU+tcgv83snrISTqFVE/VV+vsBzGF0sZxdQS+nLne5L/1hzlZv
	e+NiGBvpqD76Fc4cM76zJgA8gWqI4YpM4A2YzwvnhapZWrbwq0+GZh6/HF2TZTyQ
	zIqr5RJ8jUED1Yq4vPA1+VPQVWKvfbkHGjf9h/wk+7Ok34R33oHjI+gyJiKAqJLO
	jUHADm6uqZMl1mh3ohpjfhd4+ddmMNu9FKWH4hdRefdC20jsJiydC0jL/HTiQL/b
	SnyKCtOAuA5duM2pBaAk2HZrTHTnGO+pmjSoqvpODKo4tJ/KOQQNLiqluvw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrvwh1km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-149e8e8ad71so492767c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194908; x=1792799708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okZccNziGZb11f9rRH2SWAplNU9oARw5u6BjkiAfS8k=;
        b=F3vNS8XsPC2P6Gea/H7cACwXq/EjwUqfwYsrZXJ9VmiXEbJT2UPJLAY5wOTecx6OMm
         xBszV7kB4VkktLQEgRvSbBRg6CoE1AuxvG7P1EKri+8Pz9l2M10jFkH7SZ3hDBLUpYGt
         qlZp9Hzk9lQIzdRCmkDMVx4F1RVQEkMOtCLoZnUQIG/hmbhTvb6CrI9au2hc0KUhLRoN
         ZKYVnAsQpcHzDeXv3mW/VY8jFLDnb4PVi71OQj9e9SfPTw4JKpecKJ2nCAIwyxF1EOTk
         uIh/fYwuLmgKYwRSUty4eNeHCIlTIyvGrxIauF8gJuGceI11UKQ1q6TT2yxJLnzaHY5J
         twqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194908; x=1792799708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okZccNziGZb11f9rRH2SWAplNU9oARw5u6BjkiAfS8k=;
        b=lBp5dXbPuuMTxW02yraLavG9BVv78DIJlEuiJm1t1qRdZRmFdV+jxacPnYm2BR9IyH
         N4rcGosftng2AygMS8hZ+AlW/Fi+d1Dm3uJy67lkqZ8DT9YJU6tKrg4Zd/HwuOI46+WR
         odJ31OXHukt37nQgCXS0IliDnsGGmydyNh2yK+FcxM7pw0RwAbipVk8GRNzYZ2GeYulx
         nmb1VdLSrcjdEviiXLGxEVtprXqGEhsRMFjUGbtedts/QYp4VW31CQTev9cUh0zqn4TJ
         L69tuY1a8DZAgus57Hu21bU9pPEhCi+SJdG00MBoreAUeSQptxOn/X071St6ltKPVjTp
         e4Ag==
X-Forwarded-Encrypted: i=1; AKwUvByhe2CzlfhgEcfku8d+Kt8QUetZhEhlvjX+vm/wJgAyA1edYsQsmzFQRbm+qo6AY4/In79x5Zxgr9grvB/5@vger.kernel.org
X-Gm-Message-State: AFq9FYIhdkTLnjo5btYQ7KVPxDwOHqw2+7fj4cecOpoAYE2epI+WFVYF
	DayHN8MZxB5nQbuic2xcR+npW66syZi7Mkd/df/MWjPPGD072YXopR0buvu6hK7q+s5q0ULE/sC
	Q58Q8HAQ/ABWsNZvYQDkRL9cRl5BMF59sp1s9n3tRxgw14DV9XIceLyzGiHlq2wZmSIAm
X-Gm-Gg: AYBFou2NOOkIbGUUgYT7q3eGo2Hu7T61AqobFo1VtC7KT+llT9T3LWeLQdCzttiwdkB
	oXctRYudnf8c48A0wjMX8NdDSyGV8gWKcpC3TSlhfuxB0d1h6wYpPKGugi26SW4LLgoK0d6p9xU
	xwcgKlRRR0JeoGvA1+7gP7bgARwk6XihB4m6U27/xkZQ26Wyfj7Hl22GaKLjrol2EfuXTIouiUP
	6DVzhZ/ocZSKfFTW/Il4tJWBg4EqVbbloJifbKr+Fm7aL+Qv3SFEY9mHdD763bJbEkedpCO5RqG
	T26Emd//Rquydw7PGrYLYMLjRvlorZJVUi6n8F3EOR0pJ5D+mPkH9m0E6njxebETu9KAVVnplMZ
	HbRuh1nPMF4ORQPpbuu1TqZjstckFCAlhx+Samr/Pc8PP/y45unorpQ==
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr2306658c88.2.1792194908277;
        Fri, 16 Oct 2026 16:55:08 -0700 (PDT)
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr2306626c88.2.1792194907746;
        Fri, 16 Oct 2026 16:55:07 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:07 -0700 (PDT)
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
Subject: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY schema
Date: Fri, 16 Oct 2026 16:54:58 -0700
Message-Id: <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fDf_w1CIa4nqwfWjtZF4iW1U6kADbEF5
X-Authority-Analysis: v=2.4 cv=COa/zhrD c=1 sm=1 tr=0 ts=6ad2b95d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=UFojjUosb5XV-b-9NnsA:9 a=vBUdepa8ALXHeOFLBtFW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: fDf_w1CIa4nqwfWjtZF4iW1U6kADbEF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX8+UVvMDnvnQZ
 5lxVdEWrwUGUlx3HOLYGvt88o+Q9fQD0hO0YdzLmKHgj4Gr/1Pe1N+MYfHX4T3jRjYAEpCvxKa9
 dDerTKBp1jxyLaRwCILMXomf02fCKLYESnPS6zbYKIzw0Hgc8dmiCKX9hd4+j+dZdpk22n+1LyD
 B5ttaQ7VxXgs4YTZMkQ4a9rBXQwbZ11kIcLfANgwjVhKbZXf+Y0uNqzJ7BjGD6NST5cfGuyKfUj
 uU079ZAtZ77v9N3QOvC+LmK+QYUDulwDVdpkIrtnN7BYl3UNbj/wJdwNjrlsZL19CW7WwWURvRp
 9NVMQUebHQvJwCFxd5ToyMFaHSgv0fZB8T19vrDqW9AFSYzJThAA//86ygaJ2IYJ68H4eKZUhwB
 4FZ81yvkNbJmZU7N9vkY5Tu8+5pD0R6bG4eC0xveH7/RJMrMtz7ENgF4oJVd/gYuT69hdXse6we
 n6/BLruYvvjXRRcu/5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX1DIJoN4YNNYf
 fj31Ke8ytUML0YVTZhaghkDVZXjO5BAupLnF5lcOuB7t7iNGNA6MhY8Xk0i2/hMAJHKcVC1r+fr
 GJNFzURBGFBYCRNmu33tHer/ye6V1No=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
identical D-PHY register layout, common-control offset and clock set.
Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
schema rather than duplicating it, and generalise the title/description
to cover both SoCs.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
index b66ec2f14189..8e60ef0714bc 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
@@ -5,18 +5,21 @@
 $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SA8775P CSI2 PHY
+title: Qualcomm SA8775P / QCS8300 CSI2 PHY
 
 maintainers:
   - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
 
 description:
   Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
-  CSI Decoder on the SA8775P (lemans) SoC.
+  CSI Decoder on the SA8775P (lemans) and QCS8300 (monaco) SoCs, which share
+  the same CSIPHY.
 
 properties:
   compatible:
-    const: qcom,sa8775p-csi2-phy
+    enum:
+      - qcom,sa8775p-csi2-phy
+      - qcom,qcs8300-csi2-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

