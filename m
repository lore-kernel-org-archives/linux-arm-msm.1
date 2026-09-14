Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233847ACE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390109; cv=none; b=s6F63Ado/qol+4n9uNTZTH1tavi6pMZP3Y/xrwfJnpgHmbnAZ2GLY6i4HM6j/pVrfo2ZuwU/e3QAiRwPr3qtj3qh0LDx5iFskPIJdmvm4BBJzw6ZN74DSDGJXhRboGcgGgvdmF//9gppxXvEmUq1zwN4Rx7PKUOXppAIPi0mVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390109; c=relaxed/simple;
	bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqAbySKbAtZhaIQBkWfMjjTVtNBKt0NoZrvYsED+ivx0NGWllH66O8pUwvI0KVm7VwNUAOMVy5oZ/ufj63pZI0oSF3hnCpexjBuS5ksCNQ3iB7PCUiRsFRuAs8vTD+BbdVpSK39JJhbddkO2cmA7ZrFS+amb5s/eMDObvbWwaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx0yl0eK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu85Xxla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx0yl0eK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu85Xxla"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4Pt1216215
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=; b=hx0yl0eKNz/LnEcg
	8CgV+Rw0JrbT6ETNCgR+GqMZAg/6rFYuadlyrmDI23VT8FADLTojDa7rbXoFmJDV
	L/7IjrhtxD1Pg073b9KVo9TgogxAeRFcvWzHaOa6Sid1sbE52blv2fDXAfGDG2I0
	Nnc7L4YOoe/H+opVG8JpzYcZ95CeHdtzV27JFINoTP82DXb6upEMhdbdDqU4PsC0
	I2YBFga8RL5bwHHpaXI6HmHwjH3bKJ/6Tv2keKgxeHAd48B/qWGwwFLeEzzEdg/s
	YPsgSzLZ7sRiUIFX3xoJ0R/PMgxsV6k1DXAKEVNJ/FhtTX+ri1NSi9JR2wRmZZpB
	zTEnJA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ahp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91051512080so56098626d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390104; x=1789994904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=Wu85XxlaDJ8G6ORbifr31/I3e/A/vI0bxI9uKZwG1LQy512KcPh0FsLc22saGNOPcS
         Eq9Or5t7yY4R7gpvgQYmbMJyKHWRwPSGLYAeOwfUCp4H8Cr0tH3Pfy7onUn83eIR0O0g
         rnBCXheEpv2ZA7wYME+ieQhM5duj/FNHWfJ8Y0TKBZcMr7qUhBCT9090KoIcU4QaJP6n
         P3xbgCnqS3/MD3bHJj9fDrunSfWhm9FCyh4XgOAsHbhS/CB3Et8z5dujHT+PX6nDUw5G
         TlqauUrRvKRzFR3rbBq3q4kwyR6AfcdcDEBjOtkkZUtAH+TEPdlXNtbnzYV9YemxNPaf
         KRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390104; x=1789994904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=IW7uKFu8+W3MqJ6Lq/QFOradDhCxU0YITwZeed2XQ72ZSLebGT4hTBiwu+7mRtqHll
         lI+Gi6UDXznaVw5TKJj9ybAKdNsjXmgFAUM1vyNpxp88TTJzSGcPJumTxJTOvQU7jo9w
         MvyPOQtODvr0f94NlIqr0D5G0bQYVnwNJ2coHeT7dnF3P4iHf3rwqruUR2cHJrnJJPfH
         r3ybR2doNgAiyyPU50tBZnGl1DNVHm29gFLNREsFyAgMgeM69mzgMo5ERkH3MSVCf9qC
         iJi6S0mLQuFiZsFvRoCBcFwPHmOA+1WPl/fQhtqR6QPhAAC07iXbXXEANWhtLuQZWa72
         t69g==
X-Gm-Message-State: AFuF++loajP/JrlBP/tNZL54JCRy+QQXlpj/swyhIWEQTP0bPO70SmS5
	FbWaDiiFn7Bv6+itviYEI2FLqFDDy80v24QO8N9AdbqGjj/8wuGowJNs3Ui1HfoumaaJRMMwlNZ
	CVjJdF7wFNqyp3KArZtrxYBiTccDNbrV0WN14SHq2VSuxqm5lstmeXGOmhua4JIJvi0Z0
