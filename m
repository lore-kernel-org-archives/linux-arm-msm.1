Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517698;
	b=N6jSpxpL/ondzj4SL8TgLzzWP0muTsufF9Fr0FfytnHr9HkdnwDHzZw59baRTiJcOOr1
	 JV9WGkllOKYys9Dan9i6BYlYL9NQRIF6HfKjveEiRiu4Kak7oup9sJi+LvCpQHzmswzSw
	 3Z0LDA0Qqh3leoRu25r1STH1kM6mR0ByrgLdFNzBEOVnCovknqMeNmf4bO8ZwnXdSWJC9
	 59szsvl5okZewBYtQ1DTUnTdouCQXAVK2fH+AX9NQtiNZFkRWrTxGvM1nSaoAr+59Y9tm
	 j/mB7AOkN0x2YCpYzy92kEBqMtHDnP8OjypEkn3J63h4J9Us6Vd+jP8+aCt784YDsYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
	b=RsejoOTDyZOHvHxsZfQc5ZyBOYcGa32TJBZvtj+bpwq05GB1AEuA8P+1iZUjXufCL87b
	 6UALqkmTZbbq4FZEo85QfGrA0b2Ny1A59n1MSyRYHMavPSC47hrNE4kbH5eh0btPR85TZ
	 Rb7ERfv2X7XxWnOZfJ0N3zCallXwhc9avNSrkaR4wsFhGoyRvteVNtmVsUDzTYLethlTU
	 7uAK0VpErhcPSUXvUXgw6bHcD0gmXC/EcQo7cmg5irPahp9i94GnKXYUMgSyFXEgXK7E1
	 H/IaphRBa5ZLsNJhZk6jIDweapu953oLLeUgxJo+fwZkFYWrR3xgpzVq8oSQmbxLSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9SciSyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWfHq3zo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC535606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC535606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9SciSyn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWfHq3zo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAPGbv4136029
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlV
	ZaxntVfE=; b=P9SciSynycsGEIVFMS3diJ9WO4pa8LRkuGMtgFBJHgPzynH3I5+
	qTCFBRCgYV3QL7JQaH2EXGhMH/EAbq4P8KRKxDv4MLxn2UvhKg2DFA0/zM5T684v
	ECK+g0s56o2viDWtgTa1zWGb54DXhX6pXDTZc4e6YFbqufxRRpQnxhDSGFuT62pi
	ThfuiXvDL33vawwxEBjSJa9v2p9qhXyyBXVzqFYQKravYzERPlaR0dw3y4pWAxXU
	fy7t9zh1oqJX0Q7AtU1CY7CYrHS6gSl1iBOBul4YMZnj5j+jxoQn5zi61cvEzFDQ
	/KdqMAdBKDor5FG64VvFiZV+IG0RhQt5f4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpha0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso4896788b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517696; x=1796122496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
        b=cWfHq3zotj/yajFTZFbtj/bus3z/W+mWjslhRqvkiKmv/HhErr3wA2C9zTQovDJfYJ
         nPXe9gYVnvKx0H4fo+ZK7prDOlN3kU+nnTS2Sgublu2WnZ39iSJpjZ6oU47LEKJ1p70R
         ltQa/sfcgh7OSkWlCUUZmdLTPSiKxnvS2J9XVOaJ4vsuqllmWcHOLGIKepnaqhqjn5as
         2l37Du/Nv9LoYJEmFxpVMxPqvOYkb2Y9ndSbKtoETmJ5qFrqD49BCWuLkZ1mTZ8Uloob
         9fhddYhOCx5iQYTMu3x4HfSrJ0r28SxfJRn7whGe2/n4vkkCX+D10klvxDQRiF/+ynO8
         MUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517696; x=1796122496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
        b=lz8JogAWzIvIilNJxmrCHUzgqm8JwrCxRfusm7ze+7yfgUXwBcyZsmvu57fyn/q+cq
         C/VZQdelvUfUDShCGJYknxlb1I4LkegKdwZ2asmeORUXF1e53z/rTMFduSNiM+SMSy0F
         ZUF8EB3JkAwG9XGcP76V243y5NX7NM11AjxpYpLoUTcOwlJ3a5+tKtPDvnro2CDYqO97
         tkRk6AbirF+OmSzUlPbuKoxpL6JNSdVX7IB0Np80rd6lY3GViDjSJmc8s35hN2oulFHW
         gqRecp1QE7/66D6S1+1yfzhiKHSYSlPUXAMtJ1z0I+OSoIndVmufBYEusin4bbsb+aTO
         MChg==
