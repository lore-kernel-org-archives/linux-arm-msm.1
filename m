Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819638;
	b=ogC2OOcKunGW279OB/9icvzSjo+vomHfeexsICAuYXOJ5SBiBcw0kpqfrZL93czUFwLt
	 jxM5ofWy6MxFI8c5E2xL/XrKzEx5XVQ5RXJdNtgbfudNdj05Cs+FYkDX7vQtY7rlJwXH1
	 81P/u87zcG4FtGp72PdUY8zlwYfgAjT1IX2saGI7cr19QT7UXWKV7NQM+PI0SCA+EHLZ9
	 NeqiS9xmdgckk6wdiCa38Nj7O9VNbR5g7veu9XzGAH6BnUBMS+M52/iXgY7b4OQKpcTwW
	 HZdTRuPeG0mVyM3kgCkj0nn25FehbAWzZ8vgBBS4lj5hNdoduAShczXiJ4KXHxE7Tzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RWdJlEcKsPAMkOmrDVhbnZVy8AXIiOlUFc4fBujke7s=;
	b=qoH0utWetVwOTBSaKVePK/3WN4X1O2ERlqo/1Z0EQDgcLx8FertRIKYGklHcXucjXe4/
	 TWq6XbtBlr4co478n/dl3GQ5Rz2pCH4S1wWDRvfCGFYFDqoEDjCFpG84iHj03QwUgaJCD
	 V/RZIJ5D4rvjT3qDRmxTUWc0kd+NtKDLEkZSksahsZmueKnviz0zuSj9blW82kvITyH4Q
	 CcQmRCNSydEqpu+uZJEqNnzN7eiXnoTtr2XjxZbEBKSHG66Ut6H6TjNqi0Q6CEiT2sIn1
	 Fy0Rwq19GxzEyiwGQYTiUGpf6evCYNEbtQHmExavCF0Mn7apQiemYIMurqmZODzRfwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Soeroo2d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7X7vPm+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991B606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2991B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Soeroo2d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7X7vPm+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f6x4967052
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RWdJlEcKsPAMkOmrDVhbnZ
	Vy8AXIiOlUFc4fBujke7s=; b=Soeroo2dJUYCRKb5np7xU0OqrbtO7ZvUYx9JcR
	DTshPJDHhnMep3TyimQ95pGmJDacsbdhuB1tN5MIt2lX10cuBL/QfsrdhLe1bn7l
	JDddLq8+FvozGqXikwFuFzOnqVSdy1iAocdRMmLSJ4B/TS2fJ1ylVuJf47BGqs72
	94Ov+YUW/jm4kdoCYIZKpw85rkms4gtkiho/5gxnmig59e4NbN/BOA0sNAlTtZS1
	ASFTCIiPurvK2kI+R5h9IjyYdv+IxaVtpwPp28hZn/EX6F9nU8hBqyXQaJaIBkTZ
	aGCObvCMHMODxoXt4PXrz1YfGgKdpBzyAzFGKRCZYMXH3VIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk25pfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b19aa066afso3199653a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 01:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819635; x=1795424435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RWdJlEcKsPAMkOmrDVhbnZVy8AXIiOlUFc4fBujke7s=;
        b=M7X7vPm+IIocLi2AtMlTPtSe+F3j2YQRCxbe3GQ9xpA9nLpISp/7G1CXjNQ6cSp1BP
         8hCYc/PJV4UpKA+J18xw8zqUMpnEQmTyfMdfyVXQgSW3GeLnapWIqwm1Fc3SIeJILDwW
         uRJP4gS5ryTY+HfnM3oCZaVSQkAgikEsYjyfW12xiNjplAezG4S+k87QkTOOBmNqHtPH
         Yzqd24BANfj1fWciGGXZoG2XoljPmRoMXX0FHNn/iFNyX48ogsy4YWxiXqzCnFocTC6q
         XzuSoPub7jcVruTdRah/4KZ+MaaJNA2u40O1RElae5V941iN40s0PXhiEKvcX4Diga6k
         2eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819635; x=1795424435;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RWdJlEcKsPAMkOmrDVhbnZVy8AXIiOlUFc4fBujke7s=;
        b=x6BLry0thRN4auwaP3tLlmJtiUmKqnLG19Rb8Xb0KLAfLggqLBqEfbMh3+s65auC6A
         XqSu7BNFu5HhnPaHq3KC4KkWzO6YdTJzznHgsEZeTpDp2OS8Ly+7J/QAjZhP+2OMUh0/
         G0GKv1PmOXfphs7p/GJJER4K5KkBGa2S37qNabt9kWuTb1irdfosLDN1mXRmhlwQXikf
         Ctx8agCF8bUSxqIh2NZTr3m+/rVMX9s59WiKTKMDepx3a93Ynj4O3mHzoLnRjfJpOtvA
         HP1mZYQ+Zxp9vsBUp2IvrOynllhcDKgtXs+pRErORJlbr4fC4y2ET0szMEXuo8VZlyap
         ok3Q==
