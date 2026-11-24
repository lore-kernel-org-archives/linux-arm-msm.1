Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517705;
	b=0vA84S+cDsdnWfC9q8XCScmub7Tcq2MN6QnE0M9tXkbYSVjxDmKCpw/Iv9KaDK345zsA
	 7mu4A8etQBotKlGVOw9PuK9bECWj9/u35AMioz5XtP+/kftrvHWxlV8mv0NkNAH7Bd/NM
	 UokV1RnBkpEn9PF+1eKGwdI40alZ84anp2T7GmO++oCTkSthbTYhKL802hAilJSUKOdzV
	 KinZSDtOcmGxneB+nRxkU+Gkp91DG8Zy3L4eRQvxtwp73MGObxdA4HOYY0lY6p+RMOUZD
	 6j1e/lzEhz6eGVHEQvOsyCQs83trrEll93et0nVi95awCtrP71G+vfVWeWXCCaowV/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
	b=eDGTRSVnm1/u/0VsaICwbPCnq2vsh2URXnpqUQF8UK4i2VA4MJAyLumIPDOYhVMnalH0
	 FTu7+EseRXSpAn3VSIsskusyhy6ZIZYRY53wG73xaiKKVOIWZL3Q8vp07LDvBUph8HgDg
	 b9L569G/VGIDUPtOGwUpoLP8dW3OfQIBd4kHfPw0DOflH9VCZmZCwfKQOwRM2kCIB0y+b
	 R3QKIpH4r+jSeoGKeLYslZ1GLFIcSAF/2Fe5W8AxoBGXmnRQDWQ2iEi5L3nK91jsG5os0
	 2JkafmqgKlBO7twYIPdarL9SlziScXPY7PUMWWM1CjvAoDasGvPpe+mAwQ1x43xlWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8vdGkJ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJk5xvgm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F5B606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8vdGkJ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJk5xvgm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8U29g017000
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I
	34GIYjK4=; b=H8vdGkJ7/EnJqDyJmlgndRh8DOjvqf8vnYHL4F2yOij9h8gZy3I
	zK05lpvdUSW5FiAcrMUSfPLFr5WMx2nHd855+jD8EHvqqgMqJVR3AdFJYW3QKRVK
	9ryXzKivtnzfsdDEOUFCHwH7iwQjcD9GupcbD6lHeaKqrF9se/04f/z9JIShFOX4
	Qa4G1bNaYMxvG0KciAH6TX6tIHUGwgSA9sKM6iFSnVkIgfLOJYyK8ocQKY7OuqBR
	DndEzv1YksStRaesKNxSnMCmwAKcAaJAjTt/8Ttw42SkEXf1KRhxHJ5S34jhUXBs
	ivbwl3uPF8hXfcnYO3dwkBBT9xpOhSbiYjA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nuecx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so3874965eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517703; x=1796122503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
        b=PJk5xvgmbPtIKieEDDdwgpqvw9UJgWfxqE/H8/T4c55TSCPXl6CxImQbfazRW5oTQh
         jMX9f0IwYITGJi5Hy/V4YUQPZmRLB7BjsWagL7FyyyS/q9jFScKvk1m8kavqKdEBK57J
         tXpYQk+8yJ9EmTRRsnO/AKBwPnowtt0b7QT5JB0BV/yBEXZCj5G3DZlYD3/zFUe+HwLy
         lkBgHaqdQ+Pg4r6iAeiefYafiipFLE6fvHZFIZVD9YNAwLQp5vNW5mKJmJi9yTDl1TU8
         S74cBZ9Pz/9gdWEKa6y7LtHj5F95bBabBNeI9AcxAfJG0DC11AQn3cWJ/lOCC/aehd8A
         0/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517703; x=1796122503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
        b=LLhkZSYsL7gUMuNhpvkAirNDo2nqMW+SEYcreyZ7eVsWf0JElyGPxVWgQP9dHHxlBQ
         OX+rm4UVH4ekUefGcLYkC86KwPns7S61EKo4NEy8A/NzSFK7Dw5VWyETnSFgr65iTK7U
         D+oRcoXiQRQswGc6QWdXfcA+EMxGHGYnHaVF1c3mWGxq+xVzJSzVAn5xltXTRjNVP3vc
         MwQ3rw28KC8QVpi6LvVOEaSMMtYUWz3bEmla7xMHW2s2R9D/BCpFo2gM2Ty8qWuamW1Q
         sWgZ5oEHiWPq2bC877iRrKRoJcCAfqVOz7See7XVmc8xImEpk4vDPPmJKMQytMdL/akm
         cdvQ==