X-Gm-Message-State: APuU4Z9qCFXOHQxYtEMwBbNQqlqZofXt9TxJRVlJhdC1hFIQexWQCJ7a
	HnZ4y16i3QlvBcKHvIjZp4uJG4WhjdyAZ6L4thOMDZwxPaSR+ef92nSIYob9Q3Y1nfUMjwmBfqZ
	jJrlAZBPbA/EQlOSTm0+t7nWOrdiCwunayzk6z0n5J1muc5+RRJnD/piEDGzki7xkS4rf
X-Gm-Gg: AZFdTZcwkBGj+f+jG7ApObRJRGpdnmyCx0VfkWtjC74PzNLSB8/JdFSZ5MWR0Y/86+r
	B/u5SC3pVXToW/ztOps5HkvoP+6yydgtNpGwsQG4fK4QNwUin7OAnEOYPBa/bZvJmsj1OuXwLD6
	1BD2BbEjlWmulMhsMA/SbAgbcLkMk5Rky+np4xMdGTmb5mvTgvC75zUrQhwkq8dMMft4JmUd42a
	lcmm1RBJp5OKwowm8Sb+l10xLzAQOdezM9piA0WVUOl6U+AJIJ7SSDSmQ8+HVNINkUpZUmV8W8W
	3KvQuV3ztXUnrIOGh8TA1L0CZf8T6pPTy4wt3rYZpk9hrSeyCRdIRC6y2A7burkA+8PGy0PrGON
	kwxDba1JvUkwpz4L2pUdDuo02cOPO7pH7jQtKwUwXvv+vawlu31MkgjnTyOR3wFlpUvmGI752/3
	HwrbMvAD9m7HYsiNvfNLGYXTEPewqqtikrw199qq93ElY61hm1w2VJ0iM=
X-Received: by 2002:a05:6a00:2ea9:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-8c8792b60b6mr13838804b3a.1.1795517696031;
        Tue, 24 Nov 2026 02:54:56 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea9:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-8c8792b60b6mr13838777b3a.1.1795517695517;
        Tue, 24 Nov 2026 02:54:55 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm7323476b3a.36.2026.11.24.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:55 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
Date: Tue, 24 Nov 2026 16:24:47 +0530
Message-ID: <61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXzyyydSWgD0OZ
 Z4neXokMm4Ba7ZvvAksfLOoOBQDlPb89Bvd/2jjmM85DldmZDHMW9F+hyduwyJzqDK5WKei0oXs
 vWHr2H4ksuNm8jVhcZfG8eXZZOcJ1X9+EBG9upsWhuQAJceyVyan6xVOHnr4FrnbsGHiP/rh0c1
 E/X85EXPyOTG7gIB6TPcRhaCGiyCD5hU7c9oNjFOXPtJw1CvmATWqMwDnM5Gn6STaCon2QhAhoi
 iMj2OtCq15JzQupMoDQoq5PqlcDk+QbwFPOnpITMMvVOroy6ZzkLGYoXF15qDH81w/vdwUF4V8z
 PI5VIef44AFgk6qSxuJ89Oc8djFfsxgkmm9JIyQbf0/jsWaQTSEKN5CwEQjvOqeRkCeJRCi3bWg
 P+hbZ5OQWGvtky2RbbHRqbNlw6C5/DT31owlmei3+BIwj4fS40v8LpFdW7FeZCLqJ56Tm83TSh3
 0zGAikX8BLScidkn6KA==
X-Proofpoint-GUID: k1uhNbZ-L9mElWq-kAY0_vJWLAWi0LYo
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056d01 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXyKS3fJCjxGAx
 Cf/e6nfugZK+ZZq8Nd6J4/OCZ+D3tqbEwz79axqCSzAnONcUSd/ZS/D+CG/qHRKlj3r4afwTQtm
 gvdpmUmRuxvkJvm7jT265FsBU4G65ao=
X-Proofpoint-ORIG-GUID: k1uhNbZ-L9mElWq-kAY0_vJWLAWi0LYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Seca's platform firmware implements an SCMI server that manages UFS
resources such as the PHY, clocks, regulators and resets via the SCMI
power protocol, like SA8255P. As a result, the OS-visible DT only
describes the controller's MMIO, interrupt, IOMMU and power-domain
interfaces, making SA8255P the appropriate fallback compatible.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 66d73e9025d6..4a5dbc780b0d 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-ufshc
           - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,secaau-ufshc
+          - const: qcom,sa8255p-ufshc
 
   reg:
     minItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