X-Forwarded-Encrypted: i=1; AL+hErEe22JFAywQZh6K1e7dyh6h66hWYa+FhuviHWy9uzB1BsrbsgOjo6iydaAtbp0zzVvy2WUc5NEIPTi/UDbv@vger.kernel.org
X-Gm-Message-State: APuU4Z+YMVDGejti6UcKjdImE2Wcc6g2LVNpe/u9rooRlmHZtRHoDK/P
	vifOZlkJfC6C2Smun2eipbPgbZ5gM6HWHROwqYj1C/CgNAV6p/bQCzHWuigfhXEfSfmkdR3OBjZ
	Nw7kZUXg2IZCUH/BDYk7sESDYB1qCyajZVomX1VI18AYjq1XGZR01i0fZIa0SHfpM/dwM
X-Gm-Gg: AZFdTZeCccR2uD0ZhJcD8dbsDqpEGIhm27AjutWVaa83xIYoJQOv8iazUvXTD9E87Sb
	u3Hk4cbio9fs69eIkcD9O7qraoS0MaJ3E69jHAMlDc0tG1Xs+Fi1fKwssFZbTzubQUZSpTITPYH
	oxG5hDeW4pG+SZiiQnOVCaysihj0eraqXAZxGGPtHkJwDDbRQnr+2//wQQ65LAe6YlQ4z38D71a
	pgW3l7pFaDsSjZsTLV+ojUetMtP9otryKQh/1qVC2yTbSJDBMCKd/Fafr5NW8/wHNx/Fvckjked
	CMvuUXZJE9tKhc3kW81IMX9wdpy3SI3GdhTHCKxwjKIvJrM15P7VIlUZPzI5xkbI5wbTNNKepMQ
	ISytcWTA3n0KC0Pe+S6KQHwgLHSd11uAzTCelInYbe2VvFgG1ri4cw4qWkUWxSb41smd2Q8VBEy
	M57op3eWw=
X-Received: by 2002:a17:90a:fc4f:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3b1b0b5c008mr6055395a91.9.1794819634862;
        Mon, 16 Nov 2026 01:00:34 -0800 (PST)
X-Received: by 2002:a17:90a:fc4f:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3b1b0b5c008mr6055368a91.9.1794819634318;
        Mon, 16 Nov 2026 01:00:34 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:33 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Shikra: Fix qce configuration
Date: Mon, 16 Nov 2026 14:29:44 +0530
Message-Id: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAADG+moC/3WNzQ6CMBCEX8X0bElbfvXkexhDyrJIVai00GgI7
 26LBw9qstlkZme/mYlFo9CS/WYmBp2ySvdexNsNgVb2Z6Sq9poIJjLOWEZtq65GlgNg2agHFTm
 r8jhN8p2siX+6G/T2Cjye3tpO1QVhDJSQaJUdtXmujY6H3F+445TRQkKa1AXHukoO2tpomOQNd
 NdFfpHQ4cSHwrn4oghPEYD+BOCn+UFZluUFcYxjmQsBAAA=
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: eMip1xetnST3s_46wBeGfKgTyid6hvDA
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afac634 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=2l3kZstW3bczaa83jWEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX/WJZXrCy3AMN
 l9vqdaKormCRyPQEv1ndYyLpkjqX54ntA5DuKFThCZZuB/A2j+8YJ/R1jw9PBevUcfNy/uLnzJ4
 38P//eFQwebBzCmPTqTip4IaWm+Fdy9qVmlVDiiUqwp94fXiSMVflNwZmPgdVZvxb27u43jdahr
 18Dz/QUV6Nc6q5/rismFEePj2t5vt+z1IwLbB1gAVFFN4ZfRwNMmT2IgexZSBGLbuIgo9WrPc/C
 CfI4JfkYIlBcw3XSMm6znzpeLhbH6QNS+9RyoBMa3hEi2/UPuYzmOtOxnwuNZP8bzxsTcrm456l
 bykYZvmvMr3qrQnCEg6jxtB4nzX8Ad+InBdem4i4iy71faRi70bKLM1szSBrULhbnXDGbYIJB/C
 0hv74Czr5GvVz8EnyoJT8VcIAwhQucooChTeafIM7egDo9+AFtNmDUrtLF7u51f9m4wtZh6XxK1
 PeCpio7ona+y/Ch54nQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfXw8yXEVND5SL4
 Scp/Xe0pjUF2YPFYUrQokmAZ31qysjymf0Gl0Rz23xwTUQxZaOMSeGBadk3UVZ0fhKtY4zjvJti
 LCPL0qykm6QnFsImHDjQ4J48INBsn60=
X-Proofpoint-GUID: eMip1xetnST3s_46wBeGfKgTyid6hvDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035

Herbert/Bjorn,
This patch series fixes QCE on Shikra and targetted for v7.4.
Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
backward compatibility.
This series updates shikra fallback compatible and hence, both patches
should go from same tree to pass make dtbs_check otherwise patches from
individual tree will break dtbs_check checker. If dtbs_checker is not
blocker, then patches can go from individual tree.

Bjorn, will you be able to pick both?

The patch series fix description as follows:
Shikra require explicit clock which is omitted with current binding
description.
Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v3:
- Collect Krzysztof R-b on patch 1/2.
- Update patch 2/2 commit message.
- Specify merge dependency in cover letter.
- Link to v2: https://patch.msgid.link/20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com

Changes in v2:
- Update commit message on Konrad and Krzysztof comments.
- Link to v1: https://patch.msgid.link/20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Kuldeep Singh (2):
      dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