X-Gm-Gg: AYBFou3xp6emJD3TKoBOg0u5XaSRsi/5tmhUK2TiY10EKi65/HhhOJF+LneaaUZtezI
	3lCoSmlx4Cbj5nCnBdzbThv+HFKe271xtL6nIGhIludeolHZUTvs4hh7yRM+8dEy4X1sLX6d5zH
	N+rQr+GxKkny24s87chw9Tre3fVQ7MgLJ50gA9B/n3xDNqKnop9v8F3FY0lsomiC8Cu+sn2xsD6
	FSw+Lr2JhGbcE39Mtny6134kaZmqmGYTm6dx4B6jl5dKY42nh3gPmHUQDNZqv6Wyszg2K4kR5DE
	5TxoGpDGX/U6UrqE/fyMeHXbKskWWuqf55xZZkLvw2b3DHB7bJ/kVcy3TEthXq4Wh/VPZN9QCQs
	9P0rIEwI7
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338259785a.20.1789390103590;
        Mon, 14 Sep 2026 05:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338252385a.20.1789390102937;
        Mon, 14 Sep 2026 05:48:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:07 +0300
Subject: [PATCH v4 08/52] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-8-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zTMciOruaNVKn91mmwF2+OZNrU2wwXHwBzq
 Qq//0VH5DaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0wAKCRAbX0TJAJUV
 VnXMD/9pmlZONNfKsS2PAQuuQEMp7vz0n1m0joBCnZksElJElfjl9JyQxWZzQUjO8FXI05RtIwc
 bRpN0dxXjIPPsx3/8IAfVC1dJTr6vxHF32gV7qqGQ1n2urwJoSw5lOQunTfByNhhVlE0RrjgZfL
 BCsAk2fV8oxdbBc0thj2fuCrpxFg2zSXHNcWvquR8qLAh+WBwd6DbzyxdqyW4MqIB7zUOmj0vYn
 qOdrZK4r2Z4DVyi4TpXktQz/ijKnS3EgFSXcZUBCnpYekSb3n7ck9F5XLwO7GjxZapRY56T82XE
 TB0JE8m1nLER3B+a5h6PDbQC1UY0Q5eCLZU3SU5KJrduzWHHTuV3yPYJsE//mWZlf3vONWn62OR
 +vmzH+//Z3plBeKqMorlXQ25MqnBfMjeQp1lKyX8nSK6zhnkkj/MhfQU/EQf/SttZWr+xN68/Gf
 lKKfweLJHKffzbCH3vOrHcJFAOghvANHMj7KuxE6wqauHFwg3xoW/k5ZZsPOxhjIhaq/lH0tSPB
 44O0R1hZajtqIJnjZJUL5PUc8ak0ntXDiZRK4Bjeuu0QH7e/Ddh6GBhlkJZEEuiuKvIdHx5LL6p
 MqEE7vvM+Y59DTZmSHARjLRx0pv/JCk+cl2qk1l+DPcP6hwLCEQEYFFGvPOhNttmWNAy+c4BCOk
 5U6xkISQIGfUxNw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXxYVTUhI+Walv
 mqAox2CvBBuwQV3+sPF9x1vgsS/iBwJnuXr1e7Gosch//arMu3Nf8WO8qlIi6p7q4BEIl48Ezpt
 9JVkCe0CK89zX34J929VGklbqrrGS1w=
X-Proofpoint-GUID: sSVxZzbEA376i0jb57E0haU0YyfzmpPw
X-Proofpoint-ORIG-GUID: sSVxZzbEA376i0jb57E0haU0YyfzmpPw
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed1a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXynieY2/DTr0s
 S/9vmQF0ta2X0b3vocqczayNoqU/BdU7vmE/xRMxVotuWp7ytH4Yy4zHelcAPY9yc/PEXfstefn
 AEKzwFkIYPWKE+v4ohRIc4NoJMWaQSYE+beK04dF1vbREfYF4imozD8jPwdWY8yasAWfP32aSQc
 zgJIF9YwZSLNvssGpIAbTRHqZq3Ny6kCo4c7p/rhzmhUeoybEKtFYBwlwwn/HyO16lIjcn47T7H
 WH2Q8c1V2PGIo9NyiAeSNpZ53+cfXFHu2nkPvzbhiUb3iKVk4Ta51cOI20kjeQpN4de+R8wpLbZ
 vy0ADdpiSreFs7g6/wPfBhqicrckMsf2YPU+1fvfOQ4q/JC1kn45bAWgEJpZ2eo5g9tB4f3xrw+
 ARdQXYJRnMYVJ2qSjKAAn4d3tGKDoY8z8LNQz4FYf65fQOPh+yKXHF5tvEGjPAs5zXzg7J+WUg0
 zRsENEwWVPOmfAdHS0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..543105b277d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