X-Gm-Message-State: APuU4Z+k5V8hZTaTIUCYlJpWHvqHD/xUifyYZIp14jQnTO2Okqe5RWxN
	yUQzLxKNB5OKEcjQAsPD7deJSZHoGqYx3P7MGRm1kisEfn1lqAEKkYqWIaZtJcJ3sBC6CeGmXYw
	grKVQvZkUDVvLvViDNFsOwT8nMroQQ7coMHYuC6z2SKpDBIruUMvOWii6GDO7HGCbfrDT
X-Gm-Gg: AZFdTZey86LpzJabJRquZP32zHAHWyiaoxdN79HjTHhsn9DTVrM4k1Bhr2kT21p3hrQ
	2tmbBqxG9KjLDN9g2VzjymseU1oa78uw6PwJ3OAKmuV0L3oFro1v0MxjMWqZ8DFI+RtVyp21SUe
	BKq6CLoZ8bcsYV5q8pDUFZvXjovXCcu0PyEzyz3bRiTWk46SnVSU5fUE3IXP2sL6U83e0i+nUKk
	S10vcnLAsKi9YEMC7Qqk7hNzxpt3/foJ4ijPlJ391Y2SJPtP8sSWBds4EbEaHwde8UsCHgzPRTc
	SWVGuMj9xmE7xeBIxp1CfGlQ6W5DgYj3Jl2AfBV59+Y1575fTSi0ojS3yQf5uBDUbHEfQlAlpDc
	mN87q//ThA2Jekoov1mpn3mC0AjhsEpVomWvjnK24Eu2QbeAR0qw8QQNOwgIt6PEid3ooXL+CXI
	1btnqrLDBdj5TZxXLqaPoHGNWxe8nWOPCgufNtF7DrZ9EQMN42HioNKwMQ
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr5942096eec.22.1795517702482;
        Tue, 24 Nov 2026 02:55:02 -0800 (PST)
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr5942085eec.22.1795517702088;
        Tue, 24 Nov 2026 02:55:02 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm2282257eec.17.2026.11.24.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:01 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Add compatible for Seca SoC
Date: Tue, 24 Nov 2026 16:24:56 +0530
Message-ID: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8BpixQYiXhiQ
 ztftRGwU+Wag35c0DIwQrLwicB76fiu9Nnlx9+aopvfMDk2XYtAJjVpk7wZ9QXN0IGV+W49FZiK
 5jStST6HFKRF/PeRt0wb0kAgKL0bPKMHd02SP9f10Bu+qw4q+yZZ4/+IwxvWid2LdisSUSpjCWu
 NTNM7d8TJZktniiEKhxFnFv4YWq8dx6aUlgsCMaH4128/qrq1PSymZCsF1oS/1aINlqIx8XKH6A
 PWKfLMyyU1BATKKrUxc7UEk9gk0Al1RMQjupVDpKvbQ2dgsBjK60zMoedJ96a7ODS1AAhnoI7Iz
 c6s5ewMxMfFtzwMqc2rQorHO5oPwXxTvgRNUKO35xoYGJilIAOoGlTFCOgEorO5o3oRl2m0h8tL
 IUDP6ixymCVz9dwBf0br2/Vu9/tOjgKkZwkA9ckAr6tZ9OSWUhlMYlsm1rKQbEuVu07yMbx7bt1
 49JUmwjvzNX28Bg5R8g==
X-Proofpoint-GUID: 8Y1BbNUD-t-bl0L-fSnx7rUeQvWoSM-N
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056d07 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 8Y1BbNUD-t-bl0L-fSnx7rUeQvWoSM-N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0OlUCGnB0fsA
 X7bWMz7iS5p8jxyaJ3qhWZ0YJb0MbSNzJ/y2yLxn27d+M270yi0IK5Ga3QUuATnTXl2Y8iXOLuE
 Qe9pTFhUUfr/fXBUhA+RCwq98Vhp6P4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI I2C controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

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
 .../devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
index 04caf622b3ba..63895fdb51e2 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-i2c
           - const: qcom,sa8255p-geni-i2c
+      - items:
+          - const: qcom,secaau-geni-i2c
+          - const: qcom,sa8255p-geni-i2c
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

