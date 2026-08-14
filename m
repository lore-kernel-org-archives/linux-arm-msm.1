Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799141D102
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692853; cv=none; b=NCTiYZgBJlyDtaiX2BxIo5mj+lSeNCmgxmPbwKUHgEs5Zok68UAvA6jVsTKgtnggv7lJXBAUgg+TxEEdEYcbUummyr0lItHjZdo1DyYhD5Sb++r5GpquTPR0A6ZUwIyO/kNCOhG8I6aU1DJG1LTDWET34hF45x/r2UFrRci7fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692853; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyfFjQSNFrcHJlexTuHqAFS+Z6NQQjv4Ck8XCAvWjzn0QijiYPcmmE3W8wgSBX0mIiJ742yuIX5yQRHE5CNWEMNhE2YGcmd0SvfnfrUbRYKk81NXV8fs9PrebjQbNr05zxg5HCfJBhVU7IHkbAAS4Ab2lTA++mK2JR+2r4yTbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT6t0dk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sj+APCvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT6t0dk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sj+APCvQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QVi0669241
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=AT6t0dk0VwlEmCfy
	auBXcp+9FRKb+DNMMZILEbh4tMM9yL91QHjbuoAYRaosD01u0lRA0PYSAJURbBr6
	09FD41Efcoh7+V7vM8DP7j8hWB0FQmmTUEydPIlk8c+YUvwoyUTaRtOSaf/3XbQT
	iVKRieSf7xWVikTnyVyDgBLhNG/ttLjc6S585jsn09P4cxchS9XlDgaMCidxn6XJ
	ZmLW83Co3mfGIzr87vKJ6Zwl7btTXca+MVWUOGvnbbGswM89D9Mqiy959rzIRlEA
	/s7a6T9MgGfI4q7q/1NOMlSDuKrfq8WpdKbYKQ1k6yU3bmMiFD0rkzzWqbt/ZvZQ
	JkDdWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uuacg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce14a21faso10138955ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692831; x=1787297631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=Sj+APCvQ55Vuhly9iEexVOg9j5NiooMgBz/w6oXYGSpHiETEQB52svEMzsVYR4WU+R
         uO0nPmU/bIJyf3WcHcPzMjgZ38nQd6IFf9egAV1rW6QMEfi630a8F2s9zhaZKojupv9x
         juJlakHUvdTObIvD/ubRMVL3ZAkOH3JASj3Iw59C8tsk7X52NNhur8O3GGV2Gcjtvr/f
         lOhZDKDQjIUdWI3kHAIDtLdrXuuORatULJTmIDrtHJjcXrYx9Hu9xJ1SEcDLQ0oTpsS+
         ovJbIUfbAmiUEfzlPbx2MRBCr49oD0JBjXEPjB22tVJOprh0vPtPfrXPuKN3iGmF2/Yp
         KIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692831; x=1787297631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=U6NAjiTj/3AoRxOZvP4StxtNCfaLBhXbBoWRoj5RNnTB1p1ZlHvxRijVjP2Oj5Ub7x
         WTUaqNaz/YhO+WTN3RBjC3WT6GKcMswav3gaxKP4XAW0qHjnXQkLbZJOy5etwZCmAb41
         r+cK76Ua/9YjD5IBvag3VmNoZ0tHfdaoZIhunFBvej9cjkGzY9WHAOOfiybLZs/mgqaZ
         9iEUQGqDlOs/erzyeUaic7N8oA/nm960VwhEiHL+LFz+3v92ppSnVUHacyNTIqDHlf8S
         4xIfqmfKFyotLMR2S4QJvCjl82Z6VUj0jRLMu5NnOt8W0D5MV1rKARAnPY/NyL08HDv/
         egcg==
X-Gm-Message-State: AOJu0YzUwA7HRJct1tj9pHLmujXfZlkvNxQ67GR+m/n67jjboLMRxPUj
	RWd/u1Qg74DC+TOZMAVnSsEx3tNAdXhnvkYVfxYngq5U6qXwKePbT2Xbs5JATr8TK1Iq9fVXilR
	WBTcbZlOQdO34gaBHVAVU2LVPthtOnDYts4U17STgjj22ewv+33MG4tOU645sYk2Op2zu
X-Gm-Gg: AR+sD11ZvsRk870Yhc/kHckyeUobrZ0H6zt+l+CL8NOfphAsmLOMSfOLvgueJthU4JS
	zp5D5L/fzmHj5ZI857Y074iYZwqyqiwUL5yvsGDf28ztYXD7dwEd8Ojvn1yHxE9zpM4rCVbAcwW
	Q5bmmJC1KwhD+F/O0C993LCy0eFUZuNkUYcU0eGWAyVwH/whj43txup4rDZBDD048yDff9LNx6z
	hVdnUzLV042KbHNGhevd5CGonoNqFrZ/KVz0HHr76wzjGOSUOVJMeE6PDLLU0wr1rz+auYEuLVL
	vA7aosS6Gr+PnaC+idB0q0PHfHwFVmqBkqUAjDfQmyS1mTWQlmB+gsEVLZStgoHigStR+i0xrhy
	AsHe5ZJnmRgEmO7D0kbnpN11zyU4eVsOyC1a2KInvmGd1o0z/uT4Yc+DGfTxJv6lzygM7qu8CAJ
	mo4C1QzoXFBn09HHk7rYYescw=
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128280185ad.15.1786692830906;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128279735ad.15.1786692830500;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:44 +0530
Subject: [PATCH v2 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-13-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=LjytsBkPoYsdC9vRseuwegbAfCjR98WF6lyMXA6E4gV+//wSFMjNp4wjfU3xOcIuFr6RfUusP
 hR+zxeIFBwZCJ+4W+anZV058xUGhsJzxj02HcyfbAGnEYjizcYHTv/p
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: S0tze5BWHsRDbv6pYNTL7aGtc-GVEbBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX4ArVoVm8Y6Wx
 q90xw/w8iDO42Gsch3pubQhdSoaDWYqhlGTuGj+aIwhu5PScPM5ebKXHaB6UbWCbe6ES/0VyMdZ
 B8H0kZbGFORlBWzzCSCY0E51D4MZefww6h4grvpSniTvv0I+n+tDusoHi7RMvzO7QYSwobEoZ+/
 9DH7QHioGWhoj4VNprVOtXSkUmJ4y7q29CLrvHUnk+rvbpwUWtH/j8u+Vr1QPlMNPnkrtr9DrRE
 w78WJV4LGAEca7gJEK4lVoAs3dYVJc5jZY9H1UC3LAKKODhAr4SLCgy6H3eLRKJ1uHXm2Kj/Q36
 tYemRI8kGcEGJOYjKuOLJT7QO326LrRrbhkO1XY3lznPjEZN1QYORvqgwPHEmbpEvkmrZM1uNEw
 /pi5Wl8BuJ0zGRCsWyMSnCTvzIynRUuONYWlQg93F0aJpSYPlJ/TiHTlIeuKKslLrrjikEQiXZT
 UHyrLMy6sakyOGlZwdQ==
X-Proofpoint-ORIG-GUID: S0tze5BWHsRDbv6pYNTL7aGtc-GVEbBt
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec4df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX4YSX/voyWvIa
 xySHxeSxETRVCXw/boB1Zv/A348nX270B+/CHwLLhukClOitH3sRlM7NtyivYRTSZHQCMuVbXcp
 dkO1znzpgVtuka299yCmJhWBFXm69+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

